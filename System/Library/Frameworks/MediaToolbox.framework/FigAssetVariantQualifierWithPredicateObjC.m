@implementation FigAssetVariantQualifierWithPredicateObjC

- (FigAssetVariantQualifierWithPredicateObjC)initWithPredicate:(id)a3
{
  FigAssetVariantQualifierWithPredicateObjC *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigAssetVariantQualifierWithPredicateObjC;
  v4 = -[FigAssetVariantQualifierWithPredicateObjC init](&v6, sel_init);
  if (v4)
    v4->_predicate = (NSPredicate *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigAssetVariantQualifierWithPredicateObjC;
  -[FigAssetVariantQualifierWithPredicateObjC dealloc](&v3, sel_dealloc);
}

- (NSPredicate)_predicate
{
  return self->_predicate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigAssetVariantQualifierWithPredicateObjC;
  -[FigAssetVariantQualifierObjC encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));
}

- (FigAssetVariantQualifierWithPredicateObjC)initWithCoder:(id)a3
{
  FigAssetVariantQualifierWithPredicateObjC *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigAssetVariantQualifierWithPredicateObjC;
  v4 = -[FigAssetVariantQualifierObjC initWithCoder:](&v6, sel_initWithCoder_);
  FigLoadAVFDylib();
  if (v4)
    v4->_predicate = (NSPredicate *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
  return v4;
}

@end
