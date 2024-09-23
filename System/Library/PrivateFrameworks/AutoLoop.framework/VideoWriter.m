@implementation VideoWriter

- (id)initForURL:(id)a3 fileType:(id)a4 codecType:(id)a5 imgWidth:(unsigned int)a6 imgHeight:(unsigned int)a7 fps:(float)a8 pixFormat:(unsigned int)a9 metadata:(id)a10
{
  __int128 v10;
  uint64_t v12;
  _OWORD v13[3];

  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v13[0] = *MEMORY[0x1E0C9BAA8];
  v13[1] = v10;
  v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  LODWORD(v12) = a9;
  return -[VideoWriter initForURL:fileType:codecType:imgWidth:imgHeight:fps:timeScale:transform:pixFormat:metadata:](self, "initForURL:fileType:codecType:imgWidth:imgHeight:fps:timeScale:transform:pixFormat:metadata:", a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, 0, v13, v12, a10);
}

- (id)initForURL:(id)a3 fileType:(id)a4 codecType:(id)a5 imgWidth:(unsigned int)a6 imgHeight:(unsigned int)a7 fps:(float)a8 timeScale:(int)a9 transform:(CGAffineTransform *)a10 pixFormat:(unsigned int)a11 metadata:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  VideoWriter *v23;
  VideoWriter *v24;
  AVAssetWriter *assetWriter;
  AVAssetWriterInput *writerInput;
  AVAssetWriterInputPixelBufferAdaptor *inputAdaptor;
  float v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  NSConditionLock *inputLock;
  dispatch_queue_t v33;
  OS_dispatch_queue *frameWriteQueue;
  uint64_t v35;
  NSError *v36;
  AVAssetWriter *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  AVAssetWriterInput *v47;
  AVAssetWriterInput *v48;
  __int128 v49;
  __int16 v50;
  void *v51;
  uint64_t v52;
  AVAssetWriterInputPixelBufferAdaptor *v53;
  NSError *v54;
  AVAssetWriter *v55;
  AVAssetWriterInput *v56;
  OS_dispatch_queue *v57;
  VideoWriter *v58;
  NSError *lastError;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSError *v66;
  uint64_t v68;
  NSError *v69;
  id v70;
  _QWORD v71[4];
  VideoWriter *v72;
  CMTime v73;
  CMTime v74;
  _OWORD v75[3];
  id v76;
  objc_super v77;
  char v78[1000];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a12;
  v77.receiver = self;
  v77.super_class = (Class)VideoWriter;
  v23 = -[VideoWriter init](&v77, sel_init);
  v24 = v23;
  if (!v23)
    goto LABEL_18;
  assetWriter = v23->_assetWriter;
  v23->_assetWriter = 0;

  writerInput = v24->_writerInput;
  v24->_writerInput = 0;

  inputAdaptor = v24->_inputAdaptor;
  v24->_inputAdaptor = 0;

  v24->fps = a8;
  v24->currFrame = 0;
  v24->_currFrameTime = 0;
  v24->imgWidth = a6;
  v24->imgHeight = a7;
  v24->_initFailed = 0;
  if (a9)
  {
    v24->timeScale = a9;
    v28 = (float)a9;
  }
  else if (a8 == 60.0)
  {
    v24->timeScale = 6000;
    v28 = 6000.0;
  }
  else
  {
    v24->timeScale = 90000;
    v28 = 90000.0;
  }
  v24->pixelFormat = a11;
  v29 = *(_OWORD *)&a10->a;
  v30 = *(_OWORD *)&a10->c;
  *(_OWORD *)&v24->preferredTransform.tx = *(_OWORD *)&a10->tx;
  *(_OWORD *)&v24->preferredTransform.c = v30;
  *(_OWORD *)&v24->preferredTransform.a = v29;
  v24->_frameIncr = (uint64_t)(float)(v28 / a8);
  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 1);
  inputLock = v24->_inputLock;
  v24->_inputLock = (NSConditionLock *)v31;

  v33 = dispatch_queue_create("frame write queue", 0);
  frameWriteQueue = v24->_frameWriteQueue;
  v24->_frameWriteQueue = (OS_dispatch_queue *)v33;

  objc_msgSend(v19, "getFileSystemRepresentation:maxLength:", v78, 1000);
  unlink(v78);
  v76 = 0;
  v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B018]), "initWithURL:fileType:error:", v19, v20, &v76);
  v36 = (NSError *)v76;
  v37 = v24->_assetWriter;
  v24->_assetWriter = (AVAssetWriter *)v35;

  if (!v24->_assetWriter)
  {
    NSLog(CFSTR("AVAssetWriter init error (%@)\n"), v36);
    lastError = v24->lastError;
    v24->lastError = v36;
    v54 = v36;

    v24->_initFailed = 1;
    v58 = v24;
LABEL_29:

    goto LABEL_30;
  }
  v69 = v36;
  v70 = v20;
  v38 = v22;
  v39 = (void *)MEMORY[0x1E0C99D80];
  v40 = *MEMORY[0x1E0C8AE68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24->imgWidth);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v21;
  v43 = *MEMORY[0x1E0C8AF60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24->imgHeight);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v43;
  v21 = v42;
  objc_msgSend(v39, "dictionaryWithObjectsAndKeys:", v42, v40, v41, v68, v44, *MEMORY[0x1E0C8AEF0], 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v45);
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = v24->_writerInput;
  v24->_writerInput = (AVAssetWriterInput *)v46;

  v48 = v24->_writerInput;
  if (!v48)
  {
    NSLog(CFSTR("***AVAssetWriterInput creation error\n"));

    v58 = 0;
    v22 = v38;
    v20 = v70;
    goto LABEL_30;
  }
  -[AVAssetWriterInput setMediaTimeScale:](v48, "setMediaTimeScale:", v24->timeScale);
  v49 = *(_OWORD *)&v24->preferredTransform.c;
  v75[0] = *(_OWORD *)&v24->preferredTransform.a;
  v75[1] = v49;
  v75[2] = *(_OWORD *)&v24->preferredTransform.tx;
  -[AVAssetWriterInput setTransform:](v24->_writerInput, "setTransform:", v75);
  -[AVAssetWriter setMovieTimeScale:](v24->_assetWriter, "setMovieTimeScale:", v24->timeScale);
  if (a11)
    v50 = a11;
  else
    v50 = 193;
  sub_1D4C877D4(v50, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B038], "assetWriterInputPixelBufferAdaptorWithAssetWriterInput:sourcePixelBufferAttributes:", v24->_writerInput, v51);
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = v24->_inputAdaptor;
  v24->_inputAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)v52;

  v22 = v38;
  if (!v24->_inputAdaptor)
  {
    NSLog(CFSTR("***AVAssetWriterInputPixelBufferAdaptor creation error\n"));
    v58 = 0;
    v21 = v42;
    v54 = v69;
    v20 = v70;
LABEL_28:

    goto LABEL_29;
  }
  v21 = v42;
  v20 = v70;
  if (!-[AVAssetWriter canAddInput:](v24->_assetWriter, "canAddInput:", v24->_writerInput))
  {
    NSLog(CFSTR("***AVAssetWriter can't accept input from AVAssetWriterInput\n"));
    v58 = 0;
    v54 = v69;
    goto LABEL_28;
  }
  -[AVAssetWriter addInput:](v24->_assetWriter, "addInput:", v24->_writerInput);
  v54 = v69;
  if (v22)
    -[AVAssetWriter setMetadata:](v24->_assetWriter, "setMetadata:", v22);
  if (!-[AVAssetWriter startWriting](v24->_assetWriter, "startWriting"))
  {
    NSLog(CFSTR("***Error in [videoWriter startWriting]\n"));
    NSLog(CFSTR("   videoWriter.status = %u\n"), -[AVAssetWriter status](v24->_assetWriter, "status"));
    -[AVAssetWriter error](v24->_assetWriter, "error");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("   error: %@\n"), v60);

    -[AVAssetWriter error](v24->_assetWriter, "error");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "userInfo");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v63;
      if (v63)
        NSLog(CFSTR("   underlying error code: %ld"), objc_msgSend(v63, "code"));

    }
    -[AVAssetWriter error](v24->_assetWriter, "error");
    v65 = objc_claimAutoreleasedReturnValue();
    v66 = v24->lastError;
    v24->lastError = (NSError *)v65;

    v24->_initFailed = 1;
    v58 = v24;

    goto LABEL_28;
  }
  memset(&v74, 0, sizeof(v74));
  CMTimeMake(&v74, 0, v24->timeScale);
  v55 = v24->_assetWriter;
  v73 = v74;
  -[AVAssetWriter startSessionAtSourceTime:](v55, "startSessionAtSourceTime:", &v73);
  v56 = v24->_writerInput;
  v57 = v24->_frameWriteQueue;
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = sub_1D4C8EA1C;
  v71[3] = &unk_1E9864340;
  v72 = v24;
  -[AVAssetWriterInput requestMediaDataWhenReadyOnQueue:usingBlock:](v56, "requestMediaDataWhenReadyOnQueue:usingBlock:", v57, v71);

