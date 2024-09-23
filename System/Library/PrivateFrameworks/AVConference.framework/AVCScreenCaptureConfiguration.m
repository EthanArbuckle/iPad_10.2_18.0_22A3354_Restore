@implementation AVCScreenCaptureConfiguration

- (AVCScreenCaptureConfiguration)initWithHeight:(unsigned int)a3 width:(unsigned int)a4 framerate:(unsigned int)a5 screenCaptureDisplayID:(unsigned int)a6
{
  uint64_t v11;
  NSObject *v12;
  AVCScreenCaptureConfiguration *result;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = v11;
      v17 = 2080;
      v18 = "-[AVCScreenCaptureConfiguration initWithHeight:width:framerate:screenCaptureDisplayID:]";
      v19 = 1024;
      v20 = 16;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)AVCScreenCaptureConfiguration;
  result = -[AVCScreenCaptureConfiguration init](&v14, sel_init);
  if (result)
  {
    result->_height = a3;
    result->_width = a4;
    result->_frameRate = a5;
    result->_screenCaptureDisplayID = a6;
  }
  return result;
}

- (AVCScreenCaptureConfiguration)init
{
  uint64_t v3;
  NSObject *v4;
  AVCScreenCaptureConfiguration *result;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v8 = v3;
      v9 = 2080;
      v10 = "-[AVCScreenCaptureConfiguration init]";
      v11 = 1024;
      v12 = 29;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)AVCScreenCaptureConfiguration;
  result = -[AVCScreenCaptureConfiguration init](&v6, sel_init);
  if (result)
  {
    result->_isCursorCaptured = 1;
    result->_excludedApplicationBundleIDs = 0;
    result->_displayMode = 0;
  }
  return result;
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
      v9 = "-[AVCScreenCaptureConfiguration dealloc]";
      v10 = 1024;
      v11 = 40;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCScreenCaptureConfiguration;
  -[AVCScreenCaptureConfiguration dealloc](&v5, sel_dealloc);
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned int)a3
{
  self->_height = a3;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  self->_width = a3;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(unsigned int)a3
{
  self->_frameRate = a3;
}

- (BOOL)isWindowed
{
  return self->_isWindowed;
}

- (void)setIsWindowed:(BOOL)a3
{
  self->_isWindowed = a3;
}

- (unsigned)screenCaptureDisplayID
{
  return self->_screenCaptureDisplayID;
}

- (void)setScreenCaptureDisplayID:(unsigned int)a3
{
  self->_screenCaptureDisplayID = a3;
}

- (BOOL)isCursorCaptured
{
  return self->_isCursorCaptured;
}

- (void)setIsCursorCaptured:(BOOL)a3
{
  self->_isCursorCaptured = a3;
}

- (NSArray)excludedApplicationBundleIDs
{
  return self->_excludedApplicationBundleIDs;
}

- (void)setExcludedApplicationBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)shouldRunInProcess
{
  return self->_shouldRunInProcess;
}

- (void)setShouldRunInProcess:(BOOL)a3
{
  self->_shouldRunInProcess = a3;
}

- (unsigned)selectiveSharingPort
{
  return self->_selectiveSharingPort;
}

- (void)setSelectiveSharingPort:(unsigned int)a3
{
  self->_selectiveSharingPort = a3;
}

- (NSString)selectiveScreenUUID
{
  return self->_selectiveScreenUUID;
}

- (void)setSelectiveScreenUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unsigned int)a3
{
  self->_displayMode = a3;
}

@end
