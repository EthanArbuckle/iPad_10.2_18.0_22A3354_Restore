@implementation NSDictionary

void __99__NSDictionary_FMDVolatileMetaDataRecord__fm_dictionaryByDeeplySettingValuesForKeysWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "fm_dictionaryByDeeplySettingValuesForKeysWithDictionary:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, v10);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v10);
    }

  }
  else
  {
    objc_msgSend(v7, "setObject:forKey:", v5, v10);
  }

}

@end
