@implementation AFSyncSnapshot

- (void)encodeWithCoder:(id)a3
{
  NSString *anchor;
  id v5;

  anchor = self->_anchor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", anchor, CFSTR("_anchor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validity, CFSTR("_validity"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_count, CFSTR("_count"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_key, CFSTR("_key"));

}

- (AFSyncSnapshot)initWithCoder:(id)a3
{
  id v4;
  AFSyncSnapshot *v5;
  uint64_t v6;
  NSString *anchor;
  uint64_t v8;
  NSString *validity;
  uint64_t v10;
  NSString *key;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFSyncSnapshot;
  v5 = -[AFSyncSnapshot init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_anchor"));
    v6 = objc_claimAutoreleasedReturnValue();
    anchor = v5->_anchor;
    v5->_anchor = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_validity"));
    v8 = objc_claimAutoreleasedReturnValue();
    validity = v5->_validity;
    v5->_validity = (NSString *)v8;

    v5->_count = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_count"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_key"));
    v10 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v10;

  }
  return v5;
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)validity
{
  return self->_validity;
}

- (void)setValidity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_validity, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
