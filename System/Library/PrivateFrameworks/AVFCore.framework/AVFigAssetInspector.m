@implementation AVFigAssetInspector

- (id)availableMetadataFormats
{
  return -[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC3928]);
}

- (BOOL)isComposable
{
  BOOL v3;

  v3 = -[AVFigAssetInspector hasProtectedContent](self, "hasProtectedContent");
  return (v3 | -[AVFigAssetInspector _hasQTSaveRestriction](self, "_hasQTSaveRestriction")) ^ 1;
}

- (BOOL)isCompatibleWithAirPlayVideo
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC3958]) != 0;
}

- (BOOL)hasProtectedContent
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC3A68]) != 0;
}

- (BOOL)_hasQTSaveRestriction
{
  id v3;
  NSArray *v4;
  int v6;

  if (!self->didCheckForSaveRestriction)
  {
    v3 = -[AVFigAssetInspector metadataForFormat:](self, "metadataForFormat:", CFSTR("com.apple.quicktime.udta"));
    v4 = +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1853055350), CFSTR("udta"));
    if (-[NSArray count](v4, "count"))
    {
      v6 = 0;
      objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 0), "dataValue"), "getBytes:length:", &v6, 4);
      if ((v6 & 0x1000000) != 0)
        self->hasSaveRestriction = 1;
    }
    self->didCheckForSaveRestriction = 1;
  }
  return self->hasSaveRestriction;
}

uint64_t __47__AVFigAssetInspector_preferredDisplayCriteria__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  AVDisplayCriteria *v14;
  double v15;
  uint64_t result;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  int valuePtr;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "availableVideoDynamicRanges");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    LODWORD(v6) = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v2);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "integerValue");
        v10 = MTGetVideoDynamicRangeQualityGrade();
        v11 = v5;
        if (v5 <= v10)
          v5 = v10;
        if (v11 >= v10)
          v6 = v6;
        else
          v6 = v9;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0;
  }
  v12 = (const __CFNumber *)objc_msgSend(*(id *)(a1 + 32), "_valueAsCFTypeForProperty:", *MEMORY[0x1E0CC3A58]);
  if (v12)
  {
    v13 = v12;
    CFNumberGetValue(v12, kCFNumberFloatType, &valuePtr);
    CFRelease(v13);
  }
  v14 = [AVDisplayCriteria alloc];
  LODWORD(v15) = valuePtr;
  result = -[AVDisplayCriteria initWithRefreshRate:videoDynamicRange:](v14, "initWithRefreshRate:videoDynamicRange:", v6, v15);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  if (self)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE _timeForProperty:](self, "_timeForProperty:", *MEMORY[0x1E0CC5F60]);
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return self;
}

- (id)_mediaSelectionGroupDictionaries
{
  return -[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC5F78]);
}

- (BOOL)_isStreaming
{
  AVDispatchOnce *checkIsStreamingOnce;
  _QWORD v5[5];

  checkIsStreamingOnce = self->_checkIsStreamingOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__AVFigAssetInspector__isStreaming__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](checkIsStreamingOnce, "runBlockOnce:", v5);
  return self->_isStreaming;
}

- (int64_t)trackCount
{
  return objc_msgSend(-[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC3AA8]), "count");
}

