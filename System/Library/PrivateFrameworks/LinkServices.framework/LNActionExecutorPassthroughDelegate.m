@implementation LNActionExecutorPassthroughDelegate

- (LNActionExecutorPassthroughDelegate)initWithShowOutputActionDelegate:(id)a3 performCompletionHandler:(id)a4
{
  id v6;
  id v7;
  LNActionExecutorPassthroughDelegate *v8;
  LNActionExecutorPassthroughDelegate *v9;
  void *v10;
  id completionHandler;
  LNActionExecutorPassthroughDelegate *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LNActionExecutorPassthroughDelegate;
  v8 = -[LNActionExecutorPassthroughDelegate init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = _Block_copy(v7);
    completionHandler = v9->_completionHandler;
    v9->_completionHandler = v10;

    v12 = v9;
  }

  return v9;
}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executor:needsConfirmationWithRequest:", v7, v6);

}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executor:needsDisambiguationWithRequest:", v7, v6);

}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executor:needsValueWithRequest:", v7, v6);

}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executor:needsActionConfirmationWithRequest:", v10, v6);

  }
  else
  {
    objc_msgSend(v6, "respondWithConfirmation:", 1);
  }

}

- (void)executor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executor:needsAppProtectionUnlockWithCompletionHandler:", v10, v6);

  }
  else
  {
    v6[2](v6, 0);
  }

}

- (void)executor:(id)a3 didPerformActionWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "executor:didPerformActionWithResult:error:", v14, v8, v9);

  }
  -[LNActionExecutorPassthroughDelegate completionHandler](self, "completionHandler");
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))v13)[2](v13, v8, v9);

}

- (void)executor:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "executor:didFinishWithResult:error:", v13, v8, v9);

  }
}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "executor:didCompleteExecutionWithResult:error:", v13, v8, v9);

  }
}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "executor:shouldRunShowOutputAction:", v6, v7);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)executor:(id)a3 environmentForViewSnippetWithCompletion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executor:environmentForViewSnippetWithCompletion:", v10, v6);

  }
  else
  {
    v6[2](v6, 0);
  }

}

- (void)executor:(id)a3 preferredContentSizeForViewSnippetWithCompletion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executor:preferredContentSizeForViewSnippetWithCompletion:", v10, v6);

  }
  else
  {
    v6[2](v6, 0);
  }

}

- (void)executor:(id)a3 continueInAppWithRequest:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[LNActionExecutorPassthroughDelegate delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executor:needsContinueInAppWithRequest:", v10, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "respondWithError:", v9);
  }

}

- (LNActionExecutorDelegate)delegate
{
  return (LNActionExecutorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
