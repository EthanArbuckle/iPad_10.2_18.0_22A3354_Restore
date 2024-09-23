@implementation AppStoreReviewController

uint64_t __57__AppStoreReviewController_applicationDidEnterForeground__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupSharedStoreReviewIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "applicationDidForeground");
}

- (void)_setupSharedStoreReviewIfNeeded
{
  void *v3;
  void *v4;
  AMSSharedStoreReview *v5;
  AMSSharedStoreReview *sharedStoreReview;
  id v7;

  if (!self->_sharedStoreReview)
  {
    objc_msgSend(MEMORY[0x1E0CFDC28], "bagSubProfile");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFDC28], "bagSubProfileVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", v7, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (AMSSharedStoreReview *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC28]), "initWithBag:", v4);
    sharedStoreReview = self->_sharedStoreReview;
    self->_sharedStoreReview = v5;

  }
}

- (void)applicationDidEnterForeground
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AppStoreReviewController_applicationDidEnterForeground__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_18);
  return (id)sharedController_sharedController;
}

void __44__AppStoreReviewController_sharedController__block_invoke()
{
  AppStoreReviewController *v0;
  void *v1;

  v0 = objc_alloc_init(AppStoreReviewController);
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;

}

- (AppStoreReviewController)init
{
  AppStoreReviewController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *internalQueue;
  AppStoreReviewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AppStoreReviewController;
  v2 = -[AppStoreReviewController init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.mobilesafari.AMSSharedStoreReviewQueue", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)showAppReviewPromptInSceneIfNeeded:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *internalQueue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("DebugReviewShouldAlwaysShowPromptPreferenceKey"));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CD8078], "requestReviewInScene:", v4);
  }
  else
  {
    internalQueue = self->_internalQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke;
    v8[3] = &unk_1E9CF1830;
    v8[4] = self;
    v9 = v4;
    dispatch_async(internalQueue, v8);

  }
}

void __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "_setupSharedStoreReviewIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "shouldAttemptReview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_2;
  v5[3] = &unk_1E9CF5220;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "addFinishBlock:", v5);

}

void __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "BOOLValue") & 1) == 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXAppReviewPrompt();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_2_cold_1(v7, v6);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_7;
    block[3] = &unk_1E9CF1900;
    v9 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "didAttemptPromptReview");

  }
}

uint64_t __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD8078], "requestReviewInScene:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_sharedStoreReview, 0);
}

void __63__AppStoreReviewController_showAppReviewPromptInSceneIfNeeded___block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_ERROR, "Failed to get result from AMS: %@", (uint8_t *)&v5, 0xCu);

}

@end
