@implementation CAMTimelapseMovieWriter

- (CAMTimelapseMovieWriter)init
{
  CAMTimelapseMovieWriter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *synchronizationQueue;
  NSOperationQueue *v5;
  NSOperationQueue *imageReadQueue;
  NSOperationQueue *v7;
  NSOperationQueue *imageDecodeQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *movieWritingQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMTimelapseMovieWriter;
  v2 = -[CAMTimelapseMovieWriter init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.camera.timelapse.movie.sync", 0);
    synchronizationQueue = v2->__synchronizationQueue;
    v2->__synchronizationQueue = (OS_dispatch_queue *)v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    imageReadQueue = v2->__imageReadQueue;
    v2->__imageReadQueue = v5;

    -[NSOperationQueue setName:](v2->__imageReadQueue, "setName:", CFSTR("com.apple.camera.timelapse.movie.image.read"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->__imageReadQueue, "setMaxConcurrentOperationCount:", 1);
    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    imageDecodeQueue = v2->__imageDecodeQueue;
    v2->__imageDecodeQueue = v7;

    -[NSOperationQueue setName:](v2->__imageDecodeQueue, "setName:", CFSTR("com.apple.camera.timelapse.movie.image.decode"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->__imageDecodeQueue, "setMaxConcurrentOperationCount:", 1);
    v9 = dispatch_queue_create("com.apple.camera.timelapse.movie.write", 0);
    movieWritingQueue = v2->__movieWritingQueue;
    v2->__movieWritingQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)_reset
{
  NSArray *frameFilePaths;
  NSMutableDictionary *availableImageData;
  NSMutableDictionary *availablePixelBuffers;
  NSMutableSet *inFlightReadFrameIndexes;
  AVAssetWriter *writer;
  AVAssetWriterInput *videoInput;
  AVAssetWriterInputPixelBufferAdaptor *pixelBufferAdaptor;
  id completion;

  frameFilePaths = self->__frameFilePaths;
  self->__frameFilePaths = 0;

  *(_OWORD *)&self->__nextReadFileIndex = 0u;
  availableImageData = self->__availableImageData;
  *(_OWORD *)&self->__residentPixelBufferCount = 0u;

  availablePixelBuffers = self->__availablePixelBuffers;
  self->__availablePixelBuffers = 0;

  inFlightReadFrameIndexes = self->__inFlightReadFrameIndexes;
  self->__inFlightReadFrameIndexes = 0;

  writer = self->__writer;
  self->__writer = 0;

  -[AVAssetWriterInput removeObserver:forKeyPath:](self->__videoInput, "removeObserver:forKeyPath:", self, CFSTR("readyForMoreMediaData"));
  videoInput = self->__videoInput;
  self->__videoInput = 0;

  pixelBufferAdaptor = self->__pixelBufferAdaptor;
  self->__pixelBufferAdaptor = 0;

  completion = self->__completion;
  *(_OWORD *)&self->__framesPerSecond = 0u;
  *(_OWORD *)&self->__currentOutputFrameIndex = 0u;

}

- (void)setSuspended:(BOOL)a3
{
  NSObject *movieWritingQueue;

  if (self->_suspended != a3)
  {
    self->_suspended = a3;
    movieWritingQueue = self->__movieWritingQueue;
    if (movieWritingQueue)
    {
      if (a3)
        dispatch_suspend(movieWritingQueue);
      else
        dispatch_resume(movieWritingQueue);
    }
  }
}

- (void)writeMovieFromImageFiles:(id)a3 visMetadataFiles:(id)a4 startDate:(id)a5 location:(id)a6 outputPath:(id)a7 transform:(CGAffineTransform *)a8 framesPerSecond:(int64_t)a9 preferHEVC:(BOOL)a10 completionHandler:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  void *v21;
  id v22;
  __CVBuffer *v23;
  int64_t Width;
  BOOL v25;
  OSStatus v26;
  int v27;
  void *v28;
  _QWORD *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  double v37;
  double v38;
  BOOL v39;
  NSArray *v40;
  NSArray *frameFilePaths;
  NSMutableDictionary *v42;
  NSMutableDictionary *availableImageData;
  NSMutableDictionary *v44;
  NSMutableDictionary *availablePixelBuffers;
  NSMutableSet *v46;
  NSMutableSet *inFlightReadFrameIndexes;
  void *v48;
  id completion;
  void (*v50)(_QWORD *, _QWORD, __int128 *, _QWORD);
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(_QWORD *, _QWORD, __int128 *, _QWORD);
  uint64_t v60;
  int64_t Height;
  void *v62;
  void *v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a11;
  -[CAMTimelapseMovieWriter _reset](self, "_reset");
  if (objc_msgSend(v16, "count"))
  {
    v63 = v16;
    v64 = v19;
    objc_msgSend(v16, "objectAtIndex:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = +[CAMTimelapseJPEGReader newDataFromFilePath:](CAMTimelapseJPEGReader, "newDataFromFilePath:", v21);
    v23 = +[CAMTimelapseJPEGReader createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:](CAMTimelapseJPEGReader, "createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:", v22, 1, 0, 0);
    Width = CVPixelBufferGetWidth(v23);
    Height = CVPixelBufferGetHeight(v23);
    if (!v18)
    {
      +[CAMNebulaUtilities locationFromJPEGAtPath:](CAMNebulaUtilities, "locationFromJPEGAtPath:", v21);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = a10;
    v65 = v17;
    +[CAMPersistenceController clientVideoMetadataForLocation:withCreationDate:](CAMPersistenceController, "clientVideoMetadataForLocation:withCreationDate:", v18, v17);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    formatDescriptionOut = 0;
    v26 = CMVideoFormatDescriptionCreateForImageBuffer(0, v23, &formatDescriptionOut);
    if (v26)
    {
      v27 = v26;
      v28 = v21;
      v29 = v20;
      v30 = v18;
      v31 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[CAMTimelapseMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:].cold.2(v27, v31);

      v18 = v30;
      v20 = v29;
      v21 = v28;
      v25 = a10;
    }
    CVPixelBufferRelease(v23);

    v16 = v63;
    v32 = objc_msgSend(v63, "count");
    -[CAMTimelapseMovieWriter _desiredOutputSizeForFrameSize:](self, "_desiredOutputSizeForFrameSize:", (double)Width, (double)Height);
    v33 = MEMORY[0x1E0C9BAA8];
    v34 = *MEMORY[0x1E0C9BAA8];
    v35 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&a8->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&a8->c = v35;
    v36 = *(_OWORD *)(v33 + 32);
    *(_OWORD *)&a8->tx = v36;
    v66 = v34;
    v67 = v35;
    v68 = v36;
    LOBYTE(v60) = v25;
    v19 = v64;
    v39 = -[CAMTimelapseMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:](self, "_startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:", v64, (uint64_t)v37, (uint64_t)v38, formatDescriptionOut, &v66, a9, v32, v60, v62);
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    v17 = v65;
    if (v39)
    {
      v40 = (NSArray *)objc_msgSend(v63, "copy");
      frameFilePaths = self->__frameFilePaths;
      self->__frameFilePaths = v40;

      v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      availableImageData = self->__availableImageData;
      self->__availableImageData = v42;

      v44 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      availablePixelBuffers = self->__availablePixelBuffers;
      self->__availablePixelBuffers = v44;

      v46 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      inFlightReadFrameIndexes = self->__inFlightReadFrameIndexes;
      self->__inFlightReadFrameIndexes = v46;

      self->__framesPerSecond = a9;
      v48 = (void *)objc_msgSend(v20, "copy");
      completion = self->__completion;
      self->__completion = v48;

      -[CAMTimelapseMovieWriter _enqueueNextRead](self, "_enqueueNextRead");
    }
    else
    {
      v51 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        -[CAMTimelapseMovieWriter writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:].cold.1(v51, v52, v53, v54, v55, v56, v57, v58);

      if (v20)
      {
        v59 = (void (*)(_QWORD *, _QWORD, __int128 *, _QWORD))v20[2];
        v66 = *MEMORY[0x1E0CA2E68];
        *(_QWORD *)&v67 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        v59(v20, 0, &v66, 0);
      }
    }

  }
  else if (v20)
  {
    v50 = (void (*)(_QWORD *, _QWORD, __int128 *, _QWORD))v20[2];
    v66 = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)&v67 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v50(v20, 0, &v66, 0);
  }

}

- (void)_enqueueNextRead
{
  NSOperationQueue *imageReadQueue;
  _QWORD v3[5];

  imageReadQueue = self->__imageReadQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke;
  v3[3] = &unk_1EA328868;
  v3[4] = self;
  -[NSOperationQueue addOperationWithBlock:](imageReadQueue, "addOperationWithBlock:", v3);
}

void __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD *);
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD block[7];
  _QWORD v17[4];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__26;
  v22 = __Block_byref_object_dispose__26;
  v23 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0x7FFFFFFFFFFFFFFFLL;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 72);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke_12;
  block[3] = &unk_1EA32B500;
  block[4] = v2;
  block[5] = &v18;
  block[6] = v17;
  dispatch_sync(v3, block);
  if (v19[5])
  {
    v5 = +[CAMTimelapseJPEGReader newDataFromFilePath:](CAMTimelapseJPEGReader, "newDataFromFilePath:");
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
    v9 = v4;
    v10 = 3221225472;
    v11 = __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke_3;
    v12 = &unk_1EA32DC90;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 32);
    v13 = v7;
    v14 = v8;
    v15 = v17;
    dispatch_sync(v6, &v9);
    objc_msgSend(*(id *)(a1 + 32), "_enqueueNextDecode", v9, v10, v11, v12);
    objc_msgSend(*(id *)(a1 + 32), "_enqueueNextRead");

  }
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v18, 8);

}

