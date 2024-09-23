@implementation HMIVideoAnalyzerDynamicConfiguration

- (HMIVideoAnalyzerDynamicConfiguration)init
{
  HMIVideoAnalyzerDynamicConfiguration *v2;
  HMIVideoAnalyzerDynamicConfiguration *v3;
  NSArray *activityZones;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMIVideoAnalyzerDynamicConfiguration;
  v2 = -[HMIVideoAnalyzerDynamicConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_eventTriggers = 0;
    activityZones = v2->_activityZones;
    v2->_activityZones = (NSArray *)MEMORY[0x24BDBD1A8];

    v3->_recognizeFaces = 0;
  }
  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerDynamicConfiguration eventTriggers](self, "eventTriggers");
  HMIVideoAnalyzerEventTriggersAsString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Event Triggers"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIVideoAnalyzerDynamicConfiguration recognizeFaces](self, "recognizeFaces", v5);
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Recognize Faces"), v7);
  v16[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerDynamicConfiguration activityZones](self, "activityZones");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Activity Zone Count"), v12);
  v16[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  HMIVideoAnalyzerDynamicConfiguration *v4;
  HMIVideoAnalyzerDynamicConfiguration *v5;
  int64_t v6;
  _BOOL4 v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMIVideoAnalyzerDynamicConfiguration *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HMIVideoAnalyzerDynamicConfiguration eventTriggers](self, "eventTriggers");
      v7 = v6 == -[HMIVideoAnalyzerDynamicConfiguration eventTriggers](v5, "eventTriggers");
      LODWORD(v6) = -[HMIVideoAnalyzerDynamicConfiguration recognizeFaces](self, "recognizeFaces");
      v8 = v7 & ~(v6 ^ -[HMIVideoAnalyzerDynamicConfiguration recognizeFaces](v5, "recognizeFaces"));
      -[HMIVideoAnalyzerDynamicConfiguration activityZones](self, "activityZones");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIVideoAnalyzerDynamicConfiguration activityZones](v5, "activityZones");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v5) = HMFEqualObjects();
      v11 = v8 & v5;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoAnalyzerDynamicConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMIVideoAnalyzerDynamicConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMIVideoAnalyzerDynamicConfiguration init](self, "init");
  v6 = (void *)MEMORY[0x24BDBCF20];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityZones);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerDynamicConfiguration setActivityZones:](v5, "setActivityZones:", v10);

  NSStringFromSelector(sel_eventTriggers);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerDynamicConfiguration setEventTriggers:](v5, "setEventTriggers:", objc_msgSend(v4, "decodeIntegerForKey:", v11));

  NSStringFromSelector(sel_recognizeFaces);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "decodeBoolForKey:", v12);

  -[HMIVideoAnalyzerDynamicConfiguration setRecognizeFaces:](v5, "setRecognizeFaces:", v13);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v4 = a3;
  -[HMIVideoAnalyzerDynamicConfiguration activityZones](self, "activityZones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityZones);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[HMIVideoAnalyzerDynamicConfiguration eventTriggers](self, "eventTriggers");
  NSStringFromSelector(sel_eventTriggers);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  v9 = -[HMIVideoAnalyzerDynamicConfiguration recognizeFaces](self, "recognizeFaces");
  NSStringFromSelector(sel_recognizeFaces);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

}

- (BOOL)recognizeFaces
{
  return self->_recognizeFaces;
}

- (void)setRecognizeFaces:(BOOL)a3
{
  self->_recognizeFaces = a3;
}

- (int64_t)eventTriggers
{
  return self->_eventTriggers;
}

- (void)setEventTriggers:(int64_t)a3
{
  self->_eventTriggers = a3;
}

- (NSArray)activityZones
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActivityZones:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityZones, 0);
}

@end
