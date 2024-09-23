@implementation CAMTimelapseStabilizationMovieWriter

- (CAMTimelapseStabilizationMovieWriter)init
{
  CAMTimelapseStabilizationMovieWriter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *movieWritingQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *syncQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *readingQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *decodeQueue;
  CFIndex AppIntegerValue;
  uint64_t v12;
  Boolean keyExistsAndHasValidFormat;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CAMTimelapseStabilizationMovieWriter;
  v2 = -[CAMTimelapseStabilizationMovieWriter init](&v15, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.camera.timelapse.movie.write", 0);
    movieWritingQueue = v2->__movieWritingQueue;
    v2->__movieWritingQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.camera.timelapse.movie.sync", 0);
    syncQueue = v2->__syncQueue;
    v2->__syncQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.camera.timelapse.movie.reading", 0);
    readingQueue = v2->__readingQueue;
    v2->__readingQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.camera.timelapse.movie.decode", 0);
    decodeQueue = v2->__decodeQueue;
    v2->__decodeQueue = (OS_dispatch_queue *)v9;

    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CAMTimelapseFrameLoadMode"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v12 = AppIntegerValue;
    else
      v12 = 1;
    v2->__frameLoadMode = v12;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CAMTimelapseStabilizationMovieWriter _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)CAMTimelapseStabilizationMovieWriter;
  -[CAMTimelapseStabilizationMovieWriter dealloc](&v3, sel_dealloc);
}

- (void)_cleanup
{
  __IOSurface *IOSurface;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  IOSurface = CVPixelBufferGetIOSurface(*a1);
  v4[0] = 67109120;
  v4[1] = IOSurfaceGetID(IOSurface);
  _os_log_debug_impl(&dword_1DB760000, a2, OS_LOG_TYPE_DEBUG, "Releasing IOSurface: 0x%x", (uint8_t *)v4, 8u);
  OUTLINED_FUNCTION_1_0();
}

void __48__CAMTimelapseStabilizationMovieWriter__cleanup__block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  const __CFArray *v3;
  CFIndex v4;
  CVPixelBufferRef *ValueAtIndex;
  CVPixelBufferRef *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[4];
  IOSurfaceID v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const __CFArray **)(v2 + 88);
  if (v3)
  {
    if (CFArrayGetCount(v3) >= 1)
    {
      v4 = 0;
      do
      {
        ValueAtIndex = (CVPixelBufferRef *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 88), v4);
        v6 = ValueAtIndex + 1;
        if (ValueAtIndex[1])
        {
          v7 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            __48__CAMTimelapseStabilizationMovieWriter__cleanup__block_invoke_11_cold_2(v9, v6, &v10, v7);

          CVPixelBufferRelease(*v6);
        }
        free(ValueAtIndex);
        ++v4;
      }
      while (CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 88)) > v4);
    }
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 88));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 248))
  {
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __48__CAMTimelapseStabilizationMovieWriter__cleanup__block_invoke_11_cold_1();

    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 248));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 0;
  }
}

- (void)_reset
{
  NSArray *frameFilePaths;
  NSArray *visMetadataFilePaths;
  __CFArray *Mutable;
  NSDate *movieCreationDate;
  CLLocation *movieCreationLocation;
  NSString *movieOutputPath;
  uint64_t v9;
  __int128 v10;
  AVAssetWriter *writer;
  AVOfflineVideoStabilizer *stabilizer;
  AVAssetWriterInput *videoInput;
  AVAssetWriterInputPixelBufferAdaptor *pixelBufferAdaptor;
  id completion;

  -[CAMTimelapseStabilizationMovieWriter _cleanup](self, "_cleanup");
  frameFilePaths = self->__frameFilePaths;
  self->__frameFilePaths = 0;

  visMetadataFilePaths = self->__visMetadataFilePaths;
  self->__visMetadataFilePaths = 0;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  movieCreationDate = self->__movieCreationDate;
  self->__frameList = Mutable;
  self->__movieCreationDate = 0;

  movieCreationLocation = self->__movieCreationLocation;
  self->__movieCreationLocation = 0;

  movieOutputPath = self->__movieOutputPath;
  self->__movieOutputPath = 0;

  v9 = MEMORY[0x1E0C9BAA8];
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&self->__movieTransform.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&self->__movieTransform.c = v10;
  *(_OWORD *)&self->__movieTransform.tx = *(_OWORD *)(v9 + 32);
  self->__movieFramesPerSecond = 0;
  writer = self->__writer;
  self->__writer = 0;

  stabilizer = self->__stabilizer;
  self->__stabilizer = 0;

  videoInput = self->__videoInput;
  self->__videoInput = 0;

  pixelBufferAdaptor = self->__pixelBufferAdaptor;
  self->__pixelBufferAdaptor = 0;

  self->__frameCountWrittenToMovie = 0;
  self->__nextSourceFrameIndex = 0;
  self->__nextMetadataFrameIndex = 0;
  self->__firstFrameIndex = -1;
  self->__badMetadataErrorThreshold = 0x7FFFFFFFFFFFFFFFLL;
  completion = self->__completion;
  self->__completion = 0;

}

- (void)_restartUnstabilized
{
  NSArray *frameFilePaths;
  CLLocation *movieCreationLocation;
  NSDate *movieCreationDate;
  __int128 v6;
  int64_t movieFramesPerSecond;
  _BOOL4 preferHEVC;
  id completion;
  NSString *v10;
  CLLocation *v11;
  NSDate *v12;
  NSArray *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t buf[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  frameFilePaths = self->__frameFilePaths;
  movieCreationDate = self->__movieCreationDate;
  movieCreationLocation = self->__movieCreationLocation;
  v6 = *(_OWORD *)&self->__movieTransform.c;
  v20 = *(_OWORD *)&self->__movieTransform.a;
  v21 = v6;
  v22 = *(_OWORD *)&self->__movieTransform.tx;
  movieFramesPerSecond = self->__movieFramesPerSecond;
  preferHEVC = self->__preferHEVC;
  completion = self->__completion;
  v10 = self->__movieOutputPath;
  v11 = movieCreationLocation;
  v12 = movieCreationDate;
  v13 = frameFilePaths;
  v14 = _Block_copy(completion);
  v15 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEFAULT, "Restarting timelapse movie render without stabilization...", buf, 2u);
  }

  *(_OWORD *)buf = v20;
  v18 = v21;
  v19 = v22;
  LOBYTE(v16) = preferHEVC;
  -[CAMTimelapseStabilizationMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:](self, "writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:", v13, 0, v12, v11, v10, buf, movieFramesPerSecond, v16, v14);

}

- (void)setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;

  if (self->_suspended != a3)
  {
    v3 = a3;
    self->_suspended = a3;
    if (self->__movieWritingQueue)
    {
      v5 = os_log_create("com.apple.camera", "Nebula");
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
      if (v3)
      {
        if (v6)
          -[CAMTimelapseStabilizationMovieWriter setSuspended:].cold.1();

        dispatch_suspend((dispatch_object_t)self->__movieWritingQueue);
      }
      else
      {
        if (v6)
          -[CAMTimelapseStabilizationMovieWriter setSuspended:].cold.2();

        dispatch_resume((dispatch_object_t)self->__movieWritingQueue);
      }
    }
  }
}

