@implementation HKOntologyStore

- (HKOntologyStore)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKOntologyStore)initWithHealthStore:(id)a3
{
  id v4;
  HKOntologyStore *v5;
  uint64_t v6;
  NSUUID *identifier;
  HKTaskServerProxyProvider *v8;
  HKTaskServerProxyProvider *proxyProvider;
  HKObserverSet *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HKOntologyStoreObserver *observers;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKOntologyStore;
  v5 = -[HKOntologyStore init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, CFSTR("HKOntologyStoreServerIdentifier"), v5, v5->_identifier);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = v8;

    objc_initWeak(&location, v5);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __39__HKOntologyStore_initWithHealthStore___block_invoke;
    v19 = &unk_1E37E95B8;
    objc_copyWeak(&v20, &location);
    -[HKProxyProvider setAutomaticProxyReconnectionHandler:](v5->_proxyProvider, "setAutomaticProxyReconnectionHandler:", &v16);
    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 1, v16, v17, v18, v19);
    v10 = [HKObserverSet alloc];
    NSStringFromProtocol((Protocol *)&unk_1EE410248);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogHealthOntology();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKObserverSet initWithName:loggingCategory:](v10, "initWithName:loggingCategory:", v11, v12);
    observers = v5->_observers;
    v5->_observers = (HKOntologyStoreObserver *)v13;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __39__HKOntologyStore_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAutomaticProxyReconnection");

}

- (void)insertEntries:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v14 = v8;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__HKOntologyStore_insertEntries_completion___block_invoke;
  v15[3] = &unk_1E37F6DB8;
  v16 = v6;
  v17 = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__HKOntologyStore_insertEntries_completion___block_invoke_2;
  v13[3] = &unk_1E37E6B38;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v13);

}

uint64_t __44__HKOntologyStore_insertEntries_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_insertEntries:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __44__HKOntologyStore_insertEntries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ontologyShardRegistryEntriesWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__HKOntologyStore_ontologyShardRegistryEntriesWithCompletion___block_invoke;
  v10[3] = &unk_1E37F6DE0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __62__HKOntologyStore_ontologyShardRegistryEntriesWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __62__HKOntologyStore_ontologyShardRegistryEntriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_ontologyShardRegistryEntriesWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__HKOntologyStore_ontologyShardRegistryEntriesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)ontologyServerURLWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HKOntologyStore_ontologyServerURLWithCompletion___block_invoke;
  v10[3] = &unk_1E37F6DE0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __51__HKOntologyStore_ontologyServerURLWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __51__HKOntologyStore_ontologyServerURLWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_ontologyServerURLWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __51__HKOntologyStore_ontologyServerURLWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setOntologyServerURL:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__HKOntologyStore_setOntologyServerURL_completion___block_invoke;
  v14[3] = &unk_1E37F6DB8;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __51__HKOntologyStore_setOntologyServerURL_completion___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __51__HKOntologyStore_setOntologyServerURL_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setOntologyServerURL:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __51__HKOntologyStore_setOntologyServerURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateShardRegistryWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__HKOntologyStore_updateShardRegistryWithCompletion___block_invoke;
  v10[3] = &unk_1E37F6DE0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __53__HKOntologyStore_updateShardRegistryWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __53__HKOntologyStore_updateShardRegistryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateShardRegistryWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__HKOntologyStore_updateShardRegistryWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)downloadRequiredShardsWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__HKOntologyStore_downloadRequiredShardsWithCompletion___block_invoke;
  v10[3] = &unk_1E37F6DE0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __56__HKOntologyStore_downloadRequiredShardsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __56__HKOntologyStore_downloadRequiredShardsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_downloadRequiredShardsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __56__HKOntologyStore_downloadRequiredShardsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)importRequiredShardsWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HKOntologyStore_importRequiredShardsWithCompletion___block_invoke;
  v10[3] = &unk_1E37F6DE0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __54__HKOntologyStore_importRequiredShardsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __54__HKOntologyStore_importRequiredShardsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_importRequiredShardsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __54__HKOntologyStore_importRequiredShardsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateOntologyForReason:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__HKOntologyStore_updateOntologyForReason_completion___block_invoke;
  v12[3] = &unk_1E37F6E08;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __54__HKOntologyStore_updateOntologyForReason_completion___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __54__HKOntologyStore_updateOntologyForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateOntologyForReason:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __54__HKOntologyStore_updateOntologyForReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestGatedOntologyUpdateWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__HKOntologyStore_requestGatedOntologyUpdateWithCompletion___block_invoke;
  v10[3] = &unk_1E37F6DE0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __60__HKOntologyStore_requestGatedOntologyUpdateWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __60__HKOntologyStore_requestGatedOntologyUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestGatedOntologyUpdateWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __60__HKOntologyStore_requestGatedOntologyUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pruneOntologyWithOptions:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  unint64_t v14;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HKOntologyStore_pruneOntologyWithOptions_completion___block_invoke;
  v12[3] = &unk_1E37F6E08;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __55__HKOntologyStore_pruneOntologyWithOptions_completion___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __55__HKOntologyStore_pruneOntologyWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pruneOntologyWithOptions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __55__HKOntologyStore_pruneOntologyWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)markShardsWithIdentifiers:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__HKOntologyStore_markShardsWithIdentifiers_options_completion___block_invoke;
  v16[3] = &unk_1E37F6E30;
  v17 = v8;
  v19 = a4;
  v18 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __64__HKOntologyStore_markShardsWithIdentifiers_options_completion___block_invoke_2;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v12 = v18;
  v13 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __64__HKOntologyStore_markShardsWithIdentifiers_options_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_markShardsWithIdentifiers:options:completion:", a1[4], a1[6], a1[5]);
}

