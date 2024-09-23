@implementation CKCommSafetyAuthenticationController

+ (void)presentAuthenticationUI:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  objc_class *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v8 = (void *)getSTManagementStateClass_softClass;
  v16 = getSTManagementStateClass_softClass;
  if (!getSTManagementStateClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getSTManagementStateClass_block_invoke;
    v12[3] = &unk_1E274A178;
    v12[4] = &v13;
    __getSTManagementStateClass_block_invoke((uint64_t)v12);
    v8 = (void *)v14[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v13, 8);
  v10 = objc_alloc_init(v9);
  if ((objc_msgSend(v10, "isRestrictionsPasscodeSet") & 1) != 0)
  {
    objc_msgSend(a1, "_presentAuthenticationUI:completion:", v6, v7);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12[0]) = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "ScreenTime authentication password is not set", (uint8_t *)v12, 2u);
      }

    }
    v7[2](v7, 1);
  }

}

+ (void)_presentAuthenticationUI:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v7 = (void *)getSTCommunicationClientClass_softClass;
  v18 = getSTCommunicationClientClass_softClass;
  v8 = MEMORY[0x1E0C809B0];
  if (!getSTCommunicationClientClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getSTCommunicationClientClass_block_invoke;
    v14[3] = &unk_1E274A178;
    v14[4] = &v15;
    __getSTCommunicationClientClass_block_invoke((uint64_t)v14);
    v7 = (void *)v16[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v15, 8);
  v10 = objc_alloc_init(v9);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __76__CKCommSafetyAuthenticationController__presentAuthenticationUI_completion___block_invoke;
  v12[3] = &unk_1E275A898;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "authenticateForCommunicationConfigurationOverrideWithCompletionHandler:", v12);

}

void __76__CKCommSafetyAuthenticationController__presentAuthenticationUI_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = 67109120;
        LODWORD(v10) = objc_msgSend(v5, "authenticated");
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "ScreenTime authentication correct: %d", (uint8_t *)&v9, 8u);
      }

    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v5, "authenticated"));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (v6 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "ScreenTime authentication error: %@", (uint8_t *)&v9, 0xCu);
      }

    }
  }

}

@end
