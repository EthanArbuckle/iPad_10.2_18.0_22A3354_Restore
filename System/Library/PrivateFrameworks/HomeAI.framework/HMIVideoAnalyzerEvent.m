@implementation HMIVideoAnalyzerEvent

+ (NSArray)eventClassesArray
{
  if (eventClassesArray_onceToken != -1)
    dispatch_once(&eventClassesArray_onceToken, &__block_literal_global_37);
  return (NSArray *)(id)eventClassesArray_classes;
}

void __42__HMIVideoAnalyzerEvent_eventClassesArray__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)eventClassesArray_classes;
  eventClassesArray_classes = v0;

}

+ (NSSet)eventClasses
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a1, "eventClassesArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (HMIVideoAnalyzerEvent)initWithConfidence:(id)a3 boundingBox:(CGRect)a4
{
  return -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:userInfo:](self, "initWithConfidence:boundingBox:userInfo:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (HMIVideoAnalyzerEvent)initWithConfidence:(id)a3 boundingBox:(CGRect)a4 userInfo:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  void *v14;
  HMIVideoAnalyzerEvent *v15;
  HMIVideoAnalyzerEvent *v16;
  HMIVideoAnalyzerEvent *v18;
  SEL v19;
  objc_super v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = a5;
  if (v12)
  {
    v14 = v13;
    v20.receiver = self;
    v20.super_class = (Class)HMIVideoAnalyzerEvent;
    v15 = -[HMIVideoAnalyzerEvent init](&v20, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_confidence, a3);
      v16->_boundingBox.origin.x = x;
      v16->_boundingBox.origin.y = y;
      v16->_boundingBox.size.width = width;
      v16->_boundingBox.size.height = height;
      objc_storeStrong((id *)&v16->_userInfo, a5);
    }

    return v16;
  }
  else
  {
    v18 = (HMIVideoAnalyzerEvent *)_HMFPreconditionFailure();
    return (HMIVideoAnalyzerEvent *)-[HMIVideoAnalyzerEvent allEvents](v18, v19);
  }
}

- (NSArray)allEvents
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  NSRect v14;

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerEvent confidence](self, "confidence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Confidence"), v6);
  v13[0] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerEvent boundingBox](self, "boundingBox");
  NSStringFromRect(v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Bounding Box"), v9);
  v13[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  +[HMIVideoAnalyzerEvent shortNameForEventClass:](HMIVideoAnalyzerEvent, "shortNameForEventClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerEvent boundingBox](self, "boundingBox");
  HMICGRectDescription(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerEvent confidence](self, "confidence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("P(%@|[%@])=%@"), v4, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)confidenceLevel
{
  void *v2;
  int64_t v3;

  -[HMIVideoAnalyzerEvent confidence](self, "confidence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "level");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMIVideoAnalyzerEvent *v4;
  HMIVideoAnalyzerEvent *v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  _BOOL4 v25;
  CGRect v27;
  CGRect v28;

  v4 = (HMIVideoAnalyzerEvent *)a3;
  if (v4 == self)
  {
    LOBYTE(v25) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMIVideoAnalyzerEvent confidence](self, "confidence");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzerEvent confidence](v5, "confidence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = HMFEqualObjects();

      -[HMIVideoAnalyzerEvent boundingBox](self, "boundingBox");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      -[HMIVideoAnalyzerEvent boundingBox](v5, "boundingBox");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;

      v27.origin.x = v10;
      v27.origin.y = v12;
      v27.size.width = v14;
      v27.size.height = v16;
      v28.origin.x = v18;
      v28.origin.y = v20;
      v28.size.width = v22;
      v28.size.height = v24;
      v25 = v8 & CGRectEqualToRect(v27, v28);
    }
    else
    {
      LOBYTE(v25) = 0;
    }
  }

  return v25;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;

  -[HMIVideoAnalyzerEvent confidence](self, "confidence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMIVideoAnalyzerEvent boundingBox](self, "boundingBox");
  v9 = HMIHashCGRect(v5, v6, v7, v8) ^ v4;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoAnalyzerEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMIVideoAnalyzerEvent *v22;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_confidence);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_boundingBox);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeRectForKey:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = (void *)MEMORY[0x24BDBCF20];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userInfo);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[HMIVideoAnalyzerEvent initWithConfidence:boundingBox:userInfo:](self, "initWithConfidence:boundingBox:userInfo:", v7, v21, v10, v12, v14, v16);
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  -[HMIVideoAnalyzerEvent confidence](self, "confidence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_confidence);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[HMIVideoAnalyzerEvent boundingBox](self, "boundingBox");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  NSStringFromSelector(sel_boundingBox);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeRect:forKey:", v15, v8, v10, v12, v14);

  -[HMIVideoAnalyzerEvent userInfo](self, "userInfo");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userInfo);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v16);

}

