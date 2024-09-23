@implementation HMMTRHAPAccessoryInfo

- (HMMTRHAPAccessoryInfo)init
{
  HMMTRHAPAccessoryInfo *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *accessoryInfoDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMMTRHAPAccessoryInfo;
  v2 = -[HMMTRHAPAccessoryInfo init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    accessoryInfoDictionary = v2->_accessoryInfoDictionary;
    v2->_accessoryInfoDictionary = v3;

  }
  return v2;
}

- (HMMTRHAPAccessoryInfo)initWithType:(id)a3
{
  id v4;
  HMMTRHAPAccessoryInfo *v5;
  HMMTRHAPAccessoryInfo *v6;

  v4 = a3;
  v5 = -[HMMTRHAPAccessoryInfo init](self, "init");
  v6 = v5;
  if (v5)
    -[NSMutableDictionary addEntriesFromDictionary:](v5->_accessoryInfoDictionary, "addEntriesFromDictionary:", v4);

  return v6;
}

- (NSMutableDictionary)accessoryInfoDictionary
{
  return self->_accessoryInfoDictionary;
}

- (id)accessoryInfoForEndpoint:(id)a3
{
  NSMutableDictionary *accessoryInfoDictionary;
  void *v4;
  void *v5;

  accessoryInfoDictionary = self->_accessoryInfoDictionary;
  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](accessoryInfoDictionary, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)categoriesForEndpoint:(id)a3
{
  void *v3;
  void *v4;

  -[HMMTRHAPAccessoryInfo accessoryInfoForEndpoint:](self, "accessoryInfoForEndpoint:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)serviceDescriptionsForEndpoint:(id)a3
{
  void *v3;
  void *v4;

  -[HMMTRHAPAccessoryInfo accessoryInfoForEndpoint:](self, "accessoryInfoForEndpoint:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getServiceDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)partsListForEndpoint:(id)a3
{
  void *v3;
  void *v4;

  -[HMMTRHAPAccessoryInfo accessoryInfoForEndpoint:](self, "accessoryInfoForEndpoint:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getPartsList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fixedLabelsForEndpoint:(id)a3
{
  void *v3;
  void *v4;

  -[HMMTRHAPAccessoryInfo accessoryInfoForEndpoint:](self, "accessoryInfoForEndpoint:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getFixedLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nameForEndpoint:(id)a3
{
  void *v3;
  void *v4;

  -[HMMTRHAPAccessoryInfo accessoryInfoForEndpoint:](self, "accessoryInfoForEndpoint:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setAccessoryInfo:(id)a3 forEndpoint:(id)a4
{
  NSMutableDictionary *accessoryInfoDictionary;
  id v6;
  id v7;

  accessoryInfoDictionary = self->_accessoryInfoDictionary;
  v6 = a3;
  objc_msgSend(a4, "stringValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](accessoryInfoDictionary, "setObject:forKey:", v6, v7);

}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRHAPAccessoryInfo accessoryInfoDictionary](self, "accessoryInfoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("AccessoryInfoDictionary"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAccessoryInfoDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryInfoDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryInfoDictionary, 0);
}

@end
