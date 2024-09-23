@implementation Lt10zus2DOk3OfFf

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_reference;
}

void __34__Lt10zus2DOk3OfFf_sharedInstance__block_invoke()
{
  Lt10zus2DOk3OfFf *v0;
  void *v1;

  v0 = -[Lt10zus2DOk3OfFf initWithServiceName:]([Lt10zus2DOk3OfFf alloc], "initWithServiceName:", CFSTR("com.apple.asd.scoring"));
  v1 = (void *)sharedInstance_reference;
  sharedInstance_reference = (uint64_t)v0;

}

- (Lt10zus2DOk3OfFf)initWithServiceName:(id)a3
{
  id v4;
  Lt10zus2DOk3OfFf *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *disconnectionCallbacks;
  dispatch_queue_t v8;
  OS_dispatch_queue *syncQueue;
  uint64_t v10;
  NSXPCConnection *connection;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)Lt10zus2DOk3OfFf;
  v5 = -[Lt10zus2DOk3OfFf init](&v20, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    disconnectionCallbacks = v5->_disconnectionCallbacks;
    v5->_disconnectionCallbacks = v6;

    v8 = dispatch_queue_create("com.apple.asd.interrupt", 0);
    syncQueue = v5->_syncQueue;
    v5->_syncQueue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", v4, 4096);
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v10;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254616F68);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v12);

    objc_initWeak(&location, v5);
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __40__Lt10zus2DOk3OfFf_initWithServiceName___block_invoke;
    v17 = &unk_24C31EC18;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInterruptionHandler:](v5->_connection, "setInterruptionHandler:", &v14);
    -[NSXPCConnection resume](v5->_connection, "resume", v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __40__Lt10zus2DOk3OfFf_initWithServiceName___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "uTtwJoGUgL3N0GVz");

}

- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;
  _QWORD aBlock[4];
  id v23;

  v6 = a3;
  v7 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_41);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__Lt10zus2DOk3OfFf_JI0A3nkqsab9cUj8_completion___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v10 = v7;
  v23 = v10;
  v11 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __48__Lt10zus2DOk3OfFf_JI0A3nkqsab9cUj8_completion___block_invoke_3;
  v17[3] = &unk_24C31ECA8;
  objc_copyWeak(&v20, &location);
  v13 = v12;
  v18 = v13;
  v14 = v10;
  v19 = v14;
  v15 = _Block_copy(v17);
  objc_msgSend(v6, "toDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "k0p7Rchr49btq6wB:HY6FXG20397zwmVg:", v16, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

uint64_t __48__Lt10zus2DOk3OfFf_JI0A3nkqsab9cUj8_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__Lt10zus2DOk3OfFf_JI0A3nkqsab9cUj8_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id location;
  _QWORD aBlock[4];
  id v34;

  v14 = a3;
  v27 = a4;
  v15 = a5;
  v26 = a6;
  v16 = a7;
  v17 = a8;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_43);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__Lt10zus2DOk3OfFf_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v20 = v17;
  v34 = v20;
  v21 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __91__Lt10zus2DOk3OfFf_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_3;
  v28[3] = &unk_24C31ECF0;
  objc_copyWeak(&v31, &location);
  v23 = v22;
  v29 = v23;
  v24 = v20;
  v30 = v24;
  v25 = _Block_copy(v28);
  objc_msgSend(v18, "VE7BAlWGDSKrO5xc:hostChallenge:challengeResponse:seid:nonce:HY6FXG20397zwmVg:", v14, v27, v15, v26, v16, v25);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

