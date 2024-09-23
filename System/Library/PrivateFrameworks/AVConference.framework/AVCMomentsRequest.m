@implementation AVCMomentsRequest

- (BOOL)startWithError:(id *)a3
{
  AVCMediaRecorderRequestDelegate *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL result;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVCMomentsRequest *v17;
  __int16 v18;
  AVCMediaRecorderRequestDelegate *v19;
  __int16 v20;
  id *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = -[AVCMomentsRequest delegate](self, "delegate");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCMediaRecorderRequest-startWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316418;
      v11 = v6;
      v12 = 2080;
      v13 = "-[AVCMomentsRequest startWithError:]";
      v14 = 1024;
      v15 = 40;
      v16 = 2112;
      v17 = self;
      v18 = 2112;
      v19 = v5;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCMediaRecorderRequest-startWithError self=%@ delegate=%@ error=%p", (uint8_t *)&v10, 0x3Au);
    }
  }
  if (v5)
    return -[AVCMediaRecorderRequestDelegate avcMediaRecorderRequestDidStartRequest:withError:](v5, "avcMediaRecorderRequestDidStartRequest:withError:", self, a3);
  if (!a3)
    return 0;
  v9 = +[AVCMomentsRequest invalidDelegateInstanceError](AVCMomentsRequest, "invalidDelegateInstanceError");
  result = 0;
  *a3 = v9;
  return result;
}

- (BOOL)endWithError:(id *)a3
{
  AVCMediaRecorderRequestDelegate *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL result;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVCMomentsRequest *v17;
  __int16 v18;
  AVCMediaRecorderRequestDelegate *v19;
  __int16 v20;
  id *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = -[AVCMomentsRequest delegate](self, "delegate");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCMediaRecorderRequest-endWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316418;
      v11 = v6;
      v12 = 2080;
      v13 = "-[AVCMomentsRequest endWithError:]";
      v14 = 1024;
      v15 = 51;
      v16 = 2112;
      v17 = self;
      v18 = 2112;
      v19 = v5;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCMediaRecorderRequest-endWithError self=%@ delegate=%@ error=%p", (uint8_t *)&v10, 0x3Au);
    }
  }
  if (v5)
    return -[AVCMediaRecorderRequestDelegate avcMediaRecorderRequestDidEndRequest:withError:](v5, "avcMediaRecorderRequestDidEndRequest:withError:", self, a3);
  if (!a3)
    return 0;
  v9 = +[AVCMomentsRequest invalidDelegateInstanceError](AVCMomentsRequest, "invalidDelegateInstanceError");
  result = 0;
  *a3 = v9;
  return result;
}

- (BOOL)rejectWithError:(id *)a3
{
  AVCMediaRecorderRequestDelegate *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL result;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVCMomentsRequest *v17;
  __int16 v18;
  AVCMediaRecorderRequestDelegate *v19;
  __int16 v20;
  id *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = -[AVCMomentsRequest delegate](self, "delegate");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCMediaRecorderRequest-rejectWithError");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316418;
      v11 = v6;
      v12 = 2080;
      v13 = "-[AVCMomentsRequest rejectWithError:]";
      v14 = 1024;
      v15 = 61;
      v16 = 2112;
      v17 = self;
      v18 = 2112;
      v19 = v5;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCMediaRecorderRequest-rejectWithError self=%@ delegate=%@ error=%p", (uint8_t *)&v10, 0x3Au);
    }
  }
  if (v5)
    return -[AVCMediaRecorderRequestDelegate avcMediaRecorderRequestDidRejectRequest:withError:](v5, "avcMediaRecorderRequestDidRejectRequest:withError:", self, a3);
  if (!a3)
    return 0;
  v9 = +[AVCMomentsRequest invalidDelegateInstanceError](AVCMomentsRequest, "invalidDelegateInstanceError");
  result = 0;
  *a3 = v9;
  return result;
}

