@implementation AVAsset

- (NSArray)availableMediaCharacteristicsWithMediaSelectionOptions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  const __CFString *v13;
  char v14;
  char v15;
  char v16;
  void *v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = -[AVAsset _mediaSelectionGroupDictionaries](self, "_mediaSelectionGroupDictionaries");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    v7 = *MEMORY[0x1E0CC5E98];
    v23 = *MEMORY[0x1E0CC5E90];
    v22 = *MEMORY[0x1E0CC5E60];
    v21 = *MEMORY[0x1E0CC5E68];
    v20 = *MEMORY[0x1E0CC5E78];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(v9, "objectForKey:", v7);
        if (v10)
        {
          v11 = v10;
          v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("soun"));
          v13 = CFSTR("AVMediaCharacteristicAudible");
          if ((v12 & 1) != 0)
            goto LABEL_17;
          v14 = objc_msgSend(v11, "isEqualToString:", CFSTR("sbtl"));
          v13 = CFSTR("AVMediaCharacteristicLegible");
          if ((v14 & 1) != 0)
            goto LABEL_17;
          v15 = objc_msgSend(v11, "isEqualToString:", CFSTR("clcp"));
          v13 = CFSTR("AVMediaCharacteristicLegible");
          if ((v15 & 1) != 0)
            goto LABEL_17;
          v16 = objc_msgSend(v11, "isEqualToString:", CFSTR("vide"));
          v13 = CFSTR("AVMediaCharacteristicVisual");
          if ((v16 & 1) != 0)
            goto LABEL_17;
        }
        else
        {
          v17 = (void *)objc_msgSend(v9, "objectForKey:", v23);
          if (objc_msgSend(v17, "containsObject:", v22))
            objc_msgSend(v3, "addObject:", CFSTR("AVMediaCharacteristicAudible"));
          if (objc_msgSend(v17, "containsObject:", v21))
            objc_msgSend(v3, "addObject:", CFSTR("AVMediaCharacteristicLegible"));
          v18 = objc_msgSend(v17, "containsObject:", v20);
          v13 = CFSTR("AVMediaCharacteristicVisual");
          if (v18)
          {
LABEL_17:
            objc_msgSend(v3, "addObject:", v13);
            continue;
          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }
  return (NSArray *)objc_msgSend(v3, "allObjects");
}

- (BOOL)isComposable
{
  return objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "isComposable");
}

- (NSArray)availableMetadataFormats
{
  NSArray *v3;

  objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_ensureAllDependenciesOfKeyAreLoaded:", CFSTR("availableMetadataFormats"));
  v3 = (NSArray *)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "availableMetadataFormats");
  if (+[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace](AVMetadataItem, "_clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace")&& -[NSArray containsObject:](v3, "containsObject:", CFSTR("org.mp4ra")))
  {
    return -[NSArray arrayByAddingObject:](v3, "arrayByAddingObject:", CFSTR("com.apple.quicktime.udta"));
  }
  else
  {
    return v3;
  }
}

- (BOOL)hasProtectedContent
{
  return objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "hasProtectedContent");
}

- (id)valueForUndefinedKey:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("streaming")))
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAsset _isStreaming](self, "_isStreaming"));
  v6.receiver = self;
  v6.super_class = (Class)AVAsset;
  return -[AVAsset valueForUndefinedKey:](&v6, sel_valueForUndefinedKey_, a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "isEqual:", objc_msgSend(a3, "_assetInspectorLoader"));
  else
    return 0;
}

- (AVAsset)init
{
  AVAsset *v3;
  uint64_t v4;
  AVAssetInternal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAsset;
  v3 = -[AVAsset init](&v7, sel_init);
  if (v3)
  {
    v4 = objc_opt_class();
    AVRequireConcreteObject(v3, a2, v4);
    v5 = objc_alloc_init(AVAssetInternal);
    v3->_asset = v5;
    if (v5)
    {
      v3->_asset->loadChapterInfoOnce = objc_alloc_init(AVDispatchOnce);
      v3->_asset->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v3);
      v3->_asset->loggingIdentifier = (AVLoggingIdentifier *)+[AVAsset makeAssetLoggingIdentifier](AVAsset, "makeAssetLoggingIdentifier");
    }
    else
    {

      return 0;
    }
  }
  return v3;
}

+ (id)makeAssetLoggingIdentifier
{
  return objc_alloc_init(AVAssetLoggingIdentifier);
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "loadValuesAsynchronouslyForKeys:completionHandler:", a3, a4);
}

- (unint64_t)hash
{
  return objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "hash");
}

- (BOOL)_isStreaming
{
  return objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_isStreaming");
}

- (OpaqueFigAsset)_figAsset
{
  return (OpaqueFigAsset *)objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_figAsset");
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  return objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "statusOfValueForKey:error:", a3, a4);
}

+ (BOOL)_assetCreationOptionsRequiresInProcessOperation:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetRequiresInProcessOperationKey"));
  return v3 && (objc_msgSend(v3, "BOOLValue") & 1) != 0;
}

+ (BOOL)_assetCreationOptionsPrefersSandboxedOption:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("AVAssetPrefersSandboxedParsingOptionKey")), "BOOLValue");
}

- (id)tracksWithMediaCharacteristics:(id)a3
{
  AVAssetTrackEnumerator *v3;
  void *v4;

  v3 = -[AVAssetTrackEnumerator initWithAsset:mediaCharacteristics:]([AVAssetTrackEnumerator alloc], "initWithAsset:mediaCharacteristics:", self, a3);
  v4 = (void *)-[AVAssetTrackEnumerator allObjects](v3, "allObjects");

  return v4;
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  AVAssetTrackEnumerator *v3;
  NSArray *v4;

  v3 = -[AVAssetTrackEnumerator initWithAsset:mediaType:]([AVAssetTrackEnumerator alloc], "initWithAsset:mediaType:", self, mediaType);
  v4 = (NSArray *)-[AVAssetTrackEnumerator allObjects](v3, "allObjects");

  return v4;
}

