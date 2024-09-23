@implementation AVMutableMovie

- (AVMutableMovie)initWithURL:(id)a3 options:(id)a4
{
  return -[AVMutableMovie initWithURL:options:error:](self, "initWithURL:options:error:", a3, a4, 0);
}

- (AVMutableMovie)initWithData:(id)a3 options:(id)a4
{
  return -[AVMutableMovie initWithData:options:error:](self, "initWithData:options:error:", a3, a4, 0);
}

- (AVMutableMovie)initWithSettingsFromMovie:(id)a3 options:(id)a4
{
  return -[AVMutableMovie initWithSettingsFromMovie:options:error:](self, "initWithSettingsFromMovie:options:error:", a3, a4, 0);
}

+ (AVMutableMovie)movieWithURL:(NSURL *)URL options:(NSDictionary *)options error:(NSError *)outError
{
  NSURL *v8;
  NSDictionary *v9;
  void *v10;

  v8 = URL;
  v9 = options;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:options:error:", v8, v9, outError);

  return (AVMutableMovie *)v10;
}

- (AVMutableMovie)initWithURL:(NSURL *)URL options:(NSDictionary *)options error:(NSError *)outError
{
  NSURL *v10;
  NSDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *v17;
  void *v18;
  signed int v19;
  void *initializationOptions;
  void *v21;
  int v22;
  AVMutableMovie *v23;
  uint64_t v24;
  AVMutableMovieInternal *mutableMovieInternal;
  uint64_t v26;
  AVMutableMovieInternal *v27;
  AVMutableMovie *v28;
  void *v30;
  void *v31;
  id v32;
  objc_super v33;
  CFTypeRef cf;
  CFTypeRef v35;
  CFTypeRef v36;

  v10 = URL;
  v11 = options;
  v17 = v11;
  cf = 0;
  v35 = 0;
  v36 = 0;
  if (!v10)
  {
    v30 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v12, v13, v14, v15, v16, (uint64_t)"URL != nil");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v31, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v32);
  }
  _figOptionsFromAVMovieOptions(v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = FigMutableMovieRemoteCreateWithURL();
  if (v19 || (v19 = _configureFigObjects((uint64_t *)&cf, v17)) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v10, *MEMORY[0x1E0CB3308]);
    initializationOptions = (void *)objc_claimAutoreleasedReturnValue();
    AVLocalizedErrorWithUnderlyingOSStatus(v19, initializationOptions);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v33.receiver = self;
  v33.super_class = (Class)AVMutableMovie;
  v23 = -[AVMovie _initWithFigAsset:](&v33, sel__initWithFigAsset_, v36);
  if (v23)
  {
    _createMutableMovieStorageWithFigObjects((uint64_t)&cf);
    v24 = objc_claimAutoreleasedReturnValue();
    mutableMovieInternal = v23->_mutableMovieInternal;
    v23->_mutableMovieInternal = (AVMutableMovieInternal *)v24;

    if (v23->_mutableMovieInternal)
    {
      -[AVMutableMovie _addFigAssetNotifications](v23, "_addFigAssetNotifications");
      objc_storeStrong((id *)&v23->_mutableMovieInternal->URL, URL);
      v26 = -[NSDictionary copy](v17, "copy");
      v21 = 0;
      v27 = v23->_mutableMovieInternal;
      initializationOptions = v27->initializationOptions;
      v27->initializationOptions = (NSDictionary *)v26;
      v22 = 1;
      self = v23;
      goto LABEL_8;
    }
    v21 = 0;
    v22 = 0;
    self = v23;
  }
  else
  {
    self = 0;
    v21 = 0;
    v22 = 0;
  }
LABEL_9:
  if (cf)
    CFRelease(cf);
  if (v35)
    CFRelease(v35);
  if (v36)
    CFRelease(v36);
  if (v22)
  {
    v28 = self;
  }
  else
  {
    v28 = 0;
    if (outError)
      *outError = (NSError *)objc_retainAutorelease(v21);
  }

  return v28;
}

+ (AVMutableMovie)movieWithData:(NSData *)data options:(NSDictionary *)options error:(NSError *)outError
{
  NSData *v8;
  NSDictionary *v9;
  void *v10;

  v8 = data;
  v9 = options;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:options:error:", v8, v9, outError);

  return (AVMutableMovie *)v10;
}

- (AVMutableMovie)initWithData:(NSData *)data options:(NSDictionary *)options error:(NSError *)outError
{
  NSData *v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSDictionary *v19;
  void *v20;
  signed int v21;
  int v22;
  void *v23;
  AVMutableMovie *v24;
  uint64_t v25;
  AVMutableMovieInternal *mutableMovieInternal;
  uint64_t v27;
  AVMutableMovieInternal *v28;
  NSDictionary *initializationOptions;
  AVMutableMovie *v30;
  void *v32;
  void *v33;
  id v34;
  objc_super v35;
  CFTypeRef cf;
  CFTypeRef v37;
  CFTypeRef v38;

  v9 = data;
  v10 = options;
  cf = 0;
  v37 = 0;
  v38 = 0;
  if (!-[NSData length](v9, "length"))
  {
    v32 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v11, v12, v13, v14, v15, (uint64_t)"[data length] > 0");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v33, 0);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v34);
  }
  v16 = (void *)-[NSData copy](v9, "copy");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  v17 = *MEMORY[0x1E0CC4868];
  -[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CC4868]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v19 = (NSDictionary *)-[NSDictionary mutableCopy](v10, "mutableCopy");
    -[NSDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v17);

    v10 = v19;
  }
  _figOptionsFromAVMovieOptions(v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = FigMutableMovieRemoteCreateFromData();
  if (v21 || (v21 = _configureFigObjects((uint64_t *)&cf, v10)) != 0)
  {
    AVLocalizedErrorWithUnderlyingOSStatus(v21, 0);
    v22 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)AVMutableMovie;
    v24 = -[AVMovie _initWithFigAsset:](&v35, sel__initWithFigAsset_, v38);
    if (v24)
    {
      _createMutableMovieStorageWithFigObjects((uint64_t)&cf);
      v25 = objc_claimAutoreleasedReturnValue();
      mutableMovieInternal = v24->_mutableMovieInternal;
      v24->_mutableMovieInternal = (AVMutableMovieInternal *)v25;

      if (v24->_mutableMovieInternal)
      {
        -[AVMutableMovie _addFigAssetNotifications](v24, "_addFigAssetNotifications");
        objc_storeStrong((id *)&v24->_mutableMovieInternal->data, v16);
        v27 = -[NSDictionary copy](v10, "copy");
        v28 = v24->_mutableMovieInternal;
        initializationOptions = v28->initializationOptions;
        v28->initializationOptions = (NSDictionary *)v27;

        v23 = 0;
        v22 = 1;
      }
      else
      {
        v23 = 0;
        v22 = 0;
      }
      self = v24;
    }
    else
    {
      v23 = 0;
      v22 = 0;
      self = 0;
    }
  }
  if (cf)
    CFRelease(cf);
  if (v37)
    CFRelease(v37);
  if (v38)
    CFRelease(v38);
  if (v22)
  {
    v30 = self;
  }
  else
  {
    v30 = 0;
    if (outError)
      *outError = (NSError *)objc_retainAutorelease(v23);
  }

  return v30;
}

