@implementation GEOConfigStorageDirectReadWrite

void __60__GEOConfigStorageDirectReadWrite__scheduleWriteDirectStore__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  char v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id WeakRetained;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)WeakRetained + 2), "URLByDeletingLastPathComponent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v3 = objc_msgSend(v1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v26);
    v4 = v26;

    if ((v3 & 1) == 0)
    {
      j__GEOGetUserDefaultsLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v4;
        _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Failed to create parent directory for direct config store: %{public}@", buf, 0xCu);
      }

    }
    v6 = *MEMORY[0x1E0CB2AE0];
    v7 = *MEMORY[0x1E0CB2AA8];
    v31[0] = *MEMORY[0x1E0CB2AD8];
    v31[1] = v7;
    v32[0] = v6;
    v32[1] = &unk_1E1E81640;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2, WeakRetained);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)WeakRetained + 2), "absoluteURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createFileAtPath:contents:attributes:", v11, 0, v8);

    os_unfair_lock_lock_with_options();
    v12 = *((_QWORD *)WeakRetained + 4);
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v12, 200, 0, &v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v25;

    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
    if (!v13 || v14)
    {
      -[GEOConfigStorageDirectReadWrite _clearWriteTransaction]((uint64_t)WeakRetained);
      j__GEOGetUserDefaultsLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Unable to generate plist from direct store: %@", buf, 0xCu);
      }
    }
    else
    {
      os_unfair_lock_lock_with_options();
      v15 = objc_msgSend(*((id *)WeakRetained + 8), "copy");
      objc_msgSend(*((id *)WeakRetained + 8), "removeAllObjects");
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 11);
      v16 = *((_QWORD *)WeakRetained + 2);
      v24 = 0;
      v17 = objc_msgSend(v13, "writeToURL:options:error:", v16, 268435457, &v24);
      v14 = v24;
      if ((v17 & 1) == 0)
      {
        j__GEOGetUserDefaultsLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)*((_QWORD *)WeakRetained + 2);
          *(_DWORD *)buf = 138412546;
          v28 = v19;
          v29 = 2112;
          v30 = v14;
          _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "Unable to write direct store %@: %@", buf, 0x16u);
        }

      }
      if (-[NSObject count](v15, "count"))
      {
        v20 = *((_QWORD *)WeakRetained + 1);
        if (v20 > 9)
          v21 = 991232;
        else
          v21 = qword_189CE17A0[v20];
        -[NSObject allObjects](v15, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        _GEOConfigPostKeysChangedNotification(v22, v21);

      }
      -[GEOConfigStorageDirectReadWrite _clearWriteTransaction]((uint64_t)WeakRetained);
    }

  }
}

- (void)_clearWriteTransaction
{
  os_unfair_lock_s *v2;
  void *v3;

  v2 = (os_unfair_lock_s *)(a1 + 44);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
  v3 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = 0;

  os_unfair_lock_unlock(v2);
}

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  id v8;
  os_unfair_lock_s *p_valueStoreLock;
  uint64_t v10;
  char v11;
  OS_dispatch_source *writeTimer;
  OS_dispatch_source *v13;
  OS_dispatch_source *v14;
  NSObject *writeTransaction;
  NSObject *v16;
  NSObject *global_queue;
  dispatch_source_t v18;
  id v19;
  NSObject *v20;
  dispatch_time_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  _QWORD handler[4];
  id v26;
  id location;

  v24 = (unint64_t)a3;
  v8 = a4;
  p_valueStoreLock = &self->super._valueStoreLock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._valueStore, "objectForKeyedSubscript:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._valueStore, "setObject:forKeyedSubscript:", v24, v8);
  if (!(v24 | v10))
    goto LABEL_9;
  v11 = objc_msgSend((id)v10, "isEqual:");
  os_unfair_lock_unlock(&self->super._valueStoreLock);
  if ((v11 & 1) == 0)
  {
    p_valueStoreLock = (os_unfair_lock_s *)(&self->super._isReading + 4);
    os_unfair_lock_lock_with_options();
    writeTimer = self->_writeTimer;
    if (!writeTimer)
    {
      v13 = (OS_dispatch_source *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 5);
      v14 = self->_writeTimer;
      self->_writeTimer = v13;

      writeTimer = self->_writeTimer;
    }
    -[OS_dispatch_source addObject:](writeTimer, "addObject:", v8);
    os_unfair_lock_unlock((os_unfair_lock_t)&self->super._isReading + 1);
    os_unfair_lock_lock((os_unfair_lock_t)&self->super._isReading + 1);
    writeTransaction = self->_writeTransaction;
    v16 = writeTransaction;
    if (!writeTransaction)
    {
      objc_initWeak(&location, self);
      global_queue = geo_get_global_queue();
      v18 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_queue);
      v19 = self->_writeTransaction;
      self->_writeTransaction = v18;

      v20 = self->_writeTransaction;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __60__GEOConfigStorageDirectReadWrite__scheduleWriteDirectStore__block_invoke;
      handler[3] = &unk_1E1BFF8B0;
      objc_copyWeak(&v26, &location);
      dispatch_source_set_event_handler(v20, handler);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
      v16 = self->_writeTransaction;
    }
    v21 = dispatch_time(0, 500000000);
    dispatch_source_set_timer(v16, v21, 0xFFFFFFFFFFFFFFFFLL, 0xBEBC200uLL);
    if (*(_QWORD *)&self->_writeLock._os_unfair_lock_opaque)
    {
      if (writeTransaction)
      {
LABEL_9:
        os_unfair_lock_unlock(p_valueStoreLock);
        goto LABEL_10;
      }
    }
    else
    {
      _GEOCreateTransaction();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(void **)&self->_writeLock._os_unfair_lock_opaque;
      *(_QWORD *)&self->_writeLock._os_unfair_lock_opaque = v22;

      if (writeTransaction)
        goto LABEL_9;
    }
    dispatch_activate((dispatch_object_t)self->_writeTransaction);
    goto LABEL_9;
  }
LABEL_10:

}

- (GEOConfigStorageDirectReadWrite)initWithPath:(id)a3 forSource:(int64_t)a4
{
  GEOConfigStorageDirectReadWrite *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOConfigStorageDirectReadWrite;
  result = -[GEOConfigStorageDirectReadOnly initWithPath:forSource:](&v5, sel_initWithPath_forSource_, a3, a4);
  if (result)
    *((_DWORD *)&result->super._isReading + 1) = 0;
  return result;
}

- (void)dealloc
{
  NSObject *writeTransaction;
  objc_super v4;

  writeTransaction = self->_writeTransaction;
  if (writeTransaction)
  {
    dispatch_source_set_event_handler(writeTransaction, &__block_literal_global_180);
    dispatch_source_cancel((dispatch_source_t)self->_writeTransaction);
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOConfigStorageDirectReadWrite;
  -[GEOConfigStorageDirectReadWrite dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeTimer, 0);
  objc_storeStrong(&self->_writeTransaction, 0);
  objc_storeStrong((id *)&self->_writeLock, 0);
}

@end
