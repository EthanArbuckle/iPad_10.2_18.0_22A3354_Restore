@implementation MSMessageAppContext

uint64_t __67___MSMessageAppContext__requestStickerExtensionMetadataDictionary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "requestStickerExtensionMetadataDictionary:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __71___MSMessageAppContext__requestPresentationWithStickerType_identifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "requestPresentationWithStickerType:identifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

void __77___MSMessageAppContext__becomeActiveWithConversationState_presentationState___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id obj;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPresentationStyle:", objc_msgSend(*(id *)(a1 + 40), "presentationStyle"));
    objc_msgSend(*(id *)(a1 + 32), "setPresentationContext:", objc_msgSend(*(id *)(a1 + 40), "presentationContext"));
    objc_msgSend(*(id *)(a1 + 32), "updatedConversationForConversationState:", *(_QWORD *)(a1 + 48));
    obj = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 56), "willBecomeActiveWithConversation:", obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 56), "setActiveConversation:", obj);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 56), "didBecomeActiveWithConversation:", obj);
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isPPTAvailable");

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "rangeOfString:options:", CFSTR("."), 4) + 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v6, CFSTR("ExtensionLaunch"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishedIPTest:waitForCommit:extraResults:withTeardownBlock:", v7, 1, 0, 0);

    }
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isRunningTest:", CFSTR("LiveBubbleLoadingTest"));

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finishedTest:waitForCommit:extraResults:", CFSTR("LiveBubbleLoadingTest"), 1, 0);

    }
  }
}

void __37___MSMessageAppContext__resignActive__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __37___MSMessageAppContext__resignActive__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  if (v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "willResignActiveWithConversation:", v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "setActiveConversation:", 0);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "didResignActiveWithConversation:", v10);
  }

}

void __84___MSMessageAppContext__canSendMessage_conversationState_associatedText_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __84___MSMessageAppContext__canSendMessage_conversationState_associatedText_completion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "updatedConversationForConversationState:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __84___MSMessageAppContext__canSendMessage_conversationState_associatedText_completion___block_invoke_74;
    v17 = &unk_1EA25C668;
    v19 = *(id *)(a1 + 64);
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v11, "_validateMessageForSending:conversation:associatedText:completionHandler:", v12, v10, v13, &v14);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 32), "_releaseKeepAliveContext", v14, v15, v16, v17);

}

uint64_t __84___MSMessageAppContext__canSendMessage_conversationState_associatedText_completion___block_invoke_74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), a3);
}

void __68___MSMessageAppContext__conversationDidChangeWithConversationState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __68___MSMessageAppContext__conversationDidChangeWithConversationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "updatedConversationForConversationState:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(void **)(*(_QWORD *)(a1 + 32) + 40) != v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 48), "setActiveConversation:", v10);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), v10);
  }

}

void __88___MSMessageAppContext__requestContentSizeThatFits_presentationStyle_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "CGSizeValue");
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "contentSizeThatFits:");
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

void __67___MSMessageAppContext__presentationWillChangeToPresentationState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67___MSMessageAppContext__presentationWillChangeToPresentationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "stickerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "willTransitionToPresentationStyle:", objc_msgSend(*(id *)(a1 + 40), "presentationStyle"));

}

void __66___MSMessageAppContext__presentationDidChangeToPresentationState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __66___MSMessageAppContext__presentationDidChangeToPresentationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "stickerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "setPresentationStyle:", objc_msgSend(*(id *)(a1 + 40), "presentationStyle"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "didTransitionToPresentationStyle:", objc_msgSend(*(id *)(a1 + 32), "presentationStyle"));

}

void __60___MSMessageAppContext__didUpdateMessage_conversationState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __60___MSMessageAppContext__didUpdateMessage_conversationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "updatedConversationForConversationState:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "_didUpdateMessage:conversation:", *(_QWORD *)(a1 + 48), v10);

}

void __61___MSMessageAppContext__didReceiveMessage_conversationState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61___MSMessageAppContext__didReceiveMessage_conversationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "updatedConversationForConversationState:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "didReceiveMessage:conversation:", *(_QWORD *)(a1 + 48), v10);

}

void __66___MSMessageAppContext__didStartSendingMessage_conversationState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __66___MSMessageAppContext__didStartSendingMessage_conversationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "updatedConversationForConversationState:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v10)
    {
      v12 = *(_QWORD *)(a1 + 48);
      if (v12)
        objc_msgSend(v11, "didStartSendingMessage:conversation:", v12, v10);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_releaseKeepAliveContext");

}

void __67___MSMessageAppContext__didCancelSendingMessage_conversationState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67___MSMessageAppContext__didCancelSendingMessage_conversationState___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "updatedConversationForConversationState:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v10)
    {
      v12 = *(_QWORD *)(a1 + 48);
      if (v12)
        objc_msgSend(v11, "didCancelSendingMessage:conversation:", v12, v10);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_releaseKeepAliveContext");

}

