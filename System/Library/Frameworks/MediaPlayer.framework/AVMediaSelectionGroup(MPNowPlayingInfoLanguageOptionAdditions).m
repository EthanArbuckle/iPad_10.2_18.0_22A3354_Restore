@implementation AVMediaSelectionGroup(MPNowPlayingInfoLanguageOptionAdditions)

- (MPNowPlayingInfoLanguageOptionGroup)makeNowPlayingInfoLanguageOptionGroup
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MPNowPlayingInfoLanguageOptionGroup *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "makeNowPlayingInfoLanguageOption");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  objc_msgSend(a1, "defaultOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "defaultOption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "makeNowPlayingInfoLanguageOption");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  v12 = -[MPNowPlayingInfoLanguageOptionGroup initWithLanguageOptions:defaultLanguageOption:allowEmptySelection:]([MPNowPlayingInfoLanguageOptionGroup alloc], "initWithLanguageOptions:defaultLanguageOption:allowEmptySelection:", v2, v11, objc_msgSend(a1, "allowsEmptySelection"));
  return v12;
}

@end
