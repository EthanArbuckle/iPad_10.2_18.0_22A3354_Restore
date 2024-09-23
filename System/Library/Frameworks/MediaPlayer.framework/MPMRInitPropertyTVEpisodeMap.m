@implementation MPMRInitPropertyTVEpisodeMap

uint64_t ___MPMRInitPropertyTVEpisodeMap_block_invoke_11()
{
  return MEMORY[0x1E0C9AAA0];
}

id ___MPMRInitPropertyTVEpisodeMap_block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("libEligible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ___MPMRInitPropertyTVEpisodeMap_block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "deviceSpecificUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("libAdded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ___MPMRInitPropertyTVEpisodeMap_block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "deviceSpecificUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("klStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v4, "intValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ___MPMRInitPropertyTVEpisodeMap_block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "deviceSpecificUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("klEnable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v4, "intValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t ___MPMRInitPropertyTVEpisodeMap_block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = objc_msgSend(a2, "episodeType");
  if ((unint64_t)(v3 - 1) >= 6)
    v4 = 0;
  else
    v4 = v3;
  return objc_msgSend(v2, "numberWithInteger:", v4);
}

id ___MPMRInitPropertyTVEpisodeMap_block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("phold"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E3163D10, CFSTR("MediaPlayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void ___MPMRInitPropertyTVEpisodeMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a2;
  v15 = a3;
  objc_msgSend(v4, "deviceSpecificUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("did"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = ___MPMRInitPropertyTVEpisodeMap_block_invoke_2;
    v20[3] = &unk_1E3162B80;
    v21 = v4;
    objc_msgSend(v15, "setLibraryIdentifiersWithDatabaseID:block:", v6, v20);

  }
  objc_msgSend(v4, "deviceSpecificUserInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("prid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = ___MPMRInitPropertyTVEpisodeMap_block_invoke_3;
    v18[3] = &unk_1E3162BA8;
    v19 = v4;
    objc_msgSend(v15, "setPersonalStoreIdentifiersWithPersonID:block:", v10, v18);

  }
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = ___MPMRInitPropertyTVEpisodeMap_block_invoke_4;
  v16[3] = &unk_1E3163A30;
  v17 = v4;
  v11 = v4;
  objc_msgSend(v15, "setUniversalStoreIdentifiersWithBlock:", v16);
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentItemID:", v12);

  objc_msgSend(v11, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("cntrUID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContainerUniqueID:", v14);

}

void ___MPMRInitPropertyTVEpisodeMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceSpecificUserInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));

}

void ___MPMRInitPropertyTVEpisodeMap_block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudID:", objc_msgSend(v6, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "deviceSpecificUserInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("claid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudAlbumID:", v7);

}

void ___MPMRInitPropertyTVEpisodeMap_block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v8, "setAdamID:", objc_msgSend(v3, "storeID"));
  objc_msgSend(v8, "setSubscriptionAdamID:", objc_msgSend(*(id *)(a1 + 32), "storeSubscriptionID"));
  objc_msgSend(*(id *)(a1 + 32), "deviceSpecificUserInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("purID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPurchasedAdamID:", objc_msgSend(v5, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "deviceSpecificUserInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ulid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUniversalCloudLibraryID:", v7);

  objc_msgSend(v8, "setReportingAdamID:", objc_msgSend(*(id *)(a1 + 32), "reportingAdamID"));
}

@end
