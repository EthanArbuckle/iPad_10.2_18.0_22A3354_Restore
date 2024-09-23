@implementation CNContactPickerExtensionHostContext

- (id)_derivedExtensionAuxiliaryHostProtocol
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNContactPickerExtensionHostContext;
  -[CNContactPickerExtensionHostContext _derivedExtensionAuxiliaryHostProtocol](&v10, sel__derivedExtensionAuxiliaryHostProtocol);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_pickerDidSelectContacts_properties_, 0, 0);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_pickerDidSelectContacts_properties_, 1, 0);

  return v2;
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  -[CNContactPickerExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_127);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactPickerHostViewController.m"), 205, CFSTR("service object is nil!"));

  }
  objc_msgSend(v9, "setupWithOptions:readyBlock:", v11, v7);

}

- (void)invalidateSelectionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[CNContactPickerExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_135);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactPickerHostViewController.m"), 215, CFSTR("service object is nil!"));

    v7 = 0;
  }
  objc_msgSend(v7, "invalidateSelectionAnimated:", v3);

}

- (void)pickerDidSelectAddNewContact
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CNContactPickerExtensionHostContext_pickerDidSelectAddNewContact__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)pickerDidSelectContact:(id)a3 property:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CNContactPickerExtensionHostContext_pickerDidSelectContact_property___block_invoke;
  block[3] = &unk_1E204FAA0;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CNContactPickerExtensionHostContext_pickerDidSelectContacts_properties___block_invoke;
  block[3] = &unk_1E204FAA0;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)pickerDidCompleteWithNewContact:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__CNContactPickerExtensionHostContext_pickerDidCompleteWithNewContact___block_invoke;
  v6[3] = &unk_1E2050400;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)pickerDidCancel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CNContactPickerExtensionHostContext_pickerDidCancel__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (CNContactPickerHostViewController)viewController
{
  return (CNContactPickerHostViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
}

void __54__CNContactPickerExtensionHostContext_pickerDidCancel__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pickerDidCancel");

}

void __71__CNContactPickerExtensionHostContext_pickerDidCompleteWithNewContact___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickerDidCompleteWithNewContact:", *(_QWORD *)(a1 + 40));

}

void __74__CNContactPickerExtensionHostContext_pickerDidSelectContacts_properties___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickerDidSelectContacts:properties:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __71__CNContactPickerExtensionHostContext_pickerDidSelectContact_property___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pickerDidSelectContact:property:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __67__CNContactPickerExtensionHostContext_pickerDidSelectAddNewContact__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pickerDidSelectAddNewContact");

}

void __67__CNContactPickerExtensionHostContext_invalidateSelectionAnimated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "localizedDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 213, 3, CFSTR("error calling service - %@"), v2, v3, v4, v5, (uint64_t)v6);

}

void __67__CNContactPickerExtensionHostContext_setupWithOptions_readyBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "localizedDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 203, 3, CFSTR("error calling service - %@"), v2, v3, v4, v5, (uint64_t)v6);

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[CNContactPickerExtensionContext _extensionAuxiliaryVendorProtocol](CNContactPickerExtensionContext, "_extensionAuxiliaryVendorProtocol");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[CNContactPickerExtensionContext _extensionAuxiliaryHostProtocol](CNContactPickerExtensionContext, "_extensionAuxiliaryHostProtocol");
}

@end
