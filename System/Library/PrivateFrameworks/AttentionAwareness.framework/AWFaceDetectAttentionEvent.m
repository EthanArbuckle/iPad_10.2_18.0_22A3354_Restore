@implementation AWFaceDetectAttentionEvent

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AWAttentionEvent timestamp](self, "timestamp");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_metadataValid, CFSTR("metadataValid"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("pitch"), self->_pitch);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("yaw"), self->_yaw);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("roll"), self->_roll);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_orientation, CFSTR("orientation"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("distance"), self->_distance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("faceState"), (double)self->_faceState);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AWAttentionEvent tagIndex](self, "tagIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("tagIndex"));

  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("metadataType"), (double)self->_metadataType);
  objc_msgSend(v5, "encodeObject:forKey:", self->_motionData, CFSTR("motionData"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("attentionScore"), self->_attentionScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("faceDetectionScore"), self->_faceDetectionScore);

}

- (AWFaceDetectAttentionEvent)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __objc2_class **p_superclass;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  NSObject *v24;
  double v25;
  double v26;
  NSObject *v27;
  AWFaceDetectAttentionEvent *v28;
  uint64_t v29;
  float v30;
  float v31;
  void *v32;
  int v33;
  unint64_t v35;
  double v36;
  unint64_t v37;
  double v38;
  objc_class *v39;
  void *v40;
  uint64_t v41;
  AWFaceDetectAttentionEvent *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[24];
  double v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  _OWORD v58[4];
  float v59;
  float v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  int buf;
  double v65;
  __int16 v66;
  const __CFString *v67;
  _QWORD v68[5];

  v68[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47 = 0;
  v5 = decodeDouble(v4, &v47, CFSTR("timestamp"));
  v46 = decodeUInt64(v4, &v47, CFSTR("metadataValid"));
  v6 = decodeDouble(v4, &v47, CFSTR("pitch"));
  v7 = decodeDouble(v4, &v47, CFSTR("yaw"));
  v8 = decodeDouble(v4, &v47, CFSTR("roll"));
  v45 = decodeUInt64(v4, &v47, CFSTR("orientation"));
  v9 = decodeDouble(v4, &v47, CFSTR("distance"));
  v44 = decodeUInt64(v4, &v47, CFSTR("faceState"));
  v43 = decodeUInt64(v4, &v47, CFSTR("metadataType"));
  v10 = decodeUInt64(v4, &v47, CFSTR("tagIndex"));
  v11 = v4;
  v12 = CFSTR("motionData");
  v13 = (void *)MEMORY[0x1E0C99E60];
  v68[0] = objc_opt_class();
  v68[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v15, CFSTR("motionData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  p_superclass = (__objc2_class **)(&OBJC_METACLASS___AWSampleLogger + 8);
  if (!v16)
  {
    if ((objc_msgSend(v11, "containsValueForKey:", CFSTR("motionData")) & 1) != 0)
    {
      v23 = 0;
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_15:
    if (*((int *)p_superclass + 168) >= 3)
    {
      _AALog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v35 = absTimeNS();
        if (v35 == -1)
          v36 = INFINITY;
        else
          v36 = (double)v35 / 1000000000.0;
        buf = 134218242;
        v65 = v36;
        v66 = 2112;
        v67 = CFSTR("motionData");
        _os_log_error_impl(&dword_1AF589000, v24, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", (uint8_t *)&buf, 0x16u);
      }

    }
    v23 = 0;
    v47 = 1;
    goto LABEL_19;
  }
  v41 = v10;
  v42 = self;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v49 != v21)
          objc_enumerationMutation(v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v10 = v41;
          self = v42;
          p_superclass = &OBJC_METACLASS___AWSampleLogger.superclass;
          goto LABEL_15;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v20)
        continue;
      break;
    }
  }

  v23 = v18;
  v10 = v41;
  self = v42;
  p_superclass = (__objc2_class **)(&OBJC_METACLASS___AWSampleLogger + 8);
LABEL_19:

  v25 = decodeDouble(v11, &v47, CFSTR("attentionScore"));
  v26 = decodeDouble(v11, &v47, CFSTR("faceDetectionScore"));
  if (v47)
  {
    if (*((int *)p_superclass + 168) >= 3)
    {
      _AALog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v37 = absTimeNS();
        if (v37 == -1)
          v38 = INFINITY;
        else
          v38 = (double)v37 / 1000000000.0;
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v52 = 134218242;
        *(double *)&v52[4] = v38;
        *(_WORD *)&v52[12] = 2112;
        *(_QWORD *)&v52[14] = v40;
        _os_log_error_impl(&dword_1AF589000, v27, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", v52, 0x16u);

      }
    }
    v28 = 0;
  }
  else
  {
    v29 = 0;
    *(_QWORD *)v52 = v46 != 0;
    *(double *)&v52[8] = v6;
    *(double *)&v52[16] = v7;
    v53 = v8;
    v54 = v45;
    v55 = v9;
    v56 = v44;
    v57 = v43;
    memset(v58, 0, sizeof(v58));
    v30 = v25;
    v31 = v26;
    v59 = v30;
    v60 = v31;
    v61 = 0u;
    v62 = 0u;
    v63 = 0;
    do
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      *((_DWORD *)v58 + v29) = v33;

      ++v29;
    }
    while (v29 != 16);
    v28 = -[AWFaceDetectAttentionEvent initWithTimestamp:tagIndex:faceMetadata:]([AWFaceDetectAttentionEvent alloc], "initWithTimestamp:tagIndex:faceMetadata:", v10, v52, v5);
  }

  return v28;
}