uint64_t __35__AVFigAssetInspector__isStreaming__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_tollFreeBridgedObjectForProperty:", *MEMORY[0x1E0CC3920]);
  result = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CC3C88]);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  void *result;
  uint64_t CMBaseObject;
  void (*v6)(uint64_t, __CFString *, _QWORD, void **);
  void *v7;

  v7 = 0;
  result = -[AVFigAssetInspector _figAsset](self, "_figAsset");
  if (result)
  {
    CMBaseObject = FigAssetGetCMBaseObject();
    v6 = *(void (**)(uint64_t, __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v6)
    {
      v6(CMBaseObject, a3, *MEMORY[0x1E0C9AE00], &v7);
      return v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (OpaqueFigAsset)_figAsset
{
  return self->_figAsset;
}

- (AVFigAssetInspector)initWithFigAsset:(OpaqueFigAsset *)a3
{
  AVFigAssetInspector *v4;
  AVFigAssetInspector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVFigAssetInspector;
  v4 = -[AVFigAssetInspector init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_figAsset = (OpaqueFigAsset *)CFRetain(a3);
      v5->_checkIsStreamingOnce = objc_alloc_init(AVDispatchOnce);
      v5->_makeDisplayCriteriaOnce = objc_alloc_init(AVDispatchOnce);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (id)_localizedMediaSelectionOptionDisplayNames
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = -[AVFigObjectInspector _nonNilDictionaryForProperty:](self, "_nonNilDictionaryForProperty:", CFSTR("LocalizedMSODisplayNames"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
  return v2;
}

- (id)metadataForFormat:(id)a3
{
  void *v5;
  uint64_t *v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.quicktime.udta")))
  {
    v6 = (uint64_t *)MEMORY[0x1E0CC3A80];
LABEL_15:
    v9 = *v6;
    goto LABEL_16;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("org.mp4ra")))
  {
    v6 = (uint64_t *)MEMORY[0x1E0CC3A08];
    goto LABEL_15;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.quicktime.mdta")))
  {
    v6 = (uint64_t *)MEMORY[0x1E0CC3A78];
    goto LABEL_15;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.itunes")))
  {
    v6 = (uint64_t *)MEMORY[0x1E0CC3AB0];
    goto LABEL_15;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("org.id3")))
  {
    v7 = (uint64_t *)MEMORY[0x1E0CC39F8];
    v8 = dyld_program_sdk_at_least();
    v6 = (uint64_t *)MEMORY[0x1E0CC3A00];
    if (v8)
      v6 = v7;
    goto LABEL_15;
  }
  if (objc_msgSend(a3, "isEqualToString:", 0x1E3039BF8))
  {
    v6 = (uint64_t *)MEMORY[0x1E0CC39F8];
    goto LABEL_15;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.quicktime.HLS")))
    v9 = *MEMORY[0x1E0CC39E8];
  else
    v9 = 0;
LABEL_16:
  v10 = -[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", v9);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
        if (v15)
          objc_msgSend(v5, "addObject:", v15);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
  return v5;
}

- (NSArray)figChapters
{
  return (NSArray *)-[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC5F50]);
}

- (NSArray)figChapterGroupInfo
{
  return (NSArray *)-[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC3948]);
}

- (id)commonMetadata
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = -[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC3950]);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        if (v8)
          objc_msgSend(v3, "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  return v3;
}

- (float)preferredSoundCheckVolumeNormalization
{
  double v2;
  float result;

  LODWORD(v2) = 0;
  -[AVFigObjectInspector _floatForProperty:defaultValue:](self, "_floatForProperty:defaultValue:", *MEMORY[0x1E0CC5FA8], v2);
  return result;
}

- (id)preferredDisplayCriteria
{
  AVDispatchOnce *makeDisplayCriteriaOnce;
  _QWORD v5[5];

  makeDisplayCriteriaOnce = self->_makeDisplayCriteriaOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__AVFigAssetInspector_preferredDisplayCriteria__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](makeDisplayCriteriaOnce, "runBlockOnce:", v5);
  return self->_displayCriteria;
}

- (BOOL)isPlayable
{
  BOOL v3;

  v3 = -[AVFigAssetInspector _isStreaming](self, "_isStreaming");
  return !-[AVFigObjectInspector _SInt32ForProperty:defaultValue:](self, "_SInt32ForProperty:defaultValue:", *MEMORY[0x1E0CC3A40], 4294955496)|| v3;
}

- (void)dealloc
{
  OpaqueFigAsset *figAsset;
  objc_super v4;

  figAsset = self->_figAsset;
  if (figAsset)
    CFRelease(figAsset);

  self->_displayCriteria = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVFigAssetInspector;
  -[AVFigAssetInspector dealloc](&v4, sel_dealloc);
}

- (id)availableVideoDynamicRanges
{
  return -[AVFigObjectInspector _arrayForProperty:](self, "_arrayForProperty:", *MEMORY[0x1E0CC3930]);
}

- (BOOL)isEqual:(id)a3
{
  OpaqueFigAsset *v5;
  uint64_t v6;
  const void *v7;
  BOOL result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[AVFigAssetInspector _figAsset](self, "_figAsset");
  v6 = objc_msgSend(a3, "_figAsset");
  if (v5 == (OpaqueFigAsset *)v6)
    return 1;
  v7 = (const void *)v6;
  result = 0;
  if (v5)
  {
    if (v7)
      return CFEqual(v5, v7) != 0;
  }
  return result;
}

- (unint64_t)hash
{
  OpaqueFigAsset *v3;
  objc_super v5;

  v3 = -[AVFigAssetInspector _figAsset](self, "_figAsset");
  if (v3)
    return CFHash(v3);
  v5.receiver = self;
  v5.super_class = (Class)AVFigAssetInspector;
  return -[AVFigAssetInspector hash](&v5, sel_hash);
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  OpaqueFigFormatReader *result;
  uint64_t CMBaseObject;
  void (*v4)(uint64_t, _QWORD, _QWORD, OpaqueFigFormatReader **);
  OpaqueFigFormatReader *v5;

  v5 = 0;
  result = (OpaqueFigFormatReader *)self->_figAsset;
  if (result)
  {
    CMBaseObject = FigAssetGetCMBaseObject();
    v4 = *(void (**)(uint64_t, _QWORD, _QWORD, OpaqueFigFormatReader **))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 8)
                                                                                  + 48);
    if (v4)
    {
      v4(CMBaseObject, *MEMORY[0x1E0CC39C8], *MEMORY[0x1E0C9AE00], &v5);
      return v5;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)identifyingTagClass
{
  int v2;
  id *v3;

  v2 = -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC3A30]);
  if (v2 == 2)
  {
    v3 = (id *)MEMORY[0x1E0CEC408];
    return *v3;
  }
  if (!v2)
  {
    v3 = (id *)MEMORY[0x1E0CEC400];
    return *v3;
  }
  return 0;
}

- (id)identifyingTag
{
  return -[AVFigObjectInspector _stringForProperty:](self, "_stringForProperty:", *MEMORY[0x1E0CC3A28]);
}

- (id)httpSessionIdentifier
{
  id result;

  result = -[AVFigObjectInspector _stringForProperty:](self, "_stringForProperty:", *MEMORY[0x1E0CC3A18]);
  if (result)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", result);
  return result;
}

- (NSArray)variants
{
  NSArray *v3;
  const __CFArray *v4;
  const __CFArray *v5;
  CFTypeID v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  AVAssetVariant *v10;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[AVFigAssetInspector _valueAsCFTypeForProperty:](self, "_valueAsCFTypeForProperty:", *MEMORY[0x1E0CC39E0]);
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    if (v6 == CFArrayGetTypeID())
    {
      Count = CFArrayGetCount(v5);
      if (Count)
      {
        v8 = Count;
        for (i = 0; i != v8; ++i)
        {
          v10 = -[AVAssetVariant initWithFigAlternate:]([AVAssetVariant alloc], "initWithFigAlternate:", CFArrayGetValueAtIndex(v5, i));
          if (v10)
            -[NSArray addObject:](v3, "addObject:", v10);
        }
      }
    }
    CFRelease(v5);
  }
  return v3;
}

- (float)preferredRate
{
  double v2;
  float result;

  LODWORD(v2) = 1.0;
  -[AVFigObjectInspector _floatForProperty:defaultValue:](self, "_floatForProperty:defaultValue:", *MEMORY[0x1E0CC5F90], v2);
  return result;
}

- (float)preferredVolume
{
  double v2;
  float result;

  LODWORD(v2) = 1.0;
  -[AVFigObjectInspector _floatForProperty:defaultValue:](self, "_floatForProperty:defaultValue:", *MEMORY[0x1E0CC5FA0], v2);
  return result;
}

- (CGAffineTransform)preferredTransform
{
  if (self)
    return (CGAffineTransform *)-[CGAffineTransform _affineTransformForProperty:](self, "_affineTransformForProperty:", *MEMORY[0x1E0CC5F98]);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)AVFigAssetInspector;
  -[AVAssetInspector naturalSize](&v4, sel_naturalSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (int)naturalTimeScale
{
  OpaqueFigFormatReader *v2;
  OpaqueFigFormatReader *v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  CFNumberRef number;
  int valuePtr;

  valuePtr = 0;
  number = 0;
  v2 = -[AVFigAssetInspector _copyFormatReader](self, "_copyFormatReader");
  if (v2)
  {
    v3 = v2;
    FigBaseObject = FigFormatReaderGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v5)
    {
      v5(FigBaseObject, *MEMORY[0x1E0CC4320], *MEMORY[0x1E0C9AE00], &number);
      if (number)
      {
        CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
        if (number)
          CFRelease(number);
      }
    }
    CFRelease(v3);
    LODWORD(v2) = valuePtr;
  }
  return (int)v2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumTimeOffsetFromLive
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  if (self)
  {
    v3 = *MEMORY[0x1E0CC5F80];
    v4 = *MEMORY[0x1E0CA2E18];
    v5 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE _timeForProperty:defaultValue:](self, "_timeForProperty:defaultValue:", v3, &v4);
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return self;
}

- (BOOL)providesPreciseDurationAndTiming
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC3A70]) != 0;
}

