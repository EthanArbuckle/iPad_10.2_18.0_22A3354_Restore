@implementation AVMutableMovieTrack

+ (AVMutableMovieTrack)trackWithTrackID:(int)a3 forMovie:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTrackID:forMovie:", v4, v5);

  return (AVMutableMovieTrack *)v6;
}

- (AVMutableMovieTrack)initWithTrackID:(int)a3 forMovie:(id)a4
{
  uint64_t v4;
  id v6;
  AVMutableMovieTrackInternal *v7;
  AVMutableMovieTrackInternal *mutableMovieTrackInternal;
  AVMutableMovieTrack *v9;
  AVMutableMovieTrackInternal *v10;
  void (*v11)(AVMutableMovieTrack *, uint64_t, OpaqueFigAssetTrack **);
  _QWORD *v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  void *v15;
  uint64_t CMBaseObject;
  uint64_t VTable;
  uint64_t v18;
  void (*v19)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v20;
  void (*v21)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v22;
  void (*v23)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v24;
  void (*v25)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v26;
  void (*v27)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  uint64_t v28;
  void (*v29)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  CFTypeRef cf;
  objc_super v32;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = objc_alloc_init(AVMutableMovieTrackInternal);
  mutableMovieTrackInternal = self->_mutableMovieTrackInternal;
  self->_mutableMovieTrackInternal = v7;

  if (!self->_mutableMovieTrackInternal)
    goto LABEL_34;
  v9 = (AVMutableMovieTrack *)objc_msgSend(v6, "_figAsset");
  if (!v9)
    goto LABEL_35;
  v10 = self->_mutableMovieTrackInternal;
  v11 = *(void (**)(AVMutableMovieTrack *, uint64_t, OpaqueFigAssetTrack **))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 40);
  if (v11)
    v11(v9, v4, &v10->figAssetTrack);
  if (!self->_mutableMovieTrackInternal->figAssetTrack)
  {
LABEL_34:
    v9 = 0;
    goto LABEL_35;
  }
  v32.receiver = self;
  v32.super_class = (Class)AVMutableMovieTrack;
  v12 = -[AVAssetTrack _initWithAsset:trackID:trackIndex:](&v32, sel__initWithAsset_trackID_trackIndex_, v6, v4, -1);
  if (v12)
  {
    *(_QWORD *)(v12[3] + 8) = CFRetain((CFTypeRef)objc_msgSend(v6, "_figMutableMovie"));
    *(_DWORD *)(v12[3] + 16) = v4;
    v13 = dispatch_semaphore_create(0);
    v14 = v12[3];
    v15 = *(void **)(v14 + 32);
    *(_QWORD *)(v14 + 32) = v13;

    if (*(_QWORD *)(v12[3] + 32))
    {
      cf = 0;
      CMBaseObject = FigAssetTrackGetCMBaseObject();
      VTable = CMBaseObjectGetVTable();
      v18 = *MEMORY[0x1E0C9AE00];
      v19 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(VTable + 8) + 48);
      if (v19)
        v19(CMBaseObject, *MEMORY[0x1E0CC6078], *MEMORY[0x1E0C9AE00], &cf);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      v20 = FigAssetTrackGetCMBaseObject();
      v21 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
      if (v21)
        v21(v20, *MEMORY[0x1E0CC3C10], v18, &cf);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      v22 = FigAssetTrackGetCMBaseObject();
      v23 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
      if (v23)
        v23(v22, *MEMORY[0x1E0CC3C70], v18, &cf);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      v24 = FigAssetTrackGetCMBaseObject();
      v25 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
      if (v25)
        v25(v24, *MEMORY[0x1E0CC3C60], v18, &cf);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      v26 = FigAssetTrackGetCMBaseObject();
      v27 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
      if (v27)
        v27(v26, *MEMORY[0x1E0CC3C68], v18, &cf);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      v28 = FigAssetTrackGetCMBaseObject();
      v29 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
      if (v29)
        v29(v28, *MEMORY[0x1E0CC3C30], v18, &cf);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      objc_msgSend(v12, "_addFigAssetTrackNotifications");
    }
  }
  self = v12;
  v9 = self;
LABEL_35:

  return v9;
}

- (void)dealloc
{
  AVMutableMovieTrackInternal *mutableMovieTrackInternal;
  OpaqueFigMutableMovie *figMutableMovie;
  OpaqueFigAssetTrack *figAssetTrack;
  objc_super v6;

  if (self->_mutableMovieTrackInternal)
  {
    -[AVMutableMovieTrack _removeFigAssetTrackNotifications](self, "_removeFigAssetTrackNotifications");
    mutableMovieTrackInternal = self->_mutableMovieTrackInternal;
    figMutableMovie = mutableMovieTrackInternal->figMutableMovie;
    if (figMutableMovie)
    {
      CFRelease(figMutableMovie);
      mutableMovieTrackInternal = self->_mutableMovieTrackInternal;
    }
    figAssetTrack = mutableMovieTrackInternal->figAssetTrack;
    if (figAssetTrack)
      CFRelease(figAssetTrack);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVMutableMovieTrack;
  -[AVAssetTrack dealloc](&v6, sel_dealloc);
}

- (OpaqueFigAssetTrack)_figAssetTrack
{
  return self->_mutableMovieTrackInternal->figAssetTrack;
}

- (void)_signalMetadataUpdated
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_mutableMovieTrackInternal->metadataWaitingSemaphore);
}

- (void)_addFigAssetTrackNotifications
{
  OpaqueFigAssetTrack *v3;
  void *v4;
  void *v5;
  id obj;

  v3 = -[AVMutableMovieTrack _figAssetTrack](self, "_figAssetTrack");
  -[AVAssetTrack _weakReference](self, "_weakReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && v4)
  {
    obj = v4;
    +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_mutableMovieTrackInternal->figAssetTrackNotificationSource = (OpaqueFigAssetTrack *)CFRetain(v3);
    objc_storeStrong((id *)&self->_mutableMovieTrackInternal->figAssetTrackNotificationListenerWeakReference, obj);
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", self->_mutableMovieTrackInternal->figAssetTrackNotificationListenerWeakReference, mutableMovieTrackNotificationHandler, *MEMORY[0x1E0CC3C00], self->_mutableMovieTrackInternal->figAssetTrackNotificationSource, 0);

    v4 = obj;
  }

}

- (void)_removeFigAssetTrackNotifications
{
  AVMutableMovieTrackInternal *mutableMovieTrackInternal;
  OpaqueFigAssetTrack *figAssetTrackNotificationSource;
  void *v5;
  AVWeakReference *figAssetTrackNotificationListenerWeakReference;

  mutableMovieTrackInternal = self->_mutableMovieTrackInternal;
  figAssetTrackNotificationSource = mutableMovieTrackInternal->figAssetTrackNotificationSource;
  if (figAssetTrackNotificationSource)
  {
    if (!mutableMovieTrackInternal->figAssetTrackNotificationListenerWeakReference
      || (+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_mutableMovieTrackInternal->figAssetTrackNotificationListenerWeakReference, mutableMovieTrackNotificationHandler, *MEMORY[0x1E0CC3C00], self->_mutableMovieTrackInternal->figAssetTrackNotificationSource), v5, mutableMovieTrackInternal = self->_mutableMovieTrackInternal, (figAssetTrackNotificationSource = mutableMovieTrackInternal->figAssetTrackNotificationSource) != 0))
    {
      CFRelease(figAssetTrackNotificationSource);
      mutableMovieTrackInternal = self->_mutableMovieTrackInternal;
    }
  }
  figAssetTrackNotificationListenerWeakReference = mutableMovieTrackInternal->figAssetTrackNotificationListenerWeakReference;
  mutableMovieTrackInternal->figAssetTrackNotificationListenerWeakReference = 0;

  self->_mutableMovieTrackInternal->figAssetTrackNotificationSource = 0;
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  return 2;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  void (**v4)(void);

  v4 = (void (**)(void))a4;
  if (v4)
    v4[2]();

}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

