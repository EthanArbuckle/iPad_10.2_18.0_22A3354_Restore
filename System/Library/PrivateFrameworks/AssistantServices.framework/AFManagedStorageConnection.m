@implementation AFManagedStorageConnection

- (void)dealloc
{
  objc_super v3;

  -[AFManagedStorageConnection _clearConnection](self, "_clearConnection");
  v3.receiver = self;
  v3.super_class = (Class)AFManagedStorageConnection;
  -[AFManagedStorageConnection dealloc](&v3, sel_dealloc);
}

- (void)_clearConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  _QWORD v8[4];
  NSXPCConnection *v9;

  connection = self->_connection;
  if (connection)
  {
    v4 = connection;
    v5 = self->_connection;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__AFManagedStorageConnection__clearConnection__block_invoke;
    v8[3] = &unk_1E3A36F30;
    v9 = v4;
    v6 = v4;
    -[NSXPCConnection addBarrierBlock:](v5, "addBarrierBlock:", v8);
    v7 = self->_connection;
    self->_connection = 0;

  }
}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.assistantd.managedstorage"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    objc_initWeak(&location, self);
    v6 = self->_connection;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __41__AFManagedStorageConnection__connection__block_invoke;
    v13 = &unk_1E3A35AE0;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", &v10);
    v7 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE432318, v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (id)_managedStoreService
{
  void *v2;
  void *v3;

  -[AFManagedStorageConnection _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_managedStoreServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AFManagedStorageConnection _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_synchronousManagedStoreServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AFManagedStorageConnection _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)domainObjectForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__17426;
  v17 = __Block_byref_object_dispose__17427;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__AFManagedStorageConnection_domainObjectForKey___block_invoke;
  v11[3] = &unk_1E3A36A00;
  v6 = v4;
  v12 = v6;
  -[AFManagedStorageConnection _synchronousManagedStoreServiceWithErrorHandler:](self, "_synchronousManagedStoreServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __49__AFManagedStorageConnection_domainObjectForKey___block_invoke_58;
  v10[3] = &unk_1E3A30CA8;
  v10[4] = &v13;
  objc_msgSend(v7, "fetchManagedStoreObjectForKey:reply:", v6, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)setDomainObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AFManagedStorageConnection _managedStoreService](self, "_managedStoreService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setManagedStoreObject:forKey:", v7, v6);

}

- (id)dataForKey:(id)a3 inKnowledgeStoreWithName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  _BYTE buf[24];
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[AFManagedStorageConnection dataForKey:inKnowledgeStoreWithName:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v14 = __Block_byref_object_copy__17426;
  v15 = __Block_byref_object_dispose__17427;
  v16 = 0;
  -[AFManagedStorageConnection _synchronousManagedStoreServiceWithErrorHandler:](self, "_synchronousManagedStoreServiceWithErrorHandler:", &__block_literal_global_17428);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__AFManagedStorageConnection_dataForKey_inKnowledgeStoreWithName___block_invoke_60;
  v12[3] = &unk_1E3A30CF0;
  v12[4] = buf;
  objc_msgSend(v9, "getKnowledgeStoreDataForKey:inStoreWithName:completion:", v6, v7, v12);

  v10 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v10;
}

- (void)setData:(id)a3 forKey:(id)a4 inKnowledgeStoreWithName:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "-[AFManagedStorageConnection setData:forKey:inKnowledgeStoreWithName:]";
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v13, 0x16u);
  }
  -[AFManagedStorageConnection _synchronousManagedStoreServiceWithErrorHandler:](self, "_synchronousManagedStoreServiceWithErrorHandler:", &__block_literal_global_62_17423);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setKnowledgeStoreData:forKey:inStoreWithName:completion:", v8, v9, v10, &__block_literal_global_64);

}

- (void)resetKnowledgeStoreWithName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFManagedStorageConnection resetKnowledgeStoreWithName:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  -[AFManagedStorageConnection _synchronousManagedStoreServiceWithErrorHandler:](self, "_synchronousManagedStoreServiceWithErrorHandler:", &__block_literal_global_65);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetKnowledgeStoreWithName:completion:", v4, &__block_literal_global_67);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __58__AFManagedStorageConnection_resetKnowledgeStoreWithName___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFManagedStorageConnection resetKnowledgeStoreWithName:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __70__AFManagedStorageConnection_setData_forKey_inKnowledgeStoreWithName___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFManagedStorageConnection setData:forKey:inKnowledgeStoreWithName:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __66__AFManagedStorageConnection_dataForKey_inKnowledgeStoreWithName___block_invoke_60(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __66__AFManagedStorageConnection_dataForKey_inKnowledgeStoreWithName___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[AFManagedStorageConnection dataForKey:inKnowledgeStoreWithName:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s Error: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __49__AFManagedStorageConnection_domainObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[AFManagedStorageConnection domainObjectForKey:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2114;
    v11 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Could not get domain objects for %@: %{public}@", (uint8_t *)&v6, 0x20u);
  }

}

void __49__AFManagedStorageConnection_domainObjectForKey___block_invoke_58(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __41__AFManagedStorageConnection__connection__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AFManagedStorageConnection__connection__block_invoke_2;
  block[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __41__AFManagedStorageConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearConnection");

}

uint64_t __46__AFManagedStorageConnection__clearConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

@end
