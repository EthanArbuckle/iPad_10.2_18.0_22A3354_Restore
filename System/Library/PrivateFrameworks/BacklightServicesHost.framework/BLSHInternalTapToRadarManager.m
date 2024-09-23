@implementation BLSHInternalTapToRadarManager

- (BLSHInternalTapToRadarManager)init
{

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BLSHInternalTapToRadarManager;
  return -[BLSHInternalTapToRadarManager init](&v3, sel_init);
}

+ (id)sharedTapToRadarManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__BLSHInternalTapToRadarManager_sharedTapToRadarManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTapToRadarManager__onceToken != -1)
    dispatch_once(&sharedTapToRadarManager__onceToken, block);
  return (id)sharedTapToRadarManager___ttrManager;
}

void __56__BLSHInternalTapToRadarManager_sharedTapToRadarManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedTapToRadarManager___ttrManager;
  sharedTapToRadarManager___ttrManager = v1;

}

- (void)requestTapToRadar:(id)a3 log:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a3;
  v11 = a4;
  v12 = a5;
  v8 = v7;
  v9 = v11;
  v10 = v12;
  BSDispatchMain();

}

void __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v4;
  NSObject *v5;
  BLSHInternalTapToRadarDialog *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  void (**v12)(_QWORD, _QWORD);
  _QWORD v13[4];
  id v14;

  v2 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke_2;
  v13[3] = &unk_24D1BD170;
  v14 = *(id *)(a1 + 56);
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199D2BD8](v13);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(a1 + 40);
  if (*(_QWORD *)(v4 + 8))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_ERROR))
      __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke_cold_1(v5);
    v3[2](v3, 1);
  }
  else
  {
    objc_storeStrong((id *)(v4 + 16), *(id *)(a1 + 40));
    v6 = -[BLSHInternalTapToRadarDialog initWithDescriptor:log:]([BLSHInternalTapToRadarDialog alloc], "initWithDescriptor:log:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v6;

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 8);
    v11[0] = v2;
    v11[1] = 3221225472;
    v11[2] = __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke_3;
    v11[3] = &unk_24D1BD198;
    v11[4] = v9;
    v12 = v3;
    objc_msgSend(v10, "presentWithCompletion:", v11);

  }
}

uint64_t __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_ttrDialog, 0);
}

void __66__BLSHInternalTapToRadarManager_requestTapToRadar_log_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2145AC000, log, OS_LOG_TYPE_ERROR, "could not display Tap-To-Radar dialog as another such dialog was already being displayed", v1, 2u);
}

@end