- (OpaqueFigMutableMovie)_figMutableMovie
{
  return self->_mutableMovieTrackInternal->figMutableMovie;
}

- (int)trackID
{
  return self->_mutableMovieTrackInternal->trackID;
}

- (NSString)languageCode
{
  return (NSString *)-[AVMutableMovieTrack _stringForProperty:](self, "_stringForProperty:", *MEMORY[0x1E0CC4918]);
}

- (NSString)extendedLanguageTag
{
  return (NSString *)-[AVMutableMovieTrack _stringForProperty:](self, "_stringForProperty:", *MEMORY[0x1E0CC4900]);
}

- (id)locale
{
  __CFString *v3;
  CFLocaleRef v4;
  CFLocaleRef v5;

  -[AVMutableMovieTrack extendedLanguageTag](self, "extendedLanguageTag");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[AVMutableMovieTrack languageCode](self, "languageCode"),
        (v3 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3);
    if (v4)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVMutableMovieTrack _sizeForProperty:](self, "_sizeForProperty:", *MEMORY[0x1E0CC48F0]);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)dimensions
{
  double v2;
  double v3;
  CGSize result;

  -[AVMutableMovieTrack _sizeForProperty:](self, "_sizeForProperty:", *MEMORY[0x1E0CC48F0]);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  uint64_t v5;
  __int128 v6;
  OpaqueFigMutableMovie *v7;
  uint64_t v8;
  CGAffineTransform *result;
  uint64_t (*v10)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CGAffineTransform **);
  int v11;
  CFTypeID v12;
  CFTypeID TypeID;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform *v17;

  v17 = 0;
  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  v7 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v8 = -[AVMutableMovieTrack trackID](self, "trackID");
  result = (CGAffineTransform *)CMBaseObjectGetVTable();
  v10 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CGAffineTransform **))(*(_QWORD *)&result->c + 48);
  if (v10)
  {
    v11 = v10(v7, v8, *MEMORY[0x1E0CC4980], *MEMORY[0x1E0C9AE00], &v17);
    result = v17;
    if (!v11)
    {
      if (!v17)
        return result;
      v12 = CFGetTypeID(v17);
      TypeID = CFArrayGetTypeID();
      result = v17;
      if (v12 == TypeID)
      {
        FigGetCGAffineTransformFrom3x3MatrixArray();
        *(_OWORD *)&retstr->a = v14;
        *(_OWORD *)&retstr->c = v15;
        *(_OWORD *)&retstr->tx = v16;
        result = v17;
      }
    }
    if (result)
      CFRelease(result);
  }
  return result;
}

- (NSInteger)layer
{
  OpaqueFigMutableMovie *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeID TypeID;
  __int16 valuePtr;
  CFTypeRef cf;

  cf = 0;
  valuePtr = -1;
  v3 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v4 = -[AVMutableMovieTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 48);
  if (v5)
  {
    v6 = v5(v3, v4, *MEMORY[0x1E0CC4920], *MEMORY[0x1E0C9AE00], &cf);
    v7 = cf;
    if (!v6)
    {
      if (!cf)
        return valuePtr;
      v8 = CFGetTypeID(cf);
      TypeID = CFNumberGetTypeID();
      v7 = cf;
      if (v8 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt16Type, &valuePtr);
        v7 = cf;
      }
    }
    if (v7)
      CFRelease(v7);
  }
  return valuePtr;
}

- (CMTimeScale)timescale
{
  OpaqueFigMutableMovie *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeID TypeID;
  CMTimeScale valuePtr;
  CFTypeRef cf;

  cf = 0;
  valuePtr = 0;
  v3 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v4 = -[AVMutableMovieTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 48);
  if (v5)
  {
    v6 = v5(v3, v4, *MEMORY[0x1E0CC4940], *MEMORY[0x1E0C9AE00], &cf);
    v7 = cf;
    if (!v6)
    {
      if (!cf)
        return valuePtr;
      v8 = CFGetTypeID(cf);
      TypeID = CFNumberGetTypeID();
      v7 = cf;
      if (v8 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
        v7 = cf;
      }
    }
    if (v7)
      CFRelease(v7);
  }
  return valuePtr;
}

- (float)preferredVolume
{
  OpaqueFigMutableMovie *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeID TypeID;
  float valuePtr;
  CFTypeRef cf;

  cf = 0;
  valuePtr = 1.0;
  v3 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v4 = -[AVMutableMovieTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 48);
  if (v5)
  {
    v6 = v5(v3, v4, *MEMORY[0x1E0CC4988], *MEMORY[0x1E0C9AE00], &cf);
    v7 = cf;
    if (!v6)
    {
      if (!cf)
        return valuePtr;
      v8 = CFGetTypeID(cf);
      TypeID = CFNumberGetTypeID();
      v7 = cf;
      if (v8 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat32Type, &valuePtr);
        v7 = cf;
      }
    }
    if (v7)
      CFRelease(v7);
  }
  return valuePtr;
}

- (CGSize)cleanApertureDimensions
{
  double v2;
  double v3;
  CGSize result;

  -[AVMutableMovieTrack _sizeForProperty:](self, "_sizeForProperty:", *MEMORY[0x1E0CC48E8]);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)productionApertureDimensions
{
  double v2;
  double v3;
  CGSize result;

  -[AVMutableMovieTrack _sizeForProperty:](self, "_sizeForProperty:", *MEMORY[0x1E0CC4970]);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)encodedPixelsDimensions
{
  double v2;
  double v3;
  CGSize result;

  -[AVMutableMovieTrack _sizeForProperty:](self, "_sizeForProperty:", *MEMORY[0x1E0CC48F8]);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isEnabled
{
  OpaqueFigMutableMovie *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeID TypeID;
  BOOL v10;
  CFTypeRef cf;

  cf = 0;
  v3 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v4 = -[AVMutableMovieTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 48);
  if (!v5)
    return 0;
  v6 = v5(v3, v4, *MEMORY[0x1E0CC4910], *MEMORY[0x1E0C9AE00], &cf);
  v7 = cf;
  if (v6)
    goto LABEL_9;
  if (!cf)
    return 0;
  v8 = CFGetTypeID(cf);
  TypeID = CFBooleanGetTypeID();
  v7 = cf;
  if (v8 != TypeID)
  {
LABEL_9:
    v10 = 0;
    if (!v7)
      return v10;
    goto LABEL_6;
  }
  v10 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
  v7 = cf;
  if (cf)
LABEL_6:
    CFRelease(v7);
  return v10;
}

- (BOOL)isModified
{
  OpaqueFigMutableMovie *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeID TypeID;
  BOOL v10;
  CFTypeRef cf;

  cf = 0;
  v3 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v4 = -[AVMutableMovieTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 48);
  if (!v5)
    return 0;
  v6 = v5(v3, v4, *MEMORY[0x1E0CC4950], *MEMORY[0x1E0C9AE00], &cf);
  v7 = cf;
  if (v6)
    goto LABEL_9;
  if (!cf)
    return 0;
  v8 = CFGetTypeID(cf);
  TypeID = CFBooleanGetTypeID();
  v7 = cf;
  if (v8 != TypeID)
  {
LABEL_9:
    v10 = 0;
    if (!v7)
      return v10;
    goto LABEL_6;
  }
  v10 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
  v7 = cf;
  if (cf)
LABEL_6:
    CFRelease(v7);
  return v10;
}

- (BOOL)hasProtectedContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableMovieTrack;
  return -[AVAssetTrack hasProtectedContent](&v3, sel_hasProtectedContent);
}

