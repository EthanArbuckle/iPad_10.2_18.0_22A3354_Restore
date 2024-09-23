@implementation FPItemManager(DOCUtils)

- (void)doc_fetchRootItemForProviderDomain:()DOCUtils completionHandler:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isUsingFPFS") && objc_msgSend(v5, "isiCloudDriveProvider"))
  {
    +[DOCNodeStartupManager shared](DOCNodeStartupManager, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startIfNeeded");

    dispatch_get_global_queue(25, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __80__FPItemManager_DOCUtils__doc_fetchRootItemForProviderDomain_completionHandler___block_invoke;
    v10[3] = &unk_24C0FE318;
    v11 = v5;
    v12 = v6;
    dispatch_async(v8, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchRootItemForProviderDomain:completionHandler:", v5, v6);

  }
}

@end
