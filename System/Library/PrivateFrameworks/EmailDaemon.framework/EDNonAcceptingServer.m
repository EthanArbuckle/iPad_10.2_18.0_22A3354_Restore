@implementation EDNonAcceptingServer

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EDNonAcceptingServer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_59 != -1)
    dispatch_once(&log_onceToken_59, block);
  return (OS_os_log *)(id)log_log_59;
}

void __27__EDNonAcceptingServer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_59;
  log_log_59 = (uint64_t)v1;

}

- (EDNonAcceptingServer)initWithMachServiceNames:(id)a3
{
  id v4;
  EDNonAcceptingServer *v5;
  uint64_t v6;
  NSMutableArray *listeners;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EDNonAcceptingServer;
  v5 = -[EDNonAcceptingServer init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    listeners = v5->_listeners;
    v5->_listeners = (NSMutableArray *)v6;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
          v13 = objc_alloc(MEMORY[0x1E0CB3B58]);
          v14 = (void *)objc_msgSend(v13, "initWithMachServiceName:", v12, (_QWORD)v16);
          objc_msgSend(v14, "setDelegate:", v5);
          -[NSMutableArray addObject:](v5->_listeners, "addObject:", v14);
          objc_msgSend(v14, "resume");

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v9);
    }

  }
  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  +[EDNonAcceptingServer log](EDNonAcceptingServer, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Not accepting %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (NSMutableArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
