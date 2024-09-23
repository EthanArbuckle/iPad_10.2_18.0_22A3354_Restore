@implementation LAExtractablePassword

- (LAExtractablePassword)init
{
  LAExtractablePassword *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  LACExtractablePasswordPersistence *persistence;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LAExtractablePassword;
  v2 = -[LAExtractablePassword init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D44400];
    __29__LAExtractablePassword_init__block_invoke();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "passwordPersistenceWithOptions:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    persistence = v2->_persistence;
    v2->_persistence = (LACExtractablePasswordPersistence *)v5;

  }
  return v2;
}

id __29__LAExtractablePassword_init__block_invoke()
{
  id v0;
  LAContextProvider *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0D44408]);
  v1 = objc_alloc_init(LAContextProvider);
  v2 = (void *)objc_msgSend(v0, "initWithContextProvider:", v1);

  return v2;
}

- (void)extractPasswordWithCompletion:(id)a3
{
  -[LACExtractablePasswordPersistence extractPasswordWithCompletion:](self->_persistence, "extractPasswordWithCompletion:", a3);
}

- (id)extractPassword:(id *)a3
{
  return (id)-[LACExtractablePasswordPersistence extractPassword:](self->_persistence, "extractPassword:", a3);
}

- (BOOL)stashPassword:(id)a3 error:(id *)a4
{
  return -[LACExtractablePasswordPersistence stashPassword:error:](self->_persistence, "stashPassword:error:", a3, a4);
}

- (void)stashPassword:(id)a3 completion:(id)a4
{
  -[LACExtractablePasswordPersistence stashPassword:completion:](self->_persistence, "stashPassword:completion:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
}

@end