- (AVMutableMovie)init
{
  return -[AVMutableMovie initWithSettingsFromMovie:options:error:](self, "initWithSettingsFromMovie:options:error:", 0, 0, 0);
}

- (AVMutableMovie)initWithFileType:(id)a3 copySettingsFromMovie:(id)a4 options:(id)a5
{
  return -[AVMutableMovie initWithSettingsFromMovie:options:error:](self, "initWithSettingsFromMovie:options:error:", a4, a5, 0);
}

+ (AVMutableMovie)movieWithSettingsFromMovie:(AVMovie *)movie options:(NSDictionary *)options error:(NSError *)outError
{
  AVMovie *v7;
  NSDictionary *v8;
  void *v9;

  v7 = movie;
  v8 = options;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSettingsFromMovie:options:error:", v7, v8, outError);

  return (AVMutableMovie *)v9;
}

- (AVMutableMovie)initWithSettingsFromMovie:(AVMovie *)movie options:(NSDictionary *)options error:(NSError *)outError
{
  AVMovie *v8;
  NSDictionary *v9;
  OpaqueFigFormatReader *v10;
  void *v11;
  signed int Empty;
  int v13;
  void *v14;
  AVMutableMovie *v15;
  uint64_t v16;
  AVMutableMovieInternal *mutableMovieInternal;
  uint64_t v18;
  AVMutableMovieInternal *v19;
  NSDictionary *initializationOptions;
  AVMutableMovie *v21;
  objc_super v23;
  CFTypeRef cf;
  CFTypeRef v25;
  CFTypeRef v26;

  v8 = movie;
  v9 = options;
  cf = 0;
  v25 = 0;
  v26 = 0;
  v10 = -[AVMovie _copyFormatReader](v8, "_copyFormatReader");
  _figOptionsFromAVMovieOptions(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  Empty = FigMutableMovieRemoteCreateEmpty();
  if (Empty || (Empty = _configureFigObjects((uint64_t *)&cf, v9)) != 0)
  {
    AVLocalizedErrorWithUnderlyingOSStatus(Empty, 0);
    v13 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)AVMutableMovie;
    v15 = -[AVMovie _initWithFigAsset:](&v23, sel__initWithFigAsset_, v26);
    if (v15)
    {
      _createMutableMovieStorageWithFigObjects((uint64_t)&cf);
      v16 = objc_claimAutoreleasedReturnValue();
      mutableMovieInternal = v15->_mutableMovieInternal;
      v15->_mutableMovieInternal = (AVMutableMovieInternal *)v16;

      if (v15->_mutableMovieInternal)
      {
        -[AVMutableMovie _addFigAssetNotifications](v15, "_addFigAssetNotifications");
        v18 = -[NSDictionary copy](v9, "copy");
        v19 = v15->_mutableMovieInternal;
        initializationOptions = v19->initializationOptions;
        v19->initializationOptions = (NSDictionary *)v18;

        v14 = 0;
        v13 = 1;
      }
      else
      {
        v14 = 0;
        v13 = 0;
      }
      self = v15;
    }
    else
    {
      self = 0;
      v14 = 0;
      v13 = 0;
    }
  }
  if (cf)
    CFRelease(cf);
  if (v25)
    CFRelease(v25);
  if (v26)
    CFRelease(v26);
  if (v10)
    CFRelease(v10);
  if (v13)
  {
    v21 = self;
  }
  else
  {
    v21 = 0;
    if (outError)
      *outError = (NSError *)objc_retainAutorelease(v14);
  }

  return v21;
}

- (id)_initWithFormatReader:(OpaqueFigFormatReader *)a3 URL:(id)a4 data:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  signed int v14;
  void *initializationOptions;
  AVMutableMovie *v16;
  uint64_t v17;
  AVMutableMovieInternal *mutableMovieInternal;
  uint64_t v19;
  AVMutableMovieInternal *v20;
  NSData *data;
  uint64_t v22;
  void *v23;
  AVMutableMovieInternal *v24;
  int v25;
  int v26;
  AVMutableMovie *v27;
  objc_super v29;
  CFTypeRef cf;
  CFTypeRef v31;
  CFTypeRef v32;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  cf = 0;
  v31 = 0;
  v32 = 0;
  _figOptionsFromAVMovieOptions(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = FigMutableMovieRemoteCreateFromFormatReader();
  if (v14 || (v14 = _configureFigObjects((uint64_t *)&cf, v12)) != 0)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v10, *MEMORY[0x1E0CB3308]);
      initializationOptions = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      initializationOptions = 0;
    }
    AVLocalizedErrorWithUnderlyingOSStatus(v14, initializationOptions);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 0;
    if (v10)
      goto LABEL_10;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)AVMutableMovie;
    v16 = -[AVMovie _initWithFigAsset:](&v29, sel__initWithFigAsset_, v32);
    if (v16)
    {
      _createMutableMovieStorageWithFigObjects((uint64_t)&cf);
      v17 = objc_claimAutoreleasedReturnValue();
      mutableMovieInternal = v16->_mutableMovieInternal;
      v16->_mutableMovieInternal = (AVMutableMovieInternal *)v17;

      if (v16->_mutableMovieInternal)
      {
        -[AVMutableMovie _addFigAssetNotifications](v16, "_addFigAssetNotifications");
        objc_storeStrong((id *)&v16->_mutableMovieInternal->URL, a4);
        v19 = objc_msgSend(v11, "copy");
        v20 = v16->_mutableMovieInternal;
        data = v20->data;
        v20->data = (NSData *)v19;

        v22 = objc_msgSend(v12, "copy");
        v23 = 0;
        v24 = v16->_mutableMovieInternal;
        initializationOptions = v24->initializationOptions;
        v24->initializationOptions = (NSDictionary *)v22;
        v25 = 1;
        self = v16;
LABEL_10:

        v26 = v25;
        goto LABEL_11;
      }
      v23 = 0;
      v26 = 0;
      self = v16;
    }
    else
    {
      self = 0;
      v23 = 0;
      v26 = 0;
    }
  }
LABEL_11:
  if (cf)
    CFRelease(cf);
  if (v31)
    CFRelease(v31);
  if (v32)
    CFRelease(v32);
  if (v26)
    v27 = self;
  else
    v27 = 0;

  return v27;
}

