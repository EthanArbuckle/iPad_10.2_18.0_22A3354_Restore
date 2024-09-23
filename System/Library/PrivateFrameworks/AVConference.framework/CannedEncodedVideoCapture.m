@implementation CannedEncodedVideoCapture

- (CannedEncodedVideoCapture)initWithPath:(id)a3
{
  CannedEncodedVideoCapture *v4;
  CannedEncodedVideoCapture *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CannedEncodedVideoCapture;
  v4 = -[CannedEncodedVideoCapture init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    pthread_mutex_init(&v4->_inputMutex, 0);
    pthread_mutex_init(&v5->_attributeMutex, 0);
    v5->_frameCount = 0;
    v5->_movieURLString = (NSString *)a3;
    v5->_videoScaler = objc_alloc_init(VideoScaler);
    if (-[CannedEncodedVideoCapture initialize](v5, "initialize"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[CannedEncodedVideoCapture initWithPath:].cold.1();
      }

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  AVAssetTrack *metadataTrack;
  AVAssetReaderOutputMetadataAdaptor *metadataAdaptor;
  AVAssetReaderTrackOutput *readerMetadataTrackOutput;
  __CVPixelBufferPool *pixelBufferPool;
  __CVPixelBufferPool *rotatedPixelBufferPool;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  pthread_mutex_destroy(&self->_inputMutex);
  pthread_mutex_destroy(&self->_attributeMutex);

  metadataTrack = self->_metadataTrack;
  if (metadataTrack)

  metadataAdaptor = self->_metadataAdaptor;
  if (metadataAdaptor)

  readerMetadataTrackOutput = self->_readerMetadataTrackOutput;
  if (readerMetadataTrackOutput)

  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
    CFRelease(pixelBufferPool);
  rotatedPixelBufferPool = self->_rotatedPixelBufferPool;
  if (rotatedPixelBufferPool)
    CFRelease(rotatedPixelBufferPool);
  v8.receiver = self;
  v8.super_class = (Class)CannedEncodedVideoCapture;
  -[CannedEncodedVideoCapture dealloc](&v8, sel_dealloc);
}

- (int)loadVideoTrackFromList:(id)a3 error:(id)a4
{
  int v6;

  if (a4)
  {
    v6 = -2142633963;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedEncodedVideoCapture loadVideoTrackFromList:error:].cold.3();
    }
  }
  else if (objc_msgSend(a3, "count"))
  {
    -[CannedEncodedVideoCapture setVideoTrack:](self, "setVideoTrack:", objc_msgSend(a3, "firstObject"));
    if (self->_videoTrack)
    {
      return 0;
    }
    else
    {
      v6 = -2142633933;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[CannedEncodedVideoCapture loadVideoTrackFromList:error:].cold.2();
          return -2142633933;
        }
      }
    }
  }
  else
  {
    v6 = -2142633963;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedEncodedVideoCapture loadVideoTrackFromList:error:].cold.1();
    }
  }
  return v6;
}

- (int)loadMetadataTrackFromList:(id)a3 error:(id)a4
{
  id v7;
  AVAssetTrack *metadataTrack;
  int v9;

  v7 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (a4)
  {
    v9 = -2142633963;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedEncodedVideoCapture loadMetadataTrackFromList:error:].cold.1();
    }
  }
  else
  {
    if (objc_msgSend(a3, "count"))
    {
      -[CannedEncodedVideoCapture setMetadataTrack:](self, "setMetadataTrack:", objc_msgSend(a3, "firstObject"));
      metadataTrack = self->_metadataTrack;
      if (metadataTrack)
      {
        -[CannedEncodedVideoCapture setReaderMetadataTrackOutput:](self, "setReaderMetadataTrackOutput:", objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", metadataTrack, 0));
        -[CannedEncodedVideoCapture setMetadataAdaptor:](self, "setMetadataAdaptor:", objc_msgSend(MEMORY[0x1E0C8AFF0], "assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:", self->_readerMetadataTrackOutput));
        -[AVAssetReader addOutput:](self->_assetReader, "addOutput:", self->_readerMetadataTrackOutput);
      }
    }
    v9 = 0;
  }
  objc_msgSend(v7, "drain");
  return v9;
}

