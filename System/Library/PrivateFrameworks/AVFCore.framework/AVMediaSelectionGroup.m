@implementation AVMediaSelectionGroup

+ (AVMediaSelectionGroup)mediaSelectionGroupWithAsset:(id)a3 dictionary:(id)a4
{
  return (AVMediaSelectionGroup *)-[AVAssetMediaSelectionGroup initWithAsset:dictionary:]([AVAssetMediaSelectionGroup alloc], "initWithAsset:dictionary:", a3, a4);
}

- (AVMediaSelectionGroup)init
{
  AVMediaSelectionGroup *v2;
  AVMediaSelectionGroupInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMediaSelectionGroup;
  v2 = -[AVMediaSelectionGroup init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVMediaSelectionGroupInternal);
    v2->_mediaSelectionGroup = v3;
    if (v3)
    {
      CFRetain(v3);
      v2->_mediaSelectionGroup->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v2);
      v2->_mediaSelectionGroup->currentBundleIdentifier = 0;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (BOOL)_matchesGroupID:(id)a3 mediaType:(id)a4
{
  id v7;
  id v8;
  int v9;

  v7 = -[AVMediaSelectionGroup _groupID](self, "_groupID");
  v8 = -[AVMediaSelectionGroup _groupMediaType](self, "_groupMediaType");
  if (v7 == a3 || (v9 = objc_msgSend(v7, "isEqual:", a3)) != 0)
  {
    if (v8 == a4)
      LOBYTE(v9) = 1;
    else
      LOBYTE(v9) = objc_msgSend(v8, "isEqualToString:", a4);
  }
  return v9;
}

- (id)_groupID
{
  id v2;

  v2 = -[AVMediaSelectionGroup dictionary](self, "dictionary");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5E88]);
}

- (id)_groupMediaType
{
  id v2;

  v2 = -[AVMediaSelectionGroup dictionary](self, "dictionary");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5E98]);
}

- (id)_weakReference
{
  return self->_mediaSelectionGroup->weakReference;
}

- (void)dealloc
{
  AVMediaSelectionGroupInternal *mediaSelectionGroup;
  objc_super v4;

  mediaSelectionGroup = self->_mediaSelectionGroup;
  if (mediaSelectionGroup)
  {

    CFRelease(self->_mediaSelectionGroup);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVMediaSelectionGroup;
  -[AVMediaSelectionGroup dealloc](&v4, sel_dealloc);
}

+ (NSArray)playableMediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions
{
  return -[NSArray objectsAtIndexes:](mediaSelectionOptions, "objectsAtIndexes:", -[NSArray indexesOfObjectsPassingTest:](mediaSelectionOptions, "indexesOfObjectsPassingTest:", &__block_literal_global_33));
}

uint64_t __64__AVMediaSelectionGroup_playableMediaSelectionOptionsFromArray___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a2, "isPlayable");
  else
    return 0;
}

- (BOOL)allowsEmptySelection
{
  id v2;
  void *v3;

  v2 = -[AVMediaSelectionGroup dictionary](self, "dictionary");
  v3 = (void *)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5E80]);
  if (v3)
    return objc_msgSend(v3, "BOOLValue");
  else
    return 1;
}

- (id)_primaryMediaCharacteristic
{
  id v2;
  const __CFString *v3;

  v2 = -[AVMediaSelectionGroup _groupMediaCharacteristics](self, "_groupMediaCharacteristics");
  v3 = CFSTR("AVMediaCharacteristicAudible");
  if ((objc_msgSend(v2, "containsObject:", CFSTR("AVMediaCharacteristicAudible")) & 1) != 0)
    return (id)v3;
  v3 = CFSTR("AVMediaCharacteristicLegible");
  if ((objc_msgSend(v2, "containsObject:", CFSTR("AVMediaCharacteristicLegible")) & 1) != 0)
    return (id)v3;
  v3 = CFSTR("AVMediaCharacteristicVisual");
  if ((objc_msgSend(v2, "containsObject:", CFSTR("AVMediaCharacteristicVisual")) & 1) != 0)
    return (id)v3;
  else
    return (id)objc_msgSend(v2, "firstObject");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSArray *v6;
  _BOOL4 v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[AVMediaSelectionGroup options](self, "options");
  v7 = -[AVMediaSelectionGroup allowsEmptySelection](self, "allowsEmptySelection");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, options = %@, allowsEmptySelection = %@>"), v5, self, v6, v8);
}

- (id)asset
{
  return 0;
}

- (NSArray)options
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)dictionary
{
  return 0;
}

- (id)_groupMediaCharacteristics
{
  id v2;

  v2 = -[AVMediaSelectionGroup dictionary](self, "dictionary");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CC5E90]);
}

- (BOOL)_isStreamingGroup
{
  return 0;
}

- (id)_localizedMediaSelectionOptionDisplayNames
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (AVMediaSelectionOption)defaultOption
{
  return 0;
}

