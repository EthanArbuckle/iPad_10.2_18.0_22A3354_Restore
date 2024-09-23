@implementation AVTrackReaderInspector

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  uint64_t v6;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t *, int *);
  void (*v12)(uint64_t, int64_t, uint64_t *, int *, int *);
  int v14;
  uint64_t v15;
  objc_super v16;
  int v17;

  v6 = *(_QWORD *)&a4;
  v17 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AVTrackReaderInspector;
  v8 = -[AVAssetTrackInspector _initWithAsset:trackID:trackIndex:](&v16, sel__initWithAsset_trackID_trackIndex_);
  if (v8)
  {
    if (a3)
    {
      v15 = 0;
      v14 = 0;
      v9 = objc_msgSend(a3, "_copyFormatReader");
      v8[4] = v9;
      if (v9)
      {
        v10 = v9;
        if ((_DWORD)v6)
        {
          v11 = *(void (**)(uint64_t, uint64_t, uint64_t *, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 56);
          if (v11)
            v11(v10, v6, &v15, &v14);
        }
        else if ((a5 & 0x8000000000000000) == 0)
        {
          v12 = *(void (**)(uint64_t, int64_t, uint64_t *, int *, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 48);
          if (v12)
            v12(v10, a5, &v15, &v14, &v17);
        }
      }
      if (!v15)
        goto LABEL_14;
      v8[5] = v15;
      v8[6] = objc_alloc_init(AVDispatchOnce);
      *((_DWORD *)v8 + 17) = v17;
      *((_DWORD *)v8 + 18) = v14;
      *((_BYTE *)v8 + 88) = objc_msgSend(a3, "_prefersNominalDurations");
      v8[10] = (id)objc_msgSend(a3, "_weakReference");
    }
    if (!v8[5])
    {
LABEL_14:

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  OpaqueFigFormatReader *formatReader;
  OpaqueFigTrackReader *trackReader;
  OpaqueFigSampleCursorService *figSampleCursorService;
  objc_super v6;

  formatReader = self->_formatReader;
  if (formatReader)
    CFRelease(formatReader);
  trackReader = self->_trackReader;
  if (trackReader)
    CFRelease(trackReader);

  figSampleCursorService = self->_figSampleCursorService;
  if (figSampleCursorService)
    CFRelease(figSampleCursorService);
  v6.receiver = self;
  v6.super_class = (Class)AVTrackReaderInspector;
  -[AVAssetTrackInspector dealloc](&v6, sel_dealloc);
}

- (id)asset
{
  return -[AVWeakReference referencedObject](self->_weakReferenceToAsset, "referencedObject");
}

- (int)trackID
{
  return self->_trackID;
}

- (unsigned)_figMediaType
{
  return self->_mediaType;
}

- (id)mediaType
{
  int v2;

  v2 = bswap32(self->_mediaType);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), (char)v2, ((__int16)v2 >> 8), (v2 << 8 >> 24), (v2 >> 24));
}

- (OpaqueFigTrackReader)_figTrackReader
{
  return self->_trackReader;
}

- (OpaqueFigFormatReader)_figFormatReader
{
  return self->_formatReader;
}

- (OpaqueFigSampleCursorService)_getFigSampleCursorServiceReportingTimeAccuracy:(BOOL *)a3
{
  AVDispatchOnce *copySampleCursorServiceOnce;
  _QWORD v7[5];

  copySampleCursorServiceOnce = self->_copySampleCursorServiceOnce;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__AVTrackReaderInspector__getFigSampleCursorServiceReportingTimeAccuracy___block_invoke;
  v7[3] = &unk_1E302FA10;
  v7[4] = self;
  -[AVDispatchOnce runBlockOnce:](copySampleCursorServiceOnce, "runBlockOnce:", v7);
  if (a3)
    *a3 = self->_sampleCursorTimeAccuracyIsExact;
  return self->_figSampleCursorService;
}

void __74__AVTrackReaderInspector__getFigSampleCursorServiceReportingTimeAccuracy___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void (*v4)(uint64_t, uint64_t);
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, _QWORD, const void **);
  const void *v7;
  const void *v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 40);
  if (v2)
  {
    v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v4)
      v4(v2, v1 + 56);
    v8 = 0;
    FigBaseObject = FigFormatReaderGetFigBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, _QWORD, const void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v6)
    {
      v6(FigBaseObject, *MEMORY[0x1E0CC4318], *MEMORY[0x1E0C9AE00], &v8);
      v7 = v8;
    }
    else
    {
      v7 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = v7 == (const void *)*MEMORY[0x1E0C9AE50];
    if (v7)
      CFRelease(v7);
  }
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  void *result;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, __CFString *, _QWORD, void **);
  void *v7;

  v7 = 0;
  result = -[AVTrackReaderInspector _figTrackReader](self, "_figTrackReader");
  if (result)
  {
    FigBaseObject = FigTrackReaderGetFigBaseObject();
    v6 = *(void (**)(uint64_t, __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v6)
    {
      v6(FigBaseObject, a3, *MEMORY[0x1E0C9AE00], &v7);
      return v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)formatDescriptions
{
  return -[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC6190]);
}

- (BOOL)isEnabled
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC6150]) != 0;
}

