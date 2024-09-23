@implementation AVAssetWriterInputUnknownHelper

- (AVAssetWriterInputUnknownHelper)initWithConfigurationState:(id)a3
{
  AVAssetWriterInputUnknownHelper *v5;
  AVAssetWriterInputUnknownHelper *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  AVAssetWriterInputUnknownHelper *v16;
  AVAssetWriterInputUnknownHelper *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AVAssetWriterInputUnknownHelper;
  v5 = -[AVAssetWriterInputHelper initWithConfigurationState:](&v19, sel_initWithConfigurationState_);
  if (!objc_msgSend(a3, "mediaType"))
  {
    v7 = v5;
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "mediaType != nil";
    goto LABEL_8;
  }
  if (!objc_msgSend(a3, "metadataItems"))
  {
    v16 = v5;
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "[configurationState metadataItems] != nil";
    goto LABEL_8;
  }
  if (!objc_msgSend(a3, "trackReferences"))
  {
    v17 = v5;
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "[configurationState trackReferences] != nil";
LABEL_8:
    v18 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v8, v9, v10, v11, v12, (uint64_t)v15), 0);
    objc_exception_throw(v18);
  }
  return v5;
}

- (AVAssetWriterInputUnknownHelper)initWithMediaType:(id)a3 outputSettings:(id)a4 sourceFormatHint:(opaqueCMFormatDescription *)a5
{
  AVAssetWriterInputConfigurationState *v9;
  __int128 v10;
  int v11;
  double v12;
  const __CFString *v13;
  AVAssetWriterInputUnknownHelper *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v9 = objc_alloc_init(AVAssetWriterInputConfigurationState);
  -[AVAssetWriterInputConfigurationState setMediaType:](v9, "setMediaType:", a3);
  -[AVAssetWriterInputConfigurationState setOutputSettings:](v9, "setOutputSettings:", a4);
  -[AVAssetWriterInputConfigurationState setSourceFormatHint:](v9, "setSourceFormatHint:", a5);
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v16 = *MEMORY[0x1E0C9BAA8];
  v17 = v10;
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[AVAssetWriterInputConfigurationState setTransform:](v9, "setTransform:", &v16);
  -[AVAssetWriterInputConfigurationState setMetadataItems:](v9, "setMetadataItems:", objc_msgSend(MEMORY[0x1E0C99D20], "array"));
  -[AVAssetWriterInputConfigurationState setExpectsMediaDataInRealTime:](v9, "setExpectsMediaDataInRealTime:", 0);
  -[AVAssetWriterInputConfigurationState setNaturalSize:](v9, "setNaturalSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[AVAssetWriterInputConfigurationState setMarksOutputTrackAsEnabled:](v9, "setMarksOutputTrackAsEnabled:", 1);
  v11 = objc_msgSend(a3, "isEqualToString:", CFSTR("soun"));
  LODWORD(v12) = 0;
  if (v11)
    *(float *)&v12 = 1.0;
  -[AVAssetWriterInputConfigurationState setPreferredVolume:](v9, "setPreferredVolume:", v12);
  -[AVAssetWriterInputConfigurationState setLayer:](v9, "setLayer:", objc_msgSend(a3, "isEqualToString:", CFSTR("clcp")) << 63 >> 63);
  -[AVAssetWriterInputConfigurationState setAlternateGroupID:](v9, "setAlternateGroupID:", 0);
  -[AVAssetWriterInputConfigurationState setProvisionalAlternateGroupID:](v9, "setProvisionalAlternateGroupID:", 0);
  -[AVAssetWriterInputConfigurationState setTrackReferences:](v9, "setTrackReferences:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionary"));
  v16 = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)&v17 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[AVAssetWriterInputConfigurationState setPreferredMediaChunkDuration:](v9, "setPreferredMediaChunkDuration:", &v16);
  -[AVAssetWriterInputConfigurationState setPreferredMediaChunkAlignment:](v9, "setPreferredMediaChunkAlignment:", (int)FigGetCFPreferenceNumberWithDefault());
  -[AVAssetWriterInputConfigurationState setPreferredMediaChunkSize:](v9, "setPreferredMediaChunkSize:", 0);
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("meta")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("auxv")))
  {
    v13 = CFSTR("AVAssetWriterInputMediaDataLocationSparselyInterleavedWithMainMediaData");
  }
  else
  {
    v13 = CFSTR("AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData");
  }
  -[AVAssetWriterInputConfigurationState setMediaDataLocation:](v9, "setMediaDataLocation:", v13);
  -[AVAssetWriterInputConfigurationState setMaximizePowerEfficiency:](v9, "setMaximizePowerEfficiency:", 0);
  v14 = -[AVAssetWriterInputUnknownHelper initWithConfigurationState:](self, "initWithConfigurationState:", v9);

  return v14;
}

