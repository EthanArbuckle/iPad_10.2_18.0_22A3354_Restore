@implementation AVAssetWriterUnknownHelper

- (AVAssetWriterUnknownHelper)initWithConfigurationState:(id)a3
{
  AVAssetWriterUnknownHelper *v5;
  AVAssetWriterUnknownHelper *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  AVAssetWriterUnknownHelper *v16;
  AVAssetWriterUnknownHelper *v17;
  AVAssetWriterUnknownHelper *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AVAssetWriterUnknownHelper;
  v5 = -[AVAssetWriterHelper initWithConfigurationState:](&v20, sel_initWithConfigurationState_);
  if (!objc_msgSend(a3, "mediaFileType"))
  {
    v7 = v5;
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "[configurationState mediaFileType] != nil";
    goto LABEL_10;
  }
  if (!objc_msgSend(a3, "inputs"))
  {
    v16 = v5;
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "[configurationState inputs] != nil";
    goto LABEL_10;
  }
  if (!objc_msgSend(a3, "inputGroups"))
  {
    v17 = v5;
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "[configurationState inputGroups] != nil";
    goto LABEL_10;
  }
  if (!objc_msgSend(a3, "metadataItems"))
  {
    v18 = v5;
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "[configurationState metadataItems] != nil";
LABEL_10:
    v19 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v8, v9, v10, v11, v12, (uint64_t)v15), 0);
    objc_exception_throw(v19);
  }
  return v5;
}

- (AVAssetWriterUnknownHelper)initWithURL:(id)a3 fileType:(id)a4
{
  AVAssetWriterConfigurationState *v7;

  v7 = objc_alloc_init(AVAssetWriterConfigurationState);
  -[AVAssetWriterUnknownHelper setDefaultPropertyValuesToConfigurationState:outputURL:fileType:](self, "setDefaultPropertyValuesToConfigurationState:outputURL:fileType:", v7, a3, a4);
  return -[AVAssetWriterUnknownHelper initWithConfigurationState:](self, "initWithConfigurationState:", v7);
}

- (void)setDefaultPropertyValuesToConfigurationState:(id)a3 outputURL:(id)a4 fileType:(id)a5
{
  uint64_t v7;
  __int128 v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  objc_msgSend(a3, "setURL:", a4);
  objc_msgSend(a3, "setMediaFileType:", a5);
  objc_msgSend(a3, "setInputs:", objc_msgSend(MEMORY[0x1E0C99D20], "array"));
  objc_msgSend(a3, "setInputGroups:", objc_msgSend(MEMORY[0x1E0C99D20], "array"));
  v12 = *MEMORY[0x1E0CA2E18];
  v11 = v12;
  *(_QWORD *)&v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v7 = v13;
  objc_msgSend(a3, "setMovieFragmentInterval:", &v12);
  v12 = v11;
  *(_QWORD *)&v13 = v7;
  objc_msgSend(a3, "setInitialMovieFragmentInterval:", &v12);
  objc_msgSend(a3, "setShouldOptimizeForNetworkUse:", 0);
  objc_msgSend(a3, "setMetadataItems:", objc_msgSend(MEMORY[0x1E0C99D20], "array"));
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v12 = *MEMORY[0x1E0C9BAA8];
  v13 = v8;
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(a3, "setPreferredTransform:", &v12);
  LODWORD(v9) = 1.0;
  objc_msgSend(a3, "setPreferredVolume:", v9);
  LODWORD(v10) = 1.0;
  objc_msgSend(a3, "setPreferredRate:", v10);
  objc_msgSend(a3, "setSinglePassFileSize:", 0);
  objc_msgSend(a3, "setSinglePassMediaDataSize:", 0);
  v12 = v11;
  *(_QWORD *)&v13 = v7;
  objc_msgSend(a3, "setPreferredOutputSegmentInterval:", &v12);
  v12 = v11;
  *(_QWORD *)&v13 = v7;
  objc_msgSend(a3, "setInitialSegmentStartTime:", &v12);
  objc_msgSend(a3, "setOutputFileTypeProfile:", 0);
  objc_msgSend(a3, "setInitialMovieFragmentSequenceNumber:", 1);
  objc_msgSend(a3, "setProducesCombinableFragments:", 0);
  objc_msgSend(a3, "setUsesVirtualCaptureCard:", 0);
  objc_msgSend(a3, "setRequiresInProcessOperation:", 0);
}

