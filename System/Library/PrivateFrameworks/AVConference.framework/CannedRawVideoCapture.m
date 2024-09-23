@implementation CannedRawVideoCapture

- (CannedRawVideoCapture)initWithPath:(id)a3
{
  CannedRawVideoCapture *v5;
  CannedRawVideoCapture *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  objc_class *v11;
  const char *Name;
  const char *v13;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)CannedRawVideoCapture;
  v5 = -[CannedRawVideoCapture init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    pthread_mutex_init(&v5->_inputMutex, 0);
    pthread_mutex_init(&v6->_attributeMutex, 0);
    v7 = -[CannedRawVideoCapture initializeFrameResolutionArrayFromFolder:](v6, "initializeFrameResolutionArrayFromFolder:", a3);
    v6->_videoScaler = objc_alloc_init(VideoScaler);
    if (v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v11 = (objc_class *)objc_opt_class();
          Name = class_getName(v11);
          v13 = sel_getName(a2);
          *(_DWORD *)buf = 136316162;
          v16 = v8;
          v17 = 2080;
          v18 = "-[CannedRawVideoCapture initWithPath:]";
          v19 = 1024;
          v20 = 93;
          v21 = 2080;
          v22 = Name;
          v23 = 2080;
          v24 = v13;
          _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s failed!", buf, 0x30u);
        }
      }

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  FILE *currentInputFile;
  __CVPixelBufferPool *currentPixelBufferPool;
  __CVPixelBufferPool *rotatedPixelBufferPool;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  pthread_mutex_destroy(&self->_inputMutex);
  pthread_mutex_destroy(&self->_attributeMutex);

  currentInputFile = self->_currentInputFile;
  if (currentInputFile)
    fclose(currentInputFile);
  currentPixelBufferPool = self->_currentPixelBufferPool;
  if (currentPixelBufferPool)
    CFRelease(currentPixelBufferPool);
  rotatedPixelBufferPool = self->_rotatedPixelBufferPool;
  if (rotatedPixelBufferPool)
    CFRelease(rotatedPixelBufferPool);
  v6.receiver = self;
  v6.super_class = (Class)CannedRawVideoCapture;
  -[CannedRawVideoCapture dealloc](&v6, sel_dealloc);
}

- (int)initializeFrameResolutionArrayFromFolder:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  BOOL v12;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  double v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  void *v26;
  id v27;
  int v28;
  float v29;
  uint64_t v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = a3;
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v5)
  {
    v6 = v5;
    v28 = 0x7FFFFFFF;
    v7 = *(_QWORD *)v35;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasSuffix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%s"), "420v")))
        {
          v30 = 0;
          v29 = 0.0;
          v12 = sscanf((const char *)objc_msgSend(v10, "UTF8String"), "%dx%dx%f", (char *)&v30 + 4, &v30, &v29) != 3
             || SHIDWORD(v30) < 1;
          if (!v12 && (int)v30 >= 1)
          {
            *(float *)&v11 = v29;
            if (v29 > 0.0)
            {
              v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v11, v27, v10);
              v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", v14, 0), "fileSize");
              v16 = v15 / ((uint64_t)(int)(12 * HIDWORD(v30) * v30 + (12 * HIDWORD(v30) * (int)v30 < 0 ? 7 : 0)) >> 3);
              if ((_DWORD)v16)
              {
                v31[0] = CFSTR("width");
                v32[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
                v31[1] = CFSTR("height");
                v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v30);
                v31[2] = CFSTR("path");
                v32[1] = v17;
                v32[2] = v14;
                objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
                v18 = v28 >= (int)v16 ? v16 : v28;
                v28 = v18;
                v11 = v29;
                if (v8 < v29)
                  v8 = v29;
              }
            }
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v33, 16, v11);
    }
    while (v6);
  }
  else
  {
    v28 = 0x7FFFFFFF;
    v8 = 0.0;
  }
  if (objc_msgSend(v26, "count"))
  {
    pthread_mutex_lock(&self->_inputMutex);

    self->_allResolutions = (NSArray *)v26;
    v19 = v28;
    if (v28 <= 1)
      v19 = 1;
    self->_allFrameCount = v19;
    v20 = 10.0;
    if (v8 > 0.0)
      v20 = v8;
    self->_allFrameRate = v20;
    pthread_mutex_unlock(&self->_inputMutex);
    objc_msgSend(+[VCCannedAVSync sharedCannedAVSync](VCCannedAVSync, "sharedCannedAVSync"), "addStreamWithCount:rate:", self->_allFrameCount, self->_allFrameRate);
    return 0;
  }
  else
  {
    v21 = -2142633974;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedRawVideoCapture initializeFrameResolutionArrayFromFolder:].cold.1(v22, v27, v23);
    }
  }
  return v21;
}

