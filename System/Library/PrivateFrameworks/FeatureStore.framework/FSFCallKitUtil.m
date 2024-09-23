@implementation FSFCallKitUtil

- (FSFCallKitUtil)init
{
  FSFCallKitUtil *v2;
  CXCallObserver *v3;
  CXCallObserver *callCenter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FSFCallKitUtil;
  v2 = -[FSFCallKitUtil init](&v6, sel_init);
  if (v2)
  {
    v3 = (CXCallObserver *)objc_alloc_init(MEMORY[0x24BDB7898]);
    callCenter = v2->_callCenter;
    v2->_callCenter = v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_sSharedUtil;
}

void __32__FSFCallKitUtil_sharedInstance__block_invoke()
{
  FSFCallKitUtil *v0;
  void *v1;

  v0 = objc_alloc_init(FSFCallKitUtil);
  v1 = (void *)sharedInstance_sSharedUtil;
  sharedInstance_sSharedUtil = (uint64_t)v0;

}

- (BOOL)isOnCall
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CXCallObserver calls](self->_callCenter, "calls", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasEnded"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (CXCallObserver)callCenter
{
  return self->_callCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenter, 0);
}

@end
