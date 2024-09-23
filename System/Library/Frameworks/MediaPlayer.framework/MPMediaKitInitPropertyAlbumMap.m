@implementation MPMediaKitInitPropertyAlbumMap

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_20(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("genreNames"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("name"));

}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_19(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("relationships.artists.data.id.@firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v7);

  objc_msgSend(v6, "valueForKeyPath:", CFSTR("attributes.artistName"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("name"));
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_18(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "valueForKeyPath:", CFSTR("attributes.classicalUrl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = v3;

  return v4;
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_17(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("attributes.isMasteredForItunes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v3, "BOOLValue");

  v4 = v4;
  +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnhancedAudioAvailable");

  if (v6)
  {
    objc_msgSend(v2, "valueForKeyPath:", CFSTR("attributes.audioTraits"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", CFSTR("spatial")))
      v4 = v4 | 8;
    if (objc_msgSend(v7, "containsObject:", CFSTR("atmos")))
      v4 |= 0x10uLL;
    if (objc_msgSend(v7, "containsObject:", CFSTR("surround")))
      v4 |= 0x20uLL;
    if (objc_msgSend(v7, "containsObject:", CFSTR("lossless")))
      v4 |= 2uLL;
    if (objc_msgSend(v7, "containsObject:", CFSTR("hi-res-lossless")))
      v4 |= 4uLL;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  MPIdentifierSet *v11;
  void *v12;
  id v13;
  MPIdentifierSet *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  MPIdentifierSet *v23;
  void *v24;
  id v25;
  MPIdentifierSet *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  double v43;
  double v44;
  void *v45;
  BOOL v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v52;
  id obj;
  id v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  id v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("relationships.tracks.data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = MEMORY[0x1E0C809B0];
  v55 = v5;
  if (v6)
  {
    objc_msgSend(v6, "firstObject", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v6, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForKeyPath:", CFSTR("meta.popularity"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        goto LABEL_17;
      goto LABEL_7;
    }
  }
  else
  {
    v11 = [MPIdentifierSet alloc];
    +[MPModelAlbumKind identityKind](MPModelAlbumKind, "identityKind", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v7;
    v68[1] = 3221225472;
    v68[2] = ___MPMediaKitInitPropertyAlbumMap_block_invoke_10;
    v68[3] = &unk_1E3162A70;
    v69 = v4;
    v13 = v5;
    v70 = v13;
    v14 = -[MPIdentifierSet initWithSource:modelKind:block:](v11, "initWithSource:modelKind:block:", CFSTR("MediaAPI"), v12, v68);

    objc_msgSend(v13, "relationshipPayloadProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "payloadForRelatedEntityWithIdentifierSet:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "valueForKeyPath:", CFSTR("relationships.tracks.data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v69;
  }

LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v6;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v65 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
        v23 = [MPIdentifierSet alloc];
        +[MPModelSongKind identityKind](MPModelSongKind, "identityKind");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = ___MPMediaKitInitPropertyAlbumMap_block_invoke_13;
        v62[3] = &unk_1E3162A70;
        v62[4] = v22;
        v25 = v5;
        v63 = v25;
        v26 = -[MPIdentifierSet initWithSource:modelKind:block:](v23, "initWithSource:modelKind:block:", CFSTR("MediaAPI"), v24, v62);

        objc_msgSend(v25, "relationshipPayloadProvider");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "payloadForRelatedEntityWithIdentifierSet:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          objc_msgSend(v17, "addObject:", v28);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    }
    while (v19);
  }

  v6 = (void *)objc_msgSend(v17, "copy");
LABEL_17:
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v29 = v6;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v59;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v59 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v33);
        objc_msgSend(v34, "valueForKeyPath:", CFSTR("id"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0CB37E8];
        v37 = v35;
        if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
          v38 = objc_msgSend(v37, "longLongValue");
        else
          v38 = 0;

        objc_msgSend(v36, "numberWithLongLong:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "valueForKeyPath:", CFSTR("meta.popularity"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)MEMORY[0x1E0CB37E8];
        v42 = v40;
        if ((_NSIsNSNumber() & 1) != 0
          || (_NSIsNSString() & 1) != 0
          || (v43 = 0.0, (objc_opt_respondsToSelector() & 1) != 0))
        {
          objc_msgSend(v42, "doubleValue");
          v43 = v44;
        }

        objc_msgSend(v41, "numberWithDouble:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45)
          v46 = v39 == 0;
        else
          v46 = 1;
        if (!v46)
          objc_msgSend(v54, "setObject:forKeyedSubscript:", v45, v39);

        ++v33;
      }
      while (v31 != v33);
      v47 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      v31 = v47;
    }
    while (v47);
  }

  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = ___MPMediaKitInitPropertyAlbumMap_block_invoke_16;
  v56[3] = &unk_1E3160008;
  v57 = v54;
  v48 = v54;
  v49 = (void *)MEMORY[0x19403A810](v56);
  v50 = (void *)MEMORY[0x19403A810]();

  return v50;
}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_10(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___MPMediaKitInitPropertyAlbumMap_block_invoke_11;
  v6[3] = &unk_1E3163A30;
  v7 = *(id *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setUniversalStoreIdentifiersWithBlock:", v6);
  objc_msgSend(*(id *)(a1 + 40), "personID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonalStoreIdentifiersWithPersonID:block:", v5, &__block_literal_global_221);

}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___MPMediaKitInitPropertyAlbumMap_block_invoke_14;
  v5[3] = &unk_1E3163A30;
  v5[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setUniversalStoreIdentifiersWithBlock:", v5);
  objc_msgSend(*(id *)(a1 + 40), "personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersonalStoreIdentifiersWithPersonID:block:", v4, &__block_literal_global_224);

}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "universalStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "adamID");

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("id"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v5, "longLongValue");
  else
    v4 = 0;

  objc_msgSend(v3, "setAdamID:", v4);
}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("id"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v5, "longLongValue");
  else
    v4 = 0;

  objc_msgSend(v3, "setAdamID:", v4);
}

void *___MPMediaKitInitPropertyAlbumMap_block_invoke_8()
{
  return &unk_1E31E6600;
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "valueForKeyPath:", CFSTR("attributes.releaseDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _MPMediaKitDateFromString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _MPMediaKitCalendar();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "component:fromDate:", 4, v3);

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_6(uint64_t a1, void *a2)
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

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "valueForKeyPath:", CFSTR("attributes.contentRating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isEqualToString:", CFSTR("explicit")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ___MPMediaKitInitPropertyAlbumMap_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "valueForKeyPath:", CFSTR("attributes.contentRating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isEqualToString:", CFSTR("clean")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  v13[2] = ___MPMediaKitInitPropertyAlbumMap_block_invoke_2;
  v13[3] = &unk_1E3162A20;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v12 = v6;
  v9 = a4;
  objc_msgSend(v9, "setUniversalStoreIdentifiersWithBlock:", v13);
  objc_msgSend(v8, "personID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPersonalStoreIdentifiersWithPersonID:block:", v10, &__block_literal_global_171);

  objc_msgSend(v12, "valueForKeyPath:", CFSTR("attributes.versionHash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVersionHash:", v11);

}

void ___MPMediaKitInitPropertyAlbumMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("_MPMKT_transformedType");
  v11[1] = CFSTR("type");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _MPKeyPathValueTransformFirstNonnullKeyPath(v5, *(void **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "isEqual:", CFSTR("library-albums"));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((_DWORD)v5)
  {
    objc_msgSend(v4, "setUniversalCloudLibraryID:", v7);
  }
  else
  {
    v9 = v7;
    if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
      v10 = objc_msgSend(v9, "longLongValue");
    else
      v10 = 0;

    objc_msgSend(v4, "setAdamID:", v10);
  }

}

@end
