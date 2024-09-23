@implementation MPStorePlatformInitPropertySongMap

void ___MPStorePlatformInitPropertySongMap_block_invoke_7_134(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kind"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shouldBookmarkPlayPosition"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("shouldBookmarkPlayPosition"));
}

void ___MPStorePlatformInitPropertySongMap_block_invoke_5_124(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

void ___MPStorePlatformInitPropertySongMap_block_invoke_4_121(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("genreNames"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("genreNames"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("genres"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("genres"));
}

void ___MPStorePlatformInitPropertySongMap_block_invoke_3_116(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a2, "valueForKeyPath:", CFSTR("composer.name"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("name"));

}

void ___MPStorePlatformInitPropertySongMap_block_invoke_2_109(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("artistId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("id"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("artistName"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("name"));
}

void ___MPStorePlatformInitPropertySongMap_block_invoke_91(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("collectionId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("id"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("collectionName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("name"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("releaseDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("releaseDate"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trackCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("trackCount"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("discCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("discCount"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("children"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("children"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("copyright"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("copyright"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isPreorder"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("isPreorder"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("genreNames"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("genreNames"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("genres"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("genres"));
}

void *___MPStorePlatformInitPropertySongMap_block_invoke_10()
{
  return &unk_1E31E6640;
}

id ___MPStorePlatformInitPropertySongMap_block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("releaseDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _MPStorePlatformDateFromString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _MPStorePlatformCalendar();
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

id ___MPStorePlatformInitPropertySongMap_block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", CFSTR("uploadedAudio")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqual:", CFSTR("uploadedVideo")) ^ 1;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("offers.type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countForObject:", CFSTR("subscription"));

  if (v6)
    v7 = v4;
  else
    v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t ___MPStorePlatformInitPropertySongMap_block_invoke_7()
{
  return 0;
}

id ___MPStorePlatformInitPropertySongMap_block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  if ((objc_msgSend(v2, "isEqual:", CFSTR("musicVideo")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v2, "isEqual:", CFSTR("uploadedVideo"));
  objc_msgSend(v3, "numberWithInt:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id ___MPStorePlatformInitPropertySongMap_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:", CFSTR("uploadedAudio")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqual:", CFSTR("uploadedVideo"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id ___MPStorePlatformInitPropertySongMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("durationInMillis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "doubleValue");
    v6 = v5 / 1000.0;
    v7 = v4;
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("offers"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "valueForKeyPath:", CFSTR("assets.@max.duration"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;

          if (v12 < v16)
            v12 = v16;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }
    else
    {
      v12 = 0.0;
    }

    v7 = (void *)MEMORY[0x1E0CB37E8];
    v6 = v12;
  }
  objc_msgSend(v7, "numberWithDouble:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void ___MPStorePlatformInitPropertySongMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a2;
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___MPStorePlatformInitPropertySongMap_block_invoke_2;
  v15[3] = &unk_1E3163A30;
  v8 = v6;
  v16 = v8;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "setUniversalStoreIdentifiersWithBlock:", v15);
  objc_msgSend(v10, "personID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = ___MPStorePlatformInitPropertySongMap_block_invoke_3;
  v13[3] = &unk_1E3162BA8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v9, "setPersonalStoreIdentifiersWithPersonID:block:", v11, v13);

}

void ___MPStorePlatformInitPropertySongMap_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  CFStringRef v24;
  id v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t quot;
  lldiv_t v29;
  uint64_t v30;
  const UInt8 *v31;
  __CFString *v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _QWORD v48[3];
  _BYTE v49[120];

  *(_QWORD *)&v49[104] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("id"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "longLongValue");
  else
    v5 = 0;

  objc_msgSend(v3, "setAdamID:", v5);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("formerIds"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (!v8)
      goto LABEL_14;
    v9 = v8;
    v10 = *(_QWORD *)v44;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(v7);
        if (!_NSIsNSNumber())
        {
          v37 = a1;
          v38 = v3;

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v14 = v7;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (!v15)
            goto LABEL_30;
          v16 = v15;
          v17 = *(_QWORD *)v40;
          while (1)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v40 != v17)
                objc_enumerationMutation(v14);
              v19 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * j);
              if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
              {
                v20 = objc_msgSend(v19, "longLongValue");

                if (!v20)
                  continue;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v20);
                v19 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObject:", v19);
              }

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            if (!v16)
            {
LABEL_30:

              a1 = v37;
              v3 = v38;
              goto LABEL_37;
            }
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (!v9)
      {
LABEL_14:

        v12 = v7;
LABEL_36:
        v13 = v12;
LABEL_37:

        goto LABEL_38;
      }
    }
  }
  if (_NSIsNSNumber())
  {
    v48[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = v6;
    if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    {
      v22 = objc_msgSend(v21, "longLongValue");

      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v22);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v48[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
    }
    else
    {

    }
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_38:

  objc_msgSend(v3, "setFormerAdamIDs:", v13);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("libraryTrackId"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v24 = (CFStringRef)v23;
  }
  else
  {
    if (!_NSIsNSNumber())
    {
      v32 = 0;
      goto LABEL_55;
    }
    v25 = v23;
    if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
      v26 = objc_msgSend(v25, "longLongValue");
    else
      v26 = 0;

    v27 = &v49[1];
    quot = v26;
    do
    {
      v29 = lldiv(quot, 10);
      quot = v29.quot;
      if (v29.rem >= 0)
        LOBYTE(v30) = v29.rem;
      else
        v30 = -v29.rem;
      *(v27 - 2) = v30 + 48;
      v31 = v27 - 2;
      --v27;
    }
    while (v29.quot);
    if (v26 < 0)
    {
      *(v27 - 2) = 45;
      v31 = v27 - 2;
    }
    v24 = CFStringCreateWithBytes(0, v31, v49 - v31, 0x8000100u, 0);
  }
  v32 = (__CFString *)v24;
LABEL_55:

  objc_msgSend(v3, "setUniversalCloudLibraryID:", v32);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("purchasedAdamId"));
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v34 = objc_msgSend(v33, "longLongValue");
  else
    v34 = 0;

  objc_msgSend(v3, "setPurchasedAdamID:", v34);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("subscribedAdamID"));
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v36 = objc_msgSend(v35, "longLongValue");
  else
    v36 = 0;

  objc_msgSend(v3, "setSubscriptionAdamID:", v36);
}

void ___MPStorePlatformInitPropertySongMap_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sagaId"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v5, "longLongValue");
  else
    v4 = 0;

  objc_msgSend(v3, "setCloudID:", v4);
}

@end
