@implementation SFDialog

- (BOOL)canceledOnProvisionalNavigation
{
  return 1;
}

- (BOOL)canceledOnCommittedNavigation
{
  return 1;
}

- (BOOL)completionHandlerBlocksWebProcess
{
  return 0;
}

- (void)completeWithResponse:(id)a3
{
  NSObject *v3;

  if (self->_completed)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXTabDialogs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SFDialog completeWithResponse:].cold.1(v3);
  }
  else
  {
    self->_completed = 1;
    -[SFDialog didCompleteWithResponse:](self, "didCompleteWithResponse:", a3);
  }
}

- (NSArray)additionalCancellationExemptions
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)canceledOnApplicationBackground
{
  return 0;
}

- (int64_t)presentationStyle
{
  return 0;
}

- (id)newDialogViewRepresentation
{
  return 0;
}

- (id)newViewControllerRepresentationWithCompletionHandler:(id)a3
{
  return 0;
}

- (id)responseForSelectionIndex:(unint64_t)a3
{
  return 0;
}

+ (id)authenticationDialogWithAuthenticationChallenge:(id)a3 committedURL:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  SFBasicDialog *v12;
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
  void *v26;
  uint64_t v27;
  id v28;
  _QWORD v30[4];
  id v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "failureResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(SFBasicDialog);
  v13 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safari_userVisibleHost");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setTitle:](v12, "setTitle:", v16);

  objc_msgSend(v9, "protectionSpace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "protocol");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB3320]);
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setMessage:](v12, "setMessage:", v19);

  _WBSLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setTextPlaceholder:](v12, "setTextPlaceholder:", v20);

  _WBSLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setPasswordPlaceholder:](v12, "setPasswordPlaceholder:", v21);

  _WBSLocalizedString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v22, 2, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v23;
  _WBSLocalizedString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v24, 1, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setActions:](v12, "setActions:", v26);

  if (v7)
    v27 = objc_msgSend(v7, "safari_hasSameOriginAsURL:", v11) ^ 1;
  else
    v27 = 0;
  -[SFBasicDialog setShouldHideWebContent:](v12, "setShouldHideWebContent:", v27);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __91__SFDialog_authenticationDialogWithAuthenticationChallenge_committedURL_completionHandler___block_invoke;
  v30[3] = &unk_1E21E4EE8;
  v31 = v8;
  v28 = v8;
  -[SFBasicDialog setCompletionHandler:](v12, "setCompletionHandler:", v30);

  return v12;
}

void __91__SFDialog_authenticationDialogWithAuthenticationChallenge_committedURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  __CFString *v11;

  v11 = a3;
  v7 = a4;
  if (a2 == 0x7FFFFFFFFFFFFFFFLL || a2 == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (v11)
      v8 = v11;
    else
      v8 = &stru_1E21FE780;
    if (v7)
      v9 = v7;
    else
      v9 = &stru_1E21FE780;
    objc_msgSend(MEMORY[0x1E0CB39A8], "safari_credentialWithUser:password:persistence:", v8, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

+ (id)javaScriptAlertDialogWithMessage:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  SFBasicDialog *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(SFBasicDialog);
  v8 = v5;
  if ((unint64_t)objc_msgSend(v8, "length") > 0x7D0)
  {
    objc_msgSend(v8, "substringToIndex:", 2000);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_msgSend(v8, "copy");
  }
  v10 = (void *)v9;

  -[SFBasicDialog setMessage:](v7, "setMessage:", v10);
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v11, 1, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setActions:](v7, "setActions:", v13);

  -[SFBasicDialog setCompletionHandlerBlocksWebProcess:](v7, "setCompletionHandlerBlocksWebProcess:", 1);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__SFDialog_javaScriptAlertDialogWithMessage_completionHandler___block_invoke;
  v16[3] = &unk_1E21E4EE8;
  v17 = v6;
  v14 = v6;
  -[SFBasicDialog setCompletionHandler:](v7, "setCompletionHandler:", v16);

  return v7;
}

