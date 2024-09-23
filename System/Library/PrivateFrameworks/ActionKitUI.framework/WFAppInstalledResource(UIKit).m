@implementation WFAppInstalledResource(UIKit)

- (id)recoveryCompletionHandler
{
  return objc_getAssociatedObject(a1, sel_recoveryCompletionHandler);
}

- (void)setRecoveryCompletionHandler:()UIKit
{
  id v4;

  v4 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, sel_recoveryCompletionHandler, v4, (void *)1);

}

- (void)attemptRecoveryFromError:()UIKit optionIndex:userInterface:completionHandler:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v9, "code"))
  {
    if (objc_msgSend(v9, "code") == 1)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC49B0]), "initWithAppSearchType:", 0);
      objc_msgSend(v12, "setDelegate:", a1);
      objc_msgSend(a1, "setRecoveryCompletionHandler:", v11);
      WFViewControllerFromUserInterface();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "presentViewController:animated:completion:", v12, 1, 0);

    }
    else if (v11)
    {
      (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
    }
  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __102__WFAppInstalledResource_UIKit__attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke;
    v14[3] = &unk_24E342738;
    v16 = v11;
    v15 = v10;
    objc_msgSend(a1, "fetchiTunesStoreObjectForAppWithCompletionBlock:", v14);

  }
}

- (uint64_t)appSearchViewControllerDidCancel:()UIKit
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__WFAppInstalledResource_UIKit__appSearchViewControllerDidCancel___block_invoke;
  v4[3] = &unk_24E343958;
  v4[4] = a1;
  return objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v4);
}

- (void)appSearchViewController:()UIKit didFinishWithApp:
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v6 = a3;
  objc_msgSend(a4, "correspondingApplicationRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9BD0]), "initWithApplicationRecord:", v7);
  objc_msgSend(a1, "updateDescriptorsWithSelectedApp:", v8);
  objc_msgSend(a1, "notifyDelegateWithUpdatedDescriptor:", v8);
  objc_msgSend(a1, "refreshAvailabilityWithNotification");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__WFAppInstalledResource_UIKit__appSearchViewController_didFinishWithApp___block_invoke;
  v9[3] = &unk_24E343958;
  v9[4] = a1;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v9);

}

@end
