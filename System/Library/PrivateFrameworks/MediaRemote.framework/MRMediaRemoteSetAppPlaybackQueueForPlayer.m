@implementation MRMediaRemoteSetAppPlaybackQueueForPlayer

uint64_t __MRMediaRemoteSetAppPlaybackQueueForPlayer_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  _MRLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to setAppPlaybackQueue with an empty queue. Did you mean to send a MRSystemAppPlaybackQueueTypeEmpty?", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 7, MEMORY[0x1E0C9AA60]);
  return result;
}

@end