void __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke_12(_QWORD *a1)
{
  uint64_t v1;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v1 = a1[4];
  if (*(uint64_t *)(v1 + 32) <= 1)
  {
    v3 = *(_QWORD *)(v1 + 24);
    if (v3 < objc_msgSend(*(id *)(v1 + 16), "count"))
    {
      objc_msgSend(*(id *)(a1[4] + 64), "allObjects");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_50);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v7 = objc_msgSend(v5, "integerValue");
        v8 = a1[4];
        v9 = *(_QWORD *)(v8 + 24);
        if (v9 >= v7 + 2)
          goto LABEL_9;
      }
      else
      {
        v8 = a1[4];
        v9 = *(_QWORD *)(v8 + 24);
      }
      objc_msgSend(*(id *)(v8 + 16), "objectAtIndex:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[5] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 24);
      v13 = *(void **)(a1[4] + 64);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

      ++*(_QWORD *)(a1[4] + 24);
      ++*(_QWORD *)(a1[4] + 32);
LABEL_9:

    }
  }
}

uint64_t __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __43__CAMTimelapseMovieWriter__enqueueNextRead__block_invoke_3(_QWORD *a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v3;
  v4 = *(void **)(a1[5] + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, v5);

  v6 = a1[6];
  v7 = *(void **)(a1[5] + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(v6 + 8) + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v8);

}

