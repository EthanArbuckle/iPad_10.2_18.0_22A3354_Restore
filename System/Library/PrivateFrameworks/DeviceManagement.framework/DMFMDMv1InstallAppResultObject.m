@implementation DMFMDMv1InstallAppResultObject

- (DMFMDMv1InstallAppResultObject)initWithBundleIdentifier:(id)a3 state:(unint64_t)a4
{
  id v6;
  DMFMDMv1InstallAppResultObject *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFMDMv1InstallAppResultObject;
  v7 = -[CATTaskResultObject init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    v7->_state = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFMDMv1InstallAppResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFMDMv1InstallAppResultObject *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFMDMv1InstallAppResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("bundleIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = objc_msgSend(v9, "unsignedIntegerValue");

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
  v7.super_class = (Class)DMFMDMv1InstallAppResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[DMFMDMv1InstallAppResultObject bundleIdentifier](self, "bundleIdentifier", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFMDMv1InstallAppResultObject state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("state"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFMDMv1InstallAppResultObject bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tBundle Identifier : %@"), v4);

  +[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", -[DMFMDMv1InstallAppResultObject state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tState             : %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR("\n}>"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