- (id)alternateTrackGroups
{
  return -[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC3918]);
}

- (id)trackReferences
{
  return -[AVFigObjectInspector _nonNilDictionaryForProperty:](self, "_nonNilDictionaryForProperty:", *MEMORY[0x1E0CC3AA0]);
}

- (id)creationDate
{
  id v2;

  v2 = -[AVFigObjectInspector _tollFreeBridgedObjectForProperty:](self, "_tollFreeBridgedObjectForProperty:", *MEMORY[0x1E0CC5F58]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    v2 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v2, *MEMORY[0x1E0CC47E8], CFSTR("creationDate"), *MEMORY[0x1E0CC47A8], CFSTR("comn"), *MEMORY[0x1E0CC47B0], 0);
  }
  if (v2)
    return +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", v2);
  return 0;
}

- (id)lyrics
{
  return -[AVFigObjectInspector _stringForProperty:](self, "_stringForProperty:", *MEMORY[0x1E0CC5F70]);
}

- (BOOL)isExportable
{
  BOOL v3;

  v3 = -[AVFigAssetInspector hasProtectedContent](self, "hasProtectedContent");
  return (v3 | -[AVFigAssetInspector _hasQTSaveRestriction](self, "_hasQTSaveRestriction")) ^ 1;
}

- (BOOL)isReadable
{
  BOOL v3;

  v3 = -[AVFigAssetInspector hasProtectedContent](self, "hasProtectedContent");
  return (v3 | -[AVFigAssetInspector _hasQTSaveRestriction](self, "_hasQTSaveRestriction")) ^ 1;
}

