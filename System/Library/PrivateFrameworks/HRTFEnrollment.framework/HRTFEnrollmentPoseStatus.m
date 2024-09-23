@implementation HRTFEnrollmentPoseStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HRTFEnrollmentPoseStatus)initWithYawPose:(id)a3 pitchPose:(id)a4 isEarTracking:(unsigned __int8)a5 yawAngle:(double)a6 pitchAngle:(double)a7
{
  id v12;
  id v13;
  HRTFEnrollmentPoseStatus *v14;
  NSArray *v15;
  void *v16;
  void *v17;
  HRTFEnrollmentPoseStatus *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  HRTFEnrollmentCaptureAngle *v24;
  double v25;
  double v26;
  void *v27;
  HRTFEnrollmentCaptureAngle *v28;
  NSArray *yawAngles;
  NSArray *v30;
  CGSize v31;
  id v32;
  NSArray *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  HRTFEnrollmentCaptureAngle *v42;
  double v43;
  double v44;
  void *v45;
  HRTFEnrollmentCaptureAngle *v46;
  NSArray *pitchAngles;
  HRTFEnrollmentPoseStatus *v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v59.receiver = self;
  v59.super_class = (Class)HRTFEnrollmentPoseStatus;
  v14 = -[HRTFEnrollmentPoseStatus init](&v59, sel_init);
  if (v14)
  {
    v49 = v14;
    v15 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v12, "count"));
    objc_msgSend(v12, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingSelector:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v14;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v17;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v56 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          v24 = [HRTFEnrollmentCaptureAngle alloc];
          objc_msgSend(v23, "doubleValue");
          v26 = v25;
          objc_msgSend(v12, "objectForKeyedSubscript:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[HRTFEnrollmentCaptureAngle initWithAngle:captured:](v24, "initWithAngle:captured:", objc_msgSend(v27, "BOOLValue"), v26);

          -[NSArray addObject:](v15, "addObject:", v28);
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v20);
    }

    yawAngles = v18->_yawAngles;
    v18->_yawAngles = v15;
    v30 = v15;

    v31 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    v18->_faceBoundingBox.origin = (CGPoint)*MEMORY[0x24BDBF090];
    v18->_faceBoundingBox.size = v31;
    v32 = objc_alloc(MEMORY[0x24BDBCEB8]);

    v33 = (NSArray *)objc_msgSend(v32, "initWithCapacity:", objc_msgSend(v13, "count"));
    objc_msgSend(v13, "allKeys");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sortedArrayUsingSelector:", sel_compare_);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v36 = v35;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v52 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          v42 = [HRTFEnrollmentCaptureAngle alloc];
          objc_msgSend(v41, "doubleValue");
          v44 = v43;
          objc_msgSend(v13, "objectForKeyedSubscript:", v41);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = -[HRTFEnrollmentCaptureAngle initWithAngle:captured:](v42, "initWithAngle:captured:", objc_msgSend(v45, "BOOLValue"), v44);

          -[NSArray addObject:](v33, "addObject:", v46);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v38);
    }

    v14 = v49;
    pitchAngles = v49->_pitchAngles;
    v49->_pitchAngles = v33;

    v49->_currentYawAngle = a6;
    v49->_currentPitchAngle = a7;
    v49->_hasYawAngle = a5;
    v49->_hasPitchAngle = a5;

  }
  return v14;
}

