@implementation CNContactViewHostViewController

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[CNContactViewHostViewController extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewHostViewController currentRequestIdentifier](self, "currentRequestIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewHostViewController.m", 109, 7, CFSTR("Invalidate extension %@ identifier %@"), v4, v5, v6, v7, (uint64_t)v3);

  -[CNContactViewHostViewController extension](self, "extension");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactViewHostViewController currentRequestIdentifier](self, "currentRequestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelExtensionRequestWithIdentifier:", v8);

}

- (id)protocolContext
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[CNContactViewHostViewController currentRequestIdentifier](self, "currentRequestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewHostViewController.m", 122, 7, CFSTR("view service did terminate with error: %@"), v3, v4, v5, v6, (uint64_t)a3);
  -[CNContactViewHostViewController viewServiceDidTerminate](self, "viewServiceDidTerminate");
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNContactViewHostViewController protocolContext](self, "protocolContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setupWithOptions:readyBlock:", v7, v6);

}

- (void)didChangeToEditMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactViewHostViewController protocolContext](self, "protocolContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didChangeToEditMode:", v3);

}

- (void)didChangeToShowTitle:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactViewHostViewController protocolContext](self, "protocolContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didChangeToShowTitle:", v3);

}

- (void)editCancel
{
  id v2;

  -[CNContactViewHostViewController protocolContext](self, "protocolContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editCancel");

}

- (void)toggleEditing
{
  id v2;

  -[CNContactViewHostViewController protocolContext](self, "protocolContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleEditing");

}

- (void)performConfirmedCancel
{
  id v2;

  -[CNContactViewHostViewController protocolContext](self, "protocolContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performConfirmedCancel");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactViewHostViewController;
  -[_UIRemoteViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactViewHostViewController;
  -[_UIRemoteViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CNContactViewHostViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", v10, v9, v8);

  return v12;
}

- (void)updateEditing:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[CNContactViewHostViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateEditing:doneButtonEnabled:doneButtonText:", v6, v5, v8);

}

- (void)didCompleteWithContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactViewHostViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didCompleteWithContact:", v4);

}

- (void)didDeleteContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactViewHostViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didDeleteContact:", v4);

}

- (void)isPresentingFullscreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactViewHostViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isPresentingFullscreen:", v3);

}

- (void)isPresentingEditingController:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactViewHostViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isPresentingEditingController:", v3);

}

- (void)didChangePreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[CNContactViewHostViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didChangePreferredContentSize:", width, height);

}

- (void)viewDidAppear
{
  id v3;

  -[CNContactViewHostViewController pptDelegate](self, "pptDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewDidAppearForContactViewController:", self);

}

- (void)didExecuteClearRecentsDataAction
{
  id v2;

  -[CNContactViewHostViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didExecuteClearRecentsDataAction");

}

- (void)didExecuteDeleteFromDowntimeWhitelistAction
{
  id v2;

  -[CNContactViewHostViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didExecuteClearRecentsDataAction");

}

- (void)presentCancelConfirmationAlert
{
  id v2;

  -[CNContactViewHostViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentCancelConfirmationAlert");

}

- (void)viewServiceDidTerminate
{
  void *v3;
  char v4;
  id v5;

  -[CNContactViewHostViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactViewHostViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewServiceDidTerminate");

  }
}

- (CNContactViewHostProtocol)delegate
{
  return (CNContactViewHostProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactViewControllerPPTDelegate)pptDelegate
{
  return (CNContactViewControllerPPTDelegate *)objc_loadWeakRetained((id *)&self->_pptDelegate);
}

- (void)setPptDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pptDelegate, a3);
}

- (NSCopying)currentRequestIdentifier
{
  return self->_currentRequestIdentifier;
}

- (void)setCurrentRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequestIdentifier, a3);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_currentRequestIdentifier, 0);
  objc_destroyWeak((id *)&self->_pptDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)contactViewExtension
{
  if (contactViewExtension_onceToken != -1)
    dispatch_once(&contactViewExtension_onceToken, &__block_literal_global_19735);
  return (id)contactViewExtension_extension;
}

+ (id)contextForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "contactViewExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_extensionContextForUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)getViewController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(a1, "contactViewExtension");
  v5 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v5;
  if (v5)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewHostViewController.m", 78, 7, CFSTR("Instantiate view controller from extension %@"), v6, v7, v8, v9, v5);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__CNContactViewHostViewController_getViewController___block_invoke;
    v12[3] = &unk_1E204D028;
    v14 = v4;
    v13 = v10;
    v15 = a1;
    objc_msgSend(v13, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:", MEMORY[0x1E0C9AA60], 0, v12);

  }
  return v10 != 0;
}

void __53__CNContactViewHostViewController_getViewController___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CNContactViewServiceErrorViewController *v19;
  void *v20;
  CNContactViewServiceErrorViewController *v21;
  uint64_t v22;
  id v23;
  id v24;

  v24 = a2;
  v7 = a3;
  v8 = a4;
  v13 = v8;
  if (v8)
  {
    objc_msgSend(v8, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewHostViewController.m", 82, 3, CFSTR("View Service Error, %@"), v15, v16, v17, v18, (uint64_t)v14);

    v19 = [CNContactViewServiceErrorViewController alloc];
    objc_msgSend(v13, "localizedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[CNErrorViewController initWithMessage:](v19, "initWithMessage:", v20);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewHostViewController.m", 87, 7, CFSTR("Got view controller %@ identifier %@"), v9, v10, v11, v12, (uint64_t)v7);
    v22 = *(_QWORD *)(a1 + 32);
    v23 = v7;
    objc_msgSend(v23, "setExtension:", v22);
    objc_msgSend(v23, "setCurrentRequestIdentifier:", v24);
    objc_msgSend((id)objc_opt_class(), "contextForIdentifier:", v24);
    v21 = (CNContactViewServiceErrorViewController *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewServiceErrorViewController setViewController:](v21, "setViewController:", v23);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __55__CNContactViewHostViewController_contactViewExtension__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.ContactsUI.ContactViewViewService"), &v7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v7;
  v2 = (void *)contactViewExtension_extension;
  contactViewExtension_extension = v0;

  if (v1)
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewHostViewController.m", 57, 3, CFSTR("Could not get Contacts extension: %@"), v3, v4, v5, v6, (uint64_t)v1);
  else
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewHostViewController.m", 60, 7, CFSTR("Got extension %@"), v3, v4, v5, v6, contactViewExtension_extension);

}

@end
