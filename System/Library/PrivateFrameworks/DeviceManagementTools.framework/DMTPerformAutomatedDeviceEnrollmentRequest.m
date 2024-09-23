@implementation DMTPerformAutomatedDeviceEnrollmentRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DMTPerformAutomatedDeviceEnrollmentRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  -[DMTPerformAutomatedDeviceEnrollmentRequest nonce](self, "nonce", v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("nonce"));

  -[DMTPerformAutomatedDeviceEnrollmentRequest networkCredential](self, "networkCredential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("networkCredential"));

  -[DMTPerformAutomatedDeviceEnrollmentRequest networkPayload](self, "networkPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("networkPayload"));

  -[DMTPerformAutomatedDeviceEnrollmentRequest organizationName](self, "organizationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("organizationName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DMTPerformAutomatedDeviceEnrollmentRequest organizationType](self, "organizationType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("organizationType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DMTPerformAutomatedDeviceEnrollmentRequest automationBehavior](self, "automationBehavior"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("automationBehavior"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DMTPerformAutomatedDeviceEnrollmentRequest networkConfiguration](self, "networkConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("networkConfiguration"));

  -[DMTPerformAutomatedDeviceEnrollmentRequest mdmServerName](self, "mdmServerName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("mdmServerName"));

}

- (DMTPerformAutomatedDeviceEnrollmentRequest)initWithCoder:(id)a3
{
  id v4;
  DMTPerformAutomatedDeviceEnrollmentRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *nonce;
  void *v9;
  uint64_t v10;
  DMTNetworkCredential *networkCredential;
  void *v12;
  uint64_t v13;
  NSData *networkPayload;
  void *v15;
  uint64_t v16;
  NSString *organizationName;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *mdmServerName;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DMTPerformAutomatedDeviceEnrollmentRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("nonce"));
    v7 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("networkCredential"));
    v10 = objc_claimAutoreleasedReturnValue();
    networkCredential = v5->_networkCredential;
    v5->_networkCredential = (DMTNetworkCredential *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("networkPayload"));
    v13 = objc_claimAutoreleasedReturnValue();
    networkPayload = v5->_networkPayload;
    v5->_networkPayload = (NSData *)v13;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("organizationName"));
    v16 = objc_claimAutoreleasedReturnValue();
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organizationType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_organizationType = objc_msgSend(v18, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("automationBehavior"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_automationBehavior = objc_msgSend(v19, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkConfiguration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_networkConfiguration = objc_msgSend(v20, "integerValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("mdmServerName"));
    v22 = objc_claimAutoreleasedReturnValue();
    mdmServerName = v5->_mdmServerName;
    v5->_mdmServerName = (NSString *)v22;

  }
  return v5;
}

- (int64_t)effectiveNetworkConfiguration
{
  int64_t result;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (-[DMTPerformAutomatedDeviceEnrollmentRequest networkConfiguration](self, "networkConfiguration"))
    return -[DMTPerformAutomatedDeviceEnrollmentRequest networkConfiguration](self, "networkConfiguration");
  -[DMTPerformAutomatedDeviceEnrollmentRequest networkPayload](self, "networkPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 2;
  -[DMTPerformAutomatedDeviceEnrollmentRequest networkCredential](self, "networkCredential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "networkName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
    return 1;
  -[DMTPerformAutomatedDeviceEnrollmentRequest networkCredential](self, "networkCredential");
  result = objc_claimAutoreleasedReturnValue();
  if (result)
  {
    v8 = (void *)result;
    -[DMTPerformAutomatedDeviceEnrollmentRequest networkCredential](self, "networkCredential");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "networkName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
      return 0;
    else
      return 3;
  }
  return result;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (DMTNetworkCredential)networkCredential
{
  return self->_networkCredential;
}

- (void)setNetworkCredential:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)networkPayload
{
  return self->_networkPayload;
}

- (void)setNetworkPayload:(id)a3
{
  objc_storeStrong((id *)&self->_networkPayload, a3);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)organizationType
{
  return self->_organizationType;
}

- (void)setOrganizationType:(int64_t)a3
{
  self->_organizationType = a3;
}

- (NSString)mdmServerName
{
  return self->_mdmServerName;
}

- (void)setMdmServerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)automationBehavior
{
  return self->_automationBehavior;
}

- (void)setAutomationBehavior:(int64_t)a3
{
  self->_automationBehavior = a3;
}

- (int64_t)networkConfiguration
{
  return self->_networkConfiguration;
}

- (void)setNetworkConfiguration:(int64_t)a3
{
  self->_networkConfiguration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdmServerName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_networkPayload, 0);
  objc_storeStrong((id *)&self->_networkCredential, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end
