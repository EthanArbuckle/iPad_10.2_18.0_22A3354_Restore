@implementation AudioComponentRegistrarClient

- (void)registrationsChanged:(id)a3 includesExtensions:(BOOL)a4 fsHash:(id)a5
{
  NSData *v7;
  NSData *v8;
  os_log_t v9;
  _QWORD *v10;
  NSObject *v11;
  _BYTE v12[18];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = (NSData *)a3;
  v8 = (NSData *)a5;
  if (gAudioComponentLogCategory)
  {
    v9 = *(os_log_t *)gAudioComponentLogCategory;
  }
  else
  {
    v10 = (_QWORD *)operator new();
    v10[1] = 0;
    v9 = os_log_create("com.apple.coreaudio", "audiocomp");
    *v10 = v9;
    gAudioComponentLogCategory = (uint64_t)v10;
  }
  v11 = objc_retainAutorelease(v9);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)&v12[4] = "AudioComponentPluginMgr.mm";
    *(_WORD *)&v12[12] = 1024;
    *(_DWORD *)&v12[14] = 114;
    _os_log_impl(&dword_18EE07000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d registrationsChanged", v12, 0x12u);
  }
  GlobalComponentPluginMgr((uint64_t *)v12);
  AudioComponentMgr_RegistrarService::mergeServerRegistrations(*(AudioComponentMgr_RegistrarService **)&v12[8], v7, !a4, v8, 0);
  if (*(_QWORD *)v12)
    std::recursive_mutex::unlock(*(std::recursive_mutex **)v12);

}

@end
