@implementation MNUserOptions

- (MNUserOptions)init
{
  MNUserOptions *v2;
  MNUserOptions *v3;
  MNUserOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNUserOptions;
  v2 = -[MNUserOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MNUserOptions init](+[MNUserOptions allocWithZone:](MNUserOptions, "allocWithZone:", a3), "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNUserOptions)initWithCoder:(id)a3
{
  MNUserOptions *v3;
  MNUserOptions *v4;
  MNUserOptions *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MNUserOptions;
  v3 = -[MNUserOptions init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

@end
