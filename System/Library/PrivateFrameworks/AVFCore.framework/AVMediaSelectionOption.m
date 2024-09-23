@implementation AVMediaSelectionOption

- (id)optionID
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5F20]);
}

- (BOOL)displaysNonForcedSubtitles
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return objc_msgSend((id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5ED8]), "BOOLValue");
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, language = %@%@>"), NSStringFromClass(v4), self, -[AVMediaSelectionOption extendedLanguageTag](self, "extendedLanguageTag"), -[AVMediaSelectionOption _ancillaryDescription](self, "_ancillaryDescription"));
}

- (NSString)extendedLanguageTag
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (NSString *)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5EE0]);
}

- (id)_ancillaryDescription
{
  NSString *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  const __CFString *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  const __CFString *v24;
  const __CFString *v25;
  AVMediaSelectionOption *v26;
  AVMediaSelectionOption *v27;
  void *v28;
  objc_class *v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t k;
  unsigned int v35;
  int v36;
  const __CFString *v37;
  const __CFString *v38;
  id v40;
  _BOOL4 v41;
  _BOOL4 v42;
  NSString *v43;
  const __CFString *v44;
  const __CFString *v45;
  unsigned int valuePtr;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = -[AVMediaSelectionOption mediaType](self, "mediaType");
  v40 = -[AVMediaSelectionOption group](self, "group");
  v4 = -[AVMediaSelectionOption _title](self, "_title");
  v5 = -[AVMediaSelectionOption _taggedMediaCharacteristics](self, "_taggedMediaCharacteristics");
  v6 = -[AVMediaSelectionOption associatedExtendedLanguageTag](self, "associatedExtendedLanguageTag");
  v7 = v6;
  if (v4)
  {
    v45 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", title = %@"), v4);
    if (v7)
    {
LABEL_3:
      v44 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", associated language = %@"), v7);
      goto LABEL_6;
    }
  }
  else
  {
    v45 = &stru_1E303A378;
    if (v6)
      goto LABEL_3;
  }
  v44 = &stru_1E303A378;
LABEL_6:
  if (objc_msgSend(v5, "count"))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E303A378);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v48 != v12)
            objc_enumerationMutation(v5);
          v14 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          if (-v11 != i)
            objc_msgSend(v8, "appendString:", CFSTR(", "));
          objc_msgSend(v8, "appendString:", v14);
        }
        v11 += v10;
        v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v10);
    }
    v15 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", tagged media characteristics = {%@}"), v8);
  }
  else
  {
    v15 = &stru_1E303A378;
  }
  v16 = -[AVMediaSelectionOption _isDesignatedDefault](self, "_isDesignatedDefault");
  v17 = -[AVMediaSelectionOption _isAuxiliaryContent](self, "_isAuxiliaryContent");
  v18 = -[AVMediaSelectionOption fallbackIDs](self, "fallbackIDs");
  if (v18)
  {
    v19 = v18;
    v42 = v16;
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E303A378);
    v21 = objc_msgSend(v19, "count");
    if (v21)
    {
      v22 = v21;
      for (j = 0; j != v22; ++j)
      {
        if (j)
          objc_msgSend(v20, "appendString:", CFSTR(", "));
        objc_msgSend(v20, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend((id)objc_msgSend(v19, "objectAtIndex:", j), "integerValue")));
      }
    }
    v24 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", fallback track or variant IDs = {%@}"), v20);
    v16 = v42;
  }
  else
  {
    v24 = &stru_1E303A378;
  }
  if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("sbtl"))
    || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("text")))
  {
    if (-[AVMediaSelectionOption hasMediaCharacteristic:](self, "hasMediaCharacteristic:", CFSTR("public.subtitles.forced-only")))
    {
      v25 = CFSTR(", forced subtitles only");
      goto LABEL_42;
    }
    if (v40)
    {
      v26 = -[AVMediaSelectionOption associatedMediaSelectionOptionInMediaSelectionGroup:](self, "associatedMediaSelectionOptionInMediaSelectionGroup:");
      if (v26)
      {
        v27 = v26;
        v28 = (void *)MEMORY[0x1E0CB3940];
        v29 = (objc_class *)objc_opt_class();
        v25 = (const __CFString *)objc_msgSend(v28, "stringWithFormat:", CFSTR(", associated forced-only option = <%@: %p>"), NSStringFromClass(v29), v27);
        goto LABEL_42;
      }
    }
    goto LABEL_40;
  }
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("soun")))
  {
LABEL_40:
    v25 = &stru_1E303A378;
    goto LABEL_42;
  }
  v30 = -[AVMediaSelectionOption mediaSubTypes](self, "mediaSubTypes");
  v31 = -[NSArray count](v30, "count");
  if (v31)
  {
    v32 = v31;
    v41 = v17;
    v43 = v3;
    v33 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E303A378);
    for (k = 0; k != v32; ++k)
    {
      valuePtr = 0;
      CFNumberGetValue((CFNumberRef)-[NSArray objectAtIndex:](v30, "objectAtIndex:", k), kCFNumberSInt32Type, &valuePtr);
      v35 = valuePtr;
      if (k)
        objc_msgSend(v33, "appendString:", CFSTR(", "));
      v36 = bswap32(v35);
      objc_msgSend(v33, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%c%c%c%c'"), (char)v36, ((__int16)v36 >> 8), (v36 << 8 >> 24), (v36 >> 24)));
    }
    v25 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", mediaSubTypes = {%@}"), v33);
    v3 = v43;
    v17 = v41;
  }
  else
  {
    v25 = &stru_1E303A378;
  }
