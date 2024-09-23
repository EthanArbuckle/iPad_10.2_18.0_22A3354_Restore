@implementation MPMediaKitInitPropertyPlaylistMap

void ___MPMediaKitInitPropertyPlaylistMap_block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("curatorName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("name"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("curatorSocialHandle"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("handle"));
}

id ___MPMediaKitInitPropertyPlaylistMap_block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("attributes.supportsSing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
    v5 = 256;
  else
    v5 = 0;
  +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnhancedAudioAvailable");

  if (v7)
  {
    objc_msgSend(v2, "valueForKeyPath:", CFSTR("attributes.audioTraits"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", CFSTR("spatial")))
      v5 |= 8uLL;
    if (objc_msgSend(v8, "containsObject:", CFSTR("atmos")))
      v5 |= 0x10uLL;
    if (objc_msgSend(v8, "containsObject:", CFSTR("surround")))
      v5 |= 0x20uLL;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id ___MPMediaKitInitPropertyPlaylistMap_block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "valueForKeyPath:", CFSTR("attributes.url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id ___MPMediaKitInitPropertyPlaylistMap_block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("attributes.playlistType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("editorial")))
  {
    objc_msgSend(v2, "valueForKeyPath:", CFSTR("attributes.isChart"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (v5)
      v6 = 8;
    else
      v6 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("external")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("user-shared")) & 1) != 0)
  {
    v6 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("personal-mix")))
  {
    v6 = 7;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id ___MPMediaKitInitPropertyPlaylistMap_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "valueForKeyPath:", CFSTR("attributes.lastModifiedDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _MPMediaKitDateAndTimeFromString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _MPMediaKitCalendar();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 3145982, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id ___MPMediaKitInitPropertyPlaylistMap_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "valueForKeyPath:", CFSTR("attributes.releaseDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _MPMediaKitDateFromString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _MPMediaKitCalendar();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 1048606, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void ___MPMediaKitInitPropertyPlaylistMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a2;
  v7 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ___MPMediaKitInitPropertyPlaylistMap_block_invoke_2;
  v13[3] = &unk_1E3162A20;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v12 = v6;
  v9 = a4;
  objc_msgSend(v9, "setUniversalStoreIdentifiersWithBlock:", v13);
  objc_msgSend(v8, "personID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPersonalStoreIdentifiersWithPersonID:block:", v10, &__block_literal_global_251);

  objc_msgSend(v12, "valueForKeyPath:", CFSTR("attributes.playParams.versionHash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVersionHash:", v11);

}

void ___MPMediaKitInitPropertyPlaylistMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("_MPMKT_transformedType");
  v8[1] = CFSTR("type");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _MPKeyPathValueTransformFirstNonnullKeyPath(v5, *(void **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "isEqual:", CFSTR("library-playlists"));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v5)
    objc_msgSend(v4, "setUniversalCloudLibraryID:", v7);
  else
    objc_msgSend(v4, "setGlobalPlaylistID:", v7);

}

@end
