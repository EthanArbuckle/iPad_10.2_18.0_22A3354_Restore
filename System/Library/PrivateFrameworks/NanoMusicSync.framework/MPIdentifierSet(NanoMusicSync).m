@implementation MPIdentifierSet(NanoMusicSync)

- (id)nms_universalStoreLookupID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "universalStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "globalPlaylistID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "universalStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithLongLong:", objc_msgSend(v7, "adamID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MPStoreItemMetadataStringNormalizeStoreIDValue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v5 = v9;
    }
    else
    {
      objc_msgSend(a1, "universalStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "universalCloudLibraryID");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (id)nms_syncInfoPlaylistIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "universalStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "globalPlaylistID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "universalStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "globalPlaylistID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "personalizedStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "cloudID");

    v8 = (void *)MEMORY[0x24BDD16E0];
    if (v7)
    {
      objc_msgSend(a1, "personalizedStore");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v4, "cloudID"));
    }
    else
    {
      objc_msgSend(a1, "library");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v4, "persistentID"));
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)nms_syncInfoAlbumIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "universalStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "adamID");

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "universalStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "adamID");
  }
  else
  {
    objc_msgSend(a1, "personalizedStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudAlbumID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(a1, "personalizedStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cloudAlbumID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "library");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "persistentID");
  }
  objc_msgSend(v4, "numberWithLongLong:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v8;
}

+ (id)nms_identifierSetWithLibraryPersistentID:()NanoMusicSync modelKind:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];

  v6 = a4;
  v7 = [a1 alloc];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__MPIdentifierSet_NanoMusicSync__nms_identifierSetWithLibraryPersistentID_modelKind___block_invoke;
  v10[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
  v10[4] = a3;
  v8 = (void *)objc_msgSend(v7, "initWithModelKind:block:", v6, v10);

  return v8;
}

@end
