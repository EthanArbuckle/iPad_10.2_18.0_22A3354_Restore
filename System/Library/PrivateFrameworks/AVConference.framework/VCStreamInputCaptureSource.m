@implementation VCStreamInputCaptureSource

- (VCStreamInputCaptureSource)initWithCaptureSourceID:(int)a3 configuration:(id)a4
{
  VCStreamInputCaptureSource *v6;
  VCStreamInputCaptureSource *v7;
  NSMutableDictionary *v8;
  int64_t v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCStreamInputCaptureSource;
  v12[0] = _VCStreamInputCaptureSource_OnCaptureVideoFrame;
  v6 = -[VCVideoCapture initWithCaptureServer:protocolFunctions:](&v11, sel_initWithCaptureServer_protocolFunctions_, 0, v12);
  v7 = v6;
  if (!v6)
    return v7;
  pthread_mutex_init(&v6->_sinkMutex, 0);
  if (a3 <= 9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamInputCaptureSource initWithCaptureSourceID:configuration:].cold.1();
    }
    goto LABEL_21;
  }
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7->_videoSinkState = v8;
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamInputCaptureSource initWithCaptureSourceID:configuration:].cold.2();
    }
    goto LABEL_21;
  }
  v10 = 0;
  if (!+[VCStreamInputCaptureSource readIntegerFromConfig:key:value:](VCStreamInputCaptureSource, "readIntegerFromConfig:key:value:", a4, CFSTR("streamInputID"), &v10))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamInputCaptureSource initWithCaptureSourceID:configuration:].cold.4();
    }
    goto LABEL_21;
  }
  v7->_streamInputID = v10;
  v7->_captureSourceID = a3;
  -[VCStreamInputCaptureSource setupFormatWithConfiguration:](v7, "setupFormatWithConfiguration:", a4);
  if (!v7->_formatDescription)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamInputCaptureSource initWithCaptureSourceID:configuration:].cold.3();
    }
LABEL_21:

    return 0;
  }
  if (VRTraceIsInternalOSInstalled())
    -[VCStreamInputCaptureSource loadCannedVideoReplay](v7, "loadCannedVideoReplay");
  return v7;
}

