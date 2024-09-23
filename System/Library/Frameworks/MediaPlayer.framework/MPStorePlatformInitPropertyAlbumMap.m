@implementation MPStorePlatformInitPropertyAlbumMap

void ___MPStorePlatformInitPropertyAlbumMap_block_invoke_14(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

void ___MPStorePlatformInitPropertyAlbumMap_block_invoke_13(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

id ___MPStorePlatformInitPropertyAlbumMap_block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("classicalUrl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = v3;

  return v4;
}

uint64_t ___MPStorePlatformInitPropertyAlbumMap_block_invoke_11()
{
  return 0;
}

void *___MPStorePlatformInitPropertyAlbumMap_block_invoke_10()
{
  return &unk_1E31E6640;
}

id ___MPStorePlatformInitPropertyAlbumMap_block_invoke_9(uint64_t a1, void *a2)
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

id ___MPStorePlatformInitPropertyAlbumMap_block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("children.offers.type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countForObject:", CFSTR("subscription")) != 0;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;

  return v8;
}

uint64_t ___MPStorePlatformInitPropertyAlbumMap_block_invoke_7()
{
  return 0;
}

id ___MPStorePlatformInitPropertyAlbumMap_block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("releaseDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _MPStorePlatformDateFromString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _MPStorePlatformCalendar();
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

id ___MPStorePlatformInitPropertyAlbumMap_block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("children.contentRatingsBySystem.riaa.value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("contentRatingsBySystem.riaa.value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "valueForKeyPath:", CFSTR("@max.self"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

  }
  else if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6 > 499);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id ___MPStorePlatformInitPropertyAlbumMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("children.contentRatingsBySystem.riaa.value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("contentRatingsBySystem.riaa.value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "valueForKeyPath:", CFSTR("@min.self"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

  }
  else if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    v6 = 1000;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6 < 500);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void ___MPStorePlatformInitPropertyAlbumMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  v15[2] = ___MPStorePlatformInitPropertyAlbumMap_block_invoke_2;
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
  v13[2] = ___MPStorePlatformInitPropertyAlbumMap_block_invoke_3;
  v13[3] = &unk_1E3162BA8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v9, "setPersonalStoreIdentifiersWithPersonID:block:", v11, v13);

}

void ___MPStorePlatformInitPropertyAlbumMap_block_invoke_2(uint64_t a1, void *a2)
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

void ___MPStorePlatformInitPropertyAlbumMap_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  CFStringRef v5;
  id v6;
  uint64_t v7;
  char *v8;
  uint64_t quot;
  lldiv_t v10;
  uint64_t v11;
  const UInt8 *v12;
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("libraryAlbumId"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v5 = (CFStringRef)v4;
  }
  else
  {
    if (!_NSIsNSNumber())
    {
      v13 = 0;
      goto LABEL_18;
    }
    v6 = v4;
    if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v6, "longLongValue");
    else
      v7 = 0;

    v8 = (char *)&v14 + 1;
    quot = v7;
    do
    {
      v10 = lldiv(quot, 10);
      quot = v10.quot;
      if (v10.rem >= 0)
        LOBYTE(v11) = v10.rem;
      else
        v11 = -v10.rem;
      *(v8 - 2) = v11 + 48;
      v12 = (const UInt8 *)(v8 - 2);
      --v8;
    }
    while (v10.quot);
    if (v7 < 0)
    {
      *(v8 - 2) = 45;
      v12 = (const UInt8 *)(v8 - 2);
    }
    v5 = CFStringCreateWithBytes(0, v12, (char *)&v14 - (char *)v12, 0x8000100u, 0);
  }
  v13 = (__CFString *)v5;
LABEL_18:

  objc_msgSend(v3, "setCloudAlbumID:", v13);
}

@end
