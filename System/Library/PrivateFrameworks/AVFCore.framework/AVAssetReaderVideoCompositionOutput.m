@implementation AVAssetReaderVideoCompositionOutput

+ (AVAssetReaderVideoCompositionOutput)assetReaderVideoCompositionOutputWithVideoTracks:(NSArray *)videoTracks videoSettings:(NSDictionary *)videoSettings
{
  return (AVAssetReaderVideoCompositionOutput *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithVideoTracks:videoSettings:", videoTracks, videoSettings);
}

- (AVAssetReaderVideoCompositionOutput)init
{
  return -[AVAssetReaderVideoCompositionOutput initWithVideoTracks:videoSettings:](self, "initWithVideoTracks:videoSettings:", 0, 0);
}

- (AVAssetReaderVideoCompositionOutput)initWithVideoTracks:(NSArray *)videoTracks videoSettings:(NSDictionary *)videoSettings
{
  AVAssetReaderVideoCompositionOutput *v7;
  AVAssetReaderVideoCompositionOutput *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  AVAssetReaderVideoCompositionOutputInternal *v17;
  AVVideoOutputSettings *videoOutputSettings;
  AVAssetReaderVideoCompositionOutput *v19;
  AVAssetReaderVideoCompositionOutput *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  AVAssetReaderVideoCompositionOutput *v30;
  uint64_t v31;
  AVAssetReaderVideoCompositionOutput *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  AVAssetReaderVideoCompositionOutput *v38;
  AVAssetReaderVideoCompositionOutput *v39;
  objc_class *v40;
  AVAssetReaderVideoCompositionOutput *v41;
  objc_class *v42;
  AVAssetReaderVideoCompositionOutput *v43;
  objc_class *v44;
  AVAssetReaderVideoCompositionOutput *v45;
  NSString *v46;
  const char *v47;
  NSDictionary *v48;
  const __CFString *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)AVAssetReaderVideoCompositionOutput;
  v7 = -[AVAssetReaderOutput init](&v54, sel_init);
  v8 = v7;
  if (!videoTracks)
  {
    v32 = v7;
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v31 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v33, v34, v35, v36, v37, (uint64_t)"videoTracks != nil");
LABEL_30:
    objc_exception_throw((id)objc_msgSend(v27, "exceptionWithName:reason:userInfo:", v28, v31, 0));
  }
  v47 = a2;
  v48 = videoSettings;
  if (!-[NSArray count](videoTracks, "count"))
  {
    v38 = v8;
    v27 = (void *)MEMORY[0x1E0C99DA0];
    v28 = *MEMORY[0x1E0C99778];
    v46 = (NSString *)"[videoTracks count] >= 1";
    v29 = CFSTR("invalid parameter not satisfying: %s");
LABEL_29:
    v31 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, v47, (uint64_t)v29, v22, v23, v24, v25, v26, (uint64_t)v46);
    goto LABEL_30;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](videoTracks, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v51;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v51 != v12)
        objc_enumerationMutation(videoTracks);
      v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
      v15 = (void *)objc_msgSend(v14, "mediaType");
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("vide")) & 1) == 0
        && (objc_msgSend(v15, "isEqualToString:", CFSTR("auxv")) & 1) == 0)
      {
        v30 = v8;
        v27 = (void *)MEMORY[0x1E0C99DA0];
        v28 = *MEMORY[0x1E0C99778];
        v29 = CFSTR("tracks must all have media type AVMediaTypeVideo");
        goto LABEL_29;
      }
      v16 = objc_msgSend(v14, "asset");
      if (v11)
      {
        if (v16 != v11)
        {
          v21 = v8;
          v27 = (void *)MEMORY[0x1E0C99DA0];
          v28 = *MEMORY[0x1E0C99778];
          v29 = CFSTR("tracks must all be part of the same AVAsset");
          goto LABEL_29;
        }
      }
      else
      {
        v11 = v16;
      }
    }
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](videoTracks, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  }
  while (v10);
