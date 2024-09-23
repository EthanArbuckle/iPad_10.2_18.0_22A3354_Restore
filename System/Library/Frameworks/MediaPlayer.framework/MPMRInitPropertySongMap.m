@implementation MPMRInitPropertySongMap

void ___MPMRInitPropertySongMap_block_invoke_2(uint64_t a1, void *a2)
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

uint64_t ___MPMRInitPropertySongMap_block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("libEligible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = objc_msgSend(v2, "storeID");
  v7 = objc_msgSend(v2, "storeSubscriptionID");

  if (v6 | v7)
    v8 = v5;
  else
    v8 = 0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
}

uint64_t ___MPMRInitPropertySongMap_block_invoke_6()
{
  return MEMORY[0x1E0C9AAA0];
}

id ___MPMRInitPropertySongMap_block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  uint64_t v13;

  v2 = a2;
  objc_msgSend(v2, "title");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phold"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!v6)
  {
    if (objc_msgSend(v3, "length"))
    {
LABEL_10:
      v3 = v3;
      v8 = v3;
      goto LABEL_11;
    }
    objc_msgSend(v2, "collectionInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_MPNowPlayingCollectionInfoKeyCollectionType"));
    v10 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    if (v10 == CFSTR("_MPNowPlayingCollectionInfoCollectionTypeRadio"))
    {

    }
    else
    {
      v11 = v10;
      v12 = objc_msgSend(CFSTR("_MPNowPlayingCollectionInfoCollectionTypeRadio"), "isEqual:", v10);

      if (!v12)
        goto LABEL_9;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_MPNowPlayingCollectionInfoKeyTitle"));
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v13;
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v3, &stru_1E3163D10, CFSTR("MediaPlayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v8;
}

void ___MPMRInitPropertySongMap_block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a2;
  v17 = a3;
  objc_msgSend(v4, "deviceSpecificUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("did"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = ___MPMRInitPropertySongMap_block_invoke_2;
    v22[3] = &unk_1E3162B80;
    v23 = v4;
    objc_msgSend(v17, "setLibraryIdentifiersWithDatabaseID:block:", v6, v22);

  }
  objc_msgSend(v4, "deviceSpecificUserInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("prid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = ___MPMRInitPropertySongMap_block_invoke_3;
    v20[3] = &unk_1E3162BA8;
    v21 = v4;
    objc_msgSend(v17, "setPersonalStoreIdentifiersWithPersonID:block:", v10, v20);

  }
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = ___MPMRInitPropertySongMap_block_invoke_4;
  v18[3] = &unk_1E3163A30;
  v19 = v4;
  v11 = v4;
  objc_msgSend(v17, "setUniversalStoreIdentifiersWithBlock:", v18);
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentItemID:", v12);

  objc_msgSend(v11, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("cntrUID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContainerUniqueID:", v14);

  objc_msgSend(v11, "nowPlayingInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CA48]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setVendorID:", v16);

}

void ___MPMRInitPropertySongMap_block_invoke_4(uint64_t a1, void *a2)
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
  objc_msgSend(v8, "setLyricsAdamID:", objc_msgSend(*(id *)(a1 + 32), "lyricsAdamID"));

}

uint64_t ___MPMRInitPropertySongMap_block_invoke_7(uint64_t a1, void *a2)
{
  _BOOL8 v2;

  v2 = (objc_msgSend(a2, "mediaType") & 0xFF00) != 0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
}

void ___MPMRInitPropertySongMap_block_invoke_3(uint64_t a1, void *a2)
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

@end
