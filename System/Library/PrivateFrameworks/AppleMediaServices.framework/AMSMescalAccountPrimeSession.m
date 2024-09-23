@implementation AMSMescalAccountPrimeSession

- (AMSMescalAccountPrimeSession)initWithBag:(id)a3
{
  id v5;
  AMSMescalAccountPrimeSession *v6;
  AMSMescalAccountPrimeSession *v7;
  AMSMescalSession *v8;
  AMSMescalSession *session;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSMescalAccountPrimeSession;
  v6 = -[AMSMescalAccountPrimeSession init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    v8 = -[AMSMescalSession initWithType:]([AMSMescalSession alloc], "initWithType:", 2);
    session = v7->_session;
    v7->_session = v8;

  }
  return v7;
}

- (id)primeSignatureForData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v4 = a3;
  -[AMSMescalAccountPrimeSession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMescalAccountPrimeSession bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "primeSignatureForData:bag:error:", v4, v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v7)
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
  else
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)signData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v4 = a3;
  -[AMSMescalAccountPrimeSession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMescalAccountPrimeSession bag](self, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "signData:bag:error:", v4, v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v7)
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
  else
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)verifyPrimeSignature:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v11;

  v4 = a3;
  -[AMSMescalAccountPrimeSession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "verifyPrimeSignature:error:", v4, &v11);

  v7 = v11;
  if (v6)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v7)
    {
      AMSError(0, CFSTR("Mescal Account Prime Session"), CFSTR("Failed to verify prime signature."), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (AMSMescalSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
