@implementation InitializeSystemSoundServer

void __InitializeSystemSoundServer_block_invoke()
{
  uint64_t v0;
  NSObject *v1;
  const char *v2;
  uint64_t state64;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  state64 = 1;
  if (!notify_get_state(gRingerSwitchStateChangeToken, &state64))
  {
    v0 = state64;
    gRingerSwitchState = state64 != 0;
    if (kSystemSoundServerLogSubsystem)
    {
      v1 = *(NSObject **)kSystemSoundServerLogSubsystem;
      if (!*(_QWORD *)kSystemSoundServerLogSubsystem)
        return;
    }
    else
    {
      v1 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v2 = "on";
      v5 = "SSServerImp.cpp";
      *(_DWORD *)buf = 136315650;
      if (!v0)
        v2 = "muted";
      v6 = 1024;
      v7 = 289;
      v8 = 2080;
      v9 = v2;
      _os_log_impl(&dword_1A0F4D000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Ringer switch state: %s", buf, 0x1Cu);
    }
  }
}

@end
