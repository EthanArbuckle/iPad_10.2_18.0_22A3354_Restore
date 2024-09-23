@implementation QLCacheFileProviderFileIdentifier

- (unint64_t)hash
{
  return -[FPItemID hash](self->_itemID, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
}

- (FPItemID)itemID
{
  return (FPItemID *)objc_getProperty(self, a2, 8, 1);
}

- (QLCacheFileProviderFileIdentifier)initWithItemID:(id)a3
{
  id v5;
  QLCacheFileProviderFileIdentifier *v6;
  QLCacheFileProviderFileIdentifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLCacheFileProviderFileIdentifier;
  v6 = -[QLCacheFileProviderFileIdentifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_itemID, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[FPItemID isEqual:](self->_itemID, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithItemID:", self->_itemID);
}

+ (Class)versionedFileIdentifierClass
{
  return (Class)objc_opt_class();
}

+ (NSMutableSet)knownFileProviderIdentifiersSoFar
{
  if (knownFileProviderIdentifiersSoFar_once != -1)
    dispatch_once(&knownFileProviderIdentifiersSoFar_once, &__block_literal_global_0);
  return (NSMutableSet *)(id)knownFileProviderIdentifiersSoFar_s;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_itemID, CFSTR("ii"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLCacheFileProviderFileIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  QLCacheFileProviderFileIdentifier *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getFPItemIDClass_softClass;
  v14 = getFPItemIDClass_softClass;
  if (!getFPItemIDClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getFPItemIDClass_block_invoke;
    v10[3] = &unk_1E5D7C1B8;
    v10[4] = &v11;
    __getFPItemIDClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ii"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[QLCacheFileProviderFileIdentifier initWithItemID:](self, "initWithItemID:", v7);

  return v8;
}

void __70__QLCacheFileProviderFileIdentifier_knownFileProviderIdentifiersSoFar__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)knownFileProviderIdentifiersSoFar_s;
  knownFileProviderIdentifiersSoFar_s = (uint64_t)v0;

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<uFI:%@>"), self->_itemID);
}

@end
