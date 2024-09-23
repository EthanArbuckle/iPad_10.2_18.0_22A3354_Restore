@implementation CKWorkoutUtilities

+ (void)_launchWorkoutPreviewWithWorkoutData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v4 = (void *)getWorkoutKitXPCServiceHelperClass_softClass;
  v11 = getWorkoutKitXPCServiceHelperClass_softClass;
  if (!getWorkoutKitXPCServiceHelperClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getWorkoutKitXPCServiceHelperClass_block_invoke;
    v7[3] = &unk_1E274A178;
    v7[4] = &v8;
    __getWorkoutKitXPCServiceHelperClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v5, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentWorkoutCompositionData:completion:", v3, &__block_literal_global_30);

}

void __59__CKWorkoutUtilities__launchWorkoutPreviewWithWorkoutData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  if (_IMWillLog())
    _IMAlwaysLog();

}

+ (BOOL)_presentWorkoutRemoteViewServiceOnHostViewController:(id)a3 withWorkoutData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v7 = (void *)getWKUIRemoteViewServiceAdaptorClass_softClass;
  v21 = getWKUIRemoteViewServiceAdaptorClass_softClass;
  v8 = MEMORY[0x1E0C809B0];
  if (!getWKUIRemoteViewServiceAdaptorClass_softClass)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getWKUIRemoteViewServiceAdaptorClass_block_invoke;
    v17[3] = &unk_1E274A178;
    v17[4] = &v18;
    __getWKUIRemoteViewServiceAdaptorClass_block_invoke((uint64_t)v17);
    v7 = (void *)v19[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v18, 8);
  v10 = objc_alloc_init(v9);
  if (_IMWillLog())
    _IMAlwaysLog();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __91__CKWorkoutUtilities__presentWorkoutRemoteViewServiceOnHostViewController_withWorkoutData___block_invoke;
  v14[3] = &unk_1E274A108;
  v15 = v10;
  v16 = v5;
  v11 = v5;
  v12 = v10;
  objc_msgSend(v12, "presentRemoteViewControllerOnHostController:workoutPlanData:dismissHandler:completionHandler:", v11, v6, v14, &__block_literal_global_29);

  return 1;
}

uint64_t __91__CKWorkoutUtilities__presentWorkoutRemoteViewServiceOnHostViewController_withWorkoutData___block_invoke(uint64_t a1)
{
  if (_IMWillLog())
    _IMAlwaysLog();
  return objc_msgSend(*(id *)(a1 + 32), "dismissRemoteViewControllerOnHostController:", *(_QWORD *)(a1 + 40));
}

void __91__CKWorkoutUtilities__presentWorkoutRemoteViewServiceOnHostViewController_withWorkoutData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  if (_IMWillLog())
    _IMAlwaysLog();

}

@end