- (AVAssetTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  AVAssetTrack *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[AVAsset tracks](self, "tracks", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(AVAssetTrack **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (-[AVAssetTrack trackID](v9, "trackID") == trackID)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)_prefersNominalDurations
{
  return objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_prefersNominalDurations");
}

- (id)_weakReference
{
  return self->_asset->weakReference;
}

- (AVLoggingIdentifier)loggingIdentifier
{
  return self->_asset->loggingIdentifier;
}

- (id)_nameForLogging
{
  AVAssetInternal *asset;
  AVLoggingIdentifier *loggingIdentifier;

  asset = self->_asset;
  if (asset && (loggingIdentifier = asset->loggingIdentifier) != 0)
    return (id)-[AVLoggingIdentifier name](loggingIdentifier, "name");
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
}

- (CMTime)duration
{
  CMTime *result;

  result = -[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader");
  if (result)
    return (CMTime *)-[CMTime duration](result, "duration");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (AVMediaSelectionGroup)mediaSelectionGroupForMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  const __CFString *v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  AVMediaSelectionGroup *result;
  AVMediaSelectionGroup *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  AVMediaSelectionGroup *i;
  void *v15;
  void *v16;
  void *v17;
  AVAsset *v18;
  const __CFString *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](mediaCharacteristic, "isEqualToString:", CFSTR("AVMediaCharacteristicAudible")))
  {
    v19 = 0;
    v5 = CFSTR("soun");
    v6 = (uint64_t *)MEMORY[0x1E0CC5E60];
LABEL_7:
    v7 = *v6;
    goto LABEL_8;
  }
  if (-[NSString isEqualToString:](mediaCharacteristic, "isEqualToString:", CFSTR("AVMediaCharacteristicLegible")))
  {
    v5 = CFSTR("sbtl");
    v19 = CFSTR("clcp");
    v6 = (uint64_t *)MEMORY[0x1E0CC5E68];
    goto LABEL_7;
  }
  if (-[NSString isEqualToString:](mediaCharacteristic, "isEqualToString:", CFSTR("AVMediaCharacteristicVisual")))
  {
    v19 = 0;
    v5 = CFSTR("vide");
    v6 = (uint64_t *)MEMORY[0x1E0CC5E78];
    goto LABEL_7;
  }
  v5 = 0;
  v19 = 0;
  v7 = 0;
LABEL_8:
  if (!((unint64_t)v5 | v7))
    return 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = -[AVAsset _mediaSelectionGroupDictionaries](self, "_mediaSelectionGroupDictionaries");
  result = (AVMediaSelectionGroup *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (result)
  {
    v10 = result;
    v18 = self;
    v11 = *(_QWORD *)v21;
    v12 = *MEMORY[0x1E0CC5E98];
    v13 = *MEMORY[0x1E0CC5E90];
    while (2)
    {
      for (i = 0; i != v10; i = (AVMediaSelectionGroup *)((char *)i + 1))
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_msgSend(v15, "objectForKey:", v12, v18);
        if (v16)
        {
          v17 = v16;
          if ((objc_msgSend(v16, "isEqualToString:", v5) & 1) != 0
            || (objc_msgSend(v17, "isEqualToString:", v19) & 1) != 0)
          {
            return +[AVMediaSelectionGroup mediaSelectionGroupWithAsset:dictionary:](AVMediaSelectionGroup, "mediaSelectionGroupWithAsset:dictionary:", v18, v15);
          }
        }
        if ((objc_msgSend((id)objc_msgSend(v15, "objectForKey:", v13), "containsObject:", v7) & 1) != 0)
          return +[AVMediaSelectionGroup mediaSelectionGroupWithAsset:dictionary:](AVMediaSelectionGroup, "mediaSelectionGroupWithAsset:dictionary:", v18, v15);
      }
      v10 = (AVMediaSelectionGroup *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      result = 0;
      if (v10)
        continue;
      break;
    }
  }
  return result;
}

- (id)_mediaSelectionGroupDictionaries
{
  objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_ensureAllDependenciesOfKeyAreLoaded:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"));
  return (id)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "_mediaSelectionGroupDictionaries");
}

- (id)_tracksWithClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFNumber *v11;
  id v12;
  void *v13;
  id v14;
  unsigned int valuePtr;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "trackIDs");
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "count");
  else
    v8 = objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "trackCount");
  v9 = v8;
  if (v8 >= 1)
  {
    v10 = 0;
    do
    {
      if (v7)
      {
        v11 = (const __CFNumber *)objc_msgSend(v7, "objectAtIndex:", v10);
        valuePtr = 0;
        CFNumberGetValue(v11, kCFNumberSInt32Type, &valuePtr);
        v12 = [a3 alloc];
        v13 = (void *)objc_msgSend(v12, "_initWithAsset:trackID:", self, valuePtr);
      }
      else
      {
        v13 = (void *)objc_msgSend([a3 alloc], "_initWithAsset:trackIndex:", self, v10);
      }
      v14 = v13;
      if (v14)
        objc_msgSend(v5, "addObject:", v14);
      ++v10;
    }
    while (v9 != v10);
  }
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    FigKTraceInit();
}