- (id)_initWithFigAsset:(OpaqueFigAsset *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  void *v12;
  id v13;

  if (-[AVMutableMovie isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v5, v6, v7, v8, v9, (uint64_t)"![self isMemberOfClass:[AVMutableMovie class]]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }

  return 0;
}

- (id)_initWithFigError:(int)a3 userInfo:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  if (-[AVMutableMovie isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v7, v8, v9, v10, v11, (uint64_t)"![self isMemberOfClass:[AVMutableMovie class]]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  OpaqueFigMutableMovie *v4;
  unsigned int (*v5)(OpaqueFigMutableMovie *, uint64_t, _QWORD, CFTypeRef *);
  AVMovie *v6;
  CFTypeRef v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CFTypeRef cf;

  cf = 0;
  v4 = -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie", a3);
  v5 = *(unsigned int (**)(OpaqueFigMutableMovie *, uint64_t, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                            + 8);
  if (!v5 || v5(v4, 1, 0, &cf))
  {
    v11 = 0;
  }
  else
  {
    v6 = [AVMovie alloc];
    v7 = cf;
    -[AVMutableMovie URL](self, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMutableMovie data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMutableMovie _initializationOptions](self, "_initializationOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AVMovie _initWithFormatReader:URL:data:options:](v6, "_initWithFormatReader:URL:data:options:", v7, v8, v9, v10);

  }
  if (cf)
    CFRelease(cf);
  return v11;
}

- (void)_addFigAssetNotifications
{
  OpaqueFigAsset *figAsset;
  void *v4;
  id v5;

  figAsset = self->_mutableMovieInternal->figAsset;
  if (figAsset)
  {
    +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AVAsset _weakReference](self, "_weakReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v4, mutableMovieNotificationHandler, *MEMORY[0x1E0CC3680], figAsset, 0);

  }
}

- (void)_removeFigAssetNotifications
{
  OpaqueFigAsset *figAsset;
  void *v4;
  id v5;

  figAsset = self->_mutableMovieInternal->figAsset;
  if (figAsset)
  {
    +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AVAsset _weakReference](self, "_weakReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", v4, mutableMovieNotificationHandler, *MEMORY[0x1E0CC3680], figAsset);

  }
}

- (void)dealloc
{
  AVMutableMovieInternal *mutableMovieInternal;
  OpaqueFigMutableMovie *figMutableMovie;
  OpaqueFigFormatReader *formatReader;
  OpaqueFigAsset *figAsset;
  objc_super v7;

  if (self->_mutableMovieInternal)
  {
    -[AVMutableMovie _removeFigAssetNotifications](self, "_removeFigAssetNotifications");
    mutableMovieInternal = self->_mutableMovieInternal;
    figMutableMovie = mutableMovieInternal->figMutableMovie;
    if (figMutableMovie)
    {
      CFRelease(figMutableMovie);
      mutableMovieInternal = self->_mutableMovieInternal;
    }
    formatReader = mutableMovieInternal->formatReader;
    if (formatReader)
    {
      CFRelease(formatReader);
      mutableMovieInternal = self->_mutableMovieInternal;
    }
    figAsset = mutableMovieInternal->figAsset;
    if (figAsset)
      CFRelease(figAsset);
  }
  v7.receiver = self;
  v7.super_class = (Class)AVMutableMovie;
  -[AVMovie dealloc](&v7, sel_dealloc);
}

- (Class)_classForTrackInspectors
{
  return (Class)objc_opt_class();
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  objc_super v9;

  v6 = a3;
  if (-[AVMutableMovie _figMutableMovie](self, "_figMutableMovie"))
  {
    v7 = 2;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AVMutableMovie;
    v7 = -[AVAsset statusOfValueForKey:error:](&v9, sel_statusOfValueForKey_error_, v6, a4);
  }

  return v7;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  objc_super v8;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (-[AVMutableMovie _figMutableMovie](self, "_figMutableMovie"))
  {
    if (v7)
      v7[2](v7);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVMutableMovie;
    -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](&v8, sel_loadValuesAsynchronouslyForKeys_completionHandler_, v6, v7);
  }

}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

- (id)fileType
{
  return 0;
}

- (AVMediaDataStorage)defaultMediaDataStorage
{
  uint64_t FigBaseObject;
  unsigned int (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeID v4;
  AVMediaDataStorage *v5;
  AVMediaDataStorage *v6;
  CFTypeRef cf;

  cf = 0;
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v3 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v3 || v3(FigBaseObject, *MEMORY[0x1E0CC4880], *MEMORY[0x1E0C9AE00], &cf))
    goto LABEL_6;
  if (!cf)
    return (AVMediaDataStorage *)0;
  v4 = CFGetTypeID(cf);
  if (v4 == CFURLGetTypeID())
  {
    v5 = [AVMediaDataStorage alloc];
    v6 = -[AVMediaDataStorage initWithURL:options:](v5, "initWithURL:options:", cf, 0);
  }
  else
  {
LABEL_6:
    v6 = 0;
  }
  if (cf)
    CFRelease(cf);
  return v6;
}

- (id)URL
{
  return self->_mutableMovieInternal->URL;
}

- (id)data
{
  return self->_mutableMovieInternal->data;
}

- (id)_initializationOptions
{
  return self->_mutableMovieInternal->initializationOptions;
}

- (id)_mutableTracks
{
  AVDispatchOnce *makeTracksArrayOnce;
  _QWORD v5[5];

  makeTracksArrayOnce = self->_mutableMovieInternal->makeTracksArrayOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__AVMutableMovie__mutableTracks__block_invoke;
  v5[3] = &unk_1E3035948;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](makeTracksArrayOnce, "runBlockOnce:", v5);
  return self->_mutableMovieInternal->tracks;
}

void __32__AVMutableMovie__mutableTracks__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t FigBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeID v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CFTypeRef cf;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  cf = 0;
  objc_storeStrong((id *)(*(_QWORD *)(v3 + 24) + 72), v2);
  objc_msgSend(*(id *)(a1 + 32), "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v5 && !v5(FigBaseObject, *MEMORY[0x1E0CC48D0], *MEMORY[0x1E0C9AE00], &cf))
  {
    if (!cf)
      goto LABEL_20;
    v6 = CFGetTypeID(cf);
    if (v6 == CFArrayGetTypeID())
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = (id)cf;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v14;
LABEL_7:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          if (objc_msgSend(v11, "integerValue", (_QWORD)v13))
          {
            +[AVMutableMovieTrack trackWithTrackID:forMovie:](AVMutableMovieTrack, "trackWithTrackID:forMovie:");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v2, "addObject:", v12);

          }
          if (v8 == ++v10)
          {
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
            if (v8)
              goto LABEL_7;
            break;
          }
        }
      }

    }
  }
  if (cf)
    CFRelease(cf);
LABEL_20:

}

