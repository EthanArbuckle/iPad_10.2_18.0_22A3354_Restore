@implementation CNAccessAuthorization

+ (void)removeUnavailableKeysFromContactKeyVector:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authorizationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unauthorizedKeysVectorWithAuthorizer:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v7, "minusKeyVector:", v6);

}

+ (id)unauthorizedKeysVectorWithAuthorizer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  objc_msgSend(a1, "unauthorizedKeysWithAuthorizer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToKeyVector:", v5);

  if ((v6 & 1) != 0)
    v7 = 0;
  else
    v7 = v4;

  return v7;
}

+ (id)unauthorizedKeysWithAuthorizer:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((objc_msgSend(v3, "isNotesAccessGranted") & 1) == 0)
    objc_msgSend(v4, "addObject:", CFSTR("note"));
  if ((objc_msgSend(v3, "isAddressingGrammarAccessGranted") & 1) == 0)
    objc_msgSend(v4, "addObject:", CFSTR("addressingGrammars"));

  return v4;
}

+ (id)allAuthorizationKeysVector
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CNAccessAuthorization_allAuthorizationKeysVector__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allAuthorizationKeysVector_cn_once_token_0 != -1)
    dispatch_once(&allAuthorizationKeysVector_cn_once_token_0, block);
  return (id)allAuthorizationKeysVector_cn_once_object_0;
}

void __45__CNAccessAuthorization_allAuthorizationKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("note");
  v3[1] = CFSTR("addressingGrammars");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)allAuthorizationKeys_cn_once_object_1;
  allAuthorizationKeys_cn_once_object_1 = v1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizer, 0);
}

void __51__CNAccessAuthorization_allAuthorizationKeysVector__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "allAuthorizationKeys");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)allAuthorizationKeysVector_cn_once_object_0;
  allAuthorizationKeysVector_cn_once_object_0 = v2;

}

+ (id)allAuthorizationKeys
{
  if (allAuthorizationKeys_cn_once_token_1 != -1)
    dispatch_once(&allAuthorizationKeys_cn_once_token_1, &__block_literal_global_74);
  return (id)allAuthorizationKeys_cn_once_object_1;
}

- (CNAccessAuthorization)initWithAuditToken:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  CNAccessAuthorization *v7;

  v4 = (objc_class *)MEMORY[0x1E0D139A0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAuditToken:assumedIdentity:", v5, 0);

  v7 = -[CNAccessAuthorization initWithAuthorizer:](self, "initWithAuthorizer:", v6);
  return v7;
}

- (CNAccessAuthorization)initWithAuthorizer:(id)a3
{
  id v5;
  CNAccessAuthorization *v6;
  CNAccessAuthorization *v7;
  CNAccessAuthorization *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAccessAuthorization;
  v6 = -[CNAccessAuthorization init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_authorizer, a3);
    v8 = v7;
  }

  return v7;
}

- (void)performWork:(id)a3 authorizingFetchRequest:(id)a4 failureHandler:(id)a5
{
  void (**v8)(_QWORD);
  void (**v9)(id, id);
  id v10;
  id v11;

  v8 = (void (**)(_QWORD))a3;
  v9 = (void (**)(id, id))a5;
  v11 = 0;
  LODWORD(self) = -[CNAccessAuthorization authorizeFetchRequest:accessError:](self, "authorizeFetchRequest:accessError:", a4, &v11);
  v10 = v11;
  if ((_DWORD)self)
    v8[2](v8);
  else
    v9[2](v9, v10);

}