LABEL_16:
  if (v8)
  {
    v17 = objc_alloc_init(AVAssetReaderVideoCompositionOutputInternal);
    v8->_videoCompositionOutputInternal = v17;
    if (!v17)
    {

      return 0;
    }
    CFRetain(v17);
    v8->_videoCompositionOutputInternal->videoTracks = (NSArray *)-[NSArray copyWithZone:](videoTracks, "copyWithZone:", -[AVAssetReaderVideoCompositionOutput zone](v8, "zone"));
    if (v48)
    {
      if (-[NSDictionary objectForKey:](v48, "objectForKey:", CFSTR("AVVideoCleanApertureKey"))
        || -[NSDictionary objectForKey:](v48, "objectForKey:", CFSTR("AVVideoPixelAspectRatioKey")))
      {
        v39 = v8;
        v27 = (void *)MEMORY[0x1E0C99DA0];
        v28 = *MEMORY[0x1E0C99778];
        v40 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v40);
        v29 = CFSTR("%@ does not currently support AVVideoCleanApertureKey or AVVideoPixelAspectRatioKey");
      }
      else if (-[NSDictionary objectForKey:](v48, "objectForKey:", CFSTR("AVVideoScalingModeKey")))
      {
        v41 = v8;
        v27 = (void *)MEMORY[0x1E0C99DA0];
        v28 = *MEMORY[0x1E0C99778];
        v42 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v42);
        v29 = CFSTR("%@ does not currently support AVVideoScalingModeKey");
      }
      else if (-[NSDictionary objectForKey:](v48, "objectForKey:", CFSTR("AVVideoDecompressionPropertiesKey")))
      {
        v43 = v8;
        v27 = (void *)MEMORY[0x1E0C99DA0];
        v28 = *MEMORY[0x1E0C99778];
        v44 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v44);
        v29 = CFSTR("%@ does not currently support AVVideoDecompressionPropertiesKey");
      }
      else
      {
        v49 = 0;
        v8->_videoCompositionOutputInternal->videoOutputSettings = (AVVideoOutputSettings *)+[AVVideoOutputSettings _videoOutputSettingsWithVideoSettingsDictionary:exceptionReason:](AVVideoOutputSettings, "_videoOutputSettingsWithVideoSettingsDictionary:exceptionReason:", v48, &v49);
        videoOutputSettings = v8->_videoCompositionOutputInternal->videoOutputSettings;
        if (videoOutputSettings)
        {
          if (-[AVOutputSettings willYieldCompressedSamples](videoOutputSettings, "willYieldCompressedSamples"))
          {
            v19 = v8;
            v27 = (void *)MEMORY[0x1E0C99DA0];
            v28 = *MEMORY[0x1E0C99778];
            v29 = CFSTR("AVAssetReaderOutput does not currently support compressed output");
            goto LABEL_29;
          }
          return v8;
        }
        v45 = v8;
        v27 = (void *)MEMORY[0x1E0C99DA0];
        v28 = *MEMORY[0x1E0C99778];
        v29 = v49;
      }
      goto LABEL_29;
    }
  }
  return v8;
}

- (void)dealloc
{
  AVAssetReaderVideoCompositionOutputInternal *videoCompositionOutputInternal;
  AVAssetReaderVideoCompositionOutputInternal *v4;
  void *figVideoCompositor;
  objc_super v6;

  videoCompositionOutputInternal = self->_videoCompositionOutputInternal;
  if (videoCompositionOutputInternal)
  {

    v4 = self->_videoCompositionOutputInternal;
    figVideoCompositor = v4->figVideoCompositor;
    if (figVideoCompositor)
    {
      CFRelease(figVideoCompositor);
      v4 = self->_videoCompositionOutputInternal;
    }

    CFRelease(self->_videoCompositionOutputInternal);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVAssetReaderVideoCompositionOutput;
  -[AVAssetReaderOutput dealloc](&v6, sel_dealloc);
}

- (BOOL)alwaysCopiesSampleData
{
  int v3;
  objc_super v5;

  v3 = dyld_program_sdk_at_least();
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVAssetReaderVideoCompositionOutput;
    LOBYTE(v3) = -[AVAssetReaderOutput alwaysCopiesSampleData](&v5, sel_alwaysCopiesSampleData);
  }
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, videoTracks = %@>"), NSStringFromClass(v4), self, -[AVAssetReaderVideoCompositionOutput videoTracks](self, "videoTracks"));
}

- (NSArray)videoTracks
{
  return self->_videoCompositionOutputInternal->videoTracks;
}

- (id)sampleDataTrackIDs
{
  return self->_videoCompositionOutputInternal->sampleDataTrackIDs;
}

- (NSDictionary)videoSettings
{
  return -[AVVideoOutputSettings videoSettingsDictionary](self->_videoCompositionOutputInternal->videoOutputSettings, "videoSettingsDictionary");
}

- (AVVideoComposition)videoComposition
{
  return self->_videoCompositionOutputInternal->videoComposition;
}