- (int64_t)status
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  -[AVAssetWriterConfigurationState setDelegate:](-[AVAssetWriterHelper configurationState](self, "configurationState"), "setDelegate:", a3);
}

- (void)setMovieFragmentInterval:(id *)a3
{
  AVAssetWriterConfigurationState *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v4 = -[AVAssetWriterHelper configurationState](self, "configurationState");
  v5 = *a3;
  -[AVAssetWriterConfigurationState setMovieFragmentInterval:](v4, "setMovieFragmentInterval:", &v5);
}

- (void)setInitialMovieFragmentInterval:(id *)a3
{
  AVAssetWriterConfigurationState *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v4 = -[AVAssetWriterHelper configurationState](self, "configurationState");
  v5 = *a3;
  -[AVAssetWriterConfigurationState setInitialMovieFragmentInterval:](v4, "setInitialMovieFragmentInterval:", &v5);
}

- (void)setOverallDurationHint:(id *)a3
{
  AVAssetWriterConfigurationState *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v4 = -[AVAssetWriterHelper configurationState](self, "configurationState");
  v5 = *a3;
  -[AVAssetWriterConfigurationState setOverallDurationHint:](v4, "setOverallDurationHint:", &v5);
}

- (void)setShouldOptimizeForNetworkUse:(BOOL)a3
{
  -[AVAssetWriterConfigurationState setShouldOptimizeForNetworkUse:](-[AVAssetWriterHelper configurationState](self, "configurationState"), "setShouldOptimizeForNetworkUse:", a3);
}

- (void)setDirectoryForTemporaryFiles:(id)a3
{
  -[AVAssetWriterConfigurationState setDirectoryForTemporaryFiles:](-[AVAssetWriterHelper configurationState](self, "configurationState"), "setDirectoryForTemporaryFiles:", a3);
}

- (void)setMetadata:(id)a3
{
  -[AVAssetWriterConfigurationState setMetadataItems:](-[AVAssetWriterHelper configurationState](self, "configurationState"), "setMetadataItems:", a3);
}

- (void)setMovieTimeScale:(int)a3
{
  -[AVAssetWriterConfigurationState setMovieTimeScale:](-[AVAssetWriterHelper configurationState](self, "configurationState"), "setMovieTimeScale:", *(_QWORD *)&a3);
}

- (void)setPreferredTransform:(CGAffineTransform *)a3
{
  AVAssetWriterConfigurationState *v4;
  __int128 v5;
  _OWORD v6[3];

  v4 = -[AVAssetWriterHelper configurationState](self, "configurationState");
  v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  -[AVAssetWriterConfigurationState setPreferredTransform:](v4, "setPreferredTransform:", v6);
}

- (void)setPreferredVolume:(float)a3
{
  AVAssetWriterConfigurationState *v4;
  double v5;

  v4 = -[AVAssetWriterHelper configurationState](self, "configurationState");
  *(float *)&v5 = a3;
  -[AVAssetWriterConfigurationState setPreferredVolume:](v4, "setPreferredVolume:", v5);
}

- (void)setPreferredRate:(float)a3
{
  AVAssetWriterConfigurationState *v4;
  double v5;

  v4 = -[AVAssetWriterHelper configurationState](self, "configurationState");
  *(float *)&v5 = a3;
  -[AVAssetWriterConfigurationState setPreferredRate:](v4, "setPreferredRate:", v5);
}

- (void)setPreferredOutputSegmentInterval:(id *)a3
{
  AVAssetWriterConfigurationState *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v4 = -[AVAssetWriterHelper configurationState](self, "configurationState");
  v5 = *a3;
  -[AVAssetWriterConfigurationState setPreferredOutputSegmentInterval:](v4, "setPreferredOutputSegmentInterval:", &v5);
}

- (void)setInitialSegmentStartTime:(id *)a3
{
  AVAssetWriterConfigurationState *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v4 = -[AVAssetWriterHelper configurationState](self, "configurationState");
  v5 = *a3;
  -[AVAssetWriterConfigurationState setInitialSegmentStartTime:](v4, "setInitialSegmentStartTime:", &v5);
}

- (void)setOutputFileTypeProfile:(id)a3
{
  -[AVAssetWriterConfigurationState setOutputFileTypeProfile:](-[AVAssetWriterHelper configurationState](self, "configurationState"), "setOutputFileTypeProfile:", a3);
}