+ (id)eventsWithContentsOfFile:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v22;
  _QWORD v23[8];
  _QWORD v24[8];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) != 0)
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v4, 0, &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;
    if (v7)
    {
      v23[0] = CFSTR("Pet");
      v24[0] = objc_opt_class();
      v23[1] = CFSTR("Package");
      v24[1] = objc_opt_class();
      v23[2] = CFSTR("Person");
      v24[2] = objc_opt_class();
      v23[3] = CFSTR("Vehicle");
      v24[3] = objc_opt_class();
      v23[4] = CFSTR("Face");
      v24[4] = objc_opt_class();
      v23[5] = CFSTR("Torso");
      v24[5] = objc_opt_class();
      v23[6] = CFSTR("Motion");
      v24[6] = objc_opt_class();
      v23[7] = CFSTR("Confidence");
      v24[7] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDBCF20];
      +[HMIJSONUnarchiver objectWithJSONData:classMap:](HMIJSONUnarchiver, "objectWithJSONData:classMap:", v7, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = (void *)MEMORY[0x220735570]();
      v18 = a1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v20;
        v27 = 2112;
        v28 = v4;
        v29 = 2112;
        v30 = v8;
        _os_log_impl(&dword_219D45000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot read events from file \"%@\", error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      v12 = 0;
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x220735570]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v16;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_219D45000, v15, OS_LOG_TYPE_ERROR, "%{public}@Events file \"%@\" does not exist.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

+ (id)shortNameForEventClass:(Class)a3
{
  if (shortNameForEventClass__onceToken != -1)
    dispatch_once(&shortNameForEventClass__onceToken, &__block_literal_global_47);
  return (id)objc_msgSend((id)shortNameForEventClass__map, "objectForKeyedSubscript:", a3);
}

void __48__HMIVideoAnalyzerEvent_shortNameForEventClass___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v3[0] = CFSTR("Event");
  v2[1] = objc_opt_class();
  v3[1] = CFSTR("Motion");
  v2[2] = objc_opt_class();
  v3[2] = CFSTR("Person");
  v2[3] = objc_opt_class();
  v3[3] = CFSTR("Pet");
  v2[4] = objc_opt_class();
  v3[4] = CFSTR("Package");
  v2[5] = objc_opt_class();
  v3[5] = CFSTR("Vehicle");
  v2[6] = objc_opt_class();
  v3[6] = CFSTR("Face");
  v2[7] = objc_opt_class();
  v3[7] = CFSTR("Torso");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shortNameForEventClass__map;
  shortNameForEventClass__map = v0;

}

+ (Class)eventClassForShortName:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = eventClassForShortName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&eventClassForShortName__onceToken, &__block_literal_global_50_0);
  v5 = (void *)eventClassForShortName__map;
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v7;
}

void __48__HMIVideoAnalyzerEvent_eventClassForShortName___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("event");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("motion");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("person");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("pet");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("vehicle");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("package");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("face");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("torso");
  v3[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)eventClassForShortName__map;
  eventClassForShortName__map = v0;

}

