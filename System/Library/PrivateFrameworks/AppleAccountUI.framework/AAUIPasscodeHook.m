@implementation AAUIPasscodeHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("passcode:validate"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D87308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("passcode:validate"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AAUIPasscodeHook _validatePasscodeWithServerAttributes:completion:](self, "_validatePasscodeWithServerAttributes:completion:", a4, a6, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIPasscodeHook _validatePasscodeWithServerAttributes:completion:](self, "_validatePasscodeWithServerAttributes:completion:", v7, v6);

}

- (void)_validatePasscodeWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D87318]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;

  +[AAUIPasscodeValidateController stingrayControllerWithPresenter:forceInline:](AAUIPasscodeValidateController, "stingrayControllerWithPresenter:forceInline:", v9, objc_msgSend(v11, "BOOLValue"));
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v12 = (void *)v18[5];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__AAUIPasscodeHook__validatePasscodeWithServerAttributes_completion___block_invoke;
  v14[3] = &unk_1EA2DC2E8;
  v13 = v7;
  v15 = v13;
  v16 = &v17;
  objc_msgSend(v12, "validatePasscodeStateWithCompletion:", v14);

  _Block_object_dispose(&v17, 8);
}

void __69__AAUIPasscodeHook__validatePasscodeWithServerAttributes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, a2 != 0);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
