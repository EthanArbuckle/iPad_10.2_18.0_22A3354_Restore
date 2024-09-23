@implementation CNSmartPropertyFetcher

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSmartPropertyFetcher)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNSmartPropertyFetcher;
  return -[CNSmartPropertyFetcher init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)_cn_requiredKeys
{
  return +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
}

- (id)_cn_optionalKeys
{
  return +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
}

- (id)_cn_ignorableKeys
{
  return +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
}

@end