- (NSArray)tracks
{
  void *v2;
  void *v3;

  -[AVMutableMovie _mutableTracks](self, "_mutableTracks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (AVMutableMovieTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableMovie;
  -[AVMovie trackWithTrackID:](&v4, sel_trackWithTrackID_, *(_QWORD *)&trackID);
  return (AVMutableMovieTrack *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableMovie;
  -[AVMovie tracksWithMediaType:](&v4, sel_tracksWithMediaType_, mediaType);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMutableMovie;
  -[AVMovie tracksWithMediaCharacteristic:](&v4, sel_tracksWithMediaCharacteristic_, mediaCharacteristic);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)trackReferences
{
  uint64_t FigBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  void *v5;
  CFTypeID v6;
  CFTypeID TypeID;
  CFTypeRef cf;

  cf = 0;
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    goto LABEL_9;
  v4 = v3(FigBaseObject, *MEMORY[0x1E0CC48C8], *MEMORY[0x1E0C9AE00], &cf);
  v5 = (void *)cf;
  if (v4)
    goto LABEL_7;
  if (!cf)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  v6 = CFGetTypeID(cf);
  TypeID = CFDictionaryGetTypeID();
  v5 = (void *)cf;
  if (v6 != TypeID)
  {
LABEL_7:
    if (v5)
      CFRelease(v5);
    goto LABEL_9;
  }
  if (!cf)
  {
    v5 = 0;
    goto LABEL_7;
  }
  return v5;
}

- (BOOL)isModified
{
  uint64_t FigBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  CFTypeID v6;
  CFTypeID TypeID;
  BOOL v8;
  CFTypeRef cf;

  cf = 0;
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    return 0;
  v4 = v3(FigBaseObject, *MEMORY[0x1E0CC4898], *MEMORY[0x1E0C9AE00], &cf);
  v5 = cf;
  if (v4)
    goto LABEL_9;
  if (!cf)
    return 0;
  v6 = CFGetTypeID(cf);
  TypeID = CFBooleanGetTypeID();
  v5 = cf;
  if (v6 != TypeID)
  {
LABEL_9:
    v8 = 0;
    if (!v5)
      return v8;
    goto LABEL_6;
  }
  v8 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
  v5 = cf;
  if (cf)
LABEL_6:
    CFRelease(v5);
  return v8;
}

- (void)setModified:(BOOL)modified
{
  _BOOL4 v3;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, uint64_t);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = modified;
  v17 = *MEMORY[0x1E0C80C00];
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v6 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v6)
  {
    if (v3)
      v7 = *MEMORY[0x1E0C9AE50];
    else
      v7 = *MEMORY[0x1E0C9AE40];
    v6(FigBaseObject, *MEMORY[0x1E0CC4898], v7);
  }
  if (!v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[AVMutableMovie tracks](self, "tracks", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setModified:", 0);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (OpaqueFigMutableMovie)_figMutableMovie
{
  return self->_mutableMovieInternal->figMutableMovie;
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  OpaqueFigFormatReader *result;

  result = self->_mutableMovieInternal->formatReader;
  if (result)
    return (OpaqueFigFormatReader *)CFRetain(result);
  return result;
}

- (void)_signalTracksUpdated
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_mutableMovieInternal->trackWaitingSemaphore);
}

- (void)_signalMetadataUpdated
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_mutableMovieInternal->metadataWaitingSemaphore);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  uint64_t FigBaseObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t (*v6)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v7;
  CFTypeID v8;
  CFTypeID TypeID;
  CMTime v10;
  CFTypeRef cf;

  cf = 0;
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMBaseObjectGetVTable();
  v6 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)&result->var1 + 48);
  if (v6)
  {
    v7 = v6(FigBaseObject, *MEMORY[0x1E0CC48A0], *MEMORY[0x1E0C9AE00], &cf);
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)cf;
    if (!v7)
    {
      if (!cf)
        return result;
      v8 = CFGetTypeID(cf);
      TypeID = CFDictionaryGetTypeID();
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)cf;
      if (v8 == TypeID)
      {
        CMTimeMakeFromDictionary(&v10, (CFDictionaryRef)cf);
        *(_OWORD *)&retstr->var0 = *(_OWORD *)&v10.value;
        result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)cf;
        retstr->var3 = v10.epoch;
      }
    }
    if (result)
      CFRelease(result);
  }
  return result;
}

- (float)preferredRate
{
  uint64_t FigBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  CFTypeID v6;
  CFTypeID TypeID;
  float valuePtr;
  CFTypeRef cf;

  cf = 0;
  valuePtr = 1.0;
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v3)
  {
    v4 = v3(FigBaseObject, *MEMORY[0x1E0CC48B8], *MEMORY[0x1E0C9AE00], &cf);
    v5 = cf;
    if (!v4)
    {
      if (!cf)
        return valuePtr;
      v6 = CFGetTypeID(cf);
      TypeID = CFNumberGetTypeID();
      v5 = cf;
      if (v6 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat32Type, &valuePtr);
        v5 = cf;
      }
    }
    if (v5)
      CFRelease(v5);
  }
  return valuePtr;
}

- (float)preferredVolume
{
  uint64_t FigBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  CFTypeID v6;
  CFTypeID TypeID;
  float valuePtr;
  CFTypeRef cf;

  cf = 0;
  valuePtr = 1.0;
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v3)
  {
    v4 = v3(FigBaseObject, *MEMORY[0x1E0CC48C0], *MEMORY[0x1E0C9AE00], &cf);
    v5 = cf;
    if (!v4)
    {
      if (!cf)
        return valuePtr;
      v6 = CFGetTypeID(cf);
      TypeID = CFNumberGetTypeID();
      v5 = cf;
      if (v6 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberFloat32Type, &valuePtr);
        v5 = cf;
      }
    }
    if (v5)
      CFRelease(v5);
  }
  return valuePtr;
}

- (CGAffineTransform)preferredTransform
{
  uint64_t v4;
  __int128 v5;
  uint64_t FigBaseObject;
  CGAffineTransform *result;
  uint64_t (*v8)(uint64_t, _QWORD, _QWORD, CGAffineTransform **);
  int v9;
  CFTypeID v10;
  CFTypeID TypeID;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGAffineTransform *v15;

  v15 = 0;
  v4 = MEMORY[0x1E0C9BAA8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  result = (CGAffineTransform *)CMBaseObjectGetVTable();
  v8 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CGAffineTransform **))(*(_QWORD *)&result->b + 48);
  if (v8)
  {
    v9 = v8(FigBaseObject, *MEMORY[0x1E0CC48A8], *MEMORY[0x1E0C9AE00], &v15);
    result = v15;
    if (!v9)
    {
      if (!v15)
        return result;
      v10 = CFGetTypeID(v15);
      TypeID = CFArrayGetTypeID();
      result = v15;
      if (v10 == TypeID)
      {
        FigGetCGAffineTransformFrom3x3MatrixArray();
        *(_OWORD *)&retstr->a = v12;
        *(_OWORD *)&retstr->c = v13;
        *(_OWORD *)&retstr->tx = v14;
        result = v15;
      }
    }
    if (result)
      CFRelease(result);
  }
  return result;
}

- (CMTimeScale)timescale
{
  uint64_t FigBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  CFTypeID v6;
  CFTypeID TypeID;
  CMTimeScale valuePtr;
  CFTypeRef cf;

  cf = 0;
  valuePtr = 0;
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v3)
  {
    v4 = v3(FigBaseObject, *MEMORY[0x1E0CC48B0], *MEMORY[0x1E0C9AE00], &cf);
    v5 = cf;
    if (!v4)
    {
      if (!cf)
        return valuePtr;
      v6 = CFGetTypeID(cf);
      TypeID = CFNumberGetTypeID();
      v5 = cf;
      if (v6 == TypeID)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
        v5 = cf;
      }
    }
    if (v5)
      CFRelease(v5);
  }
  return valuePtr;
}