- (void)_enqueueNextDecode
{
  NSOperationQueue *imageDecodeQueue;
  _QWORD v3[5];

  imageDecodeQueue = self->__imageDecodeQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke;
  v3[3] = &unk_1EA328868;
  v3[4] = self;
  -[NSOperationQueue addOperationWithBlock:](imageDecodeQueue, "addOperationWithBlock:", v3);
}

void __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  __CVBuffer *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[7];
  _QWORD block[7];
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__26;
  v19 = __Block_byref_object_dispose__26;
  v20 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0x7FFFFFFFFFFFFFFFLL;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 72);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke_2;
  block[3] = &unk_1EA32B500;
  block[4] = v2;
  block[5] = &v15;
  block[6] = v14;
  dispatch_sync(v3, block);
  v5 = (void *)v16[5];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      v8 = 0;
    }
    else
    {
      v7 = (id)v16[5];
      v8 = +[CAMTimelapseJPEGReader createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:](CAMTimelapseJPEGReader, "createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:", v7, 1, 0, 0);

    }
    v9 = (void *)v16[5];
    v16[5] = 0;

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 72);
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke_4;
    v12[3] = &unk_1EA32E008;
    v12[4] = v10;
    v12[5] = v14;
    v12[6] = v8;
    dispatch_sync(v11, v12);
    objc_msgSend(*(id *)(a1 + 32), "_enqueueNextWrite");
    objc_msgSend(*(id *)(a1 + 32), "_enqueueNextRead");
    objc_msgSend(*(id *)(a1 + 32), "_enqueueNextDecode");
  }
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);

}

void __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v1 = a1[4];
  if (*(uint64_t *)(v1 + 40) <= 1)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__26;
    v12 = __Block_byref_object_dispose__26;
    v13 = 0;
    v3 = *(void **)(v1 + 48);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke_3;
    v7[3] = &unk_1EA32F0B0;
    v7[4] = &v8;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
    if (v9[5])
    {
      objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1[5] + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend((id)v9[5], "integerValue");
      objc_msgSend(*(id *)(a1[4] + 48), "removeObjectForKey:", v9[5]);
      ++*(_QWORD *)(a1[4] + 40);
    }
    _Block_object_dispose(&v8, 8);

  }
}

