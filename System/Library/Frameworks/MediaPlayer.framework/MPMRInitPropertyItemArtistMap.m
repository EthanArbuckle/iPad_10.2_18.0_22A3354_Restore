@implementation MPMRInitPropertyItemArtistMap

void ___MPMRInitPropertyItemArtistMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a2;
  v10 = a3;
  objc_msgSend(v4, "deviceSpecificUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("did"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = ___MPMRInitPropertyItemArtistMap_block_invoke_2;
    v13[3] = &unk_1E3162B80;
    v14 = v4;
    objc_msgSend(v10, "setLibraryIdentifiersWithDatabaseID:block:", v6, v13);

  }
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = ___MPMRInitPropertyItemArtistMap_block_invoke_3;
  v11[3] = &unk_1E3163A30;
  v12 = v4;
  v9 = v4;
  objc_msgSend(v10, "setUniversalStoreIdentifiersWithBlock:", v11);

}

void ___MPMRInitPropertyItemArtistMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceSpecificUserInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arpid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));

}

id ___MPMRInitPropertyItemArtistMap_block_invoke_4(uint64_t a1, void *a2)
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
    objc_msgSend(v2, "trackArtistName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E3163D10, CFSTR("MediaPlayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "trackArtistName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void ___MPMRInitPropertyItemArtistMap_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v2, "storeArtistID"));

}

@end