- (HRTFEnrollmentPoseStatus)initWithCurrentYawPose:(id)a3 pitchPose:(id)a4 yawAngle:(double)a5 pitchAngle:(double)a6 faceBoundingBox:(CGRect)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  id v16;
  HRTFEnrollmentPoseStatus *v17;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v15 = a4;
  v16 = a3;
  v17 = -[HRTFEnrollmentPoseStatus initWithYawPose:pitchPose:isEarTracking:yawAngle:pitchAngle:]([HRTFEnrollmentPoseStatus alloc], "initWithYawPose:pitchPose:isEarTracking:yawAngle:pitchAngle:", v16, v15, 0, -100.0, -100.0);

  if (v17)
  {
    v17->_currentYawAngle = a5;
    v17->_currentPitchAngle = a6;
    *(_WORD *)&v17->_hasYawAngle = 257;
    v17->_faceBoundingBox.origin.x = x;
    v17->_faceBoundingBox.origin.y = y;
    v17->_faceBoundingBox.size.width = width;
    v17->_faceBoundingBox.size.height = height;
  }
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *yawAngles;
  id v5;

  yawAngles = self->_yawAngles;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", yawAngles, CFSTR("YawAngles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pitchAngles, CFSTR("PitchAngles"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("CurrentYaw"), self->_currentYawAngle);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("CurrentPitch"), self->_currentPitchAngle);
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasYawAngle != 0, CFSTR("HasYaw"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasPitchAngle != 0, CFSTR("HasPitch"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FaceBoundingBox.origin.x"), self->_faceBoundingBox.origin.x);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FaceBoundingBox.origin.y"), self->_faceBoundingBox.origin.y);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FaceBoundingBox.size.width"), self->_faceBoundingBox.size.width);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FaceBoundingBox.size.height"), self->_faceBoundingBox.size.height);

}

- (HRTFEnrollmentPoseStatus)initWithCoder:(id)a3
{
  id v4;
  HRTFEnrollmentPoseStatus *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *yawAngles;
  uint64_t v11;
  NSArray *pitchAngles;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  HRTFEnrollmentPoseStatus *v19;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("YawAngles"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("PitchAngles"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("CurrentYaw"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("CurrentPitch"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("HasYaw"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("HasPitch"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("FaceBoundingBox.origin.x"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("FaceBoundingBox.origin.y"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("FaceBoundingBox.size.width"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("FaceBoundingBox.size.height")))
  {
    v21.receiver = self;
    v21.super_class = (Class)HRTFEnrollmentPoseStatus;
    v5 = -[HRTFEnrollmentPoseStatus init](&v21, sel_init);
    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDBCF20];
      v22[0] = objc_opt_class();
      v22[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("YawAngles"));
      v9 = objc_claimAutoreleasedReturnValue();
      yawAngles = v5->_yawAngles;
      v5->_yawAngles = (NSArray *)v9;

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("PitchAngles"));
      v11 = objc_claimAutoreleasedReturnValue();
      pitchAngles = v5->_pitchAngles;
      v5->_pitchAngles = (NSArray *)v11;

      v5->_hasYawAngle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HasYaw"));
      v5->_hasPitchAngle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HasPitch"));
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("CurrentYaw"));
      v5->_currentYawAngle = v13;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("CurrentPitch"));
      v5->_currentPitchAngle = v14;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FaceBoundingBox.origin.x"));
      v5->_faceBoundingBox.origin.x = v15;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FaceBoundingBox.origin.y"));
      v5->_faceBoundingBox.origin.y = v16;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FaceBoundingBox.size.width"));
      v5->_faceBoundingBox.size.width = v17;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FaceBoundingBox.size.height"));
      v5->_faceBoundingBox.size.height = v18;

    }
    self = v5;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSArray)remainingYawAngles
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!-[NSArray count](self->_yawAngles, "count"))
    return (NSArray *)0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_yawAngles, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_yawAngles;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v9, "captured", (_QWORD)v14) & 1) == 0)
        {
          v10 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v9, "angle");
          objc_msgSend(v10, "numberWithDouble:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v12 = v3;
  else
    v12 = 0;

  return (NSArray *)v12;
}

- (NSArray)remainingPitchAngles
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!-[NSArray count](self->_pitchAngles, "count"))
    return (NSArray *)0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_pitchAngles, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_pitchAngles;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v9, "captured", (_QWORD)v14) & 1) == 0)
        {
          v10 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v9, "angle");
          objc_msgSend(v10, "numberWithDouble:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v12 = v3;
  else
    v12 = 0;

  return (NSArray *)v12;
}

- (NSArray)yawAngles
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)pitchAngles
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (double)currentYawAngle
{
  return self->_currentYawAngle;
}

- (unsigned)hasYawAngle
{
  return self->_hasYawAngle;
}

- (double)currentPitchAngle
{
  return self->_currentPitchAngle;
}

- (unsigned)hasPitchAngle
{
  return self->_hasPitchAngle;
}

- (CGRect)faceBoundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_faceBoundingBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pitchAngles, 0);
  objc_storeStrong((id *)&self->_yawAngles, 0);
}

@end