- (NSInteger)preferredMediaChunkSize
{
  OpaqueFigMutableMovie *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeID TypeID;
  unsigned int valuePtr;
  CFTypeRef cf;

  cf = 0;
  valuePtr = 0;
  v3 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v4 = -[AVMutableMovieTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 48);
  if (v5)
  {
    v6 = v5(v3, v4, *MEMORY[0x1E0CC4968], *MEMORY[0x1E0C9AE00], &cf);
    v7 = cf;
    if (!v6)
    {
      if (!cf)
        return valuePtr;
      v8 = CFGetTypeID(cf);
      TypeID = CFNumberGetTypeID();
      v7 = cf;
      if (v8 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
        v7 = cf;
      }
    }
    if (v7)
      CFRelease(v7);
  }
  return valuePtr;
}

- (CMTime)preferredMediaChunkDuration
{
  OpaqueFigMutableMovie *v5;
  uint64_t v6;
  CMTime *result;
  uint64_t (*v8)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v9;
  CFTypeID v10;
  CFTypeID TypeID;
  CMTime v12;
  CFTypeRef cf;

  cf = 0;
  *retstr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v5 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v6 = -[AVMutableMovieTrack trackID](self, "trackID");
  result = (CMTime *)CMBaseObjectGetVTable();
  v8 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(result->epoch + 48);
  if (v8)
  {
    v9 = v8(v5, v6, *MEMORY[0x1E0CC4960], *MEMORY[0x1E0C9AE00], &cf);
    result = (CMTime *)cf;
    if (!v9)
    {
      if (!cf)
        return result;
      v10 = CFGetTypeID(cf);
      TypeID = CFDictionaryGetTypeID();
      result = (CMTime *)cf;
      if (v10 == TypeID)
      {
        CMTimeMakeFromDictionary(&v12, (CFDictionaryRef)cf);
        *(_OWORD *)&retstr->value = *(_OWORD *)&v12.value;
        result = (CMTime *)cf;
        retstr->epoch = v12.epoch;
      }
    }
    if (result)
      CFRelease(result);
  }
  return result;
}

- (NSInteger)preferredMediaChunkAlignment
{
  OpaqueFigMutableMovie *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeID TypeID;
  unsigned int valuePtr;
  CFTypeRef cf;

  cf = 0;
  valuePtr = 0;
  v3 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v4 = -[AVMutableMovieTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 48);
  if (v5)
  {
    v6 = v5(v3, v4, *MEMORY[0x1E0CC4958], *MEMORY[0x1E0C9AE00], &cf);
    v7 = cf;
    if (!v6)
    {
      if (!cf)
        return valuePtr;
      v8 = CFGetTypeID(cf);
      TypeID = CFNumberGetTypeID();
      v7 = cf;
      if (v8 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
        v7 = cf;
      }
    }
    if (v7)
      CFRelease(v7);
  }
  return valuePtr;
}

- (CGSize)_sizeForProperty:(__CFString *)a3
{
  OpaqueFigMutableMovie *v5;
  uint64_t v6;
  uint64_t (*v7)(OpaqueFigMutableMovie *, uint64_t, __CFString *, _QWORD, CFTypeRef *);
  int v8;
  CFTypeRef v9;
  CFTypeID v10;
  CFTypeID TypeID;
  double width;
  double height;
  CFTypeRef cf;
  CGSize size;
  CGSize result;

  size = (CGSize)*MEMORY[0x1E0C9D820];
  cf = 0;
  v5 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v6 = -[AVMutableMovieTrack trackID](self, "trackID");
  v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, __CFString *, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (v7)
  {
    v8 = v7(v5, v6, a3, *MEMORY[0x1E0C9AE00], &cf);
    v9 = cf;
    if (!v8)
    {
      if (!cf)
        goto LABEL_8;
      v10 = CFGetTypeID(cf);
      TypeID = CFDictionaryGetTypeID();
      v9 = cf;
      if (v10 == TypeID)
      {
        CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)cf, &size);
        v9 = cf;
      }
    }
    if (v9)
      CFRelease(v9);
  }
LABEL_8:
  width = size.width;
  height = size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setSize:(CGSize)a3 forProperty:(__CFString *)a4
{
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v7;
  OpaqueFigMutableMovie *v8;
  uint64_t v9;
  void (*v10)(OpaqueFigMutableMovie *, uint64_t, __CFString *, CFDictionaryRef);

  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(a3);
  if (DictionaryRepresentation)
  {
    v7 = DictionaryRepresentation;
    v8 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
    v9 = -[AVMutableMovieTrack trackID](self, "trackID");
    v10 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, __CFString *, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                 + 56);
    if (v10)
      v10(v8, v9, a4, v7);
    CFRelease(v7);
  }
}

- (id)_stringForProperty:(__CFString *)a3
{
  OpaqueFigMutableMovie *v5;
  uint64_t v6;
  uint64_t (*v7)(OpaqueFigMutableMovie *, uint64_t, __CFString *, _QWORD, CFTypeRef *);
  int v8;
  void *v9;
  CFTypeID v10;
  CFTypeID TypeID;
  CFTypeRef cf;

  cf = 0;
  v5 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v6 = -[AVMutableMovieTrack trackID](self, "trackID");
  v7 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, __CFString *, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (!v7)
    goto LABEL_8;
  v8 = v7(v5, v6, a3, *MEMORY[0x1E0C9AE00], &cf);
  v9 = (void *)cf;
  if (v8)
  {
LABEL_6:
    if (!v9)
      return v9;
    CFRelease(v9);
LABEL_8:
    v9 = 0;
    return v9;
  }
  if (cf)
  {
    v10 = CFGetTypeID(cf);
    TypeID = CFStringGetTypeID();
    v9 = (void *)cf;
    if (v10 == TypeID)
    {
      cf = 0;
      return v9;
    }
    goto LABEL_6;
  }
  return v9;
}

