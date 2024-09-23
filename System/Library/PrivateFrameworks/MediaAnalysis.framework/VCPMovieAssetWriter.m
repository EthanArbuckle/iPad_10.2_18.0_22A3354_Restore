@implementation VCPMovieAssetWriter

- (VCPMovieAssetWriter)initWithURL:(id)a3 andTrack:(id)a4 andBitrate:(int64_t)a5 withOutputSize:(CGSize)a6 enableAudio:(BOOL)a7 enableStyle:(BOOL)a8
{
  _BOOL4 v9;
  double height;
  double width;
  id v15;
  char *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  dispatch_semaphore_t v38;
  void *v39;
  dispatch_semaphore_t v40;
  void *v41;
  dispatch_semaphore_t v42;
  void *v43;
  dispatch_semaphore_t v44;
  void *v45;
  dispatch_group_t v46;
  void *v47;
  uint64_t v48;
  dispatch_queue_t v49;
  void *v50;
  dispatch_queue_t v51;
  void *v52;
  dispatch_queue_t v53;
  void *v54;
  dispatch_queue_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  dispatch_semaphore_t v61;
  void *v62;
  dispatch_semaphore_t v63;
  void *v64;
  dispatch_queue_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  int v71;
  void *v72;
  VCPMovieAssetWriter *v73;
  void *v74;
  id v76;
  id v77;
  id v78;
  objc_super v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v9 = a7;
  height = a6.height;
  width = a6.width;
  v84 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v76 = a4;
  v79.receiver = self;
  v79.super_class = (Class)VCPMovieAssetWriter;
  v16 = -[VCPMovieAssetWriter init](&v79, sel_init);
  if (!v16)
    goto LABEL_19;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "fileExistsAtPath:", v18);

  if (v19)
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v81 = v20;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Removing existing file at path %@", buf, 0xCu);

    }
    objc_msgSend(v15, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    v22 = objc_msgSend(v17, "removeItemAtPath:error:", v21, &v78);
    v23 = v78;

    if ((v22 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "description");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v81 = v24;
        v82 = 2112;
        v83 = v25;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to remove existing file at path %@ (%@)", buf, 0x16u);

      }
LABEL_36:

      v73 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    v23 = 0;
  }
  objc_storeStrong((id *)v16 + 6, a4);
  objc_msgSend(*((id *)v16 + 6), "asset");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)*((_QWORD *)v16 + 1);
  *((_QWORD *)v16 + 1) = v26;

  v28 = *MEMORY[0x1E0C8A2E8];
  v77 = v23;
  objc_msgSend(MEMORY[0x1E0C8B018], "assetWriterWithURL:fileType:error:", v15, v28, &v77);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v77;

  v31 = (void *)*((_QWORD *)v16 + 8);
  *((_QWORD *)v16 + 8) = v29;

  v23 = v30;
  if (!*((_QWORD *)v16 + 8))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v30, "description");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v81 = v74;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create asset writer (%@)", buf, 0xCu);

    }
    goto LABEL_36;
  }
  if (v9)
  {
    objc_msgSend(*((id *)v16 + 1), "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E0C8A7A0]);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)*((_QWORD *)v16 + 7);
    *((_QWORD *)v16 + 7) = v32;

    if (!*((_QWORD *)v16 + 7))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Asset does not have an audio track", buf, 2u);
      }
      goto LABEL_36;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)*((_QWORD *)v16 + 15);
  *((_QWORD *)v16 + 15) = v34;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)*((_QWORD *)v16 + 17);
  *((_QWORD *)v16 + 17) = v36;

  v38 = dispatch_semaphore_create(5);
  v39 = (void *)*((_QWORD *)v16 + 19);
  *((_QWORD *)v16 + 19) = v38;

  v40 = dispatch_semaphore_create(0);
  v41 = (void *)*((_QWORD *)v16 + 20);
  *((_QWORD *)v16 + 20) = v40;

  v42 = dispatch_semaphore_create(5);
  v43 = (void *)*((_QWORD *)v16 + 23);
  *((_QWORD *)v16 + 23) = v42;

  v44 = dispatch_semaphore_create(0);
  v45 = (void *)*((_QWORD *)v16 + 24);
  *((_QWORD *)v16 + 24) = v44;

  v46 = dispatch_group_create();
  v47 = (void *)*((_QWORD *)v16 + 18);
  *((_QWORD *)v16 + 18) = v46;

  *((_QWORD *)v16 + 30) = 1;
  v48 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)(v16 + 264) = *MEMORY[0x1E0CA2E18];
  *((_QWORD *)v16 + 35) = *(_QWORD *)(v48 + 16);
  v16[288] = v9;
  v49 = dispatch_queue_create("com.apple.mediaanalysisd.movieassetwriter.status", 0);
  v50 = (void *)*((_QWORD *)v16 + 25);
  *((_QWORD *)v16 + 25) = v49;

  v51 = dispatch_queue_create("com.apple.mediaanalysisd.movieassetwriter.mediaDataRequest.videoEncoding", 0);
  v52 = (void *)*((_QWORD *)v16 + 26);
  *((_QWORD *)v16 + 26) = v51;

  if (v16[288])
  {
    v53 = dispatch_queue_create("com.apple.mediaanalysisd.movieassetwriter.mediaDataRequest.audioEncoding", 0);
    v54 = (void *)*((_QWORD *)v16 + 28);
    *((_QWORD *)v16 + 28) = v53;

  }
  v55 = dispatch_queue_create("com.apple.mediaanalysisd.movieassetwriter.mediaDataRequest.metadataEncoding", 0);
  v56 = (void *)*((_QWORD *)v16 + 29);
  *((_QWORD *)v16 + 29) = v55;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)*((_QWORD *)v16 + 37);
  *((_QWORD *)v16 + 37) = v57;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)*((_QWORD *)v16 + 16);
  *((_QWORD *)v16 + 16) = v59;

  v61 = dispatch_semaphore_create(5);
  v62 = (void *)*((_QWORD *)v16 + 21);
  *((_QWORD *)v16 + 21) = v61;

  v63 = dispatch_semaphore_create(0);
  v64 = (void *)*((_QWORD *)v16 + 22);
  *((_QWORD *)v16 + 22) = v63;

  v65 = dispatch_queue_create("com.apple.mediaanalysisd.movieassetwriter.mediaDataRequest.auxEncoding", 0);
  v66 = (void *)*((_QWORD *)v16 + 27);
  *((_QWORD *)v16 + 27) = v65;

  v16[289] = a8;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v67 = objc_claimAutoreleasedReturnValue();
  v68 = (void *)*((_QWORD *)v16 + 38);
  *((_QWORD *)v16 + 38) = v67;

  v69 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", *((_QWORD *)v16 + 1), 0);
  v70 = (void *)*((_QWORD *)v16 + 2);
  *((_QWORD *)v16 + 2) = v69;

  v71 = objc_msgSend(v16, "setupVideoTrack:withOutputSize:", a5, width, height);
  if (!v71
    && (!v16[288] || (v71 = objc_msgSend(v16, "setupAudioTrack")) == 0)
    && (!v16[289]
     || (v71 = objc_msgSend(v16, "setupAuxTrack:withOutputSize:", a5, width, height)) == 0
     && (v71 = objc_msgSend(v16, "setupAdditionalAuxTrack")) == 0))
  {
    v71 = objc_msgSend(v16, "setupMetadataTrack");
    if (!v71)
    {
      if (objc_msgSend(*((id *)v16 + 2), "startReading"))
        v71 = 0;
      else
        v71 = -19;
    }
  }

  if (v71)
    v72 = 0;
  else
LABEL_19:
    v72 = v16;
  v73 = v72;
LABEL_37:

  return v73;
}

+ (VCPMovieAssetWriter)assetWriterWithURL:(id)a3 andTrack:(id)a4 andBitrate:(int64_t)a5 withOutputSize:(CGSize)a6 enableAudio:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  id v12;
  id v13;
  void *v14;

  v7 = a7;
  height = a6.height;
  width = a6.width;
  v12 = a3;
  v13 = a4;
  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:andTrack:andBitrate:withOutputSize:enableAudio:enableStyle:", v12, v13, a5, v7, 0, width, height);

  return (VCPMovieAssetWriter *)v14;
}

