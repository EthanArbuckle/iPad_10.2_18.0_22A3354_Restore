@implementation FigAssetVariantQualifierForMaximumInKeyPathObjC

- (FigAssetVariantQualifierForMaximumInKeyPathObjC)initWithKeyPath:(id)a3
{
  FigAssetVariantQualifierForMaximumInKeyPathObjC *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigAssetVariantQualifierForMaximumInKeyPathObjC;
  v4 = -[FigAssetVariantQualifierForMaximumInKeyPathObjC init](&v6, sel_init);
  if (v4)
    v4->_keyPath = (NSString *)a3;
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, keyPath:%@>"), NSStringFromClass(v4), self, self->_keyPath);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigAssetVariantQualifierForMaximumInKeyPathObjC;
  -[FigAssetVariantQualifierForMaximumInKeyPathObjC dealloc](&v3, sel_dealloc);
}

- (NSString)_keyPath
{
  return self->_keyPath;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigAssetVariantQualifierForMaximumInKeyPathObjC;
  -[FigAssetVariantQualifierObjC encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_keyPath, CFSTR("keyPath"));
}

- (FigAssetVariantQualifierForMaximumInKeyPathObjC)initWithCoder:(id)a3
{
  FigAssetVariantQualifierForMaximumInKeyPathObjC *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigAssetVariantQualifierForMaximumInKeyPathObjC;
  v4 = -[FigAssetVariantQualifierObjC initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
    v4->_keyPath = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyPath"));
  return v4;
}

@end
