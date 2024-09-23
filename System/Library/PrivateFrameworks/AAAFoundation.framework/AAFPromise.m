@implementation AAFPromise

uint64_t __18__AAFPromise_then__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "then:", a2);
}

- (id)then
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __18__AAFPromise_then__block_invoke;
  v3[3] = &unk_1E9946BA8;
  v3[4] = self;
  return (id)MEMORY[0x1D826F500](v3, a2);
}

void __25__AAFPromise_onComplete___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(void **)(v1 + 48);
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = (void *)MEMORY[0x1D826F500]();
    objc_msgSend(v2, "addObject:", v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_selfReference, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)catch:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __20__AAFPromise_catch___block_invoke;
  v8[3] = &unk_1E9946A90;
  v9 = v4;
  v5 = v4;
  -[AAFPromise _chain:](self, "_chain:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AAFPromise)initWithError:(id)a3
{
  id v4;
  id v5;
  AAFPromise *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__AAFPromise_initWithError___block_invoke;
  v8[3] = &unk_1E9946900;
  v9 = v4;
  v5 = v4;
  v6 = -[AAFPromise initWithBlock:](self, "initWithBlock:", v8);

  return v6;
}

void __39__AAFPromise__completeWithValue_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
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
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 48));
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = 0;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 16);
    *(_QWORD *)(v11 + 16) = 0;

  }
}

void __21__AAFPromise__chain___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_handleChainingResult:withCompletion:", v2, *(_QWORD *)(a1 + 48));

}

- (void)_handleChainingResult:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "onComplete:", v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = 0;
      v8 = v9;
    }
    else
    {
      v6 = v5;
      v7 = v9;
      v8 = 0;
    }
    (*((void (**)(id, id, id))v5 + 2))(v6, v7, v8);
  }

}

void __30__AAFPromise__startWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_completeWithValue:error:", v6, v5);

}

- (void)_completeWithValue:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AAFPromise__completeWithValue_error___block_invoke;
  block[3] = &unk_1E9946950;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

id __19__AAFPromise_then___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (AAFPromise)initWithValue:(id)a3
{
  id v4;
  id v5;
  AAFPromise *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__AAFPromise_initWithValue___block_invoke;
  v8[3] = &unk_1E9946900;
  v9 = v4;
  v5 = v4;
  v6 = -[AAFPromise initWithBlock:](self, "initWithBlock:", v8);

  return v6;
}

- (id)then:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __19__AAFPromise_then___block_invoke;
  v8[3] = &unk_1E9946A90;
  v9 = v4;
  v5 = v4;
  -[AAFPromise _chain:](self, "_chain:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_chain:(id)a3
{
  id v4;
  AAFPromise *v5;
  id v6;
  AAFPromise *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = [AAFPromise alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __21__AAFPromise__chain___block_invoke;
  v9[3] = &unk_1E99469A0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = -[AAFPromise initWithBlock:](v5, "initWithBlock:", v9);

  return v7;
}

- (AAFPromise)initWithBlock:(id)a3
{
  id v4;
  AAFPromise *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSMutableArray *callbacks;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAFPromise;
  v5 = -[AAFPromise init](&v12, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.AAAFoundation.AAFPromise", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    callbacks = v5->_callbacks;
    v5->_callbacks = (NSMutableArray *)v9;

    -[AAFPromise _startWithBlock:](v5, "_startWithBlock:", v4);
  }

  return v5;
}

- (void)_startWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = (void (**)(id, void *))a3;
  objc_storeStrong((id *)&self->_selfReference, self);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__AAFPromise__startWithBlock___block_invoke;
  v6[3] = &unk_1E9946928;
  objc_copyWeak(&v7, &location);
  v5 = (void *)MEMORY[0x1D826F500](v6);
  v4[2](v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __21__AAFPromise__chain___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __21__AAFPromise__chain___block_invoke_2;
  v7[3] = &unk_1E9946978;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "onComplete:", v7);

}

- (void)onComplete:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__AAFPromise_onComplete___block_invoke;
  v7[3] = &unk_1E9946A18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __28__AAFPromise_initWithValue___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
}

uint64_t __28__AAFPromise_initWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, *(_QWORD *)(a1 + 32));
}

id __20__AAFPromise_catch___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

uint64_t __19__AAFPromise_catch__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "catch:", a2);
}

- (id)catch
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __19__AAFPromise_catch__block_invoke;
  v3[3] = &unk_1E9946BF8;
  v3[4] = self;
  return (id)MEMORY[0x1D826F500](v3, a2);
}

- (void)abortWithError:(id)a3
{
  -[AAFPromise _completeWithValue:error:](self, "_completeWithValue:error:", 0, a3);
}

- (id)_placeBlock:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  AAFPromise *v8;
  id v9;
  id v10;
  AAFPromise *v11;
  _QWORD v13[4];
  id v14;
  AAFPromise *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = [AAFPromise alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34__AAFPromise__placeBlock_onQueue___block_invoke;
  v13[3] = &unk_1E99469F0;
  v14 = v7;
  v15 = self;
  v16 = v6;
  v9 = v6;
  v10 = v7;
  v11 = -[AAFPromise initWithBlock:](v8, "initWithBlock:", v13);

  return v11;
}