+ (VCPMovieAssetWriter)assetWriterWithURL:(id)a3 andTrack:(id)a4 andBitrate:(int64_t)a5 withOutputSize:(CGSize)a6 enableAudio:(BOOL)a7 enableStyle:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  id v14;
  id v15;
  void *v16;

  v8 = a8;
  v9 = a7;
  height = a6.height;
  width = a6.width;
  v14 = a3;
  v15 = a4;
  v16 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:andTrack:andBitrate:withOutputSize:enableAudio:enableStyle:", v14, v15, a5, v9, v8, width, height);

  return (VCPMovieAssetWriter *)v16;
}

- (void)dealloc
{
  objc_super v3;
  void *v4;

  if (self->_status == 1)
    -[VCPMovieAssetWriter cancel](self, "cancel");
  while (-[NSMutableArray count](self->_sampleQueue, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_sampleQueue, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObjectAtIndex:](self->_sampleQueue, "removeObjectAtIndex:", 0);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v4);
  }
  while (-[NSMutableArray count](self->_auxsampleQueue, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_auxsampleQueue, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObjectAtIndex:](self->_auxsampleQueue, "removeObjectAtIndex:", 0);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v4);
  }
  while (-[NSMutableArray count](self->_livePhotoInfoQueue, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_livePhotoInfoQueue, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObjectAtIndex:](self->_livePhotoInfoQueue, "removeObjectAtIndex:", 0);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v4);
  }
  v3.receiver = self;
  v3.super_class = (Class)VCPMovieAssetWriter;
  -[VCPMovieAssetWriter dealloc](&v3, sel_dealloc);
}

- (void)pushSample:(opaqueCMSampleBuffer *)a3
{
  NSMutableArray *v5;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_enqueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    v5 = self->_sampleQueue;
    objc_sync_enter(v5);
    -[NSMutableArray addObject:](self->_sampleQueue, "addObject:", a3);
    objc_sync_exit(v5);

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dequeueSemaphore);
}

- (opaqueCMSampleBuffer)popSample
{
  NSMutableArray *v3;
  void *v4;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dequeueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v3 = self->_sampleQueue;
  objc_sync_enter(v3);
  if (-[NSMutableArray count](self->_sampleQueue, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_sampleQueue, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObjectAtIndex:](self->_sampleQueue, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_enqueueSemaphore);
  return (opaqueCMSampleBuffer *)v4;
}

- (void)pushAuxSample:(opaqueCMSampleBuffer *)a3
{
  NSMutableArray *v5;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_auxEnqueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    v5 = self->_auxsampleQueue;
    objc_sync_enter(v5);
    -[NSMutableArray addObject:](self->_auxsampleQueue, "addObject:", a3);
    objc_sync_exit(v5);

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_auxDequeueSemaphore);
}

- (opaqueCMSampleBuffer)popAuxSample
{
  NSMutableArray *v3;
  void *v4;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_auxDequeueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v3 = self->_auxsampleQueue;
  objc_sync_enter(v3);
  if (-[NSMutableArray count](self->_auxsampleQueue, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_auxsampleQueue, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObjectAtIndex:](self->_auxsampleQueue, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_auxEnqueueSemaphore);
  return (opaqueCMSampleBuffer *)v4;
}

- (void)pushLivePhotoInfoSample:(opaqueCMSampleBuffer *)a3
{
  NSMutableArray *v5;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_livePhotoInfoEnqueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    v5 = self->_livePhotoInfoQueue;
    objc_sync_enter(v5);
    -[NSMutableArray addObject:](self->_livePhotoInfoQueue, "addObject:", a3);
    objc_sync_exit(v5);

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_livePhotoInfoDequeueSemaphore);
}

- (opaqueCMSampleBuffer)popLivePhotoInfoSample
{
  NSMutableArray *v3;
  void *v4;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_livePhotoInfoDequeueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v3 = self->_livePhotoInfoQueue;
  objc_sync_enter(v3);
  if (-[NSMutableArray count](self->_livePhotoInfoQueue, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_livePhotoInfoQueue, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObjectAtIndex:](self->_livePhotoInfoQueue, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_livePhotoInfoEnqueueSemaphore);
  return (opaqueCMSampleBuffer *)v4;
}

- (int)dispatchEncoding
{
  AVAssetWriter *writer;
  AVAssetWriterInput *input;
  uint64_t v5;
  OS_dispatch_queue *videoQueue;
  AVAssetWriterInput *auxInput;
  OS_dispatch_queue *auxQueue;
  AVAssetWriterInput *audioInput;
  OS_dispatch_queue *audioQueue;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  __int128 v15;
  uint64_t v16;

  if (!-[AVAssetWriter startWriting](self->_writer, "startWriting"))
    return -18;
  writer = self->_writer;
  v15 = *MEMORY[0x1E0CA2E68];
  v16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  -[AVAssetWriter startSessionAtSourceTime:](writer, "startSessionAtSourceTime:", &v15);
  dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
  input = self->_input;
  v5 = MEMORY[0x1E0C809B0];
  videoQueue = self->_videoQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke;
  v14[3] = &unk_1E6B15468;
  v14[4] = self;
  -[AVAssetWriterInput requestMediaDataWhenReadyOnQueue:usingBlock:](input, "requestMediaDataWhenReadyOnQueue:usingBlock:", videoQueue, v14);
  if (self->_enableStyle)
  {
    dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
    auxInput = self->_auxInput;
    auxQueue = self->_auxQueue;
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_12;
    v13[3] = &unk_1E6B15468;
    v13[4] = self;
    -[AVAssetWriterInput requestMediaDataWhenReadyOnQueue:usingBlock:](auxInput, "requestMediaDataWhenReadyOnQueue:usingBlock:", auxQueue, v13);
  }
  if (self->_enableAudio)
  {
    dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
    audioInput = self->_audioInput;
    audioQueue = self->_audioQueue;
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_14;
    v12[3] = &unk_1E6B15468;
    v12[4] = self;
    -[AVAssetWriterInput requestMediaDataWhenReadyOnQueue:usingBlock:](audioInput, "requestMediaDataWhenReadyOnQueue:usingBlock:", audioQueue, v12);
  }
  return -[VCPMovieAssetWriter processLivePhotoInfoMetadataTrack](self, "processLivePhotoInfoMetadataTrack");
}

void __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  char v10;
  char v11;
  const void *v12;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isReadyForMoreMediaData"))
  {
    while (1)
    {
      v2 = *(_QWORD **)(a1 + 32);
      if (v2[30] != 1)
        goto LABEL_7;
      v3 = (const void *)objc_msgSend(v2, "popSample");
      v12 = v3;
      v4 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v4 + 240) == 3)
        break;
      if (!v3)
      {
        v5 = 0;
        v6 = 1;
        goto LABEL_11;
      }
      if ((objc_msgSend(*(id *)(v4 + 72), "appendSampleBuffer:", v3) & 1) == 0)
      {
        v6 = 0;
        v5 = 1;
        goto LABEL_11;
      }
      CF<opaqueCMSampleBuffer *>::~CF(&v12);
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isReadyForMoreMediaData") & 1) == 0)
        goto LABEL_7;
    }
    v5 = 0;
    v6 = 0;
LABEL_11:
    CF<opaqueCMSampleBuffer *>::~CF(&v12);
    goto LABEL_12;
  }
LABEL_7:
  v5 = 0;
  v6 = 0;
LABEL_12:
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 200);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_2;
  block[3] = &unk_1E6B19698;
  block[4] = v7;
  v10 = v5;
  v11 = v6;
  dispatch_sync(v8, block);
}

void __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  __int16 v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
  if (v2 != 3 && !*(_BYTE *)(a1 + 40) && !*(_BYTE *)(a1 + 41))
    return;
  if (*(_BYTE *)(a1 + 41))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v9 = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Video encoding finished";
    v5 = (uint8_t *)&v9;
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v8 = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Video encoding failed";
    v5 = (uint8_t *)&v8;
  }
  else
  {
    if (v2 != 3 || (int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    LOWORD(v7) = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Video encoding aborted";
    v5 = (uint8_t *)&v7;
  }
  _os_log_impl(&dword_1B6C4A000, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
LABEL_17:
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 240) == 1)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      *(_QWORD *)(v6 + 240) = 3;
      v6 = *(_QWORD *)(a1 + 32);
    }
  }
  objc_msgSend(*(id *)(v6 + 72), "markAsFinished", v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 144));
}

