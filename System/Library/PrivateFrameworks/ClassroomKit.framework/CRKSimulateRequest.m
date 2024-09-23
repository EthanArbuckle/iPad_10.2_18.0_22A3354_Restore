@implementation CRKSimulateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKSimulateRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKSimulateRequest IDSLocalConfiguration](self, "IDSLocalConfiguration", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("IDSLocalConfiguration"));

}

- (CRKSimulateRequest)initWithCoder:(id)a3
{
  id v4;
  CRKSimulateRequest *v5;
  void *v6;
  uint64_t v7;
  CRKIDSLocalSimulationConfiguration *IDSLocalConfiguration;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKSimulateRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("IDSLocalConfiguration"));
    v7 = objc_claimAutoreleasedReturnValue();
    IDSLocalConfiguration = v5->_IDSLocalConfiguration;
    v5->_IDSLocalConfiguration = (CRKIDSLocalSimulationConfiguration *)v7;

  }
  return v5;
}

- (CRKIDSLocalSimulationConfiguration)IDSLocalConfiguration
{
  return self->_IDSLocalConfiguration;
}

- (void)setIDSLocalConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_IDSLocalConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IDSLocalConfiguration, 0);
}

@end
