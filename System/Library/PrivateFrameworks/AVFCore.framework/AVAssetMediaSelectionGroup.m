@implementation AVAssetMediaSelectionGroup

- (id)mediaSelectionOptionWithPropertyList:(id)a3
{
  return -[AVAssetMediaSelectionGroup _mediaSelectionOptionWithPropertyList:matchToMediaSelectionArray:](self, "_mediaSelectionOptionWithPropertyList:matchToMediaSelectionArray:", a3, 0);
}

- (id)options
{
  return self->_options;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[AVAsset hash](self->_asset, "hash");
  return -[NSDictionary hash](self->_dictionary, "hash") ^ v3;
}

- (AVAssetMediaSelectionGroup)initWithAsset:(id)a3 dictionary:(id)a4
{
  AVAssetMediaSelectionGroup *v6;
  AVAssetMediaSelectionGroup *v7;
  id v8;
  NSDictionary *v9;
  id v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _BOOL8 v18;
  AVMediaSelectionOption *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)AVAssetMediaSelectionGroup;
  v6 = -[AVMediaSelectionGroup init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3 && a4)
    {
      v6->_asset = (AVAsset *)a3;
      v8 = a3;
      v7->_isStreamingGroup = objc_msgSend(a3, "_isStreaming");
      v9 = (NSDictionary *)a4;
      v7->_dictionary = v9;
      v7->_groupMediaCharacteristics = (NSArray *)objc_msgSend(AVTranslateFigMediaCharacteristicsToAVMediaCharacteristics(-[NSDictionary objectForKey:](v9, "objectForKey:", *MEMORY[0x1E0CC5E90])), "copy");
      v7->_localizedMediaSelectionOptionDisplayNames = (NSDictionary *)objc_msgSend(-[AVAsset _localizedMediaSelectionOptionDisplayNames](v7->_asset, "_localizedMediaSelectionOptionDisplayNames"), "copy");
      v10 = -[NSDictionary objectForKey:](v7->_dictionary, "objectForKey:", *MEMORY[0x1E0CC5EA0]);
      v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v22;
        v15 = *MEMORY[0x1E0CC5F20];
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v10);
            v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (objc_msgSend(v17, "objectForKey:", v15))
              v18 = !v7->_isStreamingGroup;
            else
              v18 = 0;
            v19 = +[AVMediaSelectionOption mediaSelectionOptionForAsset:group:dictionary:hasUnderlyingTrack:](AVMediaSelectionOption, "mediaSelectionOptionForAsset:group:dictionary:hasUnderlyingTrack:", v8, v7, v17, v18);
            -[NSArray addObject:](v11, "addObject:", v19);
            if (!v7->_defaultOption && -[AVMediaSelectionOption _isDesignatedDefault](v19, "_isDesignatedDefault"))
              v7->_defaultOption = v19;
          }
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v13);
      }
      v7->_options = v11;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (id)dictionary
{
  return self->_dictionary;
}

- (id)_localizedMediaSelectionOptionDisplayNames
{
  return self->_localizedMediaSelectionOptionDisplayNames;
}

- (id)_groupMediaCharacteristics
{
  return self->_groupMediaCharacteristics;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetMediaSelectionGroup;
  -[AVMediaSelectionGroup dealloc](&v3, sel_dealloc);
}

- (id)asset
{
  return self->_asset;
}

- (BOOL)_isStreamingGroup
{
  return self->_isStreamingGroup;
}

- (AVAssetMediaSelectionGroup)init
{
  return -[AVAssetMediaSelectionGroup initWithAsset:dictionary:](self, "initWithAsset:dictionary:", 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[AVAsset isEqual:](self->_asset, "isEqual:", objc_msgSend(a3, "asset"));
      if (v5)
        LOBYTE(v5) = -[NSDictionary isEqual:](self->_dictionary, "isEqual:", objc_msgSend(a3, "dictionary"));
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)defaultOption
{
  return self->_defaultOption;
}

- (id)_optionWithID:(id)a3 identifier:(id)a4 source:(id)a5 displaysNonForcedSubtitles:(BOOL)a6 audioCompositionPresetIndex:(id)a7
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v21;
  id v23;
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v24 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = -[AVAssetMediaSelectionGroup options](self, "options");
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v12)
    return 0;
  v13 = v12;
  v23 = a5;
  v14 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v26;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v26 != v16)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
      if (!a3)
      {
        if (a4)
        {
          v19 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "outOfBandIdentifier"), "isEqual:", a4);
          if (a7)
            goto LABEL_14;
        }
        else
        {
          if (!v23)
          {
            a4 = 0;
            goto LABEL_24;
          }
          v19 = objc_msgSend((id)objc_msgSend(v18, "outOfBandSource"), "isEqual:", v23);
          a4 = 0;
          if (a7)
          {
LABEL_14:
            if (!v19)
              goto LABEL_24;
LABEL_15:
            if ((objc_msgSend((id)objc_msgSend(v18, "_audioCompositionPresetIndex"), "isEqualToNumber:", a7) & 1) == 0)
              goto LABEL_24;
            goto LABEL_20;
          }
        }
        goto LABEL_19;
      }
      if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "optionID"), "isEqual:", a3) & 1) == 0)
      {
        v19 = objc_msgSend((id)objc_msgSend(v18, "fallbackIDs"), "containsObject:", a3);
        if (a7)
          goto LABEL_14;
LABEL_19:
        if (!v19)
          goto LABEL_24;
        goto LABEL_20;
      }
      if (a7)
        goto LABEL_15;
