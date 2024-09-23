@implementation NFPromise

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seal, 0);
}

- (id)timeoutAfter:(double)a3
{
  void *v5;
  void *v6;

  zalgo();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFPromise timeoutAfter:on:](self, "timeoutAfter:on:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)timeoutAfter:(double)a3 on:(id)a4
{
  id v6;
  NFPromise *v7;
  id v8;
  NFPromise *v9;
  _QWORD v11[5];
  id v12;
  double v13;

  v6 = a4;
  v7 = [NFPromise alloc];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke;
  v11[3] = &unk_24CE723F0;
  v11[4] = self;
  v12 = v6;
  v13 = a3;
  v8 = v6;
  v9 = -[NFPromise initWithResolver:](v7, "initWithResolver:", v11);

  return v9;
}

- (id)thenOn:(id)a3 then:(id)a4
{
  id v6;
  id v7;
  NFPromise *v8;
  id v9;
  id v10;
  NFPromise *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = [NFPromise alloc];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __25__NFPromise_thenOn_then___block_invoke;
  v13[3] = &unk_24CE72110;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = -[NFPromise initWithResolver:](v8, "initWithResolver:", v13);

  return v11;
}

- (NFPromise)initWithResolver:(id)a3
{
  id v4;
  NFPromise *v5;
  NFPromiseSeal *v6;
  NFPromiseSeal *seal;
  uint64_t v8;
  _QWORD v10[4];
  NFPromise *v11;
  _QWORD v12[4];
  NFPromise *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NFPromise;
  v5 = -[NFPromise init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(NFPromiseSeal);
    seal = v5->_seal;
    v5->_seal = v6;

    v8 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __30__NFPromise_initWithResolver___block_invoke;
    v12[3] = &unk_24CE72070;
    v13 = v5;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __30__NFPromise_initWithResolver___block_invoke_2;
    v10[3] = &unk_24CE72098;
    v11 = v13;
    (*((void (**)(id, _QWORD *, _QWORD *))v4 + 2))(v4, v12, v10);

  }
  return v5;
}

void __25__NFPromise_thenOn_then___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "seal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __25__NFPromise_thenOn_then___block_invoke_2;
  v11[3] = &unk_24CE720E8;
  v8 = a1[5];
  v13 = a1[6];
  v12 = a1[5];
  v14 = v6;
  v15 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "resolveOn:reject:resolve:", v8, v10, v11);

}

void __30__NFPromise_initWithResolver___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "seal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolve:", v3);

}

- (NFPromiseSeal)seal
{
  return self->_seal;
}

void __25__NFPromise_thenOn_then___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[8];

  v10 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v4 = v3) != 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __25__NFPromise_thenOn_then___block_invoke_3;
    v11[3] = &unk_24CE720C0;
    v5 = v4;
    v11[4] = v5;
    v6 = *(id *)(a1 + 32);
    v11[5] = v6;
    v7 = *(id *)(a1 + 48);
    v11[6] = v7;
    v8 = *(id *)(a1 + 56);
    v11[7] = v8;
    __25__NFPromise_thenOn_then___block_invoke_3((uint64_t)v11);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = 0;
    else
      v9 = v3;
    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v9);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NFPromise setSeal:](self, "setSeal:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NFPromise;
  -[NFPromise dealloc](&v3, sel_dealloc);
}

- (void)setSeal:(id)a3
{
  objc_storeStrong((id *)&self->_seal, a3);
}

void __25__NFPromise_thenOn_then___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "seal");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveOn:reject:resolve:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

id __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_5;
  v9[3] = &unk_24CE723C8;
  v4 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v5 = v3;
  v10 = v5;
  (*(void (**)(uint64_t, _QWORD *))(v4 + 16))(v4, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

uint64_t __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_3;
  v7[3] = &unk_24CE724E0;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "performWithLockSync:", v7);

}