- (CMTime)interleavingPeriod
{
  uint64_t FigBaseObject;
  CMTime *result;
  uint64_t (*v6)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v7;
  CFTypeID v8;
  CFTypeID TypeID;
  CMTime v10;
  CFTypeRef cf;

  cf = 0;
  *retstr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  result = (CMTime *)CMBaseObjectGetVTable();
  v6 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)&result->timescale + 48);
  if (v6)
  {
    v7 = v6(FigBaseObject, *MEMORY[0x1E0CC4888], *MEMORY[0x1E0C9AE00], &cf);
    result = (CMTime *)cf;
    if (!v7)
    {
      if (!cf)
        return result;
      v8 = CFGetTypeID(cf);
      TypeID = CFDictionaryGetTypeID();
      result = (CMTime *)cf;
      if (v8 == TypeID)
      {
        CMTimeMakeFromDictionary(&v10, (CFDictionaryRef)cf);
        *(_OWORD *)&retstr->value = *(_OWORD *)&v10.value;
        result = (CMTime *)cf;
        retstr->epoch = v10.epoch;
      }
    }
    if (result)
      CFRelease(result);
  }
  return result;
}

- (void)setPreferredRate:(float)preferredRate
{
  double v4;
  uint64_t v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, uint64_t);

  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  *(float *)&v4 = preferredRate;
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v7 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
    v7(FigBaseObject, *MEMORY[0x1E0CC48B8], v5);
}

- (void)setPreferredVolume:(float)preferredVolume
{
  double v4;
  uint64_t v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, uint64_t);

  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  *(float *)&v4 = preferredVolume;
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v7 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
    v7(FigBaseObject, *MEMORY[0x1E0CC48C0], v5);
}

- (void)setPreferredTransform:(CGAffineTransform *)preferredTransform
{
  uint64_t v4;
  const void *v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, const void *);
  CGAffineTransform v8;

  v8 = *preferredTransform;
  v4 = FigCreate3x3MatrixArrayFromCGAffineTransform();
  if (v4)
  {
    v5 = (const void *)v4;
    -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie", *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);
    FigBaseObject = FigMutableMovieGetFigBaseObject();
    v7 = *(void (**)(uint64_t, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(FigBaseObject, *MEMORY[0x1E0CC48A8], v5);
    CFRelease(v5);
  }
}

- (void)setTimescale:(CMTimeScale)timescale
{
  uint64_t v3;
  uint64_t v4;
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, uint64_t);

  v3 = *(_QWORD *)&timescale;
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v6 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v6)
    v6(FigBaseObject, *MEMORY[0x1E0CC48B0], v4);
}

- (void)setInterleavingPeriod:(CMTime *)interleavingPeriod
{
  const __CFAllocator *v4;
  CFDictionaryRef v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, CFDictionaryRef);
  CMTime v8;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v8 = *interleavingPeriod;
  v5 = CMTimeCopyAsDictionary(&v8, v4);
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v7 = *(void (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v7)
    v7(FigBaseObject, *MEMORY[0x1E0CC4888], v5);
  if (v5)
    CFRelease(v5);
}

- (void)setDefaultMediaDataStorage:(AVMediaDataStorage *)defaultMediaDataStorage
{
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, id);
  id v6;

  -[AVMediaDataStorage URL](defaultMediaDataStorage, "URL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    v5(FigBaseObject, *MEMORY[0x1E0CC4880], v6);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AVMutableMovie defaultMediaDataStorage](self, "defaultMediaDataStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMutableMovie tracks](self, "tracks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p defaultMediaDataStorage = %@, tracks = %@ >"), v7, self, v4, v8);
  else
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p tracks = %@ >"), v7, self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isDefunct
{
  OpaqueFigMutableMovie *v2;
  _QWORD *v3;
  unsigned int (*v4)(OpaqueFigMutableMovie *, unsigned __int8 *);
  BOOL v5;
  int v6;
  unsigned __int8 v8;

  v8 = 0;
  v2 = -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  v3 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v3 < 5uLL)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = (unsigned int (*)(OpaqueFigMutableMovie *, unsigned __int8 *))v3[11];
    if (v4)
    {
      v5 = v4(v2, &v8) == 0;
      LODWORD(v4) = v8;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  if (v5)
    v6 = (int)v4;
  else
    v6 = 1;
  if (!(_DWORD)v4)
    LODWORD(v4) = v6;
  return (_DWORD)v4 == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableMovieInternal, 0);
}