- (void)loadCannedVideoReplay
{
  const __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  unint64_t Dimensions;
  CannedVideoCapture *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int frameRate;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  unsigned int v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, uint64_t, int, char);
  int v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  _BYTE v38[10];
  __CFString *v39;
  _BYTE v40[6];
  __int16 v41;
  int32_t v42;
  __int16 v43;
  unsigned int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (CMFormatDescriptionGetMediaType(self->_formatDescription) != 1986618469)
  {
    v5 = 0;
    goto LABEL_16;
  }
  v3 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%s"), CFSTR("cannedReplay"), FourccToCStr(self->_streamInputID));
  v4 = (__CFString *)VCDefaults_CopyStringValueForKey(v3);
  v5 = v4;
  if (v4 && -[__CFString length](v4, "length"))
  {
    Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(self->_formatDescription);
    v28 = 0;
    v27 = _VCStreamInputCaptureSource_OnCaptureVideoFrame;
    LOBYTE(v26) = 0;
    v7 = -[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:]([CannedVideoCapture alloc], "initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:", self, &v27, Dimensions, HIDWORD(Dimensions), self->_frameRate, 0, v5, v26, &v28);
    self->_cannedVideoCapture = (VCVideoSource *)v7;
    if (!v7)
    {
      if ((VCStreamInputCaptureSource *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_16;
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        frameRate = self->_frameRate;
        *(_DWORD *)buf = 136316930;
        v30 = v17;
        v31 = 2080;
        v32 = "-[VCStreamInputCaptureSource loadCannedVideoReplay]";
        v33 = 1024;
        v34 = 110;
        v35 = 2112;
        v36 = v5;
        v37 = 1024;
        *(_DWORD *)v38 = Dimensions;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = HIDWORD(Dimensions);
        LOWORD(v39) = 1024;
        *(_DWORD *)((char *)&v39 + 2) = frameRate;
        HIWORD(v39) = 1024;
        *(_DWORD *)v40 = v28;
        v20 = " [%s] %s:%d Failed to load file at path=%@, width=%d height=%d frameRate=%u error=0x%x";
        v21 = v18;
        v22 = 62;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v16 = (const __CFString *)-[VCStreamInputCaptureSource performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v16 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_16;
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        v25 = self->_frameRate;
        *(_DWORD *)buf = 136317442;
        v30 = v23;
        v31 = 2080;
        v32 = "-[VCStreamInputCaptureSource loadCannedVideoReplay]";
        v33 = 1024;
        v34 = 110;
        v35 = 2112;
        v36 = v16;
        v37 = 2048;
        *(_QWORD *)v38 = self;
        *(_WORD *)&v38[8] = 2112;
        v39 = v5;
        *(_WORD *)v40 = 1024;
        *(_DWORD *)&v40[2] = Dimensions;
        v41 = 1024;
        v42 = HIDWORD(Dimensions);
        v43 = 1024;
        v44 = v25;
        v45 = 1024;
        v46 = v28;
        v20 = " [%s] %s:%d %@(%p) Failed to load file at path=%@, width=%d height=%d frameRate=%u error=0x%x";
        v21 = v24;
        v22 = 82;
      }
      _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
      goto LABEL_16;
    }
    *(unint64_t *)&self->_cannedVideoWidth = Dimensions;
    if ((VCStreamInputCaptureSource *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v30 = v9;
          v31 = 2080;
          v32 = "-[VCStreamInputCaptureSource loadCannedVideoReplay]";
          v33 = 1024;
          v34 = 113;
          v35 = 2112;
          v36 = v5;
          v11 = " [%s] %s:%d Successfully loaded file at path=%@";
          v12 = v10;
          v13 = 38;
LABEL_15:
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCStreamInputCaptureSource performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v30 = v14;
          v31 = 2080;
          v32 = "-[VCStreamInputCaptureSource loadCannedVideoReplay]";
          v33 = 1024;
          v34 = 113;
          v35 = 2112;
          v36 = v8;
          v37 = 2048;
          *(_QWORD *)v38 = self;
          *(_WORD *)&v38[8] = 2112;
          v39 = v5;
          v11 = " [%s] %s:%d %@(%p) Successfully loaded file at path=%@";
          v12 = v15;
          v13 = 58;
          goto LABEL_15;
        }
      }
    }
  }
LABEL_16:

}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDescription;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  pthread_mutex_destroy(&self->_sinkMutex);
  formatDescription = self->_formatDescription;
  if (formatDescription)
    CFRelease(formatDescription);
  objc_storeWeak(&self->_delegate, 0);

  v4.receiver = self;
  v4.super_class = (Class)VCStreamInputCaptureSource;
  -[VCVideoCapture dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int captureSourceID;

  if (!a3)
    return 0;
  captureSourceID = self->_captureSourceID;
  return captureSourceID == objc_msgSend(a3, "captureSourceID")
      && CMFormatDescriptionEqual(self->_formatDescription, (CMFormatDescriptionRef)objc_msgSend(a3, "formatDescription")) != 0;
}

+ (BOOL)readIntegerFromConfig:(id)a3 key:(id)a4 value:(int64_t *)a5
{
  uint64_t v8;
  void *v9;
  _BOOL4 v10;

  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  if (a4 && a3 && a5)
  {
    v9 = (void *)v8;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *a5 = objc_msgSend(v9, "integerValue");
        LOBYTE(v10) = 1;
        return v10;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v10)
          return v10;
        +[VCStreamInputCaptureSource readIntegerFromConfig:key:value:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v10)
        return v10;
      +[VCStreamInputCaptureSource readIntegerFromConfig:key:value:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v10)
      return v10;
    +[VCStreamInputCaptureSource readIntegerFromConfig:key:value:].cold.1();
  }
  LOBYTE(v10) = 0;
  return v10;
}

