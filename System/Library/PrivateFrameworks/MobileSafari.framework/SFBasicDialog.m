@implementation SFBasicDialog

- (SFBasicDialog)init
{
  SFBasicDialog *v2;
  objc_super v4;
  objc_super v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFBasicDialog;
  v2 = -[SFBasicDialog init](&v7, sel_init);
  v6.receiver = v2;
  v6.super_class = (Class)SFBasicDialog;
  v2->_canceledOnProvisionalNavigation = -[SFDialog canceledOnProvisionalNavigation](&v6, sel_canceledOnProvisionalNavigation);
  v5.receiver = v2;
  v5.super_class = (Class)SFBasicDialog;
  v2->_canceledOnCommittedNavigation = -[SFDialog canceledOnCommittedNavigation](&v5, sel_canceledOnCommittedNavigation);
  v4.receiver = v2;
  v4.super_class = (Class)SFBasicDialog;
  v2->_canceledOnApplicationBackground = -[SFDialog canceledOnApplicationBackground](&v4, sel_canceledOnApplicationBackground);
  return v2;
}

- (id)newDialogViewRepresentation
{
  SFDialogView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(SFDialogView);
  -[SFBasicDialog title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogView setTitleText:](v3, "setTitleText:", v4);

  -[SFBasicDialog message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogView setMessageText:](v3, "setMessageText:", v5);

  -[SFBasicDialog defaultText](self, "defaultText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog textPlaceholder](self, "textPlaceholder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogView setInputText:placeholder:](v3, "setInputText:placeholder:", v6, v7);

  -[SFBasicDialog defaultPassword](self, "defaultPassword");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog passwordPlaceholder](self, "passwordPlaceholder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogView setPasswordText:placeholder:](v3, "setPasswordText:placeholder:", v8, v9);

  -[SFBasicDialog actions](self, "actions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDialogView setDialogActions:](v3, "setDialogActions:", v10);

  -[SFDialogView setUsesOpaqueAppearance:](v3, "setUsesOpaqueAppearance:", -[SFBasicDialog shouldHideWebContent](self, "shouldHideWebContent"));
  return v3;
}

- (id)newViewControllerRepresentationWithCompletionHandler:(id)a3
{
  id v4;
  _BOOL8 v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD aBlock[4];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;

  v4 = a3;
  v5 = !self->_alertControllerPresentsAsActionSheet;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3450]);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", self->_title);
  v8 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v8, v9, 0, objc_msgSend(v7, "length"));

  objc_msgSend(v6, "_setAttributedTitle:", v7);
  objc_msgSend(v6, "setTitle:", self->_title);
  objc_msgSend(v6, "setMessage:", self->_message);
  objc_msgSend(v6, "setPreferredStyle:", v5);
  objc_msgSend(v6, "setImage:", self->_icon);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3042000000;
  v30[3] = __Block_byref_object_copy__4;
  v30[4] = __Block_byref_object_dispose__4;
  v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3042000000;
  v28[3] = __Block_byref_object_copy__4;
  v28[4] = __Block_byref_object_dispose__4;
  v29 = 0;
  v10 = MEMORY[0x1E0C809B0];
  if (*(_OWORD *)&self->_defaultText != 0)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke;
    v27[3] = &unk_1E21E4F88;
    v27[4] = self;
    v27[5] = v30;
    objc_msgSend(v6, "addTextFieldWithConfigurationHandler:", v27);
  }
  if (self->_defaultPassword || self->_passwordPlaceholder)
  {
    v26[0] = v10;
    v26[1] = 3221225472;
    v26[2] = __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_2;
    v26[3] = &unk_1E21E4F88;
    v26[4] = self;
    v26[5] = v28;
    objc_msgSend(v6, "addTextFieldWithConfigurationHandler:", v26);
  }
  aBlock[0] = v10;
  aBlock[1] = 3221225472;
  aBlock[2] = __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E21E4FB0;
  v11 = v4;
  v23 = v11;
  v24 = v30;
  v25 = v28;
  v12 = _Block_copy(aBlock);
  -[SFBasicDialog actions](self, "actions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_4;
  v19[3] = &unk_1E21E5040;
  v14 = v12;
  v21 = v14;
  v15 = v6;
  v20 = v15;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);

  v16 = v20;
  v17 = v15;

  _Block_object_dispose(v28, 8);
  objc_destroyWeak(&v29);
  _Block_object_dispose(v30, 8);
  objc_destroyWeak(&v31);

  return v17;
}

