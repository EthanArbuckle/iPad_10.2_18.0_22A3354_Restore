@implementation FigAssetVariantQualifierObjC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigAssetVariantQualifierObjC)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FigAssetVariantQualifierObjC;
  return -[FigAssetVariantQualifierObjC init](&v4, sel_init, a3);
}

@end
