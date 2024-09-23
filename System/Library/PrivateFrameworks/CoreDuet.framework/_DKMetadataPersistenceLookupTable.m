@implementation _DKMetadataPersistenceLookupTable

+ (id)keyToIndex
{
  objc_opt_self();
  if (keyToIndex_onceToken != -1)
    dispatch_once(&keyToIndex_onceToken, &__block_literal_global_523);
  return (id)keyToIndex_dict;
}

+ (id)keyToAttribute
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___DKMetadataPersistenceLookupTable_keyToAttribute__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (keyToAttribute_onceToken != -1)
    dispatch_once(&keyToAttribute_onceToken, block);
  return (id)keyToAttribute_dict;
}

+ (id)attributeToKey
{
  objc_opt_self();
  if (attributeToKey_onceToken != -1)
    dispatch_once(&attributeToKey_onceToken, &__block_literal_global_0);
  return (id)attributeToKey_dict;
}

+ (id)indexToKey
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___DKMetadataPersistenceLookupTable_indexToKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (indexToKey_onceToken != -1)
    dispatch_once(&indexToKey_onceToken, block);
  return (id)indexToKey_dict;
}

@end
