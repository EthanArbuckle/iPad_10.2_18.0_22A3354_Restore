@implementation CNContactViewExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_59);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_108);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

void __64__CNContactViewExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDFC4748);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

}

void __66__CNContactViewExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE082D20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v13 = (void *)MEMORY[0x1E0C99E60];
  v15 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v12 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v12, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_setupWithOptions_readyBlock_, 0, 0);

}

- (id)host
{
  void *v4;
  void *v5;
  void *v7;

  -[CNContactViewExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_114);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactViewServiceViewController.m"), 193, CFSTR("host object is nil!"));

  }
  return v5;
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
  block[2] = __61__CNContactViewExtensionContext_setupWithOptions_readyBlock___block_invoke;
  block[3] = &unk_1E204F098;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)didChangeToEditMode:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__CNContactViewExtensionContext_didChangeToEditMode___block_invoke;
  v3[3] = &unk_1E204C4D0;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (void)didChangeToShowTitle:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__CNContactViewExtensionContext_didChangeToShowTitle___block_invoke;
  v3[3] = &unk_1E204C4D0;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (void)editCancel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CNContactViewExtensionContext_editCancel__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)toggleEditing
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CNContactViewExtensionContext_toggleEditing__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)performConfirmedCancel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CNContactViewExtensionContext_performConfirmedCancel__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)asyncShouldPerformDefaultActionResponse:(BOOL)a3
{
  void *v4;
  NSObject *v5;

  -[CNContactViewExtensionContext setAsyncShouldPerformResponse:](self, "setAsyncShouldPerformResponse:", a3);
  -[CNContactViewExtensionContext asyncShouldPerformSemaphore](self, "asyncShouldPerformSemaphore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactViewExtensionContext asyncShouldPerformSemaphore](self, "asyncShouldPerformSemaphore");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v5);

  }
}

- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_semaphore_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = dispatch_semaphore_create(0);
  -[CNContactViewExtensionContext setAsyncShouldPerformSemaphore:](self, "setAsyncShouldPerformSemaphore:", v11);

  -[CNContactViewExtensionContext setAsyncShouldPerformResponse:](self, "setAsyncShouldPerformResponse:", 1);
  -[CNContactViewExtensionContext host](self, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "asyncShouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", v10, v9, v8);

  -[CNContactViewExtensionContext asyncShouldPerformSemaphore](self, "asyncShouldPerformSemaphore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeProvider");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "timestamp");
    v17 = v16;

    -[CNContactViewExtensionContext asyncShouldPerformSemaphore](self, "asyncShouldPerformSemaphore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = CNDispatchSemaphoreWait();

    if ((v15 & 1) == 0)
    {
      CNUILogViewService();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v27) = 0;
        _os_log_fault_impl(&dword_18AC56000, v24, OS_LOG_TYPE_FAULT, "OOP [CNContactViewExtensionContext shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:] call timed out", (uint8_t *)&v27, 2u);
      }
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timestamp");
    v22 = v21;

    v23 = v22 - v17;
    if (v23 > 0.1)
    {
      CNUILogViewService();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(MEMORY[0x1E0D13BB0], "stringForTimeInterval:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v25;
        _os_log_fault_impl(&dword_18AC56000, v24, OS_LOG_TYPE_FAULT, "OOP [CNContactViewExtensionContext shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:] call took longer than desired: %@", (uint8_t *)&v27, 0xCu);

      }
LABEL_8:

    }
  }
  return -[CNContactViewExtensionContext asyncShouldPerformResponse](self, "asyncShouldPerformResponse");
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
  -[CNContactViewExtensionContext host](self, "host");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateEditing:doneButtonEnabled:doneButtonText:", v6, v5, v8);

}

- (void)didCompleteWithContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactViewExtensionContext host](self, "host");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didCompleteWithContact:", v4);

}

- (void)didDeleteContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactViewExtensionContext host](self, "host");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didDeleteContact:", v4);

}

- (void)isPresentingFullscreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactViewExtensionContext host](self, "host");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isPresentingFullscreen:", v3);

}

- (void)isPresentingEditingController:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNContactViewExtensionContext host](self, "host");
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
  -[CNContactViewExtensionContext host](self, "host");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didChangePreferredContentSize:", width, height);

}

- (void)viewDidAppear
{
  id v2;

  -[CNContactViewExtensionContext host](self, "host");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewDidAppear");

}

- (void)didExecuteClearRecentsDataAction
{
  id v2;

  -[CNContactViewExtensionContext host](self, "host");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didExecuteClearRecentsDataAction");

}

- (void)didExecuteDeleteFromDowntimeWhitelistAction
{
  id v2;

  -[CNContactViewExtensionContext host](self, "host");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didExecuteDeleteFromDowntimeWhitelistAction");

}

- (void)presentCancelConfirmationAlert
{
  id v2;

  -[CNContactViewExtensionContext host](self, "host");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentCancelConfirmationAlert");

}

- (void)asyncShouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  NSObject *v5;
  uint8_t v6[16];

  CNUILogViewService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_18AC56000, v5, OS_LOG_TYPE_ERROR, "Out of process [CNContactViewExtensionContext asyncShouldPerformDefaultActionForContact] should not be invoked.", v6, 2u);
  }

}

- (BOOL)asyncShouldPerformResponse
{
  return self->_asyncShouldPerformResponse;
}

- (void)setAsyncShouldPerformResponse:(BOOL)a3
{
  self->_asyncShouldPerformResponse = a3;
}

- (OS_dispatch_semaphore)asyncShouldPerformSemaphore
{
  return self->_asyncShouldPerformSemaphore;
}

- (void)setAsyncShouldPerformSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_asyncShouldPerformSemaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncShouldPerformSemaphore, 0);
}

void __55__CNContactViewExtensionContext_performConfirmedCancel__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactContentVC");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performConfirmedCancel");

}

void __46__CNContactViewExtensionContext_toggleEditing__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactContentVC");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "toggleEditing");

}

void __43__CNContactViewExtensionContext_editCancel__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactContentVC");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "editCancel");

}

void __54__CNContactViewExtensionContext_didChangeToShowTitle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactContentVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChangeToShowTitle:", *(unsigned __int8 *)(a1 + 40));

}

void __53__CNContactViewExtensionContext_didChangeToEditMode___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactContentVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChangeToEditMode:", *(unsigned __int8 *)(a1 + 40));

}

void __61__CNContactViewExtensionContext_setupWithOptions_readyBlock___block_invoke(uint64_t a1)
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
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "auditToken");
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }

  v14 = v16;
  v15 = v17;
  objc_msgSend(MEMORY[0x1E0D13990], "auditToken:", &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D139A0]), "initWithAuditToken:assumedIdentity:", v4, 0);
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAuthorizationContext:", v5);

  v7 = objc_alloc(MEMORY[0x1E0D13AA8]);
  objc_msgSend(MEMORY[0x1E0D13AB0], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v16;
  v15 = v17;
  v9 = (void *)objc_msgSend(v7, "initWithAuditToken:managedProfileConnection:", &v14, v8);

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contactContentVC");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setManagedConfiguration:", v9);

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contactContentVC");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setupWithOptions:readyBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __37__CNContactViewExtensionContext_host__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CNUILogViewService();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_18AC56000, v3, OS_LOG_TYPE_ERROR, "error calling host - %@", (uint8_t *)&v5, 0xCu);

  }
}

@end