- (int)finalizeVideoCapture
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)"v024");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CA9040]);
  -[CannedEncodedVideoCapture setReaderVideoTrackOutput:](self, "setReaderVideoTrackOutput:", objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", self->_videoTrack, v4));
  if (self->_readerVideoTrackOutput)
  {
    -[AVAssetReader addOutput:](self->_assetReader, "addOutput:");
    if (-[AVAssetReader startReading](self->_assetReader, "startReading"))
    {
      v6 = 0;
    }
    else
    {
      v6 = -2142633980;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[CannedEncodedVideoCapture finalizeVideoCapture].cold.2();
      }
    }
  }
  else
  {
    v6 = -2142633933;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        -[CannedEncodedVideoCapture finalizeVideoCapture].cold.1();
        v6 = -2142633933;
      }
    }
  }
  objc_msgSend(v3, "drain");
  return v6;
}

- (int)loadCannedMediaAssets
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  AVURLAsset *compressedFileAsset;
  uint64_t v6;
  int v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = dispatch_semaphore_create(0);
  if (v3)
  {
    v4 = v3;
    compressedFileAsset = self->_compressedFileAsset;
    v6 = *MEMORY[0x1E0C8A808];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__CannedEncodedVideoCapture_loadCannedMediaAssets__block_invoke;
    v9[3] = &unk_1E9E57930;
    v9[5] = v4;
    v9[6] = &v10;
    v9[4] = self;
    -[AVURLAsset loadTracksWithMediaType:completionHandler:](compressedFileAsset, "loadTracksWithMediaType:completionHandler:", v6, v9);
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v4);
    v7 = *((_DWORD *)v11 + 6);
  }
  else
  {
    v7 = -2142633933;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedEncodedVideoCapture loadCannedMediaAssets].cold.1();
    }
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

intptr_t __50__CannedEncodedVideoCapture_loadCannedMediaAssets__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "loadVideoTrackFromList:error:", a2, a3);
  v4 = *(_QWORD *)(a1 + 48);
  if ((*(_DWORD *)(*(_QWORD *)(v4 + 8) + 24) & 0x80000000) != 0)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  v5 = *MEMORY[0x1E0C8A7D0];
  v9[0] = MEMORY[0x1E0C809B0];
  v6 = *(_OWORD *)(a1 + 32);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v9[1] = 3221225472;
  v9[2] = __50__CannedEncodedVideoCapture_loadCannedMediaAssets__block_invoke_2;
  v9[3] = &unk_1E9E57930;
  v11 = v4;
  v10 = v6;
  return objc_msgSend(v7, "loadTracksWithMediaType:completionHandler:", v5, v9);
}

intptr_t __50__CannedEncodedVideoCapture_loadCannedMediaAssets__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "loadMetadataTrackFromList:error:", a2, a3);
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) & 0x80000000) == 0)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "finalizeVideoCapture");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int)initializeAssetReader
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  AVURLAsset *compressedFileAsset;
  AVAssetReader *assetReader;
  int ErrorLogLevelForModule;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v4 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_movieURLString);
  v5 = objc_alloc(MEMORY[0x1E0C8B3C0]);
  v22 = *MEMORY[0x1E0C8AD90];
  v23[0] = MEMORY[0x1E0C9AAB0];
  v6 = objc_msgSend(v5, "initWithURL:options:", v4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1));
  if (v6)
  {
    v7 = (void *)v6;
    -[CannedEncodedVideoCapture setCompressedFileAsset:](self, "setCompressedFileAsset:", v6);

    compressedFileAsset = self->_compressedFileAsset;
    if (compressedFileAsset)
    {
      v15 = 0;
      -[CannedEncodedVideoCapture setAssetReader:](self, "setAssetReader:", objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", compressedFileAsset, &v15));
      if (v15)
      {
        v13 = -2142633963;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[CannedEncodedVideoCapture initializeAssetReader].cold.4();
        }
      }
      else
      {
        assetReader = self->_assetReader;
        ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        if (assetReader)
        {
          if (ErrorLogLevelForModule >= 7)
          {
            v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v17 = v11;
              v18 = 2080;
              v19 = "-[CannedEncodedVideoCapture initializeAssetReader]";
              v20 = 1024;
              v21 = 243;
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Enabling AVAssetReader preparesMediaDataForRealTimeConsumption", buf, 0x1Cu);
            }
          }
          -[AVAssetReader setPreparesMediaDataForRealTimeConsumption:](-[CannedEncodedVideoCapture assetReader](self, "assetReader"), "setPreparesMediaDataForRealTimeConsumption:", 1);
          v13 = -[CannedEncodedVideoCapture loadCannedMediaAssets](self, "loadCannedMediaAssets");
        }
        else
        {
          v13 = -2142633933;
          if (ErrorLogLevelForModule >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[CannedEncodedVideoCapture initializeAssetReader].cold.3();
          }
        }
      }
    }
    else
    {
      v13 = -2142633933;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[CannedEncodedVideoCapture initializeAssetReader].cold.2();
      }
    }
  }
  else
  {
    v13 = -2142633947;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedEncodedVideoCapture initializeAssetReader].cold.1();
    }
  }
  objc_msgSend(v3, "drain");
  return v13;
}