- (void)_setString:(id)a3 forProperty:(__CFString *)a4
{
  OpaqueFigMutableMovie *v6;
  uint64_t v7;
  void (*v8)(OpaqueFigMutableMovie *, uint64_t, __CFString *, id);
  id v9;

  v9 = a3;
  v6 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v7 = -[AVMutableMovieTrack trackID](self, "trackID");
  v8 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, __CFString *, id))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 16)
                                                                                 + 56);
  if (v8)
    v8(v6, v7, a4, v9);

}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaPresentationTimeRange
{
  uint64_t v5;
  __int128 v6;
  OpaqueFigMutableMovie *v7;
  uint64_t v8;
  $1CE2C3FC342086196D07C2B4E8C70800 *result;
  uint64_t (*v10)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, $1CE2C3FC342086196D07C2B4E8C70800 **);
  int v11;
  CFTypeID v12;
  CFTypeID TypeID;
  __int128 v14;
  CMTimeRange v15;
  $1CE2C3FC342086196D07C2B4E8C70800 *v16;

  v16 = 0;
  v5 = MEMORY[0x1E0CA2E40];
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v5 + 32);
  v7 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v8 = -[AVMutableMovieTrack trackID](self, "trackID");
  result = ($1CE2C3FC342086196D07C2B4E8C70800 *)CMBaseObjectGetVTable();
  v10 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, $1CE2C3FC342086196D07C2B4E8C70800 **))(result->var0.var3 + 48);
  if (v10)
  {
    v11 = v10(v7, v8, *MEMORY[0x1E0CC4938], *MEMORY[0x1E0C9AE00], &v16);
    result = v16;
    if (!v11)
    {
      if (!v16)
        return result;
      v12 = CFGetTypeID(v16);
      TypeID = CFDictionaryGetTypeID();
      result = v16;
      if (v12 == TypeID)
      {
        CMTimeRangeMakeFromDictionary(&v15, (CFDictionaryRef)v16);
        v14 = *(_OWORD *)&v15.start.epoch;
        *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v15.start.value;
        *(_OWORD *)&retstr->var0.var3 = v14;
        *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v15.duration.timescale;
        result = v16;
      }
    }
    if (result)
      CFRelease(result);
  }
  return result;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaDecodeTimeRange
{
  uint64_t v5;
  __int128 v6;
  OpaqueFigMutableMovie *v7;
  uint64_t v8;
  $1CE2C3FC342086196D07C2B4E8C70800 *result;
  uint64_t (*v10)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, $1CE2C3FC342086196D07C2B4E8C70800 **);
  int v11;
  CFTypeID v12;
  CFTypeID TypeID;
  __int128 v14;
  CMTimeRange v15;
  $1CE2C3FC342086196D07C2B4E8C70800 *v16;

  v16 = 0;
  v5 = MEMORY[0x1E0CA2E40];
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v5 + 32);
  v7 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v8 = -[AVMutableMovieTrack trackID](self, "trackID");
  result = ($1CE2C3FC342086196D07C2B4E8C70800 *)CMBaseObjectGetVTable();
  v10 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, $1CE2C3FC342086196D07C2B4E8C70800 **))(result->var0.var3 + 48);
  if (v10)
  {
    v11 = v10(v7, v8, *MEMORY[0x1E0CC4930], *MEMORY[0x1E0C9AE00], &v16);
    result = v16;
    if (!v11)
    {
      if (!v16)
        return result;
      v12 = CFGetTypeID(v16);
      TypeID = CFDictionaryGetTypeID();
      result = v16;
      if (v12 == TypeID)
      {
        CMTimeRangeMakeFromDictionary(&v15, (CFDictionaryRef)v16);
        v14 = *(_OWORD *)&v15.start.epoch;
        *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v15.start.value;
        *(_OWORD *)&retstr->var0.var3 = v14;
        *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v15.duration.timescale;
        result = v16;
      }
    }
    if (result)
      CFRelease(result);
  }
  return result;
}

- (NSInteger)alternateGroupID
{
  OpaqueFigMutableMovie *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  CFTypeRef v7;
  CFTypeID v8;
  CFTypeID TypeID;
  __int16 valuePtr;
  CFTypeRef cf;

  cf = 0;
  valuePtr = -1;
  v3 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v4 = -[AVMutableMovieTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 48);
  if (v5)
  {
    v6 = v5(v3, v4, *MEMORY[0x1E0CC48D8], *MEMORY[0x1E0C9AE00], &cf);
    v7 = cf;
    if (!v6)
    {
      if (!cf)
        return valuePtr;
      v8 = CFGetTypeID(cf);
      TypeID = CFNumberGetTypeID();
      v7 = cf;
      if (v8 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt16Type, &valuePtr);
        v7 = cf;
      }
    }
    if (v7)
      CFRelease(v7);
  }
  return valuePtr;
}

- (NSURL)sampleReferenceBaseURL
{
  OpaqueFigMutableMovie *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  void *v7;
  CFTypeID v8;
  CFTypeID v9;
  CFTypeRef cf;

  cf = 0;
  v3 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v4 = -[AVMutableMovieTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 48);
  if (!v5)
    goto LABEL_8;
  v6 = v5(v3, v4, *MEMORY[0x1E0CC4978], *MEMORY[0x1E0C9AE00], &cf);
  v7 = (void *)cf;
  if (v6)
  {
LABEL_6:
    if (!v7)
      return (NSURL *)v7;
    CFRelease(v7);
LABEL_8:
    v7 = 0;
    return (NSURL *)v7;
  }
  if (cf)
  {
    v8 = CFGetTypeID(cf);
    v9 = CFURLGetTypeID();
    v7 = (void *)cf;
    if (v8 == v9)
    {
      cf = 0;
      return (NSURL *)v7;
    }
    goto LABEL_6;
  }
  return (NSURL *)v7;
}

- (void)setSampleReferenceBaseURL:(NSURL *)sampleReferenceBaseURL
{
  OpaqueFigMutableMovie *v4;
  uint64_t v5;
  void (*v6)(OpaqueFigMutableMovie *, uint64_t, _QWORD, NSURL *);
  NSURL *v7;

  v7 = sampleReferenceBaseURL;
  v4 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v5 = -[AVMutableMovieTrack trackID](self, "trackID");
  v6 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, NSURL *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 56);
  if (v6)
    v6(v4, v5, *MEMORY[0x1E0CC4978], v7);

}

- (AVMediaDataStorage)mediaDataStorage
{
  OpaqueFigMutableMovie *v3;
  uint64_t v4;
  unsigned int (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeID v6;
  AVMediaDataStorage *v7;
  AVMediaDataStorage *v8;
  CFTypeRef cf;

  cf = 0;
  v3 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v4 = -[AVMutableMovieTrack trackID](self, "trackID");
  v5 = *(unsigned int (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (!v5 || v5(v3, v4, *MEMORY[0x1E0CC4928], *MEMORY[0x1E0C9AE00], &cf))
    goto LABEL_6;
  if (!cf)
    return (AVMediaDataStorage *)0;
  v6 = CFGetTypeID(cf);
  if (v6 == CFURLGetTypeID())
  {
    v7 = [AVMediaDataStorage alloc];
    v8 = -[AVMediaDataStorage initWithURL:options:](v7, "initWithURL:options:", cf, 0);
  }
  else
  {
LABEL_6:
    v8 = 0;
  }
  if (cf)
    CFRelease(cf);
  return v8;
}

- (void)setMediaDataStorage:(AVMediaDataStorage *)mediaDataStorage
{
  OpaqueFigMutableMovie *v4;
  uint64_t v5;
  void (*v6)(OpaqueFigMutableMovie *, uint64_t, _QWORD, id);
  id v7;

  -[AVMediaDataStorage URL](mediaDataStorage, "URL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v5 = -[AVMutableMovieTrack trackID](self, "trackID");
  v6 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 56);
  if (v6)
    v6(v4, v5, *MEMORY[0x1E0CC4928], v7);

}

- (void)setLanguageCode:(NSString *)languageCode
{
  -[AVMutableMovieTrack _setString:forProperty:](self, "_setString:forProperty:", languageCode, *MEMORY[0x1E0CC4918]);
}

- (void)setExtendedLanguageTag:(NSString *)extendedLanguageTag
{
  -[AVMutableMovieTrack _setString:forProperty:](self, "_setString:forProperty:", extendedLanguageTag, *MEMORY[0x1E0CC4900]);
}

- (void)setNaturalSize:(CGSize)naturalSize
{
  -[AVMutableMovieTrack _setSize:forProperty:](self, "_setSize:forProperty:", *MEMORY[0x1E0CC48F0], naturalSize.width, naturalSize.height);
}

- (void)setPreferredVolume:(float)preferredVolume
{
  OpaqueFigMutableMovie *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void (*v9)(OpaqueFigMutableMovie *, uint64_t, _QWORD, uint64_t);

  v5 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v6 = -[AVMutableMovieTrack trackID](self, "trackID");
  *(float *)&v7 = preferredVolume;
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v9 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 56);
  if (v9)
    v9(v5, v6, *MEMORY[0x1E0CC4988], v8);
}

- (void)setPreferredTransform:(CGAffineTransform *)preferredTransform
{
  uint64_t v4;
  const void *v5;
  OpaqueFigMutableMovie *v6;
  uint64_t v7;
  void (*v8)(OpaqueFigMutableMovie *, uint64_t, _QWORD, const void *);
  CGAffineTransform v9;

  v9 = *preferredTransform;
  v4 = FigCreate3x3MatrixArrayFromCGAffineTransform();
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie", *(_OWORD *)&v9.a, *(_OWORD *)&v9.c, *(_OWORD *)&v9.tx);
    v7 = -[AVMutableMovieTrack trackID](self, "trackID");
    v8 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 56);
    if (v8)
      v8(v6, v7, *MEMORY[0x1E0CC4980], v5);
    CFRelease(v5);
  }
}