+ (BOOL)readUint32FromConfig:(id)a3 key:(id)a4 value:(unsigned int *)a5
{
  uint64_t v8;
  void *v9;
  _BOOL4 v10;

  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  if (a4 && a3 && a5)
  {
    v9 = (void *)v8;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *a5 = objc_msgSend(v9, "unsignedIntValue");
        LOBYTE(v10) = 1;
        return v10;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v10)
          return v10;
        +[VCStreamInputCaptureSource readUint32FromConfig:key:value:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v10)
        return v10;
      +[VCStreamInputCaptureSource readUint32FromConfig:key:value:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v10)
      return v10;
    +[VCStreamInputCaptureSource readUint32FromConfig:key:value:].cold.1();
  }
  LOBYTE(v10) = 0;
  return v10;
}

- (BOOL)setupFormatWithConfiguration:(id)a3
{
  unsigned int *p_frameRate;
  const void *v6;
  const void *v7;
  CFTypeID v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_frameRate = &self->_frameRate;
  if (!+[VCStreamInputCaptureSource readUint32FromConfig:key:value:](VCStreamInputCaptureSource, "readUint32FromConfig:key:value:", a3, CFSTR("framerate"), &self->_frameRate))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCStreamInputCaptureSource setupFormatWithConfiguration:].cold.4();
    }
    goto LABEL_25;
  }
  if (!*p_frameRate)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCStreamInputCaptureSource setupFormatWithConfiguration:].cold.1(v10, (uint64_t)p_frameRate, v11);
    }
    goto LABEL_25;
  }
  v6 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("formatDescription"));
  if (v6)
  {
    v7 = v6;
    v8 = CFGetTypeID(v6);
    if (v8 == CMFormatDescriptionGetTypeID())
    {
      self->_formatDescription = (opaqueCMFormatDescription *)CFRetain(v7);
LABEL_6:
      LOBYTE(v9) = 1;
      return v9;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCStreamInputCaptureSource setupFormatWithConfiguration:].cold.3();
    }
    goto LABEL_25;
  }
  v13 = 0;
  if (!+[VCStreamInputCaptureSource readUint32FromConfig:key:value:](VCStreamInputCaptureSource, "readUint32FromConfig:key:value:", a3, CFSTR("type"), &v13))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCStreamInputCaptureSource setupFormatWithConfiguration:].cold.2();
    }
LABEL_25:
    LOBYTE(v9) = 0;
    return v9;
  }
  if (v13 == 1835365473)
  {
    LOBYTE(v9) = -[VCStreamInputCaptureSource setupDataFormatWithConfiguration:](self, "setupDataFormatWithConfiguration:", a3);
  }
  else
  {
    if (v13 != 1986618469)
      goto LABEL_6;
    LOBYTE(v9) = -[VCStreamInputCaptureSource setupVideoFormatWithConfiguration:](self, "setupVideoFormatWithConfiguration:", a3);
  }
  return v9;
}