+ (AVAsset)assetWithURL:(NSURL *)URL
{
  if ((id)objc_opt_class() == a1)
    return (AVAsset *)+[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", URL, 0);
  else
    return (AVAsset *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:options:", URL, 0);
}

+ (BOOL)supportsPlayerItems
{
  return 1;
}

- (id)_chapterMetadataGroupsWithFigChapterGroups:(id)a3 titleLanguage:(id)a4 containingItemsWithCommonKeys:(id)a5
{
  __int128 v6;
  __int128 v7;
  NSArray *chapterGroupInfo;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v23;
  CFIndex Count;
  CFIndex v25;
  CFIndex v26;
  const __CFDictionary *ValueAtIndex;
  void *v28;
  AVAsset *v29;
  uint64_t v30;
  AVChapterMetadataItem *v31;
  id v32;
  AVTimedMetadataGroup *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  int v47;
  int v48;
  CFIndex v49;
  CFIndex v50;
  uint64_t v51;
  CFIndex j;
  const __CFDictionary *v53;
  void *v54;
  uint64_t v55;
  AVChapterMetadataItem *v56;
  id v57;
  AVAsset *v59;
  NSArray *obj;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  CMTimeRange valuePtr;
  CMTime duration;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  CMTimeRange v83;
  CFArrayRef theArray;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  theArray = 0;
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v7 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&v83.start.epoch = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&v83.duration.timescale = v6;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  *(_OWORD *)&v83.start.value = v7;
  v79 = 0u;
  chapterGroupInfo = self->_asset->chapterGroupInfo;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](chapterGroupInfo, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v80;
  v59 = self;
LABEL_3:
  v13 = 0;
  v68 = v11;
  v70 = v11 + v10;
  while (1)
  {
    if (*(_QWORD *)v80 != v12)
      objc_enumerationMutation(chapterGroupInfo);
    v14 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v13);
    v15 = (void *)objc_msgSend(v14, "valueForKey:", CFSTR("AVChapterGroupTypeKey"));
    v64 = v14;
    v16 = objc_msgSend(v14, "valueForKey:", CFSTR("AVChapterGroupExtendedLanguageTagKey"));
    v17 = v16 ? objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v16) : 0;
    v18 = objc_msgSend(v64, "valueForKey:", CFSTR("AVChapterGroupLanguageCodeKey"));
    v19 = v18 ? objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v18) : 0;
    v20 = (void *)objc_msgSend(v64, "valueForKey:", CFSTR("AVChapterGroupPerChapterInfoKey"));
    if (objc_msgSend(v15, "isEqualToString:", v59->_asset->anchorChapterType))
    {
      if ((objc_msgSend(a4, "isEqualToString:", v17) & 1) != 0
        || objc_msgSend(a4, "isEqualToString:", v19))
      {
        break;
      }
    }
    if (v10 == ++v13)
    {
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](chapterGroupInfo, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
      v11 = v70;
      if (v10)
        goto LABEL_3;
      return 0;
    }
  }
  v22 = (void *)objc_msgSend(v64, "valueForKey:", CFSTR("AVChapterGroupChaptersKey"));
  v23 = 0x1E0C99000;
  if (!v22)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v71 = v68 + v13;
    if (FCSupport_CopyChapterTimeRangesForChapterGroup())
      return 0;
    if (theArray)
    {
      Count = CFArrayGetCount(theArray);
      if (Count)
      {
        v25 = Count;
        v26 = 0;
        v69 = *MEMORY[0x1E0CC4010];
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v26);
          CMTimeRangeMakeFromDictionary(&v83, ValueAtIndex);
          if (objc_msgSend(v20, "count"))
          {
            v28 = (void *)objc_msgSend(v20, "objectAtIndex:", v26);
            LODWORD(valuePtr.start.value) = 0;
            CFNumberGetValue((CFNumberRef)objc_msgSend(v28, "objectForKey:", v69), kCFNumberSInt32Type, &valuePtr);
            v29 = v59;
            v30 = -[AVAsset _chapterDataTypeForMediaSubType:](v59, "_chapterDataTypeForMediaSubType:", LODWORD(valuePtr.start.value));
          }
          else
          {
            v30 = 0;
            v29 = v59;
          }
          v31 = [AVChapterMetadataItem alloc];
          *(_OWORD *)&valuePtr.start.value = *(_OWORD *)&v83.start.value;
          valuePtr.start.epoch = v83.start.epoch;
          duration = v83.duration;
          v32 = -[AVChapterMetadataItem _initWithAsset:chapterGroupIndex:chapterIndex:chapterType:extendedLanguageTag:languageCode:chapterDataType:time:duration:](v31, "_initWithAsset:chapterGroupIndex:chapterIndex:chapterType:extendedLanguageTag:languageCode:chapterDataType:time:duration:", v29, v71, v26, v15, v16, v18, v30, &valuePtr, &duration);
          v33 = [AVTimedMetadataGroup alloc];
          v34 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v32);
          valuePtr = v83;
          objc_msgSend(v22, "addObject:", -[AVTimedMetadataGroup initWithItems:timeRange:](v33, "initWithItems:timeRange:", v34, &valuePtr));
          ++v26;
        }
        while (v25 != v26);
      }
      v23 = 0x1E0C99000uLL;
      if (theArray)
      {
        CFRelease(theArray);
        theArray = 0;
      }
    }
    objc_msgSend(v64, "setObject:forKey:", v22, CFSTR("AVChapterGroupChaptersKey"));
    if (!v22)
      return 0;
  }
  v21 = (id)objc_msgSend(v22, "mutableCopy");
  v35 = objc_msgSend(v21, "count");
  if (v35)
  {
    v36 = v35;
    for (i = 0; i != v36; ++i)
      objc_msgSend(v21, "replaceObjectAtIndex:withObject:", i, (id)objc_msgSend((id)objc_msgSend(v21, "objectAtIndex:", i), "mutableCopy"));
  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v59->_asset->chapterGroupInfo;
  v63 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
  if (v63)
  {
    v72 = v21;
    v38 = 0;
    v62 = *(_QWORD *)v74;
    v67 = *MEMORY[0x1E0CC4010];
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v74 != v62)
          objc_enumerationMutation(obj);
        v40 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v39);
        v41 = (void *)objc_msgSend(v40, "valueForKey:", CFSTR("AVChapterGroupTypeKey"));
        v42 = objc_msgSend(v40, "valueForKey:", CFSTR("AVChapterGroupExtendedLanguageTagKey"));
        if (v42)
          v43 = objc_msgSend(*(id *)(v23 + 3528), "canonicalLanguageIdentifierFromString:", v42);
        else
          v43 = 0;
        v44 = objc_msgSend(v40, "valueForKey:", CFSTR("AVChapterGroupLanguageCodeKey"));
        v66 = v39;
        if (v44)
          v45 = objc_msgSend(*(id *)(v23 + 3528), "canonicalLanguageIdentifierFromString:", v44);
        else
          v45 = 0;
        v46 = (void *)objc_msgSend(v40, "valueForKey:", CFSTR("AVChapterGroupPerChapterInfoKey"));
        v47 = objc_msgSend(a5, "containsObject:", v41);
        if (v40 != v64)
        {
          v48 = v47;
          if (((objc_msgSend(a4, "isEqualToString:", v43) & 1) != 0
             || (objc_msgSend(a4, "isEqualToString:", v45) | v48) == 1)
            && ((objc_msgSend(a5, "containsObject:", v41) & 1) != 0
             || objc_msgSend(v41, "isEqualToString:", v59->_asset->anchorChapterType)))
          {
            if (FCSupport_CopyChapterTimeRangesForChapterGroup())
              return v72;
            if (theArray)
            {
              v49 = CFArrayGetCount(theArray);
              if (v49)
              {
                v50 = v49;
                v51 = 0;
                for (j = 0; j != v50; ++j)
                {
                  v53 = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, j);
                  CMTimeRangeMakeFromDictionary(&valuePtr, v53);
                  v83 = valuePtr;
                  if (objc_msgSend(v46, "count"))
                  {
                    v54 = (void *)objc_msgSend(v46, "objectAtIndex:", j);
                    LODWORD(valuePtr.start.value) = 0;
                    CFNumberGetValue((CFNumberRef)objc_msgSend(v54, "objectForKey:", v67), kCFNumberSInt32Type, &valuePtr);
                    v55 = -[AVAsset _chapterDataTypeForMediaSubType:](v59, "_chapterDataTypeForMediaSubType:", LODWORD(valuePtr.start.value));
                  }
                  else
                  {
                    v55 = 0;
                  }
                  v56 = [AVChapterMetadataItem alloc];
                  *(_OWORD *)&valuePtr.start.value = *(_OWORD *)&v83.start.value;
                  valuePtr.start.epoch = v83.start.epoch;
                  duration = v83.duration;
                  v57 = -[AVChapterMetadataItem _initWithAsset:chapterGroupIndex:chapterIndex:chapterType:extendedLanguageTag:languageCode:chapterDataType:time:duration:](v56, "_initWithAsset:chapterGroupIndex:chapterIndex:chapterType:extendedLanguageTag:languageCode:chapterDataType:time:duration:", v59, v38, j, v41, v42, v44, v55, &valuePtr, &duration);
                  valuePtr = v83;
                  v51 = -[AVAsset _addChapterMetadataItem:timeRange:toChapters:fromIndex:](v59, "_addChapterMetadataItem:timeRange:toChapters:fromIndex:", v57, &valuePtr, v72, v51);
                }
              }
              v23 = 0x1E0C99000;
              if (theArray)
              {
                CFRelease(theArray);
                theArray = 0;
              }
            }
          }
        }
        ++v38;
        v39 = v66 + 1;
      }
      while (v66 + 1 != v63);
      v63 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
    }
    while (v63);
    return v72;
  }
  return v21;
}

- (id)_chapterDataTypeForMediaSubType:(int)a3
{
  id result;
  id *v4;

  result = 0;
  if (a3 > 1785750886)
  {
    if (a3 == 1785750887)
    {
      v4 = (id *)MEMORY[0x1E0CA2408];
    }
    else
    {
      if (a3 != 1886283552)
        return result;
      v4 = (id *)MEMORY[0x1E0CA2418];
    }
  }
  else if (a3 == 1465011269)
  {
    v4 = (id *)MEMORY[0x1E0CA23E0];
  }
  else
  {
    if (a3 != 1734960672)
      return result;
    v4 = (id *)MEMORY[0x1E0CA2400];
  }
  return *v4;
}