LABEL_42:
  if (v17)
    v37 = CFSTR(", auxiliary = YES");
  else
    v37 = &stru_1E303A378;
  if (v16)
    v38 = CFSTR(", default = YES");
  else
    v38 = &stru_1E303A378;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", mediaType = '%@'%@%@%@%@%@%@%@"), v3, v25, v24, v15, v45, v38, v37, v44);
}

- (BOOL)_isDesignatedDefault
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return objc_msgSend((id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5EF8]), "BOOLValue");
}

+ (id)mediaSelectionOptionForAsset:(id)a3 group:(id)a4 dictionary:(id)a5 hasUnderlyingTrack:(BOOL)a6
{
  __objc2_class **v6;

  v6 = off_1E302A590;
  if (!a6)
    v6 = off_1E302A580;
  return (id)objc_msgSend(objc_alloc(*v6), "initWithAsset:group:dictionary:", a3, a4, a5);
}

- (AVMediaSelectionOption)initWithGroup:(id)a3
{
  AVMediaSelectionOption *v4;
  AVMediaSelectionOptionInternal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMediaSelectionOption;
  v4 = -[AVMediaSelectionOption init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVMediaSelectionOptionInternal);
    v4->_mediaSelectionOption = v5;
    if (v5)
    {
      v4->_mediaSelectionOption->_groupMediaCharacteristics = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "_groupMediaCharacteristics"), "copy");
      v4->_mediaSelectionOption->_synthesizeMediaCharacteristicsOnce = objc_alloc_init(AVDispatchOnce);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (NSArray)mediaSubTypes
{
  NSArray *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  v5 = (void *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CC5F08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v3;
          v12 = v10;
LABEL_11:
          -[NSArray addObject:](v11, "addObject:", v12);
          goto LABEL_12;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", AVOSTypeForString(v10));
          if (v13)
          {
            v12 = (void *)v13;
            v11 = v3;
            goto LABEL_11;
          }
        }
LABEL_12:
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  return v3;
}

- (id)fallbackIDs
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5EE8]);
}

- (id)associatedExtendedLanguageTag
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5EA8]);
}

- (id)_title
{
  NSArray *v2;
  id v3;
  NSArray *v4;
  NSArray *v5;

  v2 = +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", -[AVMediaSelectionOption commonMetadata](self, "commonMetadata"), CFSTR("title"), CFSTR("comn"));
  v3 = -[NSArray count](v2, "count");
  if (v3)
  {
    v4 = +[AVMetadataItem metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:](AVMetadataItem, "metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:", v2, objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages"));
    if (-[NSArray count](v4, "count"))
      v5 = v4;
    else
      v5 = v2;
    v3 = -[NSArray objectAtIndex:](v5, "objectAtIndex:", 0);
  }
  return (id)objc_msgSend(v3, "stringValue");
}

- (id)_taggedMediaCharacteristics
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5F28]);
}

- (BOOL)_isAuxiliaryContent
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return objc_msgSend((id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5EF0]), "BOOLValue");
}

- (id)propertyList
{
  id v3;
  id v4;
  id v5;
  NSNumber *v6;
  NSArray *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  id v14;

  v3 = -[AVMediaSelectionOption optionID](self, "optionID");
  v4 = -[AVMediaSelectionOption outOfBandIdentifier](self, "outOfBandIdentifier");
  v5 = -[AVMediaSelectionOption outOfBandSource](self, "outOfBandSource");
  v6 = -[AVMediaSelectionOption _audioCompositionPresetIndex](self, "_audioCompositionPresetIndex");
  v7 = -[AVMediaSelectionOption _audioCompositionPresetIndexesForFallbackIDs](self, "_audioCompositionPresetIndexesForFallbackIDs");
  if (!v3 && !v4 && !v5)
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  objc_msgSend(v8, "setValue:forKey:", v3, *MEMORY[0x1E0CC5F20]);
  objc_msgSend(v8, "setValue:forKey:", v4, *MEMORY[0x1E0CC5ED0]);
  objc_msgSend(v8, "setValue:forKey:", v5, *MEMORY[0x1E0CC5F30]);
  objc_msgSend(v8, "setValue:forKey:", v6, *MEMORY[0x1E0CC5EC0]);
  objc_msgSend(v8, "setValue:forKey:", v7, *MEMORY[0x1E0CC5EC8]);
  v9 = -[AVMediaSelectionOption _groupID](self, "_groupID");
  v10 = -[AVMediaSelectionOption _groupMediaType](self, "_groupMediaType");
  if (v9)
  {
    v11 = (_QWORD *)MEMORY[0x1E0CC5E88];
    v12 = v9;
LABEL_8:
    objc_msgSend(v8, "setObject:forKey:", v12, *v11);
    goto LABEL_9;
  }
  v12 = v10;
  if (v10)
  {
    v11 = (_QWORD *)MEMORY[0x1E0CC5E98];
    goto LABEL_8;
  }
LABEL_9:
  if (-[NSString isEqualToString:](-[AVMediaSelectionOption mediaType](self, "mediaType", v12), "isEqualToString:", CFSTR("sbtl"))|| -[NSString isEqualToString:](-[AVMediaSelectionOption mediaType](self, "mediaType"), "isEqualToString:", CFSTR("text")))
  {
    if (-[AVMediaSelectionOption displaysNonForcedSubtitles](self, "displaysNonForcedSubtitles"))
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      objc_msgSend(v8, "setObject:forKey:", v13, *MEMORY[0x1E0CC5ED8]);
    }
  }
  v14 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CC5F18]), *MEMORY[0x1E0CC5F18]);
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CC5F00]), *MEMORY[0x1E0CC5F00]);
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CC5EE0]), *MEMORY[0x1E0CC5EE0]);
  objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CC5F28]), *MEMORY[0x1E0CC5F28]);
  if (v8)
    return (id)objc_msgSend(v8, "copy");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (id)outOfBandSource
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5F30]);
}

