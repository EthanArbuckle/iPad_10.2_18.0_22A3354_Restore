@implementation MPMRInitPropertyPlaylistMap

id ___MPMRInitPropertyPlaylistMap_block_invoke_2_75(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pclbStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v4, "intValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ___MPMRInitPropertyPlaylistMap_block_invoke_73(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("piclb"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void *___MPMRInitPropertyPlaylistMap_block_invoke_7()
{
  return &unk_1E31E49A8;
}

id ___MPMRInitPropertyPlaylistMap_block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "deviceSpecificUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("colLibAdded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ___MPMRInitPropertyPlaylistMap_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "collectionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_MPNowPlayingCollectionInfoKeyTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void ___MPMRInitPropertyPlaylistMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a2;
  v12 = a3;
  objc_msgSend(v4, "deviceSpecificUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("did"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = ___MPMRInitPropertyPlaylistMap_block_invoke_2;
    v17[3] = &unk_1E3162B80;
    v18 = v4;
    objc_msgSend(v12, "setLibraryIdentifiersWithDatabaseID:block:", v6, v17);

  }
  objc_msgSend(v4, "deviceSpecificUserInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("prid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = ___MPMRInitPropertyPlaylistMap_block_invoke_3;
    v15[3] = &unk_1E3162BA8;
    v16 = v4;
    objc_msgSend(v12, "setPersonalStoreIdentifiersWithPersonID:block:", v10, v15);

  }
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = ___MPMRInitPropertyPlaylistMap_block_invoke_4;
  v13[3] = &unk_1E3163A30;
  v14 = v4;
  v11 = v4;
  objc_msgSend(v12, "setUniversalStoreIdentifiersWithBlock:", v13);

}

void ___MPMRInitPropertyPlaylistMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceSpecificUserInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ppid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));

}

void ___MPMRInitPropertyPlaylistMap_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceSpecificUserInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pclid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCloudID:", objc_msgSend(v4, "longLongValue"));

}

void ___MPMRInitPropertyPlaylistMap_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "collectionInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_MPNowPlayingCollectionInfoKeyIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_MPNowPlayingInfoPropertyPlaylistGlobalIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGlobalPlaylistID:", v5);

}

@end
