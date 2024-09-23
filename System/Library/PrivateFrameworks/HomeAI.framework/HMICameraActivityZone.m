@implementation HMICameraActivityZone

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMICameraActivityZone)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMICameraActivityZone *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("HMIAZ.p"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("HMIAZ.i"));

  v10 = -[HMICameraActivityZone initWithPoints:isInclusion:](self, "initWithPoints:isInclusion:", v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HMICameraActivityZone points](self, "points");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("HMIAZ.p"));

  objc_msgSend(v5, "encodeBool:forKey:", -[HMICameraActivityZone isInclusion](self, "isInclusion"), CFSTR("HMIAZ.i"));
}

- (BOOL)isEqual:(id)a3
{
  HMICameraActivityZone *v4;
  HMICameraActivityZone *v5;
  uint64_t v6;
  void *v7;
  char v8;
  BOOL v9;
  char v10;

  v4 = (HMICameraActivityZone *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMICameraActivityZone points](self, "points");
      v6 = objc_claimAutoreleasedReturnValue();
      -[HMICameraActivityZone points](v5, "points");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend((id)v6, "isEqualToArray:", v7);

      v9 = -[HMICameraActivityZone isInclusion](self, "isInclusion");
      LOBYTE(v6) = -[HMICameraActivityZone isInclusion](v5, "isInclusion");

      v10 = v8 & (v9 ^ v6 ^ 1);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMICameraActivityZone points](self, "points");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HMICameraActivityZone)initWithPoints:(id)a3 isInclusion:(BOOL)a4
{
  id v6;
  HMICameraActivityZone *v7;
  uint64_t v8;
  NSArray *points;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMICameraActivityZone;
  v7 = -[HMICameraActivityZone init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    points = v7->_points;
    v7->_points = (NSArray *)v8;

    v7->_inclusion = a4;
  }

  return v7;
}

- (HMICameraActivityZone)initWithPoints:(id)a3
{
  return -[HMICameraActivityZone initWithPoints:isInclusion:](self, "initWithPoints:isInclusion:", a3, 1);
}

- (unint64_t)activityZoneType
{
  void *v3;
  BOOL v4;

  -[HMICameraActivityZone points](self, "points");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 5)
  {
    v4 = -[HMICameraActivityZone isInclusion](self, "isInclusion");

    if (!v4)
      return 2;
  }
  else
  {

  }
  return -[HMICameraActivityZone isInclusion](self, "isInclusion") ^ 1;
}