uint64_t __91__Lt10zus2DOk3OfFf_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__Lt10zus2DOk3OfFf_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;
  _QWORD aBlock[4];
  id v22;

  v6 = a3;
  v7 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_45);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__Lt10zus2DOk3OfFf_ZfE6lVphNUVrZcKx_completion___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v10 = v7;
  v22 = v10;
  v11 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __48__Lt10zus2DOk3OfFf_ZfE6lVphNUVrZcKx_completion___block_invoke_3;
  v16[3] = &unk_24C31ED18;
  objc_copyWeak(&v19, &location);
  v13 = v12;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  v15 = _Block_copy(v16);
  objc_msgSend(v8, "f9MGfLOgnHPuKTrU:HY6FXG20397zwmVg:", v6, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

uint64_t __48__Lt10zus2DOk3OfFf_ZfE6lVphNUVrZcKx_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__Lt10zus2DOk3OfFf_ZfE6lVphNUVrZcKx_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)vffg4lwI2HftPvpO:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  _QWORD aBlock[4];
  id v19;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__Lt10zus2DOk3OfFf_vffg4lwI2HftPvpO___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v7 = v4;
  v19 = v7;
  v8 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __37__Lt10zus2DOk3OfFf_vffg4lwI2HftPvpO___block_invoke_3;
  v13[3] = &unk_24C31ECF0;
  objc_copyWeak(&v16, &location);
  v10 = v9;
  v14 = v10;
  v11 = v7;
  v15 = v11;
  v12 = _Block_copy(v13);
  objc_msgSend(v5, "xs00laTiKIpDUzDP:", v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

uint64_t __37__Lt10zus2DOk3OfFf_vffg4lwI2HftPvpO___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37__Lt10zus2DOk3OfFf_vffg4lwI2HftPvpO___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id location;
  _QWORD aBlock[4];
  id v44;

  v37 = a3;
  v20 = a4;
  v36 = a5;
  v35 = a6;
  v34 = a7;
  v33 = a8;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_48);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __218__Lt10zus2DOk3OfFf_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v27 = v24;
  v44 = v27;
  v28 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v38[0] = v26;
  v38[1] = 3221225472;
  v38[2] = __218__Lt10zus2DOk3OfFf_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_3;
  v38[3] = &unk_24C31ED60;
  objc_copyWeak(&v41, &location);
  v30 = v29;
  v39 = v30;
  v31 = v27;
  v40 = v31;
  v32 = _Block_copy(v38);
  objc_msgSend(v25, "SOUWv5VjPwXYslMm:noUfOiGjp1iQmKZX:pPGyXmlDbN3mzzHm:iSOZt67ioKsVcqQZ:hjCrdFOLMJN0Cc5Q:lE40aye8U2u533Ka:JRuZv6Feh9qwrGmN:Wn0aIR2B54NCtGQc:B3l3lS18BITy5E4L:UywAszL6AB8Y6LTJ:uNao9X8A82jVmQkK:completion:", v37, v20, v36, a9, a10, v21, v22, v23, v32);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

}

uint64_t __218__Lt10zus2DOk3OfFf_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __218__Lt10zus2DOk3OfFf_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  id v14;

  v14 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)updateRavioliWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD aBlock[4];
  id v17;
  id location;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__Lt10zus2DOk3OfFf_updateRavioliWithCompletion___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v7 = v4;
  v17 = v7;
  v8 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __48__Lt10zus2DOk3OfFf_updateRavioliWithCompletion___block_invoke_3;
  v12[3] = &unk_24C31EDA8;
  objc_copyWeak(&v15, &location);
  v10 = v9;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v5, "k4eQYhyzyebbQqys:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

uint64_t __48__Lt10zus2DOk3OfFf_updateRavioliWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__Lt10zus2DOk3OfFf_updateRavioliWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchConfigThrowingWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  NSXPCConnection *connection;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(id, _QWORD);
  id v20;
  _QWORD aBlock[4];
  id v22;
  id location;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = (void (**)(id, _QWORD))a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v5 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __54__Lt10zus2DOk3OfFf_fetchConfigThrowingWithCompletion___block_invoke;
  v24[3] = &unk_24C31EDD0;
  v24[4] = &v25;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v24);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v26[5];
  if (!(v8 | v7))
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", kCoreASErrorDomainCA);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -32, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v26[5];
    v26[5] = v11;

    v8 = v26[5];
  }
  if (v8)
  {
    v4[2](v4, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = v5;
    aBlock[1] = 3221225472;
    aBlock[2] = __54__Lt10zus2DOk3OfFf_fetchConfigThrowingWithCompletion___block_invoke_2;
    aBlock[3] = &unk_24C31EC80;
    v13 = v4;
    v22 = v13;
    v14 = _Block_copy(aBlock);
    -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __54__Lt10zus2DOk3OfFf_fetchConfigThrowingWithCompletion___block_invoke_3;
    v17[3] = &unk_24C31EDF8;
    objc_copyWeak(&v20, &location);
    v16 = v15;
    v18 = v16;
    v19 = v13;
    objc_msgSend((id)v7, "fetchConfigWithCompletionXPC:", v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(&v25, 8);
}

void __54__Lt10zus2DOk3OfFf_fetchConfigThrowingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __54__Lt10zus2DOk3OfFf_fetchConfigThrowingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__Lt10zus2DOk3OfFf_fetchConfigThrowingWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchConfigWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD aBlock[4];
  id v17;
  id location;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_54);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__Lt10zus2DOk3OfFf_fetchConfigWithCompletion___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v7 = v4;
  v17 = v7;
  v8 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __46__Lt10zus2DOk3OfFf_fetchConfigWithCompletion___block_invoke_3;
  v12[3] = &unk_24C31EDF8;
  objc_copyWeak(&v15, &location);
  v10 = v9;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v5, "fetchConfigWithCompletionXPC:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

uint64_t __46__Lt10zus2DOk3OfFf_fetchConfigWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__Lt10zus2DOk3OfFf_fetchConfigWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)updateGeoCodingsForAddresses:(id)a3 locations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_55);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v7)
  {
    v9 = (void *)MEMORY[0x24BDD1618];
    v13[0] = CFSTR("addresses");
    v13[1] = CFSTR("locations");
    v14[0] = v6;
    v14[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v9, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "updateGeoCodingsXPC:completion:", v11, &__block_literal_global_62);
  }

}