- (void)setTimescale:(CMTimeScale)timescale
{
  uint64_t v3;
  OpaqueFigMutableMovie *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(OpaqueFigMutableMovie *, uint64_t, _QWORD, uint64_t);

  v3 = *(_QWORD *)&timescale;
  v5 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v6 = -[AVMutableMovieTrack trackID](self, "trackID");
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 56);
  if (v8)
    v8(v5, v6, *MEMORY[0x1E0CC4940], v7);
}

- (void)setCleanApertureDimensions:(CGSize)cleanApertureDimensions
{
  -[AVMutableMovieTrack _setSize:forProperty:](self, "_setSize:forProperty:", *MEMORY[0x1E0CC48E8], cleanApertureDimensions.width, cleanApertureDimensions.height);
}

- (void)setProductionApertureDimensions:(CGSize)productionApertureDimensions
{
  -[AVMutableMovieTrack _setSize:forProperty:](self, "_setSize:forProperty:", *MEMORY[0x1E0CC4970], productionApertureDimensions.width, productionApertureDimensions.height);
}

- (void)setEncodedPixelsDimensions:(CGSize)encodedPixelsDimensions
{
  -[AVMutableMovieTrack _setSize:forProperty:](self, "_setSize:forProperty:", *MEMORY[0x1E0CC48F8], encodedPixelsDimensions.width, encodedPixelsDimensions.height);
}

- (void)setLayer:(NSInteger)layer
{
  CFNumberRef v4;
  CFNumberRef v5;
  OpaqueFigMutableMovie *v6;
  uint64_t v7;
  void (*v8)(OpaqueFigMutableMovie *, uint64_t, _QWORD, CFNumberRef);
  __int16 valuePtr;

  valuePtr = layer;
  if (layer < 0x8000)
  {
    v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt16Type, &valuePtr);
    if (v4)
    {
      v5 = v4;
      v6 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
      v7 = -[AVMutableMovieTrack trackID](self, "trackID");
      v8 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 56);
      if (v8)
        v8(v6, v7, *MEMORY[0x1E0CC4920], v5);
      CFRelease(v5);
    }
  }
}

- (void)setAlternateGroupID:(NSInteger)alternateGroupID
{
  void *v4;
  CFNumberRef v5;
  CFNumberRef v6;
  OpaqueFigMutableMovie *v7;
  uint64_t v8;
  void (*v9)(OpaqueFigMutableMovie *, uint64_t, _QWORD, CFNumberRef);
  void *v10;
  __int16 valuePtr;

  valuePtr = alternateGroupID;
  if (alternateGroupID < 0x8000)
  {
    -[AVAssetTrack asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willChangeValueForKey:", CFSTR("trackGroups"));

    v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt16Type, &valuePtr);
    if (v5)
    {
      v6 = v5;
      v7 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
      v8 = -[AVMutableMovieTrack trackID](self, "trackID");
      v9 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 56);
      if (v9)
        v9(v7, v8, *MEMORY[0x1E0CC48D8], v6);
      -[AVAssetTrack asset](self, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "didChangeValueForKey:", CFSTR("trackGroups"));

      CFRelease(v6);
    }
  }
}

- (void)setEnabled:(BOOL)enabled
{
  _BOOL4 v3;
  OpaqueFigMutableMovie *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigMutableMovie *, uint64_t, _QWORD, uint64_t);
  uint64_t v8;

  v3 = enabled;
  v5 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v6 = -[AVMutableMovieTrack trackID](self, "trackID");
  v7 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 56);
  if (v7)
  {
    if (v3)
      v8 = *MEMORY[0x1E0C9AE50];
    else
      v8 = *MEMORY[0x1E0C9AE40];
    v7(v5, v6, *MEMORY[0x1E0CC4910], v8);
  }
}

- (void)setModified:(BOOL)modified
{
  _BOOL4 v3;
  OpaqueFigMutableMovie *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigMutableMovie *, uint64_t, _QWORD, uint64_t);
  uint64_t v8;

  v3 = modified;
  v5 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v6 = -[AVMutableMovieTrack trackID](self, "trackID");
  v7 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 56);
  if (v7)
  {
    if (v3)
      v8 = *MEMORY[0x1E0C9AE50];
    else
      v8 = *MEMORY[0x1E0C9AE40];
    v7(v5, v6, *MEMORY[0x1E0CC4950], v8);
  }
}

- (void)setPreferredMediaChunkSize:(NSInteger)preferredMediaChunkSize
{
  OpaqueFigMutableMovie *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(OpaqueFigMutableMovie *, uint64_t, _QWORD, uint64_t);

  v5 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v6 = -[AVMutableMovieTrack trackID](self, "trackID");
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", preferredMediaChunkSize);
  v8 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 56);
  if (v8)
    v8(v5, v6, *MEMORY[0x1E0CC4968], v7);
}

- (void)setPreferredMediaChunkDuration:(CMTime *)preferredMediaChunkDuration
{
  const __CFAllocator *v4;
  CFDictionaryRef v5;
  OpaqueFigMutableMovie *v6;
  uint64_t v7;
  void (*v8)(OpaqueFigMutableMovie *, uint64_t, _QWORD, CFDictionaryRef);
  CMTime v9;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = *preferredMediaChunkDuration;
  v5 = CMTimeCopyAsDictionary(&v9, v4);
  v6 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v7 = -[AVMutableMovieTrack trackID](self, "trackID");
  v8 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 56);
  if (v8)
    v8(v6, v7, *MEMORY[0x1E0CC4960], v5);
  if (v5)
    CFRelease(v5);
}

