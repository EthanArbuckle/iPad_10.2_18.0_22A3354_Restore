@implementation CNUIPRLikenessResolverOptions

- (CNUIPRLikenessResolverOptions)initWithMonogramColor:(id)a3
{
  id v5;
  CNUIPRLikenessResolverOptions *v6;
  CNUIPRLikenessResolverOptions *v7;
  CNUIPRLikenessResolverOptions *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIPRLikenessResolverOptions;
  v6 = -[CNUIPRLikenessResolverOptions init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_monogramColor, a3);
    v8 = v7;
  }

  return v7;
}

- (PRMonogramColor)monogramColor
{
  return self->_monogramColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramColor, 0);
}

@end
