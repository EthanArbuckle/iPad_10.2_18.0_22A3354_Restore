@implementation AMSBiometricsDisableTask

- (AMSBiometricsDisableTask)initWithAccount:(id)a3
{
  id v5;
  AMSBiometricsDisableTask *v6;
  AMSBiometricsDisableTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSBiometricsDisableTask;
  v6 = -[AMSTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)perform
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__AMSBiometricsDisableTask_perform__block_invoke;
  v3[3] = &unk_1E253DF08;
  v3[4] = self;
  -[AMSTask performBinaryTaskWithBlock:](self, "performBinaryTaskWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __35__AMSBiometricsDisableTask_perform__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBiometrics disableForAccount:](AMSBiometrics, "disableForAccount:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "resultWithError:", &v9);
  v6 = v9;

  v7 = objc_retainAutorelease(v6);
  *a2 = v7;
  return v5;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
