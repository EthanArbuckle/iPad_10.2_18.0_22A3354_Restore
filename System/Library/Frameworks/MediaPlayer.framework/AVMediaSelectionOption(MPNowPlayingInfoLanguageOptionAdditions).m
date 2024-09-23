@implementation AVMediaSelectionOption(MPNowPlayingInfoLanguageOptionAdditions)

- (MPNowPlayingInfoLanguageOption)makeNowPlayingInfoLanguageOption
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  MPNowPlayingInfoLanguageOption *v14;
  void *v15;
  void *v16;
  void *v17;
  MPNowPlayingInfoLanguageOption *v18;

  if ((objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A6F0]) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    if (!objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A770]))
    {
      v18 = 0;
      return v18;
    }
    v2 = 1;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "mediaCharacteristics");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *MEMORY[0x1E0C8A750];
    if (objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A750]))
      objc_msgSend(v3, "addObject:", v4);
    v5 = *MEMORY[0x1E0C8A748];
    if (objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A748]))
      objc_msgSend(v3, "addObject:", v5);
    v6 = *MEMORY[0x1E0C8A710];
    if (objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A710]))
      objc_msgSend(v3, "addObject:", v6);
    v7 = *MEMORY[0x1E0C8A780];
    if (objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A780]))
      objc_msgSend(v3, "addObject:", v7);
    v8 = *MEMORY[0x1E0C8A720];
    if (objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A720]))
      objc_msgSend(v3, "addObject:", v8);
    v9 = *MEMORY[0x1E0C8A728];
    if (objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A728]))
      objc_msgSend(v3, "addObject:", v9);
    v10 = *MEMORY[0x1E0C8A738];
    if (objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A738]))
      objc_msgSend(v3, "addObject:", v10);
    v11 = *MEMORY[0x1E0C8A768];
    if (objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A768]))
      objc_msgSend(v3, "addObject:", v11);
    v12 = *MEMORY[0x1E0C8A730];
    if (objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A730]))
      objc_msgSend(v3, "addObject:", v12);
    v13 = *MEMORY[0x1E0C8A790];
    if (objc_msgSend(a1, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A790]))
      objc_msgSend(v3, "addObject:", v13);
  }
  if (v3 && !objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }
  v14 = [MPNowPlayingInfoLanguageOption alloc];
  objc_msgSend(a1, "extendedLanguageTag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_languageOptionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPNowPlayingInfoLanguageOption initWithType:languageTag:characteristics:displayName:identifier:](v14, "initWithType:languageTag:characteristics:displayName:identifier:", v2, v15, v3, v16, v17);

  return v18;
}

- (id)_languageOptionIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "extendedLanguageTag");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("NULL");
  if (v3)
    v6 = (const __CFString *)v3;
  else
    v6 = CFSTR("NULL");
  objc_msgSend(a1, "mediaType");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v5 = (const __CFString *)v7;
  objc_msgSend(a1, "displayName");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("?");
  if (v9)
    v11 = (const __CFString *)v9;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("MediaRemoteLanguageOption/%@/%@ \"%@\"), v6, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
