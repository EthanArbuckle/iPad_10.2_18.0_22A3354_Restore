@implementation BMBFSDeletePropagator

- (BMBFSDeletePropagator)initWithStreamId:(id)a3
{
  return -[BMBFSDeletePropagator initWithStreamId:registrar:](self, "initWithStreamId:registrar:", a3, 0);
}

- (BMBFSDeletePropagator)initWithStreamId:(id)a3 registrar:(id)a4
{
  id v7;
  id v8;
  BMBFSDeletePropagator *v9;
  BMBFSDeletePropagator *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  BMBFSDeletePropagator *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BMBFSDeletePropagator;
  v9 = -[BMBFSDeletePropagator init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_streamId, a3);
    objc_storeStrong((id *)&v10->_registrar, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.Biome.BFS.BMBFSDeletePropagator", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

  }
  if (-[BMBFSDeletePropagator shouldHandleDeletions](v10, "shouldHandleDeletions"))
    v14 = v10;
  else
    v14 = 0;

  return v14;
}

- (BMRegistrar)registrar
{
  BMRegistrar *registrar;
  BMRegistrar *v4;
  BMRegistrar *v5;

  registrar = self->_registrar;
  if (!registrar)
  {
    +[BMRegistrar centralRegistrar](BMRegistrar, "centralRegistrar");
    v4 = (BMRegistrar *)objc_claimAutoreleasedReturnValue();
    v5 = self->_registrar;
    self->_registrar = v4;

    registrar = self->_registrar;
  }
  return registrar;
}

- (BOOL)shouldHandleDeletions
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v11;

  +[BMRegistrar managedStreamIdentifiers](BMRegistrar, "managedStreamIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", self->_streamId);

  if ((v4 & 1) != 0)
  {
    -[BMBFSDeletePropagator registrar](self, "registrar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[BMBFSDeletePropagator registrar](self, "registrar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "streamRegistrationCounts");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMBFSDeletePropagator streamId](self, "streamId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        return 1;
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[BMBFSDeletePropagator shouldHandleDeletions].cold.2(self);
    }
    else
    {
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[BMBFSDeletePropagator shouldHandleDeletions].cold.1(self);
    }
  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BMBFSDeletePropagator shouldHandleDeletions].cold.3(self);
  }

  return 0;
}

- (void)willPruneEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BMBFSDeletePropagator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__BMBFSDeletePropagator_willPruneEvent___block_invoke;
  v7[3] = &unk_1E6649FA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __40__BMBFSDeletePropagator_willPruneEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __40__BMBFSDeletePropagator_willPruneEvent___block_invoke_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 32), "prunedIdentifiables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setPrunedIdentifiables:", v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "eventBody");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(*(id *)(a1 + 40), "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EF07B448);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "eventBody");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "prunedIdentifiables");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v10);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "prunedIdentifiables");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 >= 0x3E9)
  {
    objc_msgSend(*(id *)(a1 + 32), "registrar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "streamId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "prunedIdentifiables");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "propagateDeletionOfEventsInStream:withIdentifiers:", v15, v16);

    objc_msgSend(*(id *)(a1 + 32), "setPrunedIdentifiables:", 0);
  }
}

- (void)didPruneEvents
{
  NSObject *v3;
  _QWORD block[5];

  -[BMBFSDeletePropagator queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BMBFSDeletePropagator_didPruneEvents__block_invoke;
  block[3] = &unk_1E6649F80;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __39__BMBFSDeletePropagator_didPruneEvents__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __39__BMBFSDeletePropagator_didPruneEvents__block_invoke_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 32), "prunedIdentifiables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "registrar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "streamId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "prunedIdentifiables");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "propagateDeletionOfEventsInStream:withIdentifiers:", v6, v7);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setPrunedIdentifiables:", 0);
}

- (NSString)streamId
{
  return self->_streamId;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)prunedIdentifiables
{
  return self->_prunedIdentifiables;
}

- (void)setPrunedIdentifiables:(id)a3
{
  objc_storeStrong((id *)&self->_prunedIdentifiables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prunedIdentifiables, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_streamId, 0);
  objc_storeStrong((id *)&self->_registrar, 0);
}

- (void)shouldHandleDeletions
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "streamId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1B399A000, v2, v3, "Not propagating deletions of %@ via BMRegistrar it is not a BFS-managed stream", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

void __40__BMBFSDeletePropagator_willPruneEvent___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "streamId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1B399A000, v2, v3, "Received willPruneEvent for stream: %@ with event: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __39__BMBFSDeletePropagator_didPruneEvents__block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "streamId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "prunedIdentifiables");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_1B399A000, v3, v4, "Received didPruneEvents for stream: %@ with identifiables: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1();
}

@end