void __38__NFPromise_Timeout__timeoutAfter_on___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NFUnfairLock *v7;
  uint64_t v8;
  NFUnfairLock *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  qos_class_t v26;
  uint64_t v27;
  dispatch_time_t v28;
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  NFUnfairLock *v41;
  _QWORD *v42;
  _QWORD v43[3];
  char v44;

  v5 = a2;
  v6 = a3;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v7 = -[NFUnfairLock initWithOptions:]([NFUnfairLock alloc], "initWithOptions:", 1);
  v8 = MEMORY[0x24BDAC760];
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_2;
  v40[3] = &unk_24CE72508;
  v9 = v7;
  v41 = v9;
  v42 = v43;
  v10 = (void *)MEMORY[0x212BF7858](v40);
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v37[0] = v8;
  v37[1] = 3221225472;
  v37[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_4;
  v37[3] = &unk_24CE72530;
  v13 = v10;
  v38 = v13;
  v14 = v5;
  v39 = v14;
  v15 = (id)objc_msgSend(v11, "thenOn:then:", v12, v37);
  v16 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v34[0] = v8;
  v34[1] = 3221225472;
  v34[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_6;
  v34[3] = &unk_24CE72558;
  v18 = v13;
  v35 = v18;
  v19 = v6;
  v36 = v19;
  v20 = (id)objc_msgSend(v16, "errorOn:error:", v17, v34);
  v21 = *(id *)(a1 + 40);
  v22 = *(void **)(a1 + 40);
  zalgo();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 == v23)
  {

LABEL_5:
    v26 = qos_class_self();
    dispatch_get_global_queue(v26, 0);
    v27 = objc_claimAutoreleasedReturnValue();

    v21 = v27;
    goto LABEL_6;
  }
  v24 = *(void **)(a1 + 40);
  zalgoIfMain();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24 == v25)
    goto LABEL_5;
LABEL_6:
  v28 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_8;
  block[3] = &unk_24CE72580;
  v32 = v18;
  v33 = v19;
  v29 = v19;
  v30 = v18;
  dispatch_after(v28, v21, block);

  _Block_object_dispose(v43, 8);
}

+ (id)asVoid
{
  NFPromise *v2;
  void *v3;
  NFPromise *v4;

  v2 = [NFPromise alloc];
  v3 = (void *)objc_opt_new();
  v4 = -[NFPromise initWithValue:](v2, "initWithValue:", v3);

  return v4;
}

- (NFPromise)initWithValue:(id)a3
{
  id v4;
  NFPromise *v5;
  NFPromiseSeal *v6;
  NFPromiseSeal *seal;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPromise;
  v5 = -[NFPromise init](&v9, sel_init);
  if (v5)
  {
    v6 = -[NFPromiseSeal initWithValue:]([NFPromiseSeal alloc], "initWithValue:", v4);
    seal = v5->_seal;
    v5->_seal = v6;

  }
  return v5;
}

- (id)alwaysOn:(id)a3 always:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[NFPromise seal](self, "seal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alwaysOn:always:", v7, v6);

  return self;
}

- (id)errorOn:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[NFPromise seal](self, "seal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolveOn:reject:resolve:", v7, v6, &__block_literal_global_20);

  return self;
}

+ (id)firstly:(id)a3
{
  return (id)(*((uint64_t (**)(id))a3 + 2))(a3);
}

- (NFPromise)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NFPromise init]";
    v9 = 2080;
    v10 = "NFPromise.m";
    v11 = 1024;
    v12 = 56;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_212A0B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NFPromise init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

void __30__NFPromise_initWithResolver___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "seal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reject:", v3);

}

+ (NFPromise)new
{
  return (NFPromise *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:", 0);
}

- (NFPromise)initWithError:(id)a3
{
  id v4;
  NFPromise *v5;
  NFPromiseSeal *v6;
  NFPromiseSeal *seal;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPromise;
  v5 = -[NFPromise init](&v9, sel_init);
  if (v5)
  {
    v6 = -[NFPromiseSeal initWithError:]([NFPromiseSeal alloc], "initWithError:", v4);
    seal = v5->_seal;
    v5->_seal = v6;

  }
  return v5;
}

- (id)then:(id)a3
{
  return -[NFPromise thenOn:then:](self, "thenOn:then:", MEMORY[0x24BDAC9B8], a3);
}

- (id)error:(id)a3
{
  return -[NFPromise errorOn:error:](self, "errorOn:error:", MEMORY[0x24BDAC9B8], a3);
}

- (id)always:(id)a3
{
  return -[NFPromise alwaysOn:always:](self, "alwaysOn:always:", MEMORY[0x24BDAC9B8], a3);
}

- (id)then
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __17__NFPromise_then__block_invoke;
  v3[3] = &unk_24CE72178;
  v3[4] = self;
  return (id)MEMORY[0x212BF7858](v3, a2);
}