- (void)setPreferredMediaChunkAlignment:(NSInteger)preferredMediaChunkAlignment
{
  OpaqueFigMutableMovie *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(OpaqueFigMutableMovie *, uint64_t, _QWORD, uint64_t);

  v5 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v6 = -[AVMutableMovieTrack trackID](self, "trackID");
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", preferredMediaChunkAlignment);
  v8 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 56);
  if (v8)
    v8(v5, v6, *MEMORY[0x1E0CC4958], v7);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[AVMutableMovieTrack sampleReferenceBaseURL](self, "sampleReferenceBaseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = -[AVMutableMovieTrack trackID](self, "trackID");
    -[AVAssetTrack mediaType](self, "mediaType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMutableMovieTrack sampleReferenceBaseURL](self, "sampleReferenceBaseURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, trackID = %d, mediaType = %@, sampleReferenceBaseURL = %@>"), v6, self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = -[AVMutableMovieTrack trackID](self, "trackID");
    -[AVAssetTrack mediaType](self, "mediaType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, trackID = %d, mediaType = %@>"), v6, self, v11, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableMovieTrackInternal, 0);
}

- (void)replaceFormatDescription:(CMFormatDescriptionRef)formatDescription withFormatDescription:(CMFormatDescriptionRef)newFormatDescription
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CMMediaType MediaType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const opaqueCMFormatDescription *v22;
  void *v23;
  OpaqueFigMutableMovie *v24;
  uint64_t v25;
  void (*v26)(OpaqueFigMutableMovie *, uint64_t, _QWORD, void *);
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  if (!formatDescription)
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)newFormatDescription, v4, v5, v6, v7, (uint64_t)"formatDescription != NULL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v28, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (!newFormatDescription)
  {
    v30 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), 0, v4, v5, v6, v7, (uint64_t)"newFormatDescription != NULL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v28, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (formatDescription == newFormatDescription)
    return;
  MediaType = CMFormatDescriptionGetMediaType(formatDescription);
  if (MediaType != CMFormatDescriptionGetMediaType(newFormatDescription))
  {
    v31 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Media type of the new format description must match that of the existing format description"), v13, v14, v15, v16, v17, v33);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v28, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v32 = v29;

    objc_exception_throw(v32);
  }
  -[AVMutableMovieTrack formatDescriptions](self, "formatDescriptions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v34, "containsObject:", formatDescription) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = *MEMORY[0x1E0CA2278];
    v21 = *MEMORY[0x1E0CA2270];
    while (v19 < objc_msgSend(v18, "count"))
    {
      v22 = (const opaqueCMFormatDescription *)objc_msgSend(v18, "objectAtIndex:", v19);
      v35[0] = v20;
      v35[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (CMFormatDescriptionEqualIgnoringExtensionKeys(v22, formatDescription, v23, 0))
        objc_msgSend(v18, "replaceObjectAtIndex:withObject:", v19, newFormatDescription);

      ++v19;
    }
    v24 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
    v25 = -[AVMutableMovieTrack trackID](self, "trackID");
    v26 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 16)
                                                                                  + 56);
    if (v26)
      v26(v24, v25, *MEMORY[0x1E0CC4908], v18);

  }
}

- (NSArray)formatDescriptions
{
  OpaqueFigMutableMovie *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  void *v7;
  CFTypeID v8;
  CFTypeID TypeID;
  CFTypeRef cf;

  cf = 0;
  v3 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v4 = -[AVMutableMovieTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 48);
  if (!v5)
    goto LABEL_6;
  v6 = v5(v3, v4, *MEMORY[0x1E0CC4908], *MEMORY[0x1E0C9AE00], &cf);
  v7 = (void *)cf;
  if (v6)
    goto LABEL_8;
  if (!cf)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSArray *)v7;
  }
  v8 = CFGetTypeID(cf);
  TypeID = CFArrayGetTypeID();
  v7 = (void *)cf;
  if (v8 != TypeID)
  {
LABEL_8:
    if (v7)
      CFRelease(v7);
    goto LABEL_6;
  }
  cf = 0;
  if (!v7)
    goto LABEL_6;
  return (NSArray *)v7;
}

- (BOOL)isCompatibleWithFormatDescription:(opaqueCMFormatDescription *)a3
{
  OpaqueFigMutableMovie *v5;
  uint64_t v6;
  unsigned int (*v7)(OpaqueFigMutableMovie *, uint64_t, opaqueCMFormatDescription *);

  v5 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v6 = -[AVMutableMovieTrack trackID](self, "trackID");
  v7 = *(unsigned int (**)(OpaqueFigMutableMovie *, uint64_t, opaqueCMFormatDescription *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 96);
  return v7 && v7(v5, v6, a3) != 0;
}

- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofTrack:(AVAssetTrack *)track atTime:(CMTime *)startTime copySampleData:(BOOL)copySampleData error:(NSError *)outError
{
  uint64_t v8;
  AVAssetTrack *v12;
  void *v13;
  char v14;
  OpaqueFigMutableMovie *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t (*v18)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *, CMTimeRange *);
  signed int v19;
  void *v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  OpaqueFigMutableMovie *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t (*v30)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t, CMTimeRange *, CMTimeRange *, uint64_t);
  NSError *v31;
  __int128 v33;
  CMTimeEpoch epoch;
  CMTimeRange v35;
  CMTimeRange v36;
  CMTimeRange duration;
  CMTimeRange start;
  uint64_t v39;
  _QWORD v40[3];

  LODWORD(v8) = copySampleData;
  v40[1] = *MEMORY[0x1E0C80C00];
  v12 = track;
  -[AVAssetTrack asset](v12, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "providesPreciseDurationAndTiming");

  if ((v14 & 1) != 0)
  {
    -[AVMutableMovieTrack willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("segments"));
    if (!-[AVAssetTrack isEqual:](self, "isEqual:", v12) || (v8 & 1) != 0)
    {
      v23 = -[AVAssetTrack _figFormatReader](v12, "_figFormatReader");
      v24 = -[AVAssetTrack _figTrackReader](v12, "_figTrackReader");
      if (!v24)
      {
        AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11838, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        v21 = 0;
        if (!outError)
          goto LABEL_23;
LABEL_17:
        if (!v21)
        {
          if (v22)
          {
            v31 = objc_retainAutorelease(v22);
LABEL_22:
            *outError = v31;
            goto LABEL_23;
          }
          if (v19)
          {
            AVLocalizedErrorWithUnderlyingOSStatus(v19, 0);
            v31 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
        }
LABEL_23:
        -[AVMutableMovieTrack didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("segments"), v33, epoch);
        goto LABEL_24;
      }
      -[AVAssetTrack asset](v12, "asset");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "_prefersNominalDurations");

      if (v26)
        v8 = v8 | 0x100;
      else
        v8 = v8;
      v27 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
      v28 = -[AVMutableMovieTrack trackID](self, "trackID");
      v29 = *(_OWORD *)&timeRange->start.epoch;
      *(_OWORD *)&duration.start.value = *(_OWORD *)&timeRange->start.value;
      *(_OWORD *)&duration.start.epoch = v29;
      *(_OWORD *)&duration.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
      v33 = *(_OWORD *)&startTime->value;
      epoch = startTime->epoch;
      v30 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t, CMTimeRange *, CMTimeRange *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 168);
      if (v30)
      {
        start = duration;
        *(_OWORD *)&v35.start.value = v33;
        v35.start.epoch = epoch;
        v19 = v30(v27, v28, v23, v24, &start, &v35, v8);
        goto LABEL_16;
      }
    }
    else
    {
      v15 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
      v16 = -[AVMutableMovieTrack trackID](self, "trackID");
      *(_OWORD *)&start.start.value = *(_OWORD *)&startTime->value;
      start.start.epoch = startTime->epoch;
      *(_OWORD *)&duration.start.value = *(_OWORD *)&timeRange->duration.value;
      duration.start.epoch = timeRange->duration.epoch;
      CMTimeRangeMake(&v36, &start.start, &duration.start);
      v17 = *(_OWORD *)&timeRange->start.epoch;
      *(_OWORD *)&v35.start.value = *(_OWORD *)&timeRange->start.value;
      *(_OWORD *)&v35.start.epoch = v17;
      *(_OWORD *)&v35.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
      v18 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *, CMTimeRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
      if (v18)
      {
        start = v36;
        duration = v35;
        v19 = v18(v15, v16, &start, &duration);
        goto LABEL_16;
      }
    }
    v19 = -12782;