- (unint64_t)_addChapterMetadataItem:(id)a3 timeRange:(id *)a4 toChapters:(id)a5 fromIndex:(unint64_t)a6
{
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  id v17;
  __int128 v18;
  CMTime start;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v23;
  CMTimeRange v24;

  v10 = objc_msgSend(a5, "count");
  if (v10 > a6)
  {
    v11 = v10;
    v12 = MEMORY[0x1E0CA2E68];
    for (i = a6; v11 != i; ++i)
    {
      v14 = (void *)objc_msgSend(a5, "objectAtIndex:", i);
      v15 = v14;
      memset(&v24, 0, sizeof(v24));
      if (v14)
        objc_msgSend(v14, "timeRange");
      range = v24;
      memset(&v23, 0, sizeof(v23));
      v16 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v16;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&v23, &range, &otherRange);
      if ((v23.start.flags & 1) == 0
        || (v23.duration.flags & 1) == 0
        || v23.duration.epoch
        || v23.duration.value < 0
        || (range.start = v23.duration,
            *(_OWORD *)&otherRange.start.value = *(_OWORD *)v12,
            otherRange.start.epoch = *(_QWORD *)(v12 + 16),
            CMTimeCompare(&range.start, &otherRange.start)))
      {
        v17 = (id)objc_msgSend((id)objc_msgSend(v15, "items"), "mutableCopy");
        objc_msgSend(v17, "addObject:", a3);
        objc_msgSend(v15, "setItems:", v17);
        a6 = i;
      }
      else
      {
        memset(&otherRange, 0, 24);
        v18 = *(_OWORD *)&a4->var0.var3;
        *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0.var0;
        *(_OWORD *)&range.start.epoch = v18;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a4->var1.var1;
        CMTimeRangeGetEnd(&otherRange.start, &range);
        *(_OWORD *)&range.start.value = *(_OWORD *)&v24.start.value;
        range.start.epoch = v24.start.epoch;
        start = otherRange.start;
        if (CMTimeCompare(&range.start, &start) < 1)
          a6 = i;
        *(_OWORD *)&range.start.value = *(_OWORD *)&v24.start.value;
        range.start.epoch = v24.start.epoch;
        start = otherRange.start;
        if ((CMTimeCompare(&range.start, &start) & 0x80000000) == 0)
          return a6;
      }
    }
  }
  return a6;
}

- (NSArray)chapterMetadataGroupsWithTitleLocale:(NSLocale *)locale containingItemsWithCommonKeys:(NSArray *)commonKeys
{
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = -[NSLocale localeIdentifier](locale, "localeIdentifier");
  return (NSArray *)-[AVAsset _chapterMetadataGroupsBestMatchingPreferredLanguages:containingItemsWithCommonKeys:](self, "_chapterMetadataGroupsBestMatchingPreferredLanguages:containingItemsWithCommonKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1), commonKeys);
}

- (NSArray)availableChapterLocales
{
  -[AVAsset _loadChapterInfo](self, "_loadChapterInfo");
  return self->_asset->availableChapterLocales;
}

- (id)_localizedMediaSelectionOptionDisplayNames
{
  return (id)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "_localizedMediaSelectionOptionDisplayNames");
}

- (id)_chapterMetadataGroupsWithTitleLanguage:(id)a3 containingItemsWithCommonKeys:(id)a4
{
  void *v7;
  void *v8;
  id result;
  id v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  AVTimedMetadataGroup *v24;
  AVTimedMetadataGroup *v25;
  id obj;
  void *v27;
  CMTimeEpoch v28;
  __int128 v29;
  CMTimeEpoch v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CMTimeRange start;
  CMTime duration;
  CMTimeRange v39;
  CMTime v40;
  CMTime v41;
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
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[AVAsset _loadChapterInfo](self, "_loadChapterInfo");
  v7 = (void *)objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "figChapterGroupInfo");
  v8 = (void *)objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "figChapters");
  if (objc_msgSend(v7, "count"))
  {
    result = -[AVAsset _chapterMetadataGroupsWithFigChapterGroups:titleLanguage:containingItemsWithCommonKeys:](self, "_chapterMetadataGroupsWithFigChapterGroups:titleLanguage:containingItemsWithCommonKeys:", v7, a3, a4);
  }
  else
  {
    result = (id)objc_msgSend(v8, "count");
    if (result)
    {
      if (objc_msgSend(-[AVAsset _availableCanonicalizedChapterLanguages](self, "_availableCanonicalizedChapterLanguages"), "containsObject:", a3))
      {
        v10 = -[AVAsset _absoluteURL](self, "_absoluteURL");
        v11 = -[AVAsset referenceRestrictions](self, "referenceRestrictions");
        v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v36 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v36)
        {
          v12 = 2 * (v11 & 0xFu);
          v34 = *MEMORY[0x1E0CC4018];
          v35 = *(_QWORD *)v47;
          v32 = *MEMORY[0x1E0CC4008];
          v33 = *MEMORY[0x1E0CC4020];
          v31 = *MEMORY[0x1E0CA2E68];
          v30 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
          v29 = *MEMORY[0x1E0CA2E10];
          v28 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
          obj = v8;
          do
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v47 != v35)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              v15 = (void *)objc_msgSend(v14, "objectForKey:", v34);
              v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v43;
                do
                {
                  for (j = 0; j != v18; ++j)
                  {
                    if (*(_QWORD *)v43 != v19)
                      objc_enumerationMutation(v15);
                    v21 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:containerURL:securityOptions:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:containerURL:securityOptions:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j), v10, v12);
                    if (v21)
                      objc_msgSend(v16, "addObject:", v21);
                  }
                  v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
                }
                while (v18);
              }
              *(_OWORD *)&v41.value = v31;
              v41.epoch = v30;
              *(_OWORD *)&v40.value = v29;
              v40.epoch = v28;
              v22 = (const __CFDictionary *)objc_msgSend(v14, "objectForKey:", v33);
              if (v22)
                CMTimeMakeFromDictionary(&v41, v22);
              v23 = (const __CFDictionary *)objc_msgSend(v14, "objectForKey:", v32);
              if (v23)
                CMTimeMakeFromDictionary(&v40, v23);
              memset(&v39, 0, sizeof(v39));
              start.start = v41;
              duration = v40;
              CMTimeRangeMake(&v39, &start.start, &duration);
              v24 = [AVTimedMetadataGroup alloc];
              start = v39;
              v25 = -[AVTimedMetadataGroup initWithItems:timeRange:](v24, "initWithItems:timeRange:", v16, &start);
              if (v25)
                objc_msgSend(v27, "addObject:", v25);
            }
            v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          }
          while (v36);
        }
        result = (id)objc_msgSend(v27, "copy");
      }
      else
      {
        result = 0;
      }
    }
  }
  if (!result)
    return (id)MEMORY[0x1E0C9AA60];
  return result;
}

uint64_t __53__AVAsset_AVAssetChapterInspection___loadChapterInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ISO639_1FromISO639_2T;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  BOOL v45;
  BOOL v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t result;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id obj;
  id obja;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v1 = a1;
  v96 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_assetInspectorLoader"), "figChapterGroupInfo");
  v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "_assetInspectorLoader"), "figChapters");
  v68 = v1;
  if (objc_msgSend(v2, "count"))
  {
    v58 = v3;
    v69 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    if (!v4)
      goto LABEL_22;
    v5 = v4;
    v66 = *(_QWORD *)v88;
    v6 = *MEMORY[0x1E0CC4000];
    v7 = *MEMORY[0x1E0CC3FF0];
    v8 = *MEMORY[0x1E0CC3FE8];
    v9 = *MEMORY[0x1E0CC4720];
    v60 = *MEMORY[0x1E0CC3FF8];
    obj = v2;
    v64 = *MEMORY[0x1E0CC4728];
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v88 != v66)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(v11, "valueForKey:", v6);
        v13 = objc_msgSend(v11, "valueForKey:", v7);
        v14 = objc_msgSend(v11, "valueForKey:", v8);
        if (!v14)
        {
          ISO639_1FromISO639_2T = FigMetadataGetISO639_1FromISO639_2T();
          if (ISO639_1FromISO639_2T)
            v14 = ISO639_1FromISO639_2T;
          else
            v14 = v13;
        }
        if (objc_msgSend(v12, "isEqualToString:", v9))
          v16 = (void *)objc_msgSend(v11, "valueForKey:", v60);
        else
          v16 = 0;
        v17 = *(_QWORD *)(*(_QWORD *)(v68 + 32) + 8);
        v19 = *(_QWORD *)(v17 + 32);
        v18 = (_QWORD *)(v17 + 32);
        if (v19)
        {
          if (!objc_msgSend(v12, "isEqualToString:", v64))
            goto LABEL_18;
          v18 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v68 + 32) + 8) + 32);
        }
        *v18 = v12;