- (int)initialize
{
  int v3;
  float v4;
  AVAssetTrack *videoTrack;
  double Seconds;
  float v7;
  uint64_t v8;
  NSObject *v9;
  double allFrameRate;
  uint64_t v11;
  NSObject *v12;
  int allFrameCount;
  _QWORD v15[4];
  CMTime time;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = -[CannedEncodedVideoCapture initializeAssetReader](self, "initializeAssetReader");
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedEncodedVideoCapture initialize].cold.1();
    }
  }
  else
  {
    pthread_mutex_lock(&self->_inputMutex);
    -[AVAssetTrack nominalFrameRate](self->_videoTrack, "nominalFrameRate");
    self->_allFrameRate = v4;
    videoTrack = self->_videoTrack;
    if (videoTrack)
      -[AVAssetTrack timeRange](videoTrack, "timeRange");
    else
      memset(v15, 0, sizeof(v15));
    time = *(CMTime *)&v15[1];
    Seconds = CMTimeGetSeconds(&time);
    -[AVAssetTrack nominalFrameRate](self->_videoTrack, "nominalFrameRate");
    self->_allFrameCount = (int)(Seconds * v7 + 0.5);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        allFrameRate = self->_allFrameRate;
        *(_DWORD *)buf = 136315906;
        v18 = v8;
        v19 = 2080;
        v20 = "-[CannedEncodedVideoCapture initialize]";
        v21 = 1024;
        v22 = 266;
        v23 = 2048;
        v24 = allFrameRate;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d frame rate is %f", buf, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        allFrameCount = self->_allFrameCount;
        *(_DWORD *)buf = 136315906;
        v18 = v11;
        v19 = 2080;
        v20 = "-[CannedEncodedVideoCapture initialize]";
        v21 = 1024;
        v22 = 267;
        v23 = 1024;
        LODWORD(v24) = allFrameCount;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d video contains %d frames", buf, 0x22u);
      }
    }
    pthread_mutex_unlock(&self->_inputMutex);
    objc_msgSend(+[VCCannedAVSync sharedCannedAVSync](VCCannedAVSync, "sharedCannedAVSync"), "addStreamWithCount:rate:", self->_allFrameCount, self->_allFrameRate);
  }
  return v3;
}

- (int)setWidth:(int)a3 height:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  _opaque_pthread_mutex_t *p_attributeMutex;
  uint64_t v8;
  NSObject *v9;
  __CVPixelBufferPool *pixelBufferPool;
  CFTypeRef *p_pixelBufferPool;
  __CVPixelBufferPool *v12;
  __CVPixelBufferPool **p_rotatedPixelBufferPool;
  __CVPixelBufferPool *rotatedPixelBufferPool;
  int v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_attributeMutex = &self->_attributeMutex;
  pthread_mutex_lock(&self->_attributeMutex);
  self->_width = v5;
  self->_height = v4;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136316162;
      v18 = v8;
      v19 = 2080;
      v20 = "-[CannedEncodedVideoCapture setWidth:height:]";
      v21 = 1024;
      v22 = 285;
      v23 = 1024;
      v24 = v5;
      v25 = 1024;
      v26 = v4;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting width: %d height: %d", (uint8_t *)&v17, 0x28u);
    }
  }
  p_pixelBufferPool = (CFTypeRef *)&self->_pixelBufferPool;
  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
  {
    CFRelease(pixelBufferPool);
    *p_pixelBufferPool = 0;
  }
  rotatedPixelBufferPool = self->_rotatedPixelBufferPool;
  p_rotatedPixelBufferPool = &self->_rotatedPixelBufferPool;
  v12 = rotatedPixelBufferPool;
  if (rotatedPixelBufferPool)
  {
    CFRelease(v12);
    *p_rotatedPixelBufferPool = 0;
  }
  if (+[CannedVideoCapture createPixelBufferPool:withWidth:height:](CannedVideoCapture, "createPixelBufferPool:withWidth:height:", p_pixelBufferPool, v5, v4))
  {
    v15 = -2142633980;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedEncodedVideoCapture setWidth:height:].cold.2();
    }
  }
  else
  {
    v15 = +[CannedVideoCapture createPixelBufferPool:withWidth:height:](CannedVideoCapture, "createPixelBufferPool:withWidth:height:", p_rotatedPixelBufferPool, v4, v5);
    if (v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[CannedEncodedVideoCapture setWidth:height:].cold.1();
      }
      v15 = -2142633980;
      if (*p_pixelBufferPool)
      {
        CFRelease(*p_pixelBufferPool);
        *p_pixelBufferPool = 0;
      }
    }
  }
  pthread_mutex_unlock(p_attributeMutex);
  return v15;
}

