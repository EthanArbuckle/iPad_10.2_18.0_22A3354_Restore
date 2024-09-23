@implementation VCMediaRecorderHistoryRequestContext

- (VCMediaRecorderHistoryRequestContext)initWithSerializedRequest:(id)a3
{
  char *v4;
  uint64_t v5;
  const __CFDictionary *v6;
  uint64_t v8;
  NSObject *v9;
  CMTime v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCMediaRecorderHistoryRequestContext;
  v4 = -[VCMediaRecorderHistoryRequestContext init](&v11, sel_init);
  if (v4)
  {
    v4[24] = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsMediaType")), "intValue");
    *((_QWORD *)v4 + 4) = (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsTransactionID"));
    *((_DWORD *)v4 + 7) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestTimestamp")), "integerValue");
    v5 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v4 + 40) = *MEMORY[0x1E0CA2E18];
    *((_QWORD *)v4 + 7) = *(_QWORD *)(v5 + 16);
    v6 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaRecorderMovieFragmentInterval"));
    if (v6)
    {
      CMTimeMakeFromDictionary(&v10, v6);
      *(CMTime *)(v4 + 40) = v10;
    }
    *((_QWORD *)v4 + 1) = (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaRecorderDirectoryURL"));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaRecorderHistoryRequestContext initWithSerializedRequest:].cold.1(v8, v9);
  }
  return (VCMediaRecorderHistoryRequestContext *)v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaRecorderHistoryRequestContext;
  -[VCMediaRecorderHistoryRequestContext dealloc](&v3, sel_dealloc);
}

- (id)directoryURLDescription
{
  void *v2;
  _BOOL4 v4;
  const char *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  if (self->_directoryURL)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("directoryURL=%@"), self->_directoryURL);
  v4 = -[VCMediaRecorderHistoryRequestContext hasDirectoryURL](self, "hasDirectoryURL");
  v5 = "NO";
  if (v4)
    v5 = "YES";
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("hasDirectoryURL=%s"), v5);
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
  v8.super_class = (Class)VCMediaRecorderHistoryRequestContext;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ %@ mediaType=%@ transactionID=%@ timestamp=%u movieFragmentInterval=%@ %@ }"), -[VCMediaRecorderHistoryRequestContext description](&v8, sel_description), v4, self->_transactionID, self->_timestamp, v5, -[VCMediaRecorderHistoryRequestContext directoryURLDescription](self, "directoryURLDescription"));
  if (v5)
    CFRelease(v5);
  if (v4)
    CFRelease(v4);
  return v6;
}

- (BOOL)hasDirectoryURL
{
  return self->_serializedDirectoryURL != 0;
}

- (id)deserializeDirectoryURL
{
  VCSandboxedURL *directoryURL;

  directoryURL = self->_directoryURL;
  if (!directoryURL)
  {
    if (self->_serializedDirectoryURL)
    {
      directoryURL = (VCSandboxedURL *)(id)objc_msgSend(+[VCSandboxedURL deserialize:](VCSandboxedURL, "deserialize:"), "consumeToken");
      self->_directoryURL = directoryURL;
    }
    else
    {
      directoryURL = 0;
    }
  }
  return directoryURL;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (unsigned)timestamp
{
  return self->_timestamp;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)initWithSerializedRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCMediaRecorderHistoryRequestContext initWithSerializedRequest:]";
  v6 = 1024;
  v7 = 29;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to super init VCMediaRecorderHistoryRequestContext", (uint8_t *)&v2, 0x1Cu);
}

@end
