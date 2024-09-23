@implementation MPIdentifierSet(MPCPlaybackEngineEventPayload)

+ (id)payloadValueFromJSONValue:()MPCPlaybackEngineEventPayload
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_empty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(a1, "emptyIdentifierSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDDC8C0];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "payloadValueFromJSONValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sources"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc((Class)a1);
    if (v11)
      v13 = v11;
    else
      v13 = &unk_24CB174E8;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __76__MPIdentifierSet_MPCPlaybackEngineEventPayload__payloadValueFromJSONValue___block_invoke;
    v15[3] = &unk_24CAB8A40;
    v16 = v4;
    v7 = (void *)objc_msgSend(v12, "_initWithSources:modelKind:block:", v13, v10, v15);

  }
  return v7;
}

- (id)mpc_jsonValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t quot;
  uint64_t v11;
  char *v12;
  lldiv_t v13;
  uint64_t v14;
  const UInt8 *v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  lldiv_t v20;
  uint64_t v21;
  const UInt8 *v22;
  __CFString *v23;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  lldiv_t v28;
  uint64_t v29;
  const UInt8 *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  lldiv_t v38;
  uint64_t v39;
  const UInt8 *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  lldiv_t v50;
  uint64_t v51;
  const UInt8 *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  lldiv_t v61;
  uint64_t v62;
  const UInt8 *v63;
  __CFString *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  lldiv_t v68;
  uint64_t v69;
  const UInt8 *v70;
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  lldiv_t v78;
  uint64_t v79;
  const UInt8 *v80;
  __CFString *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  lldiv_t v85;
  uint64_t v86;
  const UInt8 *v87;
  __CFString *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "emptyIdentifierSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == a1)
    return &unk_24CB172F8;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modelKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mpc_jsonValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("kind"));

  objc_msgSend(a1, "sources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sources"));

  objc_msgSend(a1, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "databaseID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("db-id"));

    quot = objc_msgSend(v7, "persistentID");
    v11 = quot;
    v12 = (char *)&v101 + 1;
    do
    {
      v13 = lldiv(quot, 10);
      quot = v13.quot;
      if (v13.rem >= 0)
        LOBYTE(v14) = v13.rem;
      else
        v14 = -v13.rem;
      *(v12 - 2) = v14 + 48;
      v15 = (const UInt8 *)(v12 - 2);
      --v12;
    }
    while (v13.quot);
    if (v11 < 0)
    {
      *(v12 - 2) = 45;
      v15 = (const UInt8 *)(v12 - 2);
    }
    v16 = (__CFString *)CFStringCreateWithBytes(0, v15, (char *)&v101 - (char *)v15, 0x8000100u, 0);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("pid"));

    if (objc_msgSend(v7, "containedPersistentID"))
    {
      v17 = objc_msgSend(v7, "containedPersistentID");
      v18 = v17;
      v19 = (char *)&v101 + 1;
      do
      {
        v20 = lldiv(v17, 10);
        v17 = v20.quot;
        if (v20.rem >= 0)
          LOBYTE(v21) = v20.rem;
        else
          v21 = -v20.rem;
        *(v19 - 2) = v21 + 48;
        v22 = (const UInt8 *)(v19 - 2);
        --v19;
      }
      while (v20.quot);
      if (v18 < 0)
      {
        *(v19 - 2) = 45;
        v22 = (const UInt8 *)(v19 - 2);
      }
      v23 = (__CFString *)CFStringCreateWithBytes(0, v22, (char *)&v101 - (char *)v22, 0x8000100u, 0);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("contained-pid"));

    }
    else
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, CFSTR("contained-pid"));
    }
    if (objc_msgSend(v7, "syncID"))
    {
      v25 = objc_msgSend(v7, "syncID");
      v26 = v25;
      v27 = (char *)&v101 + 1;
      do
      {
        v28 = lldiv(v25, 10);
        v25 = v28.quot;
        if (v28.rem >= 0)
          LOBYTE(v29) = v28.rem;
        else
          v29 = -v28.rem;
        *(v27 - 2) = v29 + 48;
        v30 = (const UInt8 *)(v27 - 2);
        --v27;
      }
      while (v28.quot);
      if (v26 < 0)
      {
        *(v27 - 2) = 45;
        v30 = (const UInt8 *)(v27 - 2);
      }
      v31 = (__CFString *)CFStringCreateWithBytes(0, v30, (char *)&v101 - (char *)v30, 0x8000100u, 0);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("sync"));

    }
    else
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, CFSTR("sync"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("library"));

  }
  objc_msgSend(a1, "personalizedStore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "personID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, CFSTR("person-id"));

    if (objc_msgSend(v32, "cloudID"))
    {
      v35 = objc_msgSend(v32, "cloudID");
      v36 = v35;
      v37 = (char *)&v101 + 1;
      do
      {
        v38 = lldiv(v35, 10);
        v35 = v38.quot;
        if (v38.rem >= 0)
          LOBYTE(v39) = v38.rem;
        else
          v39 = -v38.rem;
        *(v37 - 2) = v39 + 48;
        v40 = (const UInt8 *)(v37 - 2);
        --v37;
      }
      while (v38.quot);
      if (v36 < 0)
      {
        *(v37 - 2) = 45;
        v40 = (const UInt8 *)(v37 - 2);
      }
      v41 = (__CFString *)CFStringCreateWithBytes(0, v40, (char *)&v101 - (char *)v40, 0x8000100u, 0);
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v41, CFSTR("cloud"));

    }
    else
    {
      objc_msgSend(v33, "setObject:forKeyedSubscript:", 0, CFSTR("cloud"));
    }
    objc_msgSend(v32, "cloudAlbumID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v42, CFSTR("cloud-album"));

    objc_msgSend(v32, "recommendationID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v43, CFSTR("reco-id"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("personal"));
  }
  objc_msgSend(a1, "universalStore");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 9);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "globalPlaylistID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v46, CFSTR("global-playlist"));

    if (objc_msgSend(v44, "adamID"))
    {
      v47 = objc_msgSend(v44, "adamID");
      v48 = v47;
      v49 = (char *)&v101 + 1;
      do
      {
        v50 = lldiv(v47, 10);
        v47 = v50.quot;
        if (v50.rem >= 0)
          LOBYTE(v51) = v50.rem;
        else
          v51 = -v50.rem;
        *(v49 - 2) = v51 + 48;
        v52 = (const UInt8 *)(v49 - 2);
        --v49;
      }
      while (v50.quot);
      if (v48 < 0)
      {
        *(v49 - 2) = 45;
        v52 = (const UInt8 *)(v49 - 2);
      }
      v53 = (__CFString *)CFStringCreateWithBytes(0, v52, (char *)&v101 - (char *)v52, 0x8000100u, 0);
      objc_msgSend(v45, "setObject:forKeyedSubscript:", v53, CFSTR("adam"));

    }
    else
    {
      objc_msgSend(v45, "setObject:forKeyedSubscript:", 0, CFSTR("adam"));
    }
    objc_msgSend(v44, "formerAdamIDs");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v54, "count"))
    {
      objc_msgSend(v44, "formerAdamIDs");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "msv_map:", &__block_literal_global_166);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setObject:forKeyedSubscript:", v56, CFSTR("former-ids"));

    }
    else
    {
      objc_msgSend(v45, "setObject:forKeyedSubscript:", 0, CFSTR("former-ids"));
    }

    objc_msgSend(v44, "universalCloudLibraryID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v57, CFSTR("ulid"));

    if (objc_msgSend(v44, "purchasedAdamID"))
    {
      v58 = objc_msgSend(v44, "purchasedAdamID");
      v59 = v58;
      v60 = (char *)&v101 + 1;
      do
      {
        v61 = lldiv(v58, 10);
        v58 = v61.quot;
        if (v61.rem >= 0)
          LOBYTE(v62) = v61.rem;
        else
          v62 = -v61.rem;
        *(v60 - 2) = v62 + 48;
        v63 = (const UInt8 *)(v60 - 2);
        --v60;
      }
      while (v61.quot);
      if (v59 < 0)
      {
        *(v60 - 2) = 45;
        v63 = (const UInt8 *)(v60 - 2);
      }
      v64 = (__CFString *)CFStringCreateWithBytes(0, v63, (char *)&v101 - (char *)v63, 0x8000100u, 0);
      objc_msgSend(v45, "setObject:forKeyedSubscript:", v64, CFSTR("purchased"));

    }
    else
    {
      objc_msgSend(v45, "setObject:forKeyedSubscript:", 0, CFSTR("purchased"));
    }
    if (objc_msgSend(v44, "subscriptionAdamID"))
    {
      v65 = objc_msgSend(v44, "subscriptionAdamID");
      v66 = v65;
      v67 = (char *)&v101 + 1;
      do
      {
        v68 = lldiv(v65, 10);
        v65 = v68.quot;
        if (v68.rem >= 0)
          LOBYTE(v69) = v68.rem;
        else
          v69 = -v68.rem;
        *(v67 - 2) = v69 + 48;
        v70 = (const UInt8 *)(v67 - 2);
        --v67;
      }
      while (v68.quot);
      if (v66 < 0)
      {
        *(v67 - 2) = 45;
        v70 = (const UInt8 *)(v67 - 2);
      }
      v71 = (__CFString *)CFStringCreateWithBytes(0, v70, (char *)&v101 - (char *)v70, 0x8000100u, 0);
      objc_msgSend(v45, "setObject:forKeyedSubscript:", v71, CFSTR("subscription"));

    }
    else
    {
      objc_msgSend(v45, "setObject:forKeyedSubscript:", 0, CFSTR("subscription"));
    }
    objc_msgSend(v44, "socialProfileID");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v72, CFSTR("social-profile"));

    objc_msgSend(v44, "informalMediaClipID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v73, CFSTR("media-clip"));

    objc_msgSend(v44, "informalStaticAssetID");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v74, CFSTR("static-asset"));

    if (objc_msgSend(v44, "reportingAdamID"))
    {
      v75 = objc_msgSend(v44, "reportingAdamID");
      v76 = v75;
      v77 = (char *)&v101 + 1;
      do
      {
        v78 = lldiv(v75, 10);
        v75 = v78.quot;
        if (v78.rem >= 0)
          LOBYTE(v79) = v78.rem;
        else
          v79 = -v78.rem;
        *(v77 - 2) = v79 + 48;
        v80 = (const UInt8 *)(v77 - 2);
        --v77;
      }
      while (v78.quot);
      if (v76 < 0)
      {
        *(v77 - 2) = 45;
        v80 = (const UInt8 *)(v77 - 2);
      }
      v81 = (__CFString *)CFStringCreateWithBytes(0, v80, (char *)&v101 - (char *)v80, 0x8000100u, 0);
      objc_msgSend(v45, "setObject:forKeyedSubscript:", v81, CFSTR("reporting-adam-id"));

    }
    else
    {
      objc_msgSend(v45, "setObject:forKeyedSubscript:", 0, CFSTR("reporting-adam-id"));
    }
    if (objc_msgSend(v44, "assetAdamID"))
    {
      v82 = objc_msgSend(v44, "assetAdamID");
      v83 = v82;
      v84 = (char *)&v101 + 1;
      do
      {
        v85 = lldiv(v82, 10);
        v82 = v85.quot;
        if (v85.rem >= 0)
          LOBYTE(v86) = v85.rem;
        else
          v86 = -v85.rem;
        *(v84 - 2) = v86 + 48;
        v87 = (const UInt8 *)(v84 - 2);
        --v84;
      }
      while (v85.quot);
      if (v83 < 0)
      {
        *(v84 - 2) = 45;
        v87 = (const UInt8 *)(v84 - 2);
      }
      v88 = (__CFString *)CFStringCreateWithBytes(0, v87, (char *)&v101 - (char *)v87, 0x8000100u, 0);
      objc_msgSend(v45, "setObject:forKeyedSubscript:", v88, CFSTR("asset-adam-id"));

    }
    else
    {
      objc_msgSend(v45, "setObject:forKeyedSubscript:", 0, CFSTR("asset-adam-id"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("universal"));

  }
  objc_msgSend(a1, "radio");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "stationStringID");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setObject:forKeyedSubscript:", v91, CFSTR("station-string"));

    objc_msgSend(v89, "stationHash");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setObject:forKeyedSubscript:", v92, CFSTR("station-hash"));

    if (objc_msgSend(v89, "stationID"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v89, "stationID"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setObject:forKeyedSubscript:", v93, CFSTR("station-id"));

    }
    else
    {
      objc_msgSend(v90, "setObject:forKeyedSubscript:", 0, CFSTR("station-id"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("radio"));

  }
  objc_msgSend(a1, "containerUniqueID");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v94, CFSTR("containerUniqueID"));

  objc_msgSend(a1, "handoffCorrelationID");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("handoffCorrelationID"));

  objc_msgSend(a1, "contentItemID");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v96, CFSTR("contentItemID"));

  objc_msgSend(a1, "lyricsID");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v97, CFSTR("lyricsID"));

  objc_msgSend(a1, "vendorID");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("vendorID"));

  objc_msgSend(a1, "opaqueID");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("opaqueID"));

  objc_msgSend(a1, "versionHash");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v100, CFSTR("versionHash"));

  return v3;
}

@end
