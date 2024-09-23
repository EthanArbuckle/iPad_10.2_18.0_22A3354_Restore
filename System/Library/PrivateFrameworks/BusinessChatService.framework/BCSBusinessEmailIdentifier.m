@implementation BCSBusinessEmailIdentifier

- (BCSBusinessEmailIdentifier)initWithEmail:(id)a3 fullDomain:(id)a4 topLevelDomain:(id)a5
{
  id v9;
  id v10;
  id v11;
  BCSBusinessEmailIdentifier *v12;
  BCSBusinessEmailIdentifier *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BCSBusinessEmailIdentifier;
  v12 = -[BCSBusinessEmailIdentifier init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_email, a3);
    objc_storeStrong((id *)&v13->_fullDomain, a4);
    objc_storeStrong((id *)&v13->_topLevelDomain, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[BCSBusinessEmailIdentifier email](self, "email");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)v4[1];
    v4[1] = v6;

    -[BCSBusinessEmailIdentifier fullDomain](self, "fullDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    v10 = (void *)v4[2];
    v4[2] = v9;

    -[BCSBusinessEmailIdentifier topLevelDomain](self, "topLevelDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    v13 = (void *)v4[3];
    v4[3] = v12;

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *email;
  id v5;

  email = self->_email;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", email, CFSTR("Email"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fullDomain, CFSTR("FullDomain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topLevelDomain, CFSTR("TopLevelDomain"));

}

- (BCSBusinessEmailIdentifier)initWithCoder:(id)a3
{
  id v4;
  BCSBusinessEmailIdentifier *v5;
  uint64_t v6;
  NSString *email;
  uint64_t v8;
  NSString *fullDomain;
  uint64_t v10;
  NSString *topLevelDomain;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCSBusinessEmailIdentifier;
  v5 = -[BCSBusinessEmailIdentifier init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Email"));
    v6 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FullDomain"));
    v8 = objc_claimAutoreleasedReturnValue();
    fullDomain = v5->_fullDomain;
    v5->_fullDomain = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TopLevelDomain"));
    v10 = objc_claimAutoreleasedReturnValue();
    topLevelDomain = v5->_topLevelDomain;
    v5->_topLevelDomain = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)fullDomain
{
  return self->_fullDomain;
}

- (void)setFullDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)topLevelDomain
{
  return self->_topLevelDomain;
}

- (void)setTopLevelDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLevelDomain, 0);
  objc_storeStrong((id *)&self->_fullDomain, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

@end
