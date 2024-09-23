@implementation VSJSEventTargetObject

- (VSJSEventTargetObject)initWithContext:(id)a3
{
  VSJSEventTargetObject *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *listeners;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSJSEventTargetObject;
  v3 = -[VSJSObject initWithContext:](&v7, sel_initWithContext_, a3);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    listeners = v3->_listeners;
    v3->_listeners = v4;

  }
  return v3;
}

- (void)addEventListener:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  if (objc_msgSend(v14, "length")
    && -[VSJSEventTargetObject _indexForListener:withEventType:](self, "_indexForListener:withEventType:", v7, v14) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CBE0F0], "currentContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "virtualMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addManagedReference:withOwner:", v10, self);
    -[VSJSEventTargetObject listeners](self, "listeners");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[VSJSEventTargetObject listeners](self, "listeners");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

    }
    objc_msgSend(v12, "addObject:", v10);

  }
}

- (void)removeEventListener:(id)a3 :(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = -[VSJSEventTargetObject _indexForListener:withEventType:](self, "_indexForListener:withEventType:", a4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    -[VSJSEventTargetObject listeners](self, "listeners");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSJSEventTargetObject listeners](self, "listeners");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectAtIndex:", v7);

    objc_msgSend(MEMORY[0x1E0CBE0F0], "currentContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "virtualMachine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "removeManagedReference:withOwner:", v10, self);
  }

}

- (void)dispatchEvent:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[VSJSEventTargetObject listeners](self, "listeners");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "value", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (id)objc_msgSend(v15, "callWithArguments:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v12);
  }

}

- (unint64_t)_indexForListener:(id)a3 withEventType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0x7FFFFFFFFFFFFFFFLL;
  -[VSJSEventTargetObject listeners](self, "listeners");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__VSJSEventTargetObject__indexForListener_withEventType___block_invoke;
  v13[3] = &unk_1E939EDE0;
  v10 = v6;
  v14 = v10;
  v15 = &v16;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);
  v11 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __57__VSJSEventTargetObject__indexForListener_withEventType___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;

  objc_msgSend(a2, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (NSMutableDictionary)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