- (BOOL)overlapsWithElipseInsideRect:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  CGFloat MidX;
  CGFloat MidY;
  uint64_t v10;
  CGPath *v11;
  void *v13;
  uint64_t v14;
  float v15;
  float v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  float v34;
  double v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v48;
  double v49;
  float v50;
  double v51;
  _BOOL4 v52;
  float v53;
  float v54;
  _BOOL4 v55;
  float v56;
  const CGPath *v57;
  void *v58;
  void *v59;
  BOOL v60;
  CGRect v61;
  double v62;
  float v63;
  float v64;
  double v65;
  double v66;
  float v67;
  CGPoint v68;
  CGPoint v69;
  CGRect v70;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v61.origin.x = x;
  v61.origin.y = y;
  v70.origin.x = x;
  v70.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  v70.size.width = width;
  v70.size.height = height;
  MidY = CGRectGetMidY(v70);
  -[HMICameraActivityZone points](self, "points");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = HMICreatePathFromPoints((void *)v10);

  v65 = MidY;
  v66 = MidX;
  v68.x = MidX;
  v68.y = MidY;
  LOBYTE(v10) = CGPathContainsPoint(v11, 0, v68, 0);
  CGPathRelease(v11);
  if ((v10 & 1) != 0)
    return 1;
  -[HMICameraActivityZone points](self, "points");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14 != 1)
  {
    v15 = width * 0.5;
    v16 = v61.size.height * 0.5;
    v67 = v15 * v15;
    v63 = v16 * v16;
    v62 = v16;
    for (i = 1; v14 != i; ++i)
    {
      -[HMICameraActivityZone points](self, "points");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", i - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "point");
      v21 = v20 - v66;
      -[HMICameraActivityZone points](self, "points");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", i - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "point");
      v25 = v24 - v65;

      -[HMICameraActivityZone points](self, "points");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", i);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "point");
      v29 = v28 - v66;
      -[HMICameraActivityZone points](self, "points");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", i);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "point");
      v33 = v32 - v65;

      if (vabdd_f64(v21, v29) >= 0.000001)
      {
        v39 = (v25 - v33) / (v21 - v29);
        v40 = v25 - v39 * v21;
        v41 = v63 + (float)(v67 * (float)(v39 * v39));
        v42 = (float)((float)(v67 + v67) * v39) * v40;
        v43 = (float)((float)(v41 * -4.0) * (float)(v67 * (float)((float)(v40 * v40) - v63))) + (float)(v42 * v42);
        if (v43 < 0.0)
          continue;
        v44 = (float)-v42;
        v45 = sqrt(v43);
        v46 = (float)(v41 + v41);
        v38 = (v45 + v44) / v46;
        v34 = (v44 - v45) / v46;
        v36 = v40 + (float)(v38 * v39);
        v64 = v40 + (float)(v34 * v39);
      }
      else
      {
        v34 = v21;
        if ((float)(v34 * v34) > v67)
          continue;
        v35 = (1.0 - sqrt((float)((float)(v34 * v34) / v67))) * v62;
        v36 = v35;
        v37 = -v35;
        v64 = v37;
        v38 = v21;
      }
      if (v21 >= v29)
        v47 = v29;
      else
        v47 = v21;
      v48 = v47;
      if (v21 >= v29)
        v49 = v21;
      else
        v49 = v29;
      v50 = v49;
      if (v25 >= v33)
        v51 = v33;
      else
        v51 = v25;
      if (v25 < v33)
        v25 = v33;
      v52 = HMILessThanOrEqualWithAccuracy(v38, v50, 0.001) && HMIGreaterThanOrEqualWithAccuracy(v38, v48, 0.001);
      v53 = v25;
      if (HMILessThanOrEqualWithAccuracy(v36, v53, 0.001))
      {
        v54 = v51;
        if ((v52 & HMIGreaterThanOrEqualWithAccuracy(v36, v54, 0.001) & 1) != 0)
          return 1;
      }
      v55 = HMILessThanOrEqualWithAccuracy(v34, v50, 0.001) && HMIGreaterThanOrEqualWithAccuracy(v34, v48, 0.001);
      if (HMILessThanOrEqualWithAccuracy(v64, v53, 0.001))
      {
        v56 = v51;
        if ((v55 & HMIGreaterThanOrEqualWithAccuracy(v64, v56, 0.001) & 1) != 0)
          return 1;
      }
    }
  }
  v57 = CGPathCreateWithRect(v61, 0);
  -[HMICameraActivityZone points](self, "points");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "point");
  v60 = CGPathContainsPoint(v57, 0, v69, 0);

  CGPathRelease(v57);
  return v60;
}

- (BOOL)overlapsWithElipseInsideRect:(CGRect)a3 withInsetPercentage:(float)a4
{
  return -[HMICameraActivityZone overlapsWithElipseInsideRect:](self, "overlapsWithElipseInsideRect:", HMICGRectScaleAroundCenter(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4));
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" isInclusion:%d "), -[HMICameraActivityZone isInclusion](self, "isInclusion"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMICameraActivityZone points](self, "points");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v9;
}

