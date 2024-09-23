@implementation VSErrorRecoveryAttempter

- (VSErrorRecoveryAttempter)init
{
  VSErrorRecoveryAttempter *v2;
  VSErrorRecoveryAttempter *v3;
  NSArray *options;
  uint64_t v5;
  NSOperationQueue *recoveryAttemptingQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSErrorRecoveryAttempter;
  v2 = -[VSErrorRecoveryAttempter init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    options = v2->_options;
    v2->_options = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    recoveryAttemptingQueue = v3->_recoveryAttemptingQueue;
    v3->_recoveryAttemptingQueue = (NSOperationQueue *)v5;

  }
  return v3;
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 delegate:(id)a5 didRecoverSelector:(SEL)a6 contextInfo:(void *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  SEL v21;
  void *v22;

  v12 = a3;
  v13 = a5;
  -[VSErrorRecoveryAttempter recoveryAttemptingQueue](self, "recoveryAttemptingQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __105__VSErrorRecoveryAttempter_attemptRecoveryFromError_optionIndex_delegate_didRecoverSelector_contextInfo___block_invoke;
  v17[3] = &unk_1E93A0B08;
  v17[4] = self;
  v18 = v12;
  v19 = v13;
  v20 = a4;
  v21 = a6;
  v22 = a7;
  v15 = v13;
  v16 = v12;
  objc_msgSend(v14, "addOperationWithBlock:", v17);

}

id __105__VSErrorRecoveryAttempter_attemptRecoveryFromError_optionIndex_delegate_didRecoverSelector_contextInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;
  const char *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "attemptRecoveryFromError:optionIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  result = *(id *)(a1 + 48);
  if (result)
  {
    v4 = *(const char **)(a1 + 64);
    if (v4)
      return objc_msgSend(result, v4, v2, *(_QWORD *)(a1 + 72));
  }
  return result;
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;

  v6 = a3;
  -[VSErrorRecoveryAttempter options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "attemptHandler");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (*(uint64_t (**)(uint64_t, id))(v9 + 16))(v9, v6);
  else
    v11 = 1;

  return v11;
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSOperationQueue)recoveryAttemptingQueue
{
  return self->_recoveryAttemptingQueue;
}

- (void)setRecoveryAttemptingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryAttemptingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryAttemptingQueue, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