- (NSURL)URL
{
  return (NSURL *)-[AVFigObjectInspector _tollFreeBridgedObjectForProperty:](self, "_tollFreeBridgedObjectForProperty:", *MEMORY[0x1E0CC3998]);
}

- (NSURL)resolvedURL
{
  return (NSURL *)-[AVFigObjectInspector _tollFreeBridgedObjectForProperty:](self, "_tollFreeBridgedObjectForProperty:", *MEMORY[0x1E0CC3A88]);
}

- (NSURL)originalNetworkContentURL
{
  return (NSURL *)-[AVFigObjectInspector _tollFreeBridgedObjectForProperty:](self, "_tollFreeBridgedObjectForProperty:", *MEMORY[0x1E0CC3A60]);
}

- (unint64_t)downloadToken
{
  unint64_t result;

  result = -[AVFigObjectInspector _tollFreeBridgedObjectForProperty:](self, "_tollFreeBridgedObjectForProperty:", *MEMORY[0x1E0CC39B8]);
  if (result)
    return objc_msgSend((id)result, "unsignedLongLongValue");
  return result;
}

- (NSArray)contentKeySpecifiersEligibleForPreloading
{
  NSArray *v3;
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  uint64_t v9;
  const __CFString *v10;
  AVContentKeySpecifier *v11;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[AVFigAssetInspector _valueAsCFTypeForProperty:](self, "_valueAsCFTypeForProperty:", *MEMORY[0x1E0CC39F0]);
  if (v4)
  {
    v5 = v4;
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v7 = Count;
      v8 = 0;
      v9 = MEMORY[0x1E0C9AA70];
      do
      {
        CFArrayGetValueAtIndex(v5, v8);
        if (FigContentKeySpecifierGetKeySystem() == 1)
          v10 = CFSTR("FairPlayStreaming");
        else
          v10 = CFSTR("ClearKeySystem");
        v11 = +[AVContentKeySpecifier contentKeySpecifierForKeySystem:identifier:options:](AVContentKeySpecifier, "contentKeySpecifierForKeySystem:identifier:options:", v10, FigContentKeySpecifierGetIdentifier(), v9);
        if (v11)
          -[NSArray addObject:](v3, "addObject:", v11);
        ++v8;
      }
      while (v7 != v8);
    }
    CFRelease(v5);
  }
  return v3;
}

- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC3960]) != 0;
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  return -[AVFigObjectInspector _SInt32ForProperty:defaultValue:](self, "_SInt32ForProperty:defaultValue:", *MEMORY[0x1E0CC3940], 4294955496) == 0;
}

- (id)SHA1Digest
{
  return -[AVFigObjectInspector _tollFreeBridgedObjectForProperty:](self, "_tollFreeBridgedObjectForProperty:", *MEMORY[0x1E0CC3A90]);
}

- (BOOL)canContainFragments
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC3980]) != 0;
}

- (BOOL)containsFragments
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC3968]) != 0;
}

- (int64_t)firstFragmentSequenceNumber
{
  return -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC39C0]);
}

- (int64_t)fragmentCount
{
  return -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC39D8]);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overallDurationHint
{
  if (self)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE _timeForProperty:](self, "_timeForProperty:", *MEMORY[0x1E0CC3A48]);
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return self;
}

- (BOOL)supportsAnalysisReporting
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC5F68]) != 0;
}

- (id)_assetAnalysisMessages
{
  return -[AVFigObjectInspector _tollFreeBridgedObjectForProperty:](self, "_tollFreeBridgedObjectForProperty:", *MEMORY[0x1E0CC5F48]);
}

- (id)_nameForProxy
{
  NSString *v3;
  id v4;
  void *v5;
  int v6;

  v3 = -[NSString lastPathComponent](-[NSURL path](-[AVFigAssetInspector resolvedURL](self, "resolvedURL"), "path"), "lastPathComponent");
  v4 = -[AVFigAssetInspector identifyingTag](self, "identifyingTag");
  if (v4
    && ((v5 = v4,
         v6 = -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC3A30]),
         v6 == 4)
     || v6 == 2
     && (v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithMIMEType:", v5), "identifier")) != 0))
  {
    return (id)AVFileNameWithExtensionThatAccordsWithUTI(v3, v5);
  }
  else
  {
    return v3;
  }
}

- (int64_t)_moovAtomSize
{
  return -[AVFigObjectInspector _longLongForProperty:](self, "_longLongForProperty:", *MEMORY[0x1E0CC3AB8]);
}

- (id)propertyListForProxy
{
  id v3;

  v3 = -[AVFigObjectInspector _dataForProperty:](self, "_dataForProperty:", *MEMORY[0x1E0CC3A50]);
  return +[AVAssetProxy makePropertyListForMovieProxyHeader:name:prefersNominalDurations:](AVAssetProxy, "makePropertyListForMovieProxyHeader:name:prefersNominalDurations:", v3, -[AVFigAssetInspector _nameForProxy](self, "_nameForProxy"), ((unint64_t)-[AVFigObjectInspector _longLongForProperty:](self, "_longLongForProperty:", *MEMORY[0x1E0CC3988]) >> 8) & 1);
}

- (BOOL)_isDefunct
{
  OpaqueFigAsset *v2;
  _QWORD *v3;
  unsigned int (*v4)(OpaqueFigAsset *, unsigned __int8 *);
  BOOL v5;
  int v6;
  unsigned __int8 v8;

  v8 = 0;
  v2 = -[AVFigAssetInspector _figAsset](self, "_figAsset");
  v3 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v3 < 5uLL)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = (unsigned int (*)(OpaqueFigAsset *, unsigned __int8 *))v3[11];
    if (v4)
    {
      v5 = v4(v2, &v8) == 0;
      LODWORD(v4) = v8;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  if (v5)
    v6 = (int)v4;
  else
    v6 = 1;
  if (!(_DWORD)v4)
    LODWORD(v4) = v6;
  return (_DWORD)v4 == 1;
}

- (id)makePropertyListForProxyWithOptions:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t FigBaseObject;
  unsigned int (*v32)(uint64_t, _QWORD, void *);
  uint64_t v33;
  CFTypeRef v34;
  unsigned int (*v35)(CFTypeRef, const __CFString *, uint64_t, uint64_t, CFDataRef *);
  uint64_t v36;
  uint64_t CMBaseObject;
  unsigned int (*v38)(uint64_t, _QWORD, uint64_t);
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t, uint64_t, id *);
  int v41;
  id v42;
  uint64_t v44;
  unint64_t v45;
  id v46;
  id obj;
  uint64_t v48;
  AVFigAssetInspector *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CFTypeRef v64;
  CFTypeRef v65;
  id v66;
  CFTypeRef cf;
  CFDataRef theData;
  CFTypeRef v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[2];
  _QWORD v75[2];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  theData = 0;
  v69 = 0;
  v66 = 0;
  cf = 0;
  v64 = 0;
  v65 = 0;
  v5 = -[AVFigObjectInspector _longLongForProperty:](self, "_longLongForProperty:", *MEMORY[0x1E0CC3988]);
  v6 = *MEMORY[0x1E0CC3A50];
  v49 = self;
  v7 = -[AVFigObjectInspector _dataForProperty:](self, "_dataForProperty:", *MEMORY[0x1E0CC3A50]);
  if (!v7)
    goto LABEL_46;
  if (!objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVPropertyListForProxyCreationOption_ReduceMetadataForPhotoLibrary")), "BOOLValue"))goto LABEL_44;
  if (makePropertyListForProxyWithOptions__commonKeysWeWantToKeepOnce != -1)
    dispatch_once(&makePropertyListForProxyWithOptions__commonKeysWeWantToKeepOnce, &__block_literal_global_27);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = -[AVFigAssetInspector availableMetadataFormats](v49, "availableMetadataFormats");
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
  if (!v50)
  {
LABEL_44:
    v7 = +[AVAssetProxy makePropertyListForMovieProxyHeader:name:prefersNominalDurations:](AVAssetProxy, "makePropertyListForMovieProxyHeader:name:prefersNominalDurations:", v7, -[AVFigAssetInspector _nameForProxy](v49, "_nameForProxy"), (v5 >> 8) & 1);
    v42 = v66;
    if (!v66)
      goto LABEL_46;
    goto LABEL_45;
  }
  v45 = v5;
  v46 = v7;
  v44 = v6;
  v10 = 0;
  v48 = *(_QWORD *)v61;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v61 != v48)
        objc_enumerationMutation(obj);
      v51 = v11;
      v12 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v11);
      v13 = -[AVFigAssetInspector metadataForFormat:](v49, "metadataForFormat:", v12);
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v77, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v57 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            v19 = objc_msgSend(v18, "commonKey");
            if (v19
              && objc_msgSend((id)makePropertyListForProxyWithOptions__commonKeysWeWantToKeep, "containsObject:", v19))
            {
              objc_msgSend(v8, "addObject:", v18);
              objc_msgSend(v9, "addObject:", v12);
            }
            else
            {
              v10 = 1;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v77, 16);
        }
        while (v15);
      }
      v11 = v51 + 1;
    }
    while (v51 + 1 != v50);
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
  }
  while (v50);
  if ((v10 & 1) == 0)
  {
    v5 = v45;
    v7 = v46;
    goto LABEL_44;
  }
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", -[AVFigAssetInspector availableMetadataFormats](v49, "availableMetadataFormats"));
  objc_msgSend(v20, "minusSet:", v9);
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", +[AVMetadataItem _figMetadataPropertyFromMetadataItems:](AVMetadataItem, "_figMetadataPropertyFromMetadataItems:", v8));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v76, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v53;
    v25 = *MEMORY[0x1E0CC47F8];
    v26 = *MEMORY[0x1E0CC47F0];
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v53 != v24)
          objc_enumerationMutation(v20);
        objc_msgSend(v21, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "array"), v25, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j), v26, 0));
      }
      v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v76, 16);
    }
    while (v23);
  }
  v28 = MEMORY[0x1E0C9AAB0];
  v29 = *MEMORY[0x1E0CC4860];
  v74[0] = *MEMORY[0x1E0CC4868];
  v74[1] = v29;
  v75[0] = MEMORY[0x1E0C9AAB0];
  v75[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
  v30 = *MEMORY[0x1E0C9AE00];
  if (FigMutableMovieCreateFromData())
    goto LABEL_57;
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v32 = *(unsigned int (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v32)
    goto LABEL_57;
  if (v32(FigBaseObject, *MEMORY[0x1E0CC4890], v21))
    goto LABEL_57;
  v72 = *MEMORY[0x1E0CC4870];
  v73 = v28;
  v33 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
  v34 = v69;
  v35 = *(unsigned int (**)(CFTypeRef, const __CFString *, uint64_t, uint64_t, CFDataRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v35)
    goto LABEL_57;
  if (v35(v34, CFSTR("com.apple.quicktime-movie"), v33, v30, &theData))
    goto LABEL_57;
  CFDataGetLength(theData);
  if (FigCreateBlockBufferWithCFDataNoCopy())
    goto LABEL_57;
  if (CMByteStreamCreateForBlockBuffer())
    goto LABEL_57;
  v36 = -[AVFigAssetInspector resolvedURL](v49, "resolvedURL");
  CMBaseObject = CMByteStreamGetCMBaseObject();
  v38 = *(unsigned int (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v38
    || v38(CMBaseObject, *MEMORY[0x1E0CA2098], v36)
    || (v70 = *MEMORY[0x1E0CC3870],
        v71 = v28,
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1),
        FigAssetCreateWithByteStream(),
        v39 = FigAssetGetCMBaseObject(),
        (v40 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48)) == 0))
  {
LABEL_57:
    v7 = 0;
  }
  else
  {
    v41 = v40(v39, v44, v30, &v66);
    v42 = v66;
    if (!v41)
    {
      v7 = v66;
      v66 = 0;
      v5 = v45;
      goto LABEL_44;
    }
    v7 = 0;
    if (v66)
LABEL_45:
      CFRelease(v42);
  }
LABEL_46:
  if (cf)
    CFRelease(cf);
  if (v64)
    CFRelease(v64);
  if (v65)
    CFRelease(v65);
  if (theData)
    CFRelease(theData);
  if (v69)
    CFRelease(v69);
  return v7;
}

uint64_t __59__AVFigAssetInspector_makePropertyListForProxyWithOptions___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("creationDate"), CFSTR("identifier"), CFSTR("make"), CFSTR("model"), CFSTR("software"), CFSTR("location"), 0);
  makePropertyListForProxyWithOptions__commonKeysWeWantToKeep = result;
  return result;
}

- (CGSize)maximumVideoResolution
{
  double v2;
  double v3;
  CGSize result;

  -[AVFigObjectInspector _sizeForProperty:](self, "_sizeForProperty:", *MEMORY[0x1E0CC3A38]);
  result.height = v3;
  result.width = v2;
  return result;
}

@end