- (void)attachMetadataToPixelBuffer:(__CVBuffer *)a3
{
  AVTimedMetadataGroup *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[AVAssetReaderOutputMetadataAdaptor nextTimedMetadataGroup](self->_metadataAdaptor, "nextTimedMetadataGroup");
  v5 = (void *)MEMORY[0x1E0C8B220];
  v6 = -[AVTimedMetadataGroup items](v4, "items");
  v7 = (void *)objc_msgSend(v5, "metadataItemsFromArray:filteredByIdentifier:", v6, *MEMORY[0x1E0CA2558]);
  v8 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "value"));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v10);
  }
  VCVideoUtil_AttachMetadata((const __CFArray *)v8, a3);

}

- (__CVBuffer)createPixelBufferForFrameIndex:(int)a3
{
  id v5;
  __int128 v6;
  int frameCount;
  _BYTE *v8;
  os_log_t *v9;
  const void *v10;
  AVAssetReaderOutputMetadataAdaptor *metadataAdaptor;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  opaqueCMSampleBuffer *v15;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v17;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  __int128 v23;
  __CVBuffer *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v24 = 0;
  frameCount = self->_frameCount;
  if (frameCount > a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedEncodedVideoCapture createPixelBufferForFrameIndex:].cold.5();
    }
    if (-[CannedEncodedVideoCapture initializeAssetReader](self, "initializeAssetReader"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[CannedEncodedVideoCapture createPixelBufferForFrameIndex:].cold.4();
      }
      goto LABEL_30;
    }
    frameCount = 0;
    self->_frameCount = 0;
  }
  if (frameCount >= a3)
  {
LABEL_19:
    v15 = (opaqueCMSampleBuffer *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_readerVideoTrackOutput, "copyNextSampleBuffer");
    if (v15)
      goto LABEL_24;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedEncodedVideoCapture createPixelBufferForFrameIndex:].cold.3();
    }
    self->_frameCount = 0;
    if (-[CannedEncodedVideoCapture initializeAssetReader](self, "initializeAssetReader"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[CannedEncodedVideoCapture createPixelBufferForFrameIndex:].cold.2();
      }
    }
    else
    {
LABEL_24:
      ++self->_frameCount;
      ImageBuffer = CMSampleBufferGetImageBuffer(v15);
      if (ImageBuffer)
      {
        v17 = ImageBuffer;
        pthread_mutex_lock(&self->_attributeMutex);
        LODWORD(v17) = -[VideoScaler convertAndScalePixelBuffer:toWidth:toHeight:withPixelFormat:usingPixelBufferPool:andStoreTo:](self->_videoScaler, "convertAndScalePixelBuffer:toWidth:toHeight:withPixelFormat:usingPixelBufferPool:andStoreTo:", v17, self->_width, self->_height, *(unsigned int *)"v024", self->_pixelBufferPool, &v24);
        pthread_mutex_unlock(&self->_attributeMutex);
        if ((_DWORD)v17)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[CannedEncodedVideoCapture createPixelBufferForFrameIndex:].cold.1();
          }
        }
        else if (self->_metadataAdaptor)
        {
          -[CannedEncodedVideoCapture attachMetadataToPixelBuffer:](self, "attachMetadataToPixelBuffer:", v24);
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v26 = v21;
          v27 = 2080;
          v28 = "-[CannedEncodedVideoCapture createPixelBufferForFrameIndex:]";
          v29 = 1024;
          v30 = 380;
          _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d error: copyNextSampleBuffer failed", buf, 0x1Cu);
        }
      }
      if (v15)
        CFRelease(v15);
    }
  }
  else
  {
    v8 = (_BYTE *)MEMORY[0x1E0CF2748];
    v9 = (os_log_t *)MEMORY[0x1E0CF2758];
    *(_QWORD *)&v6 = 136315650;
    v23 = v6;
    while (1)
    {
      v10 = (const void *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_readerVideoTrackOutput, "copyNextSampleBuffer", v23);
      if (!v10)
        break;
      CFRelease(v10);
      ++self->_frameCount;
      metadataAdaptor = self->_metadataAdaptor;
      if (metadataAdaptor
        && !-[AVAssetReaderOutputMetadataAdaptor nextTimedMetadataGroup](metadataAdaptor, "nextTimedMetadataGroup")
        && (int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *v9;
        v14 = *v9;
        if (*v8)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            v26 = v12;
            v27 = 2080;
            v28 = "-[CannedEncodedVideoCapture createPixelBufferForFrameIndex:]";
            v29 = 1024;
            v30 = 365;
            _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d empty metadataGroup while skipping frames", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v23;
          v26 = v12;
          v27 = 2080;
          v28 = "-[CannedEncodedVideoCapture createPixelBufferForFrameIndex:]";
          v29 = 1024;
          v30 = 365;
          _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d empty metadataGroup while skipping frames", buf, 0x1Cu);
        }
      }
      if (self->_frameCount >= a3)
        goto LABEL_19;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v23;
        v26 = v19;
        v27 = 2080;
        v28 = "-[CannedEncodedVideoCapture createPixelBufferForFrameIndex:]";
        v29 = 1024;
        v30 = 355;
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d error: copyNextSampleBuffer returned NULL (while skipping frames)", buf, 0x1Cu);
      }
    }
  }