- (id)outOfBandIdentifier
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5ED0]);
}

- (void)dealloc
{
  AVMediaSelectionOptionInternal *mediaSelectionOption;
  objc_super v4;

  mediaSelectionOption = self->_mediaSelectionOption;
  if (mediaSelectionOption)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVMediaSelectionOption;
  -[AVMediaSelectionOption dealloc](&v4, sel_dealloc);
}

+ (id)mediaSelectionNilOptionForGroup:(id)a3
{
  return -[AVMediaSelectionNilOption initWithGroup:]([AVMediaSelectionNilOption alloc], "initWithGroup:", a3);
}

+ (BOOL)_plistHasOptionIdentifier:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC5F20])
    || objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC5ED0]))
  {
    return 1;
  }
  return objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC5F30]) != 0;
}

- (AVMediaSelectionOption)init
{
  return -[AVMediaSelectionOption initWithGroup:](self, "initWithGroup:", 0);
}

- (id)dictionary
{
  return 0;
}

- (id)group
{
  return 0;
}

- (id)_groupID
{
  return 0;
}

- (id)_groupMediaType
{
  return 0;
}

- (id)_groupMediaCharacteristics
{
  return self->_mediaSelectionOption->_groupMediaCharacteristics;
}

- (AVMediaType)mediaType
{
  return (AVMediaType)objc_msgSend(MEMORY[0x1E0CB3940], "string");
}

- (id)_track
{
  return 0;
}

- (BOOL)_isMainProgramContent
{
  return !-[AVMediaSelectionOption _isAuxiliaryContent](self, "_isAuxiliaryContent");
}

- (BOOL)hasMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  return objc_msgSend(-[AVMediaSelectionOption mediaCharacteristics](self, "mediaCharacteristics"), "containsObject:", mediaCharacteristic);
}

- (id)mediaCharacteristics
{
  AVDispatchOnce *synthesizeMediaCharacteristicsOnce;
  _QWORD v5[5];

  synthesizeMediaCharacteristicsOnce = self->_mediaSelectionOption->_synthesizeMediaCharacteristicsOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVMediaSelectionOption_mediaCharacteristics__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](synthesizeMediaCharacteristicsOnce, "runBlockOnce:", v5);
  return self->_mediaSelectionOption->_optionMediaCharacteristics;
}

id __46__AVMediaSelectionOption_mediaCharacteristics__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const AVMediaCharacteristic *v8;
  id result;

  if (objc_msgSend(*(id *)(a1 + 32), "_groupMediaCharacteristics"))
    v2 = objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:");
  else
    v2 = objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)v2;
  v4 = objc_msgSend(+[AVAssetTrack mediaCharacteristicsForMediaTypes](AVAssetTrack, "mediaCharacteristicsForMediaTypes"), "objectForKey:", objc_msgSend(*(id *)(a1 + 32), "mediaType"));
  if (v4)
    objc_msgSend(v3, "addObjectsFromArray:", v4);
  v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_track"), "mediaCharacteristics");
  if (v5)
    objc_msgSend(v3, "addObjectsFromArray:", v5);
  v6 = objc_msgSend(*(id *)(a1 + 32), "_taggedMediaCharacteristics");
  if (v6)
    objc_msgSend(v3, "addObjectsFromArray:", v6);
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "mediaType"), "isEqualToString:", CFSTR("sbtl"))
    && (objc_msgSend(*(id *)(a1 + 32), "displaysNonForcedSubtitles") & 1) == 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("public.subtitles.forced-only"));
  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "_isAuxiliaryContent");
  v8 = &AVMediaCharacteristicIsAuxiliaryContent;
  if (!v7)
    v8 = &AVMediaCharacteristicIsMainProgramContent;
  objc_msgSend(v3, "addObject:", *v8);
  result = (id)objc_msgSend(v3, "allObjects");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = result;
  return result;
}

- (BOOL)isPlayable
{
  return 1;
}

- (NSLocale)locale
{
  return 0;
}

- (NSString)unicodeLanguageIdentifier
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (NSString *)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5F40]);
}

- (id)associatedUnicodeLanguageIdentifier
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5EB8]);
}

- (id)languageCode
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5F00]);
}

- (NSString)unicodeLanguageCode
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (NSString *)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5F38]);
}

- (id)associatedPersistentIDs
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5EB0]);
}