void __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(a1[4], "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (a1[5] || a1[6]))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke_90;
    block[3] = &unk_1EA25C690;
    v11 = &v21;
    v21 = v10;
    v12 = &v22;
    v22 = a1[5];
    v13 = &v23;
    v23 = a1[7];
    v14 = &v24;
    v24 = a1[6];
    v25 = a1[8];
    dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_11:
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (a1[5] || a1[6]))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke_2;
    v15[3] = &unk_1EA25C6E0;
    v11 = &v16;
    v16 = v10;
    v12 = &v17;
    v17 = a1[5];
    v13 = &v18;
    v18 = a1[6];
    v14 = &v19;
    v19 = a1[8];
    dispatch_async(MEMORY[0x1E0C80D38], v15);
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(a1[4], "_releaseKeepAliveContext");

}

uint64_t __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke_90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "willPresentEditingViewWithAssetURL:sandboxExtension:recipeData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "willPresentEditingViewWithAssetURL:recipeData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __60___MSMessageAppContext__requestSnapshotThatFits_completion___block_invoke(id *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ms_defaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v17 = "-[_MSMessageAppContext _requestSnapshotThatFits:completion:]_block_invoke";
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1DB1A9000, v3, OS_LOG_TYPE_DEFAULT, "LiveBubble. %s. view in window %@", buf, 0x16u);

  }
  objc_msgSend(v2, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __60___MSMessageAppContext__requestSnapshotThatFits_completion___block_invoke_93;
    v13 = &unk_1EA25C708;
    v14 = a1[5];
    v15 = a1[6];
    v8 = (void *)MEMORY[0x1DF0AA1E8](&v10);
    v9 = a1[5];
    if (v9)
    {
      objc_msgSend(v9, "CGSizeValue", v10, v11, v12, v13, v14);
      objc_msgSend(v2, "generateSnapshotWithContentSize:completion:", v8);
    }
    else
    {
      objc_msgSend(v2, "updateSnapshotWithCompletionBlock:", v8, v10, v11, v12, v13, v14);
    }

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __60___MSMessageAppContext__requestSnapshotThatFits_completion___block_invoke_93(uint64_t a1, void *a2)
{
  UIImage *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  UIImage *v10;
  uint64_t v11;
  CGSize v12;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ms_defaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "CGSizeValue");
    NSStringFromCGSize(v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1DB1A9000, v4, OS_LOG_TYPE_DEFAULT, "LiveBubble. Responding to snapshot request that fits %@. image: %@", (uint8_t *)&v7, 0x16u);

  }
  if (v3)
  {
    UIImagePNGRepresentation(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __73___MSMessageAppContext__handleTextInputPayload_withPayloadID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __73___MSMessageAppContext__handleTextInputPayload_withPayloadID_completion___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "_handleTextInputPayload:withPayloadID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __61___MSMessageAppContext__didRemoveAssetArchiveWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "_didRemoveAssetArchiveWithIdentifier:", *(_QWORD *)(a1 + 40));
    ms_defaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DB1A9000, v3, OS_LOG_TYPE_DEFAULT, "Called -_didRemoveAssetArchiveWithIdentifier:", v4, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_releaseKeepAliveContext");

}

void __69___MSMessageAppContext__prepareForPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __69___MSMessageAppContext__prepareForPresentationWithCompletionHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69___MSMessageAppContext__prepareForPresentationWithCompletionHandler___block_invoke_101;
    v11[3] = &unk_1EA25C730;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v10, "_prepareForPresentationWithCompletionHandler:", v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __69___MSMessageAppContext__prepareForPresentationWithCompletionHandler___block_invoke_101(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45___MSMessageAppContext__volumeButtonPressed___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  ms_traceLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __45___MSMessageAppContext__volumeButtonPressed___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "_volumeButtonPressed:", *(unsigned __int8 *)(a1 + 40));

}

void __37___MSMessageAppContext__resignActive__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __84___MSMessageAppContext__canSendMessage_conversationState_associatedText_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __68___MSMessageAppContext__conversationDidChangeWithConversationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __67___MSMessageAppContext__presentationWillChangeToPresentationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __66___MSMessageAppContext__presentationDidChangeToPresentationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __60___MSMessageAppContext__didUpdateMessage_conversationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __61___MSMessageAppContext__didReceiveMessage_conversationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __66___MSMessageAppContext__didStartSendingMessage_conversationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __67___MSMessageAppContext__didCancelSendingMessage_conversationState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __81___MSMessageAppContext__didSelectGPAsset_sandboxExtension_recipeData_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __73___MSMessageAppContext__handleTextInputPayload_withPayloadID_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __69___MSMessageAppContext__prepareForPresentationWithCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __45___MSMessageAppContext__volumeButtonPressed___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DB1A9000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