void __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v7 + 40))
    goto LABEL_4;
  if (objc_msgSend(v8, "compare:") == -1)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v7 + 40), a2);
  }

}

void __45__CAMTimelapseMovieWriter__enqueueNextDecode__block_invoke_4(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)a1[6];
  v3 = *(void **)(a1[4] + 56);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, v4);

  --*(_QWORD *)(a1[4] + 32);
}

- (void)_enqueueNextWrite
{
  NSObject *movieWritingQueue;
  _QWORD block[5];

  movieWritingQueue = self->__movieWritingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_async(movieWritingQueue, block);
}

void __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CVBuffer *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "isReadyForMoreMediaData"))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__26;
    v22 = __Block_byref_object_dispose__26;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 72);
    v4 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke_2;
    block[3] = &unk_1EA32B500;
    block[4] = v2;
    block[5] = &v18;
    block[6] = &v14;
    dispatch_sync(v3, block);
    v5 = (void *)v19[5];
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 != v6)
      {
        v7 = CVPixelBufferRetain((CVPixelBufferRef)v19[5]);
        objc_msgSend(*(id *)(a1 + 32), "_appendPixelBuffer:", v7);
        CVPixelBufferRelease(v7);
      }
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(NSObject **)(v8 + 72);
      v12[0] = v4;
      v12[1] = 3221225472;
      v12[2] = __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke_3;
      v12[3] = &unk_1EA328868;
      v12[4] = v8;
      dispatch_sync(v9, v12);
      if (!*((_BYTE *)v15 + 24)
        || (v10 = *(void **)(a1 + 32),
            v11[0] = v4,
            v11[1] = 3221225472,
            v11[2] = __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke_4,
            v11[3] = &unk_1EA32DFE0,
            v11[4] = v10,
            objc_msgSend(v10, "_finishMovieWithCompletionHandler:", v11),
            !*((_BYTE *)v15 + 24)))
      {
        objc_msgSend(*(id *)(a1 + 32), "_enqueueNextDecode");
        objc_msgSend(*(id *)(a1 + 32), "_enqueueNextWrite");
      }
    }
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);

  }
}

void __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1[4] + 136));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 56), "removeObjectForKey:", v7);
    ++*(_QWORD *)(a1[4] + 136);
    v5 = a1[4];
    v6 = *(_QWORD *)(v5 + 136);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v6 == objc_msgSend(*(id *)(v5 + 16), "count");
  }

}

uint64_t __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke_3(uint64_t result)
{
  --*(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

void __44__CAMTimelapseMovieWriter__enqueueNextWrite__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, CMTime *, id);
  CMTime v9;
  CMTime v10;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 152);
  if (v7)
  {
    v10 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if ((_DWORD)a2)
    {
      CMTimeMake(&v10, *(_QWORD *)(v6 + 144), *(_DWORD *)(v6 + 128));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
    }
    v8 = *(void (**)(uint64_t, uint64_t, CMTime *, id))(v7 + 16);
    v9 = v10;
    v8(v7, a2, &v9, v5);
    v6 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend((id)v6, "_reset");

}

