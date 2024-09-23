@implementation AFUIExplicitAutoFillController

- (AFUIExplicitAutoFillController)initWithDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  AFUIExplicitAutoFillController *v11;
  uint64_t v12;
  RTIDocumentTraits *documentTraits;
  uint64_t v14;
  RTIDocumentState *documentState;
  uint64_t v16;
  id textOperationsHandler;
  AFUIExplicitAutoFillController *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AFUIExplicitAutoFillController;
  v11 = -[AFUIExplicitAutoFillController init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    documentTraits = v11->_documentTraits;
    v11->_documentTraits = (RTIDocumentTraits *)v12;

    v14 = objc_msgSend(v9, "copy");
    documentState = v11->_documentState;
    v11->_documentState = (RTIDocumentState *)v14;

    v16 = MEMORY[0x23B803E10](v10);
    textOperationsHandler = v11->_textOperationsHandler;
    v11->_textOperationsHandler = (id)v16;

    v18 = v11;
  }

  return v11;
}

- (AFUIExplicitAutoFillController)initWithDocumentTraits:(id)a3 documentState:(id)a4 keyboardOutputHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  AFUIExplicitAutoFillController *v11;
  uint64_t v12;
  RTIDocumentTraits *documentTraits;
  uint64_t v14;
  RTIDocumentState *documentState;
  uint64_t v16;
  id keyboardOutputHandler;
  AFUIExplicitAutoFillController *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AFUIExplicitAutoFillController;
  v11 = -[AFUIExplicitAutoFillController init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    documentTraits = v11->_documentTraits;
    v11->_documentTraits = (RTIDocumentTraits *)v12;

    v14 = objc_msgSend(v9, "copy");
    documentState = v11->_documentState;
    v11->_documentState = (RTIDocumentState *)v14;

    v16 = MEMORY[0x23B803E10](v10);
    keyboardOutputHandler = v11->_keyboardOutputHandler;
    v11->_keyboardOutputHandler = (id)v16;

    v18 = v11;
  }

  return v11;
}

+ (BOOL)isExplicitAutoFillInvocationWithDocumentTraits:(id)a3
{
  return objc_msgSend(a3, "_isExplicitAutoFillInvocation");
}

- (void)presentFromViewController:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[RTIDocumentTraits autofillMode](self->_documentTraits, "autofillMode");
  if (v4 == 1)
  {
    -[AFUIExplicitAutoFillController _showPasswordsPanelFromViewController:](self, "_showPasswordsPanelFromViewController:", v7);
  }
  else if (v4 == 9)
  {
    -[AFUIExplicitAutoFillController _showCreditCardsPanelFromViewController:](self, "_showCreditCardsPanelFromViewController:", v7);
  }
  else
  {
    v5 = v4 == 7;
    v6 = v7;
    if (!v5)
      goto LABEL_9;
    -[AFUIExplicitAutoFillController _showContactsPanelFromViewController:](self, "_showContactsPanelFromViewController:", v7);
  }
  v6 = v7;
LABEL_9:

}

- (void)authenticationWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)authenticationDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)contactsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)contactsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)passwordsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)passwordsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)_showPasswordsPanelFromViewController:(id)a3
{
  id v4;
  AFUIPasswordsController *v5;
  AFUIPasswordsController *passwordsController;
  uint64_t v7;
  void *v8;
  AFUIExplicitAutoFillController *v9;
  AFUIExplicitAutoFillController *v10;
  AFUIExplicitAutoFillController *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  AFUIExplicitAutoFillController *v15;

  v4 = a3;
  if (!self->_passwordsController)
  {
    v5 = -[AFUIPasswordsController initWithDocumentTraits:]([AFUIPasswordsController alloc], "initWithDocumentTraits:", self->_documentTraits);
    passwordsController = self->_passwordsController;
    self->_passwordsController = v5;

    -[AFUIPasswordsController setPasswordPickerDelegate:](self->_passwordsController, "setPasswordPickerDelegate:", self);
  }
  -[AFUIExplicitAutoFillController delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (AFUIExplicitAutoFillController *)v7;
  else
    v9 = self;
  v10 = v9;

  -[AFUIExplicitAutoFillController passwordsUIWillBeginForSessionUUID:completion:](v10, "passwordsUIWillBeginForSessionUUID:completion:", 0, 0);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__AFUIExplicitAutoFillController__showPasswordsPanelFromViewController___block_invoke;
  v13[3] = &unk_250856948;
  v13[4] = self;
  v14 = v4;
  v15 = v10;
  v11 = v10;
  v12 = v4;
  -[AFUIExplicitAutoFillController authenticationWillBeginForSessionUUID:completion:](v11, "authenticationWillBeginForSessionUUID:completion:", 0, v13);

}

void __72__AFUIExplicitAutoFillController__showPasswordsPanelFromViewController___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __72__AFUIExplicitAutoFillController__showPasswordsPanelFromViewController___block_invoke_2;
  v3[3] = &unk_250856B30;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "presentPasswordPickerFromViewController:didFinishAuthenticationBlock:", v1, v3);

}

