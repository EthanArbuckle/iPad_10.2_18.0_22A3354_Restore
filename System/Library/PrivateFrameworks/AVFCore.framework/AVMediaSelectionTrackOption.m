@implementation AVMediaSelectionTrackOption

- (AVMediaSelectionTrackOption)initWithAsset:(id)a3 group:(id)a4 dictionary:(id)a5
{
  AVMediaSelectionTrackOption *v8;
  AVMediaSelectionTrackOption *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVMediaSelectionTrackOption;
  v8 = -[AVMediaSelectionOption initWithGroup:](&v13, sel_initWithGroup_, a4);
  v9 = v8;
  if (v8)
  {
    if (a3 && a4 && a5)
    {
      v8->_dictionary = (NSDictionary *)objc_msgSend(a5, "copy");
      v9->_groupID = (id)objc_msgSend(a4, "_groupID");
      v9->_weakReferenceToGroup = (AVWeakReference *)(id)objc_msgSend(a4, "_weakReference");
      v10 = (void *)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC5F20]);
      v11 = (void *)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC5EE8]);
      if (objc_msgSend(v11, "count"))
        v10 = (void *)objc_msgSend(v11, "objectAtIndex:", 0);
      v9->_track = (AVAssetTrack *)(id)objc_msgSend(a3, "trackWithTrackID:", objc_msgSend(v10, "intValue"));
      v9->_displaysNonForcedSubtitles = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC5ED8]), "BOOLValue");
      v9->_audioCompositionPresetIndex = (NSNumber *)objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC5EC0]), "copy");
      v9->_audioCompositionPresetIndexesForFallbackIDs = (NSArray *)objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CC5EC8]), "copy");
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMediaSelectionTrackOption;
  -[AVMediaSelectionOption dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  int displaysNonForcedSubtitles;
  NSNumber *audioCompositionPresetIndex;
  int v8;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_6:
      LOBYTE(v5) = 0;
      return v5;
    }
    v5 = -[AVAssetTrack isEqual:](self->_track, "isEqual:", objc_msgSend(a3, "track"));
    if (v5)
    {
      displaysNonForcedSubtitles = self->_displaysNonForcedSubtitles;
      if (displaysNonForcedSubtitles != objc_msgSend(a3, "displaysNonForcedSubtitles"))
        goto LABEL_6;
      audioCompositionPresetIndex = self->_audioCompositionPresetIndex;
      if (audioCompositionPresetIndex != (NSNumber *)objc_msgSend(a3, "_audioCompositionPresetIndex"))
        goto LABEL_6;
      v8 = objc_msgSend(-[NSArray firstObject](self->_audioCompositionPresetIndexesForFallbackIDs, "firstObject"), "intValue");
      LOBYTE(v5) = v8 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "_audioCompositionPresetIndexesForFallbackIDs"), "firstObject"), "intValue");
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSInteger v4;

  v3 = -[AVAssetTrack hash](self->_track, "hash") ^ self->_displaysNonForcedSubtitles;
  v4 = -[NSNumber integerValue](self->_audioCompositionPresetIndex, "integerValue");
  return v3 ^ v4 ^ -[NSArray hash](self->_audioCompositionPresetIndexesForFallbackIDs, "hash");
}

- (id)dictionary
{
  return self->_dictionary;
}

- (id)group
{
  return -[AVWeakReference referencedObject](self->_weakReferenceToGroup, "referencedObject");
}

- (id)_groupID
{
  return self->_groupID;
}

- (BOOL)displaysNonForcedSubtitles
{
  return self->_displaysNonForcedSubtitles;
}

- (id)_audioCompositionPresetIndex
{
  return self->_audioCompositionPresetIndex;
}

- (id)_audioCompositionPresetIndexesForFallbackIDs
{
  return self->_audioCompositionPresetIndexesForFallbackIDs;
}

- (id)mediaType
{
  return -[AVAssetTrack mediaType](self->_track, "mediaType");
}

- (id)_track
{
  return self->_track;
}

