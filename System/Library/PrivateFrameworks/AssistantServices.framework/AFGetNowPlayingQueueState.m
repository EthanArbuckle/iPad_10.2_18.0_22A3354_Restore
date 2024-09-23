@implementation AFGetNowPlayingQueueState

void __AFGetNowPlayingQueueState_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "AFGetNowPlayingQueueState_block_invoke";
    v8 = 2048;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s group=%p ApplicationDisplayID %@", (uint8_t *)&v6, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 40), "setApplicationIdentifier:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __AFGetNowPlayingQueueState_block_invoke_81(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_af_validateAndFinalize");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
