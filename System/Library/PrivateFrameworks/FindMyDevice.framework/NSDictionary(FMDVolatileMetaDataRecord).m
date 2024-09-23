@implementation NSDictionary(FMDVolatileMetaDataRecord)

- (id)fm_dictionaryByDeeplySettingValuesForKeysWithDictionary:()FMDVolatileMetaDataRecord
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__NSDictionary_FMDVolatileMetaDataRecord__fm_dictionaryByDeeplySettingValuesForKeysWithDictionary___block_invoke;
  v8[3] = &unk_1E829C9F0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

@end