- (int)setWidth:(int)a3 height:(int)a4
{
  _opaque_pthread_mutex_t *p_attributeMutex;
  uint64_t v8;
  NSObject *v9;
  int v10;
  NSArray *allResolutions;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  int v19;
  NSDictionary *currentResolution;
  FILE *currentInputFile;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  __CVPixelBufferPool *currentPixelBufferPool;
  CFTypeRef *p_currentPixelBufferPool;
  __CVPixelBufferPool *v28;
  __CVPixelBufferPool **p_rotatedPixelBufferPool;
  __CVPixelBufferPool *rotatedPixelBufferPool;
  _opaque_pthread_mutex_t *p_inputMutex;
  pthread_mutex_t *v33;
  void *v34;
  unsigned int v35;
  unsigned int v36;
  uint8_t v37[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  _BYTE v55[128];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  p_attributeMutex = &self->_attributeMutex;
  pthread_mutex_lock(&self->_attributeMutex);
  if (*(_QWORD *)&self->_width == __PAIR64__(a4, a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    {
LABEL_45:
      v10 = 0;
      goto LABEL_46;
    }
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    v10 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v46 = v8;
      v47 = 2080;
      v48 = "-[CannedRawVideoCapture setWidth:height:]";
      v49 = 1024;
      v50 = 200;
      v51 = 1024;
      v52 = a3;
      v53 = 1024;
      v54 = a4;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No width/height change (%dx%d). Skipping re-initialization.", buf, 0x28u);
      goto LABEL_45;
    }
  }
  else
  {
    self->_width = a3;
    self->_height = a4;
    p_inputMutex = &self->_inputMutex;
    pthread_mutex_lock(&self->_inputMutex);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    allResolutions = self->_allResolutions;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](allResolutions, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v34 = 0;
      v15 = *(_QWORD *)v57;
      v35 = 160;
      v36 = 120;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v57 != v15)
            objc_enumerationMutation(allResolutions);
          v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          v18 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("width"), p_inputMutex), "intValue");
          v19 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("height")), "intValue");
          if (v18 <= self->_width && v19 <= self->_height && v19 * v18 > v14)
          {
            v35 = v18;
            v36 = v19;
            v14 = v19 * v18;
            v34 = v17;
          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](allResolutions, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
      }
      while (v13);
    }
    else
    {
      v34 = 0;
      v35 = 160;
      v36 = 120;
    }

    currentResolution = v34;
    self->_currentResolution = currentResolution;
    currentInputFile = self->_currentInputFile;
    if (currentInputFile)
    {
      fclose(currentInputFile);
      self->_currentInputFile = 0;
      currentResolution = self->_currentResolution;
    }
    if (currentResolution)
    {
      bzero(buf, 0x400uLL);
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](currentResolution, "objectForKeyedSubscript:", CFSTR("path")), "getCString:maxLength:encoding:", buf, 1024, 4);
      self->_currentInputFile = fopen((const char *)buf, "rb");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          if (objc_msgSend(v34, "objectForKey:", CFSTR("path")))
            v25 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "objectForKey:", CFSTR("path")), "description"), "UTF8String");
          else
            v25 = "<nil>";
          *(_DWORD *)v37 = 136315906;
          v38 = v23;
          v39 = 2080;
          v40 = "-[CannedRawVideoCapture setWidth:height:]";
          v41 = 1024;
          v42 = 252;
          v43 = 2080;
          v44 = v25;
          _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reading from %s", v37, 0x26u);
        }
      }
    }
    p_currentPixelBufferPool = (CFTypeRef *)&self->_currentPixelBufferPool;
    currentPixelBufferPool = self->_currentPixelBufferPool;
    if (currentPixelBufferPool)
    {
      CFRelease(currentPixelBufferPool);
      *p_currentPixelBufferPool = 0;
    }
    rotatedPixelBufferPool = self->_rotatedPixelBufferPool;
    p_rotatedPixelBufferPool = &self->_rotatedPixelBufferPool;
    v28 = rotatedPixelBufferPool;
    if (rotatedPixelBufferPool)
    {
      CFRelease(v28);
      *p_rotatedPixelBufferPool = 0;
    }
    if (+[CannedVideoCapture createPixelBufferPool:withWidth:height:](CannedVideoCapture, "createPixelBufferPool:withWidth:height:", p_currentPixelBufferPool, v35, v36, p_inputMutex))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[CannedRawVideoCapture setWidth:height:].cold.2();
      }
    }
    else
    {
      if (!+[CannedVideoCapture createPixelBufferPool:withWidth:height:](CannedVideoCapture, "createPixelBufferPool:withWidth:height:", p_rotatedPixelBufferPool, v36, v35))
      {
        pthread_mutex_unlock(v33);
        goto LABEL_45;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[CannedRawVideoCapture setWidth:height:].cold.1();
      }
      if (*p_currentPixelBufferPool)
      {
        CFRelease(*p_currentPixelBufferPool);
        *p_currentPixelBufferPool = 0;
      }
    }
    v10 = -2142633980;
    pthread_mutex_unlock(v33);
  }
LABEL_46:
  pthread_mutex_unlock(p_attributeMutex);
  return v10;
}