- (void)_setVideoComposition:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  AVVideoComposition *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;

  if (a3)
  {
    v18 = 0;
    if ((objc_msgSend(a3, "_isValidReturningExceptionReason:", &v18) & 1) != 0)
    {
      objc_msgSend(a3, "renderScale");
      if (v11 == 1.0)
        goto LABEL_4;
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99778];
      v15 = CFSTR("AVAssetReaderVideoCompositionOutput can't use a video composition with a renderScale other than 1.0");
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99778];
      v15 = v18;
    }
    v16 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v15, v6, v7, v8, v9, v10, v17), 0);
    objc_exception_throw(v16);
  }
LABEL_4:
  v12 = (AVVideoComposition *)objc_msgSend(a3, "copy");

  self->_videoCompositionOutputInternal->videoComposition = v12;
  self->_videoCompositionOutputInternal->sampleDataTrackIDs = -[AVVideoComposition sourceSampleDataTrackIDs](v12, "sourceSampleDataTrackIDs");
}

- (void)_setVideoComposition:(id)a3 customVideoCompositorSession:(id)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  AVAssetReaderVideoCompositionOutputInternal *videoCompositionOutputInternal;
  id v14;
  void *figVideoCompositor;
  void *v16;
  uint64_t v17;

  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot be called after reading has started"), v8, v9, v10, v11, v12, v17), 0);
    objc_exception_throw(v16);
  }
  videoCompositionOutputInternal = self->_videoCompositionOutputInternal;
  if (videoCompositionOutputInternal->videoComposition != a3
    || videoCompositionOutputInternal->customVideoCompositorSession != a4)
  {
    -[AVAssetReaderVideoCompositionOutput _setVideoComposition:](self, "_setVideoComposition:", a3);
    v14 = a4;

    self->_videoCompositionOutputInternal->customVideoCompositorSession = (AVCustomVideoCompositorSession *)a4;
    figVideoCompositor = self->_videoCompositionOutputInternal->figVideoCompositor;
    if (figVideoCompositor)
      CFRelease(figVideoCompositor);
    self->_videoCompositionOutputInternal->figVideoCompositor = (void *)objc_msgSend(a4, "_copyFigVideoCompositor");
  }
}

- (void)setVideoComposition:(AVVideoComposition *)videoComposition
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVAssetReaderVideoCompositionOutputInternal *videoCompositionOutputInternal;
  void *figVideoCompositor;
  AVCustomVideoCompositorSession *v13;
  void *v14;
  AVCustomVideoCompositorSession *v15;
  void *v16;

  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot be called after reading has started"), v6, v7, v8, v9, v10, (uint64_t)v15), 0);
    objc_exception_throw(v14);
  }
  if (self->_videoCompositionOutputInternal->videoComposition != videoComposition)
  {
    -[AVAssetReaderVideoCompositionOutput _setVideoComposition:](self, "_setVideoComposition:", videoComposition);
    v15 = 0;
    v16 = 0;
    -[AVVideoComposition _copyFigVideoCompositor:andSession:recyclingSession:forFigRemaker:error:](self->_videoCompositionOutputInternal->videoComposition, "_copyFigVideoCompositor:andSession:recyclingSession:forFigRemaker:error:", &v16, &v15, self->_videoCompositionOutputInternal->customVideoCompositorSession, 1, 0);
    videoCompositionOutputInternal = self->_videoCompositionOutputInternal;
    figVideoCompositor = videoCompositionOutputInternal->figVideoCompositor;
    if (figVideoCompositor)
    {
      CFRelease(figVideoCompositor);
      videoCompositionOutputInternal = self->_videoCompositionOutputInternal;
    }
    videoCompositionOutputInternal->figVideoCompositor = v16;
    v13 = self->_videoCompositionOutputInternal->customVideoCompositorSession;
    self->_videoCompositionOutputInternal->customVideoCompositorSession = v15;
  }
}

- (id)customVideoCompositor
{
  return -[AVCustomVideoCompositorSession customVideoCompositor](self->_videoCompositionOutputInternal->customVideoCompositorSession, "customVideoCompositor");
}

- (id)mediaType
{
  return (id)objc_msgSend(-[NSArray objectAtIndex:](self->_videoCompositionOutputInternal->videoTracks, "objectAtIndex:", 0), "mediaType");
}

