@implementation FAMemberScreenTimeRootViewControllerProvider

+ (void)requestRootViewControllerForDSID:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v10 = (void *)getSTRootViewControllerProviderClass_softClass;
  v16 = getSTRootViewControllerProviderClass_softClass;
  if (!getSTRootViewControllerProviderClass_softClass)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __getSTRootViewControllerProviderClass_block_invoke;
    v12[3] = &unk_24C88B7B0;
    v12[4] = &v13;
    __getSTRootViewControllerProviderClass_block_invoke((uint64_t)v12);
    v10 = (void *)v14[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v11, "requestRootViewControllerForDSID:presentingViewController:completionHandler:", v7, v8, v9);

}

@end
