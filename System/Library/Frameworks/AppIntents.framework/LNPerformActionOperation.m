@implementation LNPerformActionOperation

- (LNPerformActionOperation)initWithAction:(id)a3 options:(id)a4 client:(id)a5 completionHandler:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  LNPerformActionOperation *v16;
  LNPerformActionOperation *v17;
  uint64_t v18;
  id completionHandler;
  LNPerformActionOperation *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformActionOperation.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformActionOperation.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

      if (v15)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformActionOperation.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

  if (!v14)
    goto LABEL_10;
LABEL_4:
  if (v15)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPerformActionOperation.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_5:
  v26.receiver = self;
  v26.super_class = (Class)LNPerformActionOperation;
  v16 = -[LNPerformActionOperation init](&v26, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_options, a4);
    objc_storeStrong((id *)&v17->_action, a3);
    objc_storeStrong((id *)&v17->_client, a5);
    v18 = objc_msgSend(v15, "copy");
    completionHandler = v17->_completionHandler;
    v17->_completionHandler = (id)v18;

    v20 = v17;
  }

  return v17;
}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[LNPerformActionOperation options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _OWORD v19[2];

  objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformActionOperation setProgress:](self, "setProgress:", v3);

  -[LNPerformActionOperation progress](self, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfoObject:forKey:", *MEMORY[0x24BE5FE50], *MEMORY[0x24BDD1178]);

  -[LNPerformActionOperation progress](self, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformActionOperation options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInfoObject:forKey:", v7, *MEMORY[0x24BE5FE58]);

  -[LNPerformActionOperation progress](self, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "publish");

  -[LNPerformActionOperation delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformActionOperation action](self, "action");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformActionOperation options](self, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformActionOperation progress](self, "progress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformActionOperation client](self, "client");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformActionOperation delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "xpcConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    objc_msgSend(v16, "auditToken");
  else
    memset(v19, 0, sizeof(v19));
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __33__LNPerformActionOperation_start__block_invoke;
  v18[3] = &unk_24F0CB0E8;
  v18[4] = self;
  objc_msgSend(v10, "performAction:options:reportingProgress:delegate:auditToken:completionHandler:", v11, v12, v13, v14, v19, v18);

}

- (void)finishWithError:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[LNPerformActionOperation progress](self, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unpublish");

  -[LNPerformActionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNPerformActionOperation completionHandler](self, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[LNPerformActionOperation result](self, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v6)[2](v6, v7, v10);

    -[LNPerformActionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  -[LNPerformActionOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPerformActionOperation result](self, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performActionOperation:didFinishWithResult:error:", self, v9, v10);

}

- (void)requestParameterConfirmation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[LNPerformActionOperation client](self, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestParameterConfirmation:completionHandler:", v7, v6);

}

- (void)requestParameterDisambiguation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[LNPerformActionOperation client](self, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestParameterDisambiguation:completionHandler:", v7, v6);

}

- (void)requestParameterNeedsValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[LNPerformActionOperation client](self, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestParameterNeedsValue:completionHandler:", v7, v6);

}

- (void)requestActionConfirmation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[LNPerformActionOperation client](self, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestActionConfirmation:completionHandler:", v7, v6);

}

- (void)requestViewSnippetEnvironmentWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNPerformActionOperation client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestViewSnippetEnvironmentWithCompletion:", v4);

}

- (BOOL)requestCancelTimeoutAndReturnError:(id *)a3
{
  void *v4;

  -[LNPerformActionOperation client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestCancelTimeout");

  if (a3)
    *a3 = 0;
  return 1;
}

- (BOOL)requestExtendTimeoutAndReturnError:(id *)a3
{
  void *v4;

  -[LNPerformActionOperation client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestExtendTimeout");

  if (a3)
    *a3 = 0;
  return 1;
}

- (void)requestContinueInApp:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[LNPerformActionOperation client](self, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestContinueInApp:completionHandler:", v7, v6);

}

- (void)requestOpenURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[LNPerformActionOperation client](self, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestOpenURL:completionHandler:", v7, v6);

}

- (int64_t)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (BOOL)hasValidConnection
{
  return self->_hasValidConnection;
}

- (LNAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (LNActionExecutorOptions)options
{
  return self->_options;
}

- (LNConnectionClientInterface)client
{
  return self->_client;
}

- (LNPerformActionOperationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (LNSuccessResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

void __33__LNPerformActionOperation_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setResult:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);

}

@end
