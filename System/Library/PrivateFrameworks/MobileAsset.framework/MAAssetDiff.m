@implementation MAAssetDiff

+ (id)requireSameAssetTypeAndAssetId
{
  __int16 v2;

  v2 = categoryInverse(3);
  return allowableDiffFromCategories(v2);
}

+ (id)requireSameAssetTypeAndDownloadContent
{
  __int16 v2;

  v2 = categoryInverse(33);
  return allowableDiffFromCategories(v2);
}

+ (id)requireSameAssetTypeAndAllAttributes
{
  return allowableDiffFromCategories(0);
}

+ (id)defaultAllowedDifferences
{
  return allowableDiffFromCategories(0);
}

+ (id)allowEverythingDifferent
{
  __int16 v2;

  v2 = categoryInverse(0);
  return allowableDiffFromCategories(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MAAssetDiff)initWithCoder:(id)a3
{
  id v4;
  MAAssetDiff *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAAssetDiff;
  v5 = -[MAAssetDiff init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diffBits"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_diffRaw = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diffMask"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mask = objc_msgSend(v7, "unsignedIntegerValue");

    v5->_diff = v5->_mask & v5->_diffRaw;
  }

  return v5;
}

- (MAAssetDiff)initWithPlist:(id)a3
{
  id v4;
  MAAssetDiff *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAAssetDiff;
  v5 = -[MAAssetDiff init](&v9, sel_init);
  if (v5)
  {
    getPlistNumber(v4, CFSTR("diffBits"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_diffRaw = objc_msgSend(v6, "unsignedIntegerValue");

    getPlistNumber(v4, CFSTR("diffMask"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mask = objc_msgSend(v7, "unsignedIntegerValue");

    v5->_diff = v5->_mask & v5->_diffRaw;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t diff;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  diff = self->_diff;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", diff);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("diffBits"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mask);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("diffMask"));

}

- (id)encodeAsPlist
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_diff);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("diffBits"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mask);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("diffMask"));

  return v3;
}

- (id)initDifferentAssetType:(BOOL)a3 assetId:(BOOL)a4 attributes:(BOOL)a5 assetIdAttributes:(BOOL)a6 dynamicAssetId:(BOOL)a7 nonIdAttributes:(BOOL)a8 content:(BOOL)a9 url:(BOOL)a10 policy:(BOOL)a11
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v17;

  v11 = a8;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  if (!a3)
  {
    v17 = 0;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v17 = categoryUnion(0, 1);
  if (v15)
LABEL_5:
    v17 = categoryUnion(v17, 2);
LABEL_6:
  if (v14)
  {
    v17 = categoryUnion(v17, 4);
    if (!v13)
    {
LABEL_8:
      if (!v11)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  else if (!v13)
  {
    goto LABEL_8;
  }
  v17 = categoryUnion(v17, 8);
  if (!v11)
  {
LABEL_9:
    if (!a9)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v17 = categoryUnion(v17, 16);
  if (!a9)
  {
LABEL_10:
    if (!a10)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  v17 = categoryUnion(v17, 32);
  if (!a10)
  {
LABEL_11:
    if (!a11)
      goto LABEL_12;
LABEL_20:
    v17 = categoryUnion(v17, 128);
    if (!v12)
      return -[MAAssetDiff initFromDiff:](self, "initFromDiff:", v17);
    goto LABEL_13;
  }
LABEL_19:
  v17 = categoryUnion(v17, 64);
  if (a11)
    goto LABEL_20;
LABEL_12:
  if (v12)
LABEL_13:
    v17 = categoryUnion(v17, 256);
  return -[MAAssetDiff initFromDiff:](self, "initFromDiff:", v17);
}

- (id)initFromDiff:(unint64_t)a3
{
  __int16 v3;
  MAAssetDiff *v4;
  uint64_t v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MAAssetDiff;
  v4 = -[MAAssetDiff init](&v7, sel_init);
  if (v4)
  {
    v5 = categoryClean(v3);
    v4->_mask = 511;
    v4->_diffRaw = v5;
    v4->_diff = v5 & 0x1FF;
  }
  return v4;
}

- (id)initFromInverseOfCategories:(unint64_t)a3
{
  return -[MAAssetDiff initFromDiff:](self, "initFromDiff:", categoryInverse(a3));
}

- (BOOL)isAnythingDifferent
{
  return !isCategoryNone(self->_diff);
}

- (BOOL)isSameAssetType
{
  return !isCategoryIn(1, self->_diff);
}

- (BOOL)isSameForAllAttributes
{
  return !isCategoryIn(4, self->_diff);
}

- (BOOL)isSameAssetId
{
  return !isCategoryIn(2, self->_diff);
}

- (BOOL)isSameForNonAssetIdAttributes
{
  return !isCategoryIn(16, self->_diff);
}

- (BOOL)isSameDownloadContent
{
  return !isCategoryIn(32, self->_diff);
}

- (BOOL)isSameDownloadUrl
{
  return !isCategoryIn(64, self->_diff);
}

- (BOOL)isSameDownloadPolicy
{
  return !isCategoryIn(128, self->_diff);
}

- (BOOL)hasOnlyAllowedDifferences:(id)a3
{
  int v4;
  unsigned int v5;
  __int16 v6;

  if (a3)
    v4 = objc_msgSend(a3, "category");
  else
    v4 = 0;
  v5 = categoryInverse(v4);
  v6 = categoryIntersection(self->_diff, v5);
  return isCategoryNone(v6);
}

- (unint64_t)category
{
  return self->_diff;
}

- (id)summary
{
  return categorySimpleName(self->_diff);
}

- (id)description
{
  return categoryAssessDiffAndMask(self->_diff, self->_mask);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assessment, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
