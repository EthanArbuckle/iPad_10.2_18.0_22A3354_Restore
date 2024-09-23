@implementation AVVCKeepAliveManager

- (AVVCKeepAliveManager)init
{
  AVVCKeepAliveManager *v2;
  AVVCKeepAliveManager *v3;
  AVVCKeepAliveImpl *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *mKeepAliveDispatchQueue;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)AVVCKeepAliveManager;
  v2 = -[AVVCKeepAliveManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_impl = 0;
    if (GetImplType(void)::onceToken != -1)
      dispatch_once(&GetImplType(void)::onceToken, &__block_literal_global_5389);
    if (GetImplType(void)::type)
      goto LABEL_13;
    v4 = (AVVCKeepAliveImpl *)operator new();
    v4->var0 = (void **)off_1E3BE92E0;
    v4[1].var0 = 0;
    if (kAVVCScope)
    {
      v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_12:
        v3->_impl = v4;
LABEL_13:
        dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = dispatch_queue_create("KeepAliveDispatchQueue", v7);
        mKeepAliveDispatchQueue = v3->mKeepAliveDispatchQueue;
        v3->mKeepAliveDispatchQueue = (OS_dispatch_queue *)v8;

        return v3;
      }
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "AVVCKeepAliveImpl_AudioQueue.mm";
      v14 = 1024;
      v15 = 20;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCKeepAliveImpl_AudioQueue created", buf, 0x12u);
    }

    goto LABEL_12;
  }
  return v3;
}

- (id)getDispatchQueue
{
  return self->mKeepAliveDispatchQueue;
}

- (void)createWithCompletion:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = ((uint64_t (*)(AVVCKeepAliveImpl *))*self->_impl->var0)(self->_impl);
  v5 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v6);

    v5 = v7;
  }

}

- (void)startWithCompletion:(id)a3
{
  id v4;
  AVVCKeepAliveImpl *impl;
  NSObject *mKeepAliveDispatchQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  AVVCKeepAliveImpl *v10;

  v4 = a3;
  impl = self->_impl;
  mKeepAliveDispatchQueue = self->mKeepAliveDispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__AVVCKeepAliveManager_startWithCompletion___block_invoke;
  v8[3] = &unk_1E3BECB48;
  v9 = v4;
  v10 = impl;
  v7 = v4;
  dispatch_async(mKeepAliveDispatchQueue, v8);

}

- (void)stopWithCompletion:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (*((uint64_t (**)(AVVCKeepAliveImpl *))self->_impl->var0 + 2))(self->_impl);
  v5 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v6);

    v5 = v7;
  }

}

- (void)destroyWithCompletion:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (*((uint64_t (**)(AVVCKeepAliveImpl *))self->_impl->var0 + 3))(self->_impl);
  v5 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v6);

    v5 = v7;
  }

}

- (void)dealloc
{
  AVVCKeepAliveImpl *impl;
  OS_dispatch_queue *mKeepAliveDispatchQueue;
  NSObject *v5;
  id v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
    (*((void (**)(AVVCKeepAliveImpl *, SEL))impl->var0 + 5))(impl, a2);
  mKeepAliveDispatchQueue = self->mKeepAliveDispatchQueue;
  self->mKeepAliveDispatchQueue = 0;

  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "AVVCKeepAliveManager.mm";
    v10 = 1024;
    v11 = 142;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Dealloced AVVCKeepAliveManager", buf, 0x12u);
  }

LABEL_10:
  v7.receiver = self;
  v7.super_class = (Class)AVVCKeepAliveManager;
  -[AVVCKeepAliveManager dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mKeepAliveDispatchQueue, 0);
}

void __44__AVVCKeepAliveManager_startWithCompletion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id v4;

  v2 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 8))(*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v2, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__AVVCKeepAliveManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[AVVCKeepAliveManager sharedManager]::onceToken != -1)
    dispatch_once(&+[AVVCKeepAliveManager sharedManager]::onceToken, block);
  return (id)sSharedManager;
}

void __37__AVVCKeepAliveManager_sharedManager__block_invoke(Class *a1)
{
  int ProductType;
  int v3;
  unsigned int v4;
  char v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  ProductType = PlatformUtilities_iOS::GetProductType((PlatformUtilities_iOS *)a1);
  v3 = MGGetSInt32Answer();
  if ((MGGetBoolAnswer() & 1) != 0 || v3 == 7)
    goto LABEL_9;
  v4 = ((ProductType - 96) < 0x11) & (0x18003u >> (ProductType - 96));
  if (isDarwinOSProduct(void)::onceToken != -1)
    dispatch_once(&isDarwinOSProduct(void)::onceToken, &__block_literal_global_109);
  v5 = isDarwinOSProduct(void)::isDarwinOS ? 1 : v4;
  if ((v5 & 1) != 0)
  {
LABEL_9:
    v6 = (void *)sSharedManager;
    sSharedManager = 0;

    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        return;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "AVVCKeepAliveManager.mm";
      v17 = 1024;
      v18 = 100;
      v9 = "%25s:%-5d AVVCKeepAliveManager not supported on this device";
      v10 = v7;
      v11 = 18;
LABEL_21:
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  v12 = objc_alloc_init(a1[4]);
  v13 = (void *)sSharedManager;
  sSharedManager = (uint64_t)v12;

  if (!kAVVCScope)
  {
    v7 = MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
LABEL_19:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315650;
      v16 = "AVVCKeepAliveManager.mm";
      v17 = 1024;
      v18 = 96;
      v19 = 2048;
      v20 = sSharedManager;
      v9 = "%25s:%-5d Created AVVCKeepAliveManager (%p)";
      v10 = v7;
      v11 = 28;
      goto LABEL_21;
    }
LABEL_22:

    return;
  }
  v7 = *(id *)kAVVCScope;
  if (v7)
    goto LABEL_19;
}

@end
