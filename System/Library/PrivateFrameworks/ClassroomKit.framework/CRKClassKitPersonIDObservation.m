@implementation CRKClassKitPersonIDObservation

- (void)dealloc
{
  objc_super v3;

  -[CRKClassKitPersonIDObservation cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CRKClassKitPersonIDObservation;
  -[CRKClassKitPersonIDObservation dealloc](&v3, sel_dealloc);
}

- (CRKClassKitPersonIDObservation)initWithPersonIDs:(id)a3 classKitFacade:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKClassKitPersonIDObservation *v11;
  CRKClassKitPersonIDObservation *v12;
  uint64_t v13;
  CRKClassKitDataObserver *dataObserver;
  NSObject *v15;
  _QWORD v17[4];
  NSObject *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRKClassKitPersonIDObservation;
  v11 = -[CRKClassKitPersonIDObservation init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_classKitFacade, a4);
    -[CRKClassKitFacade personObserverWithPersonIDs:sortDescriptors:](v12->_classKitFacade, "personObserverWithPersonIDs:sortDescriptors:", v8, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    dataObserver = v12->_dataObserver;
    v12->_dataObserver = (CRKClassKitDataObserver *)v13;

    if (v12->_dataObserver)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __73__CRKClassKitPersonIDObservation_initWithPersonIDs_classKitFacade_block___block_invoke;
      v17[3] = &unk_24D9C81F0;
      v18 = v10;
      -[CRKClassKitDataObserver setDataChanged:](v12->_dataObserver, "setDataChanged:", v17);
      -[CRKClassKitFacade registerDataObserver:](v12->_classKitFacade, "registerDataObserver:", v12->_dataObserver);
      v15 = v18;
    }
    else
    {
      _CRKLogASM_7();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CRKClassKitPersonIDObservation initWithPersonIDs:classKitFacade:block:].cold.1(v15);
    }

  }
  return v12;
}

void __73__CRKClassKitPersonIDObservation_initWithPersonIDs_classKitFacade_block___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__CRKClassKitPersonIDObservation_initWithPersonIDs_classKitFacade_block___block_invoke_2;
  block[3] = &unk_24D9C81C8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __73__CRKClassKitPersonIDObservation_initWithPersonIDs_classKitFacade_block___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _CRKLogASM_7();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_218C99000, v2, OS_LOG_TYPE_INFO, "ClassKit person data observer fired", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancel
{
  void *v3;
  void *v4;
  id v5;

  -[CRKClassKitPersonIDObservation dataObserver](self, "dataObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CRKClassKitPersonIDObservation classKitFacade](self, "classKitFacade");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CRKClassKitPersonIDObservation dataObserver](self, "dataObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deregisterDataObserver:", v4);

  }
}

- (CRKClassKitFacade)classKitFacade
{
  return self->_classKitFacade;
}

- (CRKClassKitDataObserver)dataObserver
{
  return self->_dataObserver;
}

- (void)setDataObserver:(id)a3
{
  objc_storeStrong((id *)&self->_dataObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataObserver, 0);
  objc_storeStrong((id *)&self->_classKitFacade, 0);
}

- (void)initWithPersonIDs:(os_log_t)log classKitFacade:block:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "Person data observer is nil", v1, 2u);
}

@end
