@implementation HMDNaturalLightingEnabledRetryContext

- (HMDNaturalLightingEnabledRetryContext)initWithNaturalLightingEnabled:(BOOL)a3 completion:(id)a4 retryCount:(unint64_t)a5
{
  id v8;
  HMDNaturalLightingEnabledRetryContext *v9;
  HMDNaturalLightingEnabledRetryContext *v10;
  void *v11;
  id completion;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDNaturalLightingEnabledRetryContext;
  v9 = -[HMDNaturalLightingEnabledRetryContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_naturalLightingEnabled = a3;
    v11 = _Block_copy(v8);
    completion = v10->_completion;
    v10->_completion = v11;

    v10->_retryCount = a5;
  }

  return v10;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F140]), "initWithName:value:", CFSTR("Identifier"), v3);
  v13[0] = v4;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNaturalLightingEnabledRetryContext naturalLightingEnabled](self, "naturalLightingEnabled");
  HMFBooleanToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Natural Lighting Enabled"), v6);
  v13[1] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDNaturalLightingEnabledRetryContext retryCount](self, "retryCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Retry Count"), v9);
  v13[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)naturalLightingEnabled
{
  return self->_naturalLightingEnabled;
}

- (id)completion
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
