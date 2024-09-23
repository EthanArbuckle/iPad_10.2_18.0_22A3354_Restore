@implementation HMPendingRequests

- (id)removeRequestOfType:(int64_t)a3 forIdentifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[HMPendingRequests _retrieveRequestOfType:forIdentifier:remove:](self, "_retrieveRequestOfType:forIdentifier:remove:", a3, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);

  return v7;
}

- (id)_retrieveRequestOfType:(int64_t)a3 forIdentifier:(id)a4 remove:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  if (a3 > 9)
  {
    v11 = 0;
  }
  else
  {
    -[HMPendingRequests contextLists](self, "contextLists");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && v5)
        objc_msgSend(v10, "removeObjectForKey:", v8);
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (NSMutableArray)contextLists
{
  return self->_contextLists;
}

- (id)removeCompletionBlockForIdentifier:(id)a3
{
  return -[HMPendingRequests removeRequestOfType:forIdentifier:](self, "removeRequestOfType:forIdentifier:", 0, a3);
}

- (id)retrieveRequestOfType:(int64_t)a3 forIdentifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[HMPendingRequests _retrieveRequestOfType:forIdentifier:remove:](self, "_retrieveRequestOfType:forIdentifier:remove:", a3, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);

  return v7;
}

- (id)retrieveCompletionBlockForIdentifier:(id)a3
{
  return -[HMPendingRequests retrieveRequestOfType:forIdentifier:](self, "retrieveRequestOfType:forIdentifier:", 0, a3);
}

- (void)addRequest:(id)a3 ofType:(int64_t)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  os_unfair_lock_lock_with_options();
  -[HMPendingRequests _addRequest:ofType:forIdentifier:](self, "_addRequest:ofType:forIdentifier:", v9, a4, v8);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_addRequest:(id)a3 ofType:(int64_t)a4 forIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  if (a4 <= 9)
  {
    -[HMPendingRequests contextLists](self, "contextLists");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && v10)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v8);

  }
}

- (void)addCompletionBlock:(id)a3 forIdentifier:(id)a4
{
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", a3, 0, a4);
}

- (HMPendingRequests)init
{
  HMPendingRequests *v2;
  uint64_t v3;
  NSMutableArray *contextLists;
  uint64_t i;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMPendingRequests;
  v2 = -[HMPendingRequests init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    contextLists = v2->_contextLists;
    v2->_contextLists = (NSMutableArray *)v3;

    for (i = 0; i != 10; ++i)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray setObject:atIndexedSubscript:](v2->_contextLists, "setObject:atIndexedSubscript:", v6, i);

    }
  }
  return v2;
}

- (id)retrieveProgressBlockForIdentifier:(id)a3
{
  return -[HMPendingRequests retrieveRequestOfType:forIdentifier:](self, "retrieveRequestOfType:forIdentifier:", 7, a3);
}

- (id)retrieveAccessoryDescriptionForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[HMPendingRequests retrieveRequestOfType:forIdentifier:](self, "retrieveRequestOfType:forIdentifier:", 8, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)addAction:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", a3, 3, v8);
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", v9, 0, v8);

}

- (id)removeActionForIdentifier:(id)a3
{
  void *v3;
  id v4;

  -[HMPendingRequests removeRequestOfType:forIdentifier:](self, "removeRequestOfType:forIdentifier:", 3, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)addEvent:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", a3, 4, v8);
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", v9, 0, v8);

}

- (id)removeEventForIdentifier:(id)a3
{
  void *v3;
  id v4;

  -[HMPendingRequests removeRequestOfType:forIdentifier:](self, "removeRequestOfType:forIdentifier:", 4, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)addEvents:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", a3, 5, v8);
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", v9, 0, v8);

}

- (id)removeEventsForIdentifier:(id)a3
{
  void *v3;
  id v4;

  -[HMPendingRequests removeRequestOfType:forIdentifier:](self, "removeRequestOfType:forIdentifier:", 5, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)addApplicationData:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", a3, 6, v8);
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", v9, 0, v8);

}

- (id)removeApplicationDataForIdentifier:(id)a3
{
  void *v3;
  id v4;

  -[HMPendingRequests removeRequestOfType:forIdentifier:](self, "removeRequestOfType:forIdentifier:", 6, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)addAccessory:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", a3, 1, v8);
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", v9, 0, v8);

}

- (id)removeAccessoryForIdentifier:(id)a3
{
  void *v3;
  id v4;

  -[HMPendingRequests removeRequestOfType:forIdentifier:](self, "removeRequestOfType:forIdentifier:", 1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)addAccessoryDescription:(id)a3 progressBlock:(id)a4 andCompletionBlock:(id)a5 forIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;

  v12 = a4;
  v10 = a5;
  v11 = a6;
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", a3, 8, v11);
  if (v12)
    -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", v12, 7, v11);
  if (v10)
    -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", v10, 0, v11);

}

- (id)uuidForAccessoryDescriptionUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__37546;
  v18 = __Block_byref_object_dispose__37547;
  v19 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMPendingRequests contextLists](self, "contextLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__HMPendingRequests_uuidForAccessoryDescriptionUUID___block_invoke;
  v11[3] = &unk_1E3AB3878;
  v8 = v4;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  os_unfair_lock_unlock(p_lock);
  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)removeAccessoryDescriptionForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[HMPendingRequests removeRequestOfType:forIdentifier:](self, "removeRequestOfType:forIdentifier:", 8, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)removeProgressBlockForIdentifier:(id)a3
{
  return -[HMPendingRequests removeRequestOfType:forIdentifier:](self, "removeRequestOfType:forIdentifier:", 7, a3);
}

- (void)addTrigger:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", a3, 2, v8);
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", v9, 0, v8);

}

- (id)removeTriggerForIdentifier:(id)a3
{
  void *v3;
  id v4;

  -[HMPendingRequests removeRequestOfType:forIdentifier:](self, "removeRequestOfType:forIdentifier:", 2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)addProgressHandler:(id)a3 forAccessoryIdentifier:(id)a4
{
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", a3, 7, a4);
}

- (void)addMediaSystemBuilder:(id)a3 andCompletionBlock:(id)a4 forIdentifier:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", a3, 9, v8);
  -[HMPendingRequests addRequest:ofType:forIdentifier:](self, "addRequest:ofType:forIdentifier:", v9, 0, v8);

}

- (id)removeMediaSystemBuilderForIdentifier:(id)a3
{
  void *v3;
  id v4;

  -[HMPendingRequests removeRequestOfType:forIdentifier:](self, "removeRequestOfType:forIdentifier:", 9, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)setContextLists:(id)a3
{
  objc_storeStrong((id *)&self->_contextLists, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextLists, 0);
}

void __53__HMPendingRequests_uuidForAccessoryDescriptionUUID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  int v15;
  id v16;

  v16 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v16;
  else
    v8 = 0;
  v9 = v8;
  v10 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v9)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    objc_msgSend(v12, "accessoryUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v15)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
      *a4 = 1;
    }
  }

}

@end
