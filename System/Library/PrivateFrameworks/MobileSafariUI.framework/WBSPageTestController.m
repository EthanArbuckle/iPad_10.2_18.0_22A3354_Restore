@implementation WBSPageTestController

void __89__WBSPageTestController_MobileSafari__pageTestControllerInitializeApp_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  TabDocumentForPageTest *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryBrowserController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closeAllOpenTabsAnimated:", 0);

  objc_msgSend(v3, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TabDocument initWithBrowserController:]([TabDocumentForPageTest alloc], "initWithBrowserController:", v3);
  objc_msgSend(v5, "activeTabDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertNewTabDocument:forcingOrderAfterTabDocument:inBackground:animated:", v6, v7, 0, 0);

  objc_setAssociatedObject(*(id *)(a1 + 32), sel_tabDocument, v6, (void *)1);
  v8 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__WBSPageTestController_MobileSafari__pageTestControllerInitializeApp_completionHandler___block_invoke_2;
  block[3] = &unk_1E9CF1950;
  v10 = *(id *)(a1 + 40);
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);

}

uint64_t __89__WBSPageTestController_MobileSafari__pageTestControllerInitializeApp_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __114__WBSPageTestController_MobileSafari__pageTestController_navigateAndCaptureFormsMetadataForURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __114__WBSPageTestController_MobileSafari__pageTestController_navigateAndCaptureFormsMetadataForURL_completionHandler___block_invoke_2;
  v5[3] = &unk_1E9CF4F78;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "tabDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMetadataHandler:", v5);

  objc_msgSend(*(id *)(a1 + 32), "tabDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "loadURL:userDriven:", *(_QWORD *)(a1 + 40), 1);

}

uint64_t __114__WBSPageTestController_MobileSafari__pageTestController_navigateAndCaptureFormsMetadataForURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__WBSPageTestController_MobileSafari__pageTestController_resizeViewport_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tabDocument");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFixedWebViewSize:completionHandler:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

}

uint64_t __70__WBSPageTestController_MobileSafari__pageTestControllerTerminateApp___block_invoke()
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "terminateWithSuccess");
}

@end
