@implementation MFMailCompositionContext

void __32___MFMailCompositionContext_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.messageui", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;

}

id __89___MFMailCompositionContext_initWithURL_composeType_originalMessage_legacyMessage_isEML___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "stringValue");
  else
    objc_msgSend(v2, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __89___MFMailCompositionContext_initWithURL_composeType_originalMessage_legacyMessage_isEML___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "stringValue");
  else
    objc_msgSend(v2, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __89___MFMailCompositionContext_initWithURL_composeType_originalMessage_legacyMessage_isEML___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "stringValue");
  else
    objc_msgSend(v2, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = v6;
    if (!v6)
    {
      objc_msgSend(v3, "mailboxObjectIDs");
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "legacyMailboxForObjectID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFComposeMailMessage legacyMessageWithMessage:mailboxUid:](MFComposeMailMessage, "legacyMessageWithMessage:mailboxUid:", v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (!v9)
        goto LABEL_11;
    }
    else
    {

      if (!v9)
      {
LABEL_11:
        *((_BYTE *)WeakRetained + 80) = 0;
        objc_storeStrong((id *)WeakRetained + 1, v9);
        objc_msgSend(WeakRetained, "setOriginalMessage:", v3);
        v16 = objc_loadWeakRetained((id *)WeakRetained + 16);
        objc_msgSend(v16, "mailCompositionContext:didFinishLoadingMessage:legacyMessage:error:", WeakRetained, v3, v9, 0);

        goto LABEL_12;
      }
    }
    MFComposeLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke_cold_1(v10, v11, v12);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D5F0]), "initWithMessage:", v9);
    v14 = (void *)*((_QWORD *)WeakRetained + 7);
    objc_msgSend(v9, "messageURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addProvider:forBaseURL:", v13, v15);

    goto LABEL_11;
  }
LABEL_12:

}

void __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  id v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MFComposeLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "ef_publicDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke_75_cold_1(v5, (uint64_t)v8, v4);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *((_BYTE *)WeakRetained + 80) = 0;
  v7 = objc_loadWeakRetained((id *)WeakRetained + 16);
  objc_msgSend(v7, "mailCompositionContext:didFinishLoadingMessage:legacyMessage:error:", WeakRetained, 0, 0, v3);

}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id *v18;
  uint64_t v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  _BYTE buf[12];
  __int16 v30;
  _QWORD *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    MFComposeLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v6;
      v30 = 2048;
      v31 = WeakRetained;
      _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_INFO, "Autosave success for %{public}@, self = %p", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D4D588], "messageWithRFC822Data:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D5F0]), "initWithMessageData:parentPart:", v3, 0);
      v9 = (void *)WeakRetained[7];
      -[NSObject messageURL](v7, "messageURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addProvider:forBaseURL:", v8, v10);

    }
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, WeakRetained);
    v11 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v13 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_81;
      v26[3] = &unk_1E5A68E98;
      v14 = &v28;
      objc_copyWeak(&v28, (id *)buf);
      v15 = v7;
      v27 = v15;
      objc_msgSend(v11, "onScheduler:addSuccessBlock:", v12, v26);

      v16 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2;
      v23[3] = &unk_1E5A68EC0;
      objc_copyWeak(&v25, (id *)buf);
      v24 = v15;
      objc_msgSend(v16, "onScheduler:addFailureBlock:", v17, v23);

      objc_destroyWeak(&v25);
      v18 = (id *)&v27;
    }
    else
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_82;
      v20[3] = &unk_1E5A68EE8;
      v14 = &v22;
      objc_copyWeak(&v22, (id *)buf);
      v21 = v7;
      objc_msgSend(v12, "performBlock:", v20);

      v18 = (id *)&v21;
    }

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    MFComposeLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_INFO, "Autosave success abandoned for %{public}@", buf, 0xCu);
    }
  }

}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_81(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D1ED88] + 16))())
      objc_storeStrong(WeakRetained + 14, a2);
    objc_msgSend(WeakRetained, "_notifyDidFinishLoadingWithLegacyMessage:", *(_QWORD *)(a1 + 32));
  }

}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    MFComposeLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2_cold_1((uint64_t)v3, v5, v6);

    objc_msgSend(WeakRetained, "_notifyDidFinishLoadingWithLegacyMessage:", *(_QWORD *)(a1 + 32));
  }

}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_82(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_notifyDidFinishLoadingWithLegacyMessage:", *(_QWORD *)(a1 + 32));

}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2_84(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    MFComposeLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v7;
      v10 = 2048;
      v11 = WeakRetained;
      v12 = 2114;
      v13 = v3;
      _os_log_error_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_ERROR, "Autosave failure for %{public}@, self = %p, error = %{public}@", (uint8_t *)&v8, 0x20u);
    }

    *((_BYTE *)WeakRetained + 80) = 0;
    v6 = objc_loadWeakRetained(WeakRetained + 16);
    -[NSObject mailCompositionContext:didFinishLoadingMessage:legacyMessage:error:](v6, "mailCompositionContext:didFinishLoadingMessage:legacyMessage:error:", WeakRetained, 0, 0, v3);
  }
  else
  {
    MFComposeLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2_84_cold_1(a1, (uint64_t)v3, v6);
  }

}

void __77___MFMailCompositionContext_collection_replacedExistingItemID_withNewItemID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77___MFMailCompositionContext_collection_replacedExistingItemID_withNewItemID___block_invoke_2;
  v6[3] = &unk_1E5A65430;
  v6[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "performBlock:", v6);

}

void __77___MFMailCompositionContext_collection_replacedExistingItemID_withNewItemID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setOriginalMessage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "originalMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailCompositionContext:messageDidChange:", v2, v3);

}

void __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_3_3(&dword_1AB96A000, a1, a3, "Legacy message is nil after loading message from ID", v3);
}

void __104___MFMailCompositionContext__loadMessageWithObjectID_mailboxObjectID_messageRepository_mailboxProvider___block_invoke_75_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, a3, (uint64_t)a3, "Failed to get message for object id. Error: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, a2, a3, "Failed to load original message: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

void __106___MFMailCompositionContext__loadMessageWithAutosaveIdentifier_messageRepository_originalMessageObjectID___block_invoke_2_84_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "Autosave failure abandoned %{public}@, error = %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

@end
