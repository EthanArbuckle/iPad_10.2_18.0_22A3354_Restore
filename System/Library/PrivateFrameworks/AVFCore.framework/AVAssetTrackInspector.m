@implementation AVAssetTrackInspector

- (NSArray)mediaCharacteristics
{
  AVDispatchOnce *synthesizeMediaCharacteristicsOnce;
  _QWORD v5[5];

  synthesizeMediaCharacteristicsOnce = self->_synthesizeMediaCharacteristicsOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVAssetTrackInspector_mediaCharacteristics__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](synthesizeMediaCharacteristicsOnce, "runBlockOnce:", v5);
  return self->_cachedMediaCharacteristics;
}

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  AVAssetTrackInspector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAssetTrackInspector;
  v5 = -[AVAssetTrackInspector init](&v7, sel_init, a3, *(_QWORD *)&a4, a5);
  if (v5)
  {
    v5->_weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v5);
    v5->_synthesizeMediaCharacteristicsOnce = objc_alloc_init(AVDispatchOnce);
  }
  return v5;
}

- (id)_weakReference
{
  return self->_weakReference;
}

- (OpaqueFigAssetTrack)_figAssetTrack
{
  return 0;
}

+ (AVAssetTrackInspector)assetTrackInspectorWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  return (AVAssetTrackInspector *)(id)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "_classForTrackInspectors")), "_initWithAsset:trackID:trackIndex:", a3, *(_QWORD *)&a4, a5);
}

void *__45__AVAssetTrackInspector_mediaCharacteristics__block_invoke(uint64_t a1)
{
  void *result;

  result = AVSynthesizeAVMediaCharacteristicsFromFigValues((void *)objc_msgSend(*(id *)(a1 + 32), "_arrayForProperty:", *MEMORY[0x1E0CC6028]), objc_msgSend(*(id *)(a1 + 32), "_figMediaType"));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  return 2;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetTrackInspector;
  -[AVAssetTrackInspector dealloc](&v3, sel_dealloc);
}

- (id)_initWithAsset:(id)a3 trackID:(int)a4
{
  return -[AVAssetTrackInspector _initWithAsset:trackID:trackIndex:](self, "_initWithAsset:trackID:trackIndex:", a3, *(_QWORD *)&a4, -1);
}

- (id)_initWithAsset:(id)a3 trackIndex:(int64_t)a4
{
  return -[AVAssetTrackInspector _initWithAsset:trackID:trackIndex:](self, "_initWithAsset:trackID:trackIndex:", a3, 0, a4);
}

- (AVAssetTrackInspector)init
{
  return (AVAssetTrackInspector *)-[AVAssetTrackInspector _initWithAsset:trackID:trackIndex:](self, "_initWithAsset:trackID:trackIndex:", 0, 0, -1);
}

- (int)trackID
{
  return 0;
}

- (unsigned)_figMediaType
{
  return 0;
}

- (OpaqueFigTrackReader)_figTrackReader
{
  return 0;
}

- (OpaqueFigFormatReader)_figFormatReader
{
  return 0;
}

- (NSString)mediaType
{
  return 0;
}

- (NSArray)formatDescriptions
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (BOOL)isPlayable
{
  return 1;
}

- (BOOL)isDecodable
{
  return 1;
}

- (int)playabilityValidationResult
{
  return 0;
}

- (BOOL)isEnabled
{
  return 0;
}

- (BOOL)isSelfContained
{
  return 0;
}

- (int64_t)totalSampleDataLength
{
  return 0;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0CA2E40];
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)uneditedDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaPresentationTimeRange
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0CA2E40];
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaDecodeTimeRange
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0CA2E40];
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- (BOOL)requiresFrameReordering
{
  return 0;
}

- (BOOL)hasAudioSampleDependencies
{
  return 0;
}

- (int)naturalTimeScale
{
  return 600;
}

- (float)estimatedDataRate
{
  return 0.0;
}

