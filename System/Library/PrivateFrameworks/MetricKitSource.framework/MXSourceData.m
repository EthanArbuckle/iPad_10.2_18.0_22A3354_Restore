@implementation MXSourceData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MXSourceData)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXSourceData;
  return -[MXSourceData init](&v3, sel_init);
}

- (MXSourceData)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXSourceData;
  return -[MXSourceData init](&v4, sel_init, a3);
}

@end
