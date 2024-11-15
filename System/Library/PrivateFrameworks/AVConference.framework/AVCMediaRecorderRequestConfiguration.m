@implementation AVCMediaRecorderRequestConfiguration

- (AVCMediaRecorderRequestConfiguration)init
{
  char *v2;
  uint64_t v3;
  NSObject *v4;
  objc_super v6;
  CMTime v7;
  int v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)AVCMediaRecorderRequestConfiguration;
  v2 = -[AVCMediaRecorderRequestConfiguration init](&v6, sel_init);
  if (v2)
  {
    CMTimeMakeWithSeconds(&v7, 10.0, 1);
    *(CMTime *)(v2 + 32) = v7;
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCMediaRecorderRequestConfiguration-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v7.value) = 136315906;
        *(CMTimeValue *)((char *)&v7.value + 4) = v3;
        LOWORD(v7.flags) = 2080;
        *(_QWORD *)((char *)&v7.flags + 2) = "-[AVCMediaRecorderRequestConfiguration init]";
        HIWORD(v7.epoch) = 1024;
        v8 = 29;
        v9 = 2048;
        v10 = v2;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCMediaRecorderRequestConfiguration-init (%p)", (uint8_t *)&v7, 0x26u);
      }
    }
  }
  return (AVCMediaRecorderRequestConfiguration *)v2;
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
  v8.super_class = (Class)AVCMediaRecorderRequestConfiguration;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ %@ mediaType=%@ requestMode=%hhu requesteeID=%@ directoryURL=%@ movieFragmentInterval=%@ }"), -[AVCMediaRecorderRequestConfiguration description](&v8, sel_description), v4, self->_requestMode, self->_requesteeID, self->_directoryURL, v5);
  if (v5)
    CFRelease(v5);
  if (v4)
    CFRelease(v4);
  return v6;
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
  __int16 v12;
  AVCMediaRecorderRequestConfiguration *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCMediaRecorderRequestConfiguration-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVCMediaRecorderRequestConfiguration dealloc]";
      v10 = 1024;
      v11 = 61;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCMediaRecorderRequestConfiguration-dealloc (%p)", buf, 0x26u);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCMediaRecorderRequestConfiguration;
  -[AVCMediaRecorderRequestConfiguration dealloc](&v5, sel_dealloc);
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unsigned __int8)a3
{
  self->_mediaType = a3;
}

- (unsigned)requestMode
{
  return self->_requestMode;
}

- (void)setRequestMode:(unsigned __int8)a3
{
  self->_requestMode = a3;
}

- (NSString)requesteeID
{
  return self->_requesteeID;
}

- (void)setRequesteeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setMovieFragmentInterval:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_movieFragmentInterval.epoch = a3->var3;
  *(_OWORD *)&self->_movieFragmentInterval.value = v3;
}

@end