- (id)_asset
{
  return (id)objc_msgSend(-[NSArray objectAtIndex:](-[AVAssetReaderVideoCompositionOutput videoTracks](self, "videoTracks"), "objectAtIndex:", 0), "asset");
}

- (id)_errorForOSStatus:(int)a3
{
  AVCustomVideoCompositorSession *customVideoCompositorSession;

  if (a3 == -16180
    && (customVideoCompositorSession = self->_videoCompositionOutputInternal->customVideoCompositorSession) != 0)
  {
    return -[AVCustomVideoCompositorSession getAndClearClientError](customVideoCompositorSession, "getAndClearClientError");
  }
  else
  {
    return +[AVAssetReader _errorForOSStatus:](AVAssetReader, "_errorForOSStatus:");
  }
}

- (BOOL)_prepareForReadingReturningError:(id *)a3
{
  AVVideoComposition *v5;
  AVVideoComposition *v6;
  id v7;
  id v8;
  BOOL result;
  uint64_t v10;
  void *v11;
  objc_super v12;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v5 = -[AVAssetReaderVideoCompositionOutput videoComposition](self, "videoComposition");
  if (!v5)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("*** AVAssetReaderVideoCompositionOutput.videoComposition needs to be set"), 0));
  v6 = v5;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v7 = -[AVWeakReference referencedObject](-[AVAssetReaderOutput _weakReferenceToAssetReader](self, "_weakReferenceToAssetReader"), "referencedObject");
  if (v7)
  {
    objc_msgSend(v7, "timeRange");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
  }
  v8 = -[AVAssetReaderVideoCompositionOutput _asset](self, "_asset");
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  if (-[AVVideoComposition isValidForAsset:timeRange:validationDelegate:](v6, "isValidForAsset:timeRange:validationDelegate:", v8, v13, 0))
  {
    v12.receiver = self;
    v12.super_class = (Class)AVAssetReaderVideoCompositionOutput;
    return -[AVAssetReaderOutput _prepareForReadingReturningError:](&v12, sel__prepareForReadingReturningError_, a3);
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVFoundationErrorDomain"), -11841, 0);
    if (a3)
    {
      v11 = (void *)v10;
      result = 0;
      *a3 = v11;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_formatDescriptions
{
  void *v3;
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
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[AVAssetReaderVideoCompositionOutput videoTracks](self, "videoTracks", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "formatDescriptions"));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)_videoCompositionProcessorColorProperties
{
  void *v3;
  int v4;
  _QWORD *v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = 0;
  v10 = 0;
  v7 = 0;
  v8 = 0;
  -[AVVideoComposition videoCompositionOutputColorPropertiesWithCustomCompositor:formatDescriptions:colorPrimaries:transferFunction:yCbCrMatrix:perFrameHDRDisplayMetadataPolicy:](self->_videoCompositionOutputInternal->videoComposition, "videoCompositionOutputColorPropertiesWithCustomCompositor:formatDescriptions:colorPrimaries:transferFunction:yCbCrMatrix:perFrameHDRDisplayMetadataPolicy:", self->_videoCompositionOutputInternal->customVideoCompositorSession, -[AVAssetReaderVideoCompositionOutput _formatDescriptions](self, "_formatDescriptions"), &v10, &v9, &v8, &v7);
  if (v10)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CC62A0]);
  if (v9)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CC62A8]);
  if (v8)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CC62B0]);
  v4 = objc_msgSend(v7, "isEqual:", CFSTR("PerFrameHDRDisplayMetadataPolicy_Generate"));
  v5 = (_QWORD *)MEMORY[0x1E0CC6298];
  if (v4)
    v5 = (_QWORD *)MEMORY[0x1E0CC6290];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *v5, *MEMORY[0x1E0CC62B8]);
  return v3;
}