uint64_t __63__SFDialog_javaScriptAlertDialogWithMessage_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)javaScriptConfirmDialogWithMessage:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  SFBasicDialog *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(SFBasicDialog);
  v8 = v5;
  if ((unint64_t)objc_msgSend(v8, "length") > 0x7D0)
  {
    objc_msgSend(v8, "substringToIndex:", 2000);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_msgSend(v8, "copy");
  }
  v10 = (void *)v9;

  -[SFBasicDialog setMessage:](v7, "setMessage:", v10);
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v11, 2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v13, 1, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setActions:](v7, "setActions:", v15);

  -[SFBasicDialog setCompletionHandlerBlocksWebProcess:](v7, "setCompletionHandlerBlocksWebProcess:", 1);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__SFDialog_javaScriptConfirmDialogWithMessage_completionHandler___block_invoke;
  v18[3] = &unk_1E21E4EE8;
  v19 = v6;
  v16 = v6;
  -[SFBasicDialog setCompletionHandler:](v7, "setCompletionHandler:", v18);

  return v7;
}

uint64_t __65__SFDialog_javaScriptConfirmDialogWithMessage_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

+ (id)javaScriptPromptDialogWithMessage:(id)a3 defaultText:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  SFBasicDialog *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(SFBasicDialog);
  v11 = v7;
  if ((unint64_t)objc_msgSend(v11, "length") > 0x7D0)
  {
    objc_msgSend(v11, "substringToIndex:", 2000);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_msgSend(v11, "copy");
  }
  v13 = (void *)v12;

  -[SFBasicDialog setMessage:](v10, "setMessage:", v13);
  v14 = v8;
  if ((unint64_t)objc_msgSend(v14, "length") > 0x3E8)
  {
    objc_msgSend(v14, "substringToIndex:", 1000);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_msgSend(v14, "copy");
  }
  v16 = (void *)v15;

  -[SFBasicDialog setDefaultText:](v10, "setDefaultText:", v16);
  _WBSLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v17, 2, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v19, 1, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setActions:](v10, "setActions:", v21);

  -[SFBasicDialog setCompletionHandlerBlocksWebProcess:](v10, "setCompletionHandlerBlocksWebProcess:", 1);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__SFDialog_javaScriptPromptDialogWithMessage_defaultText_completionHandler___block_invoke;
  v24[3] = &unk_1E21E4EE8;
  v25 = v9;
  v22 = v9;
  -[SFBasicDialog setCompletionHandler:](v10, "setCompletionHandler:", v24);

  return v10;
}

uint64_t __76__SFDialog_javaScriptPromptDialogWithMessage_defaultText_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
    a3 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a3);
}

+ (id)telephonyNavigationDialogWithCompletionHandler:(id)a3
{
  id v3;
  SFBasicDialog *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(SFBasicDialog);
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setMessage:](v4, "setMessage:", v5);

  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v6, 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v8, 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setActions:](v4, "setActions:", v10);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__SFDialog_telephonyNavigationDialogWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E21E4EE8;
  v14 = v3;
  v11 = v3;
  -[SFBasicDialog setCompletionHandler:](v4, "setCompletionHandler:", v13);

  return v4;
}

uint64_t __59__SFDialog_telephonyNavigationDialogWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

+ (id)dialogWithWebUIAlert:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  SFWebUIDialog *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SFWebUIDialog initWithAlert:completionHandler:]([SFWebUIDialog alloc], "initWithAlert:completionHandler:", v6, v5);

  return v7;
}

