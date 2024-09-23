@implementation AVAssetWriterInputSelectionOption

+ (id)assetWriterInputSelectionOptionWithAssetWriterInput:(id)a3
{
  return -[AVAssetWriterInputSelectionOption initWithAssetWriterInput:]([AVAssetWriterInputSelectionOption alloc], "initWithAssetWriterInput:", a3);
}

+ (id)assetWriterInputSelectionOptionWithAssetWriterInput:(id)a3 displaysNonForcedSubtitles:(BOOL)a4
{
  return -[AVAssetWriterInputSelectionOption initWithAssetWriterInput:displaysNonForcedSubtitles:]([AVAssetWriterInputSelectionOption alloc], "initWithAssetWriterInput:displaysNonForcedSubtitles:", a3, a4);
}

- (AVAssetWriterInputSelectionOption)initWithAssetWriterInput:(id)a3
{
  return -[AVAssetWriterInputSelectionOption initWithAssetWriterInput:displaysNonForcedSubtitles:](self, "initWithAssetWriterInput:displaysNonForcedSubtitles:", a3, 0);
}

- (AVAssetWriterInputSelectionOption)initWithAssetWriterInput:(id)a3 displaysNonForcedSubtitles:(BOOL)a4
{
  AVAssetWriterInputSelectionOption *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAssetWriterInputSelectionOption;
  v6 = -[AVMediaSelectionOption init](&v9, sel_init);
  if (v6)
  {
    v6->_input = (AVAssetWriterInput *)a3;
    v6->_mediaType = (NSString *)objc_msgSend((id)objc_msgSend(a3, "mediaType"), "copy");
    v6->_outputSettings = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "outputSettings"), "copy");
    v7 = (void *)objc_msgSend(a3, "sourceFormatHint");
    if (v7)
      v7 = (void *)CFRetain(v7);
    v6->_sourceFormatHint = (opaqueCMFormatDescription *)v7;
    v6->_languageCode = (NSString *)objc_msgSend((id)objc_msgSend(a3, "languageCode"), "copy");
    v6->_extendedLanguageTag = (NSString *)objc_msgSend((id)objc_msgSend(a3, "extendedLanguageTag"), "copy");
    v6->_metadata = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "metadata"), "copy");
    v6->_trackReferences = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "_trackReferences"), "copy");
    v6->_displaysNonForcedSubtitles = a4;
    v6->_enabled = objc_msgSend(a3, "marksOutputTrackAsEnabled");
  }
  return v6;
}

- (void)dealloc
{
  opaqueCMFormatDescription *sourceFormatHint;
  objc_super v4;

  sourceFormatHint = self->_sourceFormatHint;
  if (sourceFormatHint)
    CFRelease(sourceFormatHint);

  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputSelectionOption;
  -[AVMediaSelectionOption dealloc](&v4, sel_dealloc);
}

