@implementation HKMCCachedPregnancyModel

- (HKMCCachedPregnancyModel)initWithModel:(id)a3
{
  id v5;
  HKMCCachedPregnancyModel *v6;
  HKMCCachedPregnancyModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMCCachedPregnancyModel;
  v6 = -[HKMCCachedPregnancyModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cachedModel, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_cachedModel, CFSTR("CachedPregnancyModel"));
}

- (HKMCCachedPregnancyModel)initWithCoder:(id)a3
{
  id v4;
  HKMCCachedPregnancyModel *v5;
  uint64_t v6;
  HKMCPregnancyModel *cachedModel;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMCCachedPregnancyModel;
  v5 = -[HKMCCachedPregnancyModel init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CachedPregnancyModel"));
    v6 = objc_claimAutoreleasedReturnValue();
    cachedModel = v5->_cachedModel;
    v5->_cachedModel = (HKMCPregnancyModel *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HKMCCachedPregnancyModel *v4;
  HKMCPregnancyModel *cachedModel;
  HKMCPregnancyModel *v6;
  char v7;

  v4 = (HKMCCachedPregnancyModel *)a3;
  if (self == v4)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  cachedModel = self->_cachedModel;
  v6 = v4->_cachedModel;
  if (cachedModel == v6)
  {
LABEL_6:
    v7 = 1;
    goto LABEL_8;
  }
  if (!v6)
    goto LABEL_7;
  v7 = -[HKMCPregnancyModel isEqual:](cachedModel, "isEqual:");
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  return -[HKMCPregnancyModel hash](self->_cachedModel, "hash");
}

- (NSString)hk_redactedDescription
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HKMCPregnancyModel)cachedModel
{
  return self->_cachedModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedModel, 0);
  objc_storeStrong((id *)&self->hk_redactedDescription, 0);
}

@end