- (BOOL)isSelfContained
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC6228]) != 0;
}

- (BOOL)isPlayable
{
  return -[AVTrackReaderInspector playabilityValidationResult](self, "playabilityValidationResult") == 0;
}

- (int)playabilityValidationResult
{
  if (+[AVURLAsset _avfValidationPlist](AVURLAsset, "_avfValidationPlist")
    && -[AVTrackReaderInspector _figTrackReader](self, "_figTrackReader"))
  {
    return FigMediaValidatorValidateIndividualTrack();
  }
  else
  {
    return -50;
  }
}

- (BOOL)isDecodable
{
  return -[AVTrackReaderInspector decodabilityValidationResult](self, "decodabilityValidationResult") == 0;
}

- (int)decodabilityValidationResult
{
  if (+[AVURLAsset _avfValidationPlist](AVURLAsset, "_avfValidationPlist")
    && -[AVTrackReaderInspector _figTrackReader](self, "_figTrackReader"))
  {
    return FigMediaValidatorValidateIndividualTrackForDecoding();
  }
  else
  {
    return -50;
  }
}

- (int64_t)totalSampleDataLength
{
  return -[AVFigObjectInspector _longLongForProperty:](self, "_longLongForProperty:", *MEMORY[0x1E0CC6248]);
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  id v4;
  $1CE2C3FC342086196D07C2B4E8C70800 *result;
  char *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  __int128 v11;
  void *v12;
  CMTimeRange v13;
  CMTime lhs;
  CMTime duration;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CMTimeRange v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v4 = -[AVTrackReaderInspector segments](self, "segments");
  result = ($1CE2C3FC342086196D07C2B4E8C70800 *)objc_msgSend(v4, "count");
  v6 = (char *)&result[-1].var1.var3 + 7;
  if (result == ($1CE2C3FC342086196D07C2B4E8C70800 *)1)
  {
    result = ($1CE2C3FC342086196D07C2B4E8C70800 *)objc_msgSend(v4, "objectAtIndex:", 0);
    if (result)
    {
      result = ($1CE2C3FC342086196D07C2B4E8C70800 *)-[$1CE2C3FC342086196D07C2B4E8C70800 timeMapping](result, "timeMapping");
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
    }
    v11 = v30;
    *(_OWORD *)&retstr->var0.var0 = v29;
    *(_OWORD *)&retstr->var0.var3 = v11;
    v9 = v31;
    goto LABEL_10;
  }
  if (!result)
  {
    v7 = MEMORY[0x1E0CA2E40];
    v8 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&retstr->var0.var3 = v8;
    v9 = *(_OWORD *)(v7 + 32);
LABEL_10:
    *(_OWORD *)&retstr->var1.var1 = v9;
    return result;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (void *)objc_msgSend(v4, "objectAtIndex:", 0);
  if (v10)
  {
    objc_msgSend(v10, "timeMapping");
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
  }
  v18 = 0u;
  memset(&v19, 0, sizeof(v19));
  v16 = 0u;
  v17 = 0u;
  v12 = (void *)objc_msgSend(v4, "objectAtIndex:", v6);
  if (v12)
  {
    objc_msgSend(v12, "timeMapping");
  }
  else
  {
    v18 = 0u;
    memset(&v19, 0, sizeof(v19));
    v16 = 0u;
    v17 = 0u;
  }
  v13 = v19;
  CMTimeRangeGetEnd(&lhs, &v13);
  *(_OWORD *)&v13.start.value = v23;
  v13.start.epoch = v24;
  CMTimeSubtract(&duration, &lhs, &v13.start);
  *(_OWORD *)&v13.start.value = v23;
  v13.start.epoch = v24;
  return ($1CE2C3FC342086196D07C2B4E8C70800 *)CMTimeRangeMake((CMTimeRange *)retstr, &v13.start, &duration);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)uneditedDuration
{
  if (self)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE _timeForProperty:](self, "_timeForProperty:", *MEMORY[0x1E0CC6240]);
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return self;
}

