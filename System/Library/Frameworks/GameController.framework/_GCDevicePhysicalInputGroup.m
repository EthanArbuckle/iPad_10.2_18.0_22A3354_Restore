@implementation _GCDevicePhysicalInputGroup

- (_GCDevicePhysicalInputGroup)initWithPhysicalInputs:(id)a3
{
  id v4;
  _GCDevicePhysicalInputGroup *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *physicalInputs;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *v21;
  void *v22;
  uint64_t v23;
  _GCDevicePhysicalInputBase *defaultPhysicalInput;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  void *v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputGroup.m"), 41, CFSTR("Invalid parameter not satisfying: %s"), "physicalInputs != nil");

  }
  if (!objc_msgSend(v4, "count"))
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputGroup.m"), 42, CFSTR("Invalid parameter not satisfying: %s"), "physicalInputs.count > 0");

  }
  v34.receiver = self;
  v34.super_class = (Class)_GCDevicePhysicalInputGroup;
  v5 = -[_GCDevicePhysicalInputGroup init](&v34, sel_init);
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDataSource:", v5);

    +[NSSet set](&off_254DEBEC0, "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v7;
    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v8;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    physicalInputs = v5->_physicalInputs;
    v5->_physicalInputs = (NSDictionary *)v9;

  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBD30), "initWithCapacity:", objc_msgSend(v4, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[_GCDevicePhysicalInputBase attributes]((uint64_t)v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            unk_254DEC4F8(&off_254DEC660, "currentHandler");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("_GCDevicePhysicalInputGroup.m"), 52, CFSTR("Multiple physical inputs with attributes %@: %@"), v17, v11);

          }
          objc_msgSend(v7, "setObject:forKey:", v16, v17);
          objc_msgSend(v16, "setDataSource:", v5);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v13);
    }

    v20 = objc_msgSend(v7, "copy");
    v8 = v5->_physicalInputs;
    v5->_physicalInputs = (NSDictionary *)v20;
  }

  v21 = v5->_physicalInputs;
  +[NSSet set](&off_254DEBEC0, "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](v21, "objectForKey:", v22);
  v23 = objc_claimAutoreleasedReturnValue();
  defaultPhysicalInput = v5->_defaultPhysicalInput;
  v5->_defaultPhysicalInput = (_GCDevicePhysicalInputBase *)v23;

  if (!v5->_defaultPhysicalInput)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("_GCDevicePhysicalInputGroup.m"), 59, CFSTR("Missing default physical input"));

  }
  objc_opt_class();
  v5->_isSnapshot = (objc_opt_isKindOfClass() & 1) == 0;

  return v5;
}

- (_GCDevicePhysicalInputGroup)init
{
  -[_GCDevicePhysicalInputGroup doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_physicalInputs, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_13);
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputGroup;
  -[_GCDevicePhysicalInputGroup dealloc](&v3, sel_dealloc);
}

- (void)setDevice:(id)a3
{
  -[NSDictionary gc_makeValuesPerformSelector:withObject:](self->_physicalInputs, "gc_makeValuesPerformSelector:withObject:", sel_setDevice_, a3);
}

- (id)physicalInputs
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "allValues");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)physicalInputWithAttributes:(id)a3
{
  id v4;
  void *v5;
  _GCDevicePhysicalInputBase *v6;
  _GCDevicePhysicalInputBase *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[NSDictionary objectForKey:](self->_physicalInputs, "objectForKey:", v5);
    v6 = (_GCDevicePhysicalInputBase *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self->_defaultPhysicalInput;
  }
  v7 = v6;

  return v7;
}

- (id)queue
{
  id *v1;
  id v2;

  if (!a1 || a1[40])
  {
    v2 = 0;
  }
  else
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = v1[4];
    objc_sync_exit(v1);

  }
  return v2;
}

