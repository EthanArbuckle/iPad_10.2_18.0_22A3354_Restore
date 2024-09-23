@implementation COClusterResolver

- (id)_initWithCluster:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  COClusterResolver *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COClusterResolver;
  v9 = -[COClusterResolver init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_cluster, a3);
    objc_storeWeak(p_isa + 3, v8);
  }

  return p_isa;
}

+ (id)resolverForCluster:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCluster:delegate:", v7, v6);

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COClusterResolver currentIdentifier](self, "currentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COClusterResolver cluster](self, "cluster");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[COClusterResolver activatedCluster](self, "activatedCluster");
  v9 = -[COClusterResolver bootstrapCompleted](self, "bootstrapCompleted");
  v10 = 78;
  if (v9)
    v11 = 89;
  else
    v11 = 78;
  if (v8)
    v10 = 89;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, i(%@) c(%@) a(%c) b(%c))>"), v5, self, v6, v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)activate
{
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __29__COClusterResolver_activate__block_invoke;
  v3[3] = &unk_24D4B0B18;
  v3[4] = self;
  v3[5] = &v4;
  -[COClusterResolver _withLock:](self, "_withLock:", v3);
  if (*((_BYTE *)v5 + 24))
    -[COClusterResolver _activate](self, "_activate");
  _Block_object_dispose(&v4, 8);
}

uint64_t __29__COClusterResolver_activate__block_invoke(uint64_t a1)
{
  uint64_t result;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "activatedCluster");
  if ((result & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    COCoreLogForCategory(13);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "cluster");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 134218242;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p activating resolver for Cluster %@", (uint8_t *)&v7, 0x16u);

    }
    v3 = 1;
    result = objc_msgSend(*(id *)(a1 + 32), "setActivatedCluster:", 1);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)_activate
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  os_unfair_lock_assert_not_owner(&self->_lock);
  objc_initWeak(&location, self);
  -[COClusterResolver cluster](self, "cluster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__COClusterResolver__activate__block_invoke;
  v4[3] = &unk_24D4B0EA0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "activate:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __30__COClusterResolver__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __30__COClusterResolver__activate__block_invoke_2;
    v7[3] = &unk_24D4B08A8;
    v7[4] = WeakRetained;
    v6 = v3;
    v8 = v6;
    v9 = &v10;
    objc_msgSend(v5, "_withLock:", v7);
    objc_msgSend(v5, "_delegateNotifyClusterIdentifierChanged:", v6);
    if (*((_BYTE *)v11 + 24))
      objc_msgSend(v5, "_invokeBootstrapBlocks");

    _Block_object_dispose(&v10, 8);
  }

}

uint64_t __30__COClusterResolver__activate__block_invoke_2(uint64_t a1)
{
  char v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "bootstrapCompleted");
  objc_msgSend(*(id *)(a1 + 32), "setBootstrapCompleted:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "_updateIdentifier:", *(_QWORD *)(a1 + 40));
  if ((v2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (void)_invokeBootstrapBlocks
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  v16 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__COClusterResolver__invokeBootstrapBlocks__block_invoke;
  v10[3] = &unk_24D4B07E0;
  v10[4] = self;
  v10[5] = &v11;
  -[COClusterResolver _withLock:](self, "_withLock:", v10);
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v2 = (id)v12[5];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v17, 16);
    }
    while (v3);
  }

  _Block_object_dispose(&v11, 8);
}

uint64_t __43__COClusterResolver__invokeBootstrapBlocks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "waitingForBootstrap");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setWaitingForBootstrap:", 0);
}

- (BOOL)_updateIdentifier:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  int v9;
  COClusterResolver *v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (unint64_t)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[COClusterResolver currentIdentifier](self, "currentIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(13);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p identifier updated to %@ from %@", (uint8_t *)&v9, 0x20u);
  }

  if (v4 | v5 && (objc_msgSend((id)v5, "isEqual:", v4) & 1) == 0)
  {
    -[COClusterResolver setCurrentIdentifier:](self, "setCurrentIdentifier:", v4);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_delegateNotifyClusterIdentifierChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[COClusterResolver delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "resolver:clusterIdentifierChanged:", self, v6);

}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (COCluster)cluster
{
  return self->_cluster;
}

- (COClusterResolverDelegate)delegate
{
  return (COClusterResolverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)currentIdentifier
{
  return self->_currentIdentifier;
}

- (void)setCurrentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentIdentifier, a3);
}

- (BOOL)activatedCluster
{
  return self->_activatedCluster;
}

- (void)setActivatedCluster:(BOOL)a3
{
  self->_activatedCluster = a3;
}

- (BOOL)bootstrapCompleted
{
  return self->_bootstrapCompleted;
}

- (void)setBootstrapCompleted:(BOOL)a3
{
  self->_bootstrapCompleted = a3;
}

- (NSArray)waitingForBootstrap
{
  return self->_waitingForBootstrap;
}

- (void)setWaitingForBootstrap:(id)a3
{
  objc_storeStrong((id *)&self->_waitingForBootstrap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForBootstrap, 0);
  objc_storeStrong((id *)&self->_currentIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cluster, 0);
}

@end
