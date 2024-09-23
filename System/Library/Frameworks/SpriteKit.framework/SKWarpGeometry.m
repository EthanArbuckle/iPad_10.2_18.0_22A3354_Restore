@implementation SKWarpGeometry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKWarpGeometry)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKWarpGeometry;
  return -[SKWarpGeometry init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(SKWarpGeometry);
}

- (BOOL)isIdentityWarp
{
  return 0;
}

@end
