@implementation HMDCameraMetricsMilestone

- (HMDCameraMetricsMilestone)initWithKey:(id)a3 timestamp:(int64_t)a4
{
  id v7;
  HMDCameraMetricsMilestone *v8;
  HMDCameraMetricsMilestone *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraMetricsMilestone;
  v8 = -[HMDCameraMetricsMilestone init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_key, a3);
    v9->_timestamp = a4;
  }

  return v9;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraMetricsMilestone key](self, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("key"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDCameraMetricsMilestone timestamp](self, "timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("timestamp"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