- (NSNumber)_audioCompositionPresetIndex
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (NSNumber *)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5EC0]);
}

- (NSArray)_audioCompositionPresetIndexesForFallbackIDs
{
  id v2;

  v2 = -[AVMediaSelectionOption dictionary](self, "dictionary");
  return (NSArray *)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5EC8]);
}

- (BOOL)_representsNilSelection
{
  return 0;
}

- (NSArray)commonMetadata
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSArray)availableMetadataFormats
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSArray)metadataForFormat:(NSString *)format
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array", format);
}

- (AVMediaSelectionOption)associatedMediaSelectionOptionInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  AVMediaSelectionOption *v17;
  NSLocale *v18;
  NSLocale *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = -[AVMediaSelectionOption group](self, "group");
  if ((-[AVMediaSelectionGroup isEqual:](mediaSelectionGroup, "isEqual:", v5) & 1) != 0
    || !objc_msgSend(-[AVMediaSelectionGroup asset](mediaSelectionGroup, "asset"), "isEqual:", objc_msgSend(v5, "asset")))
  {
    return 0;
  }
  v6 = -[AVMediaSelectionOption associatedPersistentIDs](self, "associatedPersistentIDs");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    v32 = *(_QWORD *)v47;
    v33 = v6;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v12 = -[AVMediaSelectionGroup options](mediaSelectionGroup, "options", v32);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v43;
LABEL_10:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v43 != v15)
              objc_enumerationMutation(v12);
            v17 = *(AVMediaSelectionOption **)(*((_QWORD *)&v42 + 1) + 8 * v16);
            if ((objc_msgSend(v11, "isEqual:", -[AVMediaSelectionOption optionID](v17, "optionID")) & 1) != 0)
              return v17;
            if (v14 == ++v16)
            {
              v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
              if (v14)
                goto LABEL_10;
              break;
            }
          }
        }
        v9 = v32;
        v6 = v33;
      }
      v8 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      if (v8)
        continue;
      break;
    }
  }
  v18 = -[AVMediaSelectionOption locale](self, "locale");
  if (!v18)
    return 0;
  v19 = v18;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v20 = -[AVMediaSelectionGroup options](mediaSelectionGroup, "options");
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (!v21)
  {
LABEL_29:
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v25 = -[AVMediaSelectionGroup options](mediaSelectionGroup, "options");
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v35;
LABEL_31:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v25);
        v17 = *(AVMediaSelectionOption **)(*((_QWORD *)&v34 + 1) + 8 * v29);
        v30 = -[AVMediaSelectionOption associatedExtendedLanguageTag](v17, "associatedExtendedLanguageTag");
        if (v30)
        {
          if (-[NSString isEqualToString:](-[AVMediaSelectionOption extendedLanguageTag](self, "extendedLanguageTag"), "isEqualToString:", v30)&& (!-[AVMediaSelectionOption hasMediaCharacteristic:](v17, "hasMediaCharacteristic:", CFSTR("AVMediaCharacteristicLegible"))|| -[AVMediaSelectionOption hasMediaCharacteristic:](v17, "hasMediaCharacteristic:", CFSTR("public.subtitles.forced-only"))))
          {
            return v17;
          }
        }
        if (v27 == ++v29)
        {
          v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
          v17 = 0;
          if (v27)
            goto LABEL_31;
          return v17;
        }
      }
    }
    return 0;
  }
  v22 = v21;
  v23 = *(_QWORD *)v39;
LABEL_21:
  v24 = 0;
  while (1)
  {
    if (*(_QWORD *)v39 != v23)
      objc_enumerationMutation(v20);
    v17 = *(AVMediaSelectionOption **)(*((_QWORD *)&v38 + 1) + 8 * v24);
    if (AVNSLocalesMatchAccordingToRFC4647FilteringRules(v19, -[AVMediaSelectionOption locale](v17, "locale")))
    {
      if (!-[AVMediaSelectionOption hasMediaCharacteristic:](v17, "hasMediaCharacteristic:", CFSTR("AVMediaCharacteristicLegible"))|| -[AVMediaSelectionOption hasMediaCharacteristic:](v17, "hasMediaCharacteristic:", CFSTR("public.subtitles.forced-only")))
      {
        return v17;
      }
    }
    if (v22 == ++v24)
    {
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      if (v22)
        goto LABEL_21;
      goto LABEL_29;
    }
  }
}