LABEL_16:
    v22 = 0;
    v21 = v19 == 0;
    if (!outError)
      goto LABEL_23;
    goto LABEL_17;
  }
  if (outError)
  {
    v39 = *MEMORY[0x1E0C9AFA8];
    v40[0] = CFSTR("Source asset must have a value of YES for providesPreciseDurationAndTiming");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11838, v20);
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();

  }
  v21 = 0;
  v22 = 0;
LABEL_24:

  return v21;
}

- (void)insertEmptyTimeRange:(CMTimeRange *)timeRange
{
  OpaqueFigMutableMovie *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *);
  CMTimeRange v8;
  CMTimeRange v9;

  -[AVMutableMovieTrack willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("segments"));
  v5 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v6 = -[AVMutableMovieTrack trackID](self, "trackID");
  v8 = *timeRange;
  v7 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 120);
  if (v7)
  {
    v9 = v8;
    v7(v5, v6, &v9);
  }
  -[AVMutableMovieTrack didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("segments"), *(_OWORD *)&v8.start.value, *(_OWORD *)&v8.start.epoch, *(_OWORD *)&v8.duration.timescale);
}

- (void)removeTimeRange:(CMTimeRange *)timeRange
{
  OpaqueFigMutableMovie *v5;
  uint64_t v6;
  void (*v7)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *);
  CMTimeRange v8;
  CMTimeRange v9;

  -[AVMutableMovieTrack willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("segments"));
  v5 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v6 = -[AVMutableMovieTrack trackID](self, "trackID");
  v8 = *timeRange;
  v7 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 136);
  if (v7)
  {
    v9 = v8;
    v7(v5, v6, &v9);
  }
  -[AVMutableMovieTrack didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("segments"), *(_OWORD *)&v8.start.value, *(_OWORD *)&v8.start.epoch, *(_OWORD *)&v8.duration.timescale);
}

- (void)scaleTimeRange:(CMTimeRange *)timeRange toDuration:(CMTime *)duration
{
  OpaqueFigMutableMovie *v7;
  uint64_t v8;
  void (*v9)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *, CMTime *);
  CMTime v10;
  CMTimeRange v11;
  CMTime v12;
  CMTimeRange v13;

  -[AVMutableMovieTrack willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("segments"));
  v7 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v8 = -[AVMutableMovieTrack trackID](self, "trackID");
  v11 = *timeRange;
  v10 = *duration;
  v9 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 152);
  if (v9)
  {
    v13 = v11;
    v12 = v10;
    v9(v7, v8, &v13, &v12);
  }
  -[AVMutableMovieTrack didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("segments"), *(_OWORD *)&v10.value, v10.epoch);
}

- (BOOL)appendSampleBuffer:(CMSampleBufferRef)sampleBuffer decodeTime:(CMTime *)outDecodeTime presentationTime:(CMTime *)outPresentationTime error:(NSError *)outError
{
  uint64_t v6;
  uint64_t v7;
  CMFormatDescriptionRef FormatDescription;
  const opaqueCMFormatDescription *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  OpaqueFigMutableMovie *v28;
  uint64_t v29;
  uint64_t (*v30)(OpaqueFigMutableMovie *, uint64_t, CMSampleBufferRef, _QWORD, __int128 *, __int128 *);
  signed int v31;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  CMTimeEpoch v51;
  __int128 v52;
  CMTimeEpoch v53;

  if (!sampleBuffer)
  {
    v33 = (void *)MEMORY[0x1E0C99DA0];
    v34 = *MEMORY[0x1E0C99778];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)outDecodeTime, (uint64_t)outPresentationTime, (uint64_t)outError, v6, v7, (uint64_t)"sampleBuffer != NULL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "exceptionWithName:reason:userInfo:", v34, v35, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v41 = v36;
    goto LABEL_21;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(sampleBuffer);
  if (FormatDescription)
  {
    v15 = FormatDescription;
    -[AVAssetTrack mediaType](self, "mediaType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CMMediaTypeFromAVMediaType(v16);

    if (CMFormatDescriptionGetMediaType(v15) != v17)
    {
      v42 = (void *)MEMORY[0x1E0C99DA0];
      -[AVAssetTrack mediaType](self, "mediaType");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Media type of sample buffer must match receiver's media type (\"%@\")"), v43, v44, v45, v46, v47, (uint64_t)v35);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v48, 0);
      v41 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
      objc_exception_throw(v41);
    }
  }
  if (CMSampleBufferGetImageBuffer(sampleBuffer))
  {
    v37 = (void *)MEMORY[0x1E0C99DA0];
    v38 = *MEMORY[0x1E0C99778];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("CMSampleBuffers containing image buffers are not supported; you must provide CMSampleBuffers containing encoded video"),
      v18,
      v19,
      v20,
      v21,
      v22,
      v49);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "exceptionWithName:reason:userInfo:", v38, v35, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (FigSampleBufferGetCaptionGroup())
  {
    v39 = (void *)MEMORY[0x1E0C99DA0];
    v40 = *MEMORY[0x1E0C99778];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("CMSampleBuffers containing caption groups are not supported; you must provide CMSampleBuffers containing encoded media data"),
      v23,
      v24,
      v25,
      v26,
      v27,
      v49);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "exceptionWithName:reason:userInfo:", v40, v35, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v52 = *MEMORY[0x1E0CA2E18];
  v53 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v50 = v52;
  v51 = v53;
  v28 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v29 = -[AVMutableMovieTrack trackID](self, "trackID");
  v30 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, CMSampleBufferRef, _QWORD, __int128 *, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
  if (v30)
  {
    v31 = v30(v28, v29, sampleBuffer, 0, &v52, &v50);
    if (!outDecodeTime)
      goto LABEL_9;
    goto LABEL_8;
  }
  v31 = -12782;
  if (outDecodeTime)
  {
LABEL_8:
    *(_OWORD *)&outDecodeTime->value = v52;
    outDecodeTime->epoch = v53;
  }
LABEL_9:
  if (outPresentationTime)
  {
    *(_OWORD *)&outPresentationTime->value = v50;
    outPresentationTime->epoch = v51;
  }
  if (outError && v31)
  {
    AVLocalizedErrorWithUnderlyingOSStatus(v31, 0);
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return v31 == 0;
}

- (BOOL)insertMediaTimeRange:(CMTimeRange *)mediaTimeRange intoTimeRange:(CMTimeRange *)trackTimeRange
{
  OpaqueFigMutableMovie *v7;
  uint64_t v8;
  unsigned int (*v9)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *, CMTimeRange *);
  CMTimeRange v11;
  CMTimeRange v12;
  CMTimeRange v13;
  CMTimeRange v14;

  v7 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v8 = -[AVMutableMovieTrack trackID](self, "trackID");
  v12 = *trackTimeRange;
  v11 = *mediaTimeRange;
  v9 = *(unsigned int (**)(OpaqueFigMutableMovie *, uint64_t, CMTimeRange *, CMTimeRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
  if (!v9)
    return 0;
  v14 = v12;
  v13 = v11;
  return v9(v7, v8, &v14, &v13) == 0;
}

- (BOOL)appendMediaData:(id)a3 dataOffset:(int64_t *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int BlockBufferWithCFDataNoCopy;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  CFTypeRef cf;

  v6 = a3;
  v12 = v6;
  v18 = 0;
  cf = 0;
  if (!v6)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v7, v8, v9, v10, v11, (uint64_t)"data != nil");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v17);
  }
  objc_msgSend(v6, "length");
  BlockBufferWithCFDataNoCopy = FigCreateBlockBufferWithCFDataNoCopy();

  return BlockBufferWithCFDataNoCopy == 0;
}