- (CGSize)_desiredOutputSizeForFrameSize:(CGSize)a3
{
  double height;
  double v4;
  double width;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  CGSize result;

  height = 1920.0;
  if (a3.height <= 1920.0)
    height = a3.height;
  v4 = round(height * 9.0 * 0.0625);
  width = 1920.0;
  if (a3.width <= 1920.0)
    width = a3.width;
  v6 = round(width * 9.0 * 0.0625);
  v7 = a3.width <= a3.height;
  if (a3.width > a3.height)
    v8 = v6;
  else
    v8 = height;
  if (v7)
    v9 = v4;
  else
    v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (BOOL)_startWritingWithOutputPath:(id)a3 width:(int64_t)a4 height:(int64_t)a5 videoFormatDescription:(opaqueCMFormatDescription *)a6 transform:(CGAffineTransform *)a7 framesPerSecond:(int64_t)a8 frameCount:(int64_t)a9 preferHEVC:(BOOL)a10 videoMetadata:(id)a11
{
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  AVAssetWriter *v21;
  id v22;
  AVAssetWriter *writer;
  AVAssetWriter **p_writer;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  AVAssetWriterInputPixelBufferAdaptor *v32;
  AVAssetWriterInputPixelBufferAdaptor *pixelBufferAdaptor;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  AVAssetWriter *v44;
  BOOL v45;
  id v47;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a11;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x1E0C8B018]);
  v20 = *MEMORY[0x1E0C8A2E8];
  v53 = 0;
  v49 = (void *)v18;
  v21 = (AVAssetWriter *)objc_msgSend(v19, "initWithURL:fileType:error:", v18, v20, &v53);
  v22 = v53;
  p_writer = &self->__writer;
  writer = self->__writer;
  self->__writer = v21;

  if (!self->__writer || v22)
  {
    v34 = v22;
    v35 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:].cold.1(v22);
    v36 = v49;
    goto LABEL_8;
  }
  v47 = v17;
  -[AVAssetWriter setMetadata:](self->__writer, "setMetadata:", v17);
  +[CAMTimelapseSettings sharedInstance](CAMTimelapseSettings, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "outputSettingsForWidth:height:videoFormatDescription:framesPerSecond:frameCount:useHEVC:", a4, a5, a6, a8, a9, a10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *(_OWORD *)&a7->c;
  v50 = *(_OWORD *)&a7->a;
  v51 = v28;
  v52 = *(_OWORD *)&a7->tx;
  objc_msgSend(v27, "setTransform:", &v50);
  -[CAMTimelapseMovieWriter _setMetadataOnVideoTrackAssetWriterInput:](self, "_setMetadataOnVideoTrackAssetWriterInput:", v27);
  v54 = *MEMORY[0x1E0CA9040];
  v55[0] = &unk_1EA3B1498;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B038], "assetWriterInputPixelBufferAdaptorWithAssetWriterInput:sourcePixelBufferAttributes:", v27, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[AVAssetWriter canAddInput:](self->__writer, "canAddInput:", v27);
  if (v31)
  {
    -[AVAssetWriter addInput:](self->__writer, "addInput:", v27);
    objc_storeStrong((id *)&self->__videoInput, v27);
    -[AVAssetWriterInput addObserver:forKeyPath:options:context:](self->__videoInput, "addObserver:forKeyPath:options:context:", self, CFSTR("readyForMoreMediaData"), 1, 0);
    v32 = v30;
    pixelBufferAdaptor = self->__pixelBufferAdaptor;
    self->__pixelBufferAdaptor = v32;
  }
  else
  {
    pixelBufferAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(&pixelBufferAdaptor->super, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:].cold.3(&pixelBufferAdaptor->super, v37, v38, v39, v40, v41, v42, v43);
  }
  v17 = v47;

  v36 = v49;
  v34 = 0;
  if (!v31)
    goto LABEL_14;
  if (!-[AVAssetWriter startWriting](*p_writer, "startWriting"))
  {
    v35 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseMovieWriter _startWritingWithOutputPath:width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:].cold.2((uint64_t)v16, (id *)&self->__writer, v35);
LABEL_8:

LABEL_14:
    -[CAMTimelapseMovieWriter _reset](self, "_reset");
    v45 = 0;
    goto LABEL_15;
  }
  v44 = *p_writer;
  v50 = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)&v51 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  -[AVAssetWriter startSessionAtSourceTime:](v44, "startSessionAtSourceTime:", &v50);
  v45 = 1;
LABEL_15:

  return v45;
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

- (BOOL)_appendPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  AVAssetWriterInputPixelBufferAdaptor *pixelBufferAdaptor;
  AVAssetWriter **p_writer;
  AVAssetWriter *writer;
  NSObject *v8;
  CMTime v10;
  CMTime v11;

  v3 = a3;
  if (a3)
  {
    memset(&v11, 0, sizeof(v11));
    CMTimeMake(&v11, self->__currentOutputFrameIndex, self->__framesPerSecond);
    pixelBufferAdaptor = self->__pixelBufferAdaptor;
    v10 = v11;
    LODWORD(v3) = -[AVAssetWriterInputPixelBufferAdaptor appendPixelBuffer:withPresentationTime:](pixelBufferAdaptor, "appendPixelBuffer:withPresentationTime:", v3, &v10);
    if ((_DWORD)v3)
    {
      ++self->__currentOutputFrameIndex;
    }
    else
    {
      writer = self->__writer;
      p_writer = &self->__writer;
      if (-[AVAssetWriter status](writer, "status") == AVAssetWriterStatusFailed)
      {
        v8 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[CAMTimelapseMovieWriter _appendPixelBuffer:].cold.1((id *)p_writer);

      }
    }
  }
  return (char)v3;
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
  v9[2] = __61__CAMTimelapseMovieWriter__finishMovieWithCompletionHandler___block_invoke;
  v9[3] = &unk_1EA32E058;
  v10 = v5;
  v11 = v4;
  v9[4] = self;
  v7 = v5;
  v8 = v4;
  -[AVAssetWriter finishWritingWithCompletionHandler:](writer, "finishWritingWithCompletionHandler:", v9);

}