+ (id)rgbColorCodeForEventClass:(Class)a3
{
  if (rgbColorCodeForEventClass__onceToken != -1)
    dispatch_once(&rgbColorCodeForEventClass__onceToken, &__block_literal_global_67);
  return (id)objc_msgSend((id)rgbColorCodeForEventClass__map, "objectForKeyedSubscript:", a3);
}

void __51__HMIVideoAnalyzerEvent_rgbColorCodeForEventClass___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v3[0] = CFSTR("#D62728");
  v2[1] = objc_opt_class();
  v3[1] = CFSTR("#2CA02C");
  v2[2] = objc_opt_class();
  v3[2] = CFSTR("#1F77B4");
  v2[3] = objc_opt_class();
  v3[3] = CFSTR("#9467BD");
  v2[4] = objc_opt_class();
  v3[4] = CFSTR("#FF7F0E");
  v2[5] = objc_opt_class();
  v3[5] = CFSTR("#8C564B");
  v2[6] = objc_opt_class();
  v3[6] = CFSTR("#7F7F7F");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rgbColorCodeForEventClass__map;
  rgbColorCodeForEventClass__map = v0;

}

+ (id)defaultConfidenceThresholdsFeedback
{
  if (defaultConfidenceThresholdsFeedback_onceToken != -1)
    dispatch_once(&defaultConfidenceThresholdsFeedback_onceToken, &__block_literal_global_82_0);
  return (id)defaultConfidenceThresholdsFeedback_confidenceThresholdsFeedback;
}

void __60__HMIVideoAnalyzerEvent_defaultConfidenceThresholdsFeedback__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_opt_class();
  v3[0] = &unk_24DC154E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultConfidenceThresholdsFeedback_confidenceThresholdsFeedback;
  defaultConfidenceThresholdsFeedback_confidenceThresholdsFeedback = v0;

}

+ (id)defaultConfidenceThresholdsMedium
{
  if (defaultConfidenceThresholdsMedium_onceToken != -1)
    dispatch_once(&defaultConfidenceThresholdsMedium_onceToken, &__block_literal_global_83);
  return (id)defaultConfidenceThresholdsMedium_confidenceThresholdsMedium;
}

void __58__HMIVideoAnalyzerEvent_defaultConfidenceThresholdsMedium__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v3[0] = &unk_24DC154F0;
  v2[1] = objc_opt_class();
  v3[1] = &unk_24DC15500;
  v2[2] = objc_opt_class();
  v3[2] = &unk_24DC15510;
  v2[3] = objc_opt_class();
  v3[3] = &unk_24DC15520;
  v2[4] = objc_opt_class();
  v3[4] = &unk_24DC15530;
  v2[5] = objc_opt_class();
  v3[5] = &unk_24DC15540;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultConfidenceThresholdsMedium_confidenceThresholdsMedium;
  defaultConfidenceThresholdsMedium_confidenceThresholdsMedium = v0;

}

+ (id)defaultConfidenceThresholdsHigh
{
  if (defaultConfidenceThresholdsHigh_onceToken != -1)
    dispatch_once(&defaultConfidenceThresholdsHigh_onceToken, &__block_literal_global_90);
  return (id)defaultConfidenceThresholdsHigh_confidenceThresholdsHigh;
}

void __56__HMIVideoAnalyzerEvent_defaultConfidenceThresholdsHigh__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v3[0] = &unk_24DC15550;
  v2[1] = objc_opt_class();
  v3[1] = &unk_24DC15560;
  v2[2] = objc_opt_class();
  v3[2] = &unk_24DC15570;
  v2[3] = objc_opt_class();
  v3[3] = &unk_24DC15520;
  v2[4] = objc_opt_class();
  v3[4] = &unk_24DC15530;
  v2[5] = objc_opt_class();
  v3[5] = &unk_24DC15540;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultConfidenceThresholdsHigh_confidenceThresholdsHigh;
  defaultConfidenceThresholdsHigh_confidenceThresholdsHigh = v0;

}