uint64_t __72__AFUIExplicitAutoFillController__showPasswordsPanelFromViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "authenticationDidEndForSessionUUID:completion:", 0, 0);
}

- (void)_showContactsPanelFromViewController:(id)a3
{
  id v4;
  AFUIContactsController *v5;
  AFUIContactsController *contactsController;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  AFUIExplicitAutoFillController *v12;

  v4 = a3;
  if (!self->_contactsController)
  {
    v5 = objc_alloc_init(AFUIContactsController);
    contactsController = self->_contactsController;
    self->_contactsController = v5;

    -[AFUIContactsController setContactPropertyPickerDelegate:](self->_contactsController, "setContactPropertyPickerDelegate:", self);
    -[AFUIContactsController setAlwaysAllowsNamePicking:](self->_contactsController, "setAlwaysAllowsNamePicking:", 1);
  }
  -[AFUIExplicitAutoFillController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AFUIExplicitAutoFillController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__AFUIExplicitAutoFillController__showContactsPanelFromViewController___block_invoke;
    v10[3] = &unk_250856DB0;
    v11 = v4;
    v12 = self;
    objc_msgSend(v8, "contactsUIWillBeginForSessionUUID:completion:", 0, v10);

  }
  else
  {
    -[AFUIContactsController allContactsViewControllerForTextContentType:](self->_contactsController, "allContactsViewControllerForTextContentType:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v9, 1, &__block_literal_global_2);

  }
}

void __71__AFUIExplicitAutoFillController__showContactsPanelFromViewController___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__AFUIExplicitAutoFillController__showContactsPanelFromViewController___block_invoke_2;
  v4[3] = &unk_250856DB0;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

void __71__AFUIExplicitAutoFillController__showContactsPanelFromViewController___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "allContactsViewControllerForTextContentType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentViewController:animated:completion:", v2, 1, &__block_literal_global_10);

}

- (void)_finishWithStringValue:(id)a3
{
  id v4;
  void (**textOperationsHandler)(id, id);
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id keyboardOutputHandler;
  id v13;

  v13 = a3;
  -[AFUIExplicitAutoFillController _yieldToClientApplicationIfNeeded](self, "_yieldToClientApplicationIfNeeded");
  if (self->_textOperationsHandler)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE7ED90]);
    objc_msgSend(v4, "_assertOrInsertText:documentTraits:", v13, self->_documentTraits);
    objc_msgSend(v4, "setIsExplicitAutoFillInvocation:", 1);
    textOperationsHandler = (void (**)(id, id))self->_textOperationsHandler;
LABEL_5:
    textOperationsHandler[2](textOperationsHandler, v4);

    goto LABEL_6;
  }
  if (self->_keyboardOutputHandler)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEB4E58]);
    objc_msgSend(v4, "setInsertionText:", v13);
    -[RTIDocumentState documentState](self->_documentState, "documentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextBeforeInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");
    -[RTIDocumentState documentState](self->_documentState, "documentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contextAfterInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeletionCount:", objc_msgSend(v10, "length") + v8);

    textOperationsHandler = (void (**)(id, id))self->_keyboardOutputHandler;
    goto LABEL_5;
  }
LABEL_6:
  v11 = self->_textOperationsHandler;
  self->_textOperationsHandler = 0;

  keyboardOutputHandler = self->_keyboardOutputHandler;
  self->_keyboardOutputHandler = 0;

}

- (void)_finishWithSelectedCredential:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  id v10;
  void (**textOperationsHandler)(id, id);
  id v12;
  id keyboardOutputHandler;
  id v14;

  v4 = a3;
  -[AFUIExplicitAutoFillController _yieldToClientApplicationIfNeeded](self, "_yieldToClientApplicationIfNeeded");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_250857310;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BEB50B8]);

  objc_msgSend(v4, "password");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = &stru_250857310;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BEB50B0]);

  if (self->_textOperationsHandler)
  {
    v10 = objc_alloc_init(MEMORY[0x24BE7ED90]);
    objc_msgSend(v10, "setIsExplicitAutoFillInvocation:", 1);
    objc_msgSend(v10, "setCustomInfo:", v14);
    textOperationsHandler = (void (**)(id, id))self->_textOperationsHandler;
LABEL_11:
    textOperationsHandler[2](textOperationsHandler, v10);

    goto LABEL_12;
  }
  if (self->_keyboardOutputHandler)
  {
    v10 = objc_alloc_init(MEMORY[0x24BEB4E58]);
    objc_msgSend(v10, "setCustomInfo:", v14);
    textOperationsHandler = (void (**)(id, id))self->_keyboardOutputHandler;
    goto LABEL_11;
  }
