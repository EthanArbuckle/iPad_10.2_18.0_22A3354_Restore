@implementation CTPrivateNetworkSimInfo

- (CTPrivateNetworkSimInfo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CTPrivateNetworkSimInfo;
  return -[CTPrivateNetworkSimInfo init](&v3, sel_init);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTPrivateNetworkSimInfo csgNetworkIdentifier](self, "csgNetworkIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", csgNetworkIdentifier=%@"), v4);

  -[CTPrivateNetworkSimInfo networkIdentifier](self, "networkIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", networkIdentifier=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTPrivateNetworkSimInfo csgNetworkIdentifier](self, "csgNetworkIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCsgNetworkIdentifier:", v5);

  -[CTPrivateNetworkSimInfo networkIdentifier](self, "networkIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNetworkIdentifier:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CTPrivateNetworkSimInfo csgNetworkIdentifier](self, "csgNetworkIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("csgNetworkIdentifier"));

  -[CTPrivateNetworkSimInfo networkIdentifier](self, "networkIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("networkIdentifier"));

}

- (CTPrivateNetworkSimInfo)initWithCoder:(id)a3
{
  id v4;
  CTPrivateNetworkSimInfo *v5;
  uint64_t v6;
  NSString *csgNetworkIdentifier;
  uint64_t v8;
  NSString *networkIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTPrivateNetworkSimInfo;
  v5 = -[CTPrivateNetworkSimInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("csgNetworkIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    csgNetworkIdentifier = v5->_csgNetworkIdentifier;
    v5->_csgNetworkIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    networkIdentifier = v5->_networkIdentifier;
    v5->_networkIdentifier = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)csgNetworkIdentifier
{
  return self->_csgNetworkIdentifier;
}

- (void)setCsgNetworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_csgNetworkIdentifier, a3);
}

- (NSString)networkIdentifier
{
  return self->_networkIdentifier;
}

- (void)setNetworkIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_networkIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkIdentifier, 0);
  objc_storeStrong((id *)&self->_csgNetworkIdentifier, 0);
}

@end
