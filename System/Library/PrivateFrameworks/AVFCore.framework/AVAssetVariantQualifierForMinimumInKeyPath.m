@implementation AVAssetVariantQualifierForMinimumInKeyPath

- (BOOL)_validateKeyPath:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0CC3210], "validateKeyPathForMinMaxQualifiers:", a3);
}

- (AVAssetVariantQualifierForMinimumInKeyPath)initWithFigAssetVariantQualifierForMinimumInKeyPath:(id)a3
{
  AVAssetVariantQualifierForMinimumInKeyPath *v5;
  AVAssetVariantQualifierForMinimumInKeyPath *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVAssetVariantQualifierForMinimumInKeyPath;
  v5 = -[AVAssetVariantQualifier initWithVariant:](&v17, sel_initWithVariant_, 0);
  if (v5)
  {
    if (!-[AVAssetVariantQualifierForMinimumInKeyPath _validateKeyPath:](v5, "_validateKeyPath:", objc_msgSend(a3, "_keyPath")))
    {
      v7 = v5;
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = objc_msgSend(a3, "_keyPath");
      v16 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)CFSTR("invalid KeyPath entered: %@"), v11, v12, v13, v14, v15, v10), 0);
      objc_exception_throw(v16);
    }
    v5->_figAssetVariantQualifier = (FigAssetVariantQualifierForMinimumInKeyPathObjC *)a3;
  }
  return v5;
}

- (id)_figAssetVariantQualifier
{
  return self->_figAssetVariantQualifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AVAssetVariantQualifierForMinimumInKeyPath initWithFigAssetVariantQualifierForMinimumInKeyPath:]([AVAssetVariantQualifierForMinimumInKeyPath alloc], "initWithFigAssetVariantQualifierForMinimumInKeyPath:", self->_figAssetVariantQualifier);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantQualifierForMinimumInKeyPath;
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
  v12.super_class = (Class)AVAssetVariantQualifierForMinimumInKeyPath;
  -[AVAssetVariantQualifier encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", self->_figAssetVariantQualifier, CFSTR("keyPath"));
}

- (AVAssetVariantQualifierForMinimumInKeyPath)initWithCoder:(id)a3
{
  AVAssetVariantQualifierForMinimumInKeyPath *v6;
  AVAssetVariantQualifierForMinimumInKeyPath *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v8 = self;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v9, v10, v11, v12, v13, (uint64_t)v15.receiver), 0);
    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVAssetVariantQualifierForMinimumInKeyPath;
  v6 = -[AVAssetVariantQualifier initWithCoder:](&v15, sel_initWithCoder_, a3);
  if (v6)
    v6->_figAssetVariantQualifier = (FigAssetVariantQualifierForMinimumInKeyPathObjC *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyPath"));
  return v6;
}

@end