uint64_t __61__CAMTimelapseMovieWriter__finishMovieWithCompletionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1[4] + 104), "status");
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, _QWORD))(result + 16))(result, v2 == 2, a1[5]);
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v8;
  int v9;
  id v10;

  v10 = a5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("readyForMoreMediaData")))
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
      -[CAMTimelapseMovieWriter _enqueueNextWrite](self, "_enqueueNextWrite");
  }

}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (NSArray)_frameFilePaths
{
  return self->__frameFilePaths;
}

- (int64_t)_nextReadFileIndex
{
  return self->__nextReadFileIndex;
}

- (int64_t)_residentImageDataCount
{
  return self->__residentImageDataCount;
}

- (int64_t)_residentPixelBufferCount
{
  return self->__residentPixelBufferCount;
}

- (NSMutableDictionary)_availableImageData
{
  return self->__availableImageData;
}

- (NSMutableDictionary)_availablePixelBuffers
{
  return self->__availablePixelBuffers;
}

- (NSMutableSet)_inFlightReadFrameIndexes
{
  return self->__inFlightReadFrameIndexes;
}

- (OS_dispatch_queue)_synchronizationQueue
{
  return self->__synchronizationQueue;
}

- (NSOperationQueue)_imageReadQueue
{
  return self->__imageReadQueue;
}

- (NSOperationQueue)_imageDecodeQueue
{
  return self->__imageDecodeQueue;
}

- (OS_dispatch_queue)_movieWritingQueue
{
  return self->__movieWritingQueue;
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

- (int64_t)_framesPerSecond
{
  return self->__framesPerSecond;
}

- (int64_t)_nextWriteFileIndex
{
  return self->__nextWriteFileIndex;
}

- (int64_t)_currentOutputFrameIndex
{
  return self->__currentOutputFrameIndex;
}

- (id)_completion
{
  return self->__completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completion, 0);
  objc_storeStrong((id *)&self->__pixelBufferAdaptor, 0);
  objc_storeStrong((id *)&self->__videoInput, 0);
  objc_storeStrong((id *)&self->__writer, 0);
  objc_storeStrong((id *)&self->__movieWritingQueue, 0);
  objc_storeStrong((id *)&self->__imageDecodeQueue, 0);
  objc_storeStrong((id *)&self->__imageReadQueue, 0);
  objc_storeStrong((id *)&self->__synchronizationQueue, 0);
  objc_storeStrong((id *)&self->__inFlightReadFrameIndexes, 0);
  objc_storeStrong((id *)&self->__availablePixelBuffers, 0);
  objc_storeStrong((id *)&self->__availableImageData, 0);
  objc_storeStrong((id *)&self->__frameFilePaths, 0);
}

- (void)writeMovieFromImageFiles:(uint64_t)a3 visMetadataFiles:(uint64_t)a4 startDate:(uint64_t)a5 location:(uint64_t)a6 outputPath:(uint64_t)a7 transform:(uint64_t)a8 framesPerSecond:preferHEVC:completionHandler:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Error: failed to start writing movie", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)writeMovieFromImageFiles:(int)a1 visMetadataFiles:(NSObject *)a2 startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:.cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Error: failed to get videoFormatDescription for pixel buffer: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3();
}

- (void)_startWritingWithOutputPath:(void *)a1 width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1DB760000, v2, v3, "Could not create writer with error %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)_startWritingWithOutputPath:(NSObject *)a3 width:height:videoFormatDescription:transform:framesPerSecond:frameCount:preferHEVC:videoMetadata:.cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "Could not start asset writer for %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)_startWritingWithOutputPath:(uint64_t)a3 width:(uint64_t)a4 height:(uint64_t)a5 videoFormatDescription:(uint64_t)a6 transform:(uint64_t)a7 framesPerSecond:(uint64_t)a8 frameCount:preferHEVC:videoMetadata:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Could not add video input for writer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_appendPixelBuffer:(id *)a1 .cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1DB760000, v2, v3, "Error writing frame to movie %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