- (int64_t)status
{
  return 0;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  AVAssetWriterInputConfigurationState *v4;
  __int128 v5;
  _OWORD v6[3];

  v4 = -[AVAssetWriterInputHelper configurationState](self, "configurationState");
  v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  -[AVAssetWriterInputConfigurationState setTransform:](v4, "setTransform:", v6);
}

- (void)setMetadata:(id)a3
{
  -[AVAssetWriterInputConfigurationState setMetadataItems:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setMetadataItems:", a3);
}

- (void)setMediaTimeScale:(int)a3
{
  uint64_t v3;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v6 = -[NSString isEqualToString:](-[AVAssetWriterInputHelper mediaType](self, "mediaType"), "isEqualToString:", CFSTR("soun"));
  if ((_DWORD)v3 && v6)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = (objc_class *)objc_opt_class();
    v15 = (void *)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, AVMethodExceptionReasonWithClassAndSelector(v9, a2, (uint64_t)CFSTR("Cannot set a non-default media time scale on an asset writer input with media type AVMediaTypeAudio"), v10, v11, v12, v13, v14, v16), 0);
    objc_exception_throw(v15);
  }
  -[AVAssetWriterInputConfigurationState setMediaTimeScale:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setMediaTimeScale:", v3);
}

- (void)setExpectsMediaDataInRealTime:(BOOL)a3
{
  -[AVAssetWriterInputConfigurationState setExpectsMediaDataInRealTime:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setExpectsMediaDataInRealTime:", a3);
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
  -[AVAssetWriterInputConfigurationState setMaximizePowerEfficiency:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setMaximizePowerEfficiency:", a3);
}

- (void)setNaturalSize:(CGSize)a3
{
  -[AVAssetWriterInputConfigurationState setNaturalSize:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setNaturalSize:", a3.width, a3.height);
}

- (BOOL)_validateLanguageCode:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", a3);
  v4 = (void *)objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997E8]);
  return objc_msgSend(v4, "length") == 2 || objc_msgSend(v4, "length") == 3;
}

- (void)setLanguageCode:(id)a3
{
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (a3
    && objc_msgSend(a3, "length")
    && !-[AVAssetWriterInputUnknownHelper _validateLanguageCode:](self, "_validateLanguageCode:", a3))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = (objc_class *)objc_opt_class();
    v14 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(v8, a2, (uint64_t)CFSTR("languageCode %@ does not conform to the ISO 639-2/T language code"), v9, v10, v11, v12, v13, (uint64_t)a3), 0);
    objc_exception_throw(v14);
  }
  -[AVAssetWriterInputConfigurationState setLanguageCode:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setLanguageCode:", a3);
}

- (void)setExtendedLanguageTag:(id)a3
{
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (a3
    && objc_msgSend(a3, "length")
    && !-[AVAssetWriterInputUnknownHelper _validateLanguageCode:](self, "_validateLanguageCode:", a3))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = (objc_class *)objc_opt_class();
    v14 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithClassAndSelector(v8, a2, (uint64_t)CFSTR("extendedLanguageTag %@ does not conform to the IETF BCP 47 (RFC 4646) language identifier"), v9, v10, v11, v12, v13, (uint64_t)a3), 0);
    objc_exception_throw(v14);
  }
  -[AVAssetWriterInputConfigurationState setExtendedLanguageTag:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setExtendedLanguageTag:", a3);
}

