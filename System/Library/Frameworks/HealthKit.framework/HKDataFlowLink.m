@implementation HKDataFlowLink

- (HKDataFlowLink)initWithProcessor:(id)a3 sourceProtocol:(id)a4 destinationProtocol:(id)a5 loggingCategory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKDataFlowLink *v14;
  HKDataFlowLink *v15;
  uint64_t v16;
  NSHashTable *sources;
  uint64_t v18;
  NSHashTable *destinations;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HKDataFlowLink;
  v14 = -[HKDataFlowLink init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_processor, v10);
    objc_storeStrong((id *)&v15->_sourceProtocol, a4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    sources = v15->_sources;
    v15->_sources = (NSHashTable *)v16;

    objc_storeStrong((id *)&v15->_destinationProtocol, a5);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = objc_claimAutoreleasedReturnValue();
    destinations = v15->_destinations;
    v15->_destinations = (NSHashTable *)v18;

    objc_storeStrong((id *)&v15->_category, a6);
    v15->_lock._os_unfair_lock_opaque = 0;
  }

  return v15;
}

- (void)addSource:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *category;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  Protocol *sourceProtocol;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  HKDataFlowLink *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "processor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", self->_sourceProtocol);

  if ((v6 & 1) != 0)
  {
    os_unfair_lock_lock(&self->_lock);
    _HKInitializeLogging();
    category = self->_category;
    if (os_log_type_enabled(category, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v26 = self;
      v27 = 2114;
      v28 = v4;
      _os_log_impl(&dword_19A0E6000, category, OS_LOG_TYPE_INFO, "%{public}@: Added source %{public}@", buf, 0x16u);
    }
    -[NSHashTable addObject:](self->_sources, "addObject:", v4);
    -[NSHashTable allObjects](self->_destinations, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v4, "addDestination:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_processor);
      objc_msgSend(v11, "dataFlowLink:didAddSource:direct:", self, v4, 1);

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = v8;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "source:didAddUpstreamSource:", self, v4, (_QWORD)v20);
        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

  }
  else
  {
    _HKInitializeLogging();
    v17 = self->_category;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    sourceProtocol = self->_sourceProtocol;
    v12 = v17;
    NSStringFromProtocol(sourceProtocol);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = self;
    v27 = 2114;
    v28 = v4;
    v29 = 2114;
    v30 = v19;
    _os_log_fault_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_FAULT, "%{public}@: Cannot add source %{public}@ because it does not conform to expected protocol %{public}@", buf, 0x20u);

  }
LABEL_16:

}

- (void)removeSource:(id)a3
{
  id v4;
  NSObject *category;
  int v6;
  HKDataFlowLink *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "removeDestination:", self);
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  category = self->_category;
  if (os_log_type_enabled(category, OS_LOG_TYPE_INFO))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_19A0E6000, category, OS_LOG_TYPE_INFO, "%{public}@: Removed source %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[NSHashTable removeObject:](self->_sources, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)source:(id)a3 didAddUpstreamSource:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(v7, "dataFlowLink:didAddSource:direct:", self, v8, 0);

  }
}

- (id)allSourceProcessors
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_sources, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "hk_map:", &__block_literal_global_82);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __37__HKDataFlowLink_allSourceProcessors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processor");
}

- (id)allDestinationProcessors
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_destinations, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "hk_map:", &__block_literal_global_6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __42__HKDataFlowLink_allDestinationProcessors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processor");
}

- (id)destinationProcessorsConformingToProtocol:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_destinations, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __60__HKDataFlowLink_destinationProcessorsConformingToProtocol___block_invoke;
  v20[3] = &unk_1E37F1840;
  v7 = v4;
  v21 = v7;
  objc_msgSend(v5, "hk_map:", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "destinationProcessorsConformingToProtocol:", v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v11);
  }

  return v6;
}

id __60__HKDataFlowLink_destinationProcessorsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "processor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "processor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)sendToDestinationProcessors:(id)a3
{
  void (**v4)(id, void *);
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_destinations, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "processor", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          v4[2](v4, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)addDestination:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *category;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  HKDataFlowLink *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "processor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", self->_destinationProtocol);

  if ((v6 & 1) != 0)
  {
    os_unfair_lock_lock(&self->_lock);
    _HKInitializeLogging();
    category = self->_category;
    if (os_log_type_enabled(category, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v4;
      _os_log_impl(&dword_19A0E6000, category, OS_LOG_TYPE_INFO, "%{public}@: Added destination %{public}@", buf, 0x16u);
    }
    -[NSHashTable addObject:](self->_destinations, "addObject:", v4);
    -[NSHashTable allObjects](self->_sources, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_processor);
      objc_msgSend(v11, "dataFlowLink:didAddDestination:direct:", self, v4, 1);

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "destination:didAddDownstreamDestination:", self, v4, (_QWORD)v18);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
  else
  {
    v17 = self->_category;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[HKDataFlowLink addDestination:].cold.1(v17);
  }

}

- (void)removeDestination:(id)a3
{
  id v4;
  NSObject *category;
  int v6;
  HKDataFlowLink *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  category = self->_category;
  if (os_log_type_enabled(category, OS_LOG_TYPE_INFO))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_19A0E6000, category, OS_LOG_TYPE_INFO, "%{public}@: Removed destination %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[NSHashTable removeObject:](self->_destinations, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)destination:(id)a3 didAddDownstreamDestination:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(v7, "dataFlowLink:didAddDestination:direct:", self, v8, 0);

  }
}

- (id)description
{
  void *v3;
  id WeakRetained;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HKDataFlowLink:%p [%@]>"), self, WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HKDataFlowLinkProcessor)processor
{
  return (HKDataFlowLinkProcessor *)objc_loadWeakRetained((id *)&self->_processor);
}

- (Protocol)sourceProtocol
{
  return self->_sourceProtocol;
}

- (Protocol)destinationProtocol
{
  return self->_destinationProtocol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationProtocol, 0);
  objc_storeStrong((id *)&self->_sourceProtocol, 0);
  objc_destroyWeak((id *)&self->_processor);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_sources, 0);
}

- (void)addDestination:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19A0E6000, log, OS_LOG_TYPE_FAULT, "[destination.processor conformsToProtocol:_destinationProtocol]", v1, 2u);
}

@end
