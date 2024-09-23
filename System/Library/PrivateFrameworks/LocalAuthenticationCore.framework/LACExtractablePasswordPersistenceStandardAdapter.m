@implementation LACExtractablePasswordPersistenceStandardAdapter

- (LACExtractablePasswordPersistenceStandardAdapter)initWithOptions:(id)a3
{
  id v4;
  LACExtractablePasswordPersistenceStandardAdapter *v5;
  void *v6;
  uint64_t v7;
  LACContext *context;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LACExtractablePasswordPersistenceStandardAdapter;
  v5 = -[LACExtractablePasswordPersistenceStandardAdapter init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "contextProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createContext");
    v7 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (LACContext *)v7;

  }
  return v5;
}

- (id)extractPassword:(id *)a3
{
  return (id)-[LACContext coreCredentialOfType:error:](self->_context, "coreCredentialOfType:error:", -9, a3);
}

- (void)extractPasswordWithCompletion:(id)a3
{
  LACContext *context;

  context = self->_context;
  if (context)
    -[LACContext coreCredentialOfType:reply:](context, "coreCredentialOfType:reply:", -9, a3);
  else
    (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (BOOL)stashPassword:(id)a3 error:(id *)a4
{
  id v6;
  LACContext *context;
  char v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  if (-[LACExtractablePasswordPersistenceStandardAdapter _verifyHasRequiredPasswordLength:error:](self, "_verifyHasRequiredPasswordLength:error:", v6, a4))
  {
    context = self->_context;
    v12 = 0;
    v8 = -[LACContext setCoreCredential:type:error:](context, "setCoreCredential:type:error:", v6, -9, &v12);
    v9 = v12;
    v10 = v9;
    if (a4 && (v8 & 1) == 0)
      *a4 = objc_retainAutorelease(v9);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)stashPassword:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  LACContext *context;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v8 = -[LACExtractablePasswordPersistenceStandardAdapter _verifyHasRequiredPasswordLength:error:](self, "_verifyHasRequiredPasswordLength:error:", v6, &v13);
  v9 = v13;
  if (v8)
  {
    context = self->_context;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __77__LACExtractablePasswordPersistenceStandardAdapter_stashPassword_completion___block_invoke;
    v11[3] = &unk_2510C0BE8;
    v12 = v7;
    -[LACContext setCoreCredential:type:reply:](context, "setCoreCredential:type:reply:", v6, -9, v11);

  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v9);
  }

}

uint64_t __77__LACExtractablePasswordPersistenceStandardAdapter_stashPassword_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_verifyHasRequiredPasswordLength:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (objc_msgSend(v5, "length") && (unint64_t)objc_msgSend(v5, "length") <= 0x80)
  {
    LOBYTE(a4) = 1;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The provided data should have between %d and %d bytes"), 1, 128);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1001, v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