void __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_12(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  char v10;
  char v11;
  const void *v12;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isReadyForMoreMediaData"))
  {
    while (1)
    {
      v2 = *(_QWORD **)(a1 + 32);
      if (v2[30] != 1)
        goto LABEL_7;
      v3 = (const void *)objc_msgSend(v2, "popAuxSample");
      v12 = v3;
      v4 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v4 + 240) == 3)
        break;
      if (!v3)
      {
        v5 = 0;
        v6 = 1;
        goto LABEL_11;
      }
      if ((objc_msgSend(*(id *)(v4 + 80), "appendSampleBuffer:", v3) & 1) == 0)
      {
        v6 = 0;
        v5 = 1;
        goto LABEL_11;
      }
      CF<opaqueCMSampleBuffer *>::~CF(&v12);
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isReadyForMoreMediaData") & 1) == 0)
        goto LABEL_7;
    }
    v5 = 0;
    v6 = 0;
LABEL_11:
    CF<opaqueCMSampleBuffer *>::~CF(&v12);
    goto LABEL_12;
  }
LABEL_7:
  v5 = 0;
  v6 = 0;
LABEL_12:
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 200);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_2_13;
  block[3] = &unk_1E6B19698;
  block[4] = v7;
  v10 = v5;
  v11 = v6;
  dispatch_sync(v8, block);
}

void __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_2_13(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  __int16 v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
  if (v2 != 3 && !*(_BYTE *)(a1 + 40) && !*(_BYTE *)(a1 + 41))
    return;
  if (*(_BYTE *)(a1 + 41))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v9 = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Aux encoding finished";
    v5 = (uint8_t *)&v9;
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v8 = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Aux encoding failed";
    v5 = (uint8_t *)&v8;
  }
  else
  {
    if (v2 != 3 || (int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    LOWORD(v7) = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Aux encoding aborted";
    v5 = (uint8_t *)&v7;
  }
  _os_log_impl(&dword_1B6C4A000, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
LABEL_17:
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 240) == 1)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      *(_QWORD *)(v6 + 240) = 3;
      v6 = *(_QWORD *)(a1 + 32);
    }
  }
  objc_msgSend(*(id *)(v6 + 80), "markAsFinished", v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 144));
}

void __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  int v5;
  char v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  char v11;
  char v12;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isReadyForMoreMediaData"))
  {
    do
    {
      v2 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v2 + 240) != 1)
        break;
      v3 = objc_msgSend(*(id *)(v2 + 24), "copyNextSampleBuffer");
      if (!v3)
      {
        v7 = 0;
        v6 = 1;
        goto LABEL_7;
      }
      v4 = (const void *)v3;
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "appendSampleBuffer:", v3);
      CFRelease(v4);
      if (!v5)
      {
        v6 = 0;
        v7 = 1;
        goto LABEL_7;
      }
    }
    while ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isReadyForMoreMediaData") & 1) != 0);
  }
  v6 = 0;
  v7 = 0;
LABEL_7:
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 200);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_2_15;
  v10[3] = &unk_1E6B19698;
  v10[4] = v8;
  v11 = v7;
  v12 = v6;
  dispatch_sync(v9, v10);
}

void __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_2_15(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  __int16 v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
  if (v2 != 3 && !*(_BYTE *)(a1 + 40) && !*(_BYTE *)(a1 + 41))
    return;
  if (*(_BYTE *)(a1 + 41))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v9 = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Audio encoding finished";
    v5 = (uint8_t *)&v9;
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v8 = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Audio encoding failed";
    v5 = (uint8_t *)&v8;
  }
  else
  {
    if (v2 != 3 || (int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    LOWORD(v7) = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Audio encoding aborted";
    v5 = (uint8_t *)&v7;
  }
  _os_log_impl(&dword_1B6C4A000, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
LABEL_17:
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 240) == 1)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      *(_QWORD *)(v6 + 240) = 3;
      v6 = *(_QWORD *)(a1 + 32);
    }
  }
  objc_msgSend(*(id *)(v6 + 88), "markAsFinished", v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 144));
}

- (int)copyPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  CF<__CVPixelBufferPool *> *p_pixelBufferPool;
  CVReturn PixelBuffer;
  void *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  uint8_t v14[8];
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  p_pixelBufferPool = &self->_pixelBufferPool;
  if (self->_pixelBufferPool.value_)
    goto LABEL_16;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Pixel buffers are not IOSurface-backed; copying",
      v14,
      2u);
  }
  v15[0] = *MEMORY[0x1E0CA9040];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CVPixelBufferGetPixelFormatType(a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v15[1] = *MEMORY[0x1E0CA90E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetWidth(a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  v15[2] = *MEMORY[0x1E0CA8FD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetHeight(a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = *MEMORY[0x1E0CA8FF0];
  v16[2] = v11;
  v16[3] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (p_pixelBufferPool->value_)
  {
    CFRelease(p_pixelBufferPool->value_);
    p_pixelBufferPool->value_ = 0;
  }
  PixelBuffer = CVPixelBufferPoolCreate(0, 0, v12, &p_pixelBufferPool->value_);

  if (!PixelBuffer)
  {
LABEL_16:
    if (self->_transferSession.value_
      || (PixelBuffer = VTPixelTransferSessionCreate(0, &self->_transferSession.value_)) == 0)
    {
      PixelBuffer = CVPixelBufferPoolCreatePixelBuffer(0, p_pixelBufferPool->value_, a4);
      if (!PixelBuffer)
        return VTPixelTransferSessionTransferImage(self->_transferSession.value_, a3, *a4);
    }
  }
  return PixelBuffer;
}

- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4 withAttachment:(id)a5
{
  id v8;
  OSStatus v9;
  const __CFString *v10;
  void *v11;
  CFTypeRef *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  CFTypeRef v16;
  CMAttachmentBearerRef target;
  CFTypeRef cf;
  CMSampleTimingInfo sampleTiming;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  v8 = a5;
  if (a3)
  {
    if (self->_status == 1)
    {
      formatDescriptionOut = 0;
      v9 = CMVideoFormatDescriptionCreateForImageBuffer(0, a3, &formatDescriptionOut);
      if (v9)
      {
LABEL_22:
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
        goto LABEL_23;
      }
      *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x1E0CA2E18];
      sampleTiming.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      sampleTiming.presentationTimeStamp = (CMTime)*a4;
      sampleTiming.decodeTimeStamp = sampleTiming.duration;
      cf = 0;
      if (CVPixelBufferGetIOSurface(a3))
      {
        target = 0;
        cf = CFRetain(a3);
        CF<opaqueCMSampleBuffer *>::~CF(&target);
      }
      else
      {
        v9 = -[VCPMovieAssetWriter copyPixelBuffer:toPixelBuffer:](self, "copyPixelBuffer:toPixelBuffer:", a3, &cf);
        if (v9)
        {
LABEL_21:
          CF<opaqueCMSampleBuffer *>::~CF(&cf);
          goto LABEL_22;
        }
      }
      target = 0;
      v9 = CMSampleBufferCreateForImageBuffer(0, (CVImageBufferRef)cf, 1u, 0, 0, formatDescriptionOut, &sampleTiming, (CMSampleBufferRef *)&target);
      if (!v9)
      {
        v10 = (const __CFString *)*MEMORY[0x1E0CA26A8];
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CA26A8]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
        if (v11
          || (v10 = (const __CFString *)*MEMORY[0x1E0CA26D0],
              objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CA26D0]),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v13,
              v13))
        {
          CMSetAttachment(target, v10, *v12, 1u);
        }
        v14 = (const __CFString *)*MEMORY[0x1E0CA26A0];
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CA26A0]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          CMSetAttachment(target, v14, *v12, 1u);
        if (target)
          v16 = CFRetain(target);
        else
          v16 = 0;
        -[VCPMovieAssetWriter pushSample:](self, "pushSample:", v16);
      }
      CF<opaqueCMSampleBuffer *>::~CF(&target);
      goto LABEL_21;
    }
    v9 = -18;
  }
  else
  {
    v9 = -50;
  }
LABEL_23:

  return v9;
}