uint64_t __64__HKOntologyStore_markShardsWithIdentifiers_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)shardRequirementStatusesWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__HKOntologyStore_shardRequirementStatusesWithCompletion___block_invoke;
  v10[3] = &unk_1E37F6DE0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __58__HKOntologyStore_shardRequirementStatusesWithCompletion___block_invoke_2;
  v8[3] = &unk_1E37E6B38;
  v9 = v11;
  v7 = v11;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __58__HKOntologyStore_shardRequirementStatusesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_shardRequirementStatusesWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __58__HKOntologyStore_shardRequirementStatusesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  id v6;
  HKOntologyStoreObserver *observers;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];

  v9 = a3;
  v6 = a4;
  observers = self->_observers;
  v8 = v6;
  if (!v6)
  {
    -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__HKOntologyStore_registerObserver_queue___block_invoke;
  v11[3] = &unk_1E37E6770;
  v11[4] = self;
  -[HKOntologyStoreObserver registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", v9, v8, v11, v9);
  if (!v6)

}

uint64_t __42__HKOntologyStore_registerObserver_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerFirstObserver");
}

- (void)unregisterObserver:(id)a3
{
  HKOntologyStoreObserver *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__HKOntologyStore_unregisterObserver___block_invoke;
  v4[3] = &unk_1E37E6770;
  v4[4] = self;
  -[HKOntologyStoreObserver unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __38__HKOntologyStore_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterLastObserver");
}

- (void)client_didStageEntry:(id)a3
{
  id v4;
  HKOntologyStoreObserver *observers;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HKOntologyStore_client_didStageEntry___block_invoke;
  v7[3] = &unk_1E37F6E58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKOntologyStoreObserver notifyObservers:](observers, "notifyObservers:", v7);

}

uint64_t __40__HKOntologyStore_client_didStageEntry___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ontologyStore:didStageEntry:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)client_didImportEntry:(id)a3
{
  id v4;
  HKOntologyStoreObserver *observers;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__HKOntologyStore_client_didImportEntry___block_invoke;
  v7[3] = &unk_1E37F6E58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKOntologyStoreObserver notifyObservers:](observers, "notifyObservers:", v7);

}

uint64_t __41__HKOntologyStore_client_didImportEntry___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ontologyStore:didImportEntry:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

+ (id)serverInterface
{
  void *v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4102A8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_insertEntries_completion_, 0, 0);
  v4 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_ontologyShardRegistryEntriesWithCompletion_, 0, 1);
  v5 = (id)objc_msgSend(v2, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_markShardsWithIdentifiers_options_completion_, 0, 0);
  return v2;
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3E8930);
}

- (void)_handleAutomaticProxyReconnection
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint8_t buf[4];
  HKOntologyStore *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[HKOntologyStoreObserver count](self->_observers, "count");
  _HKInitializeLogging();
  HKLogHealthOntology();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_19A0E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Resume observation on server reconnection", buf, 0xCu);
    }

    v11 = 0;
    v6 = -[HKOntologyStore _synchronouslyRegisterToObserveOntologyStoreChanges:](self, "_synchronouslyRegisterToObserveOntologyStoreChanges:", &v11);
    v7 = v11;
    _HKInitializeLogging();
    HKLogHealthOntology();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v13 = self;
        _os_log_impl(&dword_19A0E6000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Received notification of successful server reconnection", buf, 0xCu);
      }

      -[HKOntologyStore _notifyObserversAboutReconnect](self, "_notifyObserversAboutReconnect");
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[HKKeyValueDomain _handleAutomaticProxyReconnection].cold.1((uint64_t)self, (uint64_t)v7, v9);

    }
  }
  else
  {
    v10 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (!v10)
      return;
    HKLogHealthOntology();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_INFO, "%{public}@: No need to restart observation, because there are no registered observers", buf, 0xCu);
    }
  }

}

- (void)_notifyObserversAboutReconnect
{
  HKOntologyStoreObserver *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__HKOntologyStore__notifyObserversAboutReconnect__block_invoke;
  v3[3] = &unk_1E37F6E80;
  v3[4] = self;
  -[HKOntologyStoreObserver notifyObservers:](observers, "notifyObservers:", v3);
}