- (void)setMarksOutputTrackAsEnabled:(BOOL)a3
{
  -[AVAssetWriterInputConfigurationState setMarksOutputTrackAsEnabled:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setMarksOutputTrackAsEnabled:", a3);
}

- (void)setPreferredVolume:(float)a3
{
  AVAssetWriterInputConfigurationState *v4;
  double v5;

  v4 = -[AVAssetWriterInputHelper configurationState](self, "configurationState");
  *(float *)&v5 = a3;
  -[AVAssetWriterInputConfigurationState setPreferredVolume:](v4, "setPreferredVolume:", v5);
}

- (void)setLayer:(int64_t)a3
{
  -[AVAssetWriterInputConfigurationState setLayer:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setLayer:", a3);
}

- (void)setAlternateGroupID:(signed __int16)a3
{
  -[AVAssetWriterInputConfigurationState setAlternateGroupID:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setAlternateGroupID:", a3);
}

- (void)setProvisionalAlternateGroupID:(signed __int16)a3
{
  -[AVAssetWriterInputConfigurationState setProvisionalAlternateGroupID:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setProvisionalAlternateGroupID:", a3);
}

- (void)setPerformsMultiPassEncodingIfSupported:(BOOL)a3
{
  -[AVAssetWriterInputConfigurationState setPerformsMultiPassEncodingIfSupported:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setPerformsMultiPassEncodingIfSupported:", a3);
}

+ (id)keyPathsForValuesAffectingCanPerformMultiplePasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("performsMultiPassEncodingIfSupported"));
}

- (void)setSourcePixelBufferAttributes:(id)a3
{
  -[AVAssetWriterInputConfigurationState setSourcePixelBufferAttributes:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setSourcePixelBufferAttributes:", a3);
}

- (void)setPreferredMediaChunkDuration:(id *)a3
{
  AVAssetWriterInputConfigurationState *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v4 = -[AVAssetWriterInputHelper configurationState](self, "configurationState");
  v5 = *a3;
  -[AVAssetWriterInputConfigurationState setPreferredMediaChunkDuration:](v4, "setPreferredMediaChunkDuration:", &v5);
}

- (void)setPreferredMediaChunkAlignment:(int64_t)a3
{
  -[AVAssetWriterInputConfigurationState setPreferredMediaChunkAlignment:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setPreferredMediaChunkAlignment:", a3);
}

- (void)setPreferredMediaChunkSize:(int64_t)a3
{
  -[AVAssetWriterInputConfigurationState setPreferredMediaChunkSize:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setPreferredMediaChunkSize:", a3);
}

- (void)setMediaDataLocation:(id)a3
{
  -[AVAssetWriterInputConfigurationState setMediaDataLocation:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setMediaDataLocation:", a3);
}

- (void)setSampleReferenceBaseURL:(id)a3
{
  -[AVAssetWriterInputConfigurationState setSampleReferenceBaseURL:](-[AVAssetWriterInputHelper configurationState](self, "configurationState"), "setSampleReferenceBaseURL:", a3);
}

- (BOOL)_canAddTrackAssociationWithTrackOfInput:(id)a3 type:(id)a4 exceptionReason:(id *)a5
{
  NSString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  int v13;
  void *v14;
  int v15;
  BOOL v16;
  uint64_t v18;

  if (!objc_msgSend(a4, "isEqualToString:", CFSTR("forc")))
  {
    if (objc_msgSend(a4, "isEqualToString:", CFSTR("folw"))
      && (!-[NSString isEqualToString:](-[AVAssetWriterInputHelper mediaType](self, "mediaType"), "isEqualToString:", CFSTR("soun"))|| (objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", CFSTR("sbtl")) & 1) == 0))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = CFSTR("Associations of type AVTrackAssociationTypeSelectionFollower are supported only between AVMediaTypeAudio and AVMediaTypeSubtitle tracks.");
      goto LABEL_26;
    }
    if (objc_msgSend(a4, "isEqualToString:", CFSTR("chap")))
    {
      if (-[NSString isEqualToString:](-[AVAssetWriterInputHelper mediaType](self, "mediaType"), "isEqualToString:", CFSTR("vide")))
      {
        v13 = 0;
      }
      else
      {
        v13 = !-[NSString isEqualToString:](-[AVAssetWriterInputHelper mediaType](self, "mediaType"), "isEqualToString:", CFSTR("soun"));
      }
      if ((objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", CFSTR("vide")) & 1) != 0
        || (objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", CFSTR("text")) & 1) != 0)
      {
        v15 = 0;
      }
      else
      {
        v15 = objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", CFSTR("meta")) ^ 1;
      }
      if ((v13 | v15) == 1)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = CFSTR("Associations of type AVTrackAssociationTypeChapterList are supported only between (AVMediaTypeVideo/AVMediaTypeAudio) and (AVMediaTypeVideo/AVMediaTypeMetadata/AVMediaTypeText) tracks.");
        goto LABEL_26;
      }
    }
    else
    {
      if (objc_msgSend(a4, "isEqualToString:", CFSTR("cdsc"))
        && !-[NSString isEqualToString:](-[AVAssetWriterInputHelper mediaType](self, "mediaType"), "isEqualToString:", CFSTR("meta")))
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = CFSTR("Associations of type AVTrackAssociationTypeMetadataReferent are supported only between tracks of mediaType AVMediaTypeMetadata and other tracks.");
        goto LABEL_26;
      }
      if (objc_msgSend(a4, "length") != 4)
      {
        v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("trackAssociationType %@ must be 4 characters long."), a4);
        goto LABEL_27;
      }
    }
LABEL_30:
    v14 = 0;
    v16 = 1;
    if (!a5)
      return v16;
    goto LABEL_28;
  }
  v9 = -[AVAssetWriterInputHelper mediaType](self, "mediaType");
  v10 = (void *)objc_msgSend(a3, "mediaType");
  if ((-[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("sbtl"))
     || -[NSString isEqualToString:](v9, "isEqualToString:", CFSTR("text")))
    && ((objc_msgSend(v10, "isEqualToString:", CFSTR("sbtl")) & 1) != 0
     || (objc_msgSend(v10, "isEqualToString:", CFSTR("text")) & 1) != 0))
  {
    goto LABEL_30;
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = CFSTR("Associations of type AVTrackAssociationTypeForcedSubtitlesOnly are supported only between tracks with media type AVMediaTypeSubtitle or AVMediaTypeText.");
LABEL_26:
  v14 = (void *)objc_msgSend(v11, "stringWithFormat:", v12, v18);
LABEL_27:
  v16 = 0;
  if (a5)
LABEL_28:
    *a5 = v14;
  return v16;
}

- (BOOL)canAddTrackAssociationWithTrackOfInput:(id)a3 type:(id)a4
{
  return -[AVAssetWriterInputUnknownHelper _canAddTrackAssociationWithTrackOfInput:type:exceptionReason:](self, "_canAddTrackAssociationWithTrackOfInput:type:exceptionReason:", a3, a4, 0);
}

- (void)addTrackAssociationWithTrackOfInput:(id)a3 type:(id)a4
{
  AVAssetWriterInputConfigurationState *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v22 = 0;
  if (!-[AVAssetWriterInputUnknownHelper _canAddTrackAssociationWithTrackOfInput:type:exceptionReason:](self, "_canAddTrackAssociationWithTrackOfInput:type:exceptionReason:", a3, a4, &v22))
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = (objc_class *)objc_opt_class();
    v20 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithClassAndSelector(v14, a2, v22, v15, v16, v17, v18, v19, v21), 0);
    objc_exception_throw(v20);
  }
  v8 = -[AVAssetWriterInputHelper configurationState](self, "configurationState");
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[AVAssetWriterInputConfigurationState trackReferences](v8, "trackReferences"));
  v10 = objc_msgSend(v9, "objectForKey:", a4);
  if (v10)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v10);
    objc_msgSend(v11, "addObject:", a3);
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
  }
  objc_msgSend(v9, "setObject:forKey:", v11, a4);
  -[AVAssetWriterInputConfigurationState setTrackReferences:](v8, "setTrackReferences:", v9);
}

- (BOOL)canStartRespondingToEachPassDescriptionReturningReason:(id *)a3
{
  if (a3)
    *a3 = CFSTR("cannot be called before attaching to an instance of AVAssetWriter and calling -startWriting on this attached asset writer");
  return 0;
}

@end
