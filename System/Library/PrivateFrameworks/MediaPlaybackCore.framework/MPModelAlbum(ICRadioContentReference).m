@implementation MPModelAlbum(ICRadioContentReference)

- (id)mpc_radioContentReference
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v2 = objc_alloc_init(MEMORY[0x24BEC8950]);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__MPModelAlbum_ICRadioContentReference__mpc_radioContentReference__block_invoke;
  v12[3] = &unk_24CAB85F0;
  v12[5] = v2;
  v12[6] = &v13;
  v12[4] = a1;
  objc_msgSend(MEMORY[0x24BDDC928], "performWithoutEnforcement:", v12);
  objc_msgSend(a1, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personalizedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cloudID");

  if (v5)
  {
    *((_BYTE *)v14 + 24) = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRepresentativeCloudIdentifier:", v6);

  }
  objc_msgSend(v3, "universalStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "adamID");

  if (v8)
  {
    *((_BYTE *)v14 + 24) = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setStoreIdentifier:", v9);

  }
  if (*((_BYTE *)v14 + 24))
    v10 = v2;
  else
    v10 = 0;

  _Block_object_dispose(&v13, 8);
  return v10;
}

@end