- (id)_preferredMetadataTitleAccordingToPreferredLanguages:(id)a3 fallingBackToMatchingEmptyLocale:(BOOL)a4 excludeM3U8Metadata:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  id result;
  id v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v5 = a5;
  v6 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v9 = -[AVMediaSelectionOption commonMetadata](self, "commonMetadata");
  if (!-[AVMediaSelectionOption _track](self, "_track")
    && -[AVMediaSelectionOption _isMainProgramContent](self, "_isMainProgramContent")
    && v5)
  {
    v10 = (NSArray *)(id)-[NSArray mutableCopy](v9, "mutableCopy");
    -[NSArray removeObjectsInArray:](v10, "removeObjectsInArray:", +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v9, CFSTR("NAME"), CFSTR("m3u8")));
    v9 = v10;
  }
  v11 = +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v9, CFSTR("title"), CFSTR("comn"));
  v12 = +[AVMetadataItem metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:](AVMetadataItem, "metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:", v11, a3);
  if (!-[NSArray count](v12, "count") && -[NSArray count](v11, "count") >= 2)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v18, "extendedLanguageTag"))
            objc_msgSend(v13, "addObject:", objc_msgSend(v18, "extendedLanguageTag"));
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v15);
    }
    v19 = (void *)FigCopyRankedLanguagesAccordingToPreferredLanguages2();
    if (CFArrayGetCount((CFArrayRef)v19) >= 1)
    {
      v34 = objc_msgSend(v19, "firstObject");
      v12 = +[AVMetadataItem metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:](AVMetadataItem, "metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:", v11, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1));
    }
    if (v19)
      CFRelease(v19);
  }
  if (-[NSArray count](v12, "count"))
  {
    v20 = -[NSArray objectAtIndex:](v12, "objectAtIndex:", 0);
    return (id)objc_msgSend(v20, "stringValue");
  }
  else
  {
    if (v6)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (!result)
        return result;
      v22 = result;
      v23 = *(_QWORD *)v26;
LABEL_26:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v11);
        v20 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * v24);
        if (!objc_msgSend(v20, "locale"))
          break;
        if (v22 == (id)++v24)
        {
          v22 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          result = 0;
          if (v22)
            goto LABEL_26;
          return result;
        }
      }
      if ((objc_msgSend((id)objc_msgSend(v20, "identifier"), "isEqual:", CFSTR("udta/name")) & 1) == 0)
        return (id)objc_msgSend(v20, "stringValue");
    }
    return 0;
  }
}

- (id)_languageDisplayNameFromMetadataAccordingToPreferredLanguages:(id)a3 fallingBackToMatchingEmptyLocale:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (-[AVMediaSelectionOption hasMediaCharacteristic:](self, "hasMediaCharacteristic:", CFSTR("com.apple.has-language-display-name-as-name")))
  {
    return -[AVMediaSelectionOption _preferredMetadataTitleAccordingToPreferredLanguages:fallingBackToMatchingEmptyLocale:excludeM3U8Metadata:](self, "_preferredMetadataTitleAccordingToPreferredLanguages:fallingBackToMatchingEmptyLocale:excludeM3U8Metadata:", a3, v4, 0);
  }
  else
  {
    return 0;
  }
}

- (id)_displayNameWithLocale:(id)a3 fallingBackToMatchingUndeterminedAndMultilingual:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (-[AVMediaSelectionOption _updateDisplayNameWithLocale:fallingBackToMatchingUndeterminedAndMultilingual:context:](self, "_updateDisplayNameWithLocale:fallingBackToMatchingUndeterminedAndMultilingual:context:", a3, a4, 3))
  {

    self->_mediaSelectionOption->_displayName = 0;
    -[AVMediaSelectionOption _updateDisplayNameWithLocale:fallingBackToMatchingUndeterminedAndMultilingual:context:](self, "_updateDisplayNameWithLocale:fallingBackToMatchingUndeterminedAndMultilingual:context:", a3, v4, 5);
  }
  return self->_mediaSelectionOption->_displayName;
}

