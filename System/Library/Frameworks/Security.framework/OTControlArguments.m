@implementation OTControlArguments

- (OTControlArguments)init
{
  return -[OTControlArguments initWithContainerName:contextID:altDSID:flowID:deviceSessionID:](self, "initWithContainerName:contextID:altDSID:flowID:deviceSessionID:", CFSTR("com.apple.security.keychain"), OTDefaultContext, 0, 0, 0);
}

- (OTControlArguments)initWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  OTControlArguments *v14;

  v4 = a3;
  objc_msgSend(v4, "containerName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("com.apple.security.keychain");
  objc_msgSend(v4, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = OTDefaultContext;
  objc_msgSend(v4, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceSessionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[OTControlArguments initWithContainerName:contextID:altDSID:flowID:deviceSessionID:](self, "initWithContainerName:contextID:altDSID:flowID:deviceSessionID:", v7, v10, v11, v12, v13);
  return v14;
}

- (OTControlArguments)initWithAltDSID:(id)a3
{
  return -[OTControlArguments initWithContainerName:contextID:altDSID:flowID:deviceSessionID:](self, "initWithContainerName:contextID:altDSID:flowID:deviceSessionID:", CFSTR("com.apple.security.keychain"), OTDefaultContext, a3, 0, 0);
}

- (OTControlArguments)initWithAltDSID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5
{
  return -[OTControlArguments initWithContainerName:contextID:altDSID:flowID:deviceSessionID:](self, "initWithContainerName:contextID:altDSID:flowID:deviceSessionID:", CFSTR("com.apple.security.keychain"), OTDefaultContext, a3, a4, a5);
}

- (OTControlArguments)initWithContainerName:(id)a3 contextID:(id)a4 altDSID:(id)a5
{
  return -[OTControlArguments initWithContainerName:contextID:altDSID:flowID:deviceSessionID:](self, "initWithContainerName:contextID:altDSID:flowID:deviceSessionID:", a3, a4, a5, 0, 0);
}

- (OTControlArguments)initWithContainerName:(id)a3 contextID:(id)a4 altDSID:(id)a5 flowID:(id)a6 deviceSessionID:(id)a7
{
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  OTControlArguments *v17;
  OTControlArguments *v18;
  __CFString *v19;
  objc_super v21;

  v12 = (__CFString *)a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)OTControlArguments;
  v17 = -[OTControlArguments init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    if (v12)
      v19 = v12;
    else
      v19 = CFSTR("com.apple.security.keychain");
    objc_storeStrong((id *)&v17->_containerName, v19);
    objc_storeStrong((id *)&v18->_contextID, a4);
    objc_storeStrong((id *)&v18->_altDSID, a5);
    objc_storeStrong((id *)&v18->_flowID, a6);
    objc_storeStrong((id *)&v18->_deviceSessionID, a7);
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[OTControlArguments containerName](self, "containerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTControlArguments contextID](self, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTControlArguments altDSID](self, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTControlArguments flowID](self, "flowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTControlArguments deviceSessionID](self, "deviceSessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<OTControlArguments: container:%@, context:%@, altDSID:%@, flowID: %@, deviceSessionID: %@>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[OTControlArguments contextID](self, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contextID"));

  -[OTControlArguments containerName](self, "containerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("containerName"));

  -[OTControlArguments altDSID](self, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("altDSID"));

  -[OTControlArguments flowID](self, "flowID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("flowID"));

  -[OTControlArguments deviceSessionID](self, "deviceSessionID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("deviceSessionID"));

}

- (OTControlArguments)initWithCoder:(id)a3
{
  id v4;
  OTControlArguments *v5;
  uint64_t v6;
  NSString *contextID;
  uint64_t v8;
  NSString *containerName;
  uint64_t v10;
  NSString *altDSID;
  uint64_t v12;
  NSString *flowID;
  uint64_t v14;
  NSString *deviceSessionID;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OTControlArguments;
  v5 = -[OTControlArguments init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextID"));
    v6 = objc_claimAutoreleasedReturnValue();
    contextID = v5->_contextID;
    v5->_contextID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerName"));
    v8 = objc_claimAutoreleasedReturnValue();
    containerName = v5->_containerName;
    v5->_containerName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v10 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flowID"));
    v12 = objc_claimAutoreleasedReturnValue();
    flowID = v5->_flowID;
    v5->_flowID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceSessionID"));
    v14 = objc_claimAutoreleasedReturnValue();
    deviceSessionID = v5->_deviceSessionID;
    v5->_deviceSessionID = (NSString *)v14;

  }
  return v5;
}

- (id)makeConfigurationContext
{
  OTConfigurationContext *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(OTConfigurationContext);
  -[OTControlArguments containerName](self, "containerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTConfigurationContext setContainerName:](v3, "setContainerName:", v4);

  -[OTControlArguments contextID](self, "contextID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTConfigurationContext setContext:](v3, "setContext:", v5);

  -[OTControlArguments altDSID](self, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTConfigurationContext setAltDSID:](v3, "setAltDSID:", v6);

  -[OTControlArguments flowID](self, "flowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTConfigurationContext setFlowID:](v3, "setFlowID:", v7);

  -[OTControlArguments deviceSessionID](self, "deviceSessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTConfigurationContext setDeviceSessionID:](v3, "setDeviceSessionID:", v8);

  return v3;
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContextID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainerName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)flowID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFlowID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)deviceSessionID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceSessionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSessionID, 0);
  objc_storeStrong((id *)&self->_flowID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
