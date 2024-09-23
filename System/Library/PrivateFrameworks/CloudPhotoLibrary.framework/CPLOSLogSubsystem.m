@implementation CPLOSLogSubsystem

void ___CPLOSLogSubsystem_block_invoke()
{
  os_log_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = os_log_create("com.apple.photos.cpl", "cpl");
  v1 = (void *)_CPLGenericLog;
  _CPLGenericLog = (uint64_t)v0;

  v2 = (void *)MGCopyAnswer();
  v3 = (void *)MGCopyAnswer();
  v4 = (void *)MGCopyAnswer();
  v5 = _CPLGenericLog;
  if (os_log_type_enabled((os_log_t)_CPLGenericLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138413058;
    v7 = CFSTR("CloudPhotoLibrary-702.0.230");
    v8 = 2112;
    v9 = v2;
    v10 = 2112;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Running %@ on %@ (%@ %@)", (uint8_t *)&v6, 0x2Au);
  }

}

@end