uint64_t __17__NFPromise_then__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "then:", a2);
}

- (id)thenOn
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __19__NFPromise_thenOn__block_invoke;
  v3[3] = &unk_24CE721A0;
  v3[4] = self;
  return (id)MEMORY[0x212BF7858](v3, a2);
}

uint64_t __19__NFPromise_thenOn__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "thenOn:then:", a2, a3);
}

- (id)pipe
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __17__NFPromise_pipe__block_invoke;
  v3[3] = &unk_24CE721F0;
  v3[4] = self;
  return (id)MEMORY[0x212BF7858](v3, a2);
}

id __17__NFPromise_pipe__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __17__NFPromise_pipe__block_invoke_2;
  v8[3] = &unk_24CE721C8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "then:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __17__NFPromise_pipe__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)pipeOn
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __19__NFPromise_pipeOn__block_invoke;
  v3[3] = &unk_24CE72218;
  v3[4] = self;
  return (id)MEMORY[0x212BF7858](v3, a2);
}

id __19__NFPromise_pipeOn__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __19__NFPromise_pipeOn__block_invoke_2;
  v10[3] = &unk_24CE721C8;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "thenOn:then:", a2, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __19__NFPromise_pipeOn__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)error
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__NFPromise_error__block_invoke;
  v3[3] = &unk_24CE72240;
  v3[4] = self;
  return (id)MEMORY[0x212BF7858](v3, a2);
}

id __18__NFPromise_error__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  zalgoIfMain();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorOn:error:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)errorOn
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __20__NFPromise_errorOn__block_invoke;
  v3[3] = &unk_24CE72268;
  v3[4] = self;
  return (id)MEMORY[0x212BF7858](v3, a2);
}

uint64_t __20__NFPromise_errorOn__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "errorOn:error:", a2, a3);
}

- (id)resolve
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __20__NFPromise_resolve__block_invoke;
  v3[3] = &unk_24CE722E0;
  v3[4] = self;
  return (id)MEMORY[0x212BF7858](v3, a2);
}

id __20__NFPromise_resolve__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __20__NFPromise_resolve__block_invoke_2;
  v8[3] = &unk_24CE722B8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "then:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

NFPromise *__20__NFPromise_resolve__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NFPromise *v4;
  id v5;
  id v6;
  NFPromise *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = [NFPromise alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __20__NFPromise_resolve__block_invoke_3;
  v9[3] = &unk_24CE72290;
  v5 = *(id *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  v7 = -[NFPromise initWithResolver:](v4, "initWithResolver:", v9);

  return v7;
}

uint64_t __20__NFPromise_resolve__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

- (id)resolveOn
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __22__NFPromise_resolveOn__block_invoke;
  v3[3] = &unk_24CE72308;
  v3[4] = self;
  return (id)MEMORY[0x212BF7858](v3, a2);
}

id __22__NFPromise_resolveOn__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __22__NFPromise_resolveOn__block_invoke_2;
  v10[3] = &unk_24CE722B8;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "thenOn:then:", a2, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

NFPromise *__22__NFPromise_resolveOn__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NFPromise *v4;
  id v5;
  id v6;
  NFPromise *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = [NFPromise alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __22__NFPromise_resolveOn__block_invoke_3;
  v9[3] = &unk_24CE72290;
  v5 = *(id *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  v7 = -[NFPromise initWithResolver:](v4, "initWithResolver:", v9);

  return v7;
}

uint64_t __22__NFPromise_resolveOn__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

- (id)delay
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __18__NFPromise_delay__block_invoke;
  v3[3] = &unk_24CE72350;
  v3[4] = self;
  return (id)MEMORY[0x212BF7858](v3, a2);
}