- (id)availableMetadataFormats
{
  OpaqueFigMutableMovie *v3;
  uint64_t v4;
  uint64_t (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v6;
  void *v7;
  CFTypeID v8;
  CFTypeID TypeID;
  CFTypeRef cf;

  cf = 0;
  v3 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v4 = -[AVMutableMovieTrack trackID](self, "trackID");
  v5 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 48);
  if (!v5)
    goto LABEL_6;
  v6 = v5(v3, v4, *MEMORY[0x1E0CC48E0], *MEMORY[0x1E0C9AE00], &cf);
  v7 = (void *)cf;
  if (v6)
    goto LABEL_8;
  if (!cf)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  v8 = CFGetTypeID(cf);
  TypeID = CFArrayGetTypeID();
  v7 = (void *)cf;
  if (v8 != TypeID)
  {
LABEL_8:
    if (v7)
      CFRelease(v7);
    goto LABEL_6;
  }
  cf = 0;
  if (!v7)
    goto LABEL_6;
  return v7;
}

- (NSArray)metadataForFormat:(AVMetadataFormat)format
{
  NSString *v4;
  OpaqueFigTrackReader *v5;
  void *v6;
  uint64_t FigBaseObject;
  unsigned int (*v8)(uint64_t, _QWORD, _QWORD, CFArrayRef *);
  uint64_t v9;
  CFIndex Count;
  CFIndex v11;
  uint64_t v12;
  const void *ValueAtIndex;
  uint64_t v14;
  unsigned int (*v15)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  const __CFString *v29;
  CFTypeRef cf;
  CFArrayRef theArray;

  v4 = format;
  v5 = -[AVAssetTrack _figTrackReader](self, "_figTrackReader");
  v6 = 0;
  cf = 0;
  theArray = 0;
  if (v4 && v5)
  {
    FigBaseObject = FigTrackReaderGetFigBaseObject();
    v8 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
    if (!v8)
      goto LABEL_24;
    v9 = *MEMORY[0x1E0C9AE00];
    if (v8(FigBaseObject, *MEMORY[0x1E0CC61F8], *MEMORY[0x1E0C9AE00], &theArray))
      goto LABEL_24;
    if (!theArray)
    {
      v25 = 0;
      goto LABEL_29;
    }
    Count = CFArrayGetCount(theArray);
    if (Count < 1)
    {
LABEL_24:
      v6 = 0;
    }
    else
    {
      v11 = 0;
      v6 = 0;
      v12 = *MEMORY[0x1E0CC4800];
      v29 = CFSTR("org.mp4ra");
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v11);
        v14 = FigMetadataReaderGetFigBaseObject();
        v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 48);
        if (v15 && !v15(v14, v12, v9, &cf) && -[NSString isEqualToString:](v4, "isEqualToString:", cf))
        {
          +[AVMetadataEnumerator metadataEnumeratorWithMetadataReader:](AVMetadataEnumerator, "metadataEnumeratorWithMetadataReader:", ValueAtIndex);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v16, "allObjects");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "arrayWithArray:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.quicktime.udta"))
            || -[NSString isEqualToString:](v4, "isEqualToString:", v29))
          {
            v20 = -[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.quicktime.udta"), v29);
            v21 = CFSTR("udta");
            if (!v20)
              v21 = CFSTR("uiso");
            v22 = v21;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1835365473);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v19, v23, v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24 && objc_msgSend(v24, "count"))
              objc_msgSend(v19, "removeObjectsInArray:", v24);

          }
          v6 = v19;
        }
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        ++v11;
      }
      while (Count != v11);
    }
  }
  if (theArray)
    CFRelease(theArray);
  v25 = v6;
LABEL_29:
  if (cf)
    CFRelease(cf);
  if (v25)
  {
    v26 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;

  return (NSArray *)v27;
}

- (NSArray)metadata
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[AVMutableMovieTrack availableMetadataFormats](self, "availableMetadataFormats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        -[AVMutableMovieTrack metadataForFormat:](self, "metadataForFormat:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v4;
}

- (void)setMetadata:(NSArray *)metadata
{
  OpaqueFigMutableMovie *v4;
  uint64_t v5;
  void (*v6)(OpaqueFigMutableMovie *, uint64_t, _QWORD, id);
  id v7;

  +[AVMetadataItem _figMetadataPropertyFromMetadataItems:](AVMetadataItem, "_figMetadataPropertyFromMetadataItems:", metadata);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v5 = -[AVMutableMovieTrack trackID](self, "trackID");
  v6 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 56);
  if (v6)
    v6(v4, v5, *MEMORY[0x1E0CC4948], v7);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutableMovieTrackInternal->metadataWaitingSemaphore, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)addTrackAssociationToTrack:(AVMovieTrack *)movieTrack type:(AVTrackAssociationType)trackAssociationType
{
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  OpaqueFigMutableMovie *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t);
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  AVMovieTrack *v24;

  v24 = movieTrack;
  v7 = trackAssociationType;
  -[AVAssetTrack asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAssetTrack asset](v24, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("the tracks being associated must belong to the same movie"), v10, v11, v12, v13, v14, v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v22);
  }
  v15 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v16 = AVOSTypeForString(v7);
  v17 = -[AVMutableMovieTrack trackID](self, "trackID");
  v18 = -[AVAssetTrack trackID](v24, "trackID");
  v19 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 16)
                                                                                  + 184);
  if (v19)
    v19(v15, v16, v17, v18);

}

- (void)removeTrackAssociationToTrack:(AVMovieTrack *)movieTrack type:(AVTrackAssociationType)trackAssociationType
{
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  OpaqueFigMutableMovie *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t);
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  AVMovieTrack *v24;

  v24 = movieTrack;
  v7 = trackAssociationType;
  -[AVAssetTrack asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAssetTrack asset](v24, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("the tracks being dissociated must belong to the same movie"), v10, v11, v12, v13, v14, v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v22);
  }
  v15 = -[AVMutableMovieTrack _figMutableMovie](self, "_figMutableMovie");
  v16 = AVOSTypeForString(v7);
  v17 = -[AVMutableMovieTrack trackID](self, "trackID");
  v18 = -[AVAssetTrack trackID](v24, "trackID");
  v19 = *(void (**)(OpaqueFigMutableMovie *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 16)
                                                                                  + 192);
  if (v19)
    v19(v15, v16, v17, v18);

}

@end