LABEL_12:
  v12 = self->_textOperationsHandler;
  self->_textOperationsHandler = 0;

  keyboardOutputHandler = self->_keyboardOutputHandler;
  self->_keyboardOutputHandler = 0;

}

- (BOOL)isSingleLineDocument
{
  return -[RTIDocumentTraits _afui_isSingleLineDocument](self->_documentTraits, "_afui_isSingleLineDocument");
}

- (void)userSelectedContactProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void (**textOperationsHandler)(id, id);
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id keyboardOutputHandler;
  void *v24;
  id v25;

  v25 = a3;
  -[AFUIExplicitAutoFillController _yieldToClientApplicationIfNeeded](self, "_yieldToClientApplicationIfNeeded");
  -[RTIDocumentTraits textInputTraits](self->_documentTraits, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTIDocumentTraits textInputTraits](self->_documentTraits, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE0B358];
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE0B358]) & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("didPickContactNamePropertyKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    v12 = *MEMORY[0x24BE0B330];
    objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BE0B330]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      objc_msgSend(v25, "objectForKeyedSubscript:", v12);
      v7 = v6;
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    }
  }
  if (!v6)
  {
    objc_msgSend(v25, "objectForKeyedSubscript:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BE0B330]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (self->_textOperationsHandler)
  {
    v15 = objc_alloc_init(MEMORY[0x24BE7ED90]);
    objc_msgSend(v15, "_assertOrInsertText:documentTraits:", v6, self->_documentTraits);
    objc_msgSend(v15, "setIsExplicitAutoFillInvocation:", 1);
    textOperationsHandler = (void (**)(id, id))self->_textOperationsHandler;
LABEL_14:
    textOperationsHandler[2](textOperationsHandler, v15);

    goto LABEL_15;
  }
  if (self->_keyboardOutputHandler)
  {
    v15 = objc_alloc_init(MEMORY[0x24BEB4E58]);
    objc_msgSend(v15, "setInsertionText:", v6);
    -[RTIDocumentState documentState](self->_documentState, "documentState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contextBeforeInput");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");
    -[RTIDocumentState documentState](self->_documentState, "documentState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contextAfterInput");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDeletionCount:", objc_msgSend(v21, "length") + v19);

    textOperationsHandler = (void (**)(id, id))self->_keyboardOutputHandler;
    goto LABEL_14;
  }
LABEL_15:
  v22 = self->_textOperationsHandler;
  self->_textOperationsHandler = 0;

  keyboardOutputHandler = self->_keyboardOutputHandler;
  self->_keyboardOutputHandler = 0;

  -[AFUIExplicitAutoFillController delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contactsUIDidEndForSessionUUID:completion:", 0, 0);

}

- (void)contactPickerDidCancel
{
  id v2;

  -[AFUIExplicitAutoFillController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactsUIDidEndForSessionUUID:completion:", 0, 0);

}

- (void)passwordsController:(id)a3 selectedCredential:(id)a4
{
  -[AFUIExplicitAutoFillController _finishWithSelectedCredential:](self, "_finishWithSelectedCredential:", a4);
}

- (void)passwordsController:(id)a3 fillUsername:(id)a4
{
  -[AFUIExplicitAutoFillController _finishWithStringValue:](self, "_finishWithStringValue:", a4);
}

- (void)passwordsController:(id)a3 fillPassword:(id)a4
{
  -[AFUIExplicitAutoFillController _finishWithStringValue:](self, "_finishWithStringValue:", a4);
}

- (void)passwordsController:(id)a3 fillVerificationCode:(id)a4
{
  -[AFUIExplicitAutoFillController _finishWithStringValue:](self, "_finishWithStringValue:", a4);
}

- (void)passwordsController:(id)a3 fillText:(id)a4
{
  -[AFUIExplicitAutoFillController _finishWithStringValue:](self, "_finishWithStringValue:", a4);
}

- (void)passwordsControllerDidFinish:(id)a3
{
  id v3;

  -[AFUIExplicitAutoFillController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passwordsUIDidEndForSessionUUID:completion:", 0, 0);

}

- (AFUIModalUIDelegate)delegate
{
  return (AFUIModalUIDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passwordsController, 0);
  objc_storeStrong((id *)&self->_contactsController, 0);
  objc_storeStrong(&self->_keyboardOutputHandler, 0);
  objc_storeStrong(&self->_textOperationsHandler, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
}

@end