LABEL_18:
        v20 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v12, CFSTR("AVChapterGroupTypeKey"), v13, CFSTR("AVChapterGroupLanguageCodeKey"), v14, CFSTR("AVChapterGroupExtendedLanguageTagKey"), 0);
        if (objc_msgSend(v16, "count"))
          objc_msgSend(v20, "setObject:forKey:", v16, CFSTR("AVChapterGroupPerChapterInfoKey"));
        objc_msgSend(v69, "addObject:", v20);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
      if (!v5)
      {
LABEL_22:
        v1 = v68;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v68 + 32) + 8) + 24) = objc_msgSend(v69, "copy");
        v3 = v58;
        break;
      }
    }
  }
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24);
  if (v22)
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v84 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          if (objc_msgSend((id)objc_msgSend(v27, "valueForKey:", CFSTR("AVChapterGroupTypeKey")), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 32)))
          {
            v28 = objc_msgSend(v27, "valueForKey:", CFSTR("AVChapterGroupExtendedLanguageTagKey"));
            if (v28)
            {
              v29 = v28;
              if ((objc_msgSend(v21, "containsObject:", v28) & 1) == 0)
                objc_msgSend(v21, "addObject:", v29);
            }
            v30 = objc_msgSend(v27, "valueForKey:", CFSTR("AVChapterGroupLanguageCodeKey"));
            v1 = v68;
            if (v30)
            {
              v31 = v30;
              if ((objc_msgSend(v21, "containsObject:", v30) & 1) == 0)
                objc_msgSend(v21, "addObject:", v31);
            }
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
      }
      while (v24);
    }
    goto LABEL_72;
  }
  if (!objc_msgSend(v3, "count"))
    goto LABEL_72;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v59 = v3;
  v65 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
  if (v65)
  {
    obja = *(id *)v80;
    v61 = *MEMORY[0x1E0CC4018];
    v32 = *MEMORY[0x1E0CC4798];
    v33 = *MEMORY[0x1E0CC47B8];
    v34 = *MEMORY[0x1E0CC47C0];
    do
    {
      v35 = 0;
      do
      {
        if (*(id *)v80 != obja)
          objc_enumerationMutation(v59);
        v67 = v35;
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v35), "objectForKey:", v61);
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v70 = v36;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v76;
          do
          {
            for (k = 0; k != v38; ++k)
            {
              if (*(_QWORD *)v76 != v39)
                objc_enumerationMutation(v70);
              v41 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
              v42 = (void *)objc_msgSend(v41, "objectForKey:", v32);
              v43 = objc_msgSend(v41, "objectForKey:", v33);
              v44 = (void *)objc_msgSend(v41, "objectForKey:", v34);
              if (v42)
                v45 = 1;
              else
                v45 = v44 == 0;
              if (!v45)
                v42 = (void *)objc_msgSend(v44, "localeIdentifier");
              if (v43)
                v46 = 1;
              else
                v46 = v42 == 0;
              if (v46)
              {
                if (!v42)
                  goto LABEL_63;
              }
              else
              {
                v43 = AVLanguageCodeFromExtendedLanguageTag(v42);
              }
              if ((objc_msgSend(v21, "containsObject:", v42) & 1) == 0)
                objc_msgSend(v21, "addObject:", v42);
LABEL_63:
              if (v43 && (objc_msgSend(v21, "containsObject:", v43) & 1) == 0)
                objc_msgSend(v21, "addObject:", v43);
            }
            v38 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
          }
          while (v38);
        }
        v35 = v67 + 1;
      }
      while (v67 + 1 != v65);
      v65 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
    }
    while (v65);
  }
  v1 = v68;
  if (!objc_msgSend(v21, "count"))
    objc_msgSend(v21, "addObject:", CFSTR("und"));
LABEL_72:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 40) = objc_msgSend(v21, "copy");
  v47 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v49 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v72;
    do
    {
      for (m = 0; m != v50; ++m)
      {
        if (*(_QWORD *)v72 != v51)
          objc_enumerationMutation(v21);
        v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * m));
        if (v53)
        {
          v54 = v53;
          if ((objc_msgSend(v47, "containsObject:", v53) & 1) == 0)
          {
            v55 = objc_msgSend(v54, "localeIdentifier");
            if (v55)
            {
              v56 = v55;
              if ((objc_msgSend(v48, "containsObject:", v55) & 1) == 0)
                objc_msgSend(v48, "addObject:", v56);
            }
            objc_msgSend(v47, "addObject:", v54);
          }
        }
      }
      v50 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
    }
    while (v50);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v68 + 32) + 8) + 48) = objc_msgSend(v48, "copy");
  result = objc_msgSend(v47, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v68 + 32) + 8) + 56) = result;
  return result;
}

- (id)_chapterMetadataGroupsBestMatchingPreferredLanguages:(id)a3 containingItemsWithCommonKeys:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id result;
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
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(a3);
        v12 = objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        if (v12)
          objc_msgSend(v7, "addObject:", v12);
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }
  -[AVAsset _availableCanonicalizedChapterLanguages](self, "_availableCanonicalizedChapterLanguages");
  v13 = (id)FigCopyRankedLanguagesAccordingToPreferredLanguages();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (!v14)
    return (id)MEMORY[0x1E0C9AA60];
  v15 = v14;
  v16 = *(_QWORD *)v21;
  v17 = (void *)MEMORY[0x1E0C9AA60];
LABEL_12:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v21 != v16)
      objc_enumerationMutation(v13);
    result = -[AVAsset _chapterMetadataGroupsWithTitleLanguage:containingItemsWithCommonKeys:](self, "_chapterMetadataGroupsWithTitleLanguage:containingItemsWithCommonKeys:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18), a4);
    if (result)
      return result;
    if (v15 == ++v18)
    {
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v15)
        goto LABEL_12;
      return v17;
    }
  }
}

- (id)_availableCanonicalizedChapterLanguages
{
  -[AVAsset _loadChapterInfo](self, "_loadChapterInfo");
  return self->_asset->availableCanonicalizedChapterLanguages;
}

- (void)_loadChapterInfo
{
  AVDispatchOnce *loadChapterInfoOnce;
  _QWORD v3[5];

  loadChapterInfoOnce = self->_asset->loadChapterInfoOnce;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__AVAsset_AVAssetChapterInspection___loadChapterInfo__block_invoke;
  v3[3] = &unk_1E302FA10;
  v3[4] = self;
  -[AVDispatchOnce runBlockOnce:](loadChapterInfoOnce, "runBlockOnce:", v3);
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  return (NSArray *)-[AVAsset tracksWithMediaCharacteristics:](self, "tracksWithMediaCharacteristics:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", mediaCharacteristic));
}

- (BOOL)isCompatibleWithAirPlayVideo
{
  return objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "isCompatibleWithAirPlayVideo");
}

- (NSArray)commonMetadata
{
  return (NSArray *)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "commonMetadata");
}

- (BOOL)isProxy
{
  return 0;
}