- (BOOL)_updateDisplayNameWithLocale:(id)a3 fallingBackToMatchingUndeterminedAndMultilingual:(BOOL)a4 context:(int64_t)a5
{
  _BOOL8 v6;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  id v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  NSString *v20;
  NSString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  const __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  const __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  const __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  const __CFString *v44;
  void *v45;
  __CFString *v46;
  const __CFString *v48;
  __CFString *v49;
  const __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  const __CFString *v53;
  __CFString *v54;
  __CFString *v55;
  const __CFString *v56;
  NSArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t i;
  __CFString *v63;
  __CFString *v64;
  const __CFString *v65;
  int64_t v66;
  id v67;
  const __CFString *bundleID;
  UInt32 ioPropertyDataSize;
  _OWORD inSpecifier[2];
  uint64_t v71;
  CFTypeRef outPropertyData;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;
  _QWORD v80[6];

  v6 = a4;
  v80[3] = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  if (objc_msgSend(v9, "count"))
    v10 = objc_msgSend(v9, "objectAtIndex:", 0);
  else
    v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), "localeIdentifier");
  if (v10)
    v11 = (__CFString *)v10;
  else
    v11 = CFSTR("en");
  if (a3)
  {
    if (-[__CFString isEqualToString:](v11, "isEqualToString:", objc_msgSend(a3, "localeIdentifier")))
      v12 = 0;
    else
      v12 = a3;
  }
  else
  {
    a3 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v11);
    v12 = 0;
  }
  if (!-[NSString isEqualToString:](self->_mediaSelectionOption->_displayNameLocaleIdentifier, "isEqualToString:", objc_msgSend(a3, "localeIdentifier")))
  {

    self->_mediaSelectionOption->_displayNameLocaleIdentifier = (NSString *)objc_msgSend((id)objc_msgSend(a3, "localeIdentifier"), "copy");
    self->_mediaSelectionOption->_displayName = 0;
  }
  if (self->_mediaSelectionOption->_displayName)
  {
    LOBYTE(v13) = 0;
    return v13;
  }
  bundleID = (const __CFString *)objc_msgSend(-[AVMediaSelectionOption group](self, "group"), "currentBundleIdentifier");
  v14 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C997E0]);
  if (v6)
  {
    v80[0] = v14;
    v80[1] = CFSTR("mul");
    v80[2] = CFSTR("und");
    v15 = (void *)MEMORY[0x1E0C99D20];
    v16 = v80;
    v17 = 3;
  }
  else
  {
    v79 = v14;
    v15 = (void *)MEMORY[0x1E0C99D20];
    v16 = &v79;
    v17 = 1;
  }
  v18 = (void *)objc_msgSend(v15, "arrayWithObjects:count:", v16, v17);
  v19 = -[AVMediaSelectionOption _preferredMetadataTitleAccordingToPreferredLanguages:fallingBackToMatchingEmptyLocale:excludeM3U8Metadata:](self, "_preferredMetadataTitleAccordingToPreferredLanguages:fallingBackToMatchingEmptyLocale:excludeM3U8Metadata:", v18, v6, 1);
  v20 = -[AVMediaSelectionOption extendedLanguageTag](self, "extendedLanguageTag");
  if (!v20)
  {
    v24 = 0;
    v26 = 0;
    goto LABEL_41;
  }
  v21 = v20;
  v66 = a5;
  v67 = v12;
  v22 = (void *)AVLanguageCodeFromExtendedLanguageTag(v20);
  if (!AVIsSpecialSpokenExtendedLanguageTag(v21))
    goto LABEL_29;
  v23 = objc_msgSend(a3, "displayNameForKey:value:", *MEMORY[0x1E0C997E8], v22);
  if (v23)
  {
    v24 = v23;
    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("no")) & 1) != 0
      || (objc_msgSend(v22, "isEqualToString:", CFSTR("nor")) & 1) != 0
      || (objc_msgSend(v22, "isEqualToString:", v21) & 1) == 0)
    {
      v25 = (__CFString *)objc_msgSend(a3, "localizedStringForLanguage:context:", v21, v66);
    }
    else
    {
      v25 = 0;
    }
    goto LABEL_32;
  }
  v25 = -[AVMediaSelectionOption _languageDisplayNameFromMetadataAccordingToPreferredLanguages:fallingBackToMatchingEmptyLocale:](self, "_languageDisplayNameFromMetadataAccordingToPreferredLanguages:fallingBackToMatchingEmptyLocale:", objc_msgSend(v18, "arrayByAddingObject:", v21), v6);
  v24 = (uint64_t)v25;
  if (!v25)
  {
LABEL_29:
    v27 = objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", v21);
    if (!v27
      || (v28 = v27,
          v24 = objc_msgSend(a3, "displayNameForKey:value:", *MEMORY[0x1E0C997E8], v27),
          v25 = (__CFString *)objc_msgSend(a3, "localizedStringForLanguage:context:", v28, v66),
          !v24))
    {
      v25 = -[AVMediaSelectionOption _languageDisplayNameFromMetadataAccordingToPreferredLanguages:fallingBackToMatchingEmptyLocale:](self, "_languageDisplayNameFromMetadataAccordingToPreferredLanguages:fallingBackToMatchingEmptyLocale:", objc_msgSend(v18, "arrayByAddingObject:", v21), v6);
      v24 = (uint64_t)v25;
    }
  }
LABEL_32:
  if (v25)
    v29 = v25;
  else
    v29 = (__CFString *)v24;
  if (!v24)
    v24 = (uint64_t)v22;
  if (v29)
    v26 = v29;
  else
    v26 = (__CFString *)v21;
  v12 = v67;