- (__CVBuffer)createPixelBufferForFrameIndex:(int)a3
{
  _opaque_pthread_mutex_t *p_inputMutex;
  int v5;
  int v6;
  _BOOL4 v8;
  size_t v9;
  size_t v10;
  const __CFAllocator *v11;
  CFNumberRef v13;
  CFNumberRef v14;
  FILE *currentInputFile;
  char *BaseAddressOfPlane;
  char *v17;
  int BytesPerRowOfPlane;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  FILE *v22;
  char *v23;
  char *v24;
  unsigned int v25;
  size_t v26;
  FILE *v27;
  size_t v28;
  uint64_t v29;
  uint64_t v30;
  FILE *v31;
  CVPixelBufferRef pixelBufferOut;
  int valuePtr;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  valuePtr = a3;
  p_inputMutex = &self->_inputMutex;
  pthread_mutex_lock(&self->_inputMutex);
  v5 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_currentResolution, "objectForKeyedSubscript:", CFSTR("width")), "intValue");
  v6 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_currentResolution, "objectForKeyedSubscript:", CFSTR("height")), "intValue");
  v8 = v5 < 1 || v6 < 1;
  if (v8)
    v9 = 160;
  else
    v9 = v5;
  if (v8)
    v10 = 120;
  else
    v10 = v6;
  pixelBufferOut = 0;
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], self->_currentPixelBufferPool, &pixelBufferOut))
  {
    pthread_mutex_unlock(p_inputMutex);
    return 0;
  }
  else
  {
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8D68], (CFTypeRef)*MEMORY[0x1E0CA8D88], kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB0], kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8EE8], (CFTypeRef)*MEMORY[0x1E0CA8F18], kCVAttachmentMode_ShouldPropagate);
    v13 = CFNumberCreate(v11, kCFNumberIntType, &valuePtr);
    if (v13)
    {
      v14 = v13;
      CVBufferSetAttachment(pixelBufferOut, CFSTR("FrameIndex"), v13, kCVAttachmentMode_ShouldPropagate);
      CFRelease(v14);
    }
    currentInputFile = self->_currentInputFile;
    if (currentInputFile)
      fseeko(currentInputFile, valuePtr * (uint64_t)(12 * (int)v9 * (int)v10) / 8, 0);
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 0);
    if (BaseAddressOfPlane)
    {
      v17 = BaseAddressOfPlane;
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 0);
      if ((_DWORD)v9 == BytesPerRowOfPlane)
      {
        v19 = self->_currentInputFile;
        if (v19)
          fread(v17, v10, v9, v19);
        else
          bzero(v17, (int)v10 * (int)v9);
      }
      else
      {
        v20 = BytesPerRowOfPlane;
        if ((int)v10 <= 1)
          v21 = 1;
        else
          v21 = v10;
        do
        {
          v22 = self->_currentInputFile;
          if (v22)
            fread(v17, 1uLL, v9, v22);
          else
            bzero(v17, v9);
          v17 += v20;
          --v21;
        }
        while (v21);
      }
    }
    v23 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 1uLL);
    if (v23)
    {
      v24 = v23;
      v25 = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 1uLL);
      v26 = v9 & 0xFFFFFFFE;
      if ((_DWORD)v26 == v25)
      {
        v27 = self->_currentInputFile;
        v28 = v10 >> 1;
        if (v27)
          fread(v24, v28, v25, v27);
        else
          bzero(v24, v28 * v25);
      }
      else if (v10 >= 2)
      {
        v29 = v10 >> 1;
        v30 = (int)v25;
        do
        {
          v31 = self->_currentInputFile;
          if (v31)
            fread(v24, 1uLL, v26, v31);
          else
            bzero(v24, v26);
          v24 += v30;
          --v29;
        }
        while (v29);
      }
    }
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    pthread_mutex_unlock(p_inputMutex);
    return pixelBufferOut;
  }
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

- (NSArray)allResolutions
{
  return self->_allResolutions;
}

- (void)setAllResolutions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
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

- (NSDictionary)currentResolution
{
  return self->_currentResolution;
}

- (void)setCurrentResolution:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (VideoScaler)videoScaler
{
  return self->_videoScaler;
}

- (void)setVideoScaler:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (void)initializeFrameResolutionArrayFromFolder:(os_log_t)log .cold.1(uint64_t a1, void *a2, os_log_t log)
{
  const char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
    v5 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  else
    v5 = "<nil>";
  v6 = 136315906;
  v7 = a1;
  v8 = 2080;
  v9 = "-[CannedRawVideoCapture initializeFrameResolutionArrayFromFolder:]";
  v10 = 1024;
  v11 = 172;
  v12 = 2080;
  v13 = v5;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d There are no valid raw video files in the specified folder %s", (uint8_t *)&v6, 0x26u);
}

- (void)setWidth:height:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[CannedRawVideoCapture setWidth:height:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Rotated PixelBuffer pool creation failed(%d)", v2, *(const char **)v3, (unint64_t)"-[CannedRawVideoCapture setWidth:height:]" >> 16, 276);
}

- (void)setWidth:height:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[CannedRawVideoCapture setWidth:height:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d PixelBuffer pool creation failed(%d)", v2, *(const char **)v3, (unint64_t)"-[CannedRawVideoCapture setWidth:height:]" >> 16, 264);
}

@end
