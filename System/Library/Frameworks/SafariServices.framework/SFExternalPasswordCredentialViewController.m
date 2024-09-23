@implementation SFExternalPasswordCredentialViewController

void __79___SFExternalPasswordCredentialViewController__connectToServiceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a2;
  v7 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 984), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "serviceViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setTarget:", v8);

    if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
      objc_msgSend(*(id *)(a1 + 32), "_addRemoteViewAsChild");
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __79___SFExternalPasswordCredentialViewController__connectToServiceWithCompletion___block_invoke_cold_1(v9, v7);
  }

}

void __79___SFExternalPasswordCredentialViewController__connectToServiceWithCompletion___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to get donated password view controller with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