- (void)writeMovieFromImageFiles:(id)a3 visMetadataFiles:(id)a4 startDate:(id)a5 location:(id)a6 outputPath:(id)a7 transform:(CGAffineTransform *)a8 framesPerSecond:(int64_t)a9 preferHEVC:(BOOL)a10 completionHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  NSDate *v23;
  NSDate *movieCreationDate;
  NSString *v25;
  NSString *movieOutputPath;
  __int128 v27;
  __int128 v28;
  NSArray *v29;
  NSArray *frameFilePaths;
  NSArray *v31;
  NSArray *visMetadataFilePaths;
  NSArray *v33;
  int64_t v34;
  NSObject *v35;
  OS_dispatch_semaphore *v36;
  OS_dispatch_semaphore *semFileReader;
  OS_dispatch_semaphore *v38;
  OS_dispatch_semaphore *semFrameGetter;
  NSMutableSet *v40;
  NSMutableSet *badFrameSet;
  NSMutableSet *v42;
  NSMutableSet *badMetadataSet;
  int v44;
  __CVBuffer *v45;
  int64_t v46;
  CLLocation *movieCreationLocation;
  void *v48;
  CLLocation *v49;
  CLLocation *v50;
  void *v51;
  OSStatus v52;
  double v53;
  double v54;
  double v55;
  double v56;
  NSString *v57;
  uint64_t v58;
  uint64_t v59;
  CMVideoFormatDescriptionRef v60;
  uint64_t v61;
  __int128 v62;
  int v63;
  double Width;
  double Height;
  NSObject *v66;
  OS_dispatch_queue *v67;
  OS_dispatch_queue *pixelTransferQueue;
  OpaqueVTPixelTransferSession **p_pixelTransferSession;
  OSStatus v70;
  void *v71;
  id completion;
  int v73;
  NSObject *v74;
  void (*v75)(_QWORD *, _QWORD, __int128 *, _QWORD);
  NSObject *v76;
  uint64_t v77;
  void *v78;
  id v79;
  _QWORD *v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  __CVBuffer *v87;

  v17 = a3;
  v18 = a4;
  v82 = a5;
  v81 = a6;
  v19 = a7;
  v20 = a11;
  v21 = v17;
  v22 = objc_msgSend(v17, "count");
  v87 = 0;
  formatDescriptionOut = 0;
  -[CAMTimelapseStabilizationMovieWriter _reset](self, "_reset");
  if (v22 < 1)
  {
    v51 = 0;
    v73 = -1;
LABEL_29:
    v74 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseStabilizationMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:].cold.1(v73, v74);

    -[CAMTimelapseStabilizationMovieWriter _reset](self, "_reset");
    if (v20)
    {
      v75 = (void (*)(_QWORD *, _QWORD, __int128 *, _QWORD))v20[2];
      v83 = *MEMORY[0x1E0CA2E68];
      *(_QWORD *)&v84 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v75(v20, 0, &v83, 0);
    }
    goto LABEL_33;
  }
  v23 = (NSDate *)objc_msgSend(v82, "copy");
  movieCreationDate = self->__movieCreationDate;
  self->__movieCreationDate = v23;

  objc_storeStrong((id *)&self->__movieCreationLocation, a6);
  v25 = (NSString *)objc_msgSend(v19, "copy");
  movieOutputPath = self->__movieOutputPath;
  self->__movieOutputPath = v25;

  v27 = *(_OWORD *)&a8->a;
  v28 = *(_OWORD *)&a8->tx;
  *(_OWORD *)&self->__movieTransform.c = *(_OWORD *)&a8->c;
  *(_OWORD *)&self->__movieTransform.tx = v28;
  *(_OWORD *)&self->__movieTransform.a = v27;
  self->__movieFramesPerSecond = a9;
  self->__preferHEVC = a10;
  v29 = (NSArray *)objc_msgSend(v21, "copy");
  frameFilePaths = self->__frameFilePaths;
  self->__frameFilePaths = v29;

  v31 = (NSArray *)objc_msgSend(v18, "copy");
  visMetadataFilePaths = self->__visMetadataFilePaths;
  self->__visMetadataFilePaths = v31;

  v33 = self->__visMetadataFilePaths;
  if (v33 && -[NSArray count](v33, "count"))
  {
    v34 = vcvtms_s32_f32((float)v22 * 0.05);
    if (v34 <= 1)
      v34 = 1;
    if (v22 < (unint64_t)v34)
      v34 = v22;
    self->__badMetadataErrorThreshold = v34;
    v35 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[CAMTimelapseStabilizationMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:].cold.4();

  }
  v80 = v20;
  v36 = (OS_dispatch_semaphore *)dispatch_semaphore_create(-[CAMTimelapseStabilizationMovieWriter _frameLoadMode](self, "_frameLoadMode") != 0);
  semFileReader = self->__semFileReader;
  self->__semFileReader = v36;

  v38 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semFrameGetter = self->__semFrameGetter;
  self->__semFrameGetter = v38;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v40 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  badFrameSet = self->__badFrameSet;
  self->__badFrameSet = v40;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v42 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  badMetadataSet = self->__badMetadataSet;
  self->__badMetadataSet = v42;

  -[CAMTimelapseStabilizationMovieWriter _startAsyncDecoding](self, "_startAsyncDecoding");
  v44 = -[CAMTimelapseStabilizationMovieWriter _copySourcePixelBufferForNextFrame:skipBadFrames:](self, "_copySourcePixelBufferForNextFrame:skipBadFrames:", &v87, 1);
  if (v44)
  {
    v73 = v44;
    v51 = 0;
  }
  else
  {
    v45 = v87;
    v46 = self->__nextSourceFrameIndex - 1;
    self->__nextSourceFrameIndex = v46;
    self->__nextMetadataFrameIndex = v46;
    self->__firstFrameIndex = v46;
    self->__stashedSourceFrame = v45;
    movieCreationLocation = self->__movieCreationLocation;
    if (!movieCreationLocation)
    {
      -[NSArray objectAtIndex:](self->__frameFilePaths, "objectAtIndex:", v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMNebulaUtilities locationFromJPEGAtPath:](CAMNebulaUtilities, "locationFromJPEGAtPath:", v48);
      v49 = (CLLocation *)objc_claimAutoreleasedReturnValue();
      v50 = self->__movieCreationLocation;
      self->__movieCreationLocation = v49;

      movieCreationLocation = self->__movieCreationLocation;
    }
    +[CAMPersistenceController clientVideoMetadataForLocation:withCreationDate:](CAMPersistenceController, "clientVideoMetadataForLocation:withCreationDate:", movieCreationLocation, self->__movieCreationDate);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = CMVideoFormatDescriptionCreateForImageBuffer(0, self->__stashedSourceFrame, &formatDescriptionOut);
    if (v52)
    {
      v73 = v52;
    }
    else
    {
      v78 = v21;
      v79 = v19;
      objc_msgSend((id)objc_opt_class(), "_desiredOutputSizeForSourcePixelBuffer:", self->__stashedSourceFrame);
      v54 = v53;
      v56 = v55;
      v57 = self->__movieOutputPath;
      v58 = (uint64_t)v53;
      v59 = (uint64_t)v55;
      v60 = formatDescriptionOut;
      v61 = objc_msgSend(v18, "count");
      v62 = *(_OWORD *)&self->__movieTransform.c;
      v83 = *(_OWORD *)&self->__movieTransform.a;
      v84 = v62;
      v85 = *(_OWORD *)&self->__movieTransform.tx;
      LOBYTE(v77) = a10;
      v63 = -[CAMTimelapseStabilizationMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:](self, "_startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:", v57, v58, v59, v60, &v83, a9, v22, v77, v61, v51);
      if (v63)
      {
        v73 = v63;
        v21 = v78;
        v19 = v79;
        v20 = v80;
      }
      else
      {
        v21 = v78;
        v19 = v79;
        v20 = v80;
        if (self->__stabilizer)
          goto LABEL_24;
        Width = (double)CVPixelBufferGetWidth(self->__stashedSourceFrame);
        Height = (double)CVPixelBufferGetHeight(self->__stashedSourceFrame);
        if (v54 == Width && v56 == Height)
          goto LABEL_24;
        v66 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          -[CAMTimelapseStabilizationMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:].cold.3(v66, Width, Height, v54, v56);

        v67 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.camera.timelapse.movie.framecrop", 0);
        pixelTransferQueue = self->__pixelTransferQueue;
        self->__pixelTransferQueue = v67;

        if (!self->__pixelTransferQueue)
        {
          v76 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            -[CAMTimelapseStabilizationMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:].cold.2();

          goto LABEL_25;
        }
        p_pixelTransferSession = &self->__pixelTransferSession;
        v70 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &self->__pixelTransferSession);
        if (!v70)
        {
          VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x1E0CED800], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
          v70 = VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x1E0CED848], (CFTypeRef)*MEMORY[0x1E0CEDB30]);
          if (!v70)
          {
LABEL_24:
            v71 = (void *)objc_msgSend(v80, "copy");
            completion = self->__completion;
            self->__completion = v71;

            -[CAMTimelapseStabilizationMovieWriter _writeMovieAsynchronously](self, "_writeMovieAsynchronously");
LABEL_25:
            v73 = 0;
            goto LABEL_26;
          }
        }
        v73 = v70;
      }
    }
  }
LABEL_26:
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  if (v73)
    goto LABEL_29;
LABEL_33:

}