id __18__NFPromise_delay__block_invoke(uint64_t a1, double a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __18__NFPromise_delay__block_invoke_2;
  v4[3] = &__block_descriptor_40_e8__16__0_8l;
  *(double *)&v4[4] = a2;
  objc_msgSend(v2, "then:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __18__NFPromise_delay__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[NFPromise asDelay:withValue:](NFPromise, "asDelay:withValue:", a2, *(double *)(a1 + 32));
}

- (id)delayOn
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __20__NFPromise_delayOn__block_invoke;
  v3[3] = &unk_24CE723A0;
  v3[4] = self;
  return (id)MEMORY[0x212BF7858](v3, a2);
}

id __20__NFPromise_delayOn__block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  double v12;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __20__NFPromise_delayOn__block_invoke_2;
  v10[3] = &unk_24CE72378;
  v12 = a3;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "thenOn:then:", v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __20__NFPromise_delayOn__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[NFPromise asDelay:onQueue:withValue:](NFPromise, "asDelay:onQueue:withValue:", *(_QWORD *)(a1 + 32), a2, *(double *)(a1 + 40));
}

+ (id)asVoid:(id)a3
{
  id v3;
  NFPromise *v4;

  v3 = a3;
  v4 = -[NFPromise initWithError:]([NFPromise alloc], "initWithError:", v3);

  return v4;
}

+ (id)asDelay:(double)a3 withValue:(id)a4
{
  return +[NFPromise asDelay:onQueue:withValue:](NFPromise, "asDelay:onQueue:withValue:", MEMORY[0x24BDAC9B8], a4, a3);
}

+ (id)asDelay:(double)a3 withError:(id)a4
{
  return +[NFPromise asDelay:onQueue:withError:](NFPromise, "asDelay:onQueue:withError:", MEMORY[0x24BDAC9B8], a4, a3);
}

+ (id)asDelay:(double)a3 onQueue:(id)a4 withValue:(id)a5
{
  id v7;
  id v8;
  NFPromise *v9;
  id v10;
  id v11;
  NFPromise *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  double v17;

  v7 = a4;
  v8 = a5;
  v9 = [NFPromise alloc];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__NFPromise_Delay__asDelay_onQueue_withValue___block_invoke;
  v14[3] = &unk_24CE723F0;
  v17 = a3;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = -[NFPromise initWithResolver:](v9, "initWithResolver:", v14);

  return v12;
}

void __46__NFPromise_Delay__asDelay_onQueue_withValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__NFPromise_Delay__asDelay_onQueue_withValue___block_invoke_2;
  v7[3] = &unk_24CE723C8;
  v9 = v3;
  v5 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v6 = v3;
  dispatch_after(v4, v5, v7);

}

uint64_t __46__NFPromise_Delay__asDelay_onQueue_withValue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)asDelay:(double)a3 onQueue:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  NFPromise *v9;
  id v10;
  id v11;
  NFPromise *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  double v17;

  v7 = a4;
  v8 = a5;
  v9 = [NFPromise alloc];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__NFPromise_Delay__asDelay_onQueue_withError___block_invoke;
  v14[3] = &unk_24CE723F0;
  v17 = a3;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = -[NFPromise initWithResolver:](v9, "initWithResolver:", v14);

  return v12;
}

void __46__NFPromise_Delay__asDelay_onQueue_withError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  dispatch_time_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v5 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__NFPromise_Delay__asDelay_onQueue_withError___block_invoke_2;
  v8[3] = &unk_24CE723C8;
  v10 = v4;
  v6 = *(NSObject **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v7 = v4;
  dispatch_after(v5, v6, v8);

}

uint64_t __46__NFPromise_Delay__asDelay_onQueue_withError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_7;
  v8[3] = &unk_24CE723C8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v6 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
  v7 = v3;
  v6(v4, v8);

}

uint64_t __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_9;
  v2[3] = &unk_24CE72440;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, _QWORD *))(v1 + 16))(v1, v2);

}

void __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_9(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc(MEMORY[0x24BDD1540]);
  v3 = (id)objc_msgSend(v2, "initWithDomain:code:userInfo:", kNFPromiseErrorDomain, kNFPromiseTimeoutErrorCode, MEMORY[0x24BDBD1B8]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);

}

@end
