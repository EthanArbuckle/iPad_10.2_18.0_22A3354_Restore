@implementation MSServiceUpdatedHandler

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__MSServiceUpdatedHandler_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  return (id)shared_sShared;
}

void __33__MSServiceUpdatedHandler_shared__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)shared_sShared;
  shared_sShared = (uint64_t)v1;

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  _MSLogingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MSServiceUpdatedHandler setDelegate:].cold.1((uint64_t)v4, v5);

  objc_storeWeak((id *)&self->_delegate, v4);
}

- (void)mediaServiceChanged:(id)a3 homeUserID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _MSLogingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[MSServiceUpdatedHandler mediaServiceChanged:homeUserID:]";
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_219CD8000, v8, OS_LOG_TYPE_DEFAULT, "%s Informing delegate about service change - User: %@ Service %@", (uint8_t *)&v13, 0x20u);

  }
  -[MSServiceUpdatedHandler delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "conformsToProtocol:", &unk_2550B4940))
    goto LABEL_6;
  -[MSServiceUpdatedHandler delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[MSServiceUpdatedHandler delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serviceSettingDidUpdate:homeUserID:", v6, v7);
LABEL_6:

  }
}

- (void)mediaServiceRemoved:(id)a3 homeUserID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _MSLogingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[MSServiceUpdatedHandler mediaServiceRemoved:homeUserID:]";
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_219CD8000, v8, OS_LOG_TYPE_DEFAULT, "%s Informing delegate about service removal - User: %@ Service %@", (uint8_t *)&v13, 0x20u);

  }
  -[MSServiceUpdatedHandler delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "conformsToProtocol:", &unk_2550B4940))
    goto LABEL_6;
  -[MSServiceUpdatedHandler delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[MSServiceUpdatedHandler delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userDidRemoveService:homeUserID:", v6, v7);
LABEL_6:

  }
}

- (void)defaultMediaServiceUpdated:(id)a3 homeUserID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _MSLogingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[MSServiceUpdatedHandler defaultMediaServiceUpdated:homeUserID:]";
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_219CD8000, v8, OS_LOG_TYPE_DEFAULT, "%s Informing delegate about default service update - User: %@ Service %@", (uint8_t *)&v13, 0x20u);

  }
  -[MSServiceUpdatedHandler delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "conformsToProtocol:", &unk_2550B4940))
    goto LABEL_6;
  -[MSServiceUpdatedHandler delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[MSServiceUpdatedHandler delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userDidUpdateDefaultService:homeUserID:", v6, v7);
LABEL_6:

  }
}

- (MediaServiceUpdatedClientDelegate)delegate
{
  return (MediaServiceUpdatedClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[MSServiceUpdatedHandler setDelegate:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_219CD8000, a2, OS_LOG_TYPE_DEBUG, "%s Setting MediaServiceUpdatedClientDelegate %@", (uint8_t *)&v2, 0x16u);
}

@end