- (float)preferredSoundCheckVolumeNormalization
{
  float result;

  objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "preferredSoundCheckVolumeNormalization");
  return result;
}

- (AVDisplayCriteria)preferredDisplayCriteria
{
  return (AVDisplayCriteria *)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "preferredDisplayCriteria");
}

- (NSArray)metadata
{
  NSArray *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[AVAsset availableMetadataFormats](self, "availableMetadataFormats");
  v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", -[AVAsset metadataForFormat:](self, "metadataForFormat:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

- (NSArray)metadataForFormat:(AVMetadataFormat)format
{
  NSArray *v5;

  v5 = (NSArray *)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "metadataForFormat:", format);
  if (+[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace](AVMetadataItem, "_clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace")&& -[NSString isEqualToString:](format, "isEqualToString:", CFSTR("com.apple.quicktime.udta")))
  {
    return -[NSArray arrayByAddingObjectsFromArray:](v5, "arrayByAddingObjectsFromArray:", +[AVMetadataItem _replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:](AVMetadataItem, "_replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:", objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "metadataForFormat:", CFSTR("org.mp4ra"))));
  }
  else
  {
    return v5;
  }
}

- (BOOL)isPlayable
{
  return objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "isPlayable");
}

- (void)dealloc
{
  AVAssetInternal *asset;
  objc_super v4;

  asset = self->_asset;
  if (asset)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVAsset;
  -[AVAsset dealloc](&v4, sel_dealloc);
}

+ (AVAsset)assetWithURL:(id)a3 figPlaybackItem:(OpaqueFigPlaybackItem *)a4 trackIDs:(id)a5 dynamicBehavior:(BOOL)a6
{
  AVPlaybackItemInspectorLoader *v7;
  id v8;
  BOOL v9;

  v7 = -[AVPlaybackItemInspectorLoader initWithURL:playbackItem:trackIDs:dynamicBehavior:]([AVPlaybackItemInspectorLoader alloc], "initWithURL:playbackItem:trackIDs:dynamicBehavior:", a3, a4, a5, a6);
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("AVURLAssetInspectorLoaderKey"), 0);
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
    return 0;
  else
    return (AVAsset *)+[AVURLAsset URLAssetWithURL:options:](AVURLAsset, "URLAssetWithURL:options:", a3, v8);
}

- (AVAsset)initWithURL:(id)a3 options:(id)a4
{

  return 0;
}

+ (AVAsset)assetWithData:(id)a3 contentType:(id)a4 options:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;

  if (!a4)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = "contentType != nil";
    goto LABEL_8;
  }
  if (!objc_msgSend(a3, "length"))
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = "[data length] > 0";
LABEL_8:
    v17 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, (uint64_t)a5, v5, v6, v7, (uint64_t)v16), 0);
    objc_exception_throw(v17);
  }
  if ((id)objc_opt_class() == a1)
    a1 = (id)objc_opt_class();
  return (AVAsset *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithData:contentType:options:", a3, a4, a5);
}

- (AVAsset)initWithData:(id)a3 contentType:(id)a4 options:(id)a5
{

  return 0;
}

- (void)_setLoggingIdentifier:(id)a3
{

  self->_asset->loggingIdentifier = (AVLoggingIdentifier *)a3;
}

- (id)_assetInspector
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)_assetInspectorLoader
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)_comparisonToken
{
  id result;

  result = -[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader");
  if (!result)
  {
    result = -[AVAsset _assetInspector](self, "_assetInspector");
    if (!result)
      return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
  }
  return result;
}

- (int64_t)statusOfValueForKey:(id)a3
{
  return -[AVAsset statusOfValueForKey:error:](self, "statusOfValueForKey:error:", a3, 0);
}

- (void)_loadValuesSynchronouslyForKeys:(id)a3 trackKeys:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[5];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  if (a4)
  {
    v10 = CFSTR("tracks");
    v11[0] = a4;
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  }
  else
  {
    v8 = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__AVAsset__loadValuesSynchronouslyForKeys_trackKeys___block_invoke;
  v9[3] = &unk_1E302FA10;
  v9[4] = v7;
  -[AVAsset loadValuesAsynchronouslyForKeys:keysForCollectionKeys:completionHandler:](self, "loadValuesAsynchronouslyForKeys:keysForCollectionKeys:completionHandler:", a3, v8, v9);
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
}

void __53__AVAsset__loadValuesSynchronouslyForKeys_trackKeys___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 keysForCollectionKeys:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "loadValuesAsynchronouslyForKeys:keysForCollectionKeys:completionHandler:", a3, a4, a5);
}

- (void)cancelLoading
{
  objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "cancelLoading");
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return (OpaqueFigPlaybackItem *)objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_playbackItem");
}

- (Class)_classForTrackInspectors
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)_absoluteURL
{
  return 0;
}

- (BOOL)_doNotLogURLs
{
  return 0;
}

- (OpaqueFigMutableComposition)_mutableComposition
{
  return 0;
}

- (double)_fragmentMindingInterval
{
  double result;

  if (!-[AVAsset _mindsFragments](self, "_mindsFragments"))
    return 0.0;
  objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_fragmentMindingInterval");
  return result;
}

- (BOOL)_mindsFragments
{
  return 0;
}

- (BOOL)_needsLegacyChangeNotifications
{
  return 0;
}

- (void)_setFragmentMindingInterval:(double)a3
{
  if (-[AVAsset _mindsFragments](self, "_mindsFragments"))
    objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_setFragmentMindingInterval:", a3);
}

- (void)_setIsAssociatedWithFragmentMinder:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[AVAsset _mindsFragments](self, "_mindsFragments"))
    objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_setIsAssociatedWithFragmentMinder:", v3);
}

- (float)preferredRate
{
  float result;

  objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "preferredRate");
  return result;
}

- (float)preferredVolume
{
  float result;

  objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "preferredVolume");
  return result;
}

- (CGAffineTransform)preferredTransform
{
  CGAffineTransform *result;

  result = -[AVAsset _assetInspector](self, "_assetInspector");
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform preferredTransform](result, "preferredTransform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (CGSize)maximumVideoResolution
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "maximumVideoResolution");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)availableVideoDynamicRanges
{
  id result;

  result = (id)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "availableVideoDynamicRanges");
  if (!result)
    return (id)MEMORY[0x1E0C9AA60];
  return result;
}

- (CMTime)minimumTimeOffsetFromLive
{
  CMTime *result;

  result = -[AVAsset _assetInspector](self, "_assetInspector");
  if (result)
    return (CMTime *)-[CMTime minimumTimeOffsetFromLive](result, "minimumTimeOffsetFromLive");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CGSize)naturalSize
{
  NSArray *v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_ensureAllDependenciesOfKeyAreLoaded:", CFSTR("naturalSize"));
  v3 = -[AVAsset tracksWithMediaType:](self, "tracksWithMediaType:", CFSTR("vide"));
  if (-[NSArray count](v3, "count"))
  {
    objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "naturalSize");
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (int)naturalTimeScale
{
  return objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "naturalTimeScale");
}

- (BOOL)providesPreciseDurationAndTiming
{
  return objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "providesPreciseDurationAndTiming");
}

- (AVAssetReferenceRestrictions)referenceRestrictions
{
  return 0;
}

