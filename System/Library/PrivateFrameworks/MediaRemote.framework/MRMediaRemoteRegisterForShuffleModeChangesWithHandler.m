@implementation MRMediaRemoteRegisterForShuffleModeChangesWithHandler

void __MRMediaRemoteRegisterForShuffleModeChangesWithHandler_block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint32_t v2;
  NSObject *v3;
  uint8_t v4[8];
  _QWORD handler[4];
  id v6;

  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __MRMediaRemoteRegisterForShuffleModeChangesWithHandler_block_invoke_2;
  handler[3] = &unk_1E30C5B18;
  v1 = *(NSObject **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v2 = notify_register_dispatch("com.apple.MRMediaRemote.shuffleModeDidChange", &__shuffleModeChangeHandlerToken, v1, handler);
  __shuffleModeChangeHandlerTokenIsValid = v2 == 0;
  if (!v2)
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "Registered for shuffle mode changes.", v4, 2u);
    }

  }
}

void __MRMediaRemoteRegisterForShuffleModeChangesWithHandler_block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t state64;
  uint8_t buf[16];

  _MRLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "Got shuffle mode change.", buf, 2u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    state64 = 1;
    notify_get_state(a2, &state64);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

@end
