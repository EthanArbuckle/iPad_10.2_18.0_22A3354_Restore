@implementation FAAppleCashPresentationHandler

- (FAAppleCashPresentationHandler)initWithNavigationController:(id)a3
{
  id v5;
  FAAppleCashPresentationHandler *v6;
  FAAppleCashPresentationHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAAppleCashPresentationHandler;
  v6 = -[FAAppleCashPresentationHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_navigationController, a3);

  return v7;
}

- (void)presentPeerPaymentControllerWithAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FAAppleCashPresentationHandler *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE30A88]);
  objc_msgSend(v8, "setQualityOfService:", 33);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke;
  v11[3] = &unk_24C88C838;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "startRequestWithCompletionHandler:", v11);

}

void __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke_cold_1((uint64_t)v6, v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke_21;
    v11[3] = &unk_24C88C3C8;
    v12 = *(id *)(a1 + 32);
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v13 = v8;
    v14 = v9;
    v15 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], v11);

  }
}

void __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke_21(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("altdsid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 8), "memberForAltDSID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke_21_cold_1((uint64_t)v4, (uint64_t *)v2, v5);

  objc_msgSend(*(id *)(a1 + 48), "presentPeerPaymentControllerWithFamilyCircle:member:attributes:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)presentPeerPaymentControllerWithFamilyCircle:(id)a3 member:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v11 = (void *)getPKPeerPaymentAssociatedAccountsControllerClass_softClass;
  v30 = getPKPeerPaymentAssociatedAccountsControllerClass_softClass;
  if (!getPKPeerPaymentAssociatedAccountsControllerClass_softClass)
  {
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __getPKPeerPaymentAssociatedAccountsControllerClass_block_invoke;
    v25 = &unk_24C88B7B0;
    v26 = &v27;
    __getPKPeerPaymentAssociatedAccountsControllerClass_block_invoke((uint64_t)&v22);
    v11 = (void *)v28[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v27, 8);
  v13 = [v12 alloc];
  objc_msgSend(v8, "members");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFamilyMembers:", v14);
  -[FAAppleCashPresentationHandler setPeerPaymentController:](self, "setPeerPaymentController:", v15);

  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v16 = (void *)getPKPeerPaymentAssociatedAccountPresentationContextClass_softClass;
  v30 = getPKPeerPaymentAssociatedAccountPresentationContextClass_softClass;
  if (!getPKPeerPaymentAssociatedAccountPresentationContextClass_softClass)
  {
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __getPKPeerPaymentAssociatedAccountPresentationContextClass_block_invoke;
    v25 = &unk_24C88B7B0;
    v26 = &v27;
    __getPKPeerPaymentAssociatedAccountPresentationContextClass_block_invoke((uint64_t)&v22);
    v16 = (void *)v28[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v27, 8);
  v18 = (void *)objc_msgSend([v17 alloc], "initWithFAFamilyMember:options:", v9, v10);
  -[FAAppleCashPresentationHandler setContext:](self, "setContext:", v18);

  -[FAAppleCashPresentationHandler peerPaymentController](self, "peerPaymentController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAAppleCashPresentationHandler context](self, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAAppleCashPresentationHandler navigationController](self, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentAssociatedAccountsFlowWithPresentationContext:fromNavigationController:", v20, v21);

}

- (void)presentPaymentPassDetailViewController
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v3 = (void *)getPKPassbookSettingsDefaultBehaviorClass_softClass;
  v34 = getPKPassbookSettingsDefaultBehaviorClass_softClass;
  if (!getPKPassbookSettingsDefaultBehaviorClass_softClass)
  {
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __getPKPassbookSettingsDefaultBehaviorClass_block_invoke;
    v29 = &unk_24C88B7B0;
    v30 = &v31;
    __getPKPassbookSettingsDefaultBehaviorClass_block_invoke((uint64_t)&v26);
    v3 = (void *)v32[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v31, 8);
  v5 = objc_alloc_init(v4);
  -[FAAppleCashPresentationHandler setDefaultBehavior:](self, "setDefaultBehavior:", v5);

  objc_msgSend(MEMORY[0x24BE6EDF0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v7 = objc_claimAutoreleasedReturnValue();

  -[FAAppleCashPresentationHandler defaultBehavior](self, "defaultBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passLibraryDataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v7;
  -[FAAppleCashPresentationHandler peerPaymentPassForAccount:passLibraryDataProvider:](self, "peerPaymentPassForAccount:passLibraryDataProvider:", v7, v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v10 = (void *)getPKPaymentPassDetailViewControllerClass_softClass;
  v34 = getPKPaymentPassDetailViewControllerClass_softClass;
  if (!getPKPaymentPassDetailViewControllerClass_softClass)
  {
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __getPKPaymentPassDetailViewControllerClass_block_invoke;
    v29 = &unk_24C88B7B0;
    v30 = &v31;
    __getPKPaymentPassDetailViewControllerClass_block_invoke((uint64_t)&v26);
    v10 = (void *)v32[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v31, 8);
  v12 = [v11 alloc];
  objc_msgSend(MEMORY[0x24BE6EDB0], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAAppleCashPresentationHandler defaultBehavior](self, "defaultBehavior");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "peerPaymentDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "peerPaymentWebService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAAppleCashPresentationHandler defaultBehavior](self, "defaultBehavior");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "passLibraryDataProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAAppleCashPresentationHandler defaultBehavior](self, "defaultBehavior");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "paymentDataProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v12, "initWithPass:group:groupsController:webService:peerPaymentWebService:style:passLibraryDataProvider:paymentServiceDataProvider:", v24, 0, 0, v13, v15, 1, v17, v19);
  -[FAAppleCashPresentationHandler setPassDetailsViewController:](self, "setPassDetailsViewController:", v20);

  -[FAAppleCashPresentationHandler navigationController](self, "navigationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAAppleCashPresentationHandler passDetailsViewController](self, "passDetailsViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pushViewController:animated:", v22, 1);

}

- (id)peerPaymentPassForAccount:(id)a3 passLibraryDataProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "associatedPassUniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passWithUniqueID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PKPeerPaymentAssociatedAccountsController)peerPaymentController
{
  return self->_peerPaymentController;
}

- (void)setPeerPaymentController:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentController, a3);
}

- (PKPeerPaymentAssociatedAccountPresentationContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (PKPaymentPassDetailViewController)passDetailsViewController
{
  return self->_passDetailsViewController;
}

- (void)setPassDetailsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_passDetailsViewController, a3);
}

- (PKPassbookSettingsDefaultBehavior)defaultBehavior
{
  return self->_defaultBehavior;
}

- (void)setDefaultBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_defaultBehavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBehavior, 0);
  objc_storeStrong((id *)&self->_passDetailsViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
}

void __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[FAAppleCashPresentationHandler presentPeerPaymentControllerWithAttributes:completion:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_20DE41000, a2, OS_LOG_TYPE_ERROR, "Error %s - %@", (uint8_t *)&v2, 0x16u);
}

void __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke_21_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_20DE41000, log, OS_LOG_TYPE_DEBUG, "Launching member %@ with attributes %@", (uint8_t *)&v4, 0x16u);
}

@end