- (NSArray)trackGroups
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[AVAsset alternateTrackGroups](self, "alternateTrackGroups");
  v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        -[NSArray addObject:](v4, "addObject:", -[AVAssetTrackGroup initWithAsset:trackIDs:]([AVAssetTrackGroup alloc], "initWithAsset:trackIDs:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)_firstTrackGroupWithMediaTypes:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[AVAsset trackGroups](self, "trackGroups", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v14;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
    v11 = (void *)objc_msgSend(v10, "trackIDs");
    if (objc_msgSend(v11, "count"))
    {
      if ((objc_msgSend(a3, "containsObject:", -[AVAssetTrack mediaType](-[AVAsset trackWithTrackID:](self, "trackWithTrackID:", objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "intValue")), "mediaType")) & 1) != 0)return v10;
    }
    if (v7 == ++v9)
    {
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)audioAlternatesTrackGroup
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("soun");
  return -[AVAsset _firstTrackGroupWithMediaTypes:](self, "_firstTrackGroupWithMediaTypes:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1));
}

- (id)subtitleAlternatesTrackGroup
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("sbtl");
  v3[1] = CFSTR("text");
  v3[2] = CFSTR("clcp");
  return -[AVAsset _firstTrackGroupWithMediaTypes:](self, "_firstTrackGroupWithMediaTypes:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3));
}

- (id)alternateTrackGroups
{
  return (id)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "alternateTrackGroups");
}

- (void)loadMediaSelectionGroupForMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic completionHandler:(void *)completionHandler
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__AVAsset_loadMediaSelectionGroupForMediaCharacteristic_completionHandler___block_invoke;
  v4[3] = &unk_1E3030E88;
  v4[4] = self;
  v4[5] = mediaCharacteristic;
  v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), (uint64_t)v4);
}

uint64_t __75__AVAsset_loadMediaSelectionGroupForMediaCharacteristic_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaSelectionGroupForMediaCharacteristic:", *(_QWORD *)(a1 + 40));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v3();
}

- (id)mediaSelectionGroupForPropertyList:(id)a3 mediaSelectionOption:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  AVMediaSelectionGroup *v19;
  uint64_t v21;
  id *v22;
  AVAsset *v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = -[AVAsset _mediaSelectionGroupDictionaries](self, "_mediaSelectionGroupDictionaries");
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v22 = a4;
  v23 = self;
  v25 = *(_QWORD *)v27;
  v9 = *MEMORY[0x1E0CC5E98];
  v10 = *MEMORY[0x1E0CC5E88];
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v27 != v25)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      v13 = (void *)objc_msgSend(v12, "objectForKey:", v9, v22);
      v14 = objc_msgSend(a3, "objectForKey:", v9);
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          v14 = 0;
      }
      v15 = (void *)objc_msgSend(v12, "objectForKey:", v10);
      v16 = objc_msgSend(a3, "objectForKey:", v10);
      if (v13)
        v17 = v14 == 0;
      else
        v17 = 1;
      if (v17 || (objc_msgSend(v13, "isEqualToString:", v14) & 1) == 0)
      {
        v18 = !v15 || v16 == 0;
        if (v18 || !objc_msgSend(v15, "isEqual:", v16))
          continue;
      }
      v19 = +[AVMediaSelectionGroup mediaSelectionGroupWithAsset:dictionary:](AVMediaSelectionGroup, "mediaSelectionGroupWithAsset:dictionary:", v23, v12);
      if (v19)
      {
        if (+[AVMediaSelectionOption _plistHasOptionIdentifier:](AVMediaSelectionOption, "_plistHasOptionIdentifier:", a3))
        {
          v21 = -[AVMediaSelectionGroup mediaSelectionOptionWithPropertyListMatchToMediaSelectionArray:](v19, "mediaSelectionOptionWithPropertyListMatchToMediaSelectionArray:", a3);
          if (!v21)
            v19 = 0;
        }
        else
        {
          v21 = 0;
        }
        if (v22)
          *v22 = (id)v21;
      }
      return v19;
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    v19 = 0;
    if (v8)
      continue;
    break;
  }
  return v19;
}

- (AVMediaSelection)preferredMediaSelection
{
  return (AVMediaSelection *)-[AVMediaSelection _initWithAsset:]([AVMediaSelection alloc], "_initWithAsset:", self);
}

- (NSArray)allMediaSelections
{
  void *v3;
  AVMediaSelection *v4;
  uint64_t v5;
  AVMediaSelectionGroup *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *obj;
  uint64_t v16;
  AVAsset *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[AVAsset preferredMediaSelection](self, "preferredMediaSelection");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = self;
  obj = -[AVAsset availableMediaCharacteristicsWithMediaSelectionOptions](self, "availableMediaCharacteristicsWithMediaSelectionOptions");
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v6 = -[AVAsset mediaSelectionGroupForMediaCharacteristic:](v17, "mediaSelectionGroupForMediaCharacteristic:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v5));
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v7 = -[AVMediaSelectionGroup options](v6, "options");
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v20;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v20 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
              v13 = (void *)-[AVMediaSelection mutableCopy](v4, "mutableCopy");
              objc_msgSend(v13, "selectMediaOption:inMediaSelectionGroup:", v12, v6);
              objc_msgSend(v3, "addObject:", v13);

              ++v11;
            }
            while (v9 != v11);
            v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v9);
        }
        ++v5;
      }
      while (v5 != v18);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }
  return (NSArray *)(id)objc_msgSend(v3, "copy");
}

- (id)trackReferences
{
  return (id)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "trackReferences");
}

- (AVMetadataItem)creationDate
{
  return (AVMetadataItem *)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "creationDate");
}

- (NSString)lyrics
{
  return (NSString *)objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "lyrics");
}

- (void)loadMetadataForFormat:(AVMetadataFormat)format completionHandler:(void *)completionHandler
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__AVAsset_loadMetadataForFormat_completionHandler___block_invoke;
  v4[3] = &unk_1E3030E88;
  v4[4] = self;
  v4[5] = format;
  v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("availableMetadataFormats"), (uint64_t)v4);
}

uint64_t __51__AVAsset_loadMetadataForFormat_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "metadataForFormat:", *(_QWORD *)(a1 + 40));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v3();
}

- (id)_ID3Metadata
{
  return (id)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "metadataForFormat:", CFSTR("AVMetadataFormatTypedID3Metadata"));
}

- (NSArray)tracks
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (void)loadTrackWithTrackID:(CMPersistentTrackID)trackID completionHandler:(void *)completionHandler
{
  _QWORD v4[6];
  CMPersistentTrackID v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__AVAsset_loadTrackWithTrackID_completionHandler___block_invoke;
  v4[3] = &unk_1E3030EB0;
  v5 = trackID;
  v4[4] = self;
  v4[5] = completionHandler;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("tracks"), (uint64_t)v4);
}

uint64_t __50__AVAsset_loadTrackWithTrackID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "trackWithTrackID:", *(unsigned int *)(a1 + 48));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v3();
}

- (void)loadTracksWithMediaType:(AVMediaType)mediaType completionHandler:(void *)completionHandler
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__AVAsset_loadTracksWithMediaType_completionHandler___block_invoke;
  v4[3] = &unk_1E3030E88;
  v4[4] = self;
  v4[5] = mediaType;
  v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("tracks"), (uint64_t)v4);
}

uint64_t __53__AVAsset_loadTracksWithMediaType_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "tracksWithMediaType:", *(_QWORD *)(a1 + 40));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v3();
}

- (void)loadTracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic completionHandler:(void *)completionHandler
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__AVAsset_loadTracksWithMediaCharacteristic_completionHandler___block_invoke;
  v4[3] = &unk_1E3030E88;
  v4[4] = self;
  v4[5] = mediaCharacteristic;
  v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("tracks"), (uint64_t)v4);
}