- (int)addAuxPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4 withAttachment:(id)a5
{
  id v8;
  OSStatus v9;
  const __CFString *v10;
  void *v11;
  CFTypeRef *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  CFTypeRef v16;
  CMAttachmentBearerRef target;
  CFTypeRef cf;
  CMSampleTimingInfo sampleTiming;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  v8 = a5;
  if (a3)
  {
    if (self->_status == 1)
    {
      formatDescriptionOut = 0;
      v9 = CMVideoFormatDescriptionCreateForImageBuffer(0, a3, &formatDescriptionOut);
      if (v9)
      {
LABEL_22:
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
        goto LABEL_23;
      }
      *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x1E0CA2E18];
      sampleTiming.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      sampleTiming.presentationTimeStamp = (CMTime)*a4;
      sampleTiming.decodeTimeStamp = sampleTiming.duration;
      cf = 0;
      if (CVPixelBufferGetIOSurface(a3))
      {
        target = 0;
        cf = CFRetain(a3);
        CF<opaqueCMSampleBuffer *>::~CF(&target);
      }
      else
      {
        v9 = -[VCPMovieAssetWriter copyPixelBuffer:toPixelBuffer:](self, "copyPixelBuffer:toPixelBuffer:", a3, &cf);
        if (v9)
        {
LABEL_21:
          CF<opaqueCMSampleBuffer *>::~CF(&cf);
          goto LABEL_22;
        }
      }
      target = 0;
      v9 = CMSampleBufferCreateForImageBuffer(0, (CVImageBufferRef)cf, 1u, 0, 0, formatDescriptionOut, &sampleTiming, (CMSampleBufferRef *)&target);
      if (!v9)
      {
        v10 = (const __CFString *)*MEMORY[0x1E0CA26A8];
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CA26A8]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
        if (v11
          || (v10 = (const __CFString *)*MEMORY[0x1E0CA26D0],
              objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CA26D0]),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v13,
              v13))
        {
          CMSetAttachment(target, v10, *v12, 1u);
        }
        v14 = (const __CFString *)*MEMORY[0x1E0CA26A0];
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CA26A0]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          CMSetAttachment(target, v14, *v12, 1u);
        if (target)
          v16 = CFRetain(target);
        else
          v16 = 0;
        -[VCPMovieAssetWriter pushAuxSample:](self, "pushAuxSample:", v16);
      }
      CF<opaqueCMSampleBuffer *>::~CF(&target);
      goto LABEL_21;
    }
    v9 = -18;
  }
  else
  {
    v9 = -50;
  }
LABEL_23:

  return v9;
}

- (int)addLivePhotoInfoBuffer:(opaqueCMSampleBuffer *)a3
{
  if (!a3)
    return -50;
  if (self->_status != 1)
    return -18;
  -[VCPMovieAssetWriter pushLivePhotoInfoSample:](self, "pushLivePhotoInfoSample:");
  return 0;
}

- (void)updateStillPTS:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_stillPTS.epoch = a3->var3;
  *(_OWORD *)&self->_stillPTS.value = v3;
}

- (int)setupMetadataTrack
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  AVAssetReaderTrackOutput *v17;
  AVAssetReaderTrackOutput *stillImageOutput;
  BOOL v19;
  AVAssetWriterInput **p_stillImageInput;
  AVAssetReaderTrackOutput *v21;
  AVAssetReaderTrackOutput *videoOrientationOutput;
  BOOL v23;
  _BOOL4 v24;
  AVAssetWriterInputMetadataAdaptor *v25;
  AVAssetWriterInputMetadataAdaptor *styleInfoAdaptor;
  AVAssetWriter *writer;
  void *v28;
  AVAssetWriter *v29;
  void *v30;
  uint64_t v31;
  int v32;
  __int128 v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[AVAssetTrack asset](self->_track, "asset");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAssetWriter setMetadata:](self->_writer, "setMetadata:", v3);

  v4 = *MEMORY[0x1E0C8A7D0];
  objc_msgSend(v36, "vcp_enabledTracksWithMediaType:", *MEMORY[0x1E0C8A7D0]);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (!v5)
  {
    v32 = 0;
    goto LABEL_38;
  }
  v7 = *(_QWORD *)v41;
  v38 = *MEMORY[0x1E0CA4CC0];
  v37 = *MEMORY[0x1E0CA2590];
  v35 = *MEMORY[0x1E0D053E0];
  *(_QWORD *)&v6 = 138412290;
  v34 = v6;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v41 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v8);
      objc_msgSend(v9, "formatDescriptions", v34);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "formatDescriptions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count") != 1)
          goto LABEL_37;
        v14 = objc_alloc(MEMORY[0x1E0C8B020]);
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithMediaType:outputSettings:sourceFormatHint:", v4, 0, v15);

        if (objc_msgSend(v12, "containsObject:", v38))
        {
          objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v9, 0);
          v17 = (AVAssetReaderTrackOutput *)objc_claimAutoreleasedReturnValue();
          stillImageOutput = self->_stillImageOutput;
          self->_stillImageOutput = v17;

          if (!-[AVAssetReader canAddOutput:](self->_assetReader, "canAddOutput:", self->_stillImageOutput))
            goto LABEL_36;
          -[AVAssetReader addOutput:](self->_assetReader, "addOutput:", self->_stillImageOutput);
          objc_storeStrong((id *)&self->_stillImageInput, v16);
          v19 = -[AVAssetWriter canAddInput:](self->_writer, "canAddInput:", self->_stillImageInput);
          p_stillImageInput = &self->_stillImageInput;
          if (!v19)
            goto LABEL_36;
          goto LABEL_18;
        }
        if (objc_msgSend(v12, "containsObject:", v37))
        {
          objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v9, 0);
          v21 = (AVAssetReaderTrackOutput *)objc_claimAutoreleasedReturnValue();
          videoOrientationOutput = self->_videoOrientationOutput;
          self->_videoOrientationOutput = v21;

          if (!-[AVAssetReader canAddOutput:](self->_assetReader, "canAddOutput:", self->_videoOrientationOutput))
            goto LABEL_36;
          -[AVAssetReader addOutput:](self->_assetReader, "addOutput:", self->_videoOrientationOutput);
          objc_storeStrong((id *)&self->_videoOrientationInput, v16);
          v23 = -[AVAssetWriter canAddInput:](self->_writer, "canAddInput:", self->_videoOrientationInput);
          p_stillImageInput = &self->_videoOrientationInput;
          if (!v23)
            goto LABEL_36;
LABEL_18:
          -[AVAssetWriter addInput:](self->_writer, "addInput:", *p_stillImageInput);
        }
        else
        {
          if (objc_msgSend(v12, "containsObject:", v35))
          {
            objc_storeStrong((id *)&self->_livePhotoInfoInput, v16);
            v24 = -[AVAssetWriter canAddInput:](self->_writer, "canAddInput:", self->_livePhotoInfoInput);
            p_stillImageInput = &self->_livePhotoInfoInput;
            if (!v24)
              goto LABEL_36;
            goto LABEL_18;
          }
          if (objc_msgSend(v12, "containsObject:", CFSTR("mdta/com.apple.quicktime.smartstyle-info")))
          {
            v25 = (AVAssetWriterInputMetadataAdaptor *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B030]), "initWithAssetWriterInput:", v16);
            styleInfoAdaptor = self->_styleInfoAdaptor;
            self->_styleInfoAdaptor = v25;

            writer = self->_writer;
            -[AVAssetWriterInputMetadataAdaptor assetWriterInput](self->_styleInfoAdaptor, "assetWriterInput");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(writer) = -[AVAssetWriter canAddInput:](writer, "canAddInput:", v28);

            if ((writer & 1) == 0)
              goto LABEL_36;
            v29 = self->_writer;
            -[AVAssetWriterInputMetadataAdaptor assetWriterInput](self->_styleInfoAdaptor, "assetWriterInput");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVAssetWriter addInput:](v29, "addInput:", v30);
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v34;
              v45 = v12;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unknown metadata with identifiers: %@", buf, 0xCu);
            }
            objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v9, 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[AVAssetReader canAddOutput:](self->_assetReader, "canAddOutput:", v30)
              || (-[AVAssetReader addOutput:](self->_assetReader, "addOutput:", v30),
                  !-[AVAssetWriter canAddInput:](self->_writer, "canAddInput:", v16)))
            {

LABEL_36:
LABEL_37:

              v32 = -18;
              goto LABEL_38;
            }
            -[AVAssetWriter addInput:](self->_writer, "addInput:", v16);
            -[NSMapTable setObject:forKey:](self->_inputToOutputMap, "setObject:forKey:", v30, v16);
          }

        }
      }
      ++v8;
    }
    while (v5 != v8);
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    v5 = v31;
    v32 = 0;
  }
  while (v31);