void __34__AAFPromise__placeBlock_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AAFPromise__placeBlock_onQueue___block_invoke_2;
  block[3] = &unk_1E99469C8;
  v4 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __34__AAFPromise__placeBlock_onQueue___block_invoke_2(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  (*(void (**)(void))(a1[5] + 16))();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleChainingResult:withCompletion:", v3, a1[6]);

}

- (void)onComplete:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__AAFPromise_onComplete_onQueue___block_invoke;
  v10[3] = &unk_1E9946A68;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[AAFPromise onComplete:](self, "onComplete:", v10);

}

void __33__AAFPromise_onComplete_onQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AAFPromise_onComplete_onQueue___block_invoke_2;
  block[3] = &unk_1E9946A40;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __33__AAFPromise_onComplete_onQueue___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)then:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __27__AAFPromise_then_onQueue___block_invoke;
  v12[3] = &unk_1E9946AE0;
  v13 = v7;
  v14 = v6;
  v12[4] = self;
  v8 = v7;
  v9 = v6;
  -[AAFPromise then:](self, "then:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __27__AAFPromise_then_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27__AAFPromise_then_onQueue___block_invoke_2;
  v10[3] = &unk_1E9946AB8;
  v5 = *(id *)(a1 + 48);
  v11 = v3;
  v12 = v5;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v4, "_placeBlock:onQueue:", v10, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __27__AAFPromise_then_onQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)catch:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __28__AAFPromise_catch_onQueue___block_invoke;
  v12[3] = &unk_1E9946AE0;
  v13 = v7;
  v14 = v6;
  v12[4] = self;
  v8 = v7;
  v9 = v6;
  -[AAFPromise catch:](self, "catch:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __28__AAFPromise_catch_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __28__AAFPromise_catch_onQueue___block_invoke_2;
  v10[3] = &unk_1E9946AB8;
  v5 = *(id *)(a1 + 48);
  v11 = v3;
  v12 = v5;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v4, "_placeBlock:onQueue:", v10, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __28__AAFPromise_catch_onQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)all:(id)a3
{
  void *v3;
  AAFPromise *v4;
  id v5;
  AAFPromise *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_msgSend(a3, "copy");
  v4 = [AAFPromise alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __18__AAFPromise_all___block_invoke;
  v8[3] = &unk_1E9946900;
  v9 = v3;
  v5 = v3;
  v6 = -[AAFPromise initWithBlock:](v4, "initWithBlock:", v8);

  return v6;
}

void __18__AAFPromise_all___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  dispatch_queue_t v22;
  id v23;
  NSObject *v24;
  id v25;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v5 = dispatch_group_create();
  v6 = dispatch_queue_create("com.apple.AAAFoundation.AAFPromise.all", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

      dispatch_group_enter(v5);
      ++v7;
    }
    while (objc_msgSend(*(id *)(a1 + 32), "count") > v7);
  }
  v9 = *(void **)(a1 + 32);
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __18__AAFPromise_all___block_invoke_2;
  v21[3] = &unk_1E9946B58;
  v11 = v3;
  v25 = v11;
  v22 = v6;
  v12 = v4;
  v23 = v12;
  v24 = v5;
  v13 = v5;
  v14 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v21);
  dispatch_get_global_queue(21, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __18__AAFPromise_all___block_invoke_5;
  v18[3] = &unk_1E9946B80;
  v19 = v12;
  v20 = v11;
  v16 = v12;
  v17 = v11;
  dispatch_group_notify(v13, v15, v18);

}

void __18__AAFPromise_all___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __18__AAFPromise_all___block_invoke_3;
  v6[3] = &unk_1E9946B30;
  v10 = a1[7];
  v7 = a1[4];
  v8 = a1[5];
  v11 = a3;
  v9 = a1[6];
  objc_msgSend(a2, "onComplete:", v6);

}

void __18__AAFPromise_all___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v9 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else if (v9)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __18__AAFPromise_all___block_invoke_4;
    block[3] = &unk_1E9946B08;
    v6 = *(NSObject **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 64);
    v11 = v7;
    v13 = v8;
    v12 = v9;
    dispatch_sync(v6, block);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __18__AAFPromise_all___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __18__AAFPromise_all___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (id)thenOnQueue
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __25__AAFPromise_thenOnQueue__block_invoke;
  v3[3] = &unk_1E9946BD0;
  v3[4] = self;
  return (id)MEMORY[0x1D826F500](v3, a2);
}

uint64_t __25__AAFPromise_thenOnQueue__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "then:onQueue:", a3, a2);
}

- (id)catchOnQueue
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__AAFPromise_catchOnQueue__block_invoke;
  v3[3] = &unk_1E9946BD0;
  v3[4] = self;
  return (id)MEMORY[0x1D826F500](v3, a2);
}

uint64_t __26__AAFPromise_catchOnQueue__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "catch:onQueue:", a3, a2);
}

@end
