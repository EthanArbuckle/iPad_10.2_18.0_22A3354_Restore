@implementation CNContactViewExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[CNContactViewExtensionContext _extensionAuxiliaryVendorProtocol](CNContactViewExtensionContext, "_extensionAuxiliaryVendorProtocol");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[CNContactViewExtensionContext _extensionAuxiliaryHostProtocol](CNContactViewExtensionContext, "_extensionAuxiliaryHostProtocol");
}

- (id)protocolService
{
  void *v4;
  void *v5;
  void *v7;

  -[CNContactViewExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_139);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactViewHostViewController.m"), 252, CFSTR("service object is nil!"));

  }
  return v5;
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNContactViewExtensionHostContext protocolService](self, "protocolService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setupWithOptions:readyBlock:", v7, v6);

}

- (void)didChangeToEditMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactViewExtensionHostContext protocolService](self, "protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didChangeToEditMode:", v3);

}

- (void)editCancel
{
  id v2;

  -[CNContactViewExtensionHostContext protocolService](self, "protocolService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editCancel");

}

- (void)toggleEditing
{
  id v2;

  -[CNContactViewExtensionHostContext protocolService](self, "protocolService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleEditing");

}

- (void)performConfirmedCancel
{
  id v2;

  -[CNContactViewExtensionHostContext protocolService](self, "protocolService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performConfirmedCancel");

}

- (void)didChangeToShowTitle:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactViewExtensionHostContext protocolService](self, "protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didChangeToShowTitle:", v3);

}

- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewHostViewController.m", 294, 3, CFSTR("Out of process [CNContactViewExtensionHostContextshouldPerformDefaultActionForContact] should not be invoked."), (uint64_t)a5, v5, v6, v7, vars0);
  return 1;
}

- (void)updateEditing:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5
{
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;
  BOOL v13;

  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__CNContactViewExtensionHostContext_updateEditing_doneButtonEnabled_doneButtonText___block_invoke;
  block[3] = &unk_1E2049FD8;
  v12 = a3;
  v13 = a4;
  block[4] = self;
  v11 = v8;
  v9 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)didCompleteWithContact:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CNContactViewExtensionHostContext_didCompleteWithContact___block_invoke;
  v6[3] = &unk_1E2050400;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)didDeleteContact:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__CNContactViewExtensionHostContext_didDeleteContact___block_invoke;
  v6[3] = &unk_1E2050400;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)isPresentingFullscreen:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__CNContactViewExtensionHostContext_isPresentingFullscreen___block_invoke;
  v3[3] = &unk_1E204C4D0;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (void)isPresentingEditingController:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__CNContactViewExtensionHostContext_isPresentingEditingController___block_invoke;
  v3[3] = &unk_1E204C4D0;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (void)didChangePreferredContentSize:(CGSize)a3
{
  _QWORD block[5];
  CGSize v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CNContactViewExtensionHostContext_didChangePreferredContentSize___block_invoke;
  block[3] = &unk_1E204E668;
  block[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)viewDidAppear
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CNContactViewExtensionHostContext_viewDidAppear__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)didExecuteClearRecentsDataAction
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__CNContactViewExtensionHostContext_didExecuteClearRecentsDataAction__block_invoke;
  v4[3] = &unk_1E204F648;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)didExecuteDeleteFromDowntimeWhitelistAction
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__CNContactViewExtensionHostContext_didExecuteDeleteFromDowntimeWhitelistAction__block_invoke;
  v4[3] = &unk_1E204F648;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)presentCancelConfirmationAlert
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CNContactViewExtensionHostContext_presentCancelConfirmationAlert__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)asyncShouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __110__CNContactViewExtensionHostContext_asyncShouldPerformDefaultActionForContact_propertyKey_propertyIdentifier___block_invoke;
  v14[3] = &unk_1E204FEC0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

- (CNContactViewHostViewController)viewController
{
  return (CNContactViewHostViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
}

void __110__CNContactViewExtensionHostContext_asyncShouldPerformDefaultActionForContact_propertyKey_propertyIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asyncShouldPerformDefaultActionResponse:", v3);

}

void __67__CNContactViewExtensionHostContext_presentCancelConfirmationAlert__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentCancelConfirmationAlert");

}

void __80__CNContactViewExtensionHostContext_didExecuteDeleteFromDowntimeWhitelistAction__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didExecuteDeleteFromDowntimeWhitelistAction");

}

void __69__CNContactViewExtensionHostContext_didExecuteClearRecentsDataAction__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didExecuteClearRecentsDataAction");

}

void __50__CNContactViewExtensionHostContext_viewDidAppear__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewDidAppear");

}

void __67__CNContactViewExtensionHostContext_didChangePreferredContentSize___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChangePreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));

}

void __67__CNContactViewExtensionHostContext_isPresentingEditingController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isPresentingEditingController:", *(unsigned __int8 *)(a1 + 40));

}

void __60__CNContactViewExtensionHostContext_isPresentingFullscreen___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isPresentingFullscreen:", *(unsigned __int8 *)(a1 + 40));

}

void __54__CNContactViewExtensionHostContext_didDeleteContact___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDeleteContact:", *(_QWORD *)(a1 + 40));

}

void __60__CNContactViewExtensionHostContext_didCompleteWithContact___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didCompleteWithContact:", *(_QWORD *)(a1 + 40));

}

void __84__CNContactViewExtensionHostContext_updateEditing_doneButtonEnabled_doneButtonText___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateEditing:doneButtonEnabled:doneButtonText:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));

}

void __52__CNContactViewExtensionHostContext_protocolService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "localizedDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewHostViewController.m", 250, 3, CFSTR("error calling service - %@"), v2, v3, v4, v5, (uint64_t)v6);

}

@end
