@implementation RTSource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTSource)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RTSource;
  return -[RTSource init](&v4, sel_init, a3);
}

- (id)description
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)isEqual:(id)a3
{
  RTSource *v4;
  RTSource *v5;
  char v6;

  v4 = (RTSource *)a3;
  v5 = v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (v4)
  {
    v6 = -[RTSource isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class());
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

@end
