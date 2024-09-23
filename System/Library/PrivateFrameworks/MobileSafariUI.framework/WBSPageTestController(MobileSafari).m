@implementation WBSPageTestController(MobileSafari)

- (void)pageTestControllerInitializeApp:()MobileSafari completionHandler:
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__WBSPageTestController_MobileSafari__pageTestControllerInitializeApp_completionHandler___block_invoke;
  v7[3] = &unk_1E9CF26B8;
  v7[4] = a1;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (void)pageTestController:()MobileSafari navigateAndCaptureFormsMetadataForURL:completionHandler:
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__WBSPageTestController_MobileSafari__pageTestController_navigateAndCaptureFormsMetadataForURL_completionHandler___block_invoke;
  block[3] = &unk_1E9CF4FA0;
  v15 = v8;
  v16 = v9;
  v14 = v7;
  v10 = v8;
  v11 = v9;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)pageTestController:()MobileSafari resizeViewport:completionHandler:
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  double v18;
  double v19;

  v9 = a5;
  v10 = a6;
  if (a1 <= 0.0 || a2 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 1)
      a1 = 768.0;
    else
      a1 = 375.0;
    if (v12 == 1)
      a2 = 1024.0;
    else
      a2 = 667.0;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__WBSPageTestController_MobileSafari__pageTestController_resizeViewport_completionHandler___block_invoke;
  v15[3] = &unk_1E9CF4FC8;
  v18 = a1;
  v19 = a2;
  v16 = v9;
  v17 = v10;
  v13 = v10;
  v14 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

- (void)pageTestControllerTerminateApp:()MobileSafari
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_16);
}

@end
