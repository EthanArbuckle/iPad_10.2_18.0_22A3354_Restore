@implementation CRKFetchAdHocConfigurationResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchAdHocConfigurationResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchAdHocConfigurationResultObject *v5;
  uint64_t v6;
  NSDictionary *configuration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchAdHocConfigurationResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("configuration"));
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKFetchAdHocConfigurationResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKFetchAdHocConfigurationResultObject configuration](self, "configuration", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("configuration"));

}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