LABEL_20:
      if (objc_msgSend(v18, "displaysNonForcedSubtitles") == v24)
        return v18;
      if (v14++ == 0)
        v15 = v18;
      else
        v15 = 0;
LABEL_24:
      ++v17;
    }
    while (v13 != v17);
    v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    v13 = v21;
    v18 = v15;
  }
  while (v21);
  return v18;
}

- (id)_optionWithID:(id)a3 displaysNonForcedSubtitles:(BOOL)a4 audioCompositionPresetIndex:(id)a5
{
  return -[AVAssetMediaSelectionGroup _optionWithID:identifier:source:displaysNonForcedSubtitles:audioCompositionPresetIndex:](self, "_optionWithID:identifier:source:displaysNonForcedSubtitles:audioCompositionPresetIndex:", a3, 0, 0, a4, a5);
}

- (id)_mediaSelectionOptionWithPropertyList:(id)a3 matchToMediaSelectionArray:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  const __CFNumber *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unsigned int valuePtr;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (v4)
  {
    objc_msgSend(-[AVAssetMediaSelectionGroup asset](self, "asset"), "_mediaSelectionGroupDictionaries");
    a3 = (id)FigMediaSelectionGroupsCreateMatchingSelection();
  }
  v7 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC5F20]);
  v8 = (const __CFNumber *)v7;
  if (!v7)
    v8 = (const __CFNumber *)objc_msgSend(a3, "objectForKey:", CFSTR("AVMediaSelectionTrackOptionTrackIDKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v8 = 0;
  if (v8)
  {
    v9 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC5EC0]);
    if (!v7)
    {
      valuePtr = 0;
      CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
      v13 = -[AVAssetMediaSelectionGroup asset](self, "asset");
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "trackWithTrackID:", valuePtr), "mediaType"), "isEqualToString:", CFSTR("sbtl")))v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVMediaSelectionTrackOptionSettingsKey")), "objectForKey:", CFSTR("AVMediaSelectionTrackOptionCharacteristicsKey")), "containsObject:", CFSTR("public.subtitles.forced-only")) ^ 1;
      v10 = 0;
      v11 = 0;
      goto LABEL_20;
    }
    v10 = 0;
    v11 = 0;
    goto LABEL_11;
  }
  v10 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC5ED0]);
  v12 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC5F30]);
  if (!(v10 | v12))
    return 0;
  v11 = v12;
  v9 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC5EC0]);
  if (v7 || v10 || v11)
  {
LABEL_11:
    v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC5ED8]), "BOOLValue");
    goto LABEL_20;
  }
  v10 = 0;
  v7 = 0;
LABEL_20:
  v14 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC5E98]);
  if (v14 || (v14 = objc_msgSend(a3, "objectForKey:", CFSTR("AVMediaSelectionKeyValueOptionMediaTypeKey"))) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC5E88]);
  if (!v16)
  {
    v16 = objc_msgSend(a3, "objectForKey:", CFSTR("AVMediaSelectionKeyValueOptionGroupIDKey"));
    if (((v16 == 0) & ~v15) != 0)
      return -[AVAssetMediaSelectionGroup _optionWithID:identifier:source:displaysNonForcedSubtitles:audioCompositionPresetIndex:](self, "_optionWithID:identifier:source:displaysNonForcedSubtitles:audioCompositionPresetIndex:", v8, v10, v11, v7, v9);
  }
  if (-[AVMediaSelectionGroup _matchesGroupID:mediaType:](self, "_matchesGroupID:mediaType:", v16, v14))
    return -[AVAssetMediaSelectionGroup _optionWithID:identifier:source:displaysNonForcedSubtitles:audioCompositionPresetIndex:](self, "_optionWithID:identifier:source:displaysNonForcedSubtitles:audioCompositionPresetIndex:", v8, v10, v11, v7, v9);
  return 0;
}

- (id)mediaSelectionOptionWithPropertyListMatchToMediaSelectionArray:(id)a3
{
  return -[AVAssetMediaSelectionGroup _mediaSelectionOptionWithPropertyList:matchToMediaSelectionArray:](self, "_mediaSelectionOptionWithPropertyList:matchToMediaSelectionArray:", a3, 1);
}

@end