- (BOOL)setupVideoFormatWithConfiguration:(id)a3
{
  _BOOL4 v5;
  int32_t height;
  int32_t v8;
  CMVideoCodecType v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  if (+[VCStreamInputCaptureSource readUint32FromConfig:key:value:](VCStreamInputCaptureSource, "readUint32FromConfig:key:value:", a3, CFSTR("subtype"), &v9))
  {
    v8 = 0;
    if (+[VCStreamInputCaptureSource readUint32FromConfig:key:value:](VCStreamInputCaptureSource, "readUint32FromConfig:key:value:", a3, CFSTR("width"), &v8))
    {
      height = 0;
      if (+[VCStreamInputCaptureSource readUint32FromConfig:key:value:](VCStreamInputCaptureSource, "readUint32FromConfig:key:value:", a3, CFSTR("height"), &height))
      {
        LOBYTE(v5) = CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9, v8, height, 0, &self->_formatDescription) == 0;
        return v5;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        -[VCStreamInputCaptureSource setupVideoFormatWithConfiguration:].cold.1();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v5)
        return v5;
      -[VCStreamInputCaptureSource setupVideoFormatWithConfiguration:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v5)
      return v5;
    -[VCStreamInputCaptureSource setupVideoFormatWithConfiguration:].cold.3();
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)setupDataFormatWithConfiguration:(id)a3
{
  _BOOL4 v4;
  FourCharCode mediaSubType;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  mediaSubType = 0;
  if (+[VCStreamInputCaptureSource readUint32FromConfig:key:value:](VCStreamInputCaptureSource, "readUint32FromConfig:key:value:", a3, CFSTR("subtype"), &mediaSubType))
  {
    LOBYTE(v4) = CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D657461u, mediaSubType, 0, &self->_formatDescription) == 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v4)
        return v4;
      -[VCStreamInputCaptureSource setupDataFormatWithConfiguration:].cold.1();
    }
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  _opaque_pthread_mutex_t *p_sinkMutex;
  id Weak;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  int v11;
  _BOOL4 v12;
  BOOL v13;
  uint64_t v14;
  NSObject *v15;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_sinkMutex = &self->_sinkMutex;
  pthread_mutex_lock(&self->_sinkMutex);
  Weak = objc_loadWeak(&self->_delegate);
  if (Weak == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v18 = v14;
        v19 = 2080;
        v20 = "-[VCStreamInputCaptureSource setDelegate:]";
        v21 = 1024;
        v22 = 235;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Registering the same delegate twice!", buf, 0x1Cu);
      }
    }
    pthread_mutex_unlock(p_sinkMutex);
    goto LABEL_23;
  }
  v7 = Weak;
  v16.receiver = self;
  v16.super_class = (Class)VCStreamInputCaptureSource;
  v8 = -[VCVideoCapture sinkCount](&v16, sel_sinkCount);
  v9 = v8;
  if (a3)
    v10 = v8 == 0;
  else
    v10 = 1;
  v11 = !v10;
  objc_storeWeak(&self->_delegate, a3);
  v12 = -[VCStreamInputCaptureSource allSinksSuspended](self, "allSinksSuspended");
  pthread_mutex_unlock(p_sinkMutex);
  if (v7)
    v13 = v9 == 0;
  else
    v13 = 1;
  if (v13)
  {
    if (!v11)
      goto LABEL_17;
  }
  else
  {
    objc_msgSend(v7, "didStopStreamInputCaptureSource");
    if ((v11 & 1) == 0)
    {
LABEL_17:
      if (v12)
        goto LABEL_18;
      goto LABEL_23;
    }
  }
  objc_msgSend(a3, "didStartStreamInputCaptureSource");
  if (v12)
  {
LABEL_18:
    objc_msgSend(a3, "didSuspendStreamInputCaptureSource");
    return;
  }
LABEL_23:
  objc_msgSend(a3, "didResumeStreamInputCaptureSource");
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = *a4;
  VCVideoCapture_DistributeVideoFrame((uint64_t)self, (uint64_t)a3, (__int128 *)&v6.var0, (uint64_t)a5);
  return 1;
}

- (id)copyOnVideoFrameBlock
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__VCStreamInputCaptureSource_copyOnVideoFrameBlock__block_invoke;
  v3[3] = &unk_1E9E56490;
  v3[4] = self;
  return _Block_copy(v3);
}

uint64_t __51__VCStreamInputCaptureSource_copyOnVideoFrameBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)a3;
  v7 = *(_QWORD *)(a3 + 16);
  VCVideoCapture_DistributeVideoFrame(v4, a2, &v6, a4);
  return 1;
}