- (id)jsonReperesentaionOfDetectedObject:(id)a3 motionDetection:(id)a4 eventClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  float v13;
  _BOOL8 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  CFDictionaryRef DictionaryRepresentation;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  CFDictionaryRef v44;
  void *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  const __CFString *v51;
  id v52;
  _BYTE v53[128];
  _QWORD v54[4];
  _QWORD v55[6];
  CGPoint v56;
  CGRect v57;

  v55[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[HMICameraActivityZone activityZoneType](self, "activityZoneType"))
  {
    v13 = 0.21;
    LODWORD(v12) = 1045891645;
    v14 = -[HMICameraActivityZone containsEvent:withInsetPercentage:](self, "containsEvent:withInsetPercentage:", v8, v12);
  }
  else
  {
    objc_msgSend(v8, "boundingBox");
    v13 = 0.16;
    if (-[HMICameraActivityZone overlapsWithElipseInsideRect:withInsetPercentage:](self, "overlapsWithElipseInsideRect:withInsetPercentage:"))
    {
      objc_msgSend(v8, "boundingBox");
      v14 = -[HMICameraActivityZone checkIfObjectIsStaticWithBoundingBox:motionDetection:eventClass:](self, "checkIfObjectIsStaticWithBoundingBox:motionDetection:eventClass:", v9, objc_opt_class(), v15, v16, v17, v18) ^ 1;
    }
    else
    {
      v14 = 0;
    }
  }
  objc_msgSend(v8, "boundingBox");
  v23 = HMICGRectScaleAroundCenter(v19, v20, v21, v22, v13);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = objc_opt_class();
  if (v30 == objc_opt_class() && -[HMICameraActivityZone activityZoneType](self, "activityZoneType") == 2)
  {
    v23 = HMICGRectDivideAlongHeight(v23, v25, v27, v29, 0.7);
    v25 = v31;
    v27 = v32;
    v29 = v33;
  }
  v55[0] = v10;
  v54[0] = CFSTR("class-label");
  v54[1] = CFSTR("coordinates");
  v57.origin.x = v23;
  v57.origin.y = v25;
  v57.size.width = v27;
  v57.size.height = v29;
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v57);
  v55[1] = DictionaryRepresentation;
  v54[2] = CFSTR("overlap");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v35;
  v54[3] = CFSTR("inclusion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMICameraActivityZone isInclusion](self, "isInclusion"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v36;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v37);

  v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[HMICameraActivityZone points](self, "points");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v48 != v42)
          objc_enumerationMutation(v39);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "point");
        v44 = CGPointCreateDictionaryRepresentation(v56);
        objc_msgSend(v38, "addObject:", v44);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v41);
  }

  v51 = CFSTR("activityZone");
  v52 = v38;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v45);

  return v11;
}

- (BOOL)containsEvent:(id)a3 withInsetPercentage:(float)a4
{
  id v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  CGPath *v23;
  BOOL v24;
  double v25;
  double v26;
  CGPoint v28;
  CGPoint v29;
  CGPoint v30;
  CGPoint v31;

  v6 = a3;
  objc_msgSend(v6, "boundingBox");
  v11 = HMICGRectScaleAroundCenter(v7, v8, v9, v10, a4);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = objc_opt_class();

  if (v18 == objc_opt_class() && -[HMICameraActivityZone activityZoneType](self, "activityZoneType") == 2)
  {
    v11 = HMICGRectDivideAlongHeight(v11, v13, v15, v17, 0.7);
    v13 = v19;
    v15 = v20;
    v17 = v21;
  }
  -[HMICameraActivityZone points](self, "points");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = HMICreatePathFromPoints(v22);

  v28.x = v11;
  v28.y = v13;
  v24 = 0;
  if (CGPathContainsPoint(v23, 0, v28, 0))
  {
    v25 = v11 + v15;
    v29.x = v25;
    v29.y = v13;
    v24 = 0;
    if (CGPathContainsPoint(v23, 0, v29, 0))
    {
      v26 = v13 + v17;
      v30.x = v25;
      v30.y = v26;
      v24 = 0;
      if (CGPathContainsPoint(v23, 0, v30, 0))
      {
        v31.x = v11;
        v31.y = v26;
        v24 = CGPathContainsPoint(v23, 0, v31, 0);
      }
    }
  }
  CGPathRelease(v23);
  return v24;
}

