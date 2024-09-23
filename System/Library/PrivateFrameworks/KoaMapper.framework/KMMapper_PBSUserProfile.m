@implementation KMMapper_PBSUserProfile

- (KMMapper_PBSUserProfile)init
{
  KMMapper_PBSUserProfile *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  uint64_t v5;
  NSNumber *alternativeItemIdKey;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KMMapper_PBSUserProfile;
  v2 = -[KMMapper_PBSUserProfile init](&v8, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v3;

    KVAdditionalFieldTypeToNumber();
    v5 = objc_claimAutoreleasedReturnValue();
    alternativeItemIdKey = v2->_alternativeItemIdKey;
    v2->_alternativeItemIdKey = (NSNumber *)v5;

  }
  return v2;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  return 0;
}

- (int64_t)targetItemType
{
  return 20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeItemIdKey, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end
