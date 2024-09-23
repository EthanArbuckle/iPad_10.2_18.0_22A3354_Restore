@implementation CSSearchableItemAttributeSet

void __67__CSSearchableItemAttributeSet_IC__ic_customAttributeKeyDictionary__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)ic_customAttributeKeyDictionary_sCustomAttributeKeyDictionary;
  ic_customAttributeKeyDictionary_sCustomAttributeKeyDictionary = (uint64_t)v0;

}

void __68__CSSearchableItemAttributeSet_IC__ic_dataSourceIdentifierCustomKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("DataSourceIdentifier"), 0, 0, 0, 0);
  v1 = (void *)ic_dataSourceIdentifierCustomKey_sDataSourceIdentifierCustomKey;
  ic_dataSourceIdentifierCustomKey_sDataSourceIdentifierCustomKey = v0;

}

@end