- (unsigned)addSink:(id)a3
{
  _opaque_pthread_mutex_t *p_sinkMutex;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  VCVideoSource *cannedVideoCapture;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_sinkMutex = &self->_sinkMutex;
  pthread_mutex_lock(&self->_sinkMutex);
  v6 = -[VCVideoCapture sinkCount](self, "sinkCount");
  v12.receiver = self;
  v12.super_class = (Class)VCStreamInputCaptureSource;
  v7 = -[VCVideoCapture addSink:](&v12, sel_addSink_, a3);
  v8 = (void *)MEMORY[0x1DF086F1C](&self->_delegate);
  pthread_mutex_unlock(p_sinkMutex);
  if (v7 == 1 && v6 == 0)
  {
    cannedVideoCapture = self->_cannedVideoCapture;
    if (!cannedVideoCapture)
    {
      objc_msgSend(v8, "didStartStreamInputCaptureSource");
      if (!v8)
        return v7;
      goto LABEL_9;
    }
    -[VCVideoSource setWidth:height:frameRate:](cannedVideoCapture, "setWidth:height:frameRate:", self->_cannedVideoWidth, self->_cannedVideoHeight, self->_frameRate);
    -[VCVideoSource startPreview](self->_cannedVideoCapture, "startPreview");
  }
  if (v8)
LABEL_9:
    CFRelease(v8);
  return v7;
}

- (unsigned)removeSink:(id)a3
{
  _opaque_pthread_mutex_t *p_sinkMutex;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  BOOL v9;
  VCVideoSource *cannedVideoCapture;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_sinkMutex = &self->_sinkMutex;
  pthread_mutex_lock(&self->_sinkMutex);
  v6 = -[VCVideoCapture sinkCount](self, "sinkCount");
  v12.receiver = self;
  v12.super_class = (Class)VCStreamInputCaptureSource;
  v7 = -[VCVideoCapture removeSink:](&v12, sel_removeSink_, a3);
  v8 = (void *)MEMORY[0x1DF086F1C](&self->_delegate);
  pthread_mutex_unlock(p_sinkMutex);
  if (v7)
    v9 = 1;
  else
    v9 = v6 == 0;
  if (!v9)
  {
    cannedVideoCapture = self->_cannedVideoCapture;
    if (!cannedVideoCapture)
    {
      objc_msgSend(v8, "didStopStreamInputCaptureSource");
      if (!v8)
        return v7;
      goto LABEL_8;
    }
    -[VCVideoSource stop:](cannedVideoCapture, "stop:", 1);
  }
  if (v8)
LABEL_8:
    CFRelease(v8);
  return v7;
}

- (BOOL)allSinksSuspended
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)-[NSMutableDictionary allValues](self->_videoSinkState, "allValues");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "unsignedCharValue") != 1)
          return 0;
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      if (v4)
        continue;
      break;
    }
  }
  return 1;
}

- (void)didSuspendVideoSink:(id)a3
{
  _opaque_pthread_mutex_t *p_sinkMutex;
  void *v6;
  BOOL v7;
  _BOOL4 v8;

  p_sinkMutex = &self->_sinkMutex;
  pthread_mutex_lock(&self->_sinkMutex);
  v6 = (void *)MEMORY[0x1DF086F1C](&self->_delegate);
  v7 = -[VCStreamInputCaptureSource allSinksSuspended](self, "allSinksSuspended");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_videoSinkState, "setObject:forKeyedSubscript:", &unk_1E9EF7370, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "hash")));
  if (v7)
  {
    pthread_mutex_unlock(p_sinkMutex);
  }
  else
  {
    v8 = -[VCStreamInputCaptureSource allSinksSuspended](self, "allSinksSuspended");
    pthread_mutex_unlock(p_sinkMutex);
    if (v8)
      objc_msgSend(v6, "didSuspendStreamInputCaptureSource");
  }
  if (v6)
    CFRelease(v6);
}

