@implementation MCMLRUCache

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  MCMDoublyLinkedListNode *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  int *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  unint64_t v42;
  uint8_t buf[32];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[MCMLRUCache mruItems](self, "mruItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[MCMLRUCache storage](self, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 != v11)
  {
    v45 = 0u;
    v46 = 0u;
    v44 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    -[MCMLRUCache mruItems](self, "mruItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");
    -[MCMLRUCache storage](self, "storage");
    self = (MCMLRUCache *)objc_claimAutoreleasedReturnValue();
    v39 = 134218240;
    v40 = v32;
    v41 = 2048;
    v42 = -[MCMLRUCache count](self, "count");
    LODWORD(v38) = 22;
    v37 = &v39;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
    goto LABEL_13;
  }
  -[MCMLRUCache storage](self, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v7);
  v13 = (MCMDoublyLinkedListNode *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MCMDoublyLinkedListNode setData:](v13, "setData:", v6);
    -[MCMLRUCache mruItems](self, "mruItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeNodeAndAddToTail:", v13);
  }
  else
  {
    v15 = -[MCMLRUCache maxCount](self, "maxCount");
    -[MCMLRUCache mruItems](self, "mruItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v15 == v17)
    {
      -[MCMLRUCache mruItems](self, "mruItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeFromHead");
      v13 = (MCMDoublyLinkedListNode *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        -[MCMLRUCache name](self, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMLRUCache storage](self, "storage");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMDoublyLinkedListNode key](v13, "key");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v30;
        _os_log_debug_impl(&dword_1CF807000, v19, OS_LOG_TYPE_DEBUG, "[%@] Evicting from cache: %@", buf, 0x16u);

      }
      -[MCMLRUCache storage](self, "storage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMDoublyLinkedListNode key](v13, "key");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, v21);

      -[MCMDoublyLinkedListNode setKey:](v13, "setKey:", v7);
      -[MCMDoublyLinkedListNode setData:](v13, "setData:", v6);
    }
    else
    {
      v13 = -[MCMDoublyLinkedListNode initWithKey:data:]([MCMDoublyLinkedListNode alloc], "initWithKey:data:", v7, v6);
    }
    -[MCMLRUCache mruItems](self, "mruItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addToTail:", v13);

    -[MCMLRUCache storage](self, "storage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v7);
  }

  -[MCMLRUCache mruItems](self, "mruItems");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");
  -[MCMLRUCache storage](self, "storage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v24 != v26)
  {
LABEL_13:
    v45 = 0u;
    v46 = 0u;
    v44 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    -[MCMLRUCache mruItems](self, "mruItems", v37, v38);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");
    -[MCMLRUCache storage](self, "storage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");
    v39 = 134218240;
    v40 = v34;
    v41 = 2048;
    v42 = v36;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  unint64_t v32;
  uint8_t buf[32];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[MCMLRUCache mruItems](self, "mruItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[MCMLRUCache storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 != v8)
  {
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    -[MCMLRUCache mruItems](self, "mruItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");
    -[MCMLRUCache storage](self, "storage");
    self = (MCMLRUCache *)objc_claimAutoreleasedReturnValue();
    v29 = 134218240;
    v30 = v22;
    v31 = 2048;
    v32 = -[MCMLRUCache count](self, "count");
    LODWORD(v28) = 22;
    v27 = &v29;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
    goto LABEL_9;
  }
  -[MCMLRUCache storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[MCMLRUCache name](self, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "data");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      _os_log_debug_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEBUG, "[%@] Cache hit: %@", buf, 0x16u);

    }
    -[MCMLRUCache mruItems](self, "mruItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeNodeAndAddToTail:", v10);

  }
  objc_msgSend(v10, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMLRUCache mruItems](self, "mruItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  -[MCMLRUCache storage](self, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v15 != v17)
  {
LABEL_9:
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    -[MCMLRUCache mruItems](self, "mruItems", v27, v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    -[MCMLRUCache storage](self, "storage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");
    v29 = 134218240;
    v30 = v24;
    v31 = 2048;
    v32 = v26;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v13;
}

- (MCMDoublyLinkedList)mruItems
{
  return self->_mruItems;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (MCMLRUCache)init
{
  return -[MCMLRUCache initWithName:maxCount:](self, "initWithName:maxCount:", CFSTR("default"), 10);
}

- (MCMLRUCache)initWithName:(id)a3 maxCount:(unint64_t)a4
{
  id v7;
  MCMLRUCache *v8;
  MCMLRUCache *v9;
  uint64_t v10;
  NSMutableDictionary *storage;
  uint64_t v12;
  MCMDoublyLinkedList *mruItems;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMLRUCache;
  v8 = -[MCMLRUCache init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_maxCount = a4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", a4);
    v10 = objc_claimAutoreleasedReturnValue();
    storage = v9->_storage;
    v9->_storage = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    mruItems = v9->_mruItems;
    v9->_mruItems = (MCMDoublyLinkedList *)v12;

    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)removeAllObjects
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  container_log_handle_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[MCMLRUCache name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMLRUCache mruItems](self, "mruItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_debug_impl(&dword_1CF807000, v4, OS_LOG_TYPE_DEBUG, "[%@] Evicting items from cache: %@", (uint8_t *)&v9, 0x16u);

  }
  -[MCMLRUCache storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[MCMLRUCache mruItems](self, "mruItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)count
{
  os_unfair_lock_s *p_lock;
  void *v4;
  unint64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MCMLRUCache mruItems](self, "mruItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mruItems, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