- (BOOL)requiresFrameReordering
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC6198]) != 0;
}

- (BOOL)hasAudioSampleDependencies
{
  objc_super v4;

  if (objc_msgSend(-[AVTrackReaderInspector mediaType](self, "mediaType"), "isEqualToString:", CFSTR("soun")))return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC61A0]) != 0;
  v4.receiver = self;
  v4.super_class = (Class)AVTrackReaderInspector;
  return -[AVAssetTrackInspector hasAudioSampleDependencies](&v4, sel_hasAudioSampleDependencies);
}

- (int)naturalTimeScale
{
  return -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC6238]);
}

- (float)estimatedDataRate
{
  float v2;

  -[AVFigObjectInspector _floatForProperty:](self, "_floatForProperty:", *MEMORY[0x1E0CC6168]);
  return v2 * 8.0;
}

- (float)peakDataRate
{
  float v2;

  -[AVFigObjectInspector _floatForProperty:](self, "_floatForProperty:", *MEMORY[0x1E0CC6210]);
  return v2 * 8.0;
}

- (id)languageCode
{
  return -[AVFigObjectInspector _stringForProperty:](self, "_stringForProperty:", *MEMORY[0x1E0CC61B8]);
}

- (id)mediaCharacteristics
{
  return AVSynthesizeAVMediaCharacteristicsFromFigValues(-[AVFigObjectInspector _arrayForProperty:](self, "_arrayForProperty:", *MEMORY[0x1E0CC6028]), -[AVTrackReaderInspector _figMediaType](self, "_figMediaType"));
}

- (id)extendedLanguageTag
{
  return -[AVFigObjectInspector _stringForProperty:](self, "_stringForProperty:", *MEMORY[0x1E0CC6180]);
}

