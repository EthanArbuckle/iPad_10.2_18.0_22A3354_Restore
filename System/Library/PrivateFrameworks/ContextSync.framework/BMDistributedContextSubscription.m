@implementation BMDistributedContextSubscription

- (BMDistributedContextSubscription)initWithIdentifier:(id)a3 dsl:(id)a4 subscribingDevice:(id)a5 subscribedDevice:(id)a6 configuration:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMDistributedContextSubscription *v17;
  BMDistributedContextSubscription *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMDistributedContextSubscription;
  v17 = -[BMDistributedContextSubscription init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_dsl, a4);
    objc_storeStrong((id *)&v18->_subscribingDevice, a5);
    objc_storeStrong((id *)&v18->_subscribedDevice, a6);
    objc_storeStrong((id *)&v18->_configuration, a7);
  }

  return v18;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  BMDistributedContextSubscription *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  BMDSL *dsl;
  uint64_t v11;
  NSString *subscribingDevice;
  uint64_t v13;
  NSString *subscribedDevice;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BMDistributedContextSubscriptionConfiguration *v23;
  BMDistributedContextSubscriptionConfiguration *configuration;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BMDistributedContextSubscription;
  v5 = -[BMDistributedContextSubscription init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dsl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSData bmdsl_deserialize](v8);
    v9 = objc_claimAutoreleasedReturnValue();
    dsl = v5->_dsl;
    v5->_dsl = (BMDSL *)v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subscribingDevice"));
    v11 = objc_claimAutoreleasedReturnValue();
    subscribingDevice = v5->_subscribingDevice;
    v5->_subscribingDevice = (NSString *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subscribedDevice"));
    v13 = objc_claimAutoreleasedReturnValue();
    subscribedDevice = v5->_subscribedDevice;
    v5->_subscribedDevice = (NSString *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configuration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("oneOff"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "BOOLValue"))
      v17 = 2;
    else
      v17 = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configuration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("wakeState"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v17 | objc_msgSend(v19, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configuration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("lastChangedDate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = -[BMDistributedContextSubscriptionConfiguration initWithOptions:lastChangedDate:]([BMDistributedContextSubscriptionConfiguration alloc], "initWithOptions:lastChangedDate:", v20, v22);
    configuration = v5->_configuration;
    v5->_configuration = v23;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  BMDSL *dsl;
  NSString *identifier;
  void *v5;
  void *v6;
  NSString *subscribingDevice;
  NSString *subscribedDevice;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x24BDAC8D0];
  identifier = self->_identifier;
  dsl = self->_dsl;
  v18[0] = identifier;
  v17[0] = CFSTR("identifier");
  v17[1] = CFSTR("dsl");
  -[BMDSL bmdsl_serialize]((uint64_t)dsl);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  subscribingDevice = self->_subscribingDevice;
  subscribedDevice = self->_subscribedDevice;
  v18[1] = v6;
  v18[2] = subscribingDevice;
  v17[2] = CFSTR("subscribingDevice");
  v17[3] = CFSTR("subscribedDevice");
  v18[3] = subscribedDevice;
  v17[4] = CFSTR("configuration");
  v15[0] = CFSTR("wakeState");
  -[BMDistributedContextSubscriptionConfiguration wakeState](self->_configuration, "wakeState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v15[1] = CFSTR("oneOff");
  -[BMDistributedContextSubscriptionConfiguration oneOffSubscription](self->_configuration, "oneOffSubscription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  v15[2] = CFSTR("lastChangedDate");
  -[BMDistributedContextSubscriptionConfiguration lastChangedDate](self->_configuration, "lastChangedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", self->_identifier))
    {
      objc_msgSend(v5, "subscribingDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", self->_subscribingDevice))
      {
        objc_msgSend(v5, "subscribedDevice");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", self->_subscribedDevice))
        {
          objc_msgSend(v5, "configuration");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqual:", self->_configuration);

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_subscribedDevice, "hash") ^ v3;
  v5 = -[NSString hash](self->_subscribingDevice, "hash");
  return v4 ^ v5 ^ -[BMDistributedContextSubscriptionConfiguration hash](self->_configuration, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: identifier:%@ subscribingDevice:%@ subscribedDevice:%@>"), objc_opt_class(), self->_identifier, self->_subscribingDevice, self->_subscribedDevice);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BMDSL)dsl
{
  return self->_dsl;
}

- (void)setDsl:(id)a3
{
  objc_storeStrong((id *)&self->_dsl, a3);
}

- (NSString)subscribingDevice
{
  return self->_subscribingDevice;
}

- (void)setSubscribingDevice:(id)a3
{
  objc_storeStrong((id *)&self->_subscribingDevice, a3);
}

- (NSString)subscribedDevice
{
  return self->_subscribedDevice;
}

- (void)setSubscribedDevice:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedDevice, a3);
}

- (BMDistributedContextSubscriptionConfiguration)configuration
{
  return (BMDistributedContextSubscriptionConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_subscribedDevice, 0);
  objc_storeStrong((id *)&self->_subscribingDevice, 0);
  objc_storeStrong((id *)&self->_dsl, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