+ (id)_dialogWithTitle:(id)a3 message:(id)a4 primaryAction:(id)a5 secondaryAction:(id)a6 applicationModal:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t aBlock;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void *v26;
  id v27;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = v18;
  if (v18)
  {
    aBlock = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __102__SFDialog__dialogWithTitle_message_primaryAction_secondaryAction_applicationModal_completionHandler___block_invoke;
    v26 = &unk_1E21E4F10;
    v27 = v18;
    v20 = _Block_copy(&aBlock);

  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(a1, "_dialogWithTitle:message:acceptAction:secondaryAction:cancelAction:applicationModal:completionHandler:", v14, v15, v16, 0, v17, v9, v20, aBlock, v24, v25, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __102__SFDialog__dialogWithTitle_message_primaryAction_secondaryAction_applicationModal_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

+ (id)_dialogWithTitle:(id)a3 message:(id)a4 acceptAction:(id)a5 secondaryAction:(id)a6 cancelAction:(id)a7 applicationModal:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SFBasicDialog *v20;
  SFBasicDialog *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v30[4];
  id v31;

  v9 = a8;
  v14 = a6;
  v15 = a7;
  v16 = a9;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(SFBasicDialog);
  v21 = v20;
  if (v9)
    v22 = v19;
  else
    v22 = 0;
  -[SFBasicDialog setTitle:](v20, "setTitle:", v22);

  -[SFBasicDialog setMessage:](v21, "setMessage:", v18);
  v23 = (void *)MEMORY[0x1E0C99DE8];
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v17, 2, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "arrayWithObject:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v14, 3, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v26);

  }
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __114__SFDialog__dialogWithTitle_message_acceptAction_secondaryAction_cancelAction_applicationModal_completionHandler___block_invoke;
  v30[3] = &unk_1E21E4EE8;
  v27 = v16;
  v31 = v27;
  -[SFBasicDialog setCompletionHandler:](v21, "setCompletionHandler:", v30);
  if (v15)
  {
    +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v15, 1, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v28);

  }
  -[SFBasicDialog setActions:](v21, "setActions:", v25);
  -[SFBasicDialog setPresentationStyle:](v21, "setPresentationStyle:", v9);

  return v21;
}

uint64_t __114__SFDialog__dialogWithTitle_message_acceptAction_secondaryAction_cancelAction_applicationModal_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)formSubmissionDialogWithMessage:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialog _dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:](SFDialog, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", v6, 0, v7, v8, 1, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)noFeedAppDialogWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialog _dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:](SFDialog, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", v5, v4, v6, v7, 1, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)redirectDialogWithMessage:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = a3;
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__SFDialog_redirectDialogWithMessage_completionHandler___block_invoke;
  v12[3] = &unk_1E21E2608;
  v13 = v5;
  v9 = v5;
  +[SFDialog _dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:](SFDialog, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", 0, v6, v7, v8, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __56__SFDialog_redirectDialogWithMessage_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 0;
  else
    v3 = 2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

+ (id)_appLinkRedirectDialogWithMessage:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = a3;
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__SFDialog__appLinkRedirectDialogWithMessage_completionHandler___block_invoke;
  v12[3] = &unk_1E21E4F10;
  v13 = v5;
  v9 = v5;
  +[SFDialog _dialogWithTitle:message:acceptAction:secondaryAction:cancelAction:applicationModal:completionHandler:](SFDialog, "_dialogWithTitle:message:acceptAction:secondaryAction:cancelAction:applicationModal:completionHandler:", 0, v6, v7, 0, v8, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __64__SFDialog__appLinkRedirectDialogWithMessage_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)continuePrintingDialogWithTitle:(id)a3 message:(id)a4 applicationModal:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialog _dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:](SFDialog, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", v11, v10, v12, v13, v6, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)printBlockedDialogWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialog _dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:](SFDialog, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", 0, v4, v5, v6, 0, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)genericErrorDialogWithTitle:(id)a3 message:(id)a4 applicationModal:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialog _dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:](SFDialog, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", v8, v7, v9, 0, v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)pageLoadErrorWithMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialog _dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:](SFDialog, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", v4, v3, v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)userMediaPermissionDialogWithHost:(id)a3 permissions:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 1uLL:
      v10 = (void *)MEMORY[0x1E0CB3940];
      break;
    case 2uLL:
      v10 = (void *)MEMORY[0x1E0CB3940];
      break;
    case 3uLL:
      v10 = (void *)MEMORY[0x1E0CB3940];
      break;
    default:
      v12 = 0;
      goto LABEL_9;
  }
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", v12, 0, v13, v14, 1, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)blockedPopupWindowDialogWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", 0, v5, v6, v7, 0, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setCompletionHandlerBlocksWebProcess:", 1);
  return v8;
}