- (BOOL)saveToJsonActivityZones:(id)a3 motionDetection:(id)a4 videoFragmentUrl:(id)a5 frameId:(id)a6 UUID:(id)a7 detectionID:(id)a8 zoneID:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  void *v32;
  HMICameraActivityZone *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  HMICameraActivityZone *v43;
  NSObject *v44;
  void *v45;
  HMICameraActivityZone *v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  HMICameraActivityZone *v52;
  NSObject *v53;
  void *v54;
  void *v56;
  void *context;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v67 = a8;
  v20 = a9;
  +[HMIVideoAnalyzerEvent shortNameForEventClass:](HMIVideoAnalyzerEvent, "shortNameForEventClass:", objc_opt_class());
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a7) = objc_msgSend(v21, "hasPrefix:", CFSTR("HKD://"));

  v63 = v19;
  v61 = v17;
  if ((_DWORD)a7)
  {
    v22 = v19;
  }
  else
  {
    objc_msgSend(v17, "lastPathComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByDeletingPathExtension");
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  v64 = v18;
  v62 = v22;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@-%@-%@.json"), v22, v18, v20, v67);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x24BDD17C8];
  NSTemporaryDirectory();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@/%@"), v26, CFSTR("analyzed-video-frames"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0;
  v29 = objc_msgSend(v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v27, 1, 0, &v70);
  v30 = v70;

  v65 = v16;
  if ((v29 & 1) != 0)
  {
    v58 = v24;
    v59 = v20;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/activityzone-%@"), v27, v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x220735570]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v35;
      v73 = 2112;
      v74 = v31;
      _os_log_impl(&dword_219D45000, v34, OS_LOG_TYPE_INFO, "%{public}@Activity zone file path:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    v60 = v15;
    -[HMICameraActivityZone jsonReperesentaionOfDetectedObject:motionDetection:eventClass:](v33, "jsonReperesentaionOfDetectedObject:motionDetection:eventClass:", v15, v16, v66);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v30;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v36, 1, &v69);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v69;

    if (v37)
    {
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v37, 4);
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v31);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v38;
      v41 = objc_msgSend(v39, "writeToURL:atomically:encoding:error:", v40, 1, 4, &v68);
      v42 = v68;

      if ((v41 & 1) == 0)
      {
        context = (void *)MEMORY[0x220735570]();
        v43 = v33;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v72 = v56;
          v73 = 2112;
          v74 = v42;
          _os_log_impl(&dword_219D45000, v44, OS_LOG_TYPE_ERROR, "%{public}@Error writing activity zone results JSON to file: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
      }

      v38 = v42;
    }
    else
    {
      v51 = (void *)MEMORY[0x220735570]();
      v52 = v33;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v72 = v54;
        v73 = 2112;
        v74 = v38;
        _os_log_impl(&dword_219D45000, v53, OS_LOG_TYPE_ERROR, "%{public}@Error converting activity zone results to JSON: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v51);
      v41 = 0;
    }

    v30 = v38;
    v20 = v59;
    v15 = v60;
    v50 = v63;
    v24 = v58;
  }
  else
  {
    v45 = (void *)MEMORY[0x220735570]();
    v46 = self;
    HMFGetOSLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v48 = v20;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v49;
      v73 = 2112;
      v74 = v30;
      _os_log_impl(&dword_219D45000, v47, OS_LOG_TYPE_ERROR, "%{public}@Error creating activity zone result directory: %@", buf, 0x16u);

      v20 = v48;
    }

    objc_autoreleasePoolPop(v45);
    v41 = 0;
    v50 = v63;
  }

  return v41;
}