- (float)peakDataRate
{
  return 0.0;
}

- (NSString)languageCode
{
  return 0;
}

- (NSString)extendedLanguageTag
{
  return 0;
}

- (NSLocale)locale
{
  const __CFString *v3;
  NSString *v4;

  v3 = -[AVAssetTrackInspector extendedLanguageTag](self, "extendedLanguageTag");
  if (v3 || (v4 = -[AVAssetTrackInspector languageCode](self, "languageCode"), (v3 = (const __CFString *)v4) != 0))
    v4 = (NSString *)CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3);
  return (NSLocale *)v4;
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)dimensions
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (int64_t)layer
{
  return 0;
}

- (float)preferredVolume
{
  return 1.0;
}

- (NSDictionary)loudnessInfo
{
  return 0;
}

- (float)nominalFrameRate
{
  return 0.0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minSampleDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (id)_segmentsForSegmentData:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  _OWORD *v6;
  void *v7;
  AVAssetTrackSegment *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v14[6];

  v4 = objc_msgSend(a3, "length");
  if (v4 < 0x60)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = v4 / 0x60;
  v6 = (_OWORD *)objc_msgSend(a3, "bytes");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
  if (v5 <= 1)
    v5 = 1;
  do
  {
    v8 = [AVAssetTrackSegment alloc];
    v9 = v6[1];
    v14[0] = *v6;
    v14[1] = v9;
    v10 = v6[2];
    v11 = v6[3];
    v12 = v6[5];
    v14[4] = v6[4];
    v14[5] = v12;
    v14[2] = v10;
    v14[3] = v11;
    objc_msgSend(v7, "addObject:", -[AVAssetTrackSegment _initWithTimeMapping:](v8, "_initWithTimeMapping:", v14));
    v6 += 6;
    --v5;
  }
  while (v5);
  if (!v7)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return v7;
}

- (NSArray)segments
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (BOOL)segmentsExcludeAudioPrimingAndRemainderDurations
{
  return 0;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)gaplessSourceTimeRange
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0CA2E40];
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- (id)segmentForTrackTime:(id *)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  CMTime v14;
  CMTimeRange range;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CMTime time;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CMTimeRange v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = -[AVAssetTrackInspector segments](self, "segments");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v5)
    goto LABEL_26;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      if (v10)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "timeMapping");
      }
      else
      {
        v22 = 0u;
        memset(&v23, 0, sizeof(v23));
        v20 = 0u;
        v21 = 0u;
      }
      range = v23;
      time = (CMTime)*a3;
      if (CMTimeRangeContainsTime(&range, &time))
        v7 = v10;
    }
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v6);
  if (!v7)
  {
LABEL_26:
    if (-[NSArray count](v4, "count"))
    {
      v17 = 0u;
      v18 = 0u;
      v16 = 0u;
      memset(&range, 0, sizeof(range));
      v11 = -[NSArray firstObject](v4, "firstObject");
      if (v11)
      {
        objc_msgSend(v11, "timeMapping");
      }
      else
      {
        v17 = 0u;
        v18 = 0u;
        v16 = 0u;
        memset(&range, 0, sizeof(range));
      }
      time = (CMTime)*a3;
      *(_OWORD *)&v14.value = v16;
      v14.epoch = v17;
      if (CMTimeCompare(&time, &v14) < 0)
        return -[NSArray firstObject](v4, "firstObject");
      else
        return -[NSArray lastObject](v4, "lastObject");
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)samplePresentationTimeForTrackTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  double Seconds;
  double v8;
  uint64_t v9;
  CMTime v10;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14[2];
  __int128 v15;
  _OWORD v16[2];

  v14[0] = *a4;
  result = -[AVAssetTrackInspector segmentForTrackTime:](self, "segmentForTrackTime:", v14);
  if (!result)
    goto LABEL_14;
  memset(v16, 0, sizeof(v16));
  v15 = 0u;
  memset(v14, 0, sizeof(v14));
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE timeMapping](result, "timeMapping");
  if ((v14[0].var2 & 1) == 0)
    goto LABEL_14;
  if ((v14[1].var2 & 1) == 0)
    goto LABEL_14;
  if (v14[1].var3)
    goto LABEL_14;
  if (v14[1].var0 < 0)
    goto LABEL_14;
  if ((BYTE12(v15) & 1) == 0)
    goto LABEL_14;
  if ((BYTE4(v16[1]) & 1) == 0)
    goto LABEL_14;
  if (*((_QWORD *)&v16[1] + 1))
    goto LABEL_14;
  if ((*((_QWORD *)&v16[0] + 1) & 0x8000000000000000) != 0)
    goto LABEL_14;
  time = *(CMTime *)((char *)v16 + 8);
  Seconds = CMTimeGetSeconds(&time);
  time = (CMTime)v14[1];
  v8 = CMTimeGetSeconds(&time);
  memset(&time, 0, sizeof(time));
  lhs = (CMTime)*a4;
  *(_OWORD *)&rhs.value = v15;
  rhs.epoch = *(_QWORD *)&v16[0];
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeSubtract(&time, &lhs, &rhs);
  if (Seconds <= 0.0)
    goto LABEL_14;
  if ((time.flags & 0x1D) == 1
    && (memset(&lhs, 0, sizeof(lhs)),
        rhs = time,
        result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMultiplyByFloat64(&lhs, &rhs, v8 / Seconds),
        (lhs.flags & 0x1D) == 1))
  {
    rhs = lhs;
    v10 = (CMTime)v14[0];
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &rhs, &v10);
  }
  else
  {
LABEL_14:
    v9 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v9 + 16);
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latentBaseDecodeTimeStampOfFirstTrackFragment
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (NSArray)commonMetadata
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSArray)availableMetadataFormats
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)metadataForFormat:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", a3);
}

