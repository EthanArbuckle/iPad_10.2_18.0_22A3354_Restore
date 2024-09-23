@implementation HMDSunriseSunsetTimePeriodElement

- (HMDSunriseSunsetTimePeriodElement)initWithSignificantEvent:(id)a3 offset:(id)a4
{
  id v7;
  id v8;
  HMDSunriseSunsetTimePeriodElement *v9;
  HMDSunriseSunsetTimePeriodElement *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDSunriseSunsetTimePeriodElement;
  v9 = -[HMDSunriseSunsetTimePeriodElement init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_significantEvent, a3);
    objc_storeStrong((id *)&v10->_offset, a4);
  }

  return v10;
}

- (HMDSunriseSunsetTimePeriodElement)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDSunriseSunsetTimePeriodElement *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "doesTypeMatch:against:", v4, v6);

  if ((_DWORD)v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDSSTPE.ck.se"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMDSSTPE.ck.o"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[HMDSunriseSunsetTimePeriodElement initWithSignificantEvent:offset:](self, "initWithSignificantEvent:offset:", v7, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)serializedRegistrationForRemoteMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDSunriseSunsetTimePeriodElement;
  -[HMDTimePeriodElement serializedRegistrationForRemoteMessage](&v9, sel_serializedRegistrationForRemoteMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDSunriseSunsetTimePeriodElement significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("HMDSSTPE.ck.se"));

  -[HMDSunriseSunsetTimePeriodElement offset](self, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("HMDSSTPE.ck.o"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDSunriseSunsetTimePeriodElement significantEvent](self, "significantEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "significantEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[HMDSunriseSunsetTimePeriodElement offset](self, "offset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "offset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDSunriseSunsetTimePeriodElement significantEvent](self, "significantEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDSunriseSunsetTimePeriodElement significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDSSTPE.ck.se"));

  -[HMDSunriseSunsetTimePeriodElement offset](self, "offset");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMDSSTPE.ck.o"));

}

- (HMDSunriseSunsetTimePeriodElement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDSunriseSunsetTimePeriodElement *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDSSTPE.ck.se"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDSSTPE.ck.o"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMDSunriseSunsetTimePeriodElement initWithSignificantEvent:offset:](self, "initWithSignificantEvent:offset:", v5, v6);
  return v7;
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
  -[HMDSunriseSunsetTimePeriodElement significantEvent](self, "significantEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Significant Event"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDSunriseSunsetTimePeriodElement offset](self, "offset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Offset"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)significantEvent
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDateComponents)offset
{
  return (NSDateComponents *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

+ (id)type
{
  return CFSTR("HMDSSTPE.type");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