- (BOOL)setUpDirectoryURLWithConfiguration:(id)a3
{
  uint64_t v4;
  void *v5;
  VCSandboxedURL *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  int mode;
  uint64_t v11;
  NSObject *v12;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "directoryURL");
  if (!v4)
    goto LABEL_8;
  v5 = (void *)v4;
  if (!VCFeatureFlagManager_RecordingResiliencyEnabled())
    goto LABEL_8;
  if (self->_mode == 1)
  {
    v14 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend(v5, "path"), &v14) & 1) != 0)
    {
      if (v14)
      {
        if (access((const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "URLByStandardizingPath"), "path"), "UTF8String"), 6))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *MEMORY[0x1E0CF2758];
            v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v7)
              return v7;
            -[AVCMomentsRequest setUpDirectoryURLWithConfiguration:].cold.3(v11, (uint64_t)v5, v12);
          }
        }
        else
        {
          v6 = -[VCSandboxedURL initWithURL:accessType:]([VCSandboxedURL alloc], "initWithURL:accessType:", v5, 2);
          self->_directoryURL = v6;
          if (v6)
          {
LABEL_8:
            LOBYTE(v7) = 1;
            return v7;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v7)
              return v7;
            -[AVCMomentsRequest setUpDirectoryURLWithConfiguration:].cold.2();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v7)
          return v7;
        -[AVCMomentsRequest setUpDirectoryURLWithConfiguration:].cold.1();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v7)
        return v7;
      -[AVCMomentsRequest setUpDirectoryURLWithConfiguration:].cold.4();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    mode = self->_mode;
    *(_DWORD *)buf = 136316162;
    v16 = v8;
    v17 = 2080;
    v18 = "-[AVCMomentsRequest setUpDirectoryURLWithConfiguration:]";
    v19 = 1024;
    v20 = 85;
    v21 = 2112;
    v22 = v5;
    v23 = 1024;
    v24 = mode;
    _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d Providing a directoryURL=%@ is unsupported with a non-local request mode=%hhu", buf, 0x2Cu);
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)setUpMovieFragmentIntervalWithConfiguration:(id)a3
{
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  Float64 Seconds;
  int mode;
  CMTime v10;
  CMTime time;
  int v12;
  __int16 v13;
  Float64 v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  self->_movieFragmentInterval = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  memset(&v10, 170, sizeof(v10));
  if (!a3)
    goto LABEL_6;
  objc_msgSend(a3, "movieFragmentInterval");
  if ((v10.flags & 1) == 0 || !VCFeatureFlagManager_RecordingResiliencyEnabled())
    goto LABEL_6;
  if (self->_mode == 1)
  {
    self->_movieFragmentInterval = ($95D729B680665BEAEFA1D6FCA8238556)v10;
LABEL_6:
    LOBYTE(v4) = 1;
    return v4;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v4)
      return v4;
    time = v10;
    Seconds = CMTimeGetSeconds(&time);
    mode = self->_mode;
    LODWORD(time.value) = 136316162;
    *(CMTimeValue *)((char *)&time.value + 4) = v5;
    LOWORD(time.flags) = 2080;
    *(_QWORD *)((char *)&time.flags + 2) = "-[AVCMomentsRequest setUpMovieFragmentIntervalWithConfiguration:]";
    HIWORD(time.epoch) = 1024;
    v12 = 114;
    v13 = 2048;
    v14 = Seconds;
    v15 = 1024;
    v16 = mode;
    _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d Providing a movieFragmentInterval=%f is unsupported with a non-local request mode=%hhu", (uint8_t *)&time, 0x2Cu);
  }
  LOBYTE(v4) = 0;
  return v4;
}

- (AVCMomentsRequest)initWithConfiguration:(id)a3 requesterID:(id)a4 transactionID:(id)a5
{
  AVCMomentsRequest *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)AVCMomentsRequest;
  v8 = -[AVCMomentsRequest init](&v10, sel_init);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMomentsRequest initWithConfiguration:requesterID:transactionID:].cold.1();
    }
    goto LABEL_18;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMomentsRequest initWithConfiguration:requesterID:transactionID:].cold.2();
    }
    goto LABEL_18;
  }
  v8->_transactionID = (NSString *)objc_msgSend(a5, "copy");
  v8->_requesterID = (NSString *)objc_msgSend(a4, "copy");
  v8->_requesteeID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "requesteeID"), "copy");
  v8->_mediaType = objc_msgSend(a3, "mediaType");
  v8->_mode = objc_msgSend(a3, "requestMode");
  if (!-[AVCMomentsRequest setUpDirectoryURLWithConfiguration:](v8, "setUpDirectoryURLWithConfiguration:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMomentsRequest initWithConfiguration:requesterID:transactionID:].cold.4();
    }
    goto LABEL_18;
  }
  if (!-[AVCMomentsRequest setUpMovieFragmentIntervalWithConfiguration:](v8, "setUpMovieFragmentIntervalWithConfiguration:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMomentsRequest initWithConfiguration:requesterID:transactionID:].cold.3();
    }
LABEL_18:

    return 0;
  }
  return v8;
}

- (AVCMomentsRequest)initWithConfiguration:(id)a3 requesterID:(id)a4
{
  return -[AVCMomentsRequest initWithConfiguration:requesterID:transactionID:](self, "initWithConfiguration:requesterID:transactionID:", a3, a4, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"));
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVCMomentsRequest dealloc]";
      v10 = 1024;
      v11 = 151;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  objc_storeWeak(&self->_weakDelegate, 0);

  v5.receiver = self;
  v5.super_class = (Class)AVCMomentsRequest;
  -[AVCMomentsRequest dealloc](&v5, sel_dealloc);
}

