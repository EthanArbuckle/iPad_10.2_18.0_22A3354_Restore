@implementation MPMediaKitInitPropertySongMap

void ___MPMediaKitInitPropertySongMap_block_invoke_8_141(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("previews"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("previews"));

}

void ___MPMediaKitInitPropertySongMap_block_invoke_7_134(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playParams"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("playParams"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("videoKind"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("videoKind"));
}

void ___MPMediaKitInitPropertySongMap_block_invoke_6_127(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasLyrics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("hasLyrics"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasTimeSyncedLyrics"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("hasTimeSyncedLyrics"));
}

void ___MPMediaKitInitPropertySongMap_block_invoke_5_122(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

void ___MPMediaKitInitPropertySongMap_block_invoke_4_119(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("attribution"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("name"));

}

void ___MPMediaKitInitPropertySongMap_block_invoke_3_112(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

void ___MPMediaKitInitPropertySongMap_block_invoke_2_103(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("relationships.albums.data.id.@firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v7);

  objc_msgSend(v6, "valueForKeyPath:", CFSTR("attributes.albumName"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("name"));
}

id ___MPMediaKitInitPropertySongMap_block_invoke_88(uint64_t a1, void *a2)
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

void *___MPMediaKitInitPropertySongMap_block_invoke_9()
{
  return &unk_1E31E6600;
}

id ___MPMediaKitInitPropertySongMap_block_invoke_8(uint64_t a1, void *a2)
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

id ___MPMediaKitInitPropertySongMap_block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "valueForKeyPath:", CFSTR("attributes.attribution"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "length") != 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ___MPMediaKitInitPropertySongMap_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("_MPMKT_transformedType");
  v13[1] = CFSTR("type");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _MPKeyPathValueTransformFirstNonnullKeyPath(v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB37E8];
  if ((objc_msgSend(v8, "isEqual:", CFSTR("music-videos")) & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v8, "isEqual:", CFSTR("uploaded-videos"));
  objc_msgSend(v9, "numberWithInt:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id ___MPMediaKitInitPropertySongMap_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("_MPMKT_transformedType");
  v13[1] = CFSTR("type");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _MPKeyPathValueTransformFirstNonnullKeyPath(v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB37E8];
  if ((objc_msgSend(v8, "isEqual:", CFSTR("uploaded-audios")) & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v8, "isEqual:", CFSTR("uploaded-videos"));
  objc_msgSend(v9, "numberWithInt:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id ___MPMediaKitInitPropertySongMap_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "valueForKeyPath:", CFSTR("attributes.contentRating"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isEqualToString:", CFSTR("explicit")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void ___MPMediaKitInitPropertySongMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a2;
  v7 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___MPMediaKitInitPropertySongMap_block_invoke_2;
  v12[3] = &unk_1E3162A20;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v11 = v6;
  v9 = a4;
  objc_msgSend(v9, "setUniversalStoreIdentifiersWithBlock:", v12);
  objc_msgSend(v8, "personID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPersonalStoreIdentifiersWithPersonID:block:", v10, &__block_literal_global_29);

}

void ___MPMediaKitInitPropertySongMap_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[2];
  _BYTE v41[128];
  _QWORD v42[18];

  v42[16] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("id"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "longLongValue");
  else
    v5 = 0;

  objc_msgSend(v3, "setAdamID:", v5);
  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("meta.formerIds"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (!v8)
    {
LABEL_14:

      v12 = v7;
      goto LABEL_31;
    }
    v9 = v8;
    v10 = *(_QWORD *)v37;
LABEL_8:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v10)
        objc_enumerationMutation(v7);
      if (!_NSIsNSNumber())
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        if (!v9)
          goto LABEL_14;
        goto LABEL_8;
      }
    }
    v28 = v6;
    v29 = v5;
    v30 = a1;
    v31 = v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (!v14)
      goto LABEL_30;
    v15 = v14;
    v16 = *(_QWORD *)v33;
LABEL_19:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v16)
        objc_enumerationMutation(v13);
      v18 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * v17);
      if ((_NSIsNSNumber() & 1) == 0 && (_NSIsNSString() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_27;
      v19 = objc_msgSend(v18, "longLongValue", v28, v29, v30, v31, (_QWORD)v32);

      if (v19)
        break;
LABEL_28:
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        if (!v15)
        {
LABEL_30:

          a1 = v30;
          v3 = v31;
          v6 = v28;
          v5 = v29;
LABEL_31:

          goto LABEL_40;
        }
        goto LABEL_19;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v19);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v18);
LABEL_27:

    goto LABEL_28;
  }
  if (_NSIsNSNumber())
  {
    v42[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  v20 = v6;
  if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = objc_msgSend(v20, "longLongValue");

    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_40;
    }
  }
  else
  {

  }
  v12 = (id)MEMORY[0x1E0C9AA60];
LABEL_40:

  objc_msgSend(v3, "setFormerAdamIDs:", v12);
  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("attributes.playParams"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v40[0] = CFSTR("_MPMKT_transformedType");
    v40[1] = CFSTR("type");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _MPKeyPathValueTransformFirstNonnullKeyPath(v24, *(void **)(a1 + 32));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v25, "isEqual:", CFSTR("uploaded-audios")) & 1) != 0
      || (objc_msgSend(v25, "isEqual:", CFSTR("uploaded-videos")) & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("attributes.offers.kind"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "containsObject:", CFSTR("subscription"));

      if ((v27 & 1) == 0)
        goto LABEL_45;
    }
  }
  objc_msgSend(v3, "setSubscriptionAdamID:", v5, v28, v29, v30, v31);
LABEL_45:

}

@end
