@implementation CNContactPickerHostViewController

+ (id)contactPickerExtension
{
  if (contactPickerExtension_onceToken != -1)
    dispatch_once(&contactPickerExtension_onceToken, &__block_literal_global_40738);
  return (id)contactPickerExtension_extension;
}

+ (id)contextForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "contactPickerExtension");
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
  objc_msgSend(a1, "contactPickerExtension");
  v5 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v5;
  if (v5)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 90, 7, CFSTR("Instantiate view controller from extension %@"), v6, v7, v8, v9, v5);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__CNContactPickerHostViewController_getViewController___block_invoke;
    v12[3] = &unk_1E204D028;
    v14 = v4;
    v13 = v10;
    v15 = a1;
    objc_msgSend(v13, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:", MEMORY[0x1E0C9AA60], 0, v12);

  }
  return v10 != 0;
}

void __55__CNContactPickerHostViewController_getViewController___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  CNContactPickerServiceErrorViewController *v19;
  void *v20;
  CNContactPickerServiceErrorViewController *v21;
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
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 94, 3, CFSTR("View Service Error, %@"), v15, v16, v17, v18, (uint64_t)v14);

    v19 = [CNContactPickerServiceErrorViewController alloc];
    objc_msgSend(v13, "localizedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[CNErrorViewController initWithMessage:](v19, "initWithMessage:", v20);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 99, 7, CFSTR("Got view controller %@ identifier %@"), v9, v10, v11, v12, (uint64_t)v7);
    v22 = *(_QWORD *)(a1 + 32);
    v23 = v7;
    objc_msgSend(v23, "setExtension:", v22);
    objc_msgSend(v23, "setCurrentRequestIdentifier:", v24);
    objc_msgSend((id)objc_opt_class(), "contextForIdentifier:", v24);
    v21 = (CNContactPickerServiceErrorViewController *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerServiceErrorViewController setViewController:](v21, "setViewController:", v23);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __59__CNContactPickerHostViewController_contactPickerExtension__block_invoke()
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
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.ContactsUI.ContactsViewService"), &v7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v7;
  v2 = (void *)contactPickerExtension_extension;
  contactPickerExtension_extension = v0;

  if (v1)
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 69, 3, CFSTR("Could not get Contacts extension: %@"), v3, v4, v5, v6, (uint64_t)v1);
  else
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 71, 7, CFSTR("Got extension %@"), v3, v4, v5, v6, contactPickerExtension_extension);

}

- (UINavigationController)navigationController
{
  return 0;
}

- (UIBarButtonItem)addContactBarButtonItem
{
  return 0;
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[CNContactPickerHostViewController currentRequestIdentifier](self, "currentRequestIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextForIdentifier:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setupWithOptions:readyBlock:", v7, v6);
}

- (void)invalidateSelectionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_opt_class();
  -[CNContactPickerHostViewController currentRequestIdentifier](self, "currentRequestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextForIdentifier:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "invalidateSelectionAnimated:", v3);
}

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

  -[CNContactPickerHostViewController extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerHostViewController currentRequestIdentifier](self, "currentRequestIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 133, 7, CFSTR("Invalidate extension %@ identifier %@"), v4, v5, v6, v7, (uint64_t)v3);

  -[CNContactPickerHostViewController extension](self, "extension");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerHostViewController currentRequestIdentifier](self, "currentRequestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelExtensionRequestWithIdentifier:", v8);

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 141, 7, CFSTR("view service did terminate with error: %@"), v3, v4, v5, v6, (uint64_t)a3);
  -[CNContactPickerHostViewController pickerDidCancel](self, "pickerDidCancel");
}

- (void)pickerDidSelectAddNewContact
{
  id v2;

  -[CNContactPickerHostViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickerDidSelectAddNewContact");

}

- (void)pickerDidSelectContact:(id)a3 property:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNContactPickerHostViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pickerDidSelectContact:property:", v7, v6);

}

- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNContactPickerHostViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pickerDidSelectContacts:properties:", v7, v6);

}

- (void)pickerDidCompleteWithNewContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactPickerHostViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pickerDidCompleteWithNewContact:", v4);

}

- (void)pickerDidCancel
{
  id v2;

  -[CNContactPickerHostViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickerDidCancel");

}

- (CNContactPickerContentDelegate)delegate
{
  return (CNContactPickerContentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end