- (void)validateMask
{
  if (-[AWAttentionEvent eventMask](self, "eventMask") != 128)
    __assert_rtn("-[AWFaceDetectAttentionEvent validateMask]", "SimpleFrameworkTypes.m", 919, "self.eventMask == AWAttentionEventMaskFaceDetect");
}

- (AWFaceDetectAttentionEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 faceMetadata:(AWFaceDetectMetadata *)a5
{
  AWFaceDetectAttentionEvent *v6;
  AWFaceDetectAttentionEvent *v7;
  void *v8;
  double v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSArray *motionData;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AWFaceDetectAttentionEvent;
  v6 = -[AWAttentionEvent initWithTimestamp:tagIndex:eventMask:](&v15, sel_initWithTimestamp_tagIndex_eventMask_, a4, 128, a3);
  v7 = v6;
  if (a5 && v6)
  {
    v6->_metadataValid = a5->var0;
    v6->_pitch = a5->var1;
    v6->_yaw = a5->var2;
    v6->_roll = a5->var3;
    v6->_orientation = a5->var4;
    v6->_distance = a5->var5;
    v6->_faceState = a5->var6;
    v6->_metadataType = a5->var7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 16; ++i)
    {
      *(float *)&v9 = a5->var8[i];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

    }
    v12 = objc_msgSend(v8, "copy");

    motionData = v7->_motionData;
    v7->_motionData = (NSArray *)v12;

    v7->_attentionScore = a5->var9;
    v7->_faceDetectionScore = a5->var10;
  }
  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 metadataValid;
  double pitch;
  double yaw;
  double roll;
  void *v12;
  double distance;
  void *v14;
  unint64_t metadataType;
  __CFString *v16;
  NSArray *motionData;
  double attentionScore;
  double faceDetectionScore;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWAttentionEvent timestamp](self, "timestamp");
  v7 = v6;
  metadataValid = self->_metadataValid;
  pitch = self->_pitch;
  yaw = self->_yaw;
  roll = self->_roll;
  getFaceDetectOrientationDescription(self->_orientation);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  distance = self->_distance;
  getEyeReliefFaceStateDescription(self->_faceState);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  metadataType = self->_metadataType;
  if (metadataType >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown AWFaceDetectMetadataType %llu"), self->_metadataType);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E5F8E268[metadataType];
  }
  motionData = self->_motionData;
  attentionScore = self->_attentionScore;
  faceDetectionScore = self->_faceDetectionScore;
  v20 = -[AWAttentionEvent tagIndex](self, "tagIndex");
  -[AWAttentionEvent tag](self, "tag");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  tagDescription(v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (timestamp: %13.5f metadataValid %u pitch %13.5f yaw %13.5f roll %13.5f orientation %@ distance %13.5f faceState: %@ metadataType: %@ motionData: %@ attentionScore: %13.5f faceDetectionScore: %13.5f %@)"), v5, self, v7, metadataValid, *(_QWORD *)&pitch, *(_QWORD *)&yaw, *(_QWORD *)&roll, v12, *(_QWORD *)&distance, v14, v16, motionData, *(_QWORD *)&attentionScore, *(_QWORD *)&faceDetectionScore, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)isMetadataValid
{
  return self->_metadataValid;
}

- (double)pitch
{
  return self->_pitch;
}

- (double)yaw
{
  return self->_yaw;
}

- (double)roll
{
  return self->_roll;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (double)distance
{
  return self->_distance;
}

- (unint64_t)faceState
{
  return self->_faceState;
}

- (unint64_t)metadataType
{
  return self->_metadataType;
}

- (NSArray)motionData
{
  return self->_motionData;
}

- (float)attentionScore
{
  return self->_attentionScore;
}

- (float)faceDetectionScore
{
  return self->_faceDetectionScore;
}

- (unint64_t)personID
{
  return self->_personID;
}

- (CGRect)faceBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_faceBounds.origin.x;
  y = self->_faceBounds.origin.y;
  width = self->_faceBounds.size.width;
  height = self->_faceBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