- (BOOL)checkIfObjectIsStaticWithBoundingBox:(CGRect)a3 motionDetection:(id)a4 eventClass:(Class)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  void *v13;
  CGPath *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  uint64_t j;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  long double v31;
  long double v32;
  float v33;
  void *v34;
  HMICameraActivityZone *v35;
  NSObject *v36;
  void *v37;
  BOOL v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  double v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;
  CGPoint v55;
  CGPoint v56;
  CGRect v57;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v54 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  if ((Class)objc_opt_class() != a5)
    goto LABEL_25;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMICameraActivityZone points](self, "points");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HMICreatePathFromPoints(v13);

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v11, "motionVectors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v20, "target");
        if (CGPathContainsPoint(v14, 0, v55, 0))
          objc_msgSend(v12, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v17);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v21 = v12;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v41;
    v25 = 0.0;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        objc_msgSend(v27, "target", (_QWORD)v40);
        v56.x = v28;
        v56.y = v29;
        v57.origin.x = x;
        v57.origin.y = y;
        v57.size.width = width;
        v57.size.height = height;
        if (CGRectContainsPoint(v57, v56))
        {
          objc_msgSend(v27, "motion");
          v31 = v30;
          objc_msgSend(v27, "motion");
          v25 = hypot(v31, v32) + v25;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v23);
  }
  else
  {
    v25 = 0.0;
  }

  CGPathRelease(v14);
  v33 = v25 / (height * width + 0.00000011920929);
  v34 = (void *)MEMORY[0x220735570]();
  v35 = self;
  HMFGetOSLogHandle();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = v37;
    v50 = 2048;
    v51 = v33;
    _os_log_impl(&dword_219D45000, v36, OS_LOG_TYPE_DEBUG, "%{public}@motionScore %f", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v34);

  if (v33 < 1.0)
    v38 = 1;
  else
LABEL_25:
    v38 = 0;

  return v38;
}

- (BOOL)containsVectorWithSource:(CGPoint)a3 destination:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  CGPath *v9;
  BOOL v10;
  CGPoint v12;
  CGPoint v13;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[HMICameraActivityZone points](self, "points");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMICreatePathFromPoints(v8);

  v12.x = v7;
  v12.y = v6;
  v10 = 0;
  if (CGPathContainsPoint(v9, 0, v12, 0))
  {
    v13.x = x;
    v13.y = y;
    v10 = CGPathContainsPoint(v9, 0, v13, 0);
  }
  CGPathRelease(v9);
  return v10;
}

+ (id)filterEvents:(id)a3 withActivityZones:(id)a4 motionDetection:(id)a5 insetPercentageInclusion:(float)a6 insetPercentageExclusion:(float)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v33;
  uint64_t v34;
  CFDictionaryRef DictionaryRepresentation;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  CFDictionaryRef v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  double v46;
  uint64_t k;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  CFDictionaryRef v54;
  id v56;
  void *v57;
  void *v58;
  int v59;
  id obj;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  char v79;
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  v93 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isInclusion");

    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __122__HMICameraActivityZone_filterEvents_withActivityZones_motionDetection_insetPercentageInclusion_insetPercentageExclusion___block_invoke;
    v78[3] = &__block_descriptor_33_e31_B16__0__HMICameraActivityZone_8l;
    v59 = v15;
    v79 = v15;
    objc_msgSend(v12, "na_all:", v78);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v56 = v11;
    obj = v11;
    v61 = v12;
    v63 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
    if (v63)
    {
      v62 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v63; i = (char *)i + 1)
        {
          if (*(_QWORD *)v75 != v62)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v18 = v12;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v71;
            while (2)
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v71 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
                if (objc_msgSend(v23, "activityZoneType", v56))
                {
                  *(float *)&v24 = a7;
                  if (objc_msgSend(v23, "containsEvent:withInsetPercentage:", v17, v24))
                  {
                    v29 = (void *)MEMORY[0x220735570]();
                    v30 = a1;
                    HMFGetOSLogHandle();
                    v31 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      v34 = objc_opt_class();
                      objc_msgSend(v17, "boundingBox");
                      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v94);
                      *(_DWORD *)buf = 138544386;
                      v82 = v33;
                      v83 = 2112;
                      v84 = (uint64_t)v23;
                      v85 = 2112;
                      v86 = v34;
                      v87 = 2112;
                      v88 = *(double *)&DictionaryRepresentation;
                      v89 = 2048;
                      v90 = a7;
                      _os_log_impl(&dword_219D45000, v31, OS_LOG_TYPE_INFO, "%{public}@Exclusion zone:%@ intersecting with:(%@) Object coordinate %@ insetThreshold %f", buf, 0x34u);

                    }
                    objc_autoreleasePoolPop(v29);

                    v12 = v61;
                    goto LABEL_28;
                  }
                }
                else
                {
                  objc_msgSend(v17, "boundingBox");
                  if (objc_msgSend(v23, "overlapsWithElipseInsideRect:withInsetPercentage:"))
                  {
                    objc_msgSend(v17, "boundingBox");
                    if ((objc_msgSend(v23, "checkIfObjectIsStaticWithBoundingBox:motionDetection:eventClass:", v13, objc_opt_class(), v25, v26, v27, v28) & 1) == 0)
                    {
                      v36 = (void *)MEMORY[0x220735570]();
                      v37 = a1;
                      HMFGetOSLogHandle();
                      v38 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v57 = v36;
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        v40 = objc_opt_class();
                        objc_msgSend(v17, "boundingBox");
                        v41 = CGRectCreateDictionaryRepresentation(v95);
                        *(_DWORD *)buf = 138544386;
                        v82 = v39;
                        v83 = 2112;
                        v84 = (uint64_t)v23;
                        v85 = 2112;
                        v86 = v40;
                        v87 = 2112;
                        v88 = *(double *)&v41;
                        v89 = 2048;
                        v90 = a6;
                        _os_log_impl(&dword_219D45000, v38, OS_LOG_TYPE_INFO, "%{public}@Inclusion zone:%@ intersecting with:(%@) Object coordinate %@ insetThreshold %f", buf, 0x34u);

                        v36 = v57;
                      }

                      objc_autoreleasePoolPop(v36);
                      v12 = v61;
                      goto LABEL_27;
                    }
                  }
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
              if (v20)
                continue;
              break;
            }
          }

          if ((v59 & 1) == 0)