void __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  obj = a2;
  objc_msgSend(obj, "setText:", v3);
  objc_msgSend(obj, "setPlaceholder:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  objc_storeWeak((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);

}

void __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  obj = a2;
  objc_msgSend(obj, "setText:", v3);
  objc_msgSend(obj, "setPlaceholder:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(obj, "setSecureTextEntry:", 1);
  objc_storeWeak((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);

}

void __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v4 = a1[4];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1[5] + 8) + 40));
  objc_msgSend(WeakRetained, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  makeBasicDialogResponse(a2, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);

}

void __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = objc_msgSend(v5, "actionType");
  if (v6 == 2)
    v7 = 2;
  else
    v7 = v6 == 1;
  v8 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v5, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_5;
  v15 = &unk_1E21E4FD8;
  v16 = *(id *)(a1 + 40);
  v17 = a3;
  objc_msgSend(v8, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v9, 0, v7, &v12, &__block_literal_global_29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addAction:", v10, v12, v13, v14, v15);
  v11 = objc_msgSend(v5, "isPreferredAction");

  if (v11)
    objc_msgSend(*(id *)(a1 + 32), "setPreferredAction:", v10);

}

uint64_t __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_6()
{
  return 0;
}

- (id)responseForSelectionIndex:(unint64_t)a3
{
  return makeBasicDialogResponse(a3, 0, 0);
}

- (void)didCompleteWithResponse:(id)a3
{
  id v4;
  void (**completionHandler)(id, uint64_t, void *, void *);
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  completionHandler = (void (**)(id, uint64_t, void *, void *))self->_completionHandler;
  v10 = v4;
  if (v4)
  {
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("selectedActionIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(v10, "safari_stringForKey:", CFSTR("text"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_stringForKey:", CFSTR("password"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    completionHandler[2](completionHandler, v7, v8, v9);

  }
  else
  {
    completionHandler[2](completionHandler, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
  }

}

- (BOOL)canceledOnProvisionalNavigation
{
  return self->_canceledOnProvisionalNavigation;
}

- (void)setCanceledOnProvisionalNavigation:(BOOL)a3
{
  self->_canceledOnProvisionalNavigation = a3;
}

- (BOOL)canceledOnCommittedNavigation
{
  return self->_canceledOnCommittedNavigation;
}

- (void)setCanceledOnCommittedNavigation:(BOOL)a3
{
  self->_canceledOnCommittedNavigation = a3;
}

- (BOOL)canceledOnApplicationBackground
{
  return self->_canceledOnApplicationBackground;
}

- (void)setCanceledOnApplicationBackground:(BOOL)a3
{
  self->_canceledOnApplicationBackground = a3;
}

- (NSArray)additionalCancellationExemptions
{
  return self->_additionalCancellationExemptions;
}

- (void)setAdditionalCancellationExemptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)completionHandlerBlocksWebProcess
{
  return self->_completionHandlerBlocksWebProcess;
}

- (void)setCompletionHandlerBlocksWebProcess:(BOOL)a3
{
  self->_completionHandlerBlocksWebProcess = a3;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)defaultText
{
  return self->_defaultText;
}

- (void)setDefaultText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)textPlaceholder
{
  return self->_textPlaceholder;
}

- (void)setTextPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)defaultPassword
{
  return self->_defaultPassword;
}

- (void)setDefaultPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)passwordPlaceholder
{
  return self->_passwordPlaceholder;
}

- (void)setPasswordPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)alertControllerPresentsAsActionSheet
{
  return self->_alertControllerPresentsAsActionSheet;
}

- (void)setAlertControllerPresentsAsActionSheet:(BOOL)a3
{
  self->_alertControllerPresentsAsActionSheet = a3;
}

- (BOOL)shouldHideWebContent
{
  return self->_shouldHideWebContent;
}

- (void)setShouldHideWebContent:(BOOL)a3
{
  self->_shouldHideWebContent = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_passwordPlaceholder, 0);
  objc_storeStrong((id *)&self->_defaultPassword, 0);
  objc_storeStrong((id *)&self->_textPlaceholder, 0);
  objc_storeStrong((id *)&self->_defaultText, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_additionalCancellationExemptions, 0);
}

@end
