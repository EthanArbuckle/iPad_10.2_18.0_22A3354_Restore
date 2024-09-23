@implementation ILMessageFilterCapabilitiesQueryRequest

- (ILMessageFilterCapabilitiesQueryRequest)initWithExtensionIdentifier:(id)a3
{
  id v4;
  ILMessageFilterCapabilitiesQueryRequest *v5;
  uint64_t v6;
  NSString *extensionIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ILMessageFilterCapabilitiesQueryRequest;
  v5 = -[ILMessageFilterCapabilitiesQueryRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ILMessageFilterCapabilitiesQueryRequest extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p extensionIdentifier=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[ILMessageFilterCapabilitiesQueryRequest isEqualToRequest:](self, "isEqualToRequest:", v4);

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ILMessageFilterCapabilitiesQueryRequest extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ILMessageFilterCapabilitiesQueryRequest extensionIdentifier](self, "extensionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageFilterCapabilitiesQueryRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  ILMessageFilterCapabilitiesQueryRequest *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_extensionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ILMessageFilterCapabilitiesQueryRequest initWithExtensionIdentifier:](self, "initWithExtensionIdentifier:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ILMessageFilterCapabilitiesQueryRequest extensionIdentifier](self, "extensionIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_extensionIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

@end