- (void)setInitialMovieFragmentSequenceNumber:(int64_t)a3
{
  -[AVAssetWriterConfigurationState setInitialMovieFragmentSequenceNumber:](-[AVAssetWriterHelper configurationState](self, "configurationState"), "setInitialMovieFragmentSequenceNumber:", a3);
}

- (void)setProducesCombinableFragments:(BOOL)a3
{
  -[AVAssetWriterConfigurationState setProducesCombinableFragments:](-[AVAssetWriterHelper configurationState](self, "configurationState"), "setProducesCombinableFragments:", a3);
}

- (void)setUsesVirtualCaptureCard:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  if (!-[AVAssetWriterHelper isVirtualCaptureCardSupported](self, "isVirtualCaptureCardSupported"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99768];
    v8 = (objc_class *)objc_opt_class();
    v14 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(v8, a2, (uint64_t)CFSTR("Cannot use the virtual capture card"), v9, v10, v11, v12, v13, v15), 0);
    objc_exception_throw(v14);
  }
  -[AVAssetWriterConfigurationState setUsesVirtualCaptureCard:](-[AVAssetWriterHelper configurationState](self, "configurationState"), "setUsesVirtualCaptureCard:", v3);
}

- (void)setRequiresInProcessOperation:(BOOL)a3
{
  -[AVAssetWriterConfigurationState setRequiresInProcessOperation:](-[AVAssetWriterHelper configurationState](self, "configurationState"), "setRequiresInProcessOperation:", a3);
}

- (void)setSinglePassFileSize:(int64_t)a3
{
  -[AVAssetWriterConfigurationState setSinglePassFileSize:](-[AVAssetWriterHelper configurationState](self, "configurationState"), "setSinglePassFileSize:", a3);
}

- (void)setSinglePassMediaDataSize:(int64_t)a3
{
  -[AVAssetWriterConfigurationState setSinglePassMediaDataSize:](-[AVAssetWriterHelper configurationState](self, "configurationState"), "setSinglePassMediaDataSize:", a3);
}

- (BOOL)_canAddInput:(id)a3 exceptionReason:(id *)a4
{
  _BOOL4 v7;
  void *v9;

  v9 = 0;
  v7 = -[AVAssetWriterHelper _canApplyOutputSettings:forMediaType:sourceFormat:exceptionReason:](self, "_canApplyOutputSettings:forMediaType:sourceFormat:exceptionReason:", objc_msgSend(a3, "_outputSettingsObject"), objc_msgSend(a3, "mediaType"), objc_msgSend(a3, "sourceFormatHint"), &v9);
  if (v7)
    LOBYTE(v7) = -[AVAssetWriterHelper _canApplyTrackReferences:exceptionReason:](self, "_canApplyTrackReferences:exceptionReason:", objc_msgSend(a3, "_trackReferences"), &v9);
  if (a4)
    *a4 = v9;
  return v7;
}

- (BOOL)canAddInput:(id)a3
{
  return -[AVAssetWriterUnknownHelper _canAddInput:exceptionReason:](self, "_canAddInput:exceptionReason:", a3, 0);
}

- (void)addInput:(id)a3
{
  AVAssetWriterConfigurationState *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v18 = 0;
  if (!-[AVAssetWriterUnknownHelper _canAddInput:exceptionReason:](self, "_canAddInput:exceptionReason:", a3, &v18))
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = (objc_class *)objc_opt_class();
    v16 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithClassAndSelector(v10, a2, v18, v11, v12, v13, v14, v15, v17), 0);
    objc_exception_throw(v16);
  }
  v6 = -[AVAssetWriterHelper configurationState](self, "configurationState");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[AVAssetWriterConfigurationState inputs](v6, "inputs"));
  objc_msgSend(v7, "addObject:", a3);
  -[AVAssetWriterConfigurationState setInputs:](v6, "setInputs:", v7);
  objc_msgSend(a3, "_setWeakReferenceToAssetWriter:", -[AVAssetWriterHelper weakReferenceToAssetWriter](self, "weakReferenceToAssetWriter"));
}

- (BOOL)_canAddInputGroup:(id)a3 exceptionReason:(id *)a4
{
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = -[AVMediaFileType UTI](-[AVAssetWriterHelper mediaFileType](self, "mediaFileType"), "UTI");
  if (!-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.quicktime-movie"))
    && !-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.m4a-audio"))
    && !-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.m4v-video"))
    && !-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("public.3gpp"))
    && !-[NSString isEqualToString:](v7, "isEqualToString:", CFSTR("public.mpeg-4")))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The output file type %@ does not support mutually exclusive relationships among tracks."), v7);
