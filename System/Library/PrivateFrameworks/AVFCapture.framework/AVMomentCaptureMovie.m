@implementation AVMomentCaptureMovie

+ (AVMomentCaptureMovie)movieWithResolvedSettings:(id)a3 outputFileURL:(id)a4 movieMetadata:(id)a5
{
  return (AVMomentCaptureMovie *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithResolvedSettings:outputFileURL:movieMetadata:", a3, a4, a5);
}

- (id)_initWithResolvedSettings:(id)a3 outputFileURL:(id)a4 movieMetadata:(id)a5
{
  AVMomentCaptureMovie *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)AVMomentCaptureMovie;
  v8 = -[AVMomentCaptureMovie init](&v21, sel_init);
  if (v8)
  {
    v8->_resolvedSettings = (AVMomentCaptureMovieRecordingResolvedSettings *)a3;
    v8->_outputFileURL = (NSURL *)a4;
    v8->_movieMetadata = (NSArray *)a5;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      v12 = *MEMORY[0x1E0CF2BF8];
      v13 = *MEMORY[0x1E0CF2BE8];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(a5);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v15, "key"), "isEqual:", v12))
          {
            v8->_overCaptureGroupIdentifier = (NSString *)(id)objc_msgSend(v15, "value");
          }
          else if (objc_msgSend((id)objc_msgSend(v15, "key"), "isEqual:", v13))
          {
            v8->_hasOverCapture = objc_msgSend((id)objc_msgSend(v15, "value"), "intValue") != 0;
          }
        }
        v10 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }
  }
  return v8;
}

- (void)dealloc
{
  __CVBuffer *previewPixelBuffer;
  objc_super v4;

  previewPixelBuffer = self->_previewPixelBuffer;
  if (previewPixelBuffer)
    CFRelease(previewPixelBuffer);

  v4.receiver = self;
  v4.super_class = (Class)AVMomentCaptureMovie;
  -[AVMomentCaptureMovie dealloc](&v4, sel_dealloc);
}

- (id)debugDescription
{
  void *v3;
  int64_t v4;
  NSString *v5;
  NSString *v6;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[AVMomentCaptureMovieRecordingResolvedSettings uniqueID](self->_resolvedSettings, "uniqueID");
  v5 = -[NSURL lastPathComponent](self->_outputFileURL, "lastPathComponent");
  v6 = -[NSURL lastPathComponent](self->_debugMetadataSidecarFileURL, "lastPathComponent");
  time = (CMTime)self->_duration;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("[%lld] url:%@ sidecar:%@ dur:%.3f preview:%p socgroup:%@ soc:%d"), v4, v5, v6, CMTimeGetSeconds(&time), self->_previewPixelBuffer, self->_overCaptureGroupIdentifier, self->_hasOverCapture);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVMomentCaptureMovie debugDescription](self, "debugDescription"));
}

- (void)_setDebugMetadataSidecarFileURL:(id)a3
{

  self->_debugMetadataSidecarFileURL = (NSURL *)a3;
}

- (void)_setPreviewPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *previewPixelBuffer;

  previewPixelBuffer = self->_previewPixelBuffer;
  self->_previewPixelBuffer = a3;
  if (a3)
    CFRetain(a3);
  if (previewPixelBuffer)
    CFRelease(previewPixelBuffer);
}

- (void)_setDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- (AVMomentCaptureMovieRecordingResolvedSettings)resolvedSettings
{
  return self->_resolvedSettings;
}

- (NSURL)outputFileURL
{
  return self->_outputFileURL;
}

- (NSURL)debugMetadataSidecarFileURL
{
  return self->_debugMetadataSidecarFileURL;
}

- (__CVBuffer)previewPixelBuffer
{
  return self->_previewPixelBuffer;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (NSArray)movieMetadata
{
  return self->_movieMetadata;
}

@end
