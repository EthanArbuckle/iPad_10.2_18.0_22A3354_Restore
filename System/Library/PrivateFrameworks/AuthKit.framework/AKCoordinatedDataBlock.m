@implementation AKCoordinatedDataBlock

- (AKCoordinatedDataBlock)initWithBlock:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  dispatch_group_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKCoordinatedDataBlock;
  v5 = -[AKCoordinatedDataBlock init](&v11, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x194022E4C](v4);
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    *((_DWORD *)v5 + 7) = 0;
    v8 = dispatch_group_create();
    v9 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v8;

    dispatch_group_enter(*((dispatch_group_t *)v5 + 4));
  }

  return (AKCoordinatedDataBlock *)v5;
}

+ (id)startCoordinatingBlock:(id)a3
{
  id v3;
  AKCoordinatedDataBlock *v4;

  v3 = a3;
  v4 = -[AKCoordinatedDataBlock initWithBlock:]([AKCoordinatedDataBlock alloc], "initWithBlock:", v3);

  -[AKCoordinatedDataBlock _start](v4, "_start");
  return v4;
}

- (void)start
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19202F000, log, OS_LOG_TYPE_ERROR, "Called -[AKCoordinatedDataBlock start] after block has already been started. Ignoring call and not starting again.", v1, 2u);
}

uint64_t __31__AKCoordinatedDataBlock_start__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = 1;
  return result;
}

- (void)setCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD v7[2];
  void (*v8)(_QWORD *);
  void *v9;
  AKCoordinatedDataBlock *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __40__AKCoordinatedDataBlock_setCompletion___block_invoke;
  v9 = &unk_1E2E60FF8;
  v12 = &v13;
  v10 = self;
  v5 = v4;
  v11 = v5;
  v6 = v7;
  os_unfair_lock_lock(&self->_lock);
  v8(v6);

  os_unfair_lock_unlock(&self->_lock);
  if (*((_BYTE *)v14 + 24))
    dispatch_group_leave((dispatch_group_t)self->_group);

  _Block_object_dispose(&v13, 8);
}

void __40__AKCoordinatedDataBlock_setCompletion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 16) == 0;
  v2 = MEMORY[0x194022E4C](a1[5]);
  v3 = a1[4];
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

- (void)_start
{
  void (**block)(id, _QWORD *);
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  block = (void (**)(id, _QWORD *))self->_block;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__AKCoordinatedDataBlock__start__block_invoke;
  v4[3] = &unk_1E2E61020;
  objc_copyWeak(&v5, &location);
  block[2](block, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__AKCoordinatedDataBlock__start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_callCompletionWithData:error:", v6, v5);

}

- (void)_callCompletionWithData:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *group;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  group = self->_group;
  dispatch_get_global_queue(21, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__AKCoordinatedDataBlock__callCompletionWithData_error___block_invoke;
  v12[3] = &unk_1E2E61048;
  objc_copyWeak(&v15, &location);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_group_notify(group, v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __56__AKCoordinatedDataBlock__callCompletionWithData_error___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  os_unfair_lock_s *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__11;
    v15 = __Block_byref_object_dispose__11;
    v16 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v7 = __56__AKCoordinatedDataBlock__callCompletionWithData_error___block_invoke_2;
    v8 = &unk_1E2E602F8;
    v9 = WeakRetained;
    v10 = &v11;
    v4 = v6;
    os_unfair_lock_lock(v3 + 7);
    v7((uint64_t)v4);

    os_unfair_lock_unlock(v3 + 7);
    v5 = v12[5];
    if (v5)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    _Block_object_dispose(&v11, 8);

  }
}

void __56__AKCoordinatedDataBlock__callCompletionWithData_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x194022E4C](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