- (id)_optionWithID:(id)a3 displaysNonForcedSubtitles:(BOOL)a4 audioCompositionPresetIndex:(id)a5
{
  return 0;
}

- (AVMediaSelectionOption)mediaSelectionOptionWithPropertyList:(id)plist
{
  return 0;
}

- (id)mediaSelectionOptionWithPropertyListMatchToMediaSelectionArray:(id)a3
{
  return 0;
}

+ (NSArray)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions withLocale:(NSLocale *)locale
{
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = -[NSLocale localeIdentifier](locale, "localeIdentifier");
  return (NSArray *)objc_msgSend(a1, "mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:", mediaSelectionOptions, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
}

+ (NSArray)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions filteredAndSortedAccordingToPreferredLanguages:(NSArray *)preferredLanguages
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  NSArray *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  NSIndexSet *v21;
  _QWORD v23[7];
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  AVAllAvailableNSBundleCompatibleLanguageTagsForObjects(mediaSelectionOptions);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](preferredLanguages, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](preferredLanguages, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(preferredLanguages);
        v11 = objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        if (v11)
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](preferredLanguages, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }
  v12 = (id)FigCopyRankedLanguagesAccordingToPreferredLanguages();
  v13 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    v18 = MEMORY[0x1E0C809B0];
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v12);
        v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        v24[0] = v18;
        v24[1] = 3221225472;
        v24[2] = __103__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke;
        v24[3] = &unk_1E3030948;
        v24[4] = v20;
        v21 = -[NSArray indexesOfObjectsPassingTest:](mediaSelectionOptions, "indexesOfObjectsPassingTest:", v24);
        v23[0] = v18;
        v23[1] = 3221225472;
        v23[2] = __103__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke_2;
        v23[3] = &unk_1E3030970;
        v23[4] = v14;
        v23[5] = v13;
        v23[6] = mediaSelectionOptions;
        -[NSIndexSet enumerateIndexesUsingBlock:](v21, "enumerateIndexesUsingBlock:", v23);
        objc_msgSend(v14, "addIndexes:", v21);
      }
      v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v16);
  }
  return v13;
}

uint64_t __103__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((v4 = objc_msgSend(a2, "unicodeLanguageIdentifier")) != 0 || (v4 = objc_msgSend(a2, "unicodeLanguageCode")) != 0))
  {
    return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v4);
  }
  else
  {
    return 0;
  }
}

uint64_t __103__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_filteredAndSortedAccordingToPreferredLanguages___block_invoke_2(id *a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(a1[4], "containsIndex:", a2);
  if ((result & 1) == 0)
    return objc_msgSend(a1[5], "addObject:", objc_msgSend(a1[6], "objectAtIndex:", a2));
  return result;
}

+ (NSArray)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions withMediaCharacteristics:(NSArray *)mediaCharacteristics
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_withMediaCharacteristics___block_invoke;
  v5[3] = &unk_1E3030948;
  v5[4] = mediaCharacteristics;
  return -[NSArray objectsAtIndexes:](mediaSelectionOptions, "objectsAtIndexes:", -[NSArray indexesOfObjectsPassingTest:](mediaSelectionOptions, "indexesOfObjectsPassingTest:", v5));
}

uint64_t __81__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_withMediaCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v5)
    return 1;
  v6 = v5;
  v7 = *(_QWORD *)v11;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v7)
      objc_enumerationMutation(v4);
    result = objc_msgSend(a2, "hasMediaCharacteristic:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
    if (!(_DWORD)result)
      return result;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      result = 1;
      if (v6)
        goto LABEL_4;
      return result;
    }
  }
}

+ (NSArray)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions withoutMediaCharacteristics:(NSArray *)mediaCharacteristics
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_withoutMediaCharacteristics___block_invoke;
  v5[3] = &unk_1E3030948;
  v5[4] = mediaCharacteristics;
  return -[NSArray objectsAtIndexes:](mediaSelectionOptions, "objectsAtIndexes:", -[NSArray indexesOfObjectsPassingTest:](mediaSelectionOptions, "indexesOfObjectsPassingTest:", v5));
}

uint64_t __84__AVMediaSelectionGroup_mediaSelectionOptionsFromArray_withoutMediaCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v4);
      if ((objc_msgSend(a2, "hasMediaCharacteristic:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8)) & 1) != 0)
        return 0;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        result = 1;
        if (v6)
          goto LABEL_4;
        return result;
      }
    }
  }
  return 1;
}

- (id)currentBundleIdentifier
{
  return self->_mediaSelectionGroup->currentBundleIdentifier;
}

- (void)setCurrentBundleIdentifier:(id)a3
{
  NSString *v4;

  v4 = (NSString *)objc_msgSend(a3, "copy");

  self->_mediaSelectionGroup->currentBundleIdentifier = v4;
}

@end