+ (id)defaultConfidenceThreshold:(Class)a3 confidenceLevel:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (a4 == 1)
  {
    objc_msgSend(a1, "defaultConfidenceThresholdsMedium");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 2)
    {
      v7 = 0;
      return v7;
    }
    objc_msgSend(a1, "defaultConfidenceThresholdsHigh");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)eventConfidenceThresholdsMedium
{
  void *v3;
  void *v4;
  void *v5;

  if (eventConfidenceThresholdsMedium_onceToken != -1)
    dispatch_once(&eventConfidenceThresholdsMedium_onceToken, &__block_literal_global_94);
  objc_msgSend((id)eventConfidenceThresholdsMedium_eventClassToConfidenceKey, "na_dictionaryByMappingValues:", &__block_literal_global_96);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultConfidenceThresholdsMedium");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "addEntriesFromDictionary:", v3);
  return v5;
}

void __56__HMIVideoAnalyzerEvent_eventConfidenceThresholdsMedium__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v3[0] = CFSTR("confidenceThresholdPersonMedium");
  v2[1] = objc_opt_class();
  v3[1] = CFSTR("confidenceThresholdPetMedium");
  v2[2] = objc_opt_class();
  v3[2] = CFSTR("confidenceThresholdVehicleMedium");
  v2[3] = objc_opt_class();
  v3[3] = CFSTR("confidenceThresholdFaceMedium");
  v2[4] = objc_opt_class();
  v3[4] = CFSTR("confidenceThresholdTorsoMedium");
  v2[5] = objc_opt_class();
  v3[5] = CFSTR("confidenceThresholdPackageMedium");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)eventConfidenceThresholdsMedium_eventClassToConfidenceKey;
  eventConfidenceThresholdsMedium_eventClassToConfidenceKey = v0;

}

id __56__HMIVideoAnalyzerEvent_eventConfidenceThresholdsMedium__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberPreferenceForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)eventConfidenceThresholdsHigh
{
  void *v3;
  void *v4;
  void *v5;

  if (eventConfidenceThresholdsHigh_onceToken != -1)
    dispatch_once(&eventConfidenceThresholdsHigh_onceToken, &__block_literal_global_98);
  objc_msgSend((id)eventConfidenceThresholdsHigh_eventClassToConfidenceKey, "na_dictionaryByMappingValues:", &__block_literal_global_99);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultConfidenceThresholdsHigh");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "addEntriesFromDictionary:", v3);
  return v5;
}

void __54__HMIVideoAnalyzerEvent_eventConfidenceThresholdsHigh__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v3[0] = CFSTR("confidenceThresholdPersonHigh");
  v2[1] = objc_opt_class();
  v3[1] = CFSTR("confidenceThresholdPetHigh");
  v2[2] = objc_opt_class();
  v3[2] = CFSTR("confidenceThresholdVehicleHigh");
  v2[3] = objc_opt_class();
  v3[3] = CFSTR("confidenceThresholdFaceHigh");
  v2[4] = objc_opt_class();
  v3[4] = CFSTR("confidenceThresholdTorsoHigh");
  v2[5] = objc_opt_class();
  v3[5] = CFSTR("confidenceThresholdPackageHigh");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)eventConfidenceThresholdsHigh_eventClassToConfidenceKey;
  eventConfidenceThresholdsHigh_eventClassToConfidenceKey = v0;

}

id __54__HMIVideoAnalyzerEvent_eventConfidenceThresholdsHigh__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HMIPreference sharedInstance](HMIPreference, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberPreferenceForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)boundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
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

- (HMIConfidence)confidence
{
  return (HMIConfidence *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
}

@end
