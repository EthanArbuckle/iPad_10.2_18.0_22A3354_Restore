@implementation HMMTRHAPDescriptionAtEndpoint

- (HMMTRHAPDescriptionAtEndpoint)init
{
  HMMTRHAPDescriptionAtEndpoint *v2;
  NSArray *v3;
  NSArray *categories;
  NSArray *v5;
  NSArray *serviceDescriptions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMMTRHAPDescriptionAtEndpoint;
  v2 = -[HMMTRHAPDescriptionAtEndpoint init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    categories = v2->_categories;
    v2->_categories = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    serviceDescriptions = v2->_serviceDescriptions;
    v2->_serviceDescriptions = v5;

  }
  return v2;
}

- (HMMTRHAPDescriptionAtEndpoint)initWithType:(id)a3 serviceDescriptions:(id)a4
{
  id v7;
  id v8;
  HMMTRHAPDescriptionAtEndpoint *v9;
  HMMTRHAPDescriptionAtEndpoint *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[HMMTRHAPDescriptionAtEndpoint init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_categories, a3);
    objc_storeStrong((id *)&v10->_serviceDescriptions, a4);
  }

  return v10;
}

- (HMMTRHAPDescriptionAtEndpoint)initWithType:(id)a3 serviceDescriptions:(id)a4 name:(id)a5 partsList:(id)a6 fixedLabels:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMMTRHAPDescriptionAtEndpoint *v17;
  HMMTRHAPDescriptionAtEndpoint *v18;
  NSArray *v19;
  NSArray *partsList;
  NSArray *v21;
  NSArray *fixedLabels;
  id v24;

  v24 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[HMMTRHAPDescriptionAtEndpoint init](self, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_categories, a3);
    objc_storeStrong((id *)&v18->_serviceDescriptions, a4);
    objc_storeStrong((id *)&v18->_name, a5);
    if (v15)
    {
      v19 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      partsList = v18->_partsList;
      v18->_partsList = v19;

      objc_storeStrong((id *)&v18->_partsList, a6);
    }
    if (v16)
    {
      v21 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      fixedLabels = v18->_fixedLabels;
      v18->_fixedLabels = v21;

      objc_storeStrong((id *)&v18->_fixedLabels, a7);
    }
  }

  return v18;
}

- (id)getCategories
{
  return self->_categories;
}

- (id)getServiceDescriptions
{
  return self->_serviceDescriptions;
}

- (id)getPartsList
{
  return self->_partsList;
}

- (id)getFixedLabels
{
  return self->_fixedLabels;
}

- (id)getName
{
  return self->_name;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRHAPDescriptionAtEndpoint categories](self, "categories");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Categories"), v19);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRHAPDescriptionAtEndpoint serviceDescriptions](self, "serviceDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("ServiceDescriptions"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRHAPDescriptionAtEndpoint name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Name"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRHAPDescriptionAtEndpoint partsList](self, "partsList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("PartsList"), v12);
  v20[3] = v13;
  v14 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRHAPDescriptionAtEndpoint fixedLabels](self, "fixedLabels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("FixedLabels"), v15);
  v20[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)serviceDescriptions
{
  return self->_serviceDescriptions;
}

- (void)setServiceDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescriptions, a3);
}

- (NSArray)partsList
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)fixedLabels
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedLabels, 0);
  objc_storeStrong((id *)&self->_partsList, 0);
  objc_storeStrong((id *)&self->_serviceDescriptions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
