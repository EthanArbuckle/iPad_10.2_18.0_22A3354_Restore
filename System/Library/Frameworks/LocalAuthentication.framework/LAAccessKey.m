@implementation LAAccessKey

- (LAAccessKey)initWithACL:(id)a3
{
  id v4;
  void *v5;
  LAAccessKey *v6;

  v4 = a3;
  +[LAKeyStoreItemBuilder buildNullKey](LAKeyStoreItemBuilder, "buildNullKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (LAAccessKey *)-[LAAccessKey initWithACL:key:]((id *)&self->super.isa, v4, v5);

  return v6;
}

- (id)initWithACL:(void *)a3 key:
{
  id v6;
  id v7;
  id *v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)LAAccessKey;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 3, a2);
      objc_msgSend(v7, "identifier");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[2];
      a1[2] = (id)v9;

      objc_storeStrong(a1 + 1, a3);
    }
  }

  return a1;
}

- (LAAccessKey)initWithKey:(id)a3
{
  id v4;
  LAACL *v5;
  void *v6;
  LAACL *v7;
  LAAccessKey *v8;

  v4 = a3;
  v5 = [LAACL alloc];
  objc_msgSend(v4, "acl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LAACL initWithData:](v5, "initWithData:", v6);
  v8 = (LAAccessKey *)-[LAAccessKey initWithACL:key:]((id *)&self->super.isa, v7, v4);

  return v8;
}

- (void)armInContext:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = &unk_1E7087ED0;
  v11[0] = MEMORY[0x1E0C9AAB0];
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAAccessKey armInContext:options:completion:](self, "armInContext:options:completion:", v8, v9, v7);

}

- (void)armInContext:(id)a3 options:(id)a4 completion:(id)a5
{
  -[LAACL evaluateInContext:options:reply:](self->_acl, "evaluateInContext:options:reply:", a3, a4, a5);
}

- (void)unlockKey:(id)a3 inContext:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v9 = a5;
  v10 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__LAAccessKey_unlockKey_inContext_userInfo_completion___block_invoke;
  v13[3] = &unk_1E7079468;
  v14 = v9;
  v15 = v10;
  v11 = v9;
  v12 = v10;
  -[LAAccessKey armInContext:completion:](self, "armInContext:completion:", a4, v13);

}

void __55__LAAccessKey_unlockKey_inContext_userInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void (*v3)(void);
  void *v4;
  uint64_t v5;
  id v6;

  if (a2)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_3:
    v3();
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("kLAAccessKeyNonce"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 40);
  if (!v4)
  {
    v3 = *(void (**)(void))(v5 + 16);
    goto LABEL_3;
  }
  +[LAAuthorizationError missingImplementation](LAAuthorizationError, "missingImplementation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *v6;
  LAACL *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (NSString *)v5[2];
    v8 = 0;
    if (v6 == self->_identifier || -[NSString isEqualToString:](v6, "isEqualToString:"))
    {
      v7 = (LAACL *)v5[3];
      if (v7 == self->_acl || -[LAACL isEqual:](v7, "isEqual:"))
        v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (LAACL)acl
{
  return self->_acl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acl, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
