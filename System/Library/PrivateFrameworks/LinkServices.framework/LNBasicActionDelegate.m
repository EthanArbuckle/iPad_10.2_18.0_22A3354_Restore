@implementation LNBasicActionDelegate

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a4;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("LNConnectionErrorDomain"), 1001, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "respondWithError:", v6);

}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a4;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("LNConnectionErrorDomain"), 1001, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "respondWithError:", v6);

}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a4;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("LNConnectionErrorDomain"), 1001, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "respondWithError:", v6);

}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, id, id);

  v7 = a5;
  v8 = a4;
  -[LNBasicActionDelegate completion](self, "completion");
  v9 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue();
  v9[2](v9, v8, v7);

}

- (LNBasicActionDelegate)initWithCompletion:(id)a3
{
  id v5;
  LNBasicActionDelegate *v6;
  uint64_t v7;
  id completion;
  LNBasicActionDelegate *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNBasicActionClient.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LNBasicActionDelegate;
  v6 = -[LNBasicActionDelegate init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    completion = v6->_completion;
    v6->_completion = (id)v7;

    v9 = v6;
  }

  return v6;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
