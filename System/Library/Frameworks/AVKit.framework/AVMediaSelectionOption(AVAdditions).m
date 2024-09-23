@implementation AVMediaSelectionOption(AVAdditions)

- (id)avkit_displayName
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C8B200], "avkit_offOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == a1)
  {
    v5 = CFSTR("MEDIA_SELECTION_OPTION_OFF_TITLE");
LABEL_6:
    AVLocalizedString(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  objc_msgSend(MEMORY[0x1E0C8B200], "avkit_autoOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v5 = CFSTR("MEDIA_SELECTION_OPTION_AUTO_TITLE");
    goto LABEL_6;
  }
  v4 = 0;
  return v4;
}

- (id)localizedDisplayName
{
  void *v2;

  objc_msgSend(a1, "avkit_displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "displayName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)mediaRemoteIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "avkit_title");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_1E5BB5F88;
  objc_msgSend(a1, "extendedLanguageTag");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1E5BB5F88;
  objc_msgSend(a1, "displayName");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E5BB5F88;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%@-%@"), v5, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (__CFString)avkit_title
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v1 = (void *)MEMORY[0x1E0C8B220];
  objc_msgSend(a1, "commonMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "metadataItemsFromArray:filteredByIdentifier:", v2, *MEMORY[0x1E0C8A870]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)objc_msgSend(v5, "copy");
  v7 = v6;
  if (!v6)
    v6 = &stru_1E5BB5F88;
  v8 = v6;

  return v8;
}

+ (id)avkit_offOption
{
  if (avkit_offOption_onceToken != -1)
    dispatch_once(&avkit_offOption_onceToken, &__block_literal_global_24500);
  return (id)avkit_offOption_mediaSelectionOffOption;
}

+ (id)avkit_autoOption
{
  if (avkit_autoOption_onceToken != -1)
    dispatch_once(&avkit_autoOption_onceToken, &__block_literal_global_1_24499);
  return (id)avkit_autoOption_mediaSelectionAutoOption;
}

@end