- (__CVBuffer)_cropPixelBufferIfNeeded:(__CVBuffer *)a3
{
  __CVPixelBufferPool *v5;
  CVReturn v6;
  size_t Width;
  size_t Height;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *pixelTransferQueue;
  NSObject *v16;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  pixelBufferOut = 0;
  if (self->__pixelTransferSession)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v5 = -[AVAssetWriterInputPixelBufferAdaptor pixelBufferPool](self->__pixelBufferAdaptor, "pixelBufferPool");
    if (v5)
    {
      v6 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, &pixelBufferOut);
      *((_DWORD *)v19 + 6) = v6;
      if (!v6)
      {
        Width = CVPixelBufferGetWidth(pixelBufferOut);
        Height = CVPixelBufferGetHeight(pixelBufferOut);
        v23[0] = *MEMORY[0x1E0CA8D60];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)Width);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v9;
        v23[1] = *MEMORY[0x1E0CA8D40];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)Height);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *MEMORY[0x1E0CA8D48];
        v24[1] = v10;
        v24[2] = &unk_1EA3B0FB8;
        v12 = *MEMORY[0x1E0CA8D58];
        v23[2] = v11;
        v23[3] = v12;
        v24[3] = &unk_1EA3B0FB8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        CVBufferSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8D50], v13, kCVAttachmentMode_ShouldNotPropagate);
        pixelTransferQueue = self->__pixelTransferQueue;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __65__CAMTimelapseStabilizationMovieWriter__cropPixelBufferIfNeeded___block_invoke;
        v17[3] = &unk_1EA32DF90;
        v17[4] = self;
        v17[5] = &v18;
        v17[6] = a3;
        v17[7] = pixelBufferOut;
        dispatch_sync(pixelTransferQueue, v17);
        if (!*((_DWORD *)v19 + 6))
        {
          CVPixelBufferRelease(a3);
          a3 = pixelBufferOut;
          pixelBufferOut = 0;
        }

      }
    }
    else
    {
      v16 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CAMTimelapseStabilizationMovieWriter _cropPixelBufferIfNeeded:].cold.1();

    }
    _Block_object_dispose(&v18, 8);
  }
  CVPixelBufferRelease(pixelBufferOut);
  return a3;
}

uint64_t __65__CAMTimelapseStabilizationMovieWriter__cropPixelBufferIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(*(_QWORD *)(a1 + 32) + 224), *(CVPixelBufferRef *)(a1 + 48), *(CVPixelBufferRef *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (__CVBuffer)_decodeFirstFrameAgain
{
  void *v2;
  id v3;
  __CVBuffer *v4;
  NSObject *v6;

  -[NSArray objectAtIndex:](self->__frameFilePaths, "objectAtIndex:", self->__firstFrameIndex);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CAMTimelapseJPEGReader newDataFromFilePath:](CAMTimelapseJPEGReader, "newDataFromFilePath:", v2);
  if (!v3)
  {
    v6 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseStabilizationMovieWriter _decodeFirstFrameAgain].cold.1();
    goto LABEL_8;
  }
  v4 = +[CAMTimelapseJPEGReader createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:](CAMTimelapseJPEGReader, "createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:", v3, 0, 0, 0);
  if (!v4)
  {
    v6 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseStabilizationMovieWriter _decodeFirstFrameAgain].cold.2();
LABEL_8:

    v4 = 0;
  }

  return v4;
}

- (void)_startAsyncDecoding
{
  pl_dispatch_async();
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2 && objc_msgSend(v2, "count"))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
    v4 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_6();

    v5 = 0;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = (void *)MEMORY[0x1DF0B55E8]();
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 80), 0xFFFFFFFFFFFFFFFFLL);
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      if (!v8)
      {
        v11 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_3(buf, &buf[1]);
        goto LABEL_22;
      }
      objc_msgSend(v8, "objectAtIndex:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v21 = v5;
        v22 = 2114;
        v23 = v9;
        _os_log_debug_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEBUG, "Reading frame %ld from disk: %{public}@", buf, 0x16u);
      }

      v11 = +[CAMTimelapseJPEGReader newDataFromFilePath:](CAMTimelapseJPEGReader, "newDataFromFilePath:", v9);
      v12 = malloc_type_malloc(0x18uLL, 0x102004061A0B540uLL);
      if (!v12)
      {
        v18 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_4(buf, &buf[1]);

LABEL_22:
        objc_autoreleasePoolPop(v7);
        goto LABEL_14;
      }
      v13 = v12;
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(NSObject **)(v14 + 40);
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_19;
      block[3] = &unk_1EA32B498;
      block[5] = v13;
      block[6] = v5;
      block[4] = v14;
      dispatch_sync(v15, block);
      pl_dispatch_async();
      ++v5;

      objc_autoreleasePoolPop(v7);
    }
    while (v5 < v3);
    v16 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_5();
  }
  else
  {
    v16 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_2();
  }

LABEL_14:
  v17 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_1();

}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_19(_QWORD *a1)
{
  _QWORD *v2;
  _BYTE *v3;
  NSObject *v4;

  v2 = (_QWORD *)a1[5];
  *v2 = a1[6];
  v2[1] = 0;
  v3 = (_BYTE *)a1[5];
  v3[16] = 0;
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1[4] + 88), v3);
  if (!*(_QWORD *)(a1[4] + 248))
  {
    v4 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_19_cold_1();

    *(_QWORD *)(a1[4] + 248) = CPPowerAssertionCreate();
  }
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_22(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  __CVBuffer *v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[7];
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_22_cold_2(a1, v2);

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = +[CAMTimelapseJPEGReader createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:](CAMTimelapseJPEGReader, "createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:", v3, 0, 0, 0);
    v5 = (uint64_t)v4;
    if (*(_QWORD *)(a1 + 32))
    {
      v6 = 0;
      if (v4)
        goto LABEL_15;
    }
  }
  else
  {
    v5 = 0;
  }
  v7 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    v16 = v8;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Failed to read/decode frame %ld", buf, 0xCu);
  }

  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) != -1)
  {
    v9 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_22_cold_1();

    v5 = objc_msgSend(*(id *)(a1 + 40), "_decodeFirstFrameAgain");
  }
  v6 = 1;
LABEL_15:
  v10 = objc_msgSend(*(id *)(a1 + 40), "_cropPixelBufferIfNeeded:", v5);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(NSObject **)(v11 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_23;
  v13[3] = &unk_1EA32BFF0;
  v13[5] = *(_QWORD *)(a1 + 56);
  v13[6] = v10;
  v14 = v6;
  v13[4] = v11;
  dispatch_sync(v12, v13);
}

_QWORD *__59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_23(uint64_t a1)
{
  CVPixelBufferRef *v2;
  _QWORD **v3;
  _QWORD *result;
  NSObject *v5;

  v2 = (CVPixelBufferRef *)(a1 + 48);
  v3 = (_QWORD **)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) = *(_QWORD *)(a1 + 48);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 16) = *(_BYTE *)(a1 + 56);
  result = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 88), 0);
  if (**v3 == *result)
  {
    v5 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_23_cold_1((uint64_t)v3, v2);

    return (_QWORD *)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 72));
  }
  return result;
}

- (void)_writeMovieAsynchronously
{
  AVAssetWriterInput *videoInput;
  OS_dispatch_queue *movieWritingQueue;
  _QWORD v4[6];
  _QWORD v5[4];

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  videoInput = self->__videoInput;
  movieWritingQueue = self->__movieWritingQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke;
  v4[3] = &unk_1EA32AB70;
  v4[4] = self;
  v4[5] = v5;
  -[AVAssetWriterInput requestMediaDataWhenReadyOnQueue:usingBlock:](videoInput, "requestMediaDataWhenReadyOnQueue:usingBlock:", movieWritingQueue, v4);
  _Block_object_dispose(v5, 8);
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke(uint64_t a1, __n128 a2)
{
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  __IOSurface *v16;
  IOSurfaceID v17;
  CFTypeRef v18;
  __IOSurface *IOSurface;
  IOSurfaceID ID;
  NSObject *v21;
  NSObject *v22;
  __n128 v23;
  _QWORD v24[5];
  char v25;
  _BYTE v26[7];
  _QWORD block[4];
  __int128 v28;
  uint64_t *v29;
  CMSampleBufferRef sbuf;
  CFTypeRef cf;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  CFTypeRef v37;
  __int16 v38;
  IOSurfaceID v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 8))
  {
    a2.n128_u64[0] = 134218240;
    v23 = a2;
    while (1)
    {
      if (!objc_msgSend(*(id *)(v3 + 144), "isReadyForMoreMediaData", *(_OWORD *)&v23))
        return;
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0;
      cf = 0;
      v4 = *(_QWORD **)(a1 + 32);
      if (!v4[16])
        break;
      sbuf = 0;
      v5 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_5();

      v6 = objc_msgSend(*(id *)(a1 + 32), "_copyNextSampleBufferFromStabilizer:", &sbuf);
      if (sbuf)
      {
        cf = CMSampleBufferGetImageBuffer(sbuf);
        v7 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v18 = cf;
          IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)cf);
          ID = IOSurfaceGetID(IOSurface);
          *(_DWORD *)buf = v23.n128_u32[0];
          v37 = v18;
          v38 = 1024;
          v39 = ID;
          _os_log_debug_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEBUG, "Got frame %p (Surface ID 0x%d) from stabilizer", buf, 0x12u);
        }

        CFRetain(cf);
        CFRelease(sbuf);
      }
      if (!v6)
        goto LABEL_15;
