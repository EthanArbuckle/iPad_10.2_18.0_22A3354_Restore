@implementation AVMovie

+ (void)initialize
{
  objc_opt_class();
}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 0;
}

+ (NSArray)movieTypes
{
  if (movieTypes_makeMovieTypesArrayOnceToken != -1)
    dispatch_once(&movieTypes_makeMovieTypesArrayOnceToken, &__block_literal_global_40);
  return (NSArray *)(id)movieTypes_movieTypesArray;
}

void __21__AVMovie_movieTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("com.apple.quicktime-movie"), CFSTR("public.mpeg-4"), CFSTR("com.apple.m4v-video"), CFSTR("com.apple.m4a-audio"), CFSTR("public.3gpp"), 0);
  v1 = (void *)movieTypes_movieTypesArray;
  movieTypes_movieTypesArray = v0;

}

- (void)_startListeningToLoaderNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AVMovie _assetInspectorLoader](self, "_assetInspectorLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAsset _weakReference](self, "_weakReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", v5, figLoaderNotificationHandler, *MEMORY[0x1E0CC3688], v6, 0);
    objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", v5, figLoaderNotificationHandler, *MEMORY[0x1E0CC3680], v6, 0);

    v3 = v6;
  }

}

- (void)_stopListeningToLoaderNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AVMovie _assetInspectorLoader](self, "_assetInspectorLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAsset _weakReference](self, "_weakReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", v5, figLoaderNotificationHandler, *MEMORY[0x1E0CC3688], v6);
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", v5, figLoaderNotificationHandler, *MEMORY[0x1E0CC3680], v6);

    v3 = v6;
  }

}