LABEL_38:

  return v32;
}

- (int)setupAdditionalAuxTrack
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  NSMapTable *auxInputToOutputMap;
  void *v21;
  int v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  void *v33;
  uint64_t i;
  _OWORD v35[3];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[AVAssetTrack asset](self->_track, "asset");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAssetWriter setMetadata:](self->_writer, "setMetadata:", v3);

  -[AVAssetTrack asset](self->_track, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0C8A7A8];
  objc_msgSend(v4, "tracksWithMediaType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v5;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v44;
    v28 = *MEMORY[0x1E0C8A910];
    v25 = *MEMORY[0x1E0C8A9F0];
    v26 = *MEMORY[0x1E0C8AAE8];
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v6, "formatDescriptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v6, "metadataForFormat:", v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B020]), "initWithMediaType:outputSettings:sourceFormatHint:", v29, 0, 0);
          if (v33)
          {
            objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v33, v26, v25);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              v41 = 0u;
              v42 = 0u;
              v39 = 0u;
              v40 = 0u;
              v24 = v10;
              v11 = v10;
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
              if (v12)
              {
                v13 = *(_QWORD *)v40;
                while (2)
                {
                  for (j = 0; j != v12; ++j)
                  {
                    if (*(_QWORD *)v40 != v13)
                      objc_enumerationMutation(v11);
                    v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                    objc_msgSend(v9, "setMarksOutputTrackAsEnabled:", objc_msgSend(v6, "isEnabled"));
                    objc_msgSend(v15, "stringValue");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.quicktime.video-map.smart-style-delta-map"));

                    if ((v17 & 1) == 0)
                    {
                      if ((int)MediaAnalysisLogLevel() >= 5
                        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v15, "stringValue");
                        v18 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        v48 = v18;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Setting up aux track with name: %@", buf, 0xCu);

                      }
                      if (v6)
                      {
                        objc_msgSend(v6, "preferredTransform");
                      }
                      else
                      {
                        v37 = 0u;
                        v38 = 0u;
                        v36 = 0u;
                      }
                      v35[0] = v36;
                      v35[1] = v37;
                      v35[2] = v38;
                      objc_msgSend(v9, "setTransform:", v35);
                      objc_msgSend(v6, "metadata");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v9, "setMetadata:", v19);

                      if (!-[AVAssetWriter canAddInput:](self->_writer, "canAddInput:", v9))
                      {

                        v22 = -18;
                        goto LABEL_33;
                      }
                      -[AVAssetWriter addInput:](self->_writer, "addInput:", v9);
                      auxInputToOutputMap = self->_auxInputToOutputMap;
                      objc_msgSend(v15, "stringValue");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSMapTable setObject:forKey:](auxInputToOutputMap, "setObject:forKey:", v9, v21);

                    }
                  }
                  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
                  if (v12)
                    continue;
                  break;
                }
              }

              v10 = v24;
            }

          }
        }
      }
      v22 = 0;
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v30);
  }
  else
  {
    v22 = 0;
  }
LABEL_33:

  return v22;
}

- (int)setupAudioTrack
{
  void *v3;
  AVAssetReaderTrackOutput *v4;
  AVAssetReaderTrackOutput *audioOutput;
  void *v6;
  void *v7;
  void *v8;
  AVAssetWriterInput *v9;
  AVAssetWriterInput *audioInput;
  int v11;
  uint8_t v13[8];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = *MEMORY[0x1E0C898E0];
  v15[0] = &unk_1E6B743A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", self->_audioTrack, v3);
  v4 = (AVAssetReaderTrackOutput *)objc_claimAutoreleasedReturnValue();
  audioOutput = self->_audioOutput;
  self->_audioOutput = v4;

  if (-[AVAssetReader canAddOutput:](self->_assetReader, "canAddOutput:", self->_audioOutput))
  {
    -[AVAssetReader addOutput:](self->_assetReader, "addOutput:", self->_audioOutput);
    -[AVAssetTrack formatDescriptions](self->_audioTrack, "formatDescriptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      v7 = (void *)MEMORY[0x1E0C8B020];
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assetWriterInputWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x1E0C8A7A0], 0, v8);
      v9 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
      audioInput = self->_audioInput;
      self->_audioInput = v9;

      if (self->_audioInput)
      {
        -[AVAssetWriter addInput:](self->_writer, "addInput:");
        v11 = 0;
LABEL_10:

        goto LABEL_11;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create asset audio writer input", v13, 2u);
      }
    }
    v11 = -18;
    goto LABEL_10;
  }
  v11 = -18;
LABEL_11:

  return v11;
}

- (int)setupVideoTrack:(int64_t)a3 withOutputSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  FourCharCode MediaSubType;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  AVAssetWriterInput *v24;
  AVAssetWriterInput *input;
  AVAssetWriterInput *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  _OWORD v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[8];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[7];
  _QWORD v39[8];

  height = a4.height;
  width = a4.width;
  v39[7] = *MEMORY[0x1E0C80C00];
  -[AVAssetTrack formatDescriptions](self->_track, "formatDescriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v9);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (MediaSubType == 1635148593)
    {
      v21 = *MEMORY[0x1E0CED198];
      v36[0] = *MEMORY[0x1E0CED1A0];
      v36[1] = v21;
      v37[0] = MEMORY[0x1E0C9AAB0];
      v37[1] = &unk_1E6B74408;
      v36[2] = *MEMORY[0x1E0CECEF0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v36[3] = *MEMORY[0x1E0CECEB0];
      v37[2] = v22;
      v37[3] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C8AE70], *MEMORY[0x1E0C8AE68]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C8AEB8]);
      if (*MEMORY[0x1E0C9D820] == width && *(double *)(MEMORY[0x1E0C9D820] + 8) == height)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (uint64_t)rint(width));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0C8AF60]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (uint64_t)rint(height));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0C8AEF0]);
    }
    else
    {
      if (MediaSubType != 1752589105)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_22;
        *(_WORD *)buf = 0;
        v27 = MEMORY[0x1E0C81028];
        v28 = "[FRC] Unexpected codec type";
        goto LABEL_21;
      }
      v12 = MEMORY[0x1E0C9AAA0];
      v13 = *MEMORY[0x1E0CED1A0];
      v38[0] = *MEMORY[0x1E0CECEB8];
      v38[1] = v13;
      v39[0] = MEMORY[0x1E0C9AAA0];
      v39[1] = MEMORY[0x1E0C9AAB0];
      v14 = *MEMORY[0x1E0CED098];
      v38[2] = *MEMORY[0x1E0CECF08];
      v38[3] = v14;
      v39[2] = &unk_1E6B743C0;
      v39[3] = &unk_1E6B743D8;
      v39[4] = &unk_1E6B743F0;
      v15 = *MEMORY[0x1E0CECEF0];
      v38[4] = *MEMORY[0x1E0CED2A0];
      v38[5] = v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38[6] = *MEMORY[0x1E0CED138];
      v39[5] = v16;
      v39[6] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C8AE78], *MEMORY[0x1E0C8AE68]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C8AEB8]);
      if (*MEMORY[0x1E0C9D820] == width && *(double *)(MEMORY[0x1E0C9D820] + 8) == height)
      {
LABEL_12:

        objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x1E0C8A808], v11, v9);
        v24 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
        input = self->_input;
        self->_input = v24;

        v26 = self->_input;
        if (v26)
        {
          if (self->_track)
          {
            -[AVAssetTrack preferredTransform](self->_track, "preferredTransform");
            v26 = self->_input;
          }
          else
          {
            v33 = 0u;
            v34 = 0u;
            v32 = 0u;
          }
          v31[0] = v32;
          v31[1] = v33;
          v31[2] = v34;
          -[AVAssetWriterInput setTransform:](v26, "setTransform:", v31);
          -[AVAssetTrack metadata](self->_track, "metadata");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVAssetWriterInput setMetadata:](self->_input, "setMetadata:", v29);

          -[AVAssetWriter addInput:](self->_writer, "addInput:", self->_input);
          v20 = 0;
          goto LABEL_25;
        }
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
LABEL_22:
          v20 = -18;
LABEL_25:

          goto LABEL_26;
        }
        *(_WORD *)buf = 0;
        v27 = MEMORY[0x1E0C81028];
        v28 = "Failed to create asset video writer input";
