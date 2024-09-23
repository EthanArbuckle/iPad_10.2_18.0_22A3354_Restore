@implementation CRKSetAdHocConfigurationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetAdHocConfigurationRequest)initWithCoder:(id)a3
{
  id v4;
  CRKSetAdHocConfigurationRequest *v5;
  uint64_t v6;
  NSDictionary *configuration;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKSetAdHocConfigurationRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("configuration"));
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merge"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_merge = objc_msgSend(v8, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKSetAdHocConfigurationRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CRKSetAdHocConfigurationRequest configuration](self, "configuration", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("configuration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKSetAdHocConfigurationRequest merge](self, "merge"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("merge"));

}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)merge
{
  return self->_merge;
}

- (void)setMerge:(BOOL)a3
{
  self->_merge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
