@implementation FPXServiceDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *serviceName;
  id v5;

  serviceName = self->_serviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceName, CFSTR("_serviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requiredEntitlement, CFSTR("_requiredEntitlement"));

}

- (FPXServiceDescriptor)initWithCoder:(id)a3
{
  id v4;
  FPXServiceDescriptor *v5;
  uint64_t v6;
  NSString *serviceName;
  uint64_t v8;
  NSString *requiredEntitlement;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPXServiceDescriptor;
  v5 = -[FPXServiceDescriptor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceName"));
    v6 = objc_claimAutoreleasedReturnValue();
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requiredEntitlement"));
    v8 = objc_claimAutoreleasedReturnValue();
    requiredEntitlement = v5->_requiredEntitlement;
    v5->_requiredEntitlement = (NSString *)v8;

  }
  return v5;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)requiredEntitlement
{
  return self->_requiredEntitlement;
}

- (void)setRequiredEntitlement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredEntitlement, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