- (BOOL)insertTimeRange:(CMTimeRange *)timeRange ofAsset:(AVAsset *)asset atTime:(CMTime *)startTime copySampleData:(BOOL)copySampleData error:(NSError *)outError
{
  _BOOL4 v7;
  OpaqueFigFormatReader *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  OpaqueFigMutableMovie *v25;
  __int128 v26;
  uint64_t (*v27)(OpaqueFigMutableMovie *, OpaqueFigFormatReader *, __int128 *, __int128 *, uint64_t);
  int v28;
  uint64_t (*v29)(OpaqueFigFormatReader *, uint64_t *);
  signed int v30;
  uint64_t FigBaseObject;
  uint64_t (*v32)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id j;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  char v42;
  NSError *v43;
  OpaqueFigFormatReader *v45;
  OpaqueFigFormatReader *v46;
  BOOL v47;
  AVMutableMovie *v49;
  id obj;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  CMTimeEpoch epoch;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  CFTypeRef cf;
  __int128 v76;
  CMTimeEpoch v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;
  _QWORD v85[3];

  v7 = copySampleData;
  v85[1] = *MEMORY[0x1E0C80C00];
  v49 = asset;
  -[AVMutableMovie _mutableTracks](self, "_mutableTracks");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  cf = 0;
  if (-[AVAsset providesPreciseDurationAndTiming](v49, "providesPreciseDurationAndTiming"))
  {
    v10 = -[AVMutableMovie _copyFormatReader](self, "_copyFormatReader");
    -[AVMutableMovie willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
    -[AVMutableMovie willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("tracks"));
    v11 = objc_msgSend(v51, "count");
    if (self != v49 || v7)
    {
      v46 = -[AVMutableMovie _copyFormatReader](v49, "_copyFormatReader");
      if (!v46)
      {
        AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11838, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0;
        v47 = 0;
        v30 = 0;
        goto LABEL_58;
      }
      if (-[AVAsset _prefersNominalDurations](v49, "_prefersNominalDurations"))
        v24 = v7 | 0x100u;
      else
        v24 = v7;
      v25 = -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
      v26 = *(_OWORD *)&timeRange->start.epoch;
      v66 = *(_OWORD *)&timeRange->start.value;
      v67 = v26;
      v68 = *(_OWORD *)&timeRange->duration.timescale;
      v64 = *(_OWORD *)&startTime->value;
      epoch = startTime->epoch;
      v27 = *(uint64_t (**)(OpaqueFigMutableMovie *, OpaqueFigFormatReader *, __int128 *, __int128 *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 176);
      if (v27)
      {
        v78 = v66;
        v79 = v67;
        v80 = v68;
        v76 = v64;
        v77 = epoch;
        v28 = v27(v25, v46, &v78, &v76, v24);
      }
      else
      {
        v28 = -12782;
      }
      v14 = 0;
      v47 = v28 == 0;
    }
    else
    {
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      -[AVMutableMovie tracks](self, "tracks");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      v53 = v11;
      v45 = v10;
      v14 = 0;
      if (v13)
      {
        v15 = *(_QWORD *)v71;
        v16 = 1;
        do
        {
          v17 = 0;
          v18 = v14;
          do
          {
            if (*(_QWORD *)v71 != v15)
              objc_enumerationMutation(v12);
            v19 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v17);
            v69 = v18;
            v20 = *(_OWORD *)&timeRange->start.epoch;
            v78 = *(_OWORD *)&timeRange->start.value;
            v79 = v20;
            v80 = *(_OWORD *)&timeRange->duration.timescale;
            v66 = *(_OWORD *)&startTime->value;
            *(_QWORD *)&v67 = startTime->epoch;
            v21 = objc_msgSend(v19, "insertTimeRange:ofTrack:atTime:copySampleData:error:", &v78, v19, &v66, 0, &v69, v45);
            v14 = v69;

            if (!v21)
              v16 = 0;
            ++v17;
            v18 = v14;
          }
          while (v13 != v17);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
        }
        while (v13);
      }
      else
      {
        v16 = 1;
      }

      v46 = 0;
      v47 = v16 & 1;
      v10 = v45;
      v11 = v53;
    }
    v29 = *(uint64_t (**)(OpaqueFigFormatReader *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (!v29)
      goto LABEL_56;
    v30 = v29(v10, &v74);
    if (v30)
    {
LABEL_57:
      v23 = v14;
      goto LABEL_58;
    }
    if (v11 == v74)
    {
      v30 = 0;
      goto LABEL_57;
    }
    -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
    FigBaseObject = FigMutableMovieGetFigBaseObject();
    v32 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
    if (!v32)
    {
LABEL_56:
      v30 = -12782;
      goto LABEL_57;
    }
    v30 = v32(FigBaseObject, *MEMORY[0x1E0CC48D0], *MEMORY[0x1E0C9AE00], &cf);
    if (v30)
      goto LABEL_57;
    v45 = v10;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = (id)cf;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
    if (v33)
    {
      v52 = *(_QWORD *)v61;
      do
      {
        v54 = v33;
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v61 != v52)
            objc_enumerationMutation(obj);
          v35 = objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "integerValue", v45);
          if ((_DWORD)v35)
          {
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v36 = v51;
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
            if (v37)
            {
              j = 0;
              v39 = *(_QWORD *)v57;
              while (2)
              {
                v40 = 0;
                v41 = j;
                do
                {
                  if (*(_QWORD *)v57 != v39)
                    objc_enumerationMutation(v36);
                  j = *(id *)(*((_QWORD *)&v56 + 1) + 8 * v40);

                  if (objc_msgSend(j, "trackID") == (_DWORD)v35)
                  {

                    goto LABEL_53;
                  }
                  ++v40;
                  v41 = j;
                }
                while (v37 != v40);
                v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
                if (v37)
                  continue;
                break;
              }

            }
            +[AVMutableMovieTrack trackWithTrackID:forMovie:](AVMutableMovieTrack, "trackWithTrackID:forMovie:", v35, self);
            for (j = (id)objc_claimAutoreleasedReturnValue(); !j; j = (id)objc_claimAutoreleasedReturnValue())
            {
              dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutableMovieInternal->trackWaitingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
              +[AVMutableMovieTrack trackWithTrackID:forMovie:](AVMutableMovieTrack, "trackWithTrackID:forMovie:", v35, self);
            }
            objc_msgSend(v36, "addObject:", j);
          }
          else
          {
            j = 0;
          }
LABEL_53:

        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
      }
      while (v33);
    }

    v30 = 0;
    v23 = v14;
    v10 = v45;
LABEL_58:
    if (cf)
      CFRelease(cf);
    if (v46)
      CFRelease(v46);
    if (v10)
      CFRelease(v10);
    if (outError)
      v42 = v47;
    else
      v42 = 1;
    if ((v42 & 1) != 0)
      goto LABEL_73;
    if (v23)
    {
      v43 = objc_retainAutorelease(v23);
    }
    else
    {
      if (!v30)
      {
LABEL_73:
        -[AVMutableMovie didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("tracks"), v45);
        -[AVMutableMovie didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"));
        goto LABEL_74;
      }
      AVLocalizedErrorWithUnderlyingOSStatus(v30, 0);
      v43 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    *outError = v43;
    goto LABEL_73;
  }
  if (outError)
  {
    v84 = *MEMORY[0x1E0C9AFA8];
    v85[0] = CFSTR("Source asset must have a value of YES for providesPreciseDurationAndTiming");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11838, v22);
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();

  }
  v23 = 0;
  v47 = 0;
LABEL_74:

  return v47;
}

- (void)insertEmptyTimeRange:(CMTimeRange *)timeRange
{
  OpaqueFigMutableMovie *v5;
  void (*v6)(OpaqueFigMutableMovie *, CMTimeRange *);
  CMTimeRange v7;
  CMTimeRange v8;

  -[AVMutableMovie willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
  v5 = -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  v7 = *timeRange;
  v6 = *(void (**)(OpaqueFigMutableMovie *, CMTimeRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 128);
  if (v6)
  {
    v8 = v7;
    v6(v5, &v8);
  }
  -[AVMutableMovie didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"), *(_OWORD *)&v7.start.value, *(_OWORD *)&v7.start.epoch, *(_OWORD *)&v7.duration.timescale);
}

- (void)removeTimeRange:(CMTimeRange *)timeRange
{
  OpaqueFigMutableMovie *v5;
  void (*v6)(OpaqueFigMutableMovie *, CMTimeRange *);
  CMTimeRange v7;
  CMTimeRange v8;

  -[AVMutableMovie willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
  v5 = -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  v7 = *timeRange;
  v6 = *(void (**)(OpaqueFigMutableMovie *, CMTimeRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 144);
  if (v6)
  {
    v8 = v7;
    v6(v5, &v8);
  }
  -[AVMutableMovie didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"), *(_OWORD *)&v7.start.value, *(_OWORD *)&v7.start.epoch, *(_OWORD *)&v7.duration.timescale);
}

- (void)scaleTimeRange:(CMTimeRange *)timeRange toDuration:(CMTime *)duration
{
  OpaqueFigMutableMovie *v7;
  void (*v8)(OpaqueFigMutableMovie *, CMTimeRange *, CMTime *);
  CMTime v9;
  CMTimeRange v10;
  CMTime v11;
  CMTimeRange v12;

  -[AVMutableMovie willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
  v7 = -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  v10 = *timeRange;
  v9 = *duration;
  v8 = *(void (**)(OpaqueFigMutableMovie *, CMTimeRange *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 160);
  if (v8)
  {
    v12 = v10;
    v11 = v9;
    v8(v7, &v12, &v11);
  }
  -[AVMutableMovie didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"), *(_OWORD *)&v9.value, v9.epoch);
}

- (AVMutableMovieTrack)mutableTrackCompatibleWithTrack:(AVAssetTrack *)track
{
  AVAssetTrack *v4;
  void *v5;
  void *v6;
  AVAssetTrack *v7;
  OpaqueFigMutableMovie *v8;
  uint64_t (*v9)(OpaqueFigMutableMovie *, AVAssetTrack *, int *);
  int v10;
  id v11;
  uint64_t v12;
  AVAssetTrack *i;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  int v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = track;
  -[AVMutableMovie tracks](self, "tracks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v21 = 0;
  if (!v5 || !objc_msgSend(v5, "count"))
    goto LABEL_18;
  if (objc_msgSend(v6, "containsObject:", v4))
  {
    v7 = v4;
    goto LABEL_19;
  }
  v7 = -[AVAssetTrack _figTrackReader](v4, "_figTrackReader");
  if (!v7)
    goto LABEL_19;
  v8 = -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  v9 = *(uint64_t (**)(OpaqueFigMutableMovie *, AVAssetTrack *, int *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 104);
  if (!v9)
  {
LABEL_18:
    v7 = 0;
    goto LABEL_19;
  }
  v10 = v9(v8, v7, &v21);
  v7 = 0;
  if (!v10 && v21)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v6;
    v7 = (AVAssetTrack *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v7)
    {
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; i = (AVAssetTrack *)((char *)i + 1))
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v11);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v15 = objc_msgSend(v14, "trackID", (_QWORD)v17);
          if (v15 == v21)
          {
            v7 = v14;
            goto LABEL_21;
          }
        }
        v7 = (AVAssetTrack *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_21:

  }
LABEL_19:

  return (AVMutableMovieTrack *)v7;
}

- (id)_addMutableTrackWithMediaType:(id)a3 copySettingsFromTrack:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  OpaqueFigMutableMovie *v13;
  uint64_t v14;
  uint64_t (*v15)(OpaqueFigMutableMovie *, uint64_t, id, uint64_t, int *);
  int v16;
  void *v17;
  int v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0;
  -[AVMutableMovie _mutableTracks](self, "_mutableTracks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = AVOSTypeForString(v8);
  v13 = -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  v14 = objc_msgSend(v9, "_figTrackReader");
  v15 = *(uint64_t (**)(OpaqueFigMutableMovie *, uint64_t, id, uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 32);
  if (v15)
    v16 = v15(v13, v12, v10, v14, &v19);
  else
    v16 = -12782;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutableMovieInternal->trackWaitingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v17 = 0;
  if (!v16)
  {
    if (v19)
    {
      +[AVMutableMovieTrack trackWithTrackID:forMovie:](AVMutableMovieTrack, "trackWithTrackID:forMovie:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v11, "addObject:", v17);
    }
  }

  return v17;
}

- (AVMutableMovieTrack)addMutableTrackWithMediaType:(AVMediaType)mediaType copySettingsFromTrack:(AVAssetTrack *)track options:(NSDictionary *)options
{
  NSString *v9;
  AVAssetTrack *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;

  v9 = mediaType;
  v10 = track;
  v16 = options;
  if (!v9)
  {
    v31 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v11, v12, v13, v14, v15, (uint64_t)"mediaType != nil");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v10)
  {
    -[AVAssetTrack mediaType](v10, "mediaType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSString isEqualToString:](v9, "isEqualToString:", v17);

    if (!v18)
    {
      v35 = (void *)MEMORY[0x1E0C99DA0];
      AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Can't copy settings from an AVAssetTrack with a non-matching media type"), v19, v20, v21, v22, v23, v37);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v32, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v36 = v33;

      objc_exception_throw(v36);
    }
  }
  if (-[NSDictionary count](v16, "count"))
  {
    v34 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Invalid options"), v24, v25, v26, v27, v28, v37);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[AVMutableMovie willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("tracks"));
  -[AVMutableMovie _addMutableTrackWithMediaType:copySettingsFromTrack:options:](self, "_addMutableTrackWithMediaType:copySettingsFromTrack:options:", v9, v10, v16);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMutableMovie didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("tracks"));

  return (AVMutableMovieTrack *)v29;
}

- (NSArray)addMutableTracksCopyingSettingsFromTracks:(NSArray *)existingTracks options:(NSDictionary *)options
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CFIndex v25;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t m;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t ii;
  void *v50;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSArray *v63;
  uint64_t k;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  NSArray *obj;
  NSDictionary *v71;
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
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v6 = existingTracks;
  v71 = options;
  if (!v6)
  {
    v55 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v7, v8, v9, v10, v11, (uint64_t)"existingTracks != nil");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v56, 0);
    v57 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_61;
  }
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = v6;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v93 != v13)
          objc_enumerationMutation(obj);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v52 = (void *)MEMORY[0x1E0C99DA0];
          AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v15, v16, v17, v18, v19, (uint64_t)"[track isKindOfClass:[AVAssetTrack class]]");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v53, 0);
          v54 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v54);
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
    }
    while (v12);
  }

  if (-[NSDictionary count](v71, "count"))
  {
    v58 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Invalid options"), v20, v21, v22, v23, v24, v60);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v59, 0);
    v57 = (id)objc_claimAutoreleasedReturnValue();

LABEL_61:
    objc_exception_throw(v57);
  }
  v25 = -[NSArray count](obj, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v25);
  v66 = (id)objc_claimAutoreleasedReturnValue();
  CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v25, 0, MEMORY[0x1E0C9B3A0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[AVMutableMovie willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("tracks"));
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v27 = obj;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v89;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v89 != v29)
            objc_enumerationMutation(v27);
          v31 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
          objc_msgSend(v31, "mediaType");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVMutableMovie _addMutableTrackWithMediaType:copySettingsFromTrack:options:](self, "_addMutableTrackWithMediaType:copySettingsFromTrack:options:", v32, v31, v71);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
            objc_msgSend(v26, "setObject:forKey:", v33, v31);

        }
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
      }
      while (v28);
    }

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v63 = v27;
    v61 = -[NSArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
    if (v61)
    {
      v62 = *(_QWORD *)v85;
      do
      {
        for (k = 0; k != v61; ++k)
        {
          if (*(_QWORD *)v85 != v62)
            objc_enumerationMutation(v63);
          v34 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * k);
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          v83 = 0u;
          objc_msgSend(v34, "availableTrackAssociationTypes");
          v65 = (id)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
          if (v35)
          {
            v67 = *(_QWORD *)v81;
            do
            {
              v68 = v35;
              for (m = 0; m != v68; ++m)
              {
                if (*(_QWORD *)v81 != v67)
                  objc_enumerationMutation(v65);
                v37 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * m);
                v76 = 0u;
                v77 = 0u;
                v78 = 0u;
                v79 = 0u;
                objc_msgSend(v34, "associatedTracksOfType:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
                if (v39)
                {
                  v40 = *(_QWORD *)v77;
                  do
                  {
                    for (n = 0; n != v39; ++n)
                    {
                      if (*(_QWORD *)v77 != v40)
                        objc_enumerationMutation(v38);
                      v42 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * n);
                      objc_msgSend(v26, "objectForKey:", v34);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "objectForKey:", v42);
                      v44 = objc_claimAutoreleasedReturnValue();
                      v45 = (void *)v44;
                      if (v43 && v44)
                        objc_msgSend(v43, "addTrackAssociationToTrack:type:", v44, v37);

                    }
                    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
                  }
                  while (v39);
                }

              }
              v35 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
            }
            while (v35);
          }

        }
        v61 = -[NSArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
      }
      while (v61);
    }

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v46 = v63;
    v47 = -[NSArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v72, v96, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v73;
      do
      {
        for (ii = 0; ii != v47; ++ii)
        {
          if (*(_QWORD *)v73 != v48)
            objc_enumerationMutation(v46);
          objc_msgSend(v26, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * ii));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
            objc_msgSend(v66, "addObject:", v50);

        }
        v47 = -[NSArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v72, v96, 16);
      }
      while (v47);
    }

    -[AVMutableMovie didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("tracks"));
  }
  if (v26)
    CFRelease(v26);

  return (NSArray *)v66;
}

