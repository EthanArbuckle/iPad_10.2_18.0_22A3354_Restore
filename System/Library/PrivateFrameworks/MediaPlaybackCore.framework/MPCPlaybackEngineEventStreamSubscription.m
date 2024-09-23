@implementation MPCPlaybackEngineEventStreamSubscription

uint64_t __71___MPCPlaybackEngineEventStreamSubscription_flushEventsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_flush");
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "engineID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138543874;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@:%{public}@:%p] flushEventsWithCompletion:… | flushed events", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __54___MPCPlaybackEngineEventStreamSubscription_processID__block_invoke()
{
  const __CFString *v0;
  _BOOL4 v1;
  void *v2;

  if (+[MPCPlaybackEngine isSystemMusic](MPCPlaybackEngine, "isSystemMusic"))
  {
    v0 = CFSTR("mus");
  }
  else if (+[MPCPlaybackEngine isSystemPodcasts](MPCPlaybackEngine, "isSystemPodcasts"))
  {
    v0 = CFSTR("pod");
  }
  else
  {
    v1 = +[MPCPlaybackEngine isRemotePlayerService](MPCPlaybackEngine, "isRemotePlayerService");
    v0 = CFSTR("oth");
    if (v1)
      v0 = CFSTR("rps");
  }
  v2 = (void *)processID_processID;
  processID_processID = (uint64_t)v0;

}

@end
