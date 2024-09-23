@implementation CDPRecoveryKeyValidatorProxyImpl

- (CDPRecoveryKeyValidatorProxyImpl)initWithRemoteObject:(id)a3
{
  id v5;
  CDPRecoveryKeyValidatorProxyImpl *v6;
  CDPRecoveryKeyValidatorProxyImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPRecoveryKeyValidatorProxyImpl;
  v6 = -[CDPRecoveryKeyValidatorProxyImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_validator, a3);

  return v7;
}

- (void)confirmRecoveryKey:(id)a3 completion:(id)a4
{
  id v6;
  CDPRecoveryKeyValidator *validator;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  validator = self->_validator;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__CDPRecoveryKeyValidatorProxyImpl_confirmRecoveryKey_completion___block_invoke;
  v9[3] = &unk_24C7C1228;
  v10 = v6;
  v8 = v6;
  -[CDPRecoveryKeyValidator confirmRecoveryKey:completion:](validator, "confirmRecoveryKey:completion:", a3, v9);

}

void __66__CDPRecoveryKeyValidatorProxyImpl_confirmRecoveryKey_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__CDPRecoveryKeyValidatorProxyImpl_confirmRecoveryKey_completion___block_invoke_2;
  block[3] = &unk_24C7C1728;
  v6 = *(id *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __66__CDPRecoveryKeyValidatorProxyImpl_confirmRecoveryKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)generateRecoveryKey:(id)a3
{
  id v4;
  CDPRecoveryKeyValidator *validator;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  validator = self->_validator;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__CDPRecoveryKeyValidatorProxyImpl_generateRecoveryKey___block_invoke;
  v7[3] = &unk_24C7C17F0;
  v8 = v4;
  v6 = v4;
  -[CDPRecoveryKeyValidator generateRecoveryKey:](validator, "generateRecoveryKey:", v7);

}

void __56__CDPRecoveryKeyValidatorProxyImpl_generateRecoveryKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CDPRecoveryKeyValidatorProxyImpl_generateRecoveryKey___block_invoke_2;
  block[3] = &unk_24C7C13D0;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __56__CDPRecoveryKeyValidatorProxyImpl_generateRecoveryKey___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)generateRecoveryKeyWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  CDPRecoveryKeyValidator *validator;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v5 = dispatch_semaphore_create(0);
  validator = self->_validator;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__CDPRecoveryKeyValidatorProxyImpl_generateRecoveryKeyWithError___block_invoke;
  v10[3] = &unk_24C7C1818;
  v12 = &v20;
  v13 = &v14;
  v7 = v5;
  v11 = v7;
  -[CDPRecoveryKeyValidator generateRecoveryKey:](validator, "generateRecoveryKey:", v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __65__CDPRecoveryKeyValidatorProxyImpl_generateRecoveryKeyWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)confirmRecoveryKey:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  CDPRecoveryKeyValidator *validator;
  NSObject *v9;
  char v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  v7 = dispatch_semaphore_create(0);
  validator = self->_validator;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__CDPRecoveryKeyValidatorProxyImpl_confirmRecoveryKey_error___block_invoke;
  v12[3] = &unk_24C7C1840;
  v14 = &v22;
  v15 = &v16;
  v9 = v7;
  v13 = v9;
  -[CDPRecoveryKeyValidator confirmRecoveryKey:completion:](validator, "confirmRecoveryKey:completion:", v6, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v10 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __61__CDPRecoveryKeyValidatorProxyImpl_confirmRecoveryKey_error___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator, 0);
}

@end
