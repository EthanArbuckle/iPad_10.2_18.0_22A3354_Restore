@implementation HKTinkerSharingHelper

- (HKTinkerSharingHelper)init
{
  HKTinkerSharingHelper *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKTinkerSharingHelper;
  v2 = -[HKTinkerSharingHelper init](&v4, sel_init);
  if (v2)
    v2->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
  return v2;
}

- (BOOL)isChinaSKUDevice
{
  if (isChinaSKUDevice_onceToken != -1)
    dispatch_once(&isChinaSKUDevice_onceToken, &__block_literal_global_64);
  return isChinaSKUDevice_deviceIsChinaRegion;
}

void __41__HKTinkerSharingHelper_isChinaSKUDevice__block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;

  v0 = (const __CFString *)MGGetStringAnswer();
  if (v0)
  {
    v1 = v0;
    isChinaSKUDevice_deviceIsChinaRegion = CFStringCompare(v0, CFSTR("CH"), 0) == kCFCompareEqualTo;
    CFRelease(v1);
  }
  else
  {
    isChinaSKUDevice_deviceIsChinaRegion = 0;
  }
}

- (BOOL)networkAccessEnabledForHealth
{
  if (_CTServerConnectionCopyCellularUsagePolicy())
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      -[HKTinkerSharingHelper networkAccessEnabledForHealth].cold.1();
  }
  return 1;
}

- (void)setNetworkAccessEnabledForHealth:(BOOL)a3
{
  const void **v3;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = (const void **)MEMORY[0x1E0CA7328];
  if (!a3)
    v3 = (const void **)MEMORY[0x1E0CA7330];
  v4 = *v3;
  v5 = *MEMORY[0x1E0CA7320];
  v14[0] = v4;
  v6 = *MEMORY[0x1E0CA7340];
  v13[0] = v5;
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = *MEMORY[0x1E0CA78A8];
  v14[1] = v7;
  v14[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = _CTServerConnectionSetCellularUsagePolicy();
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5370];
  v10 = *MEMORY[0x1E0CB5370];
  if ((_DWORD)v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HKTinkerSharingHelper setNetworkAccessEnabledForHealth:].cold.1();
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[HKTinkerSharingHelper setNetworkAccessEnabledForHealth:]";
    _os_log_impl(&dword_1D7813000, v9, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %s succeeded", (uint8_t *)&v11, 0xCu);
  }
  CFRelease(v4);
  CFRelease(v4);

}

- (void)networkAccessEnabledForHealth
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_0_11(&dword_1D7813000, v0, v1, "[sharing-setup] %s failed, error: %d domain: (%d)", v2, v3, v4);
}

- (void)setNetworkAccessEnabledForHealth:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;
  int v4;

  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_0_11(&dword_1D7813000, v0, v1, "[sharing-setup] %s failed, error: %d domain: (%d)", v2, v3, v4);
}

@end
