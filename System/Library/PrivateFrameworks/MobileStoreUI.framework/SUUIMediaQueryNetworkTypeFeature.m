@implementation SUUIMediaQueryNetworkTypeFeature

- (SUUIMediaQueryNetworkTypeFeature)initWithFeatureName:(id)a3 value:(id)a4
{
  id v6;
  SUUIMediaQueryNetworkTypeFeature *v7;
  uint64_t v8;
  NSString *value;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SUUIMediaQueryNetworkTypeFeature;
  v7 = -[SUUIMediaQueryFeature initWithFeatureName:value:](&v11, sel_initWithFeatureName_value_, a3, v6);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    value = v7->_value;
    v7->_value = (NSString *)v8;

  }
  return v7;
}

+ (BOOL)supportsFeatureName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("network"));
}

- (BOOL)evaluateWithValues:(id)a3
{
  void *v4;

  objc_msgSend(a3, "objectForKey:", 0x2512120C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isEqualToString:", self->_value);

  return (char)self;
}

- (id)notificationNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BEC8B00];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)requiredKeys
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0x2512120C8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SUUIMediaQueryNetworkTypeFeature;
  -[SUUIMediaQueryNetworkTypeFeature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMediaQueryFeature featureName](self, "featureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@, %@]"), v4, v5, self->_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