- (AVMovie)init
{
  AVMovie *v2;
  AVMovie *v3;
  AVMovie *v4;
  void *v5;
  uint64_t Empty;
  AVUnreachableAssetInspectorLoader *v7;
  AVUnreachableAssetInspectorLoader *v8;
  uint64_t v9;
  AVMovieInternal *movie;
  AVMovie *v11;
  CFTypeRef v12;
  uint64_t (*v13)(CFTypeRef, uint64_t, _QWORD, CFTypeRef *);
  AVFigAssetInspectorLoader *v14;
  objc_super v16;
  CFTypeRef v17;
  CFTypeRef v18;
  CFTypeRef cf;

  v16.receiver = self;
  v16.super_class = (Class)AVMovie;
  v2 = -[AVAsset init](&v16, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_12;
  v4 = v2;
  v18 = 0;
  cf = 0;
  v17 = 0;
  _figOptionsFromAVMovieOptions(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  Empty = FigMutableMovieRemoteCreateEmpty();
  if (!(_DWORD)Empty)
  {
    v12 = cf;
    v13 = *(uint64_t (**)(CFTypeRef, uint64_t, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                            + 8);
    if (v13)
    {
      Empty = v13(v12, 1, 0, &v18);
      if (!(_DWORD)Empty)
      {
        figAssetDefaultCreationFlags();
        AVAssetShouldPreferNominalDurations(0, (uint64_t)CFSTR("AVAssetPreferNominalDurationsKey"));
        Empty = FigAssetRemoteCreateWithFormatReader();
        if (!(_DWORD)Empty)
        {
          v14 = [AVFigAssetInspectorLoader alloc];
          v7 = -[AVFigAssetInspectorLoader initWithFigAsset:forAsset:](v14, "initWithFigAsset:forAsset:", v17, v4);
          goto LABEL_4;
        }
      }
    }
    else
    {
      Empty = 4294954514;
    }
  }
  v7 = -[AVUnreachableAssetInspectorLoader initWithFigError:userInfo:]([AVUnreachableAssetInspectorLoader alloc], "initWithFigError:userInfo:", Empty, 0);
LABEL_4:
  v8 = v7;
  if (cf)
    CFRelease(cf);
  if (v18)
    CFRelease(v18);
  if (v17)
    CFRelease(v17);

  _createMovieStorageWithLoader(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  movie = v4->_movie;
  v4->_movie = (AVMovieInternal *)v9;

  if (!v4->_movie)
  {

    v11 = 0;
    goto LABEL_18;
  }
  -[AVMovie _startListeningToLoaderNotifications](v4, "_startListeningToLoaderNotifications");

LABEL_12:
  v11 = v3;
LABEL_18:

  return v11;
}

+ (AVMovie)movieWithURL:(NSURL *)URL options:(NSDictionary *)options
{
  NSURL *v5;
  NSDictionary *v6;
  void *v7;

  v5 = URL;
  v6 = options;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:options:", v5, v6);

  return (AVMovie *)v7;
}

- (AVMovie)initWithURL:(NSURL *)URL options:(NSDictionary *)options
{
  NSURL *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSDictionary *v14;
  AVMovie *v15;
  void *v16;
  AVFigAssetInspectorLoader *v17;
  AVFigAssetInspectorLoader *v18;
  uint64_t v19;
  AVMovieInternal *movie;
  uint64_t v21;
  AVMovieInternal *v22;
  NSDictionary *initializationOptions;
  AVMovie *v24;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  objc_super v30;

  v8 = URL;
  v14 = options;
  if (!v8)
  {
    v26 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)"URL != nil");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v27, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v28);
  }
  v30.receiver = self;
  v30.super_class = (Class)AVMovie;
  v15 = -[AVAsset init](&v30, sel_init);
  if (v15)
  {
    v29 = 0;
    _movieOptionsDictionaryToFigAssetOptionsDictionary(v14, &v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [AVFigAssetInspectorLoader alloc];
    v18 = -[AVFigAssetInspectorLoader initWithURL:figAssetCreationFlags:figAssetCreationOptions:avAssetInitializationOptions:forAsset:figErr:](v17, "initWithURL:figAssetCreationFlags:figAssetCreationOptions:avAssetInitializationOptions:forAsset:figErr:", v8, v29, v16, v14, v15, 0);
    _createMovieStorageWithLoader(v18);
    v19 = objc_claimAutoreleasedReturnValue();
    movie = v15->_movie;
    v15->_movie = (AVMovieInternal *)v19;

    if (!v15->_movie)
    {

      v24 = 0;
      goto LABEL_7;
    }
    -[AVMovie _startListeningToLoaderNotifications](v15, "_startListeningToLoaderNotifications");
    objc_storeStrong((id *)&v15->_movie->URL, URL);
    v21 = -[NSDictionary copy](v14, "copy");
    v22 = v15->_movie;
    initializationOptions = v22->initializationOptions;
    v22->initializationOptions = (NSDictionary *)v21;

  }
  v24 = v15;
LABEL_7:

  return v24;
}

+ (AVMovie)movieWithData:(NSData *)data options:(NSDictionary *)options
{
  NSData *v5;
  NSDictionary *v6;
  void *v7;

  v5 = data;
  v6 = options;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:options:", v5, v6);

  return (AVMovie *)v7;
}

- (AVMovie)initWithData:(NSData *)data options:(NSDictionary *)options
{
  NSData *v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  AVMovie *v14;
  void *v15;
  AVMovie *v16;
  void *v17;
  uint64_t BlockBufferWithCFDataNoCopy;
  AVFigAssetInspectorLoader *v19;
  AVUnreachableAssetInspectorLoader *v20;
  AVUnreachableAssetInspectorLoader *v21;
  uint64_t v22;
  AVMovieInternal *movie;
  uint64_t v24;
  AVMovieInternal *v25;
  NSDictionary *initializationOptions;
  AVMovie *v27;
  void *v29;
  void *v30;
  id v31;
  objc_super v32;
  uint64_t v33;
  CFTypeRef v34;
  CFTypeRef cf;

  v7 = data;
  v8 = options;
  if (!-[NSData length](v7, "length"))
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)"[data length] > 0");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v30, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v31);
  }
  v32.receiver = self;
  v32.super_class = (Class)AVMovie;
  v14 = -[AVAsset init](&v32, sel_init);
  if (!v14)
    goto LABEL_15;
  v15 = (void *)-[NSData copy](v7, "copy");

  v7 = v15;
  v16 = v14;
  v34 = 0;
  cf = 0;
  v33 = 1;
  _movieOptionsDictionaryToFigAssetOptionsDictionary(v8, &v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    BlockBufferWithCFDataNoCopy = 4294954516;
LABEL_8:
    v20 = -[AVUnreachableAssetInspectorLoader initWithFigError:userInfo:]([AVUnreachableAssetInspectorLoader alloc], "initWithFigError:userInfo:", BlockBufferWithCFDataNoCopy, 0);
    goto LABEL_9;
  }
  -[NSData length](v7, "length");
  BlockBufferWithCFDataNoCopy = FigCreateBlockBufferWithCFDataNoCopy();
  if ((_DWORD)BlockBufferWithCFDataNoCopy)
    goto LABEL_8;
  BlockBufferWithCFDataNoCopy = FigAssetRemoteCreateWithBlockBuffer();
  if ((_DWORD)BlockBufferWithCFDataNoCopy)
    goto LABEL_8;
  v19 = [AVFigAssetInspectorLoader alloc];
  v20 = -[AVFigAssetInspectorLoader initWithFigAsset:forAsset:](v19, "initWithFigAsset:forAsset:", cf, v16);
