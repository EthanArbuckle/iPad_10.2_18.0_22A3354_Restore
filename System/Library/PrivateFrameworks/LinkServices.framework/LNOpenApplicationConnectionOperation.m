@implementation LNOpenApplicationConnectionOperation

os_activity_t __81__LNOpenApplicationConnectionOperation_initWithPriority_queue_completionHandler___block_invoke()
{
  return _os_activity_create(&dword_1A18F6000, "appintents:open app", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (LNOpenApplicationConnectionOperation)initWithPriority:(int64_t)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  LNOpenApplicationConnectionOperation *v12;
  uint64_t v13;
  id completionHandler;
  LNOpenApplicationConnectionOperation *v15;
  void *v17;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNOpenApplicationConnectionOperation.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)LNOpenApplicationConnectionOperation;
  v12 = -[LNConnectionOperation initWithIdentifier:priority:queue:activity:](&v18, sel_initWithIdentifier_priority_queue_activity_, v11, a3, v9, &__block_literal_global_758);

  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    completionHandler = v12->_completionHandler;
    v12->_completionHandler = (id)v13;

    v15 = v12;
  }

  return v12;
}

- (void)finishWithActionResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[LNOpenApplicationConnectionOperation completionHandler](self, "completionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[LNOpenApplicationConnectionOperation completionHandler](self, "completionHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v9)[2](v9, v6, v7);

    -[LNOpenApplicationConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  v10.receiver = self;
  v10.super_class = (Class)LNOpenApplicationConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v10, sel_finishWithError_, v7);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  objc_super v8;

  v4 = a3;
  -[LNOpenApplicationConnectionOperation completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LNConnectionOperation validatingResult:error:](self, "validatingResult:error:", 0, v4);
    v6 = objc_claimAutoreleasedReturnValue();

    -[LNOpenApplicationConnectionOperation completionHandler](self, "completionHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v6);

    -[LNOpenApplicationConnectionOperation setCompletionHandler:](self, "setCompletionHandler:", 0);
    v4 = (id)v6;
  }
  v8.receiver = self;
  v8.super_class = (Class)LNOpenApplicationConnectionOperation;
  -[LNConnectionOperation finishWithError:](&v8, sel_finishWithError_, v4);

}

@end