- (void)didResumeVideoSink:(id)a3
{
  _opaque_pthread_mutex_t *p_sinkMutex;
  void *v6;
  _BOOL4 v7;
  BOOL v8;

  p_sinkMutex = &self->_sinkMutex;
  pthread_mutex_lock(&self->_sinkMutex);
  v6 = (void *)MEMORY[0x1DF086F1C](&self->_delegate);
  v7 = -[VCStreamInputCaptureSource allSinksSuspended](self, "allSinksSuspended");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_videoSinkState, "setObject:forKeyedSubscript:", &unk_1E9EF7388, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "hash")));
  if (v7)
  {
    v8 = -[VCStreamInputCaptureSource allSinksSuspended](self, "allSinksSuspended");
    pthread_mutex_unlock(p_sinkMutex);
    if (!v8)
      objc_msgSend(v6, "didResumeStreamInputCaptureSource");
    if (v6)
      goto LABEL_5;
  }
  else
  {
    pthread_mutex_unlock(p_sinkMutex);
    if (v6)
LABEL_5:
      CFRelease(v6);
  }
}

- (void)onCaptureScreenFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 orientation:(int)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;
  _QWORD v6[2];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  v7 = 0;
  v5 = *a4;
  VCVideoCapture_DistributeVideoFrame((uint64_t)self, (uint64_t)a3, (__int128 *)&v5.var0, (uint64_t)v6);
}

- (int)getCaptureFrameRateForSource:(int)a3
{
  if (self->_captureSourceID == a3)
    return self->_frameRate;
  else
    return 0;
}

- (int64_t)streamInputID
{
  return self->_streamInputID;
}

- (int)captureSourceID
{
  return self->_captureSourceID;
}

- (void)setCaptureSourceID:(int)a3
{
  self->_captureSourceID = a3;
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (void)initWithCaptureSourceID:configuration:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid captureSourceID=%d", v2, v3, v4, 63);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCaptureSourceID:configuration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video sink state dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCaptureSourceID:configuration:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the format description", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCaptureSourceID:configuration:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[30];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_7();
  v3 = CFSTR("streamInputID");
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)readIntegerFromConfig:key:value:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)readIntegerFromConfig:key:value:.cold.2()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Missing key=%@ in config", v1);
  OUTLINED_FUNCTION_3();
}

+ (void)readIntegerFromConfig:key:value:.cold.3()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Unexpected class for key=%@", v1);
  OUTLINED_FUNCTION_3();
}

+ (void)readUint32FromConfig:key:value:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)readUint32FromConfig:key:value:.cold.2()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Missing key=%@ in config", v1);
  OUTLINED_FUNCTION_3();
}

+ (void)readUint32FromConfig:key:value:.cold.3()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Unexpected class for key=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)setupFormatWithConfiguration:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCStreamInputCaptureSource setupFormatWithConfiguration:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, a2, a3, " [%s] %s:%d Invalid framerate=%u", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCStreamInputCaptureSource setupFormatWithConfiguration:]" >> 16, 166);
  OUTLINED_FUNCTION_3();
}

- (void)setupFormatWithConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[30];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_7();
  v3 = CFSTR("type");
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)setupFormatWithConfiguration:.cold.3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v3 = 171;
  v4 = 2048;
  v5 = v0;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d Incorrect format type typeId=%lu", v2);
  OUTLINED_FUNCTION_3();
}

- (void)setupFormatWithConfiguration:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[30];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_7();
  v3 = CFSTR("framerate");
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoFormatWithConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[30];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_7();
  v3 = CFSTR("height");
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoFormatWithConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[30];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_7();
  v3 = CFSTR("width");
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoFormatWithConfiguration:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[30];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_7();
  v3 = CFSTR("subtype");
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)setupDataFormatWithConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[30];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_7();
  v3 = CFSTR("subtype");
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2);
  OUTLINED_FUNCTION_3();
}

@end