LABEL_21:
        _os_log_impl(&dword_1B6C4A000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (uint64_t)rint(width));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0C8AF60]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (uint64_t)rint(height));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0C8AEF0]);
    }

    goto LABEL_12;
  }
  v20 = -18;
LABEL_26:

  return v20;
}

- (int)setupAuxTrack:(int64_t)a3 withOutputSize:(CGSize)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  CGSize PresentationDimensions;
  CGSize v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  AVAssetWriterInput *v47;
  AVAssetWriterInput *auxInput;
  AVAssetWriterInput *v49;
  int v50;
  void *v51;
  uint64_t v53;
  id obj;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  _OWORD v64[3];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[16];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[15];
  _QWORD v78[15];
  _QWORD v79[4];
  _QWORD v80[4];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  -[AVAssetTrack asset](self->_track, "asset", a4.width, a4.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C8A7A8];
  objc_msgSend(v4, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  v53 = v5;
  v8 = 0;
  if (v7)
  {
    v59 = *MEMORY[0x1E0C8A910];
    v60 = *(_QWORD *)v74;
    v57 = *MEMORY[0x1E0C8A9F0];
    v58 = *MEMORY[0x1E0C8AAE8];
    do
    {
      v61 = v7;
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v74 != v60)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(v10, "metadataForFormat:", v59);
        v11 = objc_claimAutoreleasedReturnValue();
        v63 = (void *)v11;
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v11, v58, v57);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v12;
          if (v12)
          {
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            v13 = v12;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
            if (v14)
            {
              v15 = *(_QWORD *)v70;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v70 != v15)
                    objc_enumerationMutation(v13);
                  objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j), "stringValue");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.quicktime.video-map.smart-style-delta-map"));

                  if (v18)
                  {
                    v19 = v10;

                    v8 = v19;
                  }
                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
              }
              while (v14);
            }

          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v7);
  }

  objc_msgSend(v8, "formatDescriptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count") == 1)
  {
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v21, 0, 1u);
    v23 = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v21, 0, 0);
    v79[0] = *MEMORY[0x1E0C8AE50];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", PresentationDimensions.width);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v24;
    v79[1] = *MEMORY[0x1E0C8AE30];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", PresentationDimensions.height);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0C8AE38];
    v80[1] = v25;
    v80[2] = &unk_1E6B743C0;
    v27 = *MEMORY[0x1E0C8AE48];
    v79[2] = v26;
    v79[3] = v27;
    v80[3] = &unk_1E6B743C0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v30 = MEMORY[0x1E0C9AAA0];
    v31 = *MEMORY[0x1E0CECEB8];
    v77[0] = *MEMORY[0x1E0CECEB0];
    v77[1] = v31;
    v78[0] = MEMORY[0x1E0C9AAA0];
    v78[1] = MEMORY[0x1E0C9AAA0];
    v32 = MEMORY[0x1E0C9AAB0];
    v33 = *MEMORY[0x1E0CECF08];
    v77[2] = *MEMORY[0x1E0CED1A0];
    v77[3] = v33;
    v78[2] = MEMORY[0x1E0C9AAB0];
    v78[3] = &unk_1E6B743C0;
    v34 = *MEMORY[0x1E0CED2A0];
    v77[4] = *MEMORY[0x1E0CED098];
    v77[5] = v34;
    v78[4] = &unk_1E6B743D8;
    v78[5] = &unk_1E6B743F0;
    v77[6] = *MEMORY[0x1E0CECEF0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x1E0CED138];
    v78[6] = v35;
    v78[7] = v30;
    v37 = *MEMORY[0x1E0CECFD0];
    v77[7] = v36;
    v77[8] = v37;
    v38 = *MEMORY[0x1E0CED0B0];
    v78[8] = &unk_1E6B74420;
    v78[9] = &unk_1E6B723D0;
    v39 = *MEMORY[0x1E0CED0C0];
    v77[9] = v38;
    v77[10] = v39;
    v40 = *MEMORY[0x1E0CED0D8];
    v78[10] = &unk_1E6B743F0;
    v78[11] = v32;
    v41 = *MEMORY[0x1E0CED178];
    v77[11] = v40;
    v77[12] = v41;
    v42 = *MEMORY[0x1E0CED1B0];
    v78[12] = &unk_1E6B74438;
    v78[13] = v32;
    v43 = *MEMORY[0x1E0C8AE40];
    v77[13] = v42;
    v77[14] = v43;
    v78[14] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 15);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C8AE78], *MEMORY[0x1E0C8AE68]);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0C8AEB8]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v23.width);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v45, *MEMORY[0x1E0C8AF60]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v23.height);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v46, *MEMORY[0x1E0C8AEF0]);

    objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:sourceFormatHint:", v53, v29, 0);
    v47 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
    auxInput = self->_auxInput;
    self->_auxInput = v47;

    v49 = self->_auxInput;
    if (v49)
    {
      if (v8)
      {
        objc_msgSend(v8, "preferredTransform");
        v49 = self->_auxInput;
      }
      else
      {
        v66 = 0u;
        v67 = 0u;
        v65 = 0u;
      }
      v64[0] = v65;
      v64[1] = v66;
      v64[2] = v67;
      -[AVAssetWriterInput setTransform:](v49, "setTransform:", v64);
      objc_msgSend(v8, "metadata");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAssetWriterInput setMetadata:](self->_auxInput, "setMetadata:", v51);

      -[AVAssetWriterInput setMarksOutputTrackAsEnabled:](self->_auxInput, "setMarksOutputTrackAsEnabled:", objc_msgSend(v8, "isEnabled"));
      -[AVAssetWriter addInput:](self->_writer, "addInput:", self->_auxInput);
      v50 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create asset video writer input", buf, 2u);
      }
      v50 = -18;
    }

  }
  else
  {
    v50 = -18;
  }

  return v50;
}

- (int)appendMetadataTrack
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[VCPMovieAssetWriter processStillImageMetadataTrack](self, "processStillImageMetadataTrack");
  if (!v3)
  {
    v3 = -[VCPMovieAssetWriter passthroughMetadataTrackFrom:to:](self, "passthroughMetadataTrackFrom:to:", self->_videoOrientationOutput, self->_videoOrientationInput);
    if (!v3)
    {
      -[NSMapTable keyEnumerator](self->_inputToOutputMap, "keyEnumerator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      while (1)
      {
        objc_msgSend(v4, "nextObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v6)
          break;
        -[NSMapTable objectForKey:](self->_inputToOutputMap, "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = -[VCPMovieAssetWriter passthroughMetadataTrackFrom:to:](self, "passthroughMetadataTrackFrom:to:", v7, v6);

        v5 = v6;
        if (v3)
          goto LABEL_8;
      }
      v3 = 0;
LABEL_8:

    }
  }
  return v3;
}

- (int)addAdditionalAuxTracks:(opaqueCMSampleBuffer *)a3 toTrack:(id)a4
{
  void *v6;
  int v7;

  -[NSMapTable objectForKey:](self->_auxInputToOutputMap, "objectForKey:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isReadyForMoreMediaData"))
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 0;
  if (a3 && self->_status == 1)
  {
    if ((objc_msgSend(v6, "appendSampleBuffer:", a3) & 1) == 0)
    {
      CFRelease(a3);
      self->_status = 3;
      v7 = -18;
      goto LABEL_7;
    }
    CFRelease(a3);
    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (int)addStyleInfoData:(id)a3 timerange:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  __int128 v9;
  void *v10;
  _OWORD v12[3];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C8B3B0]);
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&a4->var0.var3;
  v12[0] = *(_OWORD *)&a4->var0.var0;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&a4->var1.var1;
  v10 = (void *)objc_msgSend(v7, "initWithItems:timeRange:", v8, v12);

  -[AVAssetWriterInputMetadataAdaptor appendTimedMetadataGroup:](self->_styleInfoAdaptor, "appendTimedMetadataGroup:", v10);
  return 0;
}

- (int)processStillImageMetadataTrack
{
  AVAssetWriterInput *stillImageInput;
  OS_dispatch_queue *metadataQueue;
  _QWORD v6[5];

  dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
  stillImageInput = self->_stillImageInput;
  metadataQueue = self->_metadataQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__VCPMovieAssetWriter_processStillImageMetadataTrack__block_invoke;
  v6[3] = &unk_1E6B15468;
  v6[4] = self;
  -[AVAssetWriterInput requestMediaDataWhenReadyOnQueue:usingBlock:](stillImageInput, "requestMediaDataWhenReadyOnQueue:usingBlock:", metadataQueue, v6);
  return 0;
}