LABEL_18:
  v58 = v24;
LABEL_30:

  return v58;
}

- (id)initForPath:(const char *)a3 fileType:(id)a4 codecType:(id)a5 imgWidth:(unsigned int)a6 imgHeight:(unsigned int)a7 fps:(float)a8 pixFormat:(unsigned int)a9 metadata:(id)a10
{
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  id v25;

  v10 = *(_QWORD *)&a9;
  v12 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a6;
  v18 = (void *)MEMORY[0x1E0CB3940];
  v19 = a10;
  v20 = a5;
  v21 = a4;
  objc_msgSend(v18, "stringWithCString:encoding:", a3, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v24 = a8;
  v25 = -[VideoWriter initForURL:fileType:codecType:imgWidth:imgHeight:fps:pixFormat:metadata:](self, "initForURL:fileType:codecType:imgWidth:imgHeight:fps:pixFormat:metadata:", v23, v21, v20, v13, v12, v10, v24, v19);

  return v25;
}

- (void)setInputReady
{
  -[NSConditionLock lockWhenCondition:](self->_inputLock, "lockWhenCondition:", 1);
  -[NSConditionLock unlockWithCondition:](self->_inputLock, "unlockWithCondition:", 0);
}

- (id)addFrame:(CGImage *)a3
{
  NSError *lastError;
  __CFString *v5;
  CVPixelBufferRef v6;
  CVPixelBufferRef v7;

  if (self->_initFailed)
  {
    lastError = self->lastError;
    if (lastError)
    {
      -[NSError localizedDescription](lastError, "localizedDescription", a3);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("VideoWriter: init I/O failure");
    }
  }
  else
  {
    v6 = sub_1D4C8E358(a3);
    if (v6)
    {
      v7 = v6;
      -[VideoWriter addFrameAsPixelBuf:](self, "addFrameAsPixelBuf:", v6);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFRelease(v7);
    }
    else
    {
      v5 = CFSTR("Error creating CVPixelBufferRef");
      NSLog(CFSTR("%@"), CFSTR("Error creating CVPixelBufferRef"));
    }
  }
  return v5;
}

- (id)addFrameAsPixelBuf:(__CVBuffer *)a3
{
  NSError *lastError;
  AVAssetWriterInputPixelBufferAdaptor *inputAdaptor;
  BOOL v8;
  __CFString *v9;
  void *v10;
  NSError *v11;
  NSError *v12;
  void *v13;
  CMTime v14;
  CMTime v15;

  if (self->_initFailed)
  {
    lastError = self->lastError;
    if (lastError)
    {
      -[NSError localizedDescription](lastError, "localizedDescription", a3);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = CFSTR("VideoWriter: init I/O failure");
  }
  else
  {
    if (!-[AVAssetWriterInput isReadyForMoreMediaData](self->_writerInput, "isReadyForMoreMediaData"))
    {
      do
      {
        -[NSConditionLock lockWhenCondition:](self->_inputLock, "lockWhenCondition:", 0);
        -[NSConditionLock unlock](self->_inputLock, "unlock");
      }
      while (!-[AVAssetWriterInput isReadyForMoreMediaData](self->_writerInput, "isReadyForMoreMediaData"));
    }
    memset(&v15, 0, sizeof(v15));
    CMTimeMake(&v15, self->_currFrameTime, self->timeScale);
    self->_currFrameTime += self->_frameIncr;
    ++self->currFrame;
    inputAdaptor = self->_inputAdaptor;
    v14 = v15;
    v8 = -[AVAssetWriterInputPixelBufferAdaptor appendPixelBuffer:withPresentationTime:](inputAdaptor, "appendPixelBuffer:withPresentationTime:", a3, &v14);
    v9 = 0;
    if (!v8)
    {
      NSLog(CFSTR("***AVAssetWriterInputPixelBufferAdaptor appendPixelBuffer error"));
      -[AVAssetWriter error](self->_assetWriter, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("   _assetWriter.error  = %@"), v10);

      NSLog(CFSTR("   _assetWriter.status = %u"), -[AVAssetWriter status](self->_assetWriter, "status"));
      -[AVAssetWriter error](self->_assetWriter, "error");
      v11 = (NSError *)objc_claimAutoreleasedReturnValue();
      v12 = self->lastError;
      self->lastError = v11;

      -[AVAssetWriter error](self->_assetWriter, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescription");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    -[NSConditionLock lock](self->_inputLock, "lock");
    -[NSConditionLock unlockWithCondition:](self->_inputLock, "unlockWithCondition:", 1);
  }
  return v9;
}

- (id)addFrameAsPixelBuf:(__CVBuffer *)a3 atFrameTime:(id *)a4
{
  NSError *lastError;
  int32_t timeScale;
  AVAssetWriterInputPixelBufferAdaptor *inputAdaptor;
  void *v11;
  void *v12;
  NSError *v13;
  NSError *v14;
  void *v15;
  CMTime time;
  CMTime v17;

  if (self->_initFailed)
  {
    lastError = self->lastError;
    if (lastError)
    {
      -[NSError localizedDescription](lastError, "localizedDescription", a3, a4);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return CFSTR("VideoWriter: init I/O failure");
    }
  }
  else
  {
    if (!-[AVAssetWriterInput isReadyForMoreMediaData](self->_writerInput, "isReadyForMoreMediaData"))
    {
      do
      {
        -[NSConditionLock lockWhenCondition:](self->_inputLock, "lockWhenCondition:", 0);
        -[NSConditionLock unlock](self->_inputLock, "unlock");
      }
      while (!-[AVAssetWriterInput isReadyForMoreMediaData](self->_writerInput, "isReadyForMoreMediaData"));
    }
    timeScale = self->timeScale;
    if (a4->var1 != timeScale)
    {
      time = (CMTime)*a4;
      CMTimeConvertScale(&v17, &time, timeScale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      *(CMTime *)a4 = v17;
    }
    self->_currFrameTime = a4->var0;
    ++self->currFrame;
    inputAdaptor = self->_inputAdaptor;
    v17 = (CMTime)*a4;
    if (-[AVAssetWriterInputPixelBufferAdaptor appendPixelBuffer:withPresentationTime:](inputAdaptor, "appendPixelBuffer:withPresentationTime:", a3, &v17))
    {
      v11 = 0;
    }
    else
    {
      NSLog(CFSTR("***AVAssetWriterInputPixelBufferAdaptor appendPixelBuffer error"));
      -[AVAssetWriter error](self->_assetWriter, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("   _assetWriter.error  = %@"), v12);

      NSLog(CFSTR("   _assetWriter.status = %u"), -[AVAssetWriter status](self->_assetWriter, "status"));
      -[AVAssetWriter error](self->_assetWriter, "error");
      v13 = (NSError *)objc_claimAutoreleasedReturnValue();
      v14 = self->lastError;
      self->lastError = v13;

      -[AVAssetWriter error](self->_assetWriter, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[NSConditionLock lock](self->_inputLock, "lock");
    -[NSConditionLock unlockWithCondition:](self->_inputLock, "unlockWithCondition:", 1);
    return v11;
  }
}

- (__CVBuffer)createPixelBuffer
{
  uint64_t v2;
  __CVBuffer *result;
  CVPixelBufferRef pixelBufferOut;

  if (self->_initFailed)
    return 0;
  pixelBufferOut = 0;
  v2 = CVPixelBufferPoolCreatePixelBuffer(0, -[AVAssetWriterInputPixelBufferAdaptor pixelBufferPool](self->_inputAdaptor, "pixelBufferPool"), &pixelBufferOut);
  if ((_DWORD)v2)
  {
    NSLog(CFSTR("***VideoWriter: CVPixelBufferPool error (%d)"), v2);
    return 0;
  }
  result = pixelBufferOut;
  if (!pixelBufferOut)
  {
    NSLog(CFSTR("***VideoWriter: CVPixelBufferPool returned NULL PixelBuf"));
    return 0;
  }
  return result;
}

- (void)endSessionAtTime:(id *)a3
{
  AVAssetWriter *assetWriter;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  assetWriter = self->_assetWriter;
  v4 = *a3;
  -[AVAssetWriter endSessionAtSourceTime:](assetWriter, "endSessionAtSourceTime:", &v4);
}

- (void)endSessionInfer
{
  CMTime v3;
  CMTime v4;

  memset(&v4, 0, sizeof(v4));
  CMTimeMake(&v4, self->_currFrameTime, self->timeScale);
  self->_currFrameTime += self->_frameIncr;
  ++self->currFrame;
  v3 = v4;
  -[VideoWriter endSessionAtTime:](self, "endSessionAtTime:", &v3);
}

- (id)finish
{
  NSError *lastError;
  AVAssetWriter *assetWriter;
  void *v6;
  void *v7;
  void *v8;
  NSError *v9;
  NSError *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (self->_initFailed)
  {
    lastError = self->lastError;
    if (lastError)
    {
      -[NSError localizedDescription](lastError, "localizedDescription");
      return (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return CFSTR("VideoWriter: init I/O failure");
    }
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_1D4C8F1E4;
    v16 = sub_1D4C8F1F4;
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    assetWriter = self->_assetWriter;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1D4C8F1FC;
    v11[3] = &unk_1E9864398;
    v11[4] = &v12;
    -[AVAssetWriter finishWritingWithCompletionHandler:](assetWriter, "finishWritingWithCompletionHandler:", v11);
    objc_msgSend((id)v13[5], "lockWhenCondition:", 1);
    objc_msgSend((id)v13[5], "unlockWithCondition:", 1);
    -[NSConditionLock lock](self->_inputLock, "lock");
    -[NSConditionLock unlockWithCondition:](self->_inputLock, "unlockWithCondition:", 1);
    if (-[AVAssetWriter status](self->_assetWriter, "status") == AVAssetWriterStatusCompleted)
    {
      v6 = 0;
    }
    else
    {
      NSLog(CFSTR("***_assetWriter.status = %d\n"), -[AVAssetWriter status](self->_assetWriter, "status"));
      -[AVAssetWriter error](self->_assetWriter, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVAssetWriter error](self->_assetWriter, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("   error: %@\n"), v8);

      -[AVAssetWriter error](self->_assetWriter, "error");
      v9 = (NSError *)objc_claimAutoreleasedReturnValue();
      v10 = self->lastError;
      self->lastError = v9;

    }
    _Block_object_dispose(&v12, 8);

    return v6;
  }
}

- (float)fps
{
  return self->fps;
}

- (int64_t)currFrame
{
  return self->currFrame;
}

- (unsigned)imgWidth
{
  return self->imgWidth;
}

- (unsigned)imgHeight
{
  return self->imgHeight;
}

- (int)timeScale
{
  return self->timeScale;
}

- (unsigned)pixelFormat
{
  return self->pixelFormat;
}

- (CGAffineTransform)preferredTransform
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->preferredTransform, 48, 1, 0);
  return result;
}

- (NSError)lastError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (AVAssetWriter)assetWriter
{
  return (AVAssetWriter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAssetWriter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (AVAssetWriterInput)writerInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWriterInput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (AVAssetWriterInputPixelBufferAdaptor)inputAdaptor
{
  return (AVAssetWriterInputPixelBufferAdaptor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInputAdaptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSConditionLock)inputLock
{
  return (NSConditionLock *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInputLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_dispatch_queue)frameWriteQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFrameWriteQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int64_t)currFrameTime
{
  return self->_currFrameTime;
}

- (void)setCurrFrameTime:(int64_t)a3
{
  self->_currFrameTime = a3;
}

- (int64_t)frameIncr
{
  return self->_frameIncr;
}

- (void)setFrameIncr:(int64_t)a3
{
  self->_frameIncr = a3;
}

- (BOOL)initFailed
{
  return self->_initFailed;
}

- (void)setInitFailed:(BOOL)a3
{
  self->_initFailed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameWriteQueue, 0);
  objc_storeStrong((id *)&self->_inputLock, 0);
  objc_storeStrong((id *)&self->_inputAdaptor, 0);
  objc_storeStrong((id *)&self->_writerInput, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->lastError, 0);
}

@end
