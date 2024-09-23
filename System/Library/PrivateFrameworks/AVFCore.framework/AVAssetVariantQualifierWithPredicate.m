@implementation AVAssetVariantQualifierWithPredicate

- (BOOL)_validatePredicate:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v9;

  v9 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC3210]), "initWithPredicate:", a3);
  if (!v5)
  {
    v7 = 0;
    if (!a4)
      return v7;
    goto LABEL_3;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "validateWithError:", &v9);

  if (a4)
LABEL_3:
    *a4 = v9;
  return v7;
}

- (AVAssetVariantQualifierWithPredicate)initWithFigAssetVariantQualifierWithPredicate:(id)a3
{
  AVAssetVariantQualifierWithPredicate *v5;
  AVAssetVariantQualifierWithPredicate *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AVAssetVariantQualifierWithPredicate;
  v5 = -[AVAssetVariantQualifier initWithVariant:](&v18, sel_initWithVariant_, 0);
  v17 = 0;
  if (v5)
  {
    if (!-[AVAssetVariantQualifierWithPredicate _validatePredicate:error:](v5, "_validatePredicate:error:", objc_msgSend(a3, "_predicate"), &v17))
    {
      v7 = v5;
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = objc_msgSend((id)objc_msgSend(a3, "_predicate"), "debugDescription");
      v16 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)CFSTR("one of the constituent parts of %@ are not supported by AVAssetVariantQualifier error:%@"), v11, v12, v13, v14, v15, v10), 0);
      objc_exception_throw(v16);
    }
    v5->_figAssetVariantQualifier = (FigAssetVariantQualifierWithPredicateObjC *)a3;
  }
  return v5;
}

- (id)_figAssetVariantQualifier
{
  return self->_figAssetVariantQualifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AVAssetVariantQualifierWithPredicate initWithFigAssetVariantQualifierWithPredicate:]([AVAssetVariantQualifierWithPredicate alloc], "initWithFigAssetVariantQualifierWithPredicate:", self->_figAssetVariantQualifier);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantQualifierWithPredicate;
  -[AVAssetVariantQualifier dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v6, v7, v8, v9, v10, (uint64_t)v12.receiver), 0);
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVAssetVariantQualifierWithPredicate;
  -[AVAssetVariantQualifier encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", self->_figAssetVariantQualifier, CFSTR("predicate"));
}

- (AVAssetVariantQualifierWithPredicate)initWithCoder:(id)a3
{
  AVAssetVariantQualifierWithPredicate *v6;
  FigAssetVariantQualifierWithPredicateObjC *v7;
  AVAssetVariantQualifierWithPredicate *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v9 = self;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v10, v11, v12, v13, v14, (uint64_t)v16.receiver), 0);
    objc_exception_throw(v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)AVAssetVariantQualifierWithPredicate;
  v6 = -[AVAssetVariantQualifier initWithCoder:](&v16, sel_initWithCoder_, a3);
  if (v6)
  {
    v7 = (FigAssetVariantQualifierWithPredicateObjC *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
    v6->_figAssetVariantQualifier = v7;
    if (v7)
    {
      if (-[AVAssetVariantQualifierWithPredicate _validatePredicate:error:](v6, "_validatePredicate:error:", -[FigAssetVariantQualifierWithPredicateObjC _predicate](v7, "_predicate"), 0))
      {
        objc_msgSend((id)-[FigAssetVariantQualifierWithPredicateObjC _predicate](v6->_figAssetVariantQualifier, "_predicate"), "allowEvaluation");
      }
    }
  }
  return v6;
}

@end
