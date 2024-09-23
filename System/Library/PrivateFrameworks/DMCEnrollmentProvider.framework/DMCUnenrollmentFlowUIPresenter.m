@implementation DMCUnenrollmentFlowUIPresenter

- (void)requestUserConfirmationIsAppleMAID:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__DMCUnenrollmentFlowUIPresenter_requestUserConfirmationIsAppleMAID_completionHandler___block_invoke;
  block[3] = &unk_24D52EF78;
  v10 = a3;
  block[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __87__DMCUnenrollmentFlowUIPresenter_requestUserConfirmationIsAppleMAID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  DMCLocalizedString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDF67F0];
  DMCLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v2, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDF67E8];
  DMCLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __87__DMCUnenrollmentFlowUIPresenter_requestUserConfirmationIsAppleMAID_completionHandler___block_invoke_2;
  v19[3] = &unk_24D52E3C0;
  v20 = *(id *)(a1 + 40);
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDF67E8];
  DMCLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v15 = 3221225472;
  v16 = __87__DMCUnenrollmentFlowUIPresenter_requestUserConfirmationIsAppleMAID_completionHandler___block_invoke_3;
  v17 = &unk_24D52E3C0;
  v18 = *(id *)(a1 + 40);
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v9, v14, v15, v16, v17);
  objc_msgSend(v5, "addAction:", v12);
  objc_msgSend(*(id *)(a1 + 32), "baseViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentViewController:animated:completion:", v5, 1, 0);

}

uint64_t __87__DMCUnenrollmentFlowUIPresenter_requestUserConfirmationIsAppleMAID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __87__DMCUnenrollmentFlowUIPresenter_requestUserConfirmationIsAppleMAID_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)requestDevicePasscodeWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  DMCLocalizedStringByDevice();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowUIPresenterBase requestDevicePasscodeWithDescriptionText:completionHandler:](self, "requestDevicePasscodeWithDescriptionText:completionHandler:", v5, v4);

}

- (void)presentActivityPageForAppleMAID:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __66__DMCUnenrollmentFlowUIPresenter_presentActivityPageForAppleMAID___block_invoke;
  v3[3] = &unk_24D52EB40;
  v4 = a3;
  v3[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __66__DMCUnenrollmentFlowUIPresenter_presentActivityPageForAppleMAID___block_invoke(uint64_t a1)
{
  id v2;

  DMCLocalizedString();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presentActivityPageWithText:showButtomView:", v2, 0);

}

- (void)dismissUnenrollmentScene
{
  -[DMCEnrollmentFlowUIPresenterBase dismissWithCompletion:](self, "dismissWithCompletion:", 0);
}

@end