LABEL_19:
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (cf)
      {
        v10 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v16 = CVPixelBufferGetIOSurface((CVPixelBufferRef)cf);
          v17 = IOSurfaceGetID(v16);
          *(_DWORD *)buf = 67109120;
          LODWORD(v37) = v17;
          _os_log_debug_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEBUG, "Releasing IOSurface: 0x%x", buf, 8u);
        }

        CFRelease(cf);
      }
      switch(v6)
      {
        case -3:
          v12 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_1(&v25, v26);

          v11 = 1;
          break;
        case -8:
          v22 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_3();

          objc_msgSend(*(id *)(a1 + 32), "_finishMovieWithFailure");
          goto LABEL_47;
        case -7:
          v21 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_2();

          objc_msgSend(*(id *)(a1 + 32), "_finishMovieWithRestartUnstabilized");
LABEL_47:
          _Block_object_dispose(&v32, 8);
          return;
        default:
          v11 = 0;
          break;
      }
      v13 = objc_msgSend(*(id *)(a1 + 32), "_frameLoadMode");
      if (v13 == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "_requestNextFrameReadDecode");
      }
      else if (v13 == 1)
      {
        v14 = *(_QWORD **)(a1 + 32);
        if (!v14[16])
          objc_msgSend(v14, "_requestNextFrameReadDecode");
      }
      _Block_object_dispose(&v32, 8);
      v3 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v3 + 8))
        v15 = 1;
      else
        v15 = v11;
      if ((v15 & 1) != 0)
      {
        if (v11)
        {
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_25;
          v24[3] = &unk_1EA32DFE0;
          v24[4] = v3;
          objc_msgSend((id)v3, "_finishMovieWithCompletionHandler:", v24);
        }
        return;
      }
    }
    v6 = objc_msgSend(v4, "_copySourcePixelBufferForNextFrame:skipBadFrames:", &cf, 1);
    if (v6)
      goto LABEL_19;
LABEL_15:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_24;
    block[3] = &unk_1EA32B500;
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v28 = *(_OWORD *)(a1 + 32);
    v29 = &v32;
    dispatch_sync(v8, block);
    if (!*((_BYTE *)v33 + 24))
    {
      v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_4();

      objc_msgSend(*(id *)(a1 + 32), "_appendPixelBufferToMovie:", cf);
    }
    goto LABEL_19;
  }
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_24(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  v2 = *(void **)(a1[4] + 200);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v3);

  if ((_DWORD)v2)
  {
    v4 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_24_cold_1();

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  CMTimeValue v8;
  void *v9;
  _QWORD *v10;
  void (*v11)(_QWORD *, uint64_t, CMTime *, id);
  CMTime v12;
  CMTime buf;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 160);
    objc_msgSend(*(id *)(v7 + 136), "outputURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.value) = 134218242;
    *(CMTimeValue *)((char *)&buf.value + 4) = v8;
    LOWORD(buf.flags) = 2114;
    *(_QWORD *)((char *)&buf.flags + 2) = v9;
    _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Movie write of %ld frame(s) is complete: %{public}@", (uint8_t *)&buf, 0x16u);

  }
  v10 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 240));
  memset(&buf, 0, sizeof(buf));
  if ((_DWORD)a2)
    CMTimeMake(&buf, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 120));
  else
    buf = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  objc_msgSend(*(id *)(a1 + 32), "_reset");
  if (v10)
  {
    v11 = (void (*)(_QWORD *, uint64_t, CMTime *, id))v10[2];
    v12 = buf;
    v11(v10, a2, &v12, v5);
  }

}

- (int)_copyNextSampleBufferFromStabilizer:(opaqueCMSampleBuffer *)a3
{
  __int128 v3;
  unint64_t v5;
  int v6;
  opaqueCMSampleBuffer *v7;
  AVOfflineVideoStabilizer *stabilizer;
  id v9;
  os_log_t v10;
  int64_t v11;
  NSObject *v12;
  NSObject *syncQueue;
  int v14;
  NSObject *v15;
  int64_t badMetadataErrorThreshold;
  int64_t *p_nextSourceFrameIndex;
  unint64_t nextSourceFrameIndex;
  NSObject *v20;
  __int128 v22;
  _QWORD block[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  id v29;
  uint8_t buf[4];
  int64_t v31;
  uint64_t v32;

  v5 = 0;
  v6 = 0;
  v32 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3 = 134217984;
  v22 = v3;
  while (1)
  {
    v7 = (opaqueCMSampleBuffer *)v5;
    if (v5)
    {
LABEL_16:
      *a3 = v7;
      return v6;
    }
    stabilizer = self->__stabilizer;
    v29 = 0;
    v5 = -[AVOfflineVideoStabilizer copyStabilizedSampleBuffer:](stabilizer, "copyStabilizedSampleBuffer:", &v29);
    v9 = v29;
    if (!(v5 | (unint64_t)v9))
      break;
    v10 = (os_log_t)v9;
    if (!v5 && objc_msgSend(v9, "code") == -11822)
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x2020000000;
      v28 = 0;
      v11 = self->__nextMetadataFrameIndex - 1;
      v12 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v22;
        v31 = v11;
        _os_log_debug_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEBUG, "Stabilizer rejected metadata for frame %ld", buf, 0xCu);
      }

      syncQueue = self->__syncQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76__CAMTimelapseStabilizationMovieWriter__copyNextSampleBufferFromStabilizer___block_invoke;
      block[3] = &unk_1EA32E008;
      block[5] = &v25;
      block[6] = v11;
      block[4] = self;
      dispatch_sync(syncQueue, block);
      v14 = *((unsigned __int8 *)v26 + 24);
      if (*((_BYTE *)v26 + 24))
      {
        v15 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          badMetadataErrorThreshold = self->__badMetadataErrorThreshold;
          *(_DWORD *)buf = v22;
          v31 = badMetadataErrorThreshold;
          _os_log_error_impl(&dword_1DB760000, v15, OS_LOG_TYPE_ERROR, "Encountered %ld frames bad metadata; aborting...",
            buf,
            0xCu);
        }

        v6 = -7;
      }
      _Block_object_dispose(&v25, 8);
      if (v14)
        goto LABEL_16;
      v10 = 0;
    }
    if (v10)
    {
      v20 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[CAMTimelapseStabilizationMovieWriter _copyNextSampleBufferFromStabilizer:].cold.2();

      *a3 = (opaqueCMSampleBuffer *)v5;
      v6 = -7;
LABEL_21:

      return v6;
    }
  }
  *a3 = 0;
  nextSourceFrameIndex = self->__nextSourceFrameIndex;
  p_nextSourceFrameIndex = &self->__nextSourceFrameIndex;
  if (nextSourceFrameIndex < objc_msgSend((id)*(p_nextSourceFrameIndex - 19), "count", v22))
  {
    v10 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseStabilizationMovieWriter _copyNextSampleBufferFromStabilizer:].cold.1((uint64_t)p_nextSourceFrameIndex, (id *)p_nextSourceFrameIndex - 19);
    v6 = -8;
    goto LABEL_21;
  }
  return -3;
}

unint64_t __76__CAMTimelapseStabilizationMovieWriter__copyNextSampleBufferFromStabilizer___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  unint64_t result;

  v2 = *(void **)(a1[4] + 208);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  result = objc_msgSend(*(id *)(a1[4] + 208), "count");
  if (result > *(_QWORD *)(a1[4] + 216))
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  return result;
}

- (void)_requestNextFrameReadDecode
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->__syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CAMTimelapseStabilizationMovieWriter__requestNextFrameReadDecode__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

intptr_t __67__CAMTimelapseStabilizationMovieWriter__requestNextFrameReadDecode__block_invoke(intptr_t result)
{
  intptr_t v1;
  NSObject *v2;

  if (!*(_QWORD *)(*(_QWORD *)(result + 32) + 192))
  {
    v1 = result;
    v2 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __67__CAMTimelapseStabilizationMovieWriter__requestNextFrameReadDecode__block_invoke_cold_1();

    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(v1 + 32) + 80));
  }
  return result;
}