- (BOOL)_enableTrackExtractionReturningError:(id *)a3
{
  NSArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  AVVideoOutputSettings *videoOutputSettings;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  double v19;
  double v20;
  int v21;
  id v22;
  AVCustomVideoCompositorSession *customVideoCompositorSession;
  void *v24;
  AVAssetReaderVideoCompositionOutputInternal *videoCompositionOutputInternal;
  _BOOL4 v26;
  AVVideoComposition *videoComposition;
  id v28;
  uint64_t v29;
  id v30;
  AVVideoComposition *v31;
  id *v32;
  CMPersistentTrackID v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t (*v38)(OpaqueFigAssetReader *, void *, id, void *, void *, void *, uint64_t, id, int, id, _QWORD, _QWORD, __int128 *, uint64_t, uint64_t, int, uint64_t, id, _DWORD, uint64_t, void *, _QWORD, id, NSDictionary *, unsigned int *);
  id v39;
  _BOOL4 v40;
  BOOL result;
  uint64_t v42;
  uint64_t v43;
  int v44;
  id v45;
  uint64_t v46;
  void *figVideoCompositor;
  void *v48;
  void *v49;
  id v50;
  int v51;
  id v52;
  OpaqueFigAssetReader *v53;
  id v54;
  int v55;
  NSDictionary *v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  unsigned int v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v64 = 0;
  v63 = -1;
  v5 = -[AVAssetReaderVideoCompositionOutput videoTracks](self, "videoTracks");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v5, "count"));
  v56 = -[AVAssetReaderOutput _figAssetReaderExtractionOptions](self, "_figAssetReaderExtractionOptions");
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v60 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "trackID")));
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v8);
  }
  videoOutputSettings = self->_videoCompositionOutputInternal->videoOutputSettings;
  v12 = +[AVAssetReaderOutput _figAssetReaderVideoScalingPropertiesFromVideoSettings:withFormatDescription:](AVAssetReaderOutput, "_figAssetReaderVideoScalingPropertiesFromVideoSettings:withFormatDescription:", videoOutputSettings, -[AVAssetReaderVideoCompositionOutput _formatDescriptions](self, "_formatDescriptions"));
  if (-[AVOutputSettings willYieldCompressedSamples](videoOutputSettings, "willYieldCompressedSamples"))
  {
    LODWORD(v13) = -[AVVideoOutputSettings videoCodecType](videoOutputSettings, "videoCodecType");
    v14 = -[AVVideoOutputSettings videoEncoderSpecification](videoOutputSettings, "videoEncoderSpecification");
    v15 = -[AVVideoOutputSettings pixelTransferProperties](videoOutputSettings, "pixelTransferProperties");
    v16 = (void *)-[AVVideoOutputSettings videoCompressionProperties](videoOutputSettings, "videoCompressionProperties");
    if (v15)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v16);
      objc_msgSend(v16, "setObject:forKey:", v15, *MEMORY[0x1E0CED148]);
    }
    v17 = -[AVVideoOutputSettings width](videoOutputSettings, "width");
    v55 = -[AVVideoOutputSettings height](videoOutputSettings, "height");
    v54 = 0;
    v18 = 0;
  }
  else
  {
    v18 = -[AVVideoOutputSettings pixelBufferAttributes](videoOutputSettings, "pixelBufferAttributes");
    -[AVVideoComposition renderSize](self->_videoCompositionOutputInternal->videoComposition, "renderSize");
    v17 = (int)v19;
    -[AVVideoComposition renderSize](self->_videoCompositionOutputInternal->videoComposition, "renderSize");
    v21 = (int)v20;
    v22 = -[AVAssetReaderVideoCompositionOutput _videoCompositionProcessorColorProperties](self, "_videoCompositionProcessorColorProperties");
    customVideoCompositorSession = self->_videoCompositionOutputInternal->customVideoCompositorSession;
    if (customVideoCompositorSession)
    {
      v13 = 0;
      if (!-[AVCustomVideoCompositorSession commitCustomVideoCompositorPropertiesAndReturnError:](customVideoCompositorSession, "commitCustomVideoCompositorPropertiesAndReturnError:", &v64))goto LABEL_35;
      v54 = v22;
      v55 = v21;
      v16 = 0;
      v14 = 0;
    }
    else
    {
      v54 = v22;
      v55 = v21;
      v16 = 0;
      v14 = 0;
      LODWORD(v13) = 0;
    }
  }
  if (!self->_videoCompositionOutputInternal->figVideoCompositor)
  {
    v13 = 0;
    v64 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11841, 0);
    goto LABEL_35;
  }
  v51 = v17;
  v53 = -[AVAssetReaderOutput _figAssetReader](self, "_figAssetReader");
  v50 = -[AVAssetReaderVideoCompositionOutput sampleDataTrackIDs](self, "sampleDataTrackIDs");
  v49 = AVVideoCompositionSerializeSourceTrackWindows(-[AVVideoComposition sourceVideoTrackWindowsForTrackIDs](self->_videoCompositionOutputInternal->videoComposition, "sourceVideoTrackWindowsForTrackIDs"));
  v24 = AVVideoCompositionSerializeSourceTrackWindows(-[AVVideoComposition sourceSampleDataTrackWindowsForTrackIDs](self->_videoCompositionOutputInternal->videoComposition, "sourceSampleDataTrackWindowsForTrackIDs"));
  videoCompositionOutputInternal = self->_videoCompositionOutputInternal;
  figVideoCompositor = videoCompositionOutputInternal->figVideoCompositor;
  v48 = v24;
  v46 = -[AVVideoComposition _serializableInstructions](videoCompositionOutputInternal->videoComposition, "_serializableInstructions");
  v26 = -[AVVideoComposition _hasLayerAsAuxiliaryTrack](self->_videoCompositionOutputInternal->videoComposition, "_hasLayerAsAuxiliaryTrack");
  videoComposition = self->_videoCompositionOutputInternal->videoComposition;
  if (v26)
  {
    v28 = -[AVVideoComposition _auxiliaryTrackLayer](videoComposition, "_auxiliaryTrackLayer");
  }
  else
  {
    if (!-[AVVideoComposition _hasPostProcessingLayers](videoComposition, "_hasPostProcessingLayers"))
    {
      v45 = 0;
      goto LABEL_24;
    }
    v28 = -[AVVideoComposition _postProcessingRootLayer](self->_videoCompositionOutputInternal->videoComposition, "_postProcessingRootLayer");
  }
  v45 = v28;
