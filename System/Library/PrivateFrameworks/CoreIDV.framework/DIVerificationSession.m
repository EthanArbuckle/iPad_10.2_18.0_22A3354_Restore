@implementation DIVerificationSession

+ (void)concludeVerification:(id)a3
{
  DIVClient *v3;
  DIVClient *v4;
  id v5;

  v5 = a3;
  v3 = objc_alloc_init(DIVClient);
  v4 = v3;
  if (v3)
    -[DIVClient concludeVerification:](v3, "concludeVerification:", v5);

}

- (DIVerificationSession)initWithContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  DIVerificationSession *v9;
  DIVerificationSession *v10;
  NSError *configureError;
  DIVClient *v12;
  DIVClient *client;
  DIVClient *v14;
  _QWORD v16[4];
  DIVerificationSession *v17;
  objc_super v18;

  v5 = a3;
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "serviceName"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v8))
  {
    v18.receiver = self;
    v18.super_class = (Class)DIVerificationSession;
    v9 = -[DIVerificationSession init](&v18, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v9->_context, a3);
      configureError = v10->_configureError;
      v10->_configureError = 0;

      v12 = objc_alloc_init(DIVClient);
      client = v10->_client;
      v10->_client = v12;

      v14 = v10->_client;
      if (v14)
      {
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __41__DIVerificationSession_initWithContext___block_invoke;
        v16[3] = &unk_24C2D2B58;
        v10 = v10;
        v17 = v10;
        -[DIVClient configure:completion:](v14, "configure:completion:", v6, v16);

      }
    }
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

uint64_t __41__DIVerificationSession_initWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConfigureError:", a2);
}

- (void)performVerificationWithAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  DIVClient *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v6 = a3;
  v7 = a4;
  -[DIVerificationSession configureError](self, "configureError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DIVerificationSession setConfigureError:](self, "setConfigureError:", 0);
    v9 = objc_alloc_init(DIVClient);
    -[DIVerificationSession setClient:](self, "setClient:", v9);

    -[DIVerificationSession client](self, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIVerificationSession context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __70__DIVerificationSession_performVerificationWithAttributes_completion___block_invoke;
    v14[3] = &unk_24C2D2B58;
    v14[4] = self;
    objc_msgSend(v10, "configure:completion:", v11, v14);

  }
  -[DIVerificationSession client](self, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DIVerificationSession client](self, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performVerificationWithAttributes:completion:", v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DIVError"), -2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v13);
  }

}

uint64_t __70__DIVerificationSession_performVerificationWithAttributes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConfigureError:", a2);
}

- (void)shareVerificationResultWithOptions:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[DIVerificationSession client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DIVerificationSession client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shareVerificationResultWithOptions:completion:", v9, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DIVError"), -2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v8);
  }

}

- (void)getVerificationResultWithOptions:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[DIVerificationSession client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DIVerificationSession client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getVerificationResultWithOptions:completion:", v9, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DIVError"), -2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v8);
  }

}

- (void)invalidate
{
  id v2;

  -[DIVerificationSession client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)concludeVerification
{
  id v2;

  -[DIVerificationSession client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "concludeVerification:", 0);

}

- (void)confirmVerificationCompletedWithFeedback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DIVerificationSession client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "confirmVerificationCompletedWithFeedback:", v4);

}

- (void)setClient:(id)a3
{
  DIVClient *v4;
  DIVClient *client;

  v4 = (DIVClient *)a3;
  os_unfair_lock_lock(&self->_lock);
  client = self->_client;
  self->_client = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setContext:(id)a3
{
  DIVerificationSessionContext *v4;
  DIVerificationSessionContext *context;

  v4 = (DIVerificationSessionContext *)a3;
  os_unfair_lock_lock(&self->_lock);
  context = self->_context;
  self->_context = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setConfigureError:(id)a3
{
  NSError *v4;
  NSError *configureError;

  v4 = (NSError *)a3;
  os_unfair_lock_lock(&self->_lock);
  configureError = self->_configureError;
  self->_configureError = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)client
{
  os_unfair_lock_s *p_lock;
  DIVClient *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_client;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (DIVerificationSessionContext)context
{
  os_unfair_lock_s *p_lock;
  DIVerificationSessionContext *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_context;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)configureError
{
  os_unfair_lock_s *p_lock;
  NSError *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_configureError;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configureError, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
