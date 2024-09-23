@implementation NPKGreenTeaDataUsageResolver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance_sharedInstance_0;
}

void __46__NPKGreenTeaDataUsageResolver_sharedInstance__block_invoke()
{
  NPKGreenTeaDataUsageResolver *v0;
  void *v1;

  v0 = objc_alloc_init(NPKGreenTeaDataUsageResolver);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

+ (void)resolveGreenTeaDataUsageIfNecessary
{
  id v2;

  +[NPKGreenTeaDataUsageResolver sharedInstance](NPKGreenTeaDataUsageResolver, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveGreenTeaDataUsageIfNecessary");

}

- (NPKGreenTeaDataUsageResolver)init
{
  NPKGreenTeaDataUsageResolver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NPKGreenTeaDataUsageResolver;
  v2 = -[NPKGreenTeaDataUsageResolver init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.NanoPassbookDataUsageREsolver", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)resolveGreenTeaDataUsageIfNecessary
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NPKGreenTeaDataUsageResolver_resolveGreenTeaDataUsageIfNecessary__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __67__NPKGreenTeaDataUsageResolver_resolveGreenTeaDataUsageIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  if (MGGetBoolAnswer() && MGGetBoolAnswer())
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_Payment_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Device may need data usage resolution", buf, 2u);
      }

    }
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 8))
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

      if (v7)
      {
        pk_Payment_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Currently resolving data usage", buf, 2u);
        }

      }
    }
    else
    {
      *(_BYTE *)(v5 + 8) = 1;
      v9 = *(void **)(a1 + 32);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __67__NPKGreenTeaDataUsageResolver_resolveGreenTeaDataUsageIfNecessary__block_invoke_5;
      v10[3] = &unk_24CFE7998;
      v10[4] = v9;
      objc_msgSend(v9, "_resolveGreenTeaDataUsageIfNecessaryWithCompletion:", v10);
    }
  }
}

void __67__NPKGreenTeaDataUsageResolver_resolveGreenTeaDataUsageIfNecessary__block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NPKGreenTeaDataUsageResolver_resolveGreenTeaDataUsageIfNecessary__block_invoke_2;
  block[3] = &unk_24CFE7998;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __67__NPKGreenTeaDataUsageResolver_resolveGreenTeaDataUsageIfNecessary__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

- (void)_resolveGreenTeaDataUsageIfNecessaryWithCompletion:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (BOOL)currentlyResolving
{
  return self->_currentlyResolving;
}

- (void)setCurrentlyResolving:(BOOL)a3
{
  self->_currentlyResolving = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