- (CGSize)naturalSize
{
  double v3;
  double v4;
  CGSize result;

  -[AVFigObjectInspector _sizeForProperty:defaultValue:](self, "_sizeForProperty:defaultValue:", *MEMORY[0x1E0CC6118], -1.0, -1.0);
  if (v3 == -1.0 && v4 == -1.0)
    -[AVFigObjectInspector _sizeForProperty:](self, "_sizeForProperty:", *MEMORY[0x1E0CC6130]);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)dimensions
{
  double v2;
  double v3;
  CGSize result;

  -[AVFigObjectInspector _sizeForProperty:](self, "_sizeForProperty:", *MEMORY[0x1E0CC6130]);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  if (self)
    return (CGAffineTransform *)-[CGAffineTransform _affineTransformForProperty:](self, "_affineTransformForProperty:", *MEMORY[0x1E0CC61E8]);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (int64_t)layer
{
  return -[AVFigObjectInspector _SInt16ForProperty:](self, "_SInt16ForProperty:", *MEMORY[0x1E0CC61D8]);
}

- (float)preferredVolume
{
  double v3;
  float result;
  objc_super v5;

  if (objc_msgSend(-[AVTrackReaderInspector mediaType](self, "mediaType"), "isEqualToString:", CFSTR("soun")))
  {
    LODWORD(v3) = 1.0;
    -[AVFigObjectInspector _floatForProperty:defaultValue:](self, "_floatForProperty:defaultValue:", *MEMORY[0x1E0CC6258], v3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AVTrackReaderInspector;
    -[AVAssetTrackInspector preferredVolume](&v5, sel_preferredVolume);
  }
  return result;
}

- (id)loudnessInfo
{
  objc_super v4;

  if (objc_msgSend(-[AVTrackReaderInspector mediaType](self, "mediaType"), "isEqualToString:", CFSTR("soun")))return -[AVFigObjectInspector _dictionaryForProperty:](self, "_dictionaryForProperty:", *MEMORY[0x1E0CC61E0]);
  v4.receiver = self;
  v4.super_class = (Class)AVTrackReaderInspector;
  return -[AVAssetTrackInspector loudnessInfo](&v4, sel_loudnessInfo);
}

- (float)nominalFrameRate
{
  float result;

  -[AVFigObjectInspector _floatForProperty:](self, "_floatForProperty:", *MEMORY[0x1E0CC6208]);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minSampleDuration
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  if (self)
  {
    v3 = *MEMORY[0x1E0CC6040];
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

- (id)_segmentsPreferringNominalDurations:(BOOL)a3
{
  FigTrackReaderCreateSegmentData();
  return -[AVAssetTrackInspector _segmentsForSegmentData:](self, "_segmentsForSegmentData:", 0);
}

- (id)segments
{
  return -[AVTrackReaderInspector _segmentsPreferringNominalDurations:](self, "_segmentsPreferringNominalDurations:", self->_prefersNominalDurations);
}

- (id)segmentsAsPresented
{
  return -[AVTrackReaderInspector _segmentsPreferringNominalDurations:](self, "_segmentsPreferringNominalDurations:", 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latentBaseDecodeTimeStampOfFirstTrackFragment
{
  uint64_t FigBaseObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void (*v6)(uint64_t, _QWORD, _QWORD, CFDictionaryRef *);
  CFDictionaryRef v7;
  CMTime v8;
  CFDictionaryRef dictionaryRepresentation;

  dictionaryRepresentation = 0;
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  FigBaseObject = FigTrackReaderGetFigBaseObject();
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMBaseObjectGetVTable();
  v6 = *(void (**)(uint64_t, _QWORD, _QWORD, CFDictionaryRef *))(*(_QWORD *)&result->var1 + 48);
  if (v6)
  {
    v6(FigBaseObject, *MEMORY[0x1E0CC61C8], *MEMORY[0x1E0C9AE00], &dictionaryRepresentation);
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)dictionaryRepresentation;
    if (dictionaryRepresentation)
    {
      CMTimeMakeFromDictionary(&v8, dictionaryRepresentation);
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&v8.value;
      v7 = dictionaryRepresentation;
      retstr->var3 = v8.epoch;
      CFRelease(v7);
    }
  }
  return result;
}

- (id)commonMetadata
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CFTypeRef cf;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  cf = 0;
  if (self->_trackReader)
  {
    if (!FigMetadataCopyTrackCommonMetadata())
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v4 = (void *)cf;
      v5 = objc_msgSend((id)cf, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v4);
            v9 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
            if (v9)
              objc_msgSend(v3, "addObject:", v9);
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        }
        while (v6);
      }
    }
  }
  if (cf)
    CFRelease(cf);
  return v3;
}

- (id)availableMetadataFormats
{
  OpaqueFigTrackReader *trackReader;
  uint64_t FigBaseObject;
  unsigned int (*v4)(uint64_t, _QWORD, _QWORD, CFArrayRef *);
  uint64_t v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  CFTypeRef cf;
  CFArrayRef theArray;

  trackReader = self->_trackReader;
  cf = 0;
  theArray = 0;
  if (!trackReader)
    goto LABEL_16;
  FigBaseObject = FigTrackReaderGetFigBaseObject();
  v4 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
  if (!v4)
    goto LABEL_19;
  v5 = *MEMORY[0x1E0C9AE00];
  if (v4(FigBaseObject, *MEMORY[0x1E0CC61F8], *MEMORY[0x1E0C9AE00], &theArray))
    goto LABEL_19;
  if (!theArray)
  {
    v9 = 0;
    goto LABEL_22;
  }
  Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    v7 = Count;
    v8 = 0;
    v9 = 0;
    v10 = *MEMORY[0x1E0CC4800];
    do
    {
      CFArrayGetValueAtIndex(theArray, v8);
      v11 = FigMetadataReaderGetFigBaseObject();
      v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 8)
                                                                                  + 48);
      if (v12 && !v12(v11, v10, v5, &cf))
      {
        if (!v9)
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
        objc_msgSend(v9, "addObject:", cf, cf);
      }
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      ++v8;
    }
    while (v7 != v8);
  }
  else
  {
LABEL_16:
    v9 = 0;
  }
  if (objc_msgSend(v9, "count", cf))
    goto LABEL_20;

LABEL_19:
  v9 = 0;
LABEL_20:
  if (theArray)
    CFRelease(theArray);
