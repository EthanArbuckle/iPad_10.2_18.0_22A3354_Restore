@implementation CNCardStaticIdentityGroupItem

- (CNCardStaticIdentityGroupItem)initWithIdentity:(id)a3
{
  id v5;
  CNCardStaticIdentityGroupItem *v6;
  CNCardStaticIdentityGroupItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNCardStaticIdentityGroupItem;
  v6 = -[CNCardStaticIdentityGroupItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identity, a3);

  return v7;
}

- (NSString)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