LABEL_24:
  v52 = v12;
  if (-[AVVideoComposition _hasLayerAsAuxiliaryTrack](self->_videoCompositionOutputInternal->videoComposition, "_hasLayerAsAuxiliaryTrack"))
  {
    v44 = -[AVVideoComposition _auxiliaryTrackID](self->_videoCompositionOutputInternal->videoComposition, "_auxiliaryTrackID");
  }
  else
  {
    v44 = 0;
  }
  v29 = v14;
  if (-[AVVideoComposition _hasPostProcessingLayers](self->_videoCompositionOutputInternal->videoComposition, "_hasPostProcessingLayers"))
  {
    v30 = -[AVVideoComposition _postProcessingVideoLayers](self->_videoCompositionOutputInternal->videoComposition, "_postProcessingVideoLayers");
  }
  else
  {
    v30 = 0;
  }
  v31 = self->_videoCompositionOutputInternal->videoComposition;
  v32 = a3;
  if (v31)
  {
    -[AVVideoComposition frameDuration](v31, "frameDuration");
    v31 = self->_videoCompositionOutputInternal->videoComposition;
  }
  else
  {
    v57 = 0uLL;
    v58 = 0;
  }
  v33 = -[AVVideoComposition sourceTrackIDForFrameTiming](v31, "sourceTrackIDForFrameTiming");
  -[AVVideoComposition renderSize](self->_videoCompositionOutputInternal->videoComposition, "renderSize");
  v35 = v34;
  -[AVVideoComposition renderSize](self->_videoCompositionOutputInternal->videoComposition, "renderSize");
  v37 = v36;
  v38 = *(uint64_t (**)(OpaqueFigAssetReader *, void *, id, void *, void *, void *, uint64_t, id, int, id, _QWORD, _QWORD, __int128 *, uint64_t, uint64_t, int, uint64_t, id, _DWORD, uint64_t, void *, _QWORD, id, NSDictionary *, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 160);
  if (!v38)
  {
    v39 = (id)v64;
    v40 = v64 != 0;
    v13 = 4294954514;
    a3 = v32;
    goto LABEL_39;
  }
  v65 = v57;
  v66 = v58;
  LODWORD(v43) = (int)v37;
  HIDWORD(v43) = v51;
  LODWORD(v42) = v33;
  HIDWORD(v42) = (int)v35;
  v13 = v38(v53, v6, v50, v49, v48, figVideoCompositor, v46, v45, v44, v30, 0, 0, &v65, v42, v43, v55, v18, v52, v13,
          v29,
          v16,
          0,
          v54,
          v56,
          &v63);
  a3 = v32;
LABEL_35:
  v39 = (id)v64;
  v40 = v64 != 0;
  if (!(_DWORD)v13 && !v64)
  {
    -[AVAssetReaderOutput _setExtractionID:](self, "_setExtractionID:", v63);
    return 1;
  }
LABEL_39:
  if (!a3)
    return 0;
  if (!v40)
    v39 = +[AVAssetReader _errorForOSStatus:](AVAssetReader, "_errorForOSStatus:", v13);
  result = 0;
  *a3 = v39;
  return result;
}

@end