- (int64_t)alternateGroupID
{
  return 0;
}

- (int64_t)defaultAlternateGroupID
{
  return 0;
}

- (int64_t)provisionalAlternateGroupID
{
  return 0;
}

- (BOOL)isExcludedFromAutoselectionInTrackGroup
{
  return 0;
}

- (NSDictionary)_trackReferences
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (BOOL)hasProtectedContent
{
  NSArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  CFIndex v7;
  int v8;

  v2 = -[AVAssetTrackInspector formatDescriptions](self, "formatDescriptions");
  if (v2)
  {
    v3 = (const __CFArray *)v2;
    Count = CFArrayGetCount((CFArrayRef)v2);
    if (Count < 1)
    {
      LOBYTE(v2) = 0;
    }
    else
    {
      v5 = Count;
      CFArrayGetValueAtIndex(v3, 0);
      if (FigCPEIsSupportedFormatDescription())
      {
        LOBYTE(v2) = 1;
      }
      else
      {
        v6 = 1;
        do
        {
          v7 = v6;
          if (v5 == v6)
            break;
          CFArrayGetValueAtIndex(v3, v6);
          v8 = FigCPEIsSupportedFormatDescription();
          v6 = v7 + 1;
        }
        while (!v8);
        LOBYTE(v2) = v7 < v5;
      }
    }
  }
  return (char)v2;
}

- (BOOL)hasAudibleBooksContent
{
  return 0;
}

- (BOOL)isAudibleBooksContentAuthorized
{
  return 0;
}

- (BOOL)hasSeamSamples
{
  return 0;
}

- (BOOL)canProvideSampleCursors
{
  return -[AVAssetTrackInspector _getFigSampleCursorServiceReportingTimeAccuracy:](self, "_getFigSampleCursorServiceReportingTimeAccuracy:", 0) != 0;
}