uint64_t __49__HKOntologyStore__notifyObserversAboutReconnect__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ontologyStoreDidReconnect:", *(_QWORD *)(a1 + 32));
}

- (void)_registerFirstObserver
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__HKOntologyStore__registerFirstObserver__block_invoke;
  v2[3] = &unk_1E37E6BD8;
  v2[4] = self;
  -[HKOntologyStore _observeOntologyStoreChanges:completion:](self, "_observeOntologyStoreChanges:completion:", 1, v2);
}

void __41__HKOntologyStore__registerFirstObserver__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __57__HKKeyValueDomain__registerFirstObserverWithCompletion___block_invoke_cold_1(a1, (uint64_t)v5, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "_callUnitTestHookObserving:success:error:", 1, a2, v5);

}

- (void)_unregisterLastObserver
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__HKOntologyStore__unregisterLastObserver__block_invoke;
  v2[3] = &unk_1E37E6BD8;
  v2[4] = self;
  -[HKOntologyStore _observeOntologyStoreChanges:completion:](self, "_observeOntologyStoreChanges:completion:", 0, v2);
}

void __42__HKOntologyStore__unregisterLastObserver__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v7)
    {
      HKLogHealthOntology();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = 138543618;
        v11 = v9;
        v12 = 2114;
        v13 = v5;
        _os_log_impl(&dword_19A0E6000, v8, OS_LOG_TYPE_INFO, "%{public}@: unable to unregister observing changes: %{public}@", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_callUnitTestHookObserving:success:error:", 0, a2, v5);

}

- (void)_observeOntologyStoreChanges:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  HKTaskServerProxyProvider *proxyProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__HKOntologyStore__observeOntologyStoreChanges_completion___block_invoke;
  v12[3] = &unk_1E37F6EA8;
  v14 = a3;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __59__HKOntologyStore__observeOntologyStoreChanges_completion___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v9 = v13;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __59__HKOntologyStore__observeOntologyStoreChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_observeOntologyStoreChanges:completion:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __59__HKOntologyStore__observeOntologyStoreChanges_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_synchronouslyRegisterToObserveOntologyStoreChanges:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v6;
  void *v7;
  char v8;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__58;
  v16 = __Block_byref_object_dispose__58;
  v17 = 0;
  proxyProvider = self->_proxyProvider;
  v10[4] = &v12;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__HKOntologyStore__synchronouslyRegisterToObserveOntologyStoreChanges___block_invoke;
  v11[3] = &unk_1E37F6ED0;
  v11[4] = &v18;
  v11[5] = &v12;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__HKOntologyStore__synchronouslyRegisterToObserveOntologyStoreChanges___block_invoke_3;
  v10[3] = &unk_1E37E8B48;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v11, v10);
  -[HKOntologyStore _callUnitTestHookObserving:success:error:](self, "_callUnitTestHookObserving:success:error:", 1, *((unsigned __int8 *)v19 + 24), v13[5]);
  v6 = (id)v13[5];
  v7 = v6;
  if (v6)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError(v6);
  }

  v8 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

uint64_t __71__HKOntologyStore__synchronouslyRegisterToObserveOntologyStoreChanges___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__HKOntologyStore__synchronouslyRegisterToObserveOntologyStoreChanges___block_invoke_2;
  v3[3] = &unk_1E37E9020;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_observeOntologyStoreChanges:completion:", 1, v3);
}

void __71__HKOntologyStore__synchronouslyRegisterToObserveOntologyStoreChanges___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __71__HKOntologyStore__synchronouslyRegisterToObserveOntologyStoreChanges___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_callUnitTestHookObserving:(BOOL)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v10 = a5;
  v8 = _Block_copy(self->_unitTesting_didChangeObserverRegistration);
  v9 = v8;
  if (v8)
    (*((void (**)(void *, _BOOL8, _BOOL8, id))v8 + 2))(v8, v6, v5, v10);

}

- (void)unitTest_noOpWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HKTaskServerProxyProvider *proxyProvider;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v10 = v5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__HKOntologyStore_unitTest_noOpWithCompletion___block_invoke;
  v11[3] = &unk_1E37F6DE0;
  v12 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__HKOntologyStore_unitTest_noOpWithCompletion___block_invoke_2;
  v9[3] = &unk_1E37E6B38;
  v7 = v5;
  v8 = v4;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v11, v9);

}

uint64_t __47__HKOntologyStore_unitTest_noOpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unitTesting_createTaskServerNoOpWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __47__HKOntologyStore_unitTest_noOpWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)unitTesting_didChangeObserverRegistration
{
  return self->_unitTesting_didChangeObserverRegistration;
}

- (void)setUnitTesting_didChangeObserverRegistration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didChangeObserverRegistration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