LABEL_9:
  v21 = v20;
  if (cf)
    CFRelease(cf);
  if (v34)
    CFRelease(v34);

  _createMovieStorageWithLoader(v21);
  v22 = objc_claimAutoreleasedReturnValue();
  movie = v16->_movie;
  v16->_movie = (AVMovieInternal *)v22;

  if (!v16->_movie)
  {

    v27 = 0;
    goto LABEL_17;
  }
  -[AVMovie _startListeningToLoaderNotifications](v16, "_startListeningToLoaderNotifications");
  objc_storeStrong((id *)&v16->_movie->data, v15);
  v24 = -[NSDictionary copy](v8, "copy");
  v25 = v16->_movie;
  initializationOptions = v25->initializationOptions;
  v25->initializationOptions = (NSDictionary *)v24;

LABEL_15:
  v27 = v14;
LABEL_17:

  return v27;
}

- (AVMovie)initWithData:(id)a3 contentType:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  AVMovie *v19;
  void *v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[AVMovie movieTypes](AVMovie, "movieTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v10);

  if ((v13 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v14, v15, v16, v17, v18, (uint64_t)"[[AVMovie movieTypes] containsObject:contentType]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v23);
  }
  v19 = -[AVMovie initWithData:options:](self, "initWithData:options:", v9, v11);

  return v19;
}

- (id)_initWithFigAsset:(OpaqueFigAsset *)a3
{
  AVMovie *v4;
  AVFigAssetInspectorLoader *v5;
  uint64_t v6;
  AVMovieInternal *movie;
  AVMovie *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVMovie;
  v4 = -[AVAsset init](&v10, sel_init);
  if (v4)
  {
    v5 = -[AVFigAssetInspectorLoader initWithFigAsset:forAsset:]([AVFigAssetInspectorLoader alloc], "initWithFigAsset:forAsset:", a3, v4);
    _createMovieStorageWithLoader(v5);
    v6 = objc_claimAutoreleasedReturnValue();
    movie = v4->_movie;
    v4->_movie = (AVMovieInternal *)v6;

    if (!v4->_movie)
    {

      v8 = 0;
      goto LABEL_6;
    }
    -[AVMovie _startListeningToLoaderNotifications](v4, "_startListeningToLoaderNotifications");

  }
  v8 = v4;
LABEL_6:

  return v8;
}

- (id)_initWithFormatReader:(OpaqueFigFormatReader *)a3 URL:(id)a4 data:(id)a5 options:(id)a6
{
  id v11;
  id v12;
  id v13;
  AVMovie *v14;
  AVMovie *v15;
  AVMovie *v16;
  void *v17;
  uint64_t v18;
  AVFigAssetInspectorLoader *v19;
  AVUnreachableAssetInspectorLoader *v20;
  AVUnreachableAssetInspectorLoader *v21;
  uint64_t v22;
  AVMovieInternal *movie;
  uint64_t v24;
  AVMovieInternal *v25;
  NSData *data;
  uint64_t v27;
  AVMovieInternal *v28;
  NSDictionary *initializationOptions;
  AVMovie *v30;
  objc_super v32;
  uint64_t v33;
  CFTypeRef cf;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)AVMovie;
  v14 = -[AVAsset init](&v32, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_11;
  v16 = v14;
  v33 = 0;
  cf = 0;
  _movieOptionsDictionaryToFigAssetOptionsDictionary(v13, &v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    v18 = 4294954516;
    goto LABEL_6;
  }
  v18 = FigAssetRemoteCreateWithFormatReader();
  if ((_DWORD)v18)
  {
LABEL_6:
    v20 = -[AVUnreachableAssetInspectorLoader initWithFigError:userInfo:]([AVUnreachableAssetInspectorLoader alloc], "initWithFigError:userInfo:", v18, 0);
    goto LABEL_7;
  }
  v19 = [AVFigAssetInspectorLoader alloc];
  v20 = -[AVFigAssetInspectorLoader initWithFigAsset:forAsset:](v19, "initWithFigAsset:forAsset:", cf, v16);
LABEL_7:
  v21 = v20;
  if (cf)
    CFRelease(cf);

  _createMovieStorageWithLoader(v21);
  v22 = objc_claimAutoreleasedReturnValue();
  movie = v16->_movie;
  v16->_movie = (AVMovieInternal *)v22;

  if (!v16->_movie)
  {

    v30 = 0;
    goto LABEL_13;
  }
  -[AVMovie _startListeningToLoaderNotifications](v16, "_startListeningToLoaderNotifications");
  objc_storeStrong((id *)&v16->_movie->URL, a4);
  v24 = objc_msgSend(v12, "copy");
  v25 = v16->_movie;
  data = v25->data;
  v25->data = (NSData *)v24;

  v27 = objc_msgSend(v13, "copy");
  v28 = v16->_movie;
  initializationOptions = v28->initializationOptions;
  v28->initializationOptions = (NSDictionary *)v27;

LABEL_11:
  v30 = v15;
LABEL_13:

  return v30;
}

- (id)_initWithFigError:(int)a3 userInfo:(id)a4
{
  uint64_t v4;
  id v6;
  AVMovie *v7;
  AVUnreachableAssetInspectorLoader *v8;
  uint64_t v9;
  AVMovieInternal *movie;
  AVMovie *v11;
  objc_super v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AVMovie;
  v7 = -[AVAsset init](&v13, sel_init);
  if (v7)
  {
    v8 = -[AVUnreachableAssetInspectorLoader initWithFigError:userInfo:]([AVUnreachableAssetInspectorLoader alloc], "initWithFigError:userInfo:", v4, v6);
    _createMovieStorageWithLoader(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    movie = v7->_movie;
    v7->_movie = (AVMovieInternal *)v9;

    if (!v7->_movie)
    {

      v11 = 0;
      goto LABEL_6;
    }
    -[AVMovie _startListeningToLoaderNotifications](v7, "_startListeningToLoaderNotifications");

  }
  v11 = v7;
LABEL_6:

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  OpaqueFigFormatReader *v4;
  AVMutableMovie *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = -[AVMovie _copyFormatReader](self, "_copyFormatReader", a3);
  v5 = [AVMutableMovie alloc];
  -[AVMovie URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMovie data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMovie _initializationOptions](self, "_initializationOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVMutableMovie _initWithFormatReader:URL:data:options:](v5, "_initWithFormatReader:URL:data:options:", v4, v6, v7, v8);

  if (v4)
    CFRelease(v4);
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_movie)
    -[AVMovie _stopListeningToLoaderNotifications](self, "_stopListeningToLoaderNotifications");
  v3.receiver = self;
  v3.super_class = (Class)AVMovie;
  -[AVAsset dealloc](&v3, sel_dealloc);
}

- (id)_assetInspectorLoader
{
  return self->_movie->loader;
}

- (id)_assetInspector
{
  return -[AVAssetInspectorLoader assetInspector](self->_movie->loader, "assetInspector");
}

- (Class)_classForTrackInspectors
{
  return -[AVAssetInspectorLoader _classForTrackInspectors](self->_movie->loader, "_classForTrackInspectors");
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  return -[AVAssetInspectorLoader _copyFormatReader](self->_movie->loader, "_copyFormatReader");
}

- (OpaqueFigMutableMovie)_figMutableMovie
{
  return 0;
}

- (OpaqueFigMutableMovie)_figMutableMovieFromFormatReader:(OpaqueFigFormatReader *)a3
{
  return 0;
}

- (id)_absoluteURL
{
  void *v2;
  void *v3;

  -[AVMovie URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AVMediaDataStorage)defaultMediaDataStorage
{
  return 0;
}

- (NSURL)URL
{
  return self->_movie->URL;
}

- (NSData)data
{
  return self->_movie->data;
}

- (id)_initializationOptions
{
  return self->_movie->initializationOptions;
}

- (Class)_classForMovieTracks
{
  return (Class)objc_opt_class();
}

- (NSArray)tracks
{
  AVDispatchOnce *makeTracksArrayOnce;
  _QWORD v5[5];

  makeTracksArrayOnce = self->_movie->makeTracksArrayOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __17__AVMovie_tracks__block_invoke;
  v5[3] = &unk_1E3035948;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](makeTracksArrayOnce, "runBlockOnce:", v5);
  return self->_movie->tracks;
}

void __17__AVMovie_tracks__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_assetInspector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "trackCount");

  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "_classForMovieTracks")), "_initWithAsset:trackIndex:", *(_QWORD *)(a1 + 32), i);
      if (v5)
        objc_msgSend(v9, "addObject:", v5);

    }
  }
  v6 = objc_msgSend(v9, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (AVMovieTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMovie;
  -[AVAsset trackWithTrackID:](&v4, sel_trackWithTrackID_, *(_QWORD *)&trackID);
  return (AVMovieTrack *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMovie;
  -[AVAsset tracksWithMediaType:](&v4, sel_tracksWithMediaType_, mediaType);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMovie;
  -[AVAsset tracksWithMediaCharacteristic:](&v4, sel_tracksWithMediaCharacteristic_, mediaCharacteristic);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)trackReferences
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMovie;
  -[AVAsset trackReferences](&v3, sel_trackReferences);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)referenceRestrictions
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[AVMovie _initializationOptions](self, "_initializationOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AVMovieReferenceRestrictionsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 2;

  return v4;
}

- (BOOL)canContainMovieFragments
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMovie;
  return -[AVAsset canContainFragments](&v3, sel_canContainFragments);
}

