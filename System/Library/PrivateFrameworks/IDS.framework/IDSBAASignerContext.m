@implementation IDSBAASignerContext

- (IDSBAASignerContext)initWithSigningDigest:(id)a3
{
  id v5;
  IDSBAASignerContext *v6;
  IDSBAASignerContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSBAASignerContext;
  v6 = -[IDSBAASignerContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_signingDigest, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IDSBAASignerContext signingDigest](self, "signingDigest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SigningDigest"));

}

- (IDSBAASignerContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  IDSBAASignerContext *v6;
  IDSBAASignerContext *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SigningDigest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)IDSBAASignerContext;
  v6 = -[IDSBAASignerContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_signingDigest, v5);

  return v7;
}

- (NSString)signingDigest
{
  return self->_signingDigest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingDigest, 0);
}

@end
