@implementation MPIdentifierSet

void __76__MPIdentifierSet_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersistentID:", objc_msgSend(v5, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("contained-pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainedPersistentID:", objc_msgSend(v6, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("sync"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSyncID:", objc_msgSend(v7, "longLongValue"));

}

void __76__MPIdentifierSet_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v21 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("containerUniqueID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContainerUniqueID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("handoffCorrelationID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHandoffCorrelationID:", v4);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("contentItemID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContentItemID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("lyricsID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLyricsID:", v6);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("vendorID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setVendorID:", v7);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("opaqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setOpaqueID:", v8);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("versionHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setVersionHash:", v9);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("library"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = MEMORY[0x24BDAC760];
  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("db-id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v12;
    v28[1] = 3221225472;
    v28[2] = __76__MPIdentifierSet_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke_2;
    v28[3] = &unk_24CAB8980;
    v29 = v11;
    objc_msgSend(v21, "setLibraryIdentifiersWithDatabaseID:block:", v13, v28);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("personal"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("person-id"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __76__MPIdentifierSet_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke_3;
    v26[3] = &unk_24CAB89A8;
    v27 = v15;
    objc_msgSend(v21, "setPersonalStoreIdentifiersWithPersonID:block:", v16, v26);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("universal"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __76__MPIdentifierSet_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke_4;
    v24[3] = &unk_24CAB89F0;
    v25 = v17;
    objc_msgSend(v21, "setUniversalStoreIdentifiersWithBlock:", v24);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("radio"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __76__MPIdentifierSet_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke_6;
    v22[3] = &unk_24CAB8A18;
    v23 = v19;
    objc_msgSend(v21, "setRadioIdentifiersWithBlock:", v22);

  }
}

void __76__MPIdentifierSet_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cloud"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudID:", objc_msgSend(v5, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("cloud-album"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudAlbumID:", v6);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("reco-id"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecommendationID:", v7);

}

CFStringRef __63__MPIdentifierSet_MPCPlaybackEngineEventPayload__mpc_jsonValue__block_invoke(uint64_t a1, void *a2)
{
  uint64_t quot;
  uint64_t v3;
  char *v4;
  lldiv_t v5;
  uint64_t v6;
  const UInt8 *v7;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  quot = objc_msgSend(a2, "longLongValue");
  v3 = quot;
  v4 = (char *)&v9 + 1;
  do
  {
    v5 = lldiv(quot, 10);
    quot = v5.quot;
    if (v5.rem >= 0)
      LOBYTE(v6) = v5.rem;
    else
      v6 = -v5.rem;
    *(v4 - 2) = v6 + 48;
    v7 = (const UInt8 *)(v4 - 2);
    --v4;
  }
  while (v5.quot);
  if (v3 < 0)
  {
    *(v4 - 2) = 45;
    v7 = (const UInt8 *)(v4 - 2);
  }
  return (id)CFStringCreateWithBytes(0, v7, (char *)&v9 - (char *)v7, 0x8000100u, 0);
}

void __76__MPIdentifierSet_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("global-playlist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlobalPlaylistID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("adam"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdamID:", objc_msgSend(v6, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("former-ids"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "msv_map:", &__block_literal_global_135);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v4, "setFormerAdamIDs:", v10);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ulid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniversalCloudLibraryID:", v11);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("purchased"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPurchasedAdamID:", objc_msgSend(v12, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("subscription"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubscriptionAdamID:", objc_msgSend(v13, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("social-profile"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSocialProfileID:", v14);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("media-clip"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInformalMediaClipID:", v15);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("static-asset"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInformalStaticAssetID:", v16);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("reporting-adam-id"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReportingAdamID:", objc_msgSend(v17, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("asset-adam-id"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssetAdamID:", objc_msgSend(v18, "longLongValue"));

}

void __76__MPIdentifierSet_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("station-string"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStationStringID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("station-hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStationHash:", v6);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("station-id"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStationID:", objc_msgSend(v7, "longLongValue"));

}

uint64_t __76__MPIdentifierSet_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(a2, "longLongValue"));
}

@end