LABEL_22:
  if (cf)
    CFRelease(cf);
  if (v9)
    return v9;
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)metadataForFormat:(id)a3
{
  void *v3;
  OpaqueFigTrackReader *trackReader;
  uint64_t FigBaseObject;
  unsigned int (*v7)(uint64_t, _QWORD, _QWORD, CFArrayRef *);
  uint64_t v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  uint64_t v12;
  const void *ValueAtIndex;
  uint64_t v14;
  unsigned int (*v15)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  CFTypeRef cf;
  CFArrayRef theArray;

  v3 = 0;
  trackReader = self->_trackReader;
  cf = 0;
  theArray = 0;
  if (a3 && trackReader)
  {
    FigBaseObject = FigTrackReaderGetFigBaseObject();
    v7 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
    if (!v7)
      goto LABEL_14;
    v8 = *MEMORY[0x1E0C9AE00];
    if (v7(FigBaseObject, *MEMORY[0x1E0CC61F8], *MEMORY[0x1E0C9AE00], &theArray))
      goto LABEL_14;
    if (!theArray)
    {
      v3 = 0;
      goto LABEL_17;
    }
    Count = CFArrayGetCount(theArray);
    if (Count < 1)
    {
LABEL_14:
      v3 = 0;
    }
    else
    {
      v10 = Count;
      v11 = 0;
      v12 = *MEMORY[0x1E0CC4800];
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v11);
        v14 = FigMetadataReaderGetFigBaseObject();
        v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 48);
        if (v15)
        {
          if (!v15(v14, v12, v8, &cf) && objc_msgSend(a3, "isEqualToString:", cf))
            break;
        }
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        if (v10 == ++v11)
          goto LABEL_14;
      }
      v3 = (void *)-[AVMetadataEnumerator allObjects](+[AVMetadataEnumerator metadataEnumeratorWithMetadataReader:](AVMetadataEnumerator, "metadataEnumeratorWithMetadataReader:", ValueAtIndex), "allObjects");
    }
  }
  if (theArray)
    CFRelease(theArray);
LABEL_17:
  if (cf)
    CFRelease(cf);
  if (!v3)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return v3;
}

- (int64_t)alternateGroupID
{
  return -[AVFigObjectInspector _SInt16ForProperty:](self, "_SInt16ForProperty:", *MEMORY[0x1E0CC6110]);
}

- (int64_t)defaultAlternateGroupID
{
  return -[AVFigObjectInspector _SInt16ForProperty:](self, "_SInt16ForProperty:", *MEMORY[0x1E0CC6128]);
}

- (int64_t)provisionalAlternateGroupID
{
  return -[AVFigObjectInspector _SInt16ForProperty:](self, "_SInt16ForProperty:", *MEMORY[0x1E0CC6220]);
}

- (BOOL)hasSeamSamples
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC61B0]) != 0;
}

- (id)_trackReferences
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[5];
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(-[AVTrackReaderInspector asset](self, "asset"), "trackReferences");
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = -[AVTrackReaderInspector trackID](self, "trackID");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(v3, "objectForKey:", v9);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __42__AVTrackReaderInspector__trackReferences__block_invoke;
        v14[3] = &unk_1E3034700;
        v15 = v4;
        v14[4] = v10;
        v11 = (void *)objc_msgSend(v10, "indexesOfObjectsPassingTest:", v14);
        if (objc_msgSend(v11, "count"))
          objc_msgSend(v13, "setObject:forKey:", objc_msgSend(v10, "objectsAtIndexes:", v11), v9);
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  return v13;
}

BOOL __42__AVTrackReaderInspector__trackReferences__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  _BOOL8 result;

  result = 0;
  if ((a3 & 1) != 0)
  {
    v3 = *(_DWORD *)(a1 + 40);
    if (v3 == objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3 - 1), "intValue"))
      return 1;
  }
  return result;
}

- (BOOL)isExcludedFromAutoselectionInTrackGroup
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC6170]) != 0;
}

- (BOOL)isEqual:(id)a3
{
  OpaqueFigTrackReader *v5;
  uint64_t v6;
  const void *v7;
  BOOL result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[AVTrackReaderInspector _figTrackReader](self, "_figTrackReader");
  v6 = objc_msgSend(a3, "_figTrackReader");
  if (v5 == (OpaqueFigTrackReader *)v6)
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
  OpaqueFigTrackReader *v3;
  objc_super v5;

  v3 = -[AVTrackReaderInspector _figTrackReader](self, "_figTrackReader");
  if (v3)
    return CFHash(v3);
  v5.receiver = self;
  v5.super_class = (Class)AVTrackReaderInspector;
  return -[AVTrackReaderInspector hash](&v5, sel_hash);
}

@end
