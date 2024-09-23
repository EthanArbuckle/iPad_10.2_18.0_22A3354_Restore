@implementation MPMRInitPropertyPlaylistEntryMap

void ___MPMRInitPropertyPlaylistEntryMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;

  v10 = a2;
  v4 = a3;
  objc_msgSend(v10, "deviceSpecificUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("did"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = ___MPMRInitPropertyPlaylistEntryMap_block_invoke_2;
    v15 = &unk_1E3162B80;
    v16 = v10;
    objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v6, &v12);

  }
  objc_msgSend(v10, "identifier", v10, v12, v13, v14, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentItemID:", v7);

  objc_msgSend(v11, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cntrUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainerUniqueID:", v9);

}

void ___MPMRInitPropertyPlaylistEntryMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "deviceSpecificUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("peid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersistentID:", objc_msgSend(v6, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "deviceSpecificUserInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainedPersistentID:", objc_msgSend(v7, "longLongValue"));

}

@end