LABEL_27:
            objc_msgSend(v58, "addObject:", v17, v56);
LABEL_28:
          ;
        }
        v63 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
      }
      while (v63);
    }

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = v58;
    v42 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v67;
      if (v59)
        v45 = a6;
      else
        v45 = a7;
      v46 = v45;
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v67 != v44)
            objc_enumerationMutation(v64);
          v48 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
          v49 = (void *)MEMORY[0x220735570]();
          v50 = a1;
          HMFGetOSLogHandle();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_opt_class();
            objc_msgSend(v48, "boundingBox");
            v54 = CGRectCreateDictionaryRepresentation(v96);
            *(_DWORD *)buf = 138544130;
            v82 = v52;
            v83 = 2112;
            v84 = v53;
            v85 = 2112;
            v86 = (uint64_t)v54;
            v87 = 2048;
            v88 = v46;
            _os_log_impl(&dword_219D45000, v51, OS_LOG_TYPE_INFO, "%{public}@Events after activity zone filtering:(%@) Object coordinate %@ insetPercentage %f", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v49);
        }
        v43 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
      }
      while (v43);
    }

    v11 = v56;
    v12 = v61;
  }
  else
  {
    v64 = v11;
  }

  return v64;
}

BOOL __122__HMICameraActivityZone_filterEvents_withActivityZones_motionDetection_insetPercentageInclusion_insetPercentageExclusion___block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == objc_msgSend(a2, "isInclusion");
}

+ (id)activityZonesFromString:(id)a3 isInclusion:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  HMIPoint *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  HMIPoint *v26;
  HMICameraActivityZone *v27;
  void *v29;
  id obj;
  _BOOL4 v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v31 = a4;
  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("{}"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v4;
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v6;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v41 != v33)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v8, "length"))
        {
          v35 = i;
          objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("()"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v12 = v10;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v37;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v37 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                if (objc_msgSend(v17, "length"))
                {
                  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(","));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "componentsSeparatedByCharactersInSet:", v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  v20 = [HMIPoint alloc];
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "doubleValue");
                  v23 = v22;
                  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "doubleValue");
                  v26 = -[HMIPoint initWithPoint:](v20, "initWithPoint:", v23, v25);

                  objc_msgSend(v11, "addObject:", v26);
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v14);
          }

          v27 = -[HMICameraActivityZone initWithPoints:isInclusion:]([HMICameraActivityZone alloc], "initWithPoints:isInclusion:", v11, v31);
          objc_msgSend(v32, "addObject:", v27);

          i = v35;
        }
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v34);
  }

  return v32;
}