- (id)mediaSubTypes
{
  id v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSArray *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  const void *v16;
  CFTypeID v17;
  uint64_t v18;
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
  v3 = -[AVMediaSelectionOption fallbackIDs](self, "fallbackIDs");
  if (v3)
  {
    v4 = v3;
    v5 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v4);
          v10 = -[AVAssetTrack formatDescriptions](-[AVAsset trackWithTrackID:](-[AVAssetTrack asset](self->_track, "asset"), "trackWithTrackID:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "unsignedIntValue")), "formatDescriptions");
          if (v10)
            -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:", v10);
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }
  }
  else
  {
    v5 = -[AVAssetTrack formatDescriptions](self->_track, "formatDescriptions");
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v5);
        v16 = *(const void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        v17 = CFGetTypeID(v16);
        if (v17 == CMFormatDescriptionGetTypeID())
        {
          v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v16));
          if ((objc_msgSend(v11, "containsObject:", v18) & 1) == 0)
            objc_msgSend(v11, "addObject:", v18);
        }
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v13);
  }
  return v11;
}

- (BOOL)isPlayable
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(-[AVMediaSelectionOption fallbackIDs](self, "fallbackIDs"), "reverseObjectEnumerator");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if (-[AVAssetTrack isPlayable](-[AVAsset trackWithTrackID:](-[AVAssetTrack asset](self->_track, "asset"), "trackWithTrackID:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "unsignedIntValue")), "isPlayable"))
        {
          return 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
  return -[AVAssetTrack isPlayable](self->_track, "isPlayable");
}

- (id)locale
{
  return -[AVAssetTrack locale](self->_track, "locale");
}

- (id)commonMetadata
{
  return -[AVAssetTrack commonMetadata](self->_track, "commonMetadata");
}

- (id)availableMetadataFormats
{
  return -[AVAssetTrack availableMetadataFormats](self->_track, "availableMetadataFormats");
}

- (id)metadataForFormat:(id)a3
{
  return -[AVAssetTrack metadataForFormat:](self->_track, "metadataForFormat:", a3);
}

- (id)associatedMediaSelectionOptionInMediaSelectionGroup:(id)a3
{
  NSString *v5;
  id result;
  objc_super v7;

  if (!objc_msgSend(a3, "isEqual:", -[AVMediaSelectionTrackOption group](self, "group")))
  {
    v7.receiver = self;
    v7.super_class = (Class)AVMediaSelectionTrackOption;
    return -[AVMediaSelectionOption associatedMediaSelectionOptionInMediaSelectionGroup:](&v7, sel_associatedMediaSelectionOptionInMediaSelectionGroup_, a3);
  }
  v5 = -[AVAssetTrack mediaType](self->_track, "mediaType");
  if (!-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("sbtl")))
  {
    if (-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("soun")))
    {
      result = -[AVAssetTrack _fallbackTrack](self->_track, "_fallbackTrack");
      if (!result)
        return result;
      return (id)objc_msgSend(a3, "_optionWithID:displaysNonForcedSubtitles:audioCompositionPresetIndex:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(result, "trackID")), 0, 0);
    }
    return 0;
  }
  if (!-[AVMediaSelectionTrackOption displaysNonForcedSubtitles](self, "displaysNonForcedSubtitles"))
    return 0;
  result = -[AVAssetTrack _pairedForcedOnlySubtitlesTrack](self->_track, "_pairedForcedOnlySubtitlesTrack");
  if (result)
    return (id)objc_msgSend(a3, "_optionWithID:displaysNonForcedSubtitles:audioCompositionPresetIndex:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(result, "trackID")), 0, 0);
  result = self->_track;
  if (result)
    return (id)objc_msgSend(a3, "_optionWithID:displaysNonForcedSubtitles:audioCompositionPresetIndex:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(result, "trackID")), 0, 0);
  return result;
}

- (id)track
{
  return self->_track;
}

- (int)trackID
{
  return -[AVAssetTrack trackID](self->_track, "trackID");
}

@end