+ (id)permanentlyAcceptCertificateDialogWithAcceptanceHandler:(id)a3
{
  id v3;
  SFBasicDialog *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(SFBasicDialog);
  objc_msgSend(MEMORY[0x1E0D8A0C8], "permanentAcceptanceConfirmationTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setTitle:](v4, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0D8A0C8], "permanentAcceptanceConfirmationButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v6, 0, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v8, 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setActions:](v4, "setActions:", v10);

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __68__SFDialog_permanentlyAcceptCertificateDialogWithAcceptanceHandler___block_invoke;
  v16 = &unk_1E21E4EE8;
  v17 = v3;
  v11 = v3;
  -[SFBasicDialog setCompletionHandler:](v4, "setCompletionHandler:", &v13);
  -[SFBasicDialog setPresentationStyle:](v4, "setPresentationStyle:", 1, v13, v14, v15, v16);
  -[SFBasicDialog setAlertControllerPresentsAsActionSheet:](v4, "setAlertControllerPresentsAsActionSheet:", _SFDeviceIsPad() ^ 1);

  return v4;
}

uint64_t __68__SFDialog_permanentlyAcceptCertificateDialogWithAcceptanceHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

+ (id)requestStorageAccessDialogForDomain:(id)a3 underCurrentDomain:(id)a4 extensionsController:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  SFBasicDialog *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v31 = a6;
  v12 = objc_alloc_init(SFBasicDialog);
  objc_msgSend(v11, "webExtensionForBaseURIHost:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v13;
  if (v13)
  {
    objc_msgSend(v13, "displayName");
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v14;
  }
  objc_msgSend(v11, "webExtensionForBaseURIHost:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "displayName");
    v17 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v17;
  }
  v18 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", v19, v9, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setTitle:](v12, "setTitle:", v20);

  v21 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", v22, v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setMessage:](v12, "setMessage:", v23);

  _WBSLocalizedString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v24, 1, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v25;
  _WBSLocalizedString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v26, 2, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setActions:](v12, "setActions:", v28);

  -[SFBasicDialog setPresentationStyle:](v12, "setPresentationStyle:", 1);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __106__SFDialog_requestStorageAccessDialogForDomain_underCurrentDomain_extensionsController_completionHandler___block_invoke;
  v33[3] = &unk_1E21E4EE8;
  v34 = v31;
  v29 = v31;
  -[SFBasicDialog setCompletionHandler:](v12, "setCompletionHandler:", v33);

  return v12;
}

uint64_t __106__SFDialog_requestStorageAccessDialogForDomain_underCurrentDomain_extensionsController_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 1);
  return result;
}

+ (id)increaseDatabaseQuotaDialogForOrigin:(id)a3 newQuota:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C99E98];
  v9 = a5;
  objc_msgSend(v8, "URLWithString:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "safari_isSafariWebExtensionURL"))
  {
    objc_msgSend(v10, "safari_userVisibleHostOrExtensionDisplayName");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v11;
  }
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", a4, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v14, v7, v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialog _dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:](SFDialog, "_dialogWithTitle:message:primaryAction:secondaryAction:applicationModal:completionHandler:", v18, v17, v20, v19, 1, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)websiteLocationDialogForURL:(id)a3 preciseLocation:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  SFBasicDialog *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[3];

  v6 = a4;
  v39[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "safari_userVisibleHostWithoutWWWSubdomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v7;
  if (objc_msgSend(v7, "safari_isSafariWebExtensionURL"))
  {
    objc_msgSend(v7, "safari_userVisibleHostOrExtensionDisplayName");
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v22;
    v12 = (void *)v19;
    v9 = (void *)v16;
  }
  v23 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", v24, v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(SFBasicDialog);
  -[SFBasicDialog setTitle:](v27, "setTitle:", v35);
  if (v6)
    v28 = v12;
  else
    v28 = v15;
  -[SFBasicDialog setMessage:](v27, "setMessage:", v28);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __74__SFDialog_websiteLocationDialogForURL_preciseLocation_completionHandler___block_invoke;
  v37[3] = &unk_1E21E4EE8;
  v38 = v8;
  v29 = v8;
  -[SFBasicDialog setCompletionHandler:](v27, "setCompletionHandler:", v37);
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v26, 1, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v30;
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v25, 2, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v32 = v9;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setActions:](v27, "setActions:", v33);

  -[SFBasicDialog setPresentationStyle:](v27, "setPresentationStyle:", 1);
  return v27;
}