+ (void)submitCoreAnalyticsEventForActivityZones:(id)a3 motionScore:(float)a4
{
  id v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __CFString *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isInclusion");

    v7 = CFSTR("exclusion");
    if (v6)
      v7 = CFSTR("inclusion");
  }
  else
  {
    v7 = CFSTR("None");
  }
  v8 = (__CFString *)v7;
  AnalyticsSendEventLazy();

}

id __78__HMICameraActivityZone_submitCoreAnalyticsEventForActivityZones_motionScore___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v6[1] = CFSTR("motionScore");
  v7[0] = v2;
  v6[0] = CFSTR("zoneType");
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)submitCoreAnalyticsEvent:(id)a3 filteringLevel:(id)a4 numberOfDetectedObjects:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v7 = (void *)MEMORY[0x24BDBCED8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("zoneType"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("filteringLevel"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("numDetectedObjects"));

  v12 = v11;
  AnalyticsSendEventLazy();

}

id __89__HMICameraActivityZone_submitCoreAnalyticsEvent_filteringLevel_numberOfDetectedObjects___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)generateAndSubmitStats:(id)a3 filteredEvents:(id)a4 motionDetection:(id)a5 activityZones:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  id v38;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isInclusion");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v17 = CFSTR("inclusion");
    objc_msgSend(a1, "submitCoreAnalyticsEvent:filteringLevel:numberOfDetectedObjects:", CFSTR("inclusion"), CFSTR("noFiltering"), v16);

    v18 = (void *)MEMORY[0x24BDD16E0];
    v19 = objc_msgSend(v12, "count");

    objc_msgSend(v18, "numberWithUnsignedInteger:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "submitCoreAnalyticsEvent:filteringLevel:numberOfDetectedObjects:", CFSTR("inclusion"), CFSTR("resize_0"), v20);

    LODWORD(v21) = 1028443341;
    LODWORD(v22) = 0;
    objc_msgSend(a1, "filterEvents:withActivityZones:motionDetection:insetPercentageInclusion:insetPercentageExclusion:", v13, v10, v11, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "submitCoreAnalyticsEvent:filteringLevel:numberOfDetectedObjects:", CFSTR("inclusion"), CFSTR("resize_10"), v24);

    LODWORD(v25) = 1036831949;
    LODWORD(v26) = 0;
    objc_msgSend(a1, "filterEvents:withActivityZones:motionDetection:insetPercentageInclusion:insetPercentageExclusion:", v13, v10, v11, v25, v26);
    v38 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v38, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = CFSTR("resize_20");
  }
  else
  {
    v17 = CFSTR("exclusion");
    objc_msgSend(a1, "submitCoreAnalyticsEvent:filteringLevel:numberOfDetectedObjects:", CFSTR("exclusion"), CFSTR("noFiltering"), v16);

    v29 = (void *)MEMORY[0x24BDD16E0];
    v30 = objc_msgSend(v12, "count");

    objc_msgSend(v29, "numberWithUnsignedInteger:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "submitCoreAnalyticsEvent:filteringLevel:numberOfDetectedObjects:", CFSTR("exclusion"), CFSTR("resize_20"), v31);

    LODWORD(v32) = 1040522936;
    LODWORD(v33) = 0;
    objc_msgSend(a1, "filterEvents:withActivityZones:motionDetection:insetPercentageInclusion:insetPercentageExclusion:", v13, v10, v11, v33, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "submitCoreAnalyticsEvent:filteringLevel:numberOfDetectedObjects:", CFSTR("exclusion"), CFSTR("resize_26"), v35);

    LODWORD(v36) = 1043878380;
    LODWORD(v37) = 0;
    objc_msgSend(a1, "filterEvents:withActivityZones:motionDetection:insetPercentageInclusion:insetPercentageExclusion:", v13, v10, v11, v37, v36);
    v38 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v38, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = CFSTR("resize_36");
  }
  objc_msgSend(a1, "submitCoreAnalyticsEvent:filteringLevel:numberOfDetectedObjects:", v17, v28, v27);

}

- (NSArray)points
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isInclusion
{
  return self->_inclusion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_points, 0);
}

@end
