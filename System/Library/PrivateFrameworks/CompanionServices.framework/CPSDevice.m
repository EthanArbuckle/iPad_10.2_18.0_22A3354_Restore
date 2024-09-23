@implementation CPSDevice

- (id)_initCurrentDevice
{
  CPSDevice *v2;
  uint64_t v3;
  NSString *name;
  uint64_t v5;
  NSString *model;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSString *buildVersion;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CPSDevice;
  v2 = -[CPSDevice init](&v17, sel_init);
  if (v2)
  {
    v3 = GestaltCopyAnswer();
    name = v2->_name;
    v2->_name = (NSString *)v3;

    v5 = GestaltCopyAnswer();
    model = v2->_model;
    v2->_model = (NSString *)v5;

    v7 = GestaltGetBoolean() != 0;
    if (GestaltGetBoolean())
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "homeButtonType");

    if (v10 >= 2)
      v11 = v8;
    else
      v11 = v8 | 4;
    v12 = SBSIsSystemApertureAvailable();
    v13 = v11 | 8;
    if (!v12)
      v13 = v11;
    v2->_flags = v13;
    v14 = GestaltCopyAnswer();
    buildVersion = v2->_buildVersion;
    v2->_buildVersion = (NSString *)v14;

  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintFlags64();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("flags"));

  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_model, CFSTR("model"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_name, CFSTR("name"), 1);
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_buildVersion, CFSTR("buildVersion"), 1);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (CPSDevice)currentDevice
{
  return (CPSDevice *)-[CPSDevice _initCurrentDevice]([CPSDevice alloc], "_initCurrentDevice");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSDevice)initWithCoder:(id)a3
{
  id v4;
  CPSDevice *v5;
  void *v6;
  uint64_t v7;
  NSString *model;
  void *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  uint64_t v13;
  NSString *buildVersion;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPSDevice;
  v5 = -[CPSDevice init](&v16, sel_init);
  if (v5)
  {
    v5->_flags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flags"));
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("model"));
    v7 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("buildVersion"));
    v13 = objc_claimAutoreleasedReturnValue();
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t flags;
  id v5;

  flags = self->_flags;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", flags, CFSTR("flags"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_buildVersion, CFSTR("buildVersion"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CPSDevice *v4;
  uint64_t v5;
  NSString *model;
  uint64_t v7;
  NSString *name;
  uint64_t v9;
  NSString *buildVersion;

  v4 = objc_alloc_init(CPSDevice);
  v4->_flags = self->_flags;
  v5 = -[NSString copy](self->_model, "copy");
  model = v4->_model;
  v4->_model = (NSString *)v5;

  v7 = -[NSString copy](self->_name, "copy");
  name = v4->_name;
  v4->_name = (NSString *)v7;

  v9 = -[NSString copy](self->_buildVersion, "copy");
  buildVersion = v4->_buildVersion;
  v4->_buildVersion = (NSString *)v9;

  return v4;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
