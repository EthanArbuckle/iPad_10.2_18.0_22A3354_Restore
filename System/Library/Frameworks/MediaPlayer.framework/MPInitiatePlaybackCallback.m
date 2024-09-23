@implementation MPInitiatePlaybackCallback

void ___MPInitiatePlaybackCallback_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (a2 != 1)
      return;
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MPInitiatePlaybackCallback(MRMediaRemoteIndexPath, void *)_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MPPlayableContentManager.m"), 703, CFSTR("-playableContentManager:initiatePlaybackOfContentItemAtIndexPath:completionHandler: completion handler was released without being called."));

    }
    v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "-playableContentManager:initiatePlaybackOfContentItemAtIndexPath:completionHandler: completion handler was released without being called", v8, 2u);
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2938];
    v10[0] = CFSTR("MPPlayableContentManager.datasource did not respond to playableContentManager:initiatePlaybackOfContentItemAtIndexPath: before timeout.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 7, v5);
    v2 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_handlePlaybackInitializationCompletedWithContext:error:", *(_QWORD *)(a1 + 40), v2);
  }

}

void ___MPInitiatePlaybackCallback_block_invoke_214(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    objc_msgSend(*(id *)(a1 + 40), "_handlePlaybackInitializationCompletedWithContext:error:", *(_QWORD *)(a1 + 48), v3);

}

@end
