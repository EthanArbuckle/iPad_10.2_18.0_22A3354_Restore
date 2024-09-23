@implementation NSObject(StorageDictionaryProvider)

- (id)_musicKit_modelObjectRawStorageDictionary
{
  void *v2;

  getMPModelObjectClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "valueForKey:", CFSTR("_storage"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)musicKit_modelObjectStorageDictionary
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  Class (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  getMPModelObjectClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = a1;
    getMPModelGenericObjectClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v2;
      objc_msgSend((id)objc_opt_class(), "_musicKit_modelObjectStorageDictionaryForGenericModelObject:", v3);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2050000000;
      v6 = (void *)getMPModelStoreBrowseContentItemClass_softClass;
      v19 = getMPModelStoreBrowseContentItemClass_softClass;
      if (!getMPModelStoreBrowseContentItemClass_softClass)
      {
        v11 = MEMORY[0x24BDAC760];
        v12 = 3221225472;
        v13 = __getMPModelStoreBrowseContentItemClass_block_invoke;
        v14 = &unk_24CD1CC68;
        v15 = &v16;
        __getMPModelStoreBrowseContentItemClass_block_invoke((uint64_t)&v11);
        v6 = (void *)v17[3];
      }
      v7 = objc_retainAutorelease(v6);
      _Block_object_dispose(&v16, 8);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v3 = v2;
        objc_msgSend((id)objc_opt_class(), "_musicKit_modelObjectStorageDictionaryForStoreBrowseContentItem:", v3);
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
        v17 = &v16;
        v18 = 0x2050000000;
        v8 = (void *)getMPModelPlaylistEntryClass_softClass;
        v19 = getMPModelPlaylistEntryClass_softClass;
        if (!getMPModelPlaylistEntryClass_softClass)
        {
          v11 = MEMORY[0x24BDAC760];
          v12 = 3221225472;
          v13 = __getMPModelPlaylistEntryClass_block_invoke;
          v14 = &unk_24CD1CC68;
          v15 = &v16;
          __getMPModelPlaylistEntryClass_block_invoke((uint64_t)&v11);
          v8 = (void *)v17[3];
        }
        v9 = objc_retainAutorelease(v8);
        _Block_object_dispose(&v16, 8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = v2;
          objc_msgSend((id)objc_opt_class(), "_musicKit_modelObjectStorageDictionaryForPlaylistEntry:", v3);
        }
        else
        {
          objc_msgSend(v2, "_musicKit_innerModelObject");
          v3 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "_musicKit_modelObjectRawStorageDictionary");
        }
        v4 = objc_claimAutoreleasedReturnValue();
      }
    }
    v5 = (void *)v4;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)_musicKit_modelObjectStorageDictionaryForGenericModelObject:()StorageDictionaryProvider
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  objc_msgSend(v3, "_musicKit_innerModelObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_musicKit_modelObjectRawStorageDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("MusicKit_LegacyModelProperty_GenericType"));

  return v7;
}

+ (id)_musicKit_modelObjectStorageDictionaryForPlaylistEntry:()StorageDictionaryProvider
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  objc_msgSend(v3, "_musicKit_modelObjectRawStorageDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("MusicKit_LegacyModelPlaylistEntryType"));

  return v6;
}

+ (id)_musicKit_modelObjectStorageDictionaryForStoreBrowseContentItem:()StorageDictionaryProvider
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = +[MusicKit_SoftLinking_MPModelGenericObject rawValueForType:](MusicKit_SoftLinking_MPModelGenericObject, "rawValueForType:", +[MusicKit_SoftLinking_MPModelStoreBrowseContentItem _genericObjectTypeForItemType:](MusicKit_SoftLinking_MPModelStoreBrowseContentItem, "_genericObjectTypeForItemType:", objc_msgSend(v3, "itemType")));
  objc_msgSend(v3, "innerObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_musicKit_modelObjectRawStorageDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("MusicKit_LegacyModelProperty_GenericType"));

  return v7;
}

@end