- (void)_locked_setClientQueue:(int)a3 override:
{
  id v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  id WeakRetained;
  id v11;

  v6 = a2;
  if (a1 && !*(_BYTE *)(a1 + 40))
  {
    if (a3)
      *(_BYTE *)(a1 + 41) = 1;
    if (*(id *)(a1 + 24) != v6)
    {
      v11 = v6;
      objc_msgSend(*(id *)(a1 + 8), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_74_0);
      objc_storeStrong((id *)(a1 + 24), a2);
      v7 = *(NSObject **)(a1 + 24);
      if (v7)
      {
        v8 = dispatch_queue_create_with_target_V2("GCDevicePhysicalInput", 0, v7);
        v9 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v8;
      }
      else
      {
        v9 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = 0;
      }

      objc_msgSend(*(id *)(a1 + 8), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_78);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "physicalInputGroupQueueDidChange:", a1);

      v6 = v11;
    }
  }

}

- (id)dataSource
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 6);
  return WeakRetained;
}

- (void)setDeviceDispatchQueue:(void *)a1
{
  _BYTE *v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    if (!v3[41])
      -[_GCDevicePhysicalInputGroup _locked_setClientQueue:override:]((uint64_t)v3, v4, 0);
    objc_sync_exit(v3);

  }
}

- (uint64_t)transactionQueueDepth
{
  void *v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  if (!a1 || *(_BYTE *)(a1 + 40))
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v1 = *(void **)(a1 + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52___GCDevicePhysicalInputGroup_transactionQueueDepth__block_invoke;
  v4[3] = &unk_24D2B4518;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)physicalInputQueue:(id)a3
{
  _GCDevicePhysicalInputGroup *v3;
  OS_dispatch_queue *v4;

  v3 = self;
  objc_sync_enter(v3);
  v4 = v3->_clientQueue;
  objc_sync_exit(v3);

  return v4;
}

- (void)physicalInput:(id)a3 setQueue:(id)a4
{
  id v6;
  _GCDevicePhysicalInputGroup *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[_GCDevicePhysicalInputGroup _locked_setClientQueue:override:]((uint64_t)v7, v6, 1);
  objc_sync_exit(v7);

}

- (void)physicalInputTransactionQueueDepthDidChange:(id)a3
{
  _GCDevicePhysicalInputGroup *v3;
  _GCDevicePhysicalInputGroup *v4;

  v3 = self;
  if (self)
    self = (_GCDevicePhysicalInputGroup *)objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = self;
  -[_GCDevicePhysicalInputGroup physicalInputGroupPreferredTransactionQueueDepthDidChange:](self, "physicalInputGroupPreferredTransactionQueueDepthDidChange:", v3);

}

- (void)physicalInputPoll:(id)a3 forLatest:(BOOL)a4
{
  _GCDevicePhysicalInputGroup *v4;
  _GCDevicePhysicalInputGroup *v5;

  v4 = self;
  if (self)
    self = (_GCDevicePhysicalInputGroup *)objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = self;
  -[_GCDevicePhysicalInputGroup physicalInputGroupPoll:forLatest:](self, "physicalInputGroupPoll:forLatest:", v4, 0);

}

- (id)defaultPhysicalInput
{
  if (result)
    return objc_getProperty(result, a2, 16, 1);
  return result;
}

- (id)setDataSource:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 6, a2);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_defaultPhysicalInput, 0);
  objc_storeStrong((id *)&self->_physicalInputs, 0);
}

- (BOOL)isSnapshot
{
  if (result)
    return *(_BYTE *)(result + 40) != 0;
  return result;
}

- (_GCDevicePhysicalInputGroup)capture
{
  void *v2;
  void *v3;
  _GCDevicePhysicalInputGroup *v4;
  _GCDevicePhysicalInputGroup *v5;
  _GCDevicePhysicalInputGroup *v6;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 8), "allValues");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "gc_arrayByTransformingElementsUsingBlock:", &__block_literal_global_153);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = [_GCDevicePhysicalInputGroup alloc];
    }
    else
    {
      v5 = [_GCDevicePhysicalInputGroup alloc];
      objc_msgSend(*(id *)(a1 + 8), "allValues");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v5;
    }
    v6 = -[_GCDevicePhysicalInputGroup initWithPhysicalInputs:](v4, "initWithPhysicalInputs:", v3);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)handleGamepadEvent:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v6[1] = 3221225472;
    v6[2] = __65___GCDevicePhysicalInputGroup_EventHandling__handleGamepadEvent___block_invoke;
    v6[3] = &unk_24D2B4580;
    v5 = v3;
    v6[0] = MEMORY[0x24BDAC760];
    v7 = v3;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

    v3 = v5;
  }

}

@end
