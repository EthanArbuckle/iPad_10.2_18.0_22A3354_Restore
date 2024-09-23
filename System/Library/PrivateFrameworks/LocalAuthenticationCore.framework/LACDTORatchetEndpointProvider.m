@implementation LACDTORatchetEndpointProvider

- (LACDTORatchetEndpointProvider)initWithContextProvider:(id)a3
{
  id v4;
  LACDTORatchetEndpointProvider *v5;
  LACDTORatchetEndpointProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LACDTORatchetEndpointProvider;
  v5 = -[LACDTORatchetEndpointProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_contextProvider, v4);

  return v6;
}

- (id)endpoint:(id *)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
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
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contextProvider);
  objc_msgSend(WeakRetained, "createContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __42__LACDTORatchetEndpointProvider_endpoint___block_invoke;
    v10[3] = &unk_2510C10F0;
    v12 = &v14;
    v13 = &v20;
    v11 = v5;
    objc_msgSend(v11, "bootstrapServiceType:completionHandler:", CFSTR("kLAServiceTypeRatchet"), v10);
    v6 = v11;
  }
  else
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Unable to create context"));
    v7 = objc_claimAutoreleasedReturnValue();
    v6 = (id)v15[5];
    v15[5] = v7;
  }

  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __42__LACDTORatchetEndpointProvider_endpoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contextProvider);
}

@end