- (void)removeTrack:(AVMovieTrack *)track
{
  void *v4;
  uint64_t v5;
  AVMutableMovie *v6;
  OpaqueFigMutableMovie *v7;
  uint64_t v8;
  unsigned int (*v9)(OpaqueFigMutableMovie *, uint64_t);
  AVMovieTrack *v10;

  v10 = track;
  -[AVMutableMovie _mutableTracks](self, "_mutableTracks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v10);
  if (!v10 || !v4 || v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    -[AVMutableMovie willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
    goto LABEL_9;
  }
  -[AVAssetTrack asset](v10, "asset");
  v6 = (AVMutableMovie *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    -[AVMutableMovie willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
    v7 = -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
    v8 = -[AVAssetTrack trackID](v10, "trackID");
    v9 = *(unsigned int (**)(OpaqueFigMutableMovie *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 40);
    if (v9 && !v9(v7, v8))
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutableMovieInternal->trackWaitingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      -[AVMutableMovie willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("tracks"));
      objc_msgSend(v4, "removeObjectAtIndex:", v5);
      -[AVMutableMovie didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("tracks"));
    }
    goto LABEL_8;
  }
LABEL_9:

}

- (id)availableMetadataFormats
{
  uint64_t FigBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  void *v5;
  CFTypeID v6;
  CFTypeID TypeID;
  CFTypeRef cf;

  cf = 0;
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    goto LABEL_6;
  v4 = v3(FigBaseObject, *MEMORY[0x1E0CC4878], *MEMORY[0x1E0C9AE00], &cf);
  v5 = (void *)cf;
  if (v4)
    goto LABEL_8;
  if (!cf)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  v6 = CFGetTypeID(cf);
  TypeID = CFArrayGetTypeID();
  v5 = (void *)cf;
  if (v6 != TypeID)
  {
LABEL_8:
    if (v5)
      CFRelease(v5);
    goto LABEL_6;
  }
  cf = 0;
  if (!v5)
    goto LABEL_6;
  return v5;
}

- (NSArray)metadataForFormat:(AVMetadataFormat)format
{
  NSString *v4;
  OpaqueFigFormatReader *v5;
  OpaqueFigFormatReader *v6;
  void *v7;
  uint64_t FigBaseObject;
  unsigned int (*v9)(uint64_t, _QWORD, _QWORD, CFArrayRef *);
  uint64_t v10;
  CFIndex Count;
  CFIndex v12;
  uint64_t v13;
  const void *ValueAtIndex;
  uint64_t v15;
  unsigned int (*v16)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  void *v17;
  id v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  id *v25;
  id v26;
  void *v27;
  void *v28;
  CFTypeRef cf;
  CFArrayRef theArray;

  v4 = format;
  v5 = -[AVMutableMovie _copyFormatReader](self, "_copyFormatReader");
  v6 = v5;
  v7 = 0;
  cf = 0;
  theArray = 0;
  if (v4 && v5)
  {
    FigBaseObject = FigFormatReaderGetFigBaseObject();
    v9 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
    if (!v9)
      goto LABEL_14;
    v10 = *MEMORY[0x1E0C9AE00];
    if (v9(FigBaseObject, *MEMORY[0x1E0CC42D8], *MEMORY[0x1E0C9AE00], &theArray))
      goto LABEL_14;
    if (!theArray)
    {
      v17 = 0;
      goto LABEL_19;
    }
    Count = CFArrayGetCount(theArray);
    if (Count < 1)
    {
LABEL_14:
      v7 = 0;
    }
    else
    {
      v12 = 0;
      v13 = *MEMORY[0x1E0CC4800];
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v12);
        v15 = FigMetadataReaderGetFigBaseObject();
        v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 48);
        if (v16)
        {
          if (!v16(v15, v13, v10, &cf) && -[NSString isEqualToString:](v4, "isEqualToString:", cf))
            break;
        }
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        if (Count == ++v12)
          goto LABEL_14;
      }
      +[AVMetadataEnumerator metadataEnumeratorWithMetadataReader:](AVMetadataEnumerator, "metadataEnumeratorWithMetadataReader:", ValueAtIndex);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v21, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "arrayWithArray:", v23);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.quicktime.udta"))
        || -[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("org.mp4ra")))
      {
        v24 = -[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.quicktime.udta"), cf);
        v25 = (id *)&AVMetadataKeySpaceQuickTimeUserData;
        if (!v24)
          v25 = (id *)&AVMetadataKeySpaceISOUserData;
        v26 = *v25;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1835365473);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v7, v27, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28 && objc_msgSend(v28, "count"))
          objc_msgSend(v7, "removeObjectsInArray:", v28);

      }
    }
  }
  if (theArray)
    CFRelease(theArray);
  v17 = v7;
LABEL_19:
  if (cf)
    CFRelease(cf);
  if (v6)
    CFRelease(v6);
  if (v17)
  {
    v18 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  return (NSArray *)v19;
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
  -[AVMutableMovie availableMetadataFormats](self, "availableMetadataFormats");
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
        -[AVMutableMovie metadataForFormat:](self, "metadataForFormat:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
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
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, id);
  id v6;

  +[AVMetadataItem _figMetadataPropertyFromMetadataItems:](AVMetadataItem, "_figMetadataPropertyFromMetadataItems:", metadata);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVMutableMovie _figMutableMovie](self, "_figMutableMovie");
  FigBaseObject = FigMutableMovieGetFigBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    v5(FigBaseObject, *MEMORY[0x1E0CC4890], v6);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mutableMovieInternal->metadataWaitingSemaphore, 0xFFFFFFFFFFFFFFFFLL);

}

@end