- (id)makeSampleCursorWithPresentationTimeStamp:(id *)a3
{
  OpaqueFigSampleCursorService *v4;
  unsigned int (*v5)(OpaqueFigSampleCursorService *, __int128 *, CFTypeRef *, _QWORD, _QWORD);
  unsigned int (*v6)(OpaqueFigSampleCursorService *, __int128 *, uint64_t, CFTypeRef *, _QWORD, _QWORD);
  __int128 v8;
  int64_t var3;
  char v10;
  CFTypeRef cf;
  __int128 v12;
  int64_t v13;

  cf = 0;
  v10 = 0;
  v4 = -[AVAssetTrackInspector _getFigSampleCursorServiceReportingTimeAccuracy:](self, "_getFigSampleCursorServiceReportingTimeAccuracy:", &v10);
  if (v4)
  {
    if (v10)
    {
      v8 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      v5 = *(unsigned int (**)(OpaqueFigSampleCursorService *, __int128 *, CFTypeRef *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
      if (!v5 || (v12 = v8, v13 = var3, v5(v4, &v12, &cf, 0, 0)))
      {
LABEL_9:
        v4 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      v8 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      v6 = *(unsigned int (**)(OpaqueFigSampleCursorService *, __int128 *, uint64_t, CFTypeRef *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
      if (!v6)
        goto LABEL_9;
      v12 = v8;
      v13 = var3;
      if (v6(v4, &v12, 1, &cf, 0, 0))
        goto LABEL_9;
    }
    v4 = +[AVSampleCursor sampleCursorWithFigSampleCursor:](AVSampleCursor, "sampleCursorWithFigSampleCursor:", cf, v8, var3);
  }
LABEL_10:
  if (cf)
    CFRelease(cf);
  return v4;
}

- (id)makeSampleCursorAtFirstSampleInDecodeOrder
{
  OpaqueFigSampleCursorService *v2;
  uint64_t (*v3)(OpaqueFigSampleCursorService *, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  CFTypeRef cf;

  cf = 0;
  v2 = -[AVAssetTrackInspector _getFigSampleCursorServiceReportingTimeAccuracy:](self, "_getFigSampleCursorServiceReportingTimeAccuracy:", 0);
  if (v2)
  {
    v3 = *(uint64_t (**)(OpaqueFigSampleCursorService *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 24);
    if (!v3)
      return 0;
    v4 = v3(v2, &cf);
    v5 = cf;
    if (v4)
    {
      v2 = 0;
      if (!cf)
        return v2;
      goto LABEL_5;
    }
    v2 = +[AVSampleCursor sampleCursorWithFigSampleCursor:](AVSampleCursor, "sampleCursorWithFigSampleCursor:", cf);
    v5 = cf;
    if (cf)
LABEL_5:
      CFRelease(v5);
  }
  return v2;
}

- (id)makeSampleCursorAtLastSampleInDecodeOrder
{
  OpaqueFigSampleCursorService *v2;
  uint64_t (*v3)(OpaqueFigSampleCursorService *, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  CFTypeRef cf;

  cf = 0;
  v2 = -[AVAssetTrackInspector _getFigSampleCursorServiceReportingTimeAccuracy:](self, "_getFigSampleCursorServiceReportingTimeAccuracy:", 0);
  if (v2)
  {
    v3 = *(uint64_t (**)(OpaqueFigSampleCursorService *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 32);
    if (!v3)
      return 0;
    v4 = v3(v2, &cf);
    v5 = cf;
    if (v4)
    {
      v2 = 0;
      if (!cf)
        return v2;
      goto LABEL_5;
    }
    v2 = +[AVSampleCursor sampleCursorWithFigSampleCursor:](AVSampleCursor, "sampleCursorWithFigSampleCursor:", cf);
    v5 = cf;
    if (cf)
LABEL_5:
      CFRelease(v5);
  }
  return v2;
}

- (OpaqueFigSampleCursorService)_getFigSampleCursorServiceReportingTimeAccuracy:(BOOL *)a3
{
  return 0;
}

- (BOOL)_isDefunct
{
  return 0;
}

@end
