@implementation AVCBasebandAudioTapRegistrationResult

- (AVCBasebandAudioTapRegistrationResult)init
{
  AVCBasebandAudioTapRegistrationResult *v2;
  AVCBasebandAudioTapRegistrationResult *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)AVCBasebandAudioTapRegistrationResult;
  v2 = -[AVCBasebandAudioTapRegistrationResult init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_tapToken = 0;
    v2->_uplinkToken = 0;
    v2->_downlinkToken = 0;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCBasebandAudioTapRegistrationResult init].cold.1();
  }
  return v3;
}

- (id)description
{
  void *v3;
  id v4;
  const char *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)AVCBasebandAudioTapRegistrationResult;
  v4 = -[AVCBasebandAudioTapRegistrationResult description](&v7, sel_description);
  if (self->_didSucceed)
    v5 = "YES";
  else
    v5 = "NO";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{ %@ success=%s tapToken=%ld uplinkToken=%ld downlinkToken=%ld }"), v4, v5, self->_tapToken, self->_uplinkToken, self->_downlinkToken);
}

- (int64_t)tapToken
{
  return self->_tapToken;
}

- (void)setTapToken:(int64_t)a3
{
  self->_tapToken = a3;
}

- (int64_t)uplinkToken
{
  return self->_uplinkToken;
}

- (void)setUplinkToken:(int64_t)a3
{
  self->_uplinkToken = a3;
}

- (int64_t)downlinkToken
{
  return self->_downlinkToken;
}

- (void)setDownlinkToken:(int64_t)a3
{
  self->_downlinkToken = a3;
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (void)init
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to super init instance", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
