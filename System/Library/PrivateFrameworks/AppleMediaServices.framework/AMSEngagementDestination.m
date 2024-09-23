@implementation AMSEngagementDestination

- (void)setComponents:(unint64_t)a3
{
  self->_components = a3;
}

- (void)setAllowsResponse:(BOOL)a3
{
  self->_allowsResponse = a3;
}

- (AMSEngagementDestination)initWithIdentifier:(id)a3
{
  id v5;
  AMSEngagementDestination *v6;
  AMSEngagementDestination *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSEngagementDestination;
  v6 = -[AMSEngagementDestination init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_components = -1;
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AMSEngagementDestination identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kCodingKeyIdentifier"));

  objc_msgSend(v5, "encodeBool:forKey:", -[AMSEngagementDestination allowsResponse](self, "allowsResponse"), CFSTR("kCodingKeyAllowsResponse"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[AMSEngagementDestination components](self, "components"), CFSTR("kCodingKeyComponents"));

}

- (unint64_t)components
{
  return self->_components;
}

- (BOOL)allowsResponse
{
  return self->_allowsResponse;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[AMSEngagementDestination identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<AMSEngagementDestination: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (AMSEngagementDestination)initWithCoder:(id)a3
{
  id v4;
  AMSEngagementDestination *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSEngagementDestination;
  v5 = -[AMSEngagementDestination init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_allowsResponse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCodingKeyAllowsResponse"));
    v5->_components = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCodingKeyComponents"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

@end
