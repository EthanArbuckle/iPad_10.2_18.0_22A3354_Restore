@implementation CMContinuityCaptureUIConfiguration

- (CMContinuityCaptureUIConfiguration)initWithCoder:(id)a3
{
  id v4;
  CMContinuityCaptureUIConfiguration *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSString *clientName;
  uint64_t v10;
  NSNumber *placementStepSkipped;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CMContinuityCaptureUIConfiguration;
  v5 = -[CMContinuityCaptureUIConfiguration init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientName"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v8;

    v5->_clientDeviceModel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientDeviceModel"));
    v5->_compositeState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("compositeState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placementStepSkipped"));
    v10 = objc_claimAutoreleasedReturnValue();
    placementStepSkipped = v5->_placementStepSkipped;
    v5->_placementStepSkipped = (NSNumber *)v10;

    v5->_isDedicated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDedicated"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CMContinuityCaptureUIConfiguration applicationIdentifier](self, "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("applicationIdentifier"));

  -[CMContinuityCaptureUIConfiguration clientName](self, "clientName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("clientName"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[CMContinuityCaptureUIConfiguration clientDeviceModel](self, "clientDeviceModel"), CFSTR("clientDeviceModel"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[CMContinuityCaptureUIConfiguration compositeState](self, "compositeState"), CFSTR("compositeState"));
  -[CMContinuityCaptureUIConfiguration placementStepSkipped](self, "placementStepSkipped");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("placementStepSkipped"));

  objc_msgSend(v7, "encodeBool:forKey:", -[CMContinuityCaptureUIConfiguration isDedicated](self, "isDedicated"), CFSTR("isDedicated"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMContinuityCaptureUIConfiguration applicationIdentifier](self, "applicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", applicationIdentifier=%@"), v7);

  -[CMContinuityCaptureUIConfiguration clientName](self, "clientName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", clientName=%@"), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR(", clientDeviceModel=%ld"), -[CMContinuityCaptureUIConfiguration clientDeviceModel](self, "clientDeviceModel"));
  objc_msgSend(v6, "appendFormat:", CFSTR(", compositeState=%ld"), -[CMContinuityCaptureUIConfiguration compositeState](self, "compositeState"));
  -[CMContinuityCaptureUIConfiguration placementStepSkipped](self, "placementStepSkipped");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", placementSkipped=%@"), v9);

  objc_msgSend(v6, "appendFormat:", CFSTR(", isDedicated=%d"), -[CMContinuityCaptureUIConfiguration isDedicated](self, "isDedicated"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CMContinuityCaptureUIConfiguration applicationIdentifier](self, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setApplicationIdentifier:", v5);

  -[CMContinuityCaptureUIConfiguration clientName](self, "clientName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientName:", v6);

  objc_msgSend(v4, "setClientDeviceModel:", -[CMContinuityCaptureUIConfiguration clientDeviceModel](self, "clientDeviceModel"));
  objc_msgSend(v4, "setCompositeState:", -[CMContinuityCaptureUIConfiguration compositeState](self, "compositeState"));
  -[CMContinuityCaptureUIConfiguration placementStepSkipped](self, "placementStepSkipped");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlacementStepSkipped:", v7);

  objc_msgSend(v4, "setIsDedicated:", -[CMContinuityCaptureUIConfiguration isDedicated](self, "isDedicated"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CMContinuityCaptureUIConfiguration *v4;
  CMContinuityCaptureUIConfiguration *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  _BOOL4 v18;

  v4 = (CMContinuityCaptureUIConfiguration *)a3;
  if (v4 == self)
  {
    LOBYTE(v16) = 1;
  }
  else if (-[CMContinuityCaptureUIConfiguration isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[CMContinuityCaptureUIConfiguration applicationIdentifier](v5, "applicationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureUIConfiguration applicationIdentifier](self, "applicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (!v8)
      goto LABEL_8;
    -[CMContinuityCaptureUIConfiguration clientName](v5, "clientName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureUIConfiguration clientName](self, "clientName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
    v12 = -[CMContinuityCaptureUIConfiguration clientDeviceModel](v5, "clientDeviceModel");
    if (v12 != -[CMContinuityCaptureUIConfiguration clientDeviceModel](self, "clientDeviceModel"))
      goto LABEL_8;
    v13 = -[CMContinuityCaptureUIConfiguration compositeState](v5, "compositeState");
    if (v13 == -[CMContinuityCaptureUIConfiguration compositeState](self, "compositeState")
      && (-[CMContinuityCaptureUIConfiguration placementStepSkipped](v5, "placementStepSkipped"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          -[CMContinuityCaptureUIConfiguration placementStepSkipped](self, "placementStepSkipped"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v14 == v15))
    {
      v18 = -[CMContinuityCaptureUIConfiguration isDedicated](v5, "isDedicated");
      v16 = v18 ^ -[CMContinuityCaptureUIConfiguration isDedicated](self, "isDedicated") ^ 1;
    }
    else
    {
LABEL_8:
      LOBYTE(v16) = 0;
    }

  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)clientDeviceModel
{
  return self->_clientDeviceModel;
}

- (void)setClientDeviceModel:(int64_t)a3
{
  self->_clientDeviceModel = a3;
}

- (int64_t)compositeState
{
  return self->_compositeState;
}

- (void)setCompositeState:(int64_t)a3
{
  self->_compositeState = a3;
}

- (NSNumber)placementStepSkipped
{
  return self->_placementStepSkipped;
}

- (void)setPlacementStepSkipped:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isDedicated
{
  return self->_isDedicated;
}

- (void)setIsDedicated:(BOOL)a3
{
  self->_isDedicated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placementStepSkipped, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
