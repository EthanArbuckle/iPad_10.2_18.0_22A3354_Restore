@implementation SFActivityViewController

void __94___SFActivityViewController_initWithActivityItems_applicationActivities_sharingURL_sourceURL___block_invoke(uint64_t a1, void *a2, unsigned int a3, void *a4, uint64_t a5)
{
  id *v8;
  id v9;
  id v10;
  id WeakRetained;
  uint64_t v12;
  id v13;

  v8 = (id *)(a1 + 32);
  v9 = a4;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  v13 = WeakRetained;
  if (a5)
    v12 = 0;
  else
    v12 = a3;
  objc_msgSend(WeakRetained, "activityDidComplete:withReturnedItems:success:", v10, v9, v12);

}

void __45___SFActivityViewController__executeActivity__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 1400);
    v5 = v3;
    objc_msgSend(v4, "printInteractionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrintInteractionController:", v6);

    v7.receiver = *(id *)(a1 + 40);
    v7.super_class = (Class)_SFActivityViewController;
    objc_msgSendSuper2(&v7, sel__executeActivity);

  }
  else
  {
    objc_msgSend(v3, "activityDidFinish:", 0);
  }
}

uint64_t __54___SFActivityViewController__preparePrint_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64___SFActivityViewController__extensionItemForExtensionActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  id WeakRetained;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v6 = a2;
  objc_msgSend(a4, "valueForKey:", CFSTR("extraArguments"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_plugIn");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entitlements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "safari_BOOLForKey:", CFSTR("com.apple.private.Safari.can-pass-extension-parameters"));

    v11 = WBS_LOG_CHANNEL_PREFIXExtensions();
    v12 = v11;
    if ((v10 & 1) != 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3B2D000, v12, OS_LOG_TYPE_DEFAULT, "Adding extraArguments to NSExtensionItem", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __64___SFActivityViewController__extensionItemForExtensionActivity___block_invoke_cold_1((void **)(a1 + 32), v12);

      v7 = 0;
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1352));
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64___SFActivityViewController__extensionItemForExtensionActivity___block_invoke_63;
  v16[3] = &unk_1E4AC18C8;
  v17 = v6;
  v15 = v6;
  objc_msgSend(WeakRetained, "runJavaScriptForSharingExtension:extraArguments:completion:", v14, v7, v16);

}

void __64___SFActivityViewController__extensionItemForExtensionActivity___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8 = *MEMORY[0x1E0CB2A20];
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __82___SFActivityViewController__processJavaScriptFinalizeReturnedItems_forExtension___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v13 = v5;
  v7 = v6;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = v13;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v9, "safari_dictionaryForKey:", *MEMORY[0x1E0CB2A18]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1352));
  v11 = WeakRetained;
  if (v8)
    v12 = v8;
  else
    v12 = (void *)MEMORY[0x1E0C9AA70];
  objc_msgSend(WeakRetained, "finalizeJavaScriptForSharingExtension:arguments:", *(_QWORD *)(a1 + 40), v12);

}

void __64___SFActivityViewController__extensionItemForExtensionActivity___block_invoke_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Not allowing extraArguments to be passed to JavaScript of extension '%{public}@' due to missing entitlement", (uint8_t *)&v5, 0xCu);

}

@end