- (BOOL)authorizeFetchRequest:(id)a3 accessError:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  int v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  BOOL v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  CNMutableContactKeyVector *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  id v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  -[CNAccessAuthorization resetUnauthorizedKeysForFetchRequest:](self, "resetUnauthorizedKeysForFetchRequest:");
  -[CNAccessAuthorization unauthorizedKeysVector](self, "unauthorizedKeysVector");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    objc_opt_class();
    v5 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    v32 = v5;

    v34 = v7;
    if (v7)
    {
      v57 = 0;
      v58 = &v57;
      v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__19;
      v61 = __Block_byref_object_dispose__19;
      v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v53 = 0;
      v54 = &v53;
      v55 = 0x2020000000;
      v56 = 1;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      objc_msgSend(v7, "keysToFetch");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v50 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            if ((_CNIsObject_CNKeyDescriptorPrivate(v12) & 1) != 0)
            {
              v13 = objc_opt_respondsToSelector();
              v43 = 0;
              v44 = &v43;
              v45 = 0x3032000000;
              v46 = __Block_byref_object_copy__19;
              v47 = __Block_byref_object_dispose__19;
              v48 = objc_alloc_init(CNMutableContactKeyVector);
              objc_msgSend(v12, "_cn_requiredKeys");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "intersectsKeyVector:", v36);

              if (v15)
              {
                v16 = (void *)v44[5];
                objc_msgSend(v12, "_cn_requiredKeys");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "unionKeyVector:", v17);

                objc_msgSend((id)v44[5], "intersectKeyVector:", v36);
                if ((v13 & 1) == 0)
                  *((_BYTE *)v54 + 24) = 0;
              }
              objc_msgSend(v12, "_cn_optionalKeys", v32);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v18, "isEqualToKeyVector:", v19);

              if ((v20 & 1) == 0)
              {
                v38[0] = MEMORY[0x1E0C809B0];
                v38[1] = 3221225472;
                v38[2] = __59__CNAccessAuthorization_authorizeFetchRequest_accessError___block_invoke;
                v38[3] = &unk_1E29FB6C8;
                v39 = v36;
                v40 = &v43;
                v42 = (v13 & 1) == 0;
                v41 = &v53;
                objc_msgSend(v12, "_cn_executeGetterForRepresentedKeys:", v38);

              }
              v21 = (void *)v44[5];
              if ((v13 & 1) != 0)
              {
                +[CNContactKeyVector keyVector](CNContactKeyVector, "keyVector");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v21, "isEqualToKeyVector:", v22);

                if ((v23 & 1) == 0)
                {
                  v24 = (void *)objc_msgSend((id)v44[5], "copy");
                  objc_msgSend(v12, "_cn_setUnauthorizedKeys:", v24);

                }
              }
              else
              {
                v37[0] = MEMORY[0x1E0C809B0];
                v37[1] = 3221225472;
                v37[2] = __59__CNAccessAuthorization_authorizeFetchRequest_accessError___block_invoke_2;
                v37[3] = &unk_1E29FB6F0;
                v37[4] = &v57;
                objc_msgSend(v21, "enumeratePropertiesUsingBlock:", v37);
              }
              _Block_object_dispose(&v43, 8);

            }
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
        }
        while (v9);
      }

      v25 = *((unsigned __int8 *)v54 + 24);
      v26 = *((_BYTE *)v54 + 24) != 0;
      v65[0] = v58[5];
      v64[0] = CFSTR("CNKeyPaths");
      v64[1] = CFSTR("CNInvalidRecords");
      v63 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v65[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 102, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (a4 && !v25)
        *a4 = objc_retainAutorelease(v29);

      _Block_object_dispose(&v53, 8);
      _Block_object_dispose(&v57, 8);

    }
    else
    {
      v26 = 1;
    }

  }
  else
  {
    v26 = 1;
  }

  return v26;
}

- (id)unauthorizedKeysVector
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[CNAccessAuthorization authorizer](self, "authorizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unauthorizedKeysVectorWithAuthorizer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)resetUnauthorizedKeysForFetchRequest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v6, "keysToFetch", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "_cn_setUnauthorizedKeys:", 0);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (CNAuthorizationContext)authorizer
{
  return self->_authorizer;
}

- (CNAccessAuthorization)init
{
  CNAccessAuthorization *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)new
{
  id v2;
  id v3;

  v2 = a1;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNAccessAuthorization)initWithAuditToken:(id)a3 assumedIdentity:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  CNAccessAuthorization *v10;

  v6 = (objc_class *)MEMORY[0x1E0D139A0];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithAuditToken:assumedIdentity:", v8, v7);

  v10 = -[CNAccessAuthorization initWithAuthorizer:](self, "initWithAuthorizer:", v9);
  return v10;
}

uint64_t __59__CNAccessAuthorization_authorizeFetchRequest_accessError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  +[CNContactKeyVector keyVectorWithKey:](CNContactKeyVector, "keyVectorWithKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intersectsKeyVector:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addKey:", v3);
    if (*(_BYTE *)(a1 + 56))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

  return 0;
}

void __59__CNAccessAuthorization_authorizeFetchRequest_accessError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "key");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)authorizedKeysForContactKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CNAccessAuthorization unauthorizedKeysVector](self, "unauthorizedKeysVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__CNAccessAuthorization_authorizedKeysForContactKeys___block_invoke;
    v9[3] = &unk_1E29FB718;
    v10 = v5;
    objc_msgSend(v4, "_cn_filter:", v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

uint64_t __54__CNAccessAuthorization_authorizedKeysForContactKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (_CNIsObject_CNKeyDescriptorPrivate(v3))
  {
    objc_msgSend(v3, "_cn_requiredKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "intersectsKeyVector:", *(_QWORD *)(a1 + 32)) ^ 1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (BOOL)canSetContactProperty:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D13A38];
  v5 = a3;
  objc_msgSend(v4, "currentEnvironment");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "authorizationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unauthorizedKeysWithAuthorizer:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "containsObject:", v5);
  return v6 ^ 1;
}

@end
