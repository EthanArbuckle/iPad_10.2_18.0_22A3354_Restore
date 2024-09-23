@implementation AVAssetReaderSampleReferenceOutput

+ (AVAssetReaderSampleReferenceOutput)assetReaderSampleReferenceOutputWithTrack:(AVAssetTrack *)track
{
  return (AVAssetReaderSampleReferenceOutput *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTrack:", track);
}

- (AVAssetReaderSampleReferenceOutput)init
{
  return -[AVAssetReaderSampleReferenceOutput initWithTrack:](self, "initWithTrack:", 0);
}

- (AVAssetReaderSampleReferenceOutput)initWithTrack:(AVAssetTrack *)track
{
  AVAssetReaderSampleReferenceOutput *v5;
  AVAssetReaderSampleReferenceOutput *v6;
  AVAssetReaderSampleReferenceOutputInternal *v7;
  AVAssetReaderSampleReferenceOutput *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVAssetReaderSampleReferenceOutput;
  v5 = -[AVAssetReaderOutput init](&v16, sel_init);
  v6 = v5;
  if (!track)
  {
    v9 = v5;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)"track != nil"), 0);
    objc_exception_throw(v15);
  }
  if (v5)
  {
    v7 = objc_alloc_init(AVAssetReaderSampleReferenceOutputInternal);
    v6->_sampleReferenceOutputInternal = v7;
    if (v7)
    {
      CFRetain(v7);
      v6->_sampleReferenceOutputInternal->track = track;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  AVAssetReaderSampleReferenceOutputInternal *sampleReferenceOutputInternal;
  objc_super v4;

  sampleReferenceOutputInternal = self->_sampleReferenceOutputInternal;
  if (sampleReferenceOutputInternal)
  {

    CFRelease(self->_sampleReferenceOutputInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetReaderSampleReferenceOutput;
  -[AVAssetReaderOutput dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, track = %@>"), NSStringFromClass(v4), self, -[AVAssetReaderSampleReferenceOutput track](self, "track"));
}

- (AVAssetTrack)track
{
  return self->_sampleReferenceOutputInternal->track;
}

- (id)mediaType
{
  return -[AVAssetTrack mediaType](-[AVAssetReaderSampleReferenceOutput track](self, "track"), "mediaType");
}

- (id)_asset
{
  return -[AVAssetTrack asset](-[AVAssetReaderSampleReferenceOutput track](self, "track"), "asset");
}

- (BOOL)_trimsSampleDurations
{
  return objc_msgSend(-[AVAssetReaderSampleReferenceOutput mediaType](self, "mediaType"), "isEqual:", CFSTR("soun"));
}

- (BOOL)_enableTrackExtractionReturningError:(id *)a3
{
  OpaqueFigAssetReader *v5;
  uint64_t v6;
  NSDictionary *v7;
  uint64_t (*v8)(OpaqueFigAssetReader *, uint64_t, NSDictionary *, unsigned int *);
  uint64_t v9;
  id v10;
  BOOL result;
  unsigned int v12;

  v12 = -1;
  v5 = -[AVAssetReaderOutput _figAssetReader](self, "_figAssetReader");
  v6 = -[AVAssetTrack trackID](-[AVAssetReaderSampleReferenceOutput track](self, "track"), "trackID");
  v7 = -[AVAssetReaderOutput _figAssetReaderExtractionOptions](self, "_figAssetReaderExtractionOptions");
  v8 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, NSDictionary *, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                 + 32);
  if (!v8)
  {
    v9 = 4294954514;
    if (a3)
      goto LABEL_4;
    return 0;
  }
  v9 = v8(v5, v6, v7, &v12);
  if ((_DWORD)v9)
  {
    if (a3)
    {
LABEL_4:
      v10 = +[AVAssetReader _errorForOSStatus:](AVAssetReader, "_errorForOSStatus:", v9);
      result = 0;
      *a3 = v10;
      return result;
    }
    return 0;
  }
  -[AVAssetReaderOutput _setExtractionID:](self, "_setExtractionID:", v12);
  return 1;
}

@end
