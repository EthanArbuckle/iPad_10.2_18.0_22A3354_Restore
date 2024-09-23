@implementation LPAnimatedImageTranscoder

- (LPAnimatedImageTranscoder)initWithAnimatedImage:(id)a3
{
  id v5;
  LPAnimatedImageTranscoder *v6;
  LPAnimatedImageTranscoder *v7;
  LPAnimatedImageTranscoder *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPAnimatedImageTranscoder;
  v6 = -[LPAnimatedImageTranscoder init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceImage, a3);
    v7->_loggingID = ++initWithAnimatedImage__nextLoggingID;
    v8 = v7;
  }

  return v7;
}

+ (id)encodeQueue
{
  if (encodeQueue_onceToken != -1)
    dispatch_once(&encodeQueue_onceToken, &__block_literal_global_24);
  return (id)encodeQueue_encodeQueue;
}

void __40__LPAnimatedImageTranscoder_encodeQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.LinkPresentation.AnimatedImageTranscoder", v2);
  v1 = (void *)encodeQueue_encodeQueue;
  encodeQueue_encodeQueue = (uint64_t)v0;

}

- (void)transcodeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[LPAnimatedImageTranscoder encodeQueue](LPAnimatedImageTranscoder, "encodeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__LPAnimatedImageTranscoder_transcodeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E44A7F60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __60__LPAnimatedImageTranscoder_transcodeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transcodeWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_transcodeWithCompletionHandler:(id)a3
{
  void *v4;
  id completionHandler;
  const __CFData *v6;
  NSObject *v7;
  unsigned int loggingID;
  unint64_t frameCount;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFDictionaryRef v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSURL *v25;
  NSURL *outputURL;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  id v31;
  AVAssetWriter *v32;
  AVAssetWriter *writer;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  AVAssetWriterInput *v43;
  AVAssetWriterInput *input;
  uint64_t v45;
  void *v46;
  AVAssetWriterInputPixelBufferAdaptor *v47;
  AVAssetWriterInputPixelBufferAdaptor *adaptor;
  AVAssetWriter *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[2];
  _QWORD v66[2];
  uint64_t v67;
  void *v68;
  _QWORD v69[4];
  _QWORD v70[4];
  _BYTE buf[28];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = _Block_copy(a3);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v4;

  -[LPImage data](self->_sourceImage, "data");
  v6 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  self->_imageSource = CGImageSourceCreateWithData(v6, MEMORY[0x1E0C9AA70]);

  self->_frameCount = CGImageSourceGetCount(self->_imageSource);
  v7 = (id)LPLogChannelTranscoding();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    frameCount = self->_frameCount;
    -[LPImage data](self->_sourceImage, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = loggingID;
    *(_WORD *)&buf[8] = 2048;
    *(_QWORD *)&buf[10] = frameCount;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = objc_msgSend(v10, "length");
    _os_log_impl(&dword_1A0C41000, v7, OS_LOG_TYPE_DEFAULT, "LPAnimatedImageTranscoder<%d>: beginning transcoding for image (frameCount=%zu, size=%zd)", buf, 0x1Cu);

  }
  if (self->_frameCount > 1)
  {
    v18 = CGImageSourceCopyPropertiesAtIndex(self->_imageSource, 0, 0);
    v19 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathComponent:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingPathExtension:", CFSTR("mp4"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fileURLWithPath:", v24);
    v25 = (NSURL *)objc_claimAutoreleasedReturnValue();
    outputURL = self->_outputURL;
    self->_outputURL = v25;

    -[__CFDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "unsignedLongValue");

    -[__CFDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "unsignedLongValue");

    if (v28 && v30)
    {
      v31 = objc_alloc(MEMORY[0x1E0C8B018]);
      v32 = (AVAssetWriter *)objc_msgSend(v31, "initWithURL:fileType:error:", self->_outputURL, *MEMORY[0x1E0C8A2E0], 0);
      writer = self->_writer;
      self->_writer = v32;

      v34 = delayTimeFromImageProperties(v18);
      v35 = *MEMORY[0x1E0C8AE68];
      v70[0] = *MEMORY[0x1E0C8AE70];
      v36 = *MEMORY[0x1E0C8AF60];
      v69[0] = v35;
      v69[1] = v36;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (double)v30;
      v70[1] = v37;
      v69[2] = *MEMORY[0x1E0C8AEF0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v30);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v70[2] = v39;
      v69[3] = *MEMORY[0x1E0C8AEB8];
      v67 = *MEMORY[0x1E0C8AE20];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v28 * v38 * 32.0 * (1.0 / v34) * 0.0175);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v70[3] = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 4);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v42);
      v43 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
      input = self->_input;
      self->_input = v43;

      v45 = *MEMORY[0x1E0CA8F70];
      v65[0] = *MEMORY[0x1E0CA9040];
      v65[1] = v45;
      v66[0] = &unk_1E44EEC18;
      v66[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8B038], "assetWriterInputPixelBufferAdaptorWithAssetWriterInput:sourcePixelBufferAttributes:", self->_input, v46);
      v47 = (AVAssetWriterInputPixelBufferAdaptor *)objc_claimAutoreleasedReturnValue();
      adaptor = self->_adaptor;
      self->_adaptor = v47;

      -[AVAssetWriter addInput:](self->_writer, "addInput:", self->_input);
      if (-[AVAssetWriter startWriting](self->_writer, "startWriting"))
      {
        v49 = self->_writer;
        *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
        *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        -[AVAssetWriter startSessionAtSourceTime:](v49, "startSessionAtSourceTime:", buf);
        -[AVAssetWriterInputPixelBufferAdaptor assetWriterInput](self->_adaptor, "assetWriterInput");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObserver:forKeyPath:options:context:", self, CFSTR("readyForMoreMediaData"), 5, readyForDataKVOContext);

        self->_hasReadyForDataObserver = 1;
        -[LPAnimatedImageTranscoder encodeUntilNotReadyForMoreMediaData](self, "encodeUntilNotReadyForMoreMediaData");
      }
      else
      {
        v58 = LPLogChannelTranscoding();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          -[LPAnimatedImageTranscoder _transcodeWithCompletionHandler:].cold.2((uint64_t)self, v58, v59, v60, v61, v62, v63, v64);
        -[LPAnimatedImageTranscoder failed](self, "failed");
      }

    }
    else
    {
      v51 = LPLogChannelTranscoding();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        -[LPAnimatedImageTranscoder _transcodeWithCompletionHandler:].cold.3((uint64_t)self, v51, v52, v53, v54, v55, v56, v57);
      -[LPAnimatedImageTranscoder failed](self, "failed");
    }

  }
  else
  {
    v11 = LPLogChannelTranscoding();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[LPAnimatedImageTranscoder _transcodeWithCompletionHandler:].cold.1((uint64_t)self, v11, v12, v13, v14, v15, v16, v17);
    -[LPAnimatedImageTranscoder failed](self, "failed");
  }
}