LABEL_30:
  objc_msgSend(v5, "drain");
  return v24;
}

- (void)getFrameRate:(double *)a3 frameCount:(int *)a4
{
  _opaque_pthread_mutex_t *p_inputMutex;

  p_inputMutex = &self->_inputMutex;
  pthread_mutex_lock(&self->_inputMutex);
  if (a3)
    *a3 = self->_allFrameRate;
  if (a4)
    *a4 = self->_allFrameCount;
  pthread_mutex_unlock(p_inputMutex);
}

- (AVURLAsset)compressedFileAsset
{
  return self->_compressedFileAsset;
}

- (void)setCompressedFileAsset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (AVAssetReader)assetReader
{
  return self->_assetReader;
}

- (void)setAssetReader:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (AVAssetTrack)videoTrack
{
  return self->_videoTrack;
}

- (void)setVideoTrack:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (AVAssetTrack)metadataTrack
{
  return self->_metadataTrack;
}

- (void)setMetadataTrack:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (AVAssetReaderTrackOutput)readerVideoTrackOutput
{
  return self->_readerVideoTrackOutput;
}

- (void)setReaderVideoTrackOutput:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (AVAssetReaderTrackOutput)readerMetadataTrackOutput
{
  return self->_readerMetadataTrackOutput;
}

- (void)setReaderMetadataTrackOutput:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (AVAssetReaderOutputMetadataAdaptor)metadataAdaptor
{
  return self->_metadataAdaptor;
}

- (void)setMetadataAdaptor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)movieURLString
{
  return self->_movieURLString;
}

- (void)setMovieURLString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (VideoScaler)videoScaler
{
  return self->_videoScaler;
}

- (void)setVideoScaler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (int)allFrameCount
{
  return self->_allFrameCount;
}

- (void)setAllFrameCount:(int)a3
{
  self->_allFrameCount = a3;
}

- (double)allFrameRate
{
  return self->_allFrameRate;
}

- (void)setAllFrameRate:(double)a3
{
  self->_allFrameRate = a3;
}

- (int)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(int)a3
{
  self->_frameCount = a3;
}

- (void)initWithPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d failed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)loadVideoTrackFromList:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No video tracks available.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)loadVideoTrackFromList:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Instantiation of AVAssetTrack failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)loadVideoTrackFromList:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to load video tracks error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)loadMetadataTrackFromList:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to load metadata tracks error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)finalizeVideoCapture
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d assetReader couldn't start reading", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)loadCannedMediaAssets
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the semaphore", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeAssetReader
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVAssetReader error with asset error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)initialize
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize AssetReader", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setWidth:height:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[CannedEncodedVideoCapture setWidth:height:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Rotated PixelBuffer pool creation failed(%d)", v2, *(const char **)v3, (unint64_t)"-[CannedEncodedVideoCapture setWidth:height:]" >> 16, 308);
  OUTLINED_FUNCTION_3();
}

- (void)setWidth:height:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[CannedEncodedVideoCapture setWidth:height:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d PixelBuffer pool creation failed(%d)", v2, *(const char **)v3, (unint64_t)"-[CannedEncodedVideoCapture setWidth:height:]" >> 16, 297);
  OUTLINED_FUNCTION_3();
}

- (void)createPixelBufferForFrameIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d failed to rescale pixel buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createPixelBufferForFrameIndex:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize AssetReader", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createPixelBufferForFrameIndex:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d error: copyNextSampleBuffer returned NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createPixelBufferForFrameIndex:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize AssetReader", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createPixelBufferForFrameIndex:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d requested frameIndex smaller than previously decoded frame index, rewind the video to the beginning", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