- (int)_copySourcePixelBufferForNextFrame:(__CVBuffer *)a3 skipBadFrames:(BOOL)a4
{
  uint64_t v7;
  uint64_t *v8;
  NSArray *frameFilePaths;
  unint64_t nextSourceFrameIndex;
  NSObject *syncQueue;
  NSArray *v12;
  unint64_t v13;
  NSObject *v14;
  int64_t v15;
  __CVBuffer *v16;
  int v17;
  _QWORD block[8];
  BOOL v20;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  __CVBuffer *stashedSourceFrame;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  uint8_t buf[4];
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  stashedSourceFrame = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  if (a3)
  {
    if (self->__stashedSourceFrame)
    {
      stashedSourceFrame = self->__stashedSourceFrame;
      self->__stashedSourceFrame = 0;
    }
    else
    {
      v7 = MEMORY[0x1E0C809B0];
      do
      {
        v8 = v27;
        if (*((_DWORD *)v27 + 6))
          break;
        frameFilePaths = self->__frameFilePaths;
        if (!frameFilePaths)
          goto LABEL_21;
        nextSourceFrameIndex = self->__nextSourceFrameIndex;
        if (nextSourceFrameIndex >= -[NSArray count](frameFilePaths, "count"))
          goto LABEL_20;
        syncQueue = self->__syncQueue;
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke;
        block[3] = &unk_1EA32E030;
        block[4] = self;
        block[5] = v21;
        v20 = a4;
        block[6] = &v26;
        block[7] = &v22;
        dispatch_sync(syncQueue, block);
        v12 = self->__frameFilePaths;
        if (!v12 || (v13 = self->__nextSourceFrameIndex, v13 >= -[NSArray count](v12, "count")))
        {
LABEL_20:
          v8 = v27;
LABEL_21:
          *((_DWORD *)v8 + 6) = -3;
          break;
        }
        if (!v23[3] && !-[CAMTimelapseStabilizationMovieWriter _frameLoadMode](self, "_frameLoadMode"))
          -[CAMTimelapseStabilizationMovieWriter _requestNextFrameReadDecode](self, "_requestNextFrameReadDecode");
        if (!v23[3] && !*((_DWORD *)v27 + 6))
        {
          v14 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v15 = self->__nextSourceFrameIndex;
            *(_DWORD *)buf = 134217984;
            v31 = v15;
            _os_log_debug_impl(&dword_1DB760000, v14, OS_LOG_TYPE_DEBUG, "Waiting for frame %ld to be decoded...", buf, 0xCu);
          }

          dispatch_semaphore_wait((dispatch_semaphore_t)self->__semFrameGetter, 0xFFFFFFFFFFFFFFFFLL);
        }
      }
      while (!v23[3]);
    }
    v16 = (__CVBuffer *)v23[3];
    if (v16)
    {
      ++self->__nextSourceFrameIndex;
      *a3 = v16;
    }
  }
  else
  {
    v29 = -1;
  }
  v17 = *((_DWORD *)v27 + 6);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return v17;
}

void __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;

  v2 = (id *)(a1 + 32);
  if (CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 88)) < 1)
    return;
  v3 = (uint64_t *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 88), 0);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(v4 + 8);
  v6 = *(_QWORD *)(v5 + 24);
  if (!v6)
  {
LABEL_7:
    v7 = *(_QWORD *)(*(_QWORD *)(v4 + 8) + 24);
    if (*(_BYTE *)(a1 + 64))
    {
      if (!v7)
        goto LABEL_22;
      if (*(_BYTE *)(v7 + 16))
      {
LABEL_16:
        v11 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_4();

        CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)*v2 + 11), 0);
        CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(*v3 + 8) + 24) + 8));
        free(*(void **)(*(_QWORD *)(*v3 + 8) + 24));
        *(_QWORD *)(*(_QWORD *)(*v3 + 8) + 24) = 0;
        ++*((_QWORD *)*v2 + 21);
        if (objc_msgSend(*v2, "_frameLoadMode"))
        {
          v12 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_3();

          dispatch_semaphore_signal(*((dispatch_semaphore_t *)*v2 + 10));
        }
        goto LABEL_22;
      }
    }
    else if (!v7)
    {
      goto LABEL_22;
    }
    v9 = (void *)*((_QWORD *)*v2 + 26);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v9, "containsObject:", v10);

    if ((_DWORD)v9)
      goto LABEL_16;
LABEL_22:
    if (*(_QWORD *)(*(_QWORD *)(*v3 + 8) + 24))
    {
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 88), 0);
      v13 = a1 + 56;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                          + 24)
                                                                              + 8);
      v14 = *(_QWORD *)(a1 + 40);
      if (!*(_BYTE *)(a1 + 64) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v14 + 8) + 24) + 16))
      {
        v15 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_2();

        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -5;
        v14 = *(_QWORD *)(a1 + 40);
      }
      free(*(void **)(*(_QWORD *)(v14 + 8) + 24));
      *(_QWORD *)(*(_QWORD *)(*v3 + 8) + 24) = 0;
      v16 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_1((uint64_t)v2, v13);

    }
    return;
  }
  if (*(_QWORD *)v6 == *((_QWORD *)*v2 + 21))
  {
    if (!*(_QWORD *)(v6 + 8) && !*(_BYTE *)(v6 + 16))
    {
      *(_QWORD *)(v5 + 24) = 0;
      v4 = *v3;
    }
    goto LABEL_7;
  }
  v8 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_5();

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -3;
}

+ (CGSize)_desiredOutputSizeForSourcePixelBuffer:(__CVBuffer *)a3
{
  double Width;
  size_t Height;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  Width = (double)CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v6 = (double)Height;
  if ((double)Height <= Width)
    v7 = (double)Height;
  else
    v7 = Width;
  if ((double)Height <= Width)
    v8 = Width;
  else
    v8 = (double)Height;
  v9 = fabs(v8 / v7 + -1.77777778) < 0.05;
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v11 = *MEMORY[0x1E0C9D820];
  if (v9)
  {
    v11 = 1920.0;
    if (v8 >= 1920.0)
    {
      v10 = 1080.0;
    }
    else
    {
      v11 = 1280.0;
      if (v8 >= 1280.0)
      {
        v10 = 720.0;
      }
      else
      {
        v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v11 = *MEMORY[0x1E0C9D820];
        if (v8 >= 960.0)
        {
          v11 = 960.0;
          v10 = 540.0;
        }
      }
    }
  }
  v12 = v11 == *MEMORY[0x1E0C9D820];
  v13 = v10 == *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v12 && v13)
    v14 = 480.0;
  else
    v14 = v10;
  if (v12 && v13)
    v11 = 640.0;
  if (v6 <= Width)
    v15 = v14;
  else
    v15 = v11;
  if (v6 <= Width)
    v16 = v11;
  else
    v16 = v14;
  result.height = v15;
  result.width = v16;
  return result;
}