uint64_t __74__SFDialog_websiteLocationDialogForURL_preciseLocation_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 1);
  return result;
}

+ (id)webExtensionPermissionDialogWithExtension:(id)a3 domains:(id)a4 showMoreOptionsForAlwaysAllow:(BOOL)a5 includeDenyButton:(BOOL)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  SFBasicDialog *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  id v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  BOOL v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[5];

  v41[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a7;
  objc_msgSend(v10, "displayShortName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke;
  v38[3] = &unk_1E21E4F38;
  v15 = v11;
  v39 = v15;
  v31 = v13;
  v40 = v31;
  __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke((uint64_t)v38);
  v16 = objc_claimAutoreleasedReturnValue();
  v35[0] = v14;
  v35[1] = 3221225472;
  v35[2] = __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke_2;
  v35[3] = &unk_1E21E4F38;
  v29 = v15;
  v36 = v29;
  v28 = v10;
  v37 = v28;
  __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke_2((uint64_t)v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(SFBasicDialog);
  -[SFBasicDialog setPresentationStyle:](v18, "setPresentationStyle:", 1);
  v30 = (void *)v16;
  -[SFBasicDialog setTitle:](v18, "setTitle:", v16);
  -[SFBasicDialog setMessage:](v18, "setMessage:", v17);
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v19, 1, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:isPreferredAction:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:isPreferredAction:", v22, 2, 0, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v23;
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v21, 3, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v24;
  v41[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setActions:](v18, "setActions:", v25);

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke_3;
  v32[3] = &unk_1E21E4F60;
  v34 = a6;
  v33 = v12;
  v26 = v12;
  -[SFBasicDialog setCompletionHandler:](v18, "setCompletionHandler:", v32);
  -[SFBasicDialog setCompletionHandlerBlocksWebProcess:](v18, "setCompletionHandlerBlocksWebProcess:", 1);

  return v18;
}

id __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v2 == 3)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v4, v9, v6, v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    goto LABEL_10;
  }
  if (v2 == 2)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v4, v13, v6, v10);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v7 = (void *)v14;
    goto LABEL_9;
  }
  if (v2 != 1)
  {
    v15 = objc_msgSend(*(id *)(a1 + 32), "count") - 2;
    v16 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v4, v17, v6, v10, v15);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v3 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v7;
}

id __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  if ((unint64_t)(v2 - 2) < 2)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasAbilityToInjectContentIntoWebpages"))
      goto LABEL_12;
    goto LABEL_7;
  }
  if (v2 == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasAbilityToInjectContentIntoWebpages"))
      goto LABEL_12;
LABEL_7:
    objc_msgSend(*(id *)(a1 + 40), "hasDeclarativeNetRequestHostAccessPermission");
LABEL_12:
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "hasAbilityToInjectContentIntoWebpages"))
    objc_msgSend(*(id *)(a1 + 40), "hasDeclarativeNetRequestHostAccessPermission");
  v3 = (void *)MEMORY[0x1E0CB37A0];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v6);

  return v4;
}

void __128__SFDialog_webExtensionPermissionDialogWithExtension_domains_showMoreOptionsForAlwaysAllow_includeDenyButton_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (a2 > 1)
  {
    if (a2 == 2 || a2 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
  }
  else if (!a2 || a2 == 1)
  {
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    return;
  }
  __break(0xC471u);
}