LABEL_23:
    v16 = 0;
    if (a4)
      goto LABEL_18;
    return v16;
  }
  v8 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "inputs"));
  v9 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "provisionalInputs"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = -[AVAssetWriterHelper inputGroups](self, "inputGroups");
  v11 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v11)
  {
    v16 = 1;
    goto LABEL_17;
  }
  v12 = (uint64_t)v11;
  v13 = *(_QWORD *)v22;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v22 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(v15, "inputs")), "intersectsSet:", v8))
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = CFSTR("At least one AVAssetWriterInput in the given inputGroup is also present in an inputGroup already added.");
LABEL_22:
        v11 = (void *)objc_msgSend(v18, "stringWithFormat:", v19, v20);
        goto LABEL_23;
      }
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(v15, "provisionalInputs")), "intersectsSet:", v9))
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = CFSTR("At least one provisional AVAssetWriterInput in the given inputGroup is also present as a provisional input in an inputGroup already added.");
        goto LABEL_22;
      }
    }
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v11 = 0;
    v16 = 1;
    if (v12)
      continue;
    break;
  }
LABEL_17:
  if (a4)
LABEL_18:
    *a4 = v11;
  return v16;
}

- (BOOL)canAddInputGroup:(id)a3
{
  return -[AVAssetWriterUnknownHelper _canAddInputGroup:exceptionReason:](self, "_canAddInputGroup:exceptionReason:", a3, 0);
}

- (void)addInputGroup:(id)a3
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  AVAssetWriterConfigurationState *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  if (!-[AVAssetWriterUnknownHelper _canAddInputGroup:exceptionReason:](self, "_canAddInputGroup:exceptionReason:", a3, &v37))
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = (objc_class *)objc_opt_class();
    v28 = (void *)objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, AVMethodExceptionReasonWithClassAndSelector(v22, a2, v37, v23, v24, v25, v26, v27, v29), 0);
    objc_exception_throw(v28);
  }
  ++self->_alternateGroupID;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = (void *)objc_msgSend(a3, "inputs");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "setMarksOutputTrackAsEnabled:", v11 == (void *)objc_msgSend(a3, "defaultInput"));
        objc_msgSend(v11, "_setAlternateGroupID:", self->_alternateGroupID);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = (void *)objc_msgSend(a3, "provisionalInputs", 0);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(v17, "setMarksOutputTrackAsEnabled:", 0);
        objc_msgSend(v17, "_setProvisionalAlternateGroupID:", self->_alternateGroupID);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v14);
  }
  v18 = -[AVAssetWriterHelper configurationState](self, "configurationState");
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[AVAssetWriterConfigurationState inputGroups](v18, "inputGroups"));
  objc_msgSend(v19, "addObject:", a3);
  -[AVAssetWriterConfigurationState setInputGroups:](v18, "setInputGroups:", v19);
}

- (void)startWriting
{
  id v3;
  AVAssetWriterWritingHelper *v4;
  AVAssetWriterWritingHelper *v5;
  uint64_t v6;

  v6 = 0;
  v3 = -[AVWeakReference referencedObject](-[AVAssetWriterHelper weakReferenceToAssetWriter](self, "weakReferenceToAssetWriter"), "referencedObject");
  if ((!-[AVAssetWriterHelper directoryForTemporaryFiles](self, "directoryForTemporaryFiles")
     || AVCanWriteFilesToDirectoryAtURL(-[AVAssetWriterHelper directoryForTemporaryFiles](self, "directoryForTemporaryFiles"), &v6))&& (v4 = -[AVAssetWriterWritingHelper initWithConfigurationState:assetWriter:error:]([AVAssetWriterWritingHelper alloc], "initWithConfigurationState:assetWriter:error:", -[AVAssetWriterHelper configurationState](self, "configurationState"), v3, &v6)) != 0)
  {
    v5 = v4;
    objc_msgSend(v3, "_setHelper:ifCurrentHelper:", v4, self);
  }
  else
  {
    -[AVAssetWriterHelper transitionToFailedStatusWithError:](self, "transitionToFailedStatusWithError:", v6);
    v5 = 0;
  }

}

- (void)cancelWriting
{
  -[AVAssetWriterHelper _transitionToClientInitiatedTerminalStatus:](self, "_transitionToClientInitiatedTerminalStatus:", 4);
}

- (BOOL)_isDefunct
{
  return 0;
}

@end