LABEL_41:
  v30 = bundleID;
  if (v19
    && objc_msgSend((id)-[__CFString stringByTrimmingCharactersInSet:](v19, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet")), "length"))
  {
    if (v24 && -[__CFString rangeOfString:options:](v19, "rangeOfString:options:", v24, 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v31 = (__CFString *)AVLocalizedStringFromTableWithLocaleWithBundleIdentifier((uint64_t)CFSTR("SUBTITLE_TRACK_DISPLAY_FORMAT"), (uint64_t)CFSTR("AVMediaSelectionOption"), v12, bundleID);
      v13 = -[__CFString hasPrefix:](v31, "hasPrefix:", CFSTR("%2$@")) ^ 1;
      *(_QWORD *)&inSpecifier[0] = 0;
      v26 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v31, CFSTR("%@%@"), inSpecifier, v19, v26);
    }
    else
    {
      v13 = 0;
      v26 = v19;
    }
  }
  else
  {
    v13 = 0;
  }
  if (-[NSString isEqualToString:](-[AVMediaSelectionOption mediaType](self, "mediaType"), "isEqualToString:", CFSTR("sbtl"))|| -[NSString isEqualToString:](-[AVMediaSelectionOption mediaType](self, "mediaType"), "isEqualToString:", CFSTR("text")))
  {
    if (-[AVMediaSelectionOption hasMediaCharacteristic:](self, "hasMediaCharacteristic:", CFSTR("public.accessibility.transcribes-spoken-dialog"))&& -[AVMediaSelectionOption hasMediaCharacteristic:](self, "hasMediaCharacteristic:", CFSTR("public.accessibility.describes-music-and-sound")))
    {
      v32 = (__CFString *)AVLocalizedStringFromTableWithLocaleWithBundleIdentifier((uint64_t)CFSTR("SDH_SUBTITLE_FORMAT"), (uint64_t)CFSTR("AVMediaSelectionOption"), v12, bundleID);
      v33 = v32;
      if (v13)
        v13 = 1;
      else
        v13 = -[__CFString hasPrefix:](v32, "hasPrefix:", CFSTR("%1$@")) ^ 1;
      v38 = &stru_1E303A378;
      if (v26)
        v38 = v26;
      *(_QWORD *)&inSpecifier[0] = 0;
      v26 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v33, CFSTR("%@"), inSpecifier, v38);
    }
    if (-[AVMediaSelectionOption hasMediaCharacteristic:](self, "hasMediaCharacteristic:", CFSTR("public.subtitles.forced-only")))
    {
      v39 = (__CFString *)AVLocalizedStringFromTableWithLocaleWithBundleIdentifier((uint64_t)CFSTR("FORCEDONLY_SUBTITLE_FORMAT"), (uint64_t)CFSTR("AVMediaSelectionOption"), v12, bundleID);
      v40 = v39;
      if (v13)
        v13 = 1;
      else
        v13 = -[__CFString hasPrefix:](v39, "hasPrefix:", CFSTR("%1$@")) ^ 1;
      v41 = &stru_1E303A378;
      if (v26)
        v41 = v26;
      *(_QWORD *)&inSpecifier[0] = 0;
      v26 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v40, CFSTR("%@"), inSpecifier, v41);
    }
    if (!-[AVMediaSelectionOption hasMediaCharacteristic:](self, "hasMediaCharacteristic:", CFSTR("public.easy-to-read")))goto LABEL_80;
    v42 = (__CFString *)AVLocalizedStringFromTableWithLocaleWithBundleIdentifier((uint64_t)CFSTR("EASYTOREAD_SUBTITLE_FORMAT"), (uint64_t)CFSTR("AVMediaSelectionOption"), v12, bundleID);
    v43 = v42;
    if (v13)
      LOBYTE(v13) = 1;
    else
      v13 = -[__CFString hasPrefix:](v42, "hasPrefix:", CFSTR("%1$@")) ^ 1;
    v44 = &stru_1E303A378;
    if (v26)
      v44 = v26;
    *(_QWORD *)&inSpecifier[0] = 0;
    v45 = (void *)MEMORY[0x1E0CB3940];
    goto LABEL_79;
  }
  if (!-[NSString isEqualToString:](-[AVMediaSelectionOption mediaType](self, "mediaType"), "isEqualToString:", CFSTR("clcp")))
  {
    if (-[NSString isEqualToString:](-[AVMediaSelectionOption mediaType](self, "mediaType"), "isEqualToString:", CFSTR("soun")))
    {
      if (-[AVMediaSelectionOption hasMediaCharacteristic:](self, "hasMediaCharacteristic:", CFSTR("public.accessibility.describes-video")))
      {
        v36 = (__CFString *)AVLocalizedStringFromTableWithLocaleWithBundleIdentifier((uint64_t)CFSTR("DESCRIBESVIDEO_AUDIO_FORMAT"), (uint64_t)CFSTR("AVMediaSelectionOption"), v12, bundleID);
        v37 = v36;
        if (v13)
          v13 = 1;
        else
          v13 = -[__CFString hasPrefix:](v36, "hasPrefix:", CFSTR("%1$@")) ^ 1;
        v50 = &stru_1E303A378;
        if (v26)
          v50 = v26;
        *(_QWORD *)&inSpecifier[0] = 0;
        v26 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v37, CFSTR("%@"), inSpecifier, v50);
      }
      if (-[AVMediaSelectionOption hasMediaCharacteristic:](self, "hasMediaCharacteristic:", CFSTR("public.translation.voice-over")))
      {
        v51 = (__CFString *)AVLocalizedStringFromTableWithLocaleWithBundleIdentifier((uint64_t)CFSTR("VOICEOVERTRANSLATION_AUDIO_FORMAT"), (uint64_t)CFSTR("AVMediaSelectionOption"), v12, bundleID);
        v52 = v51;
        if (v13)
          v13 = 1;
        else
          v13 = -[__CFString hasPrefix:](v51, "hasPrefix:", CFSTR("%1$@")) ^ 1;
        v53 = &stru_1E303A378;
        if (v26)
          v53 = v26;
        *(_QWORD *)&inSpecifier[0] = 0;
        v26 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v52, CFSTR("%@"), inSpecifier, v53);
      }
      if (-[AVMediaSelectionOption hasMediaCharacteristic:](self, "hasMediaCharacteristic:", CFSTR("public.original-content")))
      {
        v54 = (__CFString *)AVLocalizedStringFromTableWithLocaleWithBundleIdentifier((uint64_t)CFSTR("ORIGINAL_AUDIO_FORMAT"), (uint64_t)CFSTR("AVMediaSelectionOption"), v12, bundleID);
        v55 = v54;
        if (v13)
          LOBYTE(v13) = 1;
        else
          v13 = -[__CFString hasPrefix:](v54, "hasPrefix:", CFSTR("%1$@")) ^ 1;
        v56 = &stru_1E303A378;
        if (v26)
          v56 = v26;
        *(_QWORD *)&inSpecifier[0] = 0;
        v26 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v55, CFSTR("%@"), inSpecifier, v56);
      }
      v57 = -[AVMediaSelectionOption mediaSubTypes](self, "mediaSubTypes");
      if (-[NSArray count](v57, "count"))
      {
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v58 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v74;
          while (2)
          {
            v61 = v12;
            for (i = 0; i != v59; ++i)
            {
              if (*(_QWORD *)v74 != v60)
                objc_enumerationMutation(v57);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "intValue") != 1633889587)
              {
                v12 = v61;
                goto LABEL_128;
              }
            }
            v59 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
            v12 = v61;
            if (v59)
              continue;
            break;
          }
        }
        v71 = 0;
        outPropertyData = 0;
        memset(inSpecifier, 0, sizeof(inSpecifier));
        ioPropertyDataSize = 8;
        DWORD2(inSpecifier[0]) = 1633889587;
        AudioFormatGetProperty(0x666E616Du, 0x28u, inSpecifier, &ioPropertyDataSize, &outPropertyData);
        if (outPropertyData)
        {
          v30 = bundleID;
          if (-[__CFString rangeOfString:](v26, "rangeOfString:") == 0x7FFFFFFFFFFFFFFFLL)
          {
            v63 = (__CFString *)AVLocalizedStringFromTableWithLocaleWithBundleIdentifier((uint64_t)CFSTR("AUDIOENCODING_AUDIO_FORMAT"), (uint64_t)CFSTR("AVMediaSelectionOption"), v12, bundleID);
            v64 = v63;
            if ((v13 & 1) != 0)
              LOBYTE(v13) = 1;
            else
              v13 = -[__CFString hasPrefix:](v63, "hasPrefix:", CFSTR("%1$@")) ^ 1;
            v65 = &stru_1E303A378;
            if (v26)
              v65 = v26;
            v77 = 0;
            v26 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v64, CFSTR("%@%@"), &v77, v65, outPropertyData);
          }
          if (outPropertyData)
            CFRelease(outPropertyData);
        }
        else
        {
LABEL_128:
          v30 = bundleID;
        }
      }
    }
    goto LABEL_80;
  }
  v34 = (__CFString *)AVLocalizedStringFromTableWithLocaleWithBundleIdentifier((uint64_t)CFSTR("CC_SUBTITLE_FORMAT"), (uint64_t)CFSTR("AVMediaSelectionOption"), v12, bundleID);
  v35 = v34;
  if (v13)
    LOBYTE(v13) = 1;
  else
    v13 = -[__CFString hasPrefix:](v34, "hasPrefix:", CFSTR("%1$@")) ^ 1;
  if (v26)
    v48 = v26;
  else
    v48 = &stru_1E303A378;
  *(_QWORD *)&inSpecifier[0] = 0;
  v26 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v35, CFSTR("%@"), inSpecifier, v48);
  if (-[AVMediaSelectionOption hasMediaCharacteristic:](self, "hasMediaCharacteristic:", CFSTR("public.easy-to-read")))
  {
    v49 = (__CFString *)AVLocalizedStringFromTableWithLocaleWithBundleIdentifier((uint64_t)CFSTR("EASYTOREAD_SUBTITLE_FORMAT"), (uint64_t)CFSTR("AVMediaSelectionOption"), v12, bundleID);
    v43 = v49;
    if ((v13 & 1) != 0)
      LOBYTE(v13) = 1;
    else
      v13 = -[__CFString hasPrefix:](v49, "hasPrefix:", CFSTR("%1$@")) ^ 1;
    if (v26)
      v44 = v26;
    else
      v44 = &stru_1E303A378;
    *(_QWORD *)&inSpecifier[0] = 0;
    v45 = (void *)MEMORY[0x1E0CB3940];
LABEL_79:
    v26 = (__CFString *)objc_msgSend(v45, "stringWithValidatedFormat:validFormatSpecifiers:error:", v43, CFSTR("%@"), inSpecifier, v44);
  }
