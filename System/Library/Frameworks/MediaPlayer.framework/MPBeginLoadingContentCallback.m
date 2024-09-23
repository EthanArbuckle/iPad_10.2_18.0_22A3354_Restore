@implementation MPBeginLoadingContentCallback

void ___MPBeginLoadingContentCallback_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[8];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (a2 != 1)
      return;
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MPBeginLoadingContentCallback(MRMediaRemoteIndexPath, void *, void (^__strong)(CFErrorRef))_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MPPlayableContentManager.m"), 598, CFSTR("-beginLoadingChildItemsAtIndexPath:completionHandler: completion handler was released without being called."));

    }
    v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "-beginLoadingChildItemsAtIndexPath:completionHandler: completion handler was released without being called", v7, 2u);
    }
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2938];
    v9[0] = CFSTR("MPPlayableContentManager.datasource did not respond to beginLoadingChildItemsAtIndexPath: before timeout.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v2 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 7, v2));
  }

}

void ___MPBeginLoadingContentCallback_block_invoke_204(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "Loading operation at completed at index path: %{public}@, error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
