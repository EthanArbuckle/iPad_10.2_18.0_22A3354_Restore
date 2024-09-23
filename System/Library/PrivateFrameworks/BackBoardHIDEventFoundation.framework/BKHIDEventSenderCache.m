@implementation BKHIDEventSenderCache

- (void)addSenderInfo:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  BKHIDEventSenderCache *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("senders != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v21 = v12;
      v22 = 2114;
      v23 = v14;
      v24 = 2048;
      v25 = self;
      v26 = 2114;
      v27 = CFSTR("BKHIDEventSenderCache.m");
      v28 = 1024;
      v29 = 111;
      v30 = 2114;
      v31 = v11;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C891870CLL);
  }
  v6 = v5;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[BKHIDEventSenderCache addSenderInfo:forSenderID:](self, "addSenderInfo:forSenderID:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "senderID"));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)addSenderInfo:(id)a3 forSenderID:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_senderIDToSenderInfo, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  BKLogHID();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)v12 = 134217984;
      *(_QWORD *)&v12[4] = a4;
      _os_log_impl(&dword_1C8914000, v9, OS_LOG_TYPE_DEFAULT, "we already have a service for senderID:%llX", v12, 0xCu);
    }

  }
  else
  {
    if (v10)
    {
      *(_DWORD *)v12 = 134218242;
      *(_QWORD *)&v12[4] = a4;
      *(_WORD *)&v12[12] = 2114;
      *(_QWORD *)&v12[14] = objc_opt_class();
      v11 = *(id *)&v12[14];
      _os_log_impl(&dword_1C8914000, v9, OS_LOG_TYPE_DEFAULT, "cache sender info for senderID:%llX -- %{public}@", v12, 0x16u);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "addDisappearanceObserver:queue:", self, self->_queue);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_senderIDToSenderInfo, "setObject:forKeyedSubscript:", v6, v7, *(_OWORD *)v12, *(_QWORD *)&v12[16], v13);
  }
  os_unfair_lock_unlock(&self->_lock);

}

void __42__BKHIDEventSenderCache_removeSenderInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    v11 = 0x1E0CB3000uLL;
    do
    {
      v12 = 0;
      v25 = v9;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        if (*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12) == v6)
        {
          v13 = objc_msgSend(v5, "unsignedLongLongValue");
          BKLogHID();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = (void *)objc_opt_class();
            *(_DWORD *)buf = 134218242;
            v31 = v13;
            v32 = 2114;
            v33 = v15;
            v16 = v10;
            v17 = v6;
            v18 = v7;
            v19 = a1;
            v20 = v5;
            v21 = v11;
            v22 = v15;
            _os_log_impl(&dword_1C8914000, v14, OS_LOG_TYPE_DEFAULT, "purge sender info for senderID:%llX -- %{public}@", buf, 0x16u);

            v11 = v21;
            v5 = v20;
            a1 = v19;
            v7 = v18;
            v6 = v17;
            v10 = v16;
            v9 = v25;
          }

          v23 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
          objc_msgSend(*(id *)(v11 + 2024), "numberWithUnsignedLongLong:", v13);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeObjectForKey:", v24);

        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v9);
  }

}

- (id)senderInfoForSenderID:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *senderIDToSenderInfo;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  senderIDToSenderInfo = self->_senderIDToSenderInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](senderIDToSenderInfo, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (!v8)
  {
    BKLogHID();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = a3;
      _os_log_impl(&dword_1C8914000, v9, OS_LOG_TYPE_DEFAULT, "unknown senderID: 0x%llX", (uint8_t *)&v11, 0xCu);
    }

    +[BKHIDUnknownSender unknownSenderInfo](BKHIDUnknownSender, "unknownSenderInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)serviceDidDisappear:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKHIDEventSenderCache removeSenderInfo:](self, "removeSenderInfo:", v6, v7, v8);
}

- (void)removeSenderInfo:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BKHIDEventSenderCache *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BKHIDEventSenderCache *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("senders != ((void *)0)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = CFSTR("BKHIDEventSenderCache.m");
      v24 = 1024;
      v25 = 120;
      v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C891B1D0);
  }
  v6 = v5;
  os_unfair_lock_lock(&self->_lock);
  v7 = (void *)-[NSMutableDictionary copy](self->_senderIDToSenderInfo, "copy");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__BKHIDEventSenderCache_removeSenderInfo___block_invoke;
  v13[3] = &unk_1E81F7488;
  v14 = v6;
  v15 = self;
  v12 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);

  os_unfair_lock_unlock(&self->_lock);
}

- (BKHIDEventSenderCache)initWithQueue:(id)a3
{
  id v5;
  BKHIDEventSenderCache *v6;
  BKHIDEventSenderCache *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *senderIDToSenderInfo;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKHIDEventSenderCache;
  v6 = -[BKHIDEventSenderCache init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    senderIDToSenderInfo = v7->_senderIDToSenderInfo;
    v7->_senderIDToSenderInfo = v8;

  }
  return v7;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_senderIDToSenderInfo, CFSTR("senderIDToSenderInfo"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)sync
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__BKHIDEventSenderCache_sync__block_invoke;
  block[3] = &unk_1E81F7460;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (NSMutableDictionary)senderIDToSenderInfo
{
  return self->_senderIDToSenderInfo;
}

- (void)setSenderIDToSenderInfo:(id)a3
{
  objc_storeStrong((id *)&self->_senderIDToSenderInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderIDToSenderInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __29__BKHIDEventSenderCache_sync__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

@end
