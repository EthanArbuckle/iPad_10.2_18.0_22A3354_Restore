@implementation MPMRInitPropertyArtistMap

void ___MPMRInitPropertyArtistMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a2;
  v4 = a3;
  objc_msgSend(v7, "deviceSpecificUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("did"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = ___MPMRInitPropertyArtistMap_block_invoke_2;
    v8[3] = &unk_1E3162B80;
    v9 = v7;
    objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v6, v8);

  }
}

void ___MPMRInitPropertyArtistMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceSpecificUserInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aarpid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));

}

id ___MPMRInitPropertyArtistMap_block_invoke_3(uint64_t a1, void *a2)
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
    objc_msgSend(v2, "albumArtistName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E3163D10, CFSTR("MediaPlayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "albumArtistName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
