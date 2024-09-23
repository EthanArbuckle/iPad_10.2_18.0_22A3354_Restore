@implementation IKDOMEventDispatcher

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__IKDOMEventDispatcher_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_dispatcher;
}

void __38__IKDOMEventDispatcher_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_dispatcher;
  sharedInstance_dispatcher = (uint64_t)v1;

}

- (BOOL)dispatchEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setInUse:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    do
    {
      objc_msgSend(v5, "insertObject:atIndex:", v7, 0);
      objc_msgSend(v7, "parentNode");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    while (v8);
  }
  objc_msgSend(v5, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IKDOMEventDispatcher _runPhase:event:nodeEn:](self, "_runPhase:event:nodeEn:", 1, v4, v9);

  if ((objc_msgSend(v4, "isPropagationStopped") & 1) == 0)
  {
    objc_msgSend(v4, "target");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 |= -[IKDOMEventDispatcher _runPhase:event:nodeEn:](self, "_runPhase:event:nodeEn:", 2, v4, v13);

  }
  if ((objc_msgSend(v4, "isPropagationStopped") & 1) == 0 && objc_msgSend(v4, "bubbles"))
  {
    objc_msgSend(v5, "reverseObjectEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 |= -[IKDOMEventDispatcher _runPhase:event:nodeEn:](self, "_runPhase:event:nodeEn:", 3, v4, v14);

  }
  objc_msgSend(v4, "setInUse:", 0);

  return v10;
}

- (BOOL)_runPhase:(int64_t)a3 event:(id)a4 nodeEn:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v7 = a4;
  v8 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v8, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      if ((objc_msgSend(v7, "isPropagationStopped") & 1) != 0)
        break;
      objc_msgSend(v7, "updateDispatchStateWithCurrentTarget:phase:", v9, a3);
      objc_msgSend(v7, "type");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "xmlAttribute");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v10;
      v16[1] = 3221225472;
      v16[2] = __47__IKDOMEventDispatcher__runPhase_event_nodeEn___block_invoke;
      v16[3] = &unk_1E9F4BC48;
      v18 = &v19;
      v17 = v7;
      objc_msgSend(v9, "enumerateEventListernersForType:xmlAttribute:phase:usingBlock:", v11, v12, a3, v16);

      objc_msgSend(v8, "nextObject");
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v13;
    }
    while (v13);

  }
  v14 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);

  return v14;
}

void __47__IKDOMEventDispatcher__runPhase_event_nodeEn___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (objc_msgSend(v5, "isEnabled"))
  {
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "callWithArguments:", v7);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isImmediatePropagationStopped"))
    *a3 = 1;

}

@end