- (int)_startWritingWithOutputPath:(id)a3 width:(int64_t)a4 height:(int64_t)a5 videoFormatDescription:(opaqueCMFormatDescription *)a6 transform:(CGAffineTransform *)a7 framesPerSecond:(int64_t)a8 frameCount:(int64_t)a9 preferHEVC:(BOOL)a10 visMetadataCount:(int64_t)a11 videoMetadata:(id)a12
{
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  AVAssetWriter *v21;
  id v22;
  AVAssetWriter *writer;
  AVAssetWriter **p_writer;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  AVAssetWriterInputPixelBufferAdaptor *v37;
  AVAssetWriterInputPixelBufferAdaptor *pixelBufferAdaptor;
  AVAssetWriter *v39;
  __CVPixelBufferPool *v40;
  id v41;
  AVOfflineVideoStabilizer *v42;
  AVOfflineVideoStabilizer *stabilizer;
  int v44;
  NSObject *v46;
  void *v47;
  id v49;
  __int128 v50;
  uint64_t v51;
  _BYTE v52[32];
  __int128 v53;
  id v54;
  _QWORD v55[3];
  _QWORD v56[5];

  v56[3] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v49 = a12;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x1E0C8B018]);
  v20 = *MEMORY[0x1E0C8A2E8];
  v54 = 0;
  v21 = (AVAssetWriter *)objc_msgSend(v19, "initWithURL:fileType:error:", v18, v20, &v54);
  v22 = v54;
  p_writer = &self->__writer;
  writer = self->__writer;
  self->__writer = v21;

  if (!self->__writer || v22)
  {
    v46 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseStabilizationMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:].cold.4(v22, v46);
    goto LABEL_20;
  }
  v47 = v18;
  v25 = v17;
  -[AVAssetWriter setMetadata:](self->__writer, "setMetadata:", v49);
  +[CAMTimelapseSettings sharedInstance](CAMTimelapseSettings, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "outputSettingsForWidth:height:videoFormatDescription:framesPerSecond:frameCount:useHEVC:", a4, a5, a6, a8, a9, a10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *(_OWORD *)&a7->c;
  *(_OWORD *)v52 = *(_OWORD *)&a7->a;
  *(_OWORD *)&v52[16] = v29;
  v53 = *(_OWORD *)&a7->tx;
  objc_msgSend(v28, "setTransform:", v52);
  -[CAMTimelapseStabilizationMovieWriter _setMetadataOnVideoTrackAssetWriterInput:](self, "_setMetadataOnVideoTrackAssetWriterInput:", v28);
  v30 = *MEMORY[0x1E0CA9040];
  v56[0] = &unk_1EA3B0FD0;
  v31 = *MEMORY[0x1E0CA90E0];
  v55[0] = v30;
  v55[1] = v31;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v32;
  v55[2] = *MEMORY[0x1E0CA8FD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8B038], "assetWriterInputPixelBufferAdaptorWithAssetWriterInput:sourcePixelBufferAttributes:", v28, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[AVAssetWriter canAddInput:](self->__writer, "canAddInput:", v28);
  if (v36)
  {
    -[AVAssetWriter addInput:](self->__writer, "addInput:", v28);
    objc_storeStrong((id *)&self->__videoInput, v28);
    v37 = v35;
    pixelBufferAdaptor = self->__pixelBufferAdaptor;
    self->__pixelBufferAdaptor = v37;
  }
  else
  {
    pixelBufferAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(&pixelBufferAdaptor->super, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseStabilizationMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:].cold.3();
  }
  v17 = v25;

  if (!v36)
  {
    v44 = -6;
    v22 = 0;
    v18 = v47;
    goto LABEL_11;
  }
  v22 = 0;
  if (!-[AVAssetWriter startWriting](*p_writer, "startWriting"))
  {
    v46 = os_log_create("com.apple.camera", "Nebula");
    v18 = v47;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseStabilizationMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:].cold.2((uint64_t)v17, (id *)&self->__writer);
    goto LABEL_20;
  }
  v39 = *p_writer;
  *(_OWORD *)v52 = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)&v52[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  -[AVAssetWriter startSessionAtSourceTime:](v39, "startSessionAtSourceTime:", v52);
  v18 = v47;
  if (a11 >= 1)
  {
    memset(v52, 0, 24);
    CMTimeMake((CMTime *)v52, 1, a8);
    v40 = -[AVAssetWriterInputPixelBufferAdaptor pixelBufferPool](self->__pixelBufferAdaptor, "pixelBufferPool");
    v41 = objc_alloc(MEMORY[0x1E0C8B2A0]);
    v50 = *(_OWORD *)v52;
    v51 = *(_QWORD *)&v52[16];
    v42 = (AVOfflineVideoStabilizer *)objc_msgSend(v41, "initWithTargetFrameDuration:dataProvider:destinationBufferPool:stabilizationEnabled:", &v50, self, v40, 1);
    stabilizer = self->__stabilizer;
    self->__stabilizer = v42;

    if (!self->__stabilizer)
    {
      v46 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[CAMTimelapseStabilizationMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:].cold.1();
LABEL_20:

      v44 = -6;
      goto LABEL_11;
    }
  }
  v44 = 0;
LABEL_11:

  return v44;
}

- (void)_setMetadataOnVideoTrackAssetWriterInput:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D73128], "metadataItemForTimelapse");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMetadata:", v6);

  }
}

- (BOOL)_appendPixelBufferToMovie:(__CVBuffer *)a3
{
  AVAssetWriterInputPixelBufferAdaptor *pixelBufferAdaptor;
  AVAssetWriter **p_writer;
  NSObject *v8;
  CMTime v9;
  CMTime v10;

  if (a3)
  {
    memset(&v10, 0, sizeof(v10));
    CMTimeMake(&v10, self->__frameCountWrittenToMovie, self->__movieFramesPerSecond);
    pixelBufferAdaptor = self->__pixelBufferAdaptor;
    v9 = v10;
    if (-[AVAssetWriterInputPixelBufferAdaptor appendPixelBuffer:withPresentationTime:](pixelBufferAdaptor, "appendPixelBuffer:withPresentationTime:", a3, &v9))
    {
      p_writer = &self->__writer;
      if (-[AVAssetWriter status](self->__writer, "status") != AVAssetWriterStatusFailed)
      {
        ++self->__frameCountWrittenToMovie;
        return 1;
      }
      v8 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CAMTimelapseStabilizationMovieWriter _appendPixelBufferToMovie:].cold.2((id *)p_writer, v8);
    }
    else
    {
      v8 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CAMTimelapseStabilizationMovieWriter _appendPixelBufferToMovie:].cold.3();
    }
  }
  else
  {
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseStabilizationMovieWriter _appendPixelBufferToMovie:].cold.1();
  }

  return 0;
}

- (void)_finishMovieWithRestartUnstabilized
{
  -[AVAssetWriterInput markAsFinished](self->__videoInput, "markAsFinished");
  -[AVAssetWriter cancelWriting](self->__writer, "cancelWriting");
  pl_dispatch_async();
}

uint64_t __75__CAMTimelapseStabilizationMovieWriter__finishMovieWithRestartUnstabilized__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restartUnstabilized");
}

- (void)_finishMovieWithFailure
{
  -[AVAssetWriterInput markAsFinished](self->__videoInput, "markAsFinished");
  -[AVAssetWriter cancelWriting](self->__writer, "cancelWriting");
  pl_dispatch_async();
}

void __63__CAMTimelapseStabilizationMovieWriter__finishMovieWithFailure__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void (*v3)(_QWORD *, _QWORD, __int128 *, _QWORD);
  __int128 v4;
  uint64_t v5;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 240));
  objc_msgSend(*(id *)(a1 + 32), "_reset");
  if (v2)
  {
    v3 = (void (*)(_QWORD *, _QWORD, __int128 *, _QWORD))v2[2];
    v4 = *MEMORY[0x1E0CA2E68];
    v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v3(v2, 0, &v4, 0);
  }

}

- (void)_finishMovieWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  AVAssetWriter *writer;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  -[AVAssetWriterInput markAsFinished](self->__videoInput, "markAsFinished");
  -[AVAssetWriter metadata](self->__writer, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  writer = self->__writer;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__CAMTimelapseStabilizationMovieWriter__finishMovieWithCompletionHandler___block_invoke;
  v9[3] = &unk_1EA32E058;
  v10 = v5;
  v11 = v4;
  v9[4] = self;
  v7 = v5;
  v8 = v4;
  -[AVAssetWriter finishWritingWithCompletionHandler:](writer, "finishWritingWithCompletionHandler:", v9);

}

uint64_t __74__CAMTimelapseStabilizationMovieWriter__finishMovieWithCompletionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1[4] + 136), "status");
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, _QWORD))(result + 16))(result, v2 == 2, a1[5]);
  return result;
}

- (__CVBuffer)copySourcePixelBufferForFrameNumber:(int64_t)a3 outputSampleTime:(id *)a4 stabilizer:(id)a5
{
  NSObject *v8;
  unint64_t nextSourceFrameIndex;
  int v10;
  NSObject *syncQueue;
  unint64_t v12;
  NSObject *v13;
  CMTime v15;
  _QWORD block[6];
  __CVBuffer *v17;

  v17 = 0;
  v8 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CAMTimelapseStabilizationMovieWriter copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:].cold.4();

  nextSourceFrameIndex = self->__nextSourceFrameIndex;
  if (nextSourceFrameIndex >= -[NSArray count](self->__frameFilePaths, "count"))
  {
    v13 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CAMTimelapseStabilizationMovieWriter copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:].cold.3(&self->__nextSourceFrameIndex, (id *)&self->__frameFilePaths, v13);
  }
  else
  {
    v10 = -[CAMTimelapseStabilizationMovieWriter _copySourcePixelBufferForNextFrame:skipBadFrames:](self, "_copySourcePixelBufferForNextFrame:skipBadFrames:", &v17, 0);
    if (v17)
    {
      if (v10 == -5)
      {
        syncQueue = self->__syncQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __104__CAMTimelapseStabilizationMovieWriter_copySourcePixelBufferForFrameNumber_outputSampleTime_stabilizer___block_invoke;
        block[3] = &unk_1EA328B18;
        block[4] = self;
        block[5] = a3;
        dispatch_sync(syncQueue, block);
      }
      v12 = -[CAMTimelapseStabilizationMovieWriter _frameLoadMode](self, "_frameLoadMode");
      if (v12 == 1
        || v12 == 2
        && a3 + 1 < (int)-[AVOfflineVideoStabilizer preferredSourcePixelBufferPrimingFrameCount](self->__stabilizer, "preferredSourcePixelBufferPrimingFrameCount"))
      {
        -[CAMTimelapseStabilizationMovieWriter _requestNextFrameReadDecode](self, "_requestNextFrameReadDecode");
      }
      if (a4)
      {
        CMTimeMake(&v15, a3, self->__movieFramesPerSecond);
        *(CMTime *)a4 = v15;
      }
      v13 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[CAMTimelapseStabilizationMovieWriter copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:].cold.2();
    }
    else
    {
      v13 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CAMTimelapseStabilizationMovieWriter copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:].cold.1();
    }
  }

  return v17;
}

