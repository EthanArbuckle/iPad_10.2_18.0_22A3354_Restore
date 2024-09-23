@implementation CalGrantedDelegate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalGrantedDelegate)initWithCoder:(id)a3
{
  id v4;
  CalGrantedDelegate *v5;
  uint64_t v6;
  NSString *uri;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSString *preferredUserAddress;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CalGrantedDelegate;
  v5 = -[CalGrantedDelegate init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uri"));
    v6 = objc_claimAutoreleasedReturnValue();
    uri = v5->_uri;
    v5->_uri = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredUserAddress"));
    v10 = objc_claimAutoreleasedReturnValue();
    preferredUserAddress = v5->_preferredUserAddress;
    v5->_preferredUserAddress = (NSString *)v10;

    v5->_permission = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("permission"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uri;
  id v5;

  uri = self->_uri;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uri, CFSTR("uri"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferredUserAddress, CFSTR("preferredUserAddress"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_permission, CFSTR("permission"));

}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)preferredUserAddress
{
  return self->_preferredUserAddress;
}

- (void)setPreferredUserAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)permission
{
  return self->_permission;
}

- (void)setPermission:(int64_t)a3
{
  self->_permission = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredUserAddress, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
