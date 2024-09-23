@implementation MPContentItemsForIdentifiersCallback

uint64_t ___MPContentItemsForIdentifiersCallback_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v3 = a1 + 40;
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 8) + 8) + 40))
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32));
}

void ___MPContentItemsForIdentifiersCallback_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[8];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (a2 == 1)
    {
      if (dyld_program_sdk_at_least())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MPContentItemsForIdentifiersCallback(CFArrayRef, void *, void (^__strong)(CFArrayRef, CFErrorRef))_block_invoke");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("MPPlayableContentManager.m"), 744, CFSTR("-contentItemForIdentifier:completionHandler: completion handler was released without being called."));

      }
      v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "-contentItemForIdentifier:completionHandler: completion handler was released without being called", v11, 2u);
      }

    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2938];
    v13[0] = CFSTR("MPPlayableContentManager.datasource did not respond to contentItemForIdentifier: before timeout.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 7, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void ___MPContentItemsForIdentifiersCallback_block_invoke_222(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
  {
    if (v5)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
    }
    else if (v7)
    {
      v6 = objc_msgSend(objc_retainAutorelease(v7), "_mediaRemoteContentItem");
      objc_msgSend(*(id *)(a1 + 40), "lock");
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
      objc_msgSend(*(id *)(a1 + 40), "unlock");
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }

}

@end