- (void)fetchGeoCodingsForAddresses:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD aBlock[4];
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_63);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__Lt10zus2DOk3OfFf_fetchGeoCodingsForAddresses_completion___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v10 = v7;
  v23 = v10;
  v11 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __59__Lt10zus2DOk3OfFf_fetchGeoCodingsForAddresses_completion___block_invoke_3;
  v17[3] = &unk_24C31ECF0;
  objc_copyWeak(&v20, &location);
  v15 = v12;
  v18 = v15;
  v16 = v10;
  v19 = v16;
  objc_msgSend(v8, "fetchGeoCodingsForAddressesXPC:completion:", v13, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

uint64_t __59__Lt10zus2DOk3OfFf_fetchGeoCodingsForAddresses_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__Lt10zus2DOk3OfFf_fetchGeoCodingsForAddresses_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char isKindOfClass;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
  {
    if (a3 || !v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_opt_self();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      +[ASGeoCodingKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](ASGeoCodingKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v7, v5, &v21);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v21;

      if (v9 || !v8)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              objc_opt_self();
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

                goto LABEL_18;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
            if (v12)
              continue;
            break;
          }
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_18:
        v9 = 0;
      }

    }
  }

}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id location;
  _QWORD aBlock[4];
  id v27;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = a6;
  v13 = a7;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_67);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__Lt10zus2DOk3OfFf_llNEghuIdfPH7O8I_all_pregeneration_workflowID_completion___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v16 = v13;
  v27 = v16;
  v17 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __77__Lt10zus2DOk3OfFf_llNEghuIdfPH7O8I_all_pregeneration_workflowID_completion___block_invoke_3;
  v21[3] = &unk_24C31EDA8;
  objc_copyWeak(&v24, &location);
  v19 = v18;
  v22 = v19;
  v20 = v16;
  v23 = v20;
  objc_msgSend(v14, "llNEghuIdfPH7O8I:all:pregeneration:workflowID:completion:", v10, v9, v8, v12, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

uint64_t __77__Lt10zus2DOk3OfFf_llNEghuIdfPH7O8I_all_pregeneration_workflowID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__Lt10zus2DOk3OfFf_llNEghuIdfPH7O8I_all_pregeneration_workflowID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4
{
  NSXPCConnection *connection;
  id v7;
  id v8;
  void *v9;
  id v10;

  connection = self->_connection;
  v7 = a4;
  v8 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_68);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", &__block_literal_global_69);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "djoNSwl5j57W5mfl:eqF2XJh3hHBJQf2K:", v8, v7);

  -[Lt10zus2DOk3OfFf l7UrdRfCzeduYqtA:](self, "l7UrdRfCzeduYqtA:", v9);
}

- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;
  _QWORD aBlock[4];
  id v21;

  v6 = a3;
  v7 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_70);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__Lt10zus2DOk3OfFf_evrtH713YbFfEOzk_completion___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v10 = v7;
  v21 = v10;
  v11 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __48__Lt10zus2DOk3OfFf_evrtH713YbFfEOzk_completion___block_invoke_3;
  v15[3] = &unk_24C31EF00;
  objc_copyWeak(&v18, &location);
  v13 = v12;
  v16 = v13;
  v14 = v10;
  v17 = v14;
  objc_msgSend(v8, "rGvculjlqIwBJaoX:completion:", v6, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

uint64_t __48__Lt10zus2DOk3OfFf_evrtH713YbFfEOzk_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __48__Lt10zus2DOk3OfFf_evrtH713YbFfEOzk_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)registerICloudLoginWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD aBlock[4];
  id v17;
  id location;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_72);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__Lt10zus2DOk3OfFf_registerICloudLoginWithCompletion___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v7 = v4;
  v17 = v7;
  v8 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __54__Lt10zus2DOk3OfFf_registerICloudLoginWithCompletion___block_invoke_3;
  v12[3] = &unk_24C31EDA8;
  objc_copyWeak(&v15, &location);
  v10 = v9;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v5, "registerICloudLoginWithCompletionXPC:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

uint64_t __54__Lt10zus2DOk3OfFf_registerICloudLoginWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__Lt10zus2DOk3OfFf_registerICloudLoginWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)unregisterICloudLoginWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD aBlock[4];
  id v17;
  id location;

  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_73);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__Lt10zus2DOk3OfFf_unregisterICloudLoginWithCompletion___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v7 = v4;
  v17 = v7;
  v8 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __56__Lt10zus2DOk3OfFf_unregisterICloudLoginWithCompletion___block_invoke_3;
  v12[3] = &unk_24C31EDA8;
  objc_copyWeak(&v15, &location);
  v10 = v9;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v5, "unregisterICloudLoginWithCompletionXPC:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

uint64_t __56__Lt10zus2DOk3OfFf_unregisterICloudLoginWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__Lt10zus2DOk3OfFf_unregisterICloudLoginWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;
  _QWORD aBlock[4];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_74);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__Lt10zus2DOk3OfFf_ofLBc0SV56ddaijH_i7D0Lridvo8oYoNd_completion___block_invoke_2;
  aBlock[3] = &unk_24C31EC80;
  v13 = v10;
  v24 = v13;
  v14 = _Block_copy(aBlock);
  -[Lt10zus2DOk3OfFf BFzukpKGO3cStNGp:](self, "BFzukpKGO3cStNGp:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __65__Lt10zus2DOk3OfFf_ofLBc0SV56ddaijH_i7D0Lridvo8oYoNd_completion___block_invoke_3;
  v18[3] = &unk_24C31ECF0;
  objc_copyWeak(&v21, &location);
  v16 = v15;
  v19 = v16;
  v17 = v13;
  v20 = v17;
  objc_msgSend(v11, "pRo6qBDnfEL0sBNs:i7D0Lridvo8oYoNd:completion:", v8, v9, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

uint64_t __65__Lt10zus2DOk3OfFf_ofLBc0SV56ddaijH_i7D0Lridvo8oYoNd_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __65__Lt10zus2DOk3OfFf_ofLBc0SV56ddaijH_i7D0Lridvo8oYoNd_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "l7UrdRfCzeduYqtA:", *(_QWORD *)(a1 + 32)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)BFzukpKGO3cStNGp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *syncQueue;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__Lt10zus2DOk3OfFf_BFzukpKGO3cStNGp___block_invoke;
  block[3] = &unk_24C31EF68;
  block[4] = self;
  v15 = v4;
  v8 = v6;
  v14 = v8;
  v9 = v4;
  dispatch_sync(syncQueue, block);
  v10 = v14;
  v11 = v8;

  return v11;
}

void __37__Lt10zus2DOk3OfFf_BFzukpKGO3cStNGp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

}

- (BOOL)l7UrdRfCzeduYqtA:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__Lt10zus2DOk3OfFf_l7UrdRfCzeduYqtA___block_invoke;
  block[3] = &unk_24C31EF90;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

uint64_t __37__Lt10zus2DOk3OfFf_l7UrdRfCzeduYqtA___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 != 0;

  return objc_msgSend(*(id *)(a1[4] + 16), "removeObjectForKey:", a1[5]);
}

- (void)uTtwJoGUgL3N0GVz
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__Lt10zus2DOk3OfFf_uTtwJoGUgL3N0GVz__block_invoke;
  block[3] = &unk_24C31EFB8;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

void __36__Lt10zus2DOk3OfFf_uTtwJoGUgL3N0GVz__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", kCoreASErrorDomainCA);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -31, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_disconnectionCallbacks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