void __53__VCPMovieAssetWriter_processStillImageMetadataTrack__block_invoke(uint64_t a1)
{
  uint64_t v2;
  opaqueCMSampleBuffer *v3;
  opaqueCMSampleBuffer *v4;
  char v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  char v10;
  char v11;
  CMTime outputPresentationTimeStamp;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "isReadyForMoreMediaData"))
  {
    do
    {
      v2 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v2 + 240) != 1)
        break;
      v3 = (opaqueCMSampleBuffer *)objc_msgSend(*(id *)(v2 + 40), "copyNextSampleBuffer");
      if (!v3)
      {
        v6 = 0;
        v5 = 1;
        goto LABEL_8;
      }
      v4 = v3;
      if (CMSampleBufferGetNumSamples(v3))
      {
        outputPresentationTimeStamp = *(CMTime *)(*(_QWORD *)(a1 + 32) + 264);
        CMSampleBufferSetOutputPresentationTimeStamp(v4, &outputPresentationTimeStamp);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "appendSampleBuffer:", v4) & 1) == 0)
        {
          CFRelease(v4);
          v5 = 0;
          v6 = 1;
          goto LABEL_8;
        }
      }
      CFRelease(v4);
    }
    while ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "isReadyForMoreMediaData") & 1) != 0);
  }
  v5 = 0;
  v6 = 0;
LABEL_8:
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 200);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__VCPMovieAssetWriter_processStillImageMetadataTrack__block_invoke_2;
  v9[3] = &unk_1E6B19698;
  v9[4] = v7;
  v10 = v6;
  v11 = v5;
  dispatch_sync(v8, v9);
}

void __53__VCPMovieAssetWriter_processStillImageMetadataTrack__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  __int16 v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
  if (v2 != 3 && !*(_BYTE *)(a1 + 40) && !*(_BYTE *)(a1 + 41))
    return;
  if (*(_BYTE *)(a1 + 41))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v9 = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Still image metadata encoding finished";
    v5 = (uint8_t *)&v9;
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v8 = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Still image metadata failed";
    v5 = (uint8_t *)&v8;
  }
  else
  {
    if (v2 != 3 || (int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    LOWORD(v7) = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Still image metadata aborted";
    v5 = (uint8_t *)&v7;
  }
  _os_log_impl(&dword_1B6C4A000, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
LABEL_17:
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 240) == 1)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      *(_QWORD *)(v6 + 240) = 3;
      v6 = *(_QWORD *)(a1 + 32);
    }
  }
  objc_msgSend(*(id *)(v6 + 104), "markAsFinished", v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 144));
}

- (int)processLivePhotoInfoMetadataTrack
{
  AVAssetWriterInput *livePhotoInfoInput;
  OS_dispatch_queue *metadataQueue;
  _QWORD v6[5];

  dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
  livePhotoInfoInput = self->_livePhotoInfoInput;
  metadataQueue = self->_metadataQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__VCPMovieAssetWriter_processLivePhotoInfoMetadataTrack__block_invoke;
  v6[3] = &unk_1E6B15468;
  v6[4] = self;
  -[AVAssetWriterInput requestMediaDataWhenReadyOnQueue:usingBlock:](livePhotoInfoInput, "requestMediaDataWhenReadyOnQueue:usingBlock:", metadataQueue, v6);
  return 0;
}

void __56__VCPMovieAssetWriter_processLivePhotoInfoMetadataTrack__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  char v10;
  char v11;
  const void *v12;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isReadyForMoreMediaData"))
  {
    while (1)
    {
      v2 = *(_QWORD **)(a1 + 32);
      if (v2[30] != 1)
        goto LABEL_7;
      v3 = (const void *)objc_msgSend(v2, "popLivePhotoInfoSample");
      v12 = v3;
      v4 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v4 + 240) == 3)
        break;
      if (!v3)
      {
        v5 = 0;
        v6 = 1;
        goto LABEL_11;
      }
      if ((objc_msgSend(*(id *)(v4 + 96), "appendSampleBuffer:", v3) & 1) == 0)
      {
        v6 = 0;
        v5 = 1;
        goto LABEL_11;
      }
      CF<opaqueCMSampleBuffer *>::~CF(&v12);
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isReadyForMoreMediaData") & 1) == 0)
        goto LABEL_7;
    }
    v5 = 0;
    v6 = 0;
LABEL_11:
    CF<opaqueCMSampleBuffer *>::~CF(&v12);
    goto LABEL_12;
  }
LABEL_7:
  v5 = 0;
  v6 = 0;
LABEL_12:
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 200);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__VCPMovieAssetWriter_processLivePhotoInfoMetadataTrack__block_invoke_2;
  block[3] = &unk_1E6B19698;
  block[4] = v7;
  v10 = v5;
  v11 = v6;
  dispatch_sync(v8, block);
}

void __56__VCPMovieAssetWriter_processLivePhotoInfoMetadataTrack__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  __int16 v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
  if (v2 != 3 && !*(_BYTE *)(a1 + 40) && !*(_BYTE *)(a1 + 41))
    return;
  if (*(_BYTE *)(a1 + 41))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v9 = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Live photo info encoding finished";
    v5 = (uint8_t *)&v9;
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v8 = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Live photo info encoding failed";
    v5 = (uint8_t *)&v8;
  }
  else
  {
    if (v2 != 3 || (int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    LOWORD(v7) = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Live photo info encoding aborted";
    v5 = (uint8_t *)&v7;
  }
  _os_log_impl(&dword_1B6C4A000, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
LABEL_17:
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 240) == 1)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      *(_QWORD *)(v6 + 240) = 3;
      v6 = *(_QWORD *)(a1 + 32);
    }
  }
  objc_msgSend(*(id *)(v6 + 96), "markAsFinished", v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 144));
}

- (int)passthroughMetadataTrackFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *metadataQueue;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  VCPMovieAssetWriter *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
  metadataQueue = self->_metadataQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__VCPMovieAssetWriter_passthroughMetadataTrackFrom_to___block_invoke;
  v12[3] = &unk_1E6B17B88;
  v13 = v7;
  v14 = self;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v10, "requestMediaDataWhenReadyOnQueue:usingBlock:", metadataQueue, v12);

  return 0;
}

void __55__VCPMovieAssetWriter_passthroughMetadataTrackFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int v4;
  char v5;
  char v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;
  char v14;

  if (objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData"))
  {
    while (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 240) == 1)
    {
      v2 = objc_msgSend(*(id *)(a1 + 48), "copyNextSampleBuffer");
      if (!v2)
      {
        v6 = 0;
        v5 = 1;
        goto LABEL_7;
      }
      v3 = (const void *)v2;
      v4 = objc_msgSend(*(id *)(a1 + 32), "appendSampleBuffer:", v2);
      CFRelease(v3);
      if (!v4)
      {
        v5 = 0;
        v6 = 1;
        goto LABEL_7;
      }
      if ((objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData") & 1) == 0)
        break;
    }
  }
  v5 = 0;
  v6 = 0;
LABEL_7:
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __55__VCPMovieAssetWriter_passthroughMetadataTrackFrom_to___block_invoke_2;
  v10[3] = &unk_1E6B196C0;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v9 = *(NSObject **)(v7 + 200);
  v10[1] = 3221225472;
  v10[4] = v7;
  v13 = v6;
  v14 = v5;
  v11 = v8;
  v12 = *(id *)(a1 + 32);
  dispatch_sync(v9, v10);

}

void __55__VCPMovieAssetWriter_passthroughMetadataTrackFrom_to___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) != 3 && !*(_BYTE *)(a1 + 56) && !*(_BYTE *)(a1 + 57))
    return;
  objc_msgSend(*(id *)(a1 + 40), "track");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formatDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (*(_BYTE *)(a1 + 57))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_20;
    *(_DWORD *)v9 = 138412290;
    *(_QWORD *)&v9[4] = v5;
    v6 = MEMORY[0x1E0C81028];
    v7 = "[FRC] Metadata track encoding finished: %@";
  }
  else if (*(_BYTE *)(a1 + 56))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_20;
    *(_DWORD *)v9 = 138412290;
    *(_QWORD *)&v9[4] = v5;
    v6 = MEMORY[0x1E0C81028];
    v7 = "[FRC] Metadata track failed: %@";
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) != 3
      || (int)MediaAnalysisLogLevel() < 7
      || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      goto LABEL_20;
    }
    *(_DWORD *)v9 = 138412290;
    *(_QWORD *)&v9[4] = v5;
    v6 = MEMORY[0x1E0C81028];
    v7 = "[FRC] Metadata track aborted: %@";
  }
  _os_log_impl(&dword_1B6C4A000, v6, OS_LOG_TYPE_DEBUG, v7, v9, 0xCu);
