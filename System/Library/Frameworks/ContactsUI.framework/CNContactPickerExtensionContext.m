@implementation CNContactPickerExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_23735 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_23735, &__block_literal_global_84);
  return (id)_extensionAuxiliaryVendorProtocol___interface_23736;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_23729 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_23729, &__block_literal_global_99);
  return (id)_extensionAuxiliaryHostProtocol___interface_23730;
}

void __66__CNContactPickerExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDFD8C18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface_23730;
  _extensionAuxiliaryHostProtocol___interface_23730 = v0;

  v2 = (void *)_extensionAuxiliaryHostProtocol___interface_23730;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_pickerDidSelectContacts_properties_, 0, 0);

  v6 = (void *)_extensionAuxiliaryHostProtocol___interface_23730;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_pickerDidSelectContacts_properties_, 1, 0);

}

void __68__CNContactPickerExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0239E8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface_23736;
  _extensionAuxiliaryVendorProtocol___interface_23736 = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface_23736;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_setupWithOptions_readyBlock_, 0, 0);

}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
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
  block[2] = __63__CNContactPickerExtensionContext_setupWithOptions_readyBlock___block_invoke;
  block[3] = &unk_1E204F098;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)invalidateSelectionAnimated:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__CNContactPickerExtensionContext_invalidateSelectionAnimated___block_invoke;
  v3[3] = &unk_1E204C4D0;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (void)pickerDidSelectAddNewContact
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNContactPickerExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_105);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactPickerServiceViewController.m"), 266, CFSTR("host object is nil!"));

    v5 = 0;
  }
  objc_msgSend(v5, "pickerDidSelectAddNewContact");

}

- (void)pickerDidSelectContact:(id)a3 property:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  -[CNContactPickerExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_113_23753);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactPickerServiceViewController.m"), 276, CFSTR("host object is nil!"));

  }
  objc_msgSend(v9, "pickerDidSelectContact:property:", v11, v7);

}

- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  -[CNContactPickerExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_114_23752);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactPickerServiceViewController.m"), 286, CFSTR("host object is nil!"));

  }
  objc_msgSend(v9, "pickerDidSelectContacts:properties:", v11, v7);

}

- (void)pickerDidCompleteWithNewContact:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CNContactPickerExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_115_23751);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactPickerServiceViewController.m"), 296, CFSTR("host object is nil!"));

  }
  objc_msgSend(v6, "pickerDidCompleteWithNewContact:", v8);

}

- (void)pickerDidCancel
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNContactPickerExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_116_23743);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactPickerServiceViewController.m"), 306, CFSTR("host object is nil!"));

    v5 = 0;
  }
  objc_msgSend(v5, "pickerDidCancel");

}

void __50__CNContactPickerExtensionContext_pickerDidCancel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "localizedDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerServiceViewController.m", 304, 3, CFSTR("error calling host - %@"), v2, v3, v4, v5, (uint64_t)v6);

}

void __67__CNContactPickerExtensionContext_pickerDidCompleteWithNewContact___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "localizedDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerServiceViewController.m", 294, 3, CFSTR("error calling host - %@"), v2, v3, v4, v5, (uint64_t)v6);

}

void __70__CNContactPickerExtensionContext_pickerDidSelectContacts_properties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "localizedDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerServiceViewController.m", 284, 3, CFSTR("error calling host - %@"), v2, v3, v4, v5, (uint64_t)v6);

}

void __67__CNContactPickerExtensionContext_pickerDidSelectContact_property___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "localizedDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerServiceViewController.m", 274, 3, CFSTR("error calling host - %@"), v2, v3, v4, v5, (uint64_t)v6);

}

void __63__CNContactPickerExtensionContext_pickerDidSelectAddNewContact__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "localizedDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerServiceViewController.m", 264, 3, CFSTR("error calling host - %@"), v2, v3, v4, v5, (uint64_t)v6);

}

void __63__CNContactPickerExtensionContext_invalidateSelectionAnimated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateSelectionAnimated:", *(unsigned __int8 *)(a1 + 40));

}

void __63__CNContactPickerExtensionContext_setupWithOptions_readyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "auditToken");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }

  v12 = v14;
  v13 = v15;
  objc_msgSend(MEMORY[0x1E0D13990], "auditToken:", &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D139A0]), "initWithAuditToken:assumedIdentity:", v4, 0);
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAuthorizationContext:", v5);

  v7 = objc_alloc(MEMORY[0x1E0D13AA8]);
  objc_msgSend(MEMORY[0x1E0D13AB0], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  v13 = v15;
  v9 = (void *)objc_msgSend(v7, "initWithAuditToken:managedProfileConnection:", &v12, v8);

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setManagedConfiguration:", v9);

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setupWithOptions:readyBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
