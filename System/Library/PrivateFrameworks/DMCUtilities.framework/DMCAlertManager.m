@implementation DMCAlertManager

+ (void)displayAlertWithTitle:(id)a3 message:(id)a4 defaultButtonText:(id)a5 altButtonText:(id)a6 destructive:(BOOL)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  syncQueue();
  v18 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __104__DMCAlertManager_displayAlertWithTitle_message_defaultButtonText_altButtonText_destructive_completion___block_invoke;
  v24[3] = &unk_1E4D36E90;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v30 = a7;
  v29 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  dispatch_async(v18, v24);

}

void __104__DMCAlertManager_displayAlertWithTitle_message_defaultButtonText_altButtonText_destructive_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setTitle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setMessage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setDefaultButtonText:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setAlternateButtonText:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "setDestructive:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v3, "setCompletionBlock:", *(_QWORD *)(a1 + 64));
  syncQueueAlertQueue();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  syncQueueShowNextAlert();
}

+ (void)promptUserToLogIntoiTunesWithTitle:(id)a3 message:(id)a4 assertion:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  syncQueue();
  v13 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke;
  v18[3] = &unk_1E4D36F30;
  v19 = v11;
  v20 = v9;
  v21 = v10;
  v22 = v12;
  v14 = v10;
  v15 = v9;
  v16 = v11;
  v17 = v12;
  dispatch_async(v13, v18);

}

void __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  syncQueueiTunesLoginCompletionBlocks();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    if (*(_QWORD *)(a1 + 56))
    {
      v5 = (void *)MEMORY[0x1A85A3C10]();
      objc_msgSend(v2, "addObject:", v5);

    }
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setTitle:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v4, "setMessage:", *(_QWORD *)(a1 + 48));
    DMCLocalizedString(CFSTR("MDM_APP_INSTALL_BUTTON_LOGIN"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDefaultButtonText:", v6);

    DMCLocalizedString(CFSTR("MDM_APP_INSTALL_BUTTON_CANCEL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlternateButtonText:", v7);

    objc_msgSend(v4, "setDisplayOnLockScreen:", 0);
    objc_msgSend(v4, "setDismissAfterTimeInterval:", 900.0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke_4;
    v9[3] = &unk_1E4D36F08;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v4, "setCompletionBlock:", v9);
    objc_msgSend(*(id *)(a1 + 32), "park");
    syncQueueAlertQueue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

    syncQueueShowNextAlert();
    goto LABEL_9;
  }
  v3 = *DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4951000, v3, OS_LOG_TYPE_DEFAULT, "An iTunes login prompt is already shown. Not showing another prompt.", buf, 2u);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v4 = (void *)MEMORY[0x1A85A3C10]();
    objc_msgSend(v2, "addObject:", v4);
LABEL_9:

  }
}

void __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke_4(uint64_t a1, int a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  int v7;

  objc_msgSend(*(id *)(a1 + 32), "unpark");
  syncQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke_2;
  v5[3] = &unk_1E4D36EE0;
  v7 = a2;
  v6 = *(id *)(a1 + 32);
  dispatch_async(v4, v5);

}

void __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  int v9;

  syncQueueiTunesLoginCompletionBlocks();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_msgSend(v2, "copy");
    objc_msgSend(v2, "removeAllObjects");
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke_3;
    block[3] = &unk_1E4D36EB8;
    v7 = v3;
    v9 = *(_DWORD *)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v5 = v3;
    dispatch_async(v4, block);

  }
}

void __83__DMCAlertManager_promptUserToLogIntoiTunesWithTitle_message_assertion_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    *(_DWORD *)buf = 67109120;
    v18 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_DEFAULT, "Calling completions for %d iTunes login events.", buf, 8u);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1A85A3A78](v6);
        (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, *(unsigned int *)(a1 + 48));
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v6;
    }
    while (v6);
  }

}

@end
