@implementation HMMTRHAPServiceDescription

- (HMMTRHAPServiceDescription)initWithType:(id)a3 endpoint:(id)a4 name:(id)a5 optionalServiceLabelIndexIncluded:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  HMMTRHAPServiceDescription *v14;
  HMMTRHAPServiceDescription *v15;
  NSArray *optionalCharacteristics;
  NSArray *v17;
  NSArray *requiredCharacteristics;
  NSDictionary *characteristicFeatureMap;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HMMTRHAPServiceDescription;
  v14 = -[HMMTRHAPServiceDescription init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_serviceType, a3);
    objc_storeStrong((id *)&v15->_endpoint, a4);
    objc_storeStrong((id *)&v15->_name, a5);
    optionalCharacteristics = v15->_optionalCharacteristics;
    v17 = (NSArray *)MEMORY[0x24BDBD1A8];
    v15->_optionalCharacteristics = (NSArray *)MEMORY[0x24BDBD1A8];

    requiredCharacteristics = v15->_requiredCharacteristics;
    v15->_requiredCharacteristics = v17;

    characteristicFeatureMap = v15->_characteristicFeatureMap;
    v15->_characteristicFeatureMap = (NSDictionary *)MEMORY[0x24BDBD1B8];

    v15->_optionalServiceLabelIndexIncluded = a6;
  }

  return v15;
}

- (HMMTRHAPServiceDescription)initWithType:(id)a3 endpoint:(id)a4 name:(id)a5
{
  return -[HMMTRHAPServiceDescription initWithType:endpoint:name:optionalServiceLabelIndexIncluded:](self, "initWithType:endpoint:name:optionalServiceLabelIndexIncluded:", a3, a4, a5, 0);
}

- (void)addOptionalCharacteristic:(id)a3
{
  NSArray *v4;
  NSArray *optionalCharacteristics;
  id v6;

  -[HMMTRHAPServiceDescription padCharacteristicIDWithZeros:](self, "padCharacteristicIDWithZeros:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_optionalCharacteristics);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v4, "addObject:", v6);
    optionalCharacteristics = self->_optionalCharacteristics;
    self->_optionalCharacteristics = v4;

  }
}

- (void)addMandatoryCharacteristic:(id)a3
{
  NSArray *v4;
  NSArray *requiredCharacteristics;
  id v6;

  -[HMMTRHAPServiceDescription padCharacteristicIDWithZeros:](self, "padCharacteristicIDWithZeros:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_requiredCharacteristics);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v4, "addObject:", v6);
    requiredCharacteristics = self->_requiredCharacteristics;
    self->_requiredCharacteristics = v4;

  }
}

- (void)addFeatureMapForCharacteristic:(id)a3 featureMap:(id)a4
{
  void *v6;
  NSDictionary *v7;
  NSDictionary *characteristicFeatureMap;
  id v9;

  v9 = a4;
  -[HMMTRHAPServiceDescription padCharacteristicIDWithZeros:](self, "padCharacteristicIDWithZeros:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_characteristicFeatureMap);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", v9, v6);
    characteristicFeatureMap = self->_characteristicFeatureMap;
    self->_characteristicFeatureMap = v7;

  }
}

- (void)removeCharacteristic:(id)a3
{
  NSArray *v4;
  NSArray *requiredCharacteristics;
  NSArray *v6;
  NSArray *optionalCharacteristics;
  void *v8;
  NSDictionary *v9;
  NSDictionary *characteristicFeatureMap;
  id v11;

  -[HMMTRHAPServiceDescription padCharacteristicIDWithZeros:](self, "padCharacteristicIDWithZeros:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (-[NSArray containsObject:](self->_requiredCharacteristics, "containsObject:", v11))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_requiredCharacteristics);
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      -[NSArray removeObject:](v4, "removeObject:", v11);
      requiredCharacteristics = self->_requiredCharacteristics;
      self->_requiredCharacteristics = v4;

    }
    if (-[NSArray containsObject:](self->_optionalCharacteristics, "containsObject:", v11))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_optionalCharacteristics);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      -[NSArray removeObject:](v6, "removeObject:", v11);
      optionalCharacteristics = self->_optionalCharacteristics;
      self->_optionalCharacteristics = v6;

    }
    -[NSDictionary objectForKeyedSubscript:](self->_characteristicFeatureMap, "objectForKeyedSubscript:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_characteristicFeatureMap);
      v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary removeObjectForKey:](v9, "removeObjectForKey:", v11);
      characteristicFeatureMap = self->_characteristicFeatureMap;
      self->_characteristicFeatureMap = v9;

    }
  }

}

- (id)padCharacteristicIDWithZeros:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if ((unint64_t)(v4 - 1) > 7)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", off_250F1F7E8[v4 - 1], v3, "-0000-1000-8000-0026BB765291");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[8];

  v26[7] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRHAPServiceDescription serviceType](self, "serviceType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("ServiceType"), v25);
  v26[0] = v24;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRHAPServiceDescription endpoint](self, "endpoint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Endpoint"), v23);
  v26[1] = v22;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRHAPServiceDescription name](self, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Name"), v21);
  v26[2] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRHAPServiceDescription requiredCharacteristics](self, "requiredCharacteristics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("RequiredCharacteristics"), v8);
  v26[3] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRHAPServiceDescription optionalCharacteristics](self, "optionalCharacteristics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("OptionalCharacteristics"), v11);
  v26[4] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRHAPServiceDescription characteristicFeatureMap](self, "characteristicFeatureMap");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("CharacteristicFeatureMap"), v14);
  v26[5] = v15;
  v16 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMMTRHAPServiceDescription optionalServiceLabelIndexIncluded](self, "optionalServiceLabelIndexIncluded"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("OptionalServiceLabelIndexIncluded"), v17);
  v26[6] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)endpoint
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)requiredCharacteristics
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)optionalCharacteristics
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)characteristicFeatureMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)optionalServiceLabelIndexIncluded
{
  return self->_optionalServiceLabelIndexIncluded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicFeatureMap, 0);
  objc_storeStrong((id *)&self->_optionalCharacteristics, 0);
  objc_storeStrong((id *)&self->_requiredCharacteristics, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end
