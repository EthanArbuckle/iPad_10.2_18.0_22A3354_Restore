@implementation SFWebUIDialog

- (SFWebUIDialog)initWithAlert:(id)a3 completionHandler:(id)a4
{
  WebUIAlert *v6;
  id v7;
  SFWebUIDialog *v8;
  WebUIAlert *alert;
  WebUIAlert *v10;
  void *v11;
  id completionHandler;
  void *v13;
  objc_super v15;

  v6 = (WebUIAlert *)a3;
  v15.receiver = self;
  v15.super_class = (Class)SFWebUIDialog;
  v7 = a4;
  v8 = -[SFWebUIDialog init](&v15, sel_init);
  alert = v8->_alert;
  v8->_alert = v6;
  v10 = v6;

  v8->_finalAction = 0;
  v11 = _Block_copy(v7);

  completionHandler = v8->_completionHandler;
  v8->_completionHandler = v11;

  -[WebUIAlert identities](v10, "identities", v15.receiver, v15.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v8->_shouldIgnoreGlobalModalUIDisplayPolicy = objc_msgSend(v13, "count") != 0;
  return v8;
}

- (BOOL)shouldIgnoreGlobalModalUIDisplayPolicy
{
  return self->_shouldIgnoreGlobalModalUIDisplayPolicy;
}

- (int64_t)presentationStyle
{
  return 1;
}

- (id)newViewControllerRepresentationWithCompletionHandler:(id)a3
{
  id v4;
  WebUIAlert *alert;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  alert = self->_alert;
  v6 = (void *)MEMORY[0x1E0DD9920];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__SFWebUIDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E21E5068;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "alertControllerForAlert:automaticallyDismiss:withCompletionHandler:", alert, 0, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __70__SFWebUIDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)didCompleteWithResponse:(id)a3
{
  if (a3)
    objc_msgSend(a3, "integerValue");
  else
    -[WebUIAlert hideAction](self->_alert, "hideAction");
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (WebUIAlert)alert
{
  return self->_alert;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
