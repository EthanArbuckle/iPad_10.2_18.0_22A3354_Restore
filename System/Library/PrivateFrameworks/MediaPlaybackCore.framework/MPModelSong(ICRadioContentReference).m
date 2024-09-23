@implementation MPModelSong(ICRadioContentReference)

- (id)mpc_radioContentReference
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v2 = objc_alloc_init(MEMORY[0x24BEC8960]);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v2, "setKind:", *MEMORY[0x24BEC8610]);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__MPModelSong_ICRadioContentReference__mpc_radioContentReference__block_invoke;
  v15[3] = &unk_24CAB85F0;
  v15[5] = v2;
  v15[6] = &v16;
  v15[4] = a1;
  objc_msgSend(MEMORY[0x24BDDC928], "performWithoutEnforcement:", v15);
  objc_msgSend(a1, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "universalStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "subscriptionAdamID");

  if (v5
    || (objc_msgSend(v3, "universalStore"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v6, "adamID"),
        v6,
        v5))
  {
    *((_BYTE *)v17 + 24) = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setStoreAdamIdentifier:", v7);

  }
  objc_msgSend(v3, "personalizedStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cloudID");

  if (v9)
  {
    *((_BYTE *)v17 + 24) = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setStoreCloudIdentifier:", v10);

  }
  objc_msgSend(v3, "universalStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "universalCloudLibraryID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    *((_BYTE *)v17 + 24) = 1;
    objc_msgSend(v2, "setUniversalCloudLibraryID:", v12);
  }

  if (*((_BYTE *)v17 + 24))
    v13 = v2;
  else
    v13 = 0;

  _Block_object_dispose(&v16, 8);
  return v13;
}

@end
