@implementation ISIcnsIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISIcnsIcon)initWithContentOfURL:(id)a3
{
  void *v4;
  ISIcnsIcon *v5;
  ISIcnsIcon *v6;
  NSData *icnsData;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithData:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)ISIcnsIcon;
  v5 = -[ISConcreteIcon initWithDigest:](&v9, sel_initWithDigest_, v4);
  v6 = v5;
  if (v5)
  {
    icnsData = v5->_icnsData;
    v5->_icnsData = 0;

  }
  return v6;
}

- (ISIcnsIcon)initWithIcns:(id)a3
{
  id v5;
  void *v6;
  ISIcnsIcon *v7;
  ISIcnsIcon *v8;
  NSData *icnsData;
  objc_super v11;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithData:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)ISIcnsIcon;
  v7 = -[ISConcreteIcon initWithDigest:](&v11, sel_initWithDigest_, v6);
  v8 = v7;
  if (v7)
  {
    icnsData = v7->_icnsData;
    v7->_icnsData = 0;

    objc_storeStrong((id *)&v8->_internalICNS, a3);
  }

  return v8;
}

- (ISIcnsIcon)initWithIcnsData:(id)a3
{
  id v4;
  void *v5;
  ISIcnsIcon *v6;
  uint64_t v7;
  NSData *icnsData;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)ISIcnsIcon;
  v6 = -[ISConcreteIcon initWithDigest:](&v10, sel_initWithDigest_, v5);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    icnsData = v6->_icnsData;
    v6->_icnsData = (NSData *)v7;

  }
  return v6;
}

- (ISIcnsIcon)initWithCoder:(id)a3
{
  id v4;
  ISIcnsIcon *v5;
  uint64_t v6;
  NSData *icnsData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISIcnsIcon;
  v5 = -[ISConcreteIcon initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icnsData"));
    v6 = objc_claimAutoreleasedReturnValue();
    icnsData = v5->_icnsData;
    v5->_icnsData = (NSData *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISIcnsIcon;
  v4 = a3;
  -[ISConcreteIcon encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_icnsData, CFSTR("icnsData"), v5.receiver, v5.super_class);

}

- (ISIcns)icns
{
  return 0;
}

- (id)makeResourceProvider
{
  return 0;
}

- (NSData)icnsData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (ISIcns)internalICNS
{
  return (ISIcns *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInternalICNS:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalICNS, 0);
  objc_storeStrong((id *)&self->_icnsData, 0);
}

@end