void __104__CAMTimelapseStabilizationMovieWriter_copySourcePixelBufferForFrameNumber_outputSampleTime_stabilizer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __104__CAMTimelapseStabilizationMovieWriter_copySourcePixelBufferForFrameNumber_outputSampleTime_stabilizer___block_invoke_cold_1();

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 200);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (id)copySourceStabilizationMetadataForFrameNumber:(int64_t)a3 outputSampleTime:(id *)a4 stabilizer:(id)a5
{
  unint64_t nextMetadataFrameIndex;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  id v17;
  __CFString *v19;
  int64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v24;
  int64_t v26;
  NSUInteger v27;
  int64_t v28;
  void *v29;
  id v30;
  id v31;
  CMTime v32;
  NSUInteger v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  nextMetadataFrameIndex = self->__nextMetadataFrameIndex;
  if (nextMetadataFrameIndex >= -[NSArray count](self->__visMetadataFilePaths, "count", a3, a4, a5))
  {
    v16 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v26 = self->__nextMetadataFrameIndex;
      v27 = -[NSArray count](self->__visMetadataFilePaths, "count");
      LODWORD(v32.value) = 134218496;
      *(CMTimeValue *)((char *)&v32.value + 4) = a3;
      LOWORD(v32.flags) = 2048;
      *(_QWORD *)((char *)&v32.flags + 2) = v26;
      HIWORD(v32.epoch) = 2048;
      v33 = v27;
      _os_log_debug_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEBUG, "Stabilizer asking for metadata frame %ld (our %ld), I only have %ld, returning nil (EOD)", (uint8_t *)&v32, 0x20u);
    }
    v13 = 0;
    v10 = 0;
    v21 = 0;
    v9 = 0;
    goto LABEL_16;
  }
  -[NSArray objectAtIndex:](self->__visMetadataFilePaths, "objectAtIndex:", self->__nextMetadataFrameIndex);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v9, 0, &v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v31;
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    v21 = v11;
    v22 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v28 = self->__nextMetadataFrameIndex;
      objc_msgSend(v9, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v32.value) = 134218498;
      *(CMTimeValue *)((char *)&v32.value + 4) = v28;
      LOWORD(v32.flags) = 2114;
      *(_QWORD *)((char *)&v32.flags + 2) = v29;
      HIWORD(v32.epoch) = 2114;
      v33 = (NSUInteger)v21;
      _os_log_error_impl(&dword_1DB760000, v22, OS_LOG_TYPE_ERROR, "Failed to pull frame %ld metadata %{public}@ into memory: %{public}@", (uint8_t *)&v32, 0x20u);

    }
    goto LABEL_32;
  }
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, &v30);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v30;
  if (v13)
    v15 = v14 == 0;
  else
    v15 = 0;
  if (v15)
  {
    if (a4)
    {
      CMTimeMake(&v32, a3, self->__movieFramesPerSecond);
      v21 = 0;
      *(CMTime *)a4 = v32;
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = v14;
    v24 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseStabilizationMovieWriter copySourceStabilizationMetadataForFrameNumber:outputSampleTime:stabilizer:].cold.1(v9);

    if (!v13)
    {
LABEL_32:
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_17;
    }
  }
  v16 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (v9)
    {
      objc_msgSend(v9, "lastPathComponent");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = CFSTR("<invalid>");
    }
    v20 = self->__nextMetadataFrameIndex;
    LODWORD(v32.value) = 138543874;
    *(CMTimeValue *)((char *)&v32.value + 4) = (CMTimeValue)v19;
    LOWORD(v32.flags) = 2048;
    *(_QWORD *)((char *)&v32.flags + 2) = a3;
    HIWORD(v32.epoch) = 2048;
    v33 = v20;
    _os_log_debug_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEBUG, "Returning %{public}@ for metadata frame %ld (our %ld)", (uint8_t *)&v32, 0x20u);
    if (v9)

  }
LABEL_16:

LABEL_17:
  ++self->__nextMetadataFrameIndex;
  v17 = v13;

  return v17;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (NSArray)_frameFilePaths
{
  return self->__frameFilePaths;
}

- (NSArray)_visMetadataFilePaths
{
  return self->__visMetadataFilePaths;
}

- (OS_dispatch_queue)_movieWritingQueue
{
  return self->__movieWritingQueue;
}

- (OS_dispatch_queue)_syncQueue
{
  return self->__syncQueue;
}

- (OS_dispatch_queue)_readingQueue
{
  return self->__readingQueue;
}

- (OS_dispatch_queue)_decodeQueue
{
  return self->__decodeQueue;
}

- (OS_dispatch_queue)_pixelTransferQueue
{
  return self->__pixelTransferQueue;
}

- (OS_dispatch_semaphore)_semFrameGetter
{
  return self->__semFrameGetter;
}

- (OS_dispatch_semaphore)_semFileReader
{
  return self->__semFileReader;
}

- (__CFArray)_frameList
{
  return self->__frameList;
}

- (NSDate)_movieCreationDate
{
  return self->__movieCreationDate;
}

- (CLLocation)_movieCreationLocation
{
  return self->__movieCreationLocation;
}

- (NSString)_movieOutputPath
{
  return self->__movieOutputPath;
}

- (CGAffineTransform)_movieTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].a;
  return self;
}

- (int64_t)_movieFramesPerSecond
{
  return self->__movieFramesPerSecond;
}

- (BOOL)_preferHEVC
{
  return self->__preferHEVC;
}

- (AVOfflineVideoStabilizer)_stabilizer
{
  return self->__stabilizer;
}

- (AVAssetWriter)_writer
{
  return self->__writer;
}

- (AVAssetWriterInput)_videoInput
{
  return self->__videoInput;
}

- (AVAssetWriterInputPixelBufferAdaptor)_pixelBufferAdaptor
{
  return self->__pixelBufferAdaptor;
}

- (int64_t)_frameCountWrittenToMovie
{
  return self->__frameCountWrittenToMovie;
}

- (int64_t)_nextSourceFrameIndex
{
  return self->__nextSourceFrameIndex;
}

- (int64_t)_nextMetadataFrameIndex
{
  return self->__nextMetadataFrameIndex;
}

- (int64_t)_firstFrameIndex
{
  return self->__firstFrameIndex;
}

- (__CVBuffer)_stashedSourceFrame
{
  return self->__stashedSourceFrame;
}

- (NSMutableSet)_badFrameSet
{
  return self->__badFrameSet;
}

- (NSMutableSet)_badMetadataSet
{
  return self->__badMetadataSet;
}

- (int64_t)_badMetadataErrorThreshold
{
  return self->__badMetadataErrorThreshold;
}

- (OpaqueVTPixelTransferSession)_pixelTransferSession
{
  return self->__pixelTransferSession;
}

- (unint64_t)_frameLoadMode
{
  return self->__frameLoadMode;
}

- (id)_completion
{
  return self->__completion;
}

- (void)_powerAssertion
{
  return self->__powerAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completion, 0);
  objc_storeStrong((id *)&self->__badMetadataSet, 0);
  objc_storeStrong((id *)&self->__badFrameSet, 0);
  objc_storeStrong((id *)&self->__pixelBufferAdaptor, 0);
  objc_storeStrong((id *)&self->__videoInput, 0);
  objc_storeStrong((id *)&self->__writer, 0);
  objc_storeStrong((id *)&self->__stabilizer, 0);
  objc_storeStrong((id *)&self->__movieOutputPath, 0);
  objc_storeStrong((id *)&self->__movieCreationLocation, 0);
  objc_storeStrong((id *)&self->__movieCreationDate, 0);
  objc_storeStrong((id *)&self->__semFileReader, 0);
  objc_storeStrong((id *)&self->__semFrameGetter, 0);
  objc_storeStrong((id *)&self->__pixelTransferQueue, 0);
  objc_storeStrong((id *)&self->__decodeQueue, 0);
  objc_storeStrong((id *)&self->__readingQueue, 0);
  objc_storeStrong((id *)&self->__syncQueue, 0);
  objc_storeStrong((id *)&self->__movieWritingQueue, 0);
  objc_storeStrong((id *)&self->__visMetadataFilePaths, 0);
  objc_storeStrong((id *)&self->__frameFilePaths, 0);
}