- (BOOL)_hasEqualValueForKey:(id)a3 asObject:(id)a4
{
  void *v6;
  uint64_t v7;

  v6 = (void *)-[AVAssetWriterInputSelectionOption valueForKey:](self, "valueForKey:");
  v7 = objc_msgSend(a4, "valueForKey:", a3);
  if (v6)
  {
    if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
      return 1;
  }
  else if (!v7)
  {
    return 1;
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  AVAssetWriterInput *input;
  _BOOL4 v6;

  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (input = self->_input, input == (AVAssetWriterInput *)objc_msgSend(a3, "input")))
    {
      v6 = -[AVAssetWriterInputSelectionOption _hasEqualValueForKey:asObject:](self, "_hasEqualValueForKey:asObject:", CFSTR("languageCode"), a3);
      if (v6)
      {
        v6 = -[AVAssetWriterInputSelectionOption _hasEqualValueForKey:asObject:](self, "_hasEqualValueForKey:asObject:", CFSTR("extendedLanguageTag"), a3);
        if (v6)
        {
          v6 = -[AVAssetWriterInputSelectionOption _hasEqualValueForKey:asObject:](self, "_hasEqualValueForKey:asObject:", CFSTR("metadata"), a3);
          if (v6)
          {
            v6 = -[AVAssetWriterInputSelectionOption _hasEqualValueForKey:asObject:](self, "_hasEqualValueForKey:asObject:", CFSTR("trackReferences"), a3);
            if (v6)
              LOBYTE(v6) = -[AVAssetWriterInputSelectionOption _hasEqualValueForKey:asObject:](self, "_hasEqualValueForKey:asObject:", CFSTR("displaysNonForcedSubtitles"), a3);
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  AVAssetWriterInput *input;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  input = self->_input;
  v4 = -[NSString hash](self->_languageCode, "hash") ^ (unint64_t)input;
  v5 = -[NSString hash](self->_extendedLanguageTag, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_metadata, "hash");
  return v6 ^ -[NSDictionary hash](self->_trackReferences, "hash") ^ self->_displaysNonForcedSubtitles;
}

- (id)_ancillaryDescription
{
  return &stru_1E303A378;
}

- (id)mediaSubTypes
{
  CFNumberRef v3;
  opaqueCMFormatDescription *sourceFormatHint;
  CFTypeID v5;
  int MediaSubType;
  id v7;
  int valuePtr;

  valuePtr = 0;
  if (!self->_outputSettings)
  {
    sourceFormatHint = self->_sourceFormatHint;
    if (!sourceFormatHint)
      return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = CFGetTypeID(sourceFormatHint);
    if (v5 != CMFormatDescriptionGetTypeID())
      return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
    MediaSubType = CMFormatDescriptionGetMediaSubType(self->_sourceFormatHint);
    v3 = 0;
    goto LABEL_12;
  }
  if (-[NSString isEqualToString:](self->_mediaType, "isEqualToString:", CFSTR("soun")))
    v3 = -[NSDictionary objectForKey:](self->_outputSettings, "objectForKey:", *MEMORY[0x1E0C898E0]);
  else
    v3 = 0;
  if (-[NSString isEqualToString:](self->_mediaType, "isEqualToString:", CFSTR("vide"))
    || -[NSString isEqualToString:](self->_mediaType, "isEqualToString:", CFSTR("auxv")))
  {
    v7 = -[NSDictionary objectForKey:](self->_outputSettings, "objectForKey:", CFSTR("AVVideoCodecKey"));
    if (v7)
    {
      MediaSubType = AVOSTypeForString(v7);
LABEL_12:
      valuePtr = MediaSubType;
      if (MediaSubType)
        v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
    }
  }
  if (v3)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)_taggedCharacteristics
{
  return -[NSArray arrayByAddingObjectsFromArray:](+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", -[AVAssetWriterInputSelectionOption metadataForFormat:](self, "metadataForFormat:", CFSTR("com.apple.quicktime.udta")), CFSTR("tagc"), CFSTR("udta")), "arrayByAddingObjectsFromArray:", +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", -[AVAssetWriterInputSelectionOption metadataForFormat:](self, "metadataForFormat:", CFSTR("org.mp4ra")), CFSTR("tagc"), CFSTR("uiso")));
}

- (BOOL)_isAuxiliaryContent
{
  return objc_msgSend(+[AVMetadataItem metadataItemsFromArray:withStringValue:](AVMetadataItem, "metadataItemsFromArray:withStringValue:", -[AVAssetWriterInputSelectionOption _taggedCharacteristics](self, "_taggedCharacteristics"), CFSTR("public.auxiliary-content")), "count") != 0;
}

- (BOOL)isPlayable
{
  return self->_outputSettings
      || !self->_sourceFormatHint
      || !+[AVURLAsset _avfValidationPlist](AVURLAsset, "_avfValidationPlist")
      || FigMediaValidatorValidateFormatDescription() == 0;
}

- (BOOL)_isDesignatedDefault
{
  return self->_enabled;
}

- (id)locale
{
  const __CFString *extendedLanguageTag;

  extendedLanguageTag = (const __CFString *)self->_extendedLanguageTag;
  if (extendedLanguageTag)
    return CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], extendedLanguageTag);
  extendedLanguageTag = (const __CFString *)self->_languageCode;
  if (extendedLanguageTag)
    return CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], extendedLanguageTag);
  else
    return 0;
}

- (id)commonMetadata
{
  return -[NSArray objectsAtIndexes:](self->_metadata, "objectsAtIndexes:", -[NSArray indexesOfObjectsPassingTest:](self->_metadata, "indexesOfObjectsPassingTest:", &__block_literal_global_9));
}

BOOL __51__AVAssetWriterInputSelectionOption_commonMetadata__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "commonKey") != 0;
}

