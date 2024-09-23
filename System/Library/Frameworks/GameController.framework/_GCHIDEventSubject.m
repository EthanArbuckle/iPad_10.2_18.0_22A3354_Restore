@implementation _GCHIDEventSubject

- (_GCHIDEventSubject)init
{
  _GCHIDEventSubject *v2;
  NSDictionary *v3;
  NSDictionary *handlersByService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCHIDEventSubject;
  v2 = -[_GCHIDEventSubject init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init((Class)&off_254DEBCC0);
    handlersByService = v2->_handlersByService;
    v2->_handlersByService = v3;

  }
  return v2;
}

- (BOOL)isStopped
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_stopped);
  return v2 & 1;
}

- (void)setStopped:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_stopped);
}

- (void)publishHIDEvent:(__IOHIDEvent *)a3
{
  unsigned __int8 v3;
  uint64_t SenderID;
  os_unfair_lock_s *p_lock;
  NSDictionary *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = atomic_load((unsigned __int8 *)&self->_stopped);
  if ((v3 & 1) == 0)
  {
    SenderID = IOHIDEventGetSenderID();
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v8 = self->_handlersByService;
    os_unfair_lock_unlock(p_lock);
    if ((unint64_t)(SenderID - 1) > 0xFFFFFFFFFFFFFFFDLL)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __38___GCHIDEventSubject_publishHIDEvent___block_invoke;
      v20[3] = &__block_descriptor_40_e34_v32__0__NSNumber_8__NSArray_16_B24l;
      v20[4] = a3;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v20);
    }
    else
    {
      +[NSNumber numberWithUnsignedLongLong:](&off_254DED908, "numberWithUnsignedLongLong:", SenderID);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v26;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v10);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14++) + 16))();
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v12);
      }
      -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", &unk_24D30DDF8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v15);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19++) + 16))();
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v17);
      }

    }
  }
}

- (id)observeHIDEvents:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *handlersByService;
  _GCObservation *v18;
  _QWORD v20[6];
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;

  v6 = a3;
  v7 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  v25 = (id)objc_msgSend(v6, "copy");
  os_unfair_lock_lock(&self->_lock);
  v8 = (void *)-[NSDictionary mutableCopy](self->_handlersByService, "mutableCopy");
  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __50___GCHIDEventSubject_observeHIDEvents_forService___block_invoke;
  v21[3] = &unk_24D2B2FB8;
  v10 = v8;
  v22 = v10;
  v23 = v24;
  v11 = MEMORY[0x2199DEBB0](v21);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  if (v7)
  {
    objc_msgSend(v7, "registryID");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = &unk_24D30DDF8;
    ((void (**)(_QWORD, void *, id))v12)[2](v12, v15, v6);

  }
  else
  {
    (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, &unk_24D30DDF8, v6);
  }
  v16 = (NSDictionary *)objc_msgSend(v10, "copy");
  handlersByService = self->_handlersByService;
  self->_handlersByService = v16;

  os_unfair_lock_unlock(&self->_lock);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __50___GCHIDEventSubject_observeHIDEvents_forService___block_invoke_2;
  v20[3] = &unk_24D2B3008;
  v20[4] = self;
  v20[5] = v24;
  v18 = -[_GCObservation initWithCleanupHandler:]([_GCObservation alloc], "initWithCleanupHandler:", v20);
  _Block_object_dispose(v24, 8);

  return v18;
}

- (id)observeHIDEvents:(id)a3
{
  return -[_GCHIDEventSubject observeHIDEvents:forService:](self, "observeHIDEvents:forService:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlersByService, 0);
}

@end