LABEL_80:
  v46 = (__CFString *)-[__CFString stringByTrimmingCharactersInSet:](v26, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"));
  if (!-[__CFString length](v46, "length"))
    v46 = (__CFString *)AVLocalizedStringFromTableWithLocaleWithBundleIdentifier((uint64_t)CFSTR("UNKNOWN_LANGUAGE"), (uint64_t)CFSTR("AVMediaSelectionOption"), v12, v30);
  self->_mediaSelectionOption->_displayName = (NSString *)v46;
  return v13;
}

- (NSString)displayNameWithLocale:(NSLocale *)locale
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;

  if (!locale)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("displayNameWithLocale requires an NSLocale"), v3, v4, v5, v6, v7, v8), 0);
    objc_exception_throw(v10);
  }
  return (NSString *)-[AVMediaSelectionOption _displayNameWithLocale:fallingBackToMatchingUndeterminedAndMultilingual:](self, "_displayNameWithLocale:fallingBackToMatchingUndeterminedAndMultilingual:", locale, 0);
}

- (NSString)displayName
{
  return (NSString *)-[AVMediaSelectionOption _displayNameWithLocale:fallingBackToMatchingUndeterminedAndMultilingual:](self, "_displayNameWithLocale:fallingBackToMatchingUndeterminedAndMultilingual:", 0, 1);
}

- (id)track
{
  return 0;
}

- (int)trackID
{
  return 0;
}

@end