- (id)availableMetadataFormats
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (-[NSArray count](+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", self->_metadata, 0, CFSTR("udta")), "count"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("com.apple.quicktime.udta"));
  }
  if (-[NSArray count](+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", self->_metadata, 0, CFSTR("uiso")), "count"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("org.mp4ra"));
    if (+[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace](AVMetadataItem, "_clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace"))
    {
      objc_msgSend(v3, "addObject:", CFSTR("com.apple.quicktime.udta"));
    }
  }
  if (-[NSArray count](+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", self->_metadata, 0, CFSTR("mdta")), "count"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("com.apple.quicktime.mdta"));
  }
  if (-[NSArray count](+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", self->_metadata, 0, CFSTR("itsk")), "count"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("com.apple.itunes"));
  }
  if (-[NSArray count](+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", self->_metadata, 0, CFSTR("org.id3")), "count"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("org.id3"));
  }
  return v3;
}

- (id)metadataForFormat:(id)a3
{
  const __CFString *v5;
  const AVMetadataKeySpace *v6;
  __CFString *v7;
  NSArray *metadata;
  NSArray *v9;
  _QWORD v11[5];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.quicktime.udta")))
    v5 = CFSTR("udta");
  else
    v5 = 0;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("org.mp4ra")))
  {
    v6 = &AVMetadataKeySpaceISOUserData;
LABEL_10:
    v7 = (__CFString *)*v6;
    goto LABEL_11;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.quicktime.mdta")))
  {
    v6 = &AVMetadataKeySpaceQuickTimeMetadata;
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.itunes")))
  {
    v6 = &AVMetadataKeySpaceiTunes;
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("org.id3")))
    v7 = CFSTR("org.id3");
  else
    v7 = (__CFString *)v5;
LABEL_11:
  metadata = self->_metadata;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__AVAssetWriterInputSelectionOption_metadataForFormat___block_invoke;
  v11[3] = &unk_1E3030948;
  v11[4] = v7;
  v9 = -[NSArray objectsAtIndexes:](self->_metadata, "objectsAtIndexes:", -[NSArray indexesOfObjectsPassingTest:](metadata, "indexesOfObjectsPassingTest:", v11));
  if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("udta"))
    && +[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace](AVMetadataItem, "_clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace"))
  {
    return -[NSArray arrayByAddingObjectsFromArray:](v9, "arrayByAddingObjectsFromArray:", +[AVMetadataItem _replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:](AVMetadataItem, "_replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:", -[AVAssetWriterInputSelectionOption metadataForFormat:](self, "metadataForFormat:", CFSTR("org.mp4ra"))));
  }
  else
  {
    return v9;
  }
}

uint64_t __55__AVAssetWriterInputSelectionOption_metadataForFormat___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(a2, "keySpace"));
}

- (id)associatedMediaSelectionOptionInMediaSelectionGroup:(id)a3
{
  void *v5;
  NSDictionary *trackReferences;
  id result;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  NSDictionary *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = (void *)objc_msgSend(a3, "inputs");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  trackReferences = self->_trackReferences;
  result = -[NSDictionary countByEnumeratingWithState:objects:count:](trackReferences, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v25;
    v18 = *(_QWORD *)v25;
    v19 = trackReferences;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(trackReferences);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v12 = -[NSDictionary objectForKey:](self->_trackReferences, "objectForKey:", v11, v18);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v21 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
              if ((objc_msgSend(v5, "containsObject:", v17) & 1) != 0)
                return +[AVAssetWriterInputSelectionOption assetWriterInputSelectionOptionWithAssetWriterInput:](AVAssetWriterInputSelectionOption, "assetWriterInputSelectionOptionWithAssetWriterInput:", v17);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v14)
              continue;
            break;
          }
        }
        v9 = v18;
        trackReferences = v19;
      }
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      result = 0;
    }
    while (v8);
  }
  return result;
}

- (id)propertyList
{
  AVAssetWriterInput *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = -[AVAssetWriterInputSelectionOption input](self, "input");
  v4 = CFSTR("UnsafeUnretainedPointerData");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v3, 8);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
}

- (AVAssetWriterInput)input
{
  return self->_input;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSDictionary)outputSettings
{
  return self->_outputSettings;
}

- (opaqueCMFormatDescription)sourceFormatHint
{
  return self->_sourceFormatHint;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)extendedLanguageTag
{
  return self->_extendedLanguageTag;
}

- (NSArray)metadata
{
  return self->_metadata;
}

- (NSDictionary)trackReferences
{
  return self->_trackReferences;
}

- (BOOL)displaysNonForcedSubtitles
{
  return self->_displaysNonForcedSubtitles;
}

@end