+ (id)webExtensionAlwaysAllowDialogWithExtension:(id)a3 domains:(id)a4 includeDenyButton:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  SFBasicDialog *v12;
  uint64_t v13;
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
  id v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  BOOL v30;
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = a4;
  v12 = objc_alloc_init(SFBasicDialog);
  objc_msgSend(v9, "displayShortName");
  v13 = objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setPresentationStyle:](v12, "setPresentationStyle:", 1);
  v14 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v13;
  objc_msgSend(v14, "stringWithFormat:", v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setTitle:](v12, "setTitle:", v16);

  if (!objc_msgSend(v9, "hasAbilityToInjectContentIntoWebpages"))
    objc_msgSend(v9, "hasDeclarativeNetRequestHostAccessPermission");
  _WBSLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setMessage:](v12, "setMessage:", v17);

  _WBSLocalizedString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v18, 1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "count");
  _WBSLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v20, 2, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v21;
  _WBSLocalizedString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v22, 3, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v23;
  v31[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setActions:](v12, "setActions:", v24);

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __99__SFDialog_webExtensionAlwaysAllowDialogWithExtension_domains_includeDenyButton_completionHandler___block_invoke;
  v28[3] = &unk_1E21E4F60;
  v29 = v10;
  v30 = a5;
  v25 = v10;
  -[SFBasicDialog setCompletionHandler:](v12, "setCompletionHandler:", v28);
  -[SFBasicDialog setCompletionHandlerBlocksWebProcess:](v12, "setCompletionHandlerBlocksWebProcess:", 1);

  return v12;
}

void __99__SFDialog_webExtensionAlwaysAllowDialogWithExtension_domains_includeDenyButton_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void (*v8)(void);
  id v9;

  v9 = a3;
  v7 = a4;
  if (a2 > 1)
  {
    if (a2 == 2)
    {
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_10;
    }
    if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_10;
    }
  }
  else
  {
    if (!a2)
    {
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_10:
      v8();

      return;
    }
    if (a2 == 1)
    {
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_10;
    }
  }
  __break(0xC471u);
}

+ (id)webExtensionDisabledBecauseItRequestsAdditionalPermissionsDialogForExtension:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  SFBasicDialog *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SFBasicDialog);
  -[SFBasicDialog setPresentationStyle:](v7, "setPresentationStyle:", 1);
  v8 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFBasicDialog setTitle:](v7, "setTitle:", v10);
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setMessage:](v7, "setMessage:", v11);

  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v12, 3, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFDialogAction actionWithTitle:activatingKeyboardShortcut:type:](SFDialogAction, "actionWithTitle:activatingKeyboardShortcut:type:", v14, 2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBasicDialog setActions:](v7, "setActions:", v16);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __107__SFDialog_webExtensionDisabledBecauseItRequestsAdditionalPermissionsDialogForExtension_completionHandler___block_invoke;
  v19[3] = &unk_1E21E4EE8;
  v20 = v5;
  v17 = v5;
  -[SFBasicDialog setCompletionHandler:](v7, "setCompletionHandler:", v19);

  return v7;
}

void __107__SFDialog_webExtensionDisabledBecauseItRequestsAdditionalPermissionsDialogForExtension_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void (*v8)(void);
  id v9;

  v9 = a3;
  v7 = a4;
  if (a2 == 0x7FFFFFFFFFFFFFFFLL || a2 == 1)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_6:
    v8();

    return;
  }
  if (!a2)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  __break(0xC471u);
}

- (BOOL)shouldIgnoreGlobalModalUIDisplayPolicy
{
  return self->_shouldIgnoreGlobalModalUIDisplayPolicy;
}

- (SFDialogController)dialogController
{
  return (SFDialogController *)objc_loadWeakRetained((id *)&self->_dialogController);
}

- (void)setDialogController:(id)a3
{
  objc_storeWeak((id *)&self->_dialogController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dialogController);
}

- (void)completeWithResponse:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18B7B2000, log, OS_LOG_TYPE_ERROR, "Dialog completion handler called multiple times", v1, 2u);
}

@end