- (void)failed
{
  _QWORD block[5];

  self->_stopEncoding = 1;
  -[LPAnimatedImageTranscoder removeReadyForDataObserverIfNeeded](self, "removeReadyForDataObserverIfNeeded");
  if (self->_completionHandler)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__LPAnimatedImageTranscoder_failed__block_invoke;
    block[3] = &unk_1E44A7CE8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __35__LPAnimatedImageTranscoder_failed__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  objc_super v14;
  _QWORD block[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)readyForDataKVOContext == a6)
  {
    +[LPAnimatedImageTranscoder encodeQueue](LPAnimatedImageTranscoder, "encodeQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__LPAnimatedImageTranscoder_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E44A7CE8;
    block[4] = self;
    dispatch_async(v13, block);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)LPAnimatedImageTranscoder;
    -[LPAnimatedImageTranscoder observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __76__LPAnimatedImageTranscoder_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeUntilNotReadyForMoreMediaData");
}

- (void)removeReadyForDataObserverIfNeeded
{
  void *v3;

  if (self->_hasReadyForDataObserver)
  {
    -[AVAssetWriterInputPixelBufferAdaptor assetWriterInput](self->_adaptor, "assetWriterInput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("readyForMoreMediaData"), readyForDataKVOContext);

  }
  self->_hasReadyForDataObserver = 0;
}

- (void)encodeUntilNotReadyForMoreMediaData
{
  void *v3;
  int v4;

  while (!self->_stopEncoding)
  {
    -[AVAssetWriterInputPixelBufferAdaptor assetWriterInput](self->_adaptor, "assetWriterInput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isReadyForMoreMediaData");

    if (!v4)
      break;
    -[LPAnimatedImageTranscoder encodeNextFrame](self, "encodeNextFrame");
  }
}

- (void)encodeNextFrame
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7(&dword_1A0C41000, v0, v1, "LPAnimatedImageTranscoder<%d>: failed, could not append surface for frame %zu", v2, v3);
  OUTLINED_FUNCTION_1_0();
}

void __44__LPAnimatedImageTranscoder_encodeNextFrame__block_invoke(uint64_t a1)
{
  LPVideoProperties *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  LPVideo *v10;
  NSObject *v11;
  int v12;
  LPVideo *v13;
  _QWORD v14[5];
  LPVideo *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 24));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = objc_alloc_init(LPVideoProperties);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "properties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPVisualMediaProperties setAccessibilityText:](v2, "setAccessibilityText:", v4);

    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_lp_fileSize");
    if (v5 <= 0xA00000)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeItemAtURL:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 0);

      v10 = -[LPVideo initWithData:MIMEType:properties:]([LPVideo alloc], "initWithData:MIMEType:properties:", v8, CFSTR("video/mp4"), v2);
      v11 = LPLogChannelTranscoding();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 92);
        *(_DWORD *)buf = 67109376;
        v17 = v12;
        v18 = 2048;
        v19 = v5;
        _os_log_impl(&dword_1A0C41000, v11, OS_LOG_TYPE_DEFAULT, "LPAnimatedImageTranscoder<%d>: finished transcoding (size=%llu)", buf, 0x12u);
      }
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __44__LPAnimatedImageTranscoder_encodeNextFrame__block_invoke_21;
      v14[3] = &unk_1E44A7D10;
      v14[4] = *(_QWORD *)(a1 + 32);
      v15 = v10;
      v13 = v10;
      dispatch_async(MEMORY[0x1E0C80D38], v14);

    }
    else
    {
      v6 = LPLogChannelTranscoding();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 92);
        *(_DWORD *)buf = 67109376;
        v17 = v7;
        v18 = 2048;
        v19 = v5;
        _os_log_impl(&dword_1A0C41000, v6, OS_LOG_TYPE_DEFAULT, "LPAnimatedImageTranscoder<%d>: failed, output file is too big (size=%llu)", buf, 0x12u);
      }
      objc_msgSend(*(id *)(a1 + 32), "failed");
    }

  }
}

uint64_t __44__LPAnimatedImageTranscoder_encodeNextFrame__block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

- (void)cancel
{
  NSObject *v3;
  unsigned int loggingID;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = LPLogChannelTranscoding();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    loggingID = self->_loggingID;
    v5[0] = 67109120;
    v5[1] = loggingID;
    _os_log_impl(&dword_1A0C41000, v3, OS_LOG_TYPE_DEFAULT, "LPAnimatedImageTranscoder<%d>: explicitly canceled", (uint8_t *)v5, 8u);
  }
  -[LPAnimatedImageTranscoder failed](self, "failed");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_adaptor, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_sourceImage, 0);
}

- (void)_transcodeWithCompletionHandler:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1A0C41000, a2, a3, "LPAnimatedImageTranscoder<%d>: failed, not enough frames", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

- (void)_transcodeWithCompletionHandler:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1A0C41000, a2, a3, "LPAnimatedImageTranscoder<%d>: failed, could not start AVAssetWriter", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

- (void)_transcodeWithCompletionHandler:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1A0C41000, a2, a3, "LPAnimatedImageTranscoder<%d>: failed, first frame has empty size", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

@end