LABEL_20:
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v8 + 240) == 1)
  {
    if (*(_BYTE *)(a1 + 56))
      *(_QWORD *)(v8 + 240) = 3;
  }
  objc_msgSend(*(id *)(a1 + 48), "markAsFinished", *(_OWORD *)v9);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 144));

}

- (int)passthroughAuxTrackFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *metadataQueue;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  VCPMovieAssetWriter *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
  metadataQueue = self->_metadataQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__VCPMovieAssetWriter_passthroughAuxTrackFrom_to___block_invoke;
  v12[3] = &unk_1E6B17B88;
  v13 = v7;
  v14 = self;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v10, "requestMediaDataWhenReadyOnQueue:usingBlock:", metadataQueue, v12);

  return 0;
}

void __50__VCPMovieAssetWriter_passthroughAuxTrackFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int v4;
  char v5;
  char v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  char v12;
  char v13;

  if (objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData"))
  {
    while (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 240) == 1)
    {
      v2 = objc_msgSend(*(id *)(a1 + 48), "copyNextSampleBuffer");
      if (!v2)
      {
        v6 = 0;
        v5 = 1;
        goto LABEL_7;
      }
      v3 = (const void *)v2;
      v4 = objc_msgSend(*(id *)(a1 + 32), "appendSampleBuffer:", v2);
      CFRelease(v3);
      if (!v4)
      {
        v5 = 0;
        v6 = 1;
        goto LABEL_7;
      }
      if ((objc_msgSend(*(id *)(a1 + 32), "isReadyForMoreMediaData") & 1) == 0)
        break;
    }
  }
  v5 = 0;
  v6 = 0;
LABEL_7:
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(NSObject **)(v7 + 200);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VCPMovieAssetWriter_passthroughAuxTrackFrom_to___block_invoke_2;
  block[3] = &unk_1E6B196E8;
  block[4] = v7;
  v12 = v6;
  v13 = v5;
  v11 = v8;
  dispatch_sync(v9, block);

}

void __50__VCPMovieAssetWriter_passthroughAuxTrackFrom_to___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  __int16 v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
  if (v2 != 3 && !*(_BYTE *)(a1 + 48) && !*(_BYTE *)(a1 + 49))
    return;
  if (*(_BYTE *)(a1 + 49))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v9 = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Aux track encoding finished";
    v5 = (uint8_t *)&v9;
  }
  else if (*(_BYTE *)(a1 + 48))
  {
    if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v8 = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Aux track failed";
    v5 = (uint8_t *)&v8;
  }
  else
  {
    if (v2 != 3 || (int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    LOWORD(v7) = 0;
    v3 = MEMORY[0x1E0C81028];
    v4 = "[FRC] Aux track aborted";
    v5 = (uint8_t *)&v7;
  }
  _os_log_impl(&dword_1B6C4A000, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
LABEL_17:
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 240) == 1)
  {
    if (*(_BYTE *)(a1 + 48))
      *(_QWORD *)(v6 + 240) = 3;
  }
  objc_msgSend(*(id *)(a1 + 40), "markAsFinished", v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 144));
}

- (int)finish
{
  int v3;
  dispatch_semaphore_t v4;
  AVAssetWriter *writer;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  intptr_t (*v12)(uint64_t);
  void *v13;
  VCPMovieAssetWriter *v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_status != 1)
    return -18;
  if (self->_enableAudio)
    -[VCPMovieAssetWriter appendMetadataTrack](self, "appendMetadataTrack");
  -[VCPMovieAssetWriter pushSample:](self, "pushSample:", 0);
  if (self->_enableStyle)
    -[VCPMovieAssetWriter pushAuxSample:](self, "pushAuxSample:", 0);
  -[VCPMovieAssetWriter pushLivePhotoInfoSample:](self, "pushLivePhotoInfoSample:", 0);
  dispatch_group_wait((dispatch_group_t)self->_encodingGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_status == 3)
    return -18;
  v4 = dispatch_semaphore_create(0);
  writer = self->_writer;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __29__VCPMovieAssetWriter_finish__block_invoke;
  v13 = &unk_1E6B16D58;
  v14 = self;
  v6 = v4;
  v15 = v6;
  -[AVAssetWriter finishWritingWithCompletionHandler:](writer, "finishWritingWithCompletionHandler:", &v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  -[AVAssetWriter error](self->_writer, "error", v10, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(writer) = v7 == 0;

  if ((writer & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[AVAssetWriter error](self->_writer, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Asset writer failed to complete with error %@", buf, 0xCu);

    }
    v3 = -18;
  }

  return v3;
}

intptr_t __29__VCPMovieAssetWriter_finish__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)cancel
{
  NSObject *statusOperationQueue;
  _QWORD block[5];

  statusOperationQueue = self->_statusOperationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__VCPMovieAssetWriter_cancel__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(statusOperationQueue, block);
  dispatch_group_wait((dispatch_group_t)self->_encodingGroup, 0xFFFFFFFFFFFFFFFFLL);
  -[AVAssetWriter cancelWriting](self->_writer, "cancelWriting");
  -[AVAssetReader cancelReading](self->_assetReader, "cancelReading");
}

uint64_t __29__VCPMovieAssetWriter_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t result;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
  v3 = MediaAnalysisLogLevel();
  if (v2 == 3)
  {
    if (v3 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FRC] Encoding failed", buf, 2u);
    }
  }
  else
  {
    if (v3 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[FRC] Cancelling encoding", v5, 2u);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 3;
  }
  while (1)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 160));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count"))
      break;
    objc_msgSend(*(id *)(a1 + 32), "popSample");
  }
  while (1)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 192));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "count"))
      break;
    objc_msgSend(*(id *)(a1 + 32), "popLivePhotoInfoSample");
  }
  while (1)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 176));
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "count");
    if (!result)
      break;
    objc_msgSend(*(id *)(a1 + 32), "popAuxSample");
  }
  return result;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleInfoAdaptor, 0);
  objc_storeStrong((id *)&self->_auxInputToOutputMap, 0);
  objc_storeStrong((id *)&self->_inputToOutputMap, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_transferSession.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBufferPool.value_);
  objc_storeStrong((id *)&self->_metadataQueue, 0);
  objc_storeStrong((id *)&self->_audioQueue, 0);
  objc_storeStrong((id *)&self->_auxQueue, 0);
  objc_storeStrong((id *)&self->_videoQueue, 0);
  objc_storeStrong((id *)&self->_statusOperationQueue, 0);
  objc_storeStrong((id *)&self->_livePhotoInfoDequeueSemaphore, 0);
  objc_storeStrong((id *)&self->_livePhotoInfoEnqueueSemaphore, 0);
  objc_storeStrong((id *)&self->_auxDequeueSemaphore, 0);
  objc_storeStrong((id *)&self->_auxEnqueueSemaphore, 0);
  objc_storeStrong((id *)&self->_dequeueSemaphore, 0);
  objc_storeStrong((id *)&self->_enqueueSemaphore, 0);
  objc_storeStrong((id *)&self->_encodingGroup, 0);
  objc_storeStrong((id *)&self->_livePhotoInfoQueue, 0);
  objc_storeStrong((id *)&self->_auxsampleQueue, 0);
  objc_storeStrong((id *)&self->_sampleQueue, 0);
  objc_storeStrong((id *)&self->_videoOrientationInput, 0);
  objc_storeStrong((id *)&self->_stillImageInput, 0);
  objc_storeStrong((id *)&self->_livePhotoInfoInput, 0);
  objc_storeStrong((id *)&self->_audioInput, 0);
  objc_storeStrong((id *)&self->_auxInput, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_audioTrack, 0);
  objc_storeStrong((id *)&self->_track, 0);
  objc_storeStrong((id *)&self->_stillImageOutput, 0);
  objc_storeStrong((id *)&self->_videoOrientationOutput, 0);
  objc_storeStrong((id *)&self->_audioOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 32) = 0;
  return self;
}

@end