- (id)description
{
  const __CFAllocator *v3;
  CFStringRef v4;
  CFStringRef v5;
  void *v6;
  objc_super v8;
  CMTime time;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = VCMediaRecorderUtil_CopyDescriptionForMediaType((const __CFAllocator *)*MEMORY[0x1E0C9AE00], self->_mediaType);
  time = (CMTime)self->_movieFragmentInterval;
  v5 = CMTimeCopyDescription(v3, &time);
  v8.receiver = self;
  v8.super_class = (Class)AVCMomentsRequest;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ %@ transactionID=%@ mediaType=%@ requesterID=%@ requesteeID=%@ directoryURL=%@ movieFragmentInterval=%@ }"), -[AVCMomentsRequest description](&v8, sel_description), self->_transactionID, v4, self->_requesterID, self->_requesteeID, self->_directoryURL, v5);
  if (v5)
    CFRelease(v5);
  if (v4)
    CFRelease(v4);
  return v6;
}

- (id)serialize
{
  void *v3;
  void *v4;
  NSString *requesterID;
  NSString *requesteeID;
  VCSandboxedURL *directoryURL;
  const __CFAllocator *v8;
  CFDictionaryRef v9;
  $95D729B680665BEAEFA1D6FCA8238556 movieFragmentInterval;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v13[0] = self->_transactionID;
  v12[0] = CFSTR("vcMomentsTransactionID");
  v12[1] = CFSTR("vcMomentsMediaType");
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_mediaType);
  v12[2] = CFSTR("vcMomentsRequestMode");
  v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_mode);
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3), "mutableCopy");
  v4 = v3;
  requesterID = self->_requesterID;
  if (requesterID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", requesterID, CFSTR("vcMomentsRequesterID"));
  requesteeID = self->_requesteeID;
  if (requesteeID)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", requesteeID, CFSTR("vcMomentsRequesteeID"));
  directoryURL = self->_directoryURL;
  if (directoryURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[VCSandboxedURL serialize](directoryURL, "serialize"), CFSTR("vcMediaRecorderDirectoryURL"));
  if ((self->_movieFragmentInterval.flags & 1) != 0)
  {
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    movieFragmentInterval = self->_movieFragmentInterval;
    v9 = CMTimeCopyAsDictionary((CMTime *)&movieFragmentInterval, v8);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("vcMediaRecorderMovieFragmentInterval"));
    if (v9)
      CFRelease(v9);
  }
  return v4;
}

- (BOOL)hasDirectoryURL
{
  return self->_directoryURL != 0;
}

- (BOOL)validateWithError:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  AVCMomentsRequest *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (self->_transactionID)
  {
    if (self->_mediaType)
    {
      if (self->_mode)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      v6 = "mode is invalid";
      v7 = -4;
    }
    else
    {
      v6 = "media type is invalid";
      v7 = -3;
    }
  }
  else
  {
    v6 = "transactionID is nil";
    v7 = -1;
  }
  if (a3)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    *a3 = (id)objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("AVCMomentsRequest"), v7, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1));
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v5)
      return v5;
    v12 = 136316162;
    v13 = v9;
    v14 = 2080;
    v15 = "-[AVCMomentsRequest validateWithError:]";
    v16 = 1024;
    v17 = 215;
    v18 = 2048;
    v19 = self;
    v20 = 2080;
    v21 = v6;
    _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %p failed validation: %s", (uint8_t *)&v12, 0x30u);
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (AVCMediaRecorderRequestDelegate)delegate
{
  return (AVCMediaRecorderRequestDelegate *)objc_loadWeak(&self->_weakDelegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_weakDelegate, a3);
}

+ (id)invalidDelegateInstanceError
{
  uint64_t v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB2D50];
  v5[0] = CFSTR("Attempting to invoke on request with no valid parent class");
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVCMomentsRequest"), -5, v2);
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (NSString)requesterID
{
  return self->_requesterID;
}

- (NSString)requesteeID
{
  return self->_requesteeID;
}

- (void)setUpDirectoryURLWithConfiguration:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d directoryURL=%@ is NOT a directory");
  OUTLINED_FUNCTION_3();
}

- (void)setUpDirectoryURLWithConfiguration:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate sandboxedURL for directoryURL=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setUpDirectoryURLWithConfiguration:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int *v6;
  char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = __error();
  v7 = strerror(*v6);
  v8 = 136316162;
  v9 = a1;
  v10 = 2080;
  v11 = "-[AVCMomentsRequest setUpDirectoryURLWithConfiguration:]";
  v12 = 1024;
  v13 = 92;
  v14 = 2112;
  v15 = a2;
  v16 = 2080;
  v17 = v7;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed access check for directoryURL=%@, with error=%s", (uint8_t *)&v8, 0x30u);
}

- (void)setUpDirectoryURLWithConfiguration:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d directoryURL=%@ is NOT present on disk");
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:requesterID:transactionID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to super init request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:requesterID:transactionID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid configuration passed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:requesterID:transactionID:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Fsiled to set up movieFragmentInterval", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:requesterID:transactionID:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set up directoryURL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