uint64_t __63__AVAsset_loadTracksWithMediaCharacteristic_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "tracksWithMediaCharacteristic:", *(_QWORD *)(a1 + 40));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v3();
}

- (id)compatibleTrackForCompositionTrack:(id)a3
{
  NSArray *v3;

  if (a3
    && (v3 = -[AVAsset tracksWithMediaType:](self, "tracksWithMediaType:", objc_msgSend(a3, "mediaType")),
        -[NSArray count](v3, "count")))
  {
    return -[NSArray objectAtIndex:](v3, "objectAtIndex:", 0);
  }
  else
  {
    return 0;
  }
}

- (void)findCompatibleTrackForCompositionTrack:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__AVAsset_findCompatibleTrackForCompositionTrack_completionHandler___block_invoke;
  v4[3] = &unk_1E3030E88;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("tracks"), (uint64_t)v4);
}

uint64_t __68__AVAsset_findCompatibleTrackForCompositionTrack_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "compatibleTrackForCompositionTrack:", *(_QWORD *)(a1 + 40));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v3();
}

- (BOOL)_requiresInProcessOperation
{
  return 0;
}

- (void)_serverHasDied
{
  objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "_serverHasDied");
}

- (BOOL)isExportable
{
  return objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "isExportable");
}

- (BOOL)isReadable
{
  return objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "isReadable");
}

- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3
{
  return objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "isCompatibleWithPhotosTranscodingServiceWithOptions:", a3);
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  return objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "isCompatibleWithSavedPhotosAlbum");
}

- (BOOL)canContainFragments
{
  return objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "canContainFragments");
}

- (BOOL)containsFragments
{
  return objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "containsFragments");
}

- (CMTime)overallDurationHint
{
  CMTime *result;

  result = -[AVAsset _assetInspector](self, "_assetInspector");
  if (result)
    return (CMTime *)-[CMTime overallDurationHint](result, "overallDurationHint");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (BOOL)_hasResourceLoaderDelegate
{
  return 0;
}

- (BOOL)supportsAnalysisReporting
{
  return objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "supportsAnalysisReporting");
}

- (id)_assetAnalysisMessages
{
  return (id)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "_assetAnalysisMessages");
}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

- (int64_t)moovAtomSize
{
  return objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "_moovAtomSize");
}

- (id)availableChapterLanguages
{
  -[AVAsset _loadChapterInfo](self, "_loadChapterInfo");
  return self->_asset->availableChapterLanguages;
}

- (NSArray)chapterMetadataGroupsBestMatchingPreferredLanguages:(NSArray *)preferredLanguages
{
  return (NSArray *)-[AVAsset _chapterMetadataGroupsBestMatchingPreferredLanguages:containingItemsWithCommonKeys:](self, "_chapterMetadataGroupsBestMatchingPreferredLanguages:containingItemsWithCommonKeys:", preferredLanguages, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("artwork")));
}

- (void)loadChapterMetadataGroupsBestMatchingPreferredLanguages:(NSArray *)preferredLanguages completionHandler:(void *)completionHandler
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __111__AVAsset_AVAssetChapterInspection__loadChapterMetadataGroupsBestMatchingPreferredLanguages_completionHandler___block_invoke;
  v4[3] = &unk_1E3030E88;
  v4[4] = self;
  v4[5] = preferredLanguages;
  v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("availableChapterLocales"), (uint64_t)v4);
}

uint64_t __111__AVAsset_AVAssetChapterInspection__loadChapterMetadataGroupsBestMatchingPreferredLanguages_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "chapterMetadataGroupsBestMatchingPreferredLanguages:", *(_QWORD *)(a1 + 40));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v3();
}

- (void)loadChapterMetadataGroupsWithTitleLocale:(NSLocale *)locale containingItemsWithCommonKeys:(NSArray *)commonKeys completionHandler:(void *)completionHandler
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __126__AVAsset_AVAssetChapterInspection__loadChapterMetadataGroupsWithTitleLocale_containingItemsWithCommonKeys_completionHandler___block_invoke;
  v5[3] = &unk_1E3030ED8;
  v5[4] = self;
  v5[5] = locale;
  v5[6] = commonKeys;
  v5[7] = completionHandler;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("availableChapterLocales"), (uint64_t)v5);
}

uint64_t __126__AVAsset_AVAssetChapterInspection__loadChapterMetadataGroupsWithTitleLocale_containingItemsWithCommonKeys_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "chapterMetadataGroupsWithTitleLocale:containingItemsWithCommonKeys:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  return v3();
}

- (id)_chapterTracks
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  AVAssetTrack *v8;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_msgSend(-[AVAsset trackReferences](self, "trackReferences"), "objectForKey:", CFSTR("chap"));
  v5 = objc_msgSend(v4, "count");
  if (v5 >= 2)
  {
    v6 = v5 >> 1;
    v7 = 1;
    do
    {
      v8 = -[AVAsset trackWithTrackID:](self, "trackWithTrackID:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v7), "intValue"));
      if (v8)
        objc_msgSend(v3, "addObject:", v8);
      v7 += 2;
      --v6;
    }
    while (v6);
  }
  return v3;
}

- (BOOL)isDefunct
{
  return objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "_isDefunct");
}

- (NSArray)fragments
{
  return (NSArray *)-[AVFragmentedAssetsArray initWithCount:firstSequenceNumber:]([AVFragmentedAssetsArray alloc], "initWithCount:firstSequenceNumber:", objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "fragmentCount"), objc_msgSend(-[AVAsset _assetInspectorLoader](self, "_assetInspectorLoader"), "firstFragmentSequenceNumber"));
}

- (CMPersistentTrackID)unusedTrackID
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = -[AVAsset tracks](self, "tracks");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((int)objc_msgSend(v8, "trackID") > v5)
          v5 = objc_msgSend(v8, "trackID");
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  return v5 + 2;
}

- (void)findUnusedTrackIDWithCompletionHandler:(void *)completionHandler
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82__AVAsset_AVAssetVideoCompositionUtility__findUnusedTrackIDWithCompletionHandler___block_invoke;
  v3[3] = &unk_1E3032758;
  v3[4] = self;
  v3[5] = completionHandler;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("tracks"), (uint64_t)v3);
}

uint64_t __82__AVAsset_AVAssetVideoCompositionUtility__findUnusedTrackIDWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "unusedTrackID");
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v3();
}

+ (id)assetProxyWithPropertyList:(id)a3
{
  return +[AVAssetProxy assetProxyWithPropertyList:](AVAssetProxy, "assetProxyWithPropertyList:", a3);
}

- (id)propertyListForProxy
{
  return (id)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "propertyListForProxy");
}

- (id)makePropertyListForProxyWithOptions:(id)a3
{
  return (id)objc_msgSend(-[AVAsset _assetInspector](self, "_assetInspector"), "makePropertyListForProxyWithOptions:", a3);
}

+ (id)inspectionOnlyAssetWithFigAsset:(OpaqueFigAsset *)a3
{
  return -[AVStreamDataInspectionOnlyAsset initWithFigAsset:]([AVStreamDataInspectionOnlyAsset alloc], "initWithFigAsset:", a3);
}

+ (id)inspectionOnlyAssetWithStreamDataParser:(id)a3 tracks:(id)a4
{
  return -[AVStreamDataAsset initWithParser:tracks:]([AVStreamDataAsset alloc], "initWithParser:tracks:", a3, a4);
}

@end