- (BOOL)containsMovieFragments
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMovie;
  return -[AVAsset containsFragments](&v3, sel_containsFragments);
}

- (BOOL)hasProtectedContent
{
  uint64_t CMBaseObject;
  uint64_t (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  CFTypeID v6;
  CFTypeID TypeID;
  BOOL v8;
  CFTypeRef cf;

  cf = 0;
  -[AVAsset _figAsset](self, "_figAsset");
  CMBaseObject = FigAssetGetCMBaseObject();
  v3 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    return 0;
  v4 = v3(CMBaseObject, *MEMORY[0x1E0CC3A68], *MEMORY[0x1E0C9AE00], &cf);
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

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isDefunct
{
  OpaqueFigAsset *v2;
  _QWORD *v3;
  unsigned int (*v4)(OpaqueFigAsset *, unsigned __int8 *);
  BOOL v5;
  int v6;
  unsigned __int8 v8;

  v8 = 0;
  v2 = -[AVAsset _figAsset](self, "_figAsset");
  v3 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v3 < 5uLL)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = (unsigned int (*)(OpaqueFigAsset *, unsigned __int8 *))v3[11];
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
  objc_storeStrong((id *)&self->_movie, 0);
}

- (OpaqueFigMutableMovie)_mutableMovieForFileType:(id)a3
{
  id v4;
  OpaqueFigFormatReader *v5;
  void *v6;

  v4 = a3;
  v5 = -[AVMovie _copyFormatReader](self, "_copyFormatReader");
  _figOptionsFromAVMovieOptions(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    FigMutableMovieRemoteCreateFromFormatReader();
    CFRelease(v5);
  }
  else if (self->_movie->data)
  {
    FigMutableMovieRemoteCreateFromData();
  }

  return 0;
}

- (NSData)movieHeaderWithFileType:(AVFileType)fileType error:(NSError *)outError
{
  NSString *v7;
  OpaqueFigMutableMovie *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  OpaqueFigMutableMovie *v14;
  OpaqueFigMutableMovie *v15;
  uint64_t (*v16)(OpaqueFigMutableMovie *, NSString *, _QWORD, _QWORD, void **);
  signed int v17;
  void *v18;
  void *v20;
  void *v21;
  id v22;
  void *v23;

  v7 = fileType;
  v23 = 0;
  v8 = -[AVMovie _figMutableMovie](self, "_figMutableMovie");
  if (!v7)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)"fileType != nil");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v22);
  }
  if (v8)
    v14 = (OpaqueFigMutableMovie *)CFRetain(v8);
  else
    v14 = -[AVMovie _mutableMovieForFileType:](self, "_mutableMovieForFileType:", v7);
  v15 = v14;
  if (!v14)
  {
    v18 = 0;
    goto LABEL_13;
  }
  v16 = *(uint64_t (**)(OpaqueFigMutableMovie *, NSString *, _QWORD, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 24);
  if (v16)
  {
    v17 = v16(v15, v7, 0, *MEMORY[0x1E0C9AE00], &v23);
    if (!outError)
      goto LABEL_12;
LABEL_10:
    if (v17)
    {
      AVLocalizedErrorWithUnderlyingOSStatus(v17, 0);
      *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  v17 = -12782;
  if (outError)
    goto LABEL_10;
LABEL_12:
  CFRelease(v15);
  v18 = v23;
LABEL_13:

  return (NSData *)v18;
}

- (BOOL)writeMovieHeaderToURL:(NSURL *)URL fileType:(AVFileType)fileType options:(AVMovieWritingOptions)options error:(NSError *)outError
{
  char v7;
  NSURL *v11;
  NSString *v12;
  OpaqueFigMutableMovie *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  OpaqueFigMutableMovie *v19;
  OpaqueFigMutableMovie *v20;
  uint64_t (*v21)(OpaqueFigMutableMovie *, NSString *, NSURL *, _QWORD, _QWORD);
  signed int v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v7 = options;
  v11 = URL;
  v12 = fileType;
  v13 = -[AVMovie _figMutableMovie](self, "_figMutableMovie");
  if (!v11)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v14, v15, v16, v17, v18, (uint64_t)"URL != nil");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!v12)
  {
    v27 = (void *)MEMORY[0x1E0C99DA0];
    AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v14, v15, v16, v17, v18, (uint64_t)"fileType != nil");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
    v28 = v26;

    objc_exception_throw(v28);
  }
  if (v13)
    v19 = (OpaqueFigMutableMovie *)CFRetain(v13);
  else
    v19 = -[AVMovie _mutableMovieForFileType:](self, "_mutableMovieForFileType:", v12);
  v20 = v19;
  if (!v19)
  {
    v22 = 0;
    goto LABEL_14;
  }
  v21 = *(uint64_t (**)(OpaqueFigMutableMovie *, NSString *, NSURL *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 16);
  if (v21)
  {
    v22 = v21(v20, v12, v11, 0, v7 & 1);
    if (!outError)
      goto LABEL_13;
LABEL_11:
    if (v22)
    {
      AVLocalizedErrorWithUnderlyingOSStatus(v22, 0);
      *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_13;
  }
  v22 = -12782;
  if (outError)
    goto LABEL_11;
LABEL_13:
  CFRelease(v20);
LABEL_14:

  return v22 == 0;
}

- (BOOL)isCompatibleWithFileType:(AVFileType)fileType
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  BOOL v16;
  uint64_t v18;
  NSString *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v19 = fileType;
  -[AVAsset _chapterTracks](self, "_chapterTracks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVMediaFileType mediaFileTypeWithFileTypeIdentifier:](AVMediaFileType, "mediaFileTypeWithFileTypeIdentifier:", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "figFormatReaderFileFormat");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[AVMovie tracks](self, "tracks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      v18 = v7;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        objc_msgSend(v10, "formatDescriptions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v12);
              objc_msgSend(v4, "containsObject:", v10);
              if (!FigMovieFormatWriterCanFileTypeSupportFormatDescription())
              {

                v16 = 0;
                v6 = v20;
                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v13)
              continue;
            break;
          }
        }

        ++v9;
        v6 = v20;
      }
      while (v9 != v18);
      v7 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v16 = 1;
    }
    while (v7);
  }
  else
  {
    v16 = 1;
  }
LABEL_19:

  return v16;
}

@end