void __48__CAMTimelapseStabilizationMovieWriter__cleanup__block_invoke_11_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, v0, v1, "Releasing power assertion...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__CAMTimelapseStabilizationMovieWriter__cleanup__block_invoke_11_cold_2(uint8_t *a1, CVPixelBufferRef *a2, IOSurfaceID *a3, NSObject *a4)
{
  __IOSurface *IOSurface;
  IOSurfaceID ID;

  IOSurface = CVPixelBufferGetIOSurface(*a2);
  ID = IOSurfaceGetID(IOSurface);
  *(_DWORD *)a1 = 67109120;
  *a3 = ID;
  _os_log_debug_impl(&dword_1DB760000, a4, OS_LOG_TYPE_DEBUG, "Releasing IOSurface: 0x%x", a1, 8u);
}

- (void)setSuspended:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, v0, v1, "Suspending movie writer...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setSuspended:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, v0, v1, "Resuming movie writer...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)writeMovieFromImageFiles:(int)a1 visMetadataFiles:(NSObject *)a2 startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Movie write failed with error: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3();
}

- (void)writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Failed to create pixel transfer queue for frame cropping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)writeMovieFromImageFiles:(double)a3 visMetadataFiles:(CGFloat)a4 startDate:(CGFloat)a5 location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:.cold.3(NSObject *a1, double a2, double a3, CGFloat a4, CGFloat a5)
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[24];
  uint64_t v12;
  CGSize v13;

  v12 = *MEMORY[0x1E0C80C00];
  NSStringFromCGSize(*(CGSize *)&a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.width = a4;
  v13.height = a5;
  NSStringFromCGSize(v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_18(&dword_1DB760000, a1, v10, "Source size %{public}@ is mismatched to movie size %{public}@: we will crop.", v11);

}

- (void)writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, v0, v1, "Will tolerate up to %ld frame(s) with bad metadata before unstabilized fallback.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_cropPixelBufferIfNeeded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Movie writer has no pixel buffer pool that we can use for cropping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_decodeFirstFrameAgain
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, v0, v1, "Failed to re-decode first frame %ld", v2);
  OUTLINED_FUNCTION_1_0();
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, v0, v1, "File reader finishing...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Bailing out because there are no frame file paths.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_13(a1, a2);
  OUTLINED_FUNCTION_0(&dword_1DB760000, v2, (uint64_t)v2, "Bailing out because we've been reset.", v3);
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_13(a1, a2);
  OUTLINED_FUNCTION_0(&dword_1DB760000, v2, (uint64_t)v2, "Failed to allocate a frameList node; bailing out.", v3);
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, v0, v1, "Read all %ld frames!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, v0, v1, "Starting file reader for %ld frames...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, v0, v1, "Creating power assertion to keep hardware awake for movie write...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_22_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, v0, v1, "Using first-frame as placeholder for frame %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_22_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "length");
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_18(&dword_1DB760000, a2, v3, "Decoding frame %ld from JPEG: %ld bytes", v4);
  OUTLINED_FUNCTION_1();
}

void __59__CAMTimelapseStabilizationMovieWriter__startAsyncDecoding__block_invoke_23_cold_1(uint64_t a1, CVPixelBufferRef *a2)
{
  __IOSurface *IOSurface;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  IOSurface = CVPixelBufferGetIOSurface(*a2);
  IOSurfaceGetID(IOSurface);
  OUTLINED_FUNCTION_11(&dword_1DB760000, v3, v4, "Frame %ld available: %p (surface ID 0x%x). Signalling frame getter...", v5, v6, v7, v8, 0);
  OUTLINED_FUNCTION_14();
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_13(a1, a2);
  OUTLINED_FUNCTION_1_4(&dword_1DB760000, v2, (uint64_t)v2, "No more frames... completing movie.", v3);
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, v0, v1, "Stabilizer failure! Restarting movie write unstabilized...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, v0, v1, "Stabilizer finished early! Completing with error...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_4()
{
  _DWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_21();
  *v0 = 134217984;
  *v1 = v2;
  OUTLINED_FUNCTION_1_1(&dword_1DB760000, v4, (uint64_t)v1, "Sending frame %ld to movie writer...", v3);
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_cold_5()
{
  _DWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_21();
  *v0 = 134217984;
  *v1 = v2;
  OUTLINED_FUNCTION_1_1(&dword_1DB760000, v4, (uint64_t)v1, "Requesting movie frame %ld from stabilizer...", v3);
}

void __65__CAMTimelapseStabilizationMovieWriter__writeMovieAsynchronously__block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, v0, v1, "Skipping bad stabilized frame %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_copyNextSampleBufferFromStabilizer:(uint64_t)a1 .cold.1(uint64_t a1, id *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a2, "count");
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_1_2(&dword_1DB760000, v2, v3, "Stabilizer has finished the sequence early at frame %ld of %ld: declaring failure.", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1();
}

- (void)_copyNextSampleBufferFromStabilizer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, v0, v1, "Stabilizer copyStabilizedSampleBuffer failed — %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __67__CAMTimelapseStabilizationMovieWriter__requestNextFrameReadDecode__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, v0, v1, "Signaling frame reader for another frame...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  __IOSurface *IOSurface;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 24));
  IOSurfaceGetID(IOSurface);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11(&dword_1DB760000, v3, v4, "Dequeued frame %ld: %p (surface ID 0x%x)", v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_14();
}

void __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, v0, v1, "Dequeued bad frame at index %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, v0, v1, "Signalling file reader for another frame...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_4()
{
  uint64_t v0;
  __IOSurface *IOSurface;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_19();
  IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(v0 + 8));
  IOSurfaceGetID(IOSurface);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11(&dword_1DB760000, v2, v3, "Discarding frame %ld: %p (surface ID 0x%x)", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_14();
}

void __89__CAMTimelapseStabilizationMovieWriter__copySourcePixelBufferForNextFrame_skipBadFrames___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, v0, v1, "Unepected frame at head of decoded queue: %ld", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, v0, v1, "Could not create an offline stabilizer for %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_startWritingWithOutputPath:(uint64_t)a1 width:(id *)a2 height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:.cold.2(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_1DB760000, v3, v4, "Could not start asset writer for %{public}@: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)_startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Could not add video input for writer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_startWritingWithOutputPath:(void *)a1 width:(NSObject *)a2 height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:visMetadataCount:videoMetadata:.cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, a2, v4, "Could not create writer with error: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_appendPixelBufferToMovie:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "No pixel buffer supplied.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_appendPixelBufferToMovie:(id *)a1 .cold.2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, a2, v4, "Failed to write frame to movie %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_appendPixelBufferToMovie:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Failed to append output frame to pixel buffer adaptor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, v0, v1, "Failed to read frame; returning nil (EOD) to stabilizer.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

- (void)copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  v3 = 134218240;
  v4 = v0;
  v5 = 2048;
  v6 = v1;
  OUTLINED_FUNCTION_18(&dword_1DB760000, v2, (uint64_t)v2, "Returning frame %ld to stabilizer: %p", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)copySourcePixelBufferForFrameNumber:(uint64_t *)a1 outputSampleTime:(id *)a2 stabilizer:(NSObject *)a3 .cold.3(uint64_t *a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = objc_msgSend(*a2, "count");
  v6[0] = 67109376;
  v6[1] = v4;
  v7 = 1024;
  v8 = v5;
  _os_log_debug_impl(&dword_1DB760000, a3, OS_LOG_TYPE_DEBUG, "Request for frame %d past our maximum %d, returning nil (EOD)", (uint8_t *)v6, 0xEu);
  OUTLINED_FUNCTION_1();
}

- (void)copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, v0, v1, "Stabilizer requested frame %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __104__CAMTimelapseStabilizationMovieWriter_copySourcePixelBufferForFrameNumber_outputSampleTime_stabilizer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_3(&dword_1DB760000, v0, v1, "Tracking bad frame, stabilizer index %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)copySourceStabilizationMetadataForFrameNumber:(void *)a1 outputSampleTime:stabilizer:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1DB760000, v2, v3, "Failed to decode metadata file %{public}@ into dictionary: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

@end
