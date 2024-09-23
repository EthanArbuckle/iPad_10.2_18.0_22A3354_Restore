@implementation IKJSEventListenerObject

- (void)addEventListener:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = objc_msgSend(v15, "length");
  if (v7
    && v8
    && !-[IKJSEventListenerObject _searchEventListener:key:destroy:](self, "_searchEventListener:key:destroy:", v7, v15, 0))
  {
    -[IKJSObject appContext](self, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "jsContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "virtualMachine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addManagedReference:withOwner:", v12, self);
    -[IKJSEventListenerObject eventListenersMap](self, "eventListenersMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKJSEventListenerObject setEventListenersMap:](self, "setEventListenersMap:", v13);
    }
    objc_msgSend(v13, "objectForKey:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v14, v15);
    }
    objc_msgSend(v14, "addObject:", v12);

  }
}

- (void)removeEventListener:(id)a3 :(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_msgSend(v8, "length");
  if (v6 && v7)
    -[IKJSEventListenerObject _searchEventListener:key:destroy:](self, "_searchEventListener:key:destroy:", v6, v8, 1);

}

- (BOOL)_searchEventListener:(id)a3 key:(id)a4 destroy:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t, _BYTE *);
  void *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0x7FFFFFFFFFFFFFFFLL;
  -[IKJSEventListenerObject eventListenersMap](self, "eventListenersMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __60__IKJSEventListenerObject__searchEventListener_key_destroy___block_invoke;
  v24 = &unk_1E9F4F1A8;
  v12 = v8;
  v25 = v12;
  v26 = &v27;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v21);
  v13 = v28[3];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    -[IKJSObject appContext](self, "appContext", v21, v22, v23, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "jsContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "virtualMachine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectAtIndex:", v28[3]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeManagedReference:withOwner:", v18, self);

    objc_msgSend(v11, "removeObjectAtIndex:", v28[3]);
    v13 = v28[3];
  }
  v19 = v13 != 0x7FFFFFFFFFFFFFFFLL;

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __60__IKJSEventListenerObject__searchEventListener_key_destroy___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

- (BOOL)invokeListeners:(id)a3 extraInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  BOOL v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_eventListenersMap, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v21 = v7;
    -[IKJSEventListenerObject _eventInformationForType:extraInfo:](self, "_eventInformationForType:extraInfo:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    v20 = v11 != 0;
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (id)objc_msgSend(v15, "callWithArguments:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v12);
    }

    v7 = v21;
    v18 = v20;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)invokeSingleListener:(id)a3 extraInfo:(id)a4 return:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0CBE108];
  -[IKJSObject appContext](self, "appContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueWithUndefinedInContext:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_eventListenersMap, "objectForKey:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[IKJSEventListenerObject _eventInformationForType:extraInfo:](self, "_eventInformationForType:extraInfo:", v8, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "callWithArguments:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v19;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v15 != 0;
}

- (BOOL)invokeMethod:(id)a3 withArguments:(id)a4 thenDispatchEvent:(id)a5 extraInfo:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a5;
  v12 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", a3, a4);
  LOBYTE(a4) = -[IKJSEventListenerObject invokeListeners:extraInfo:](self, "invokeListeners:extraInfo:", v11, v10);

  return (char)a4;
}

- (id)_eventInformationForType:(id)a3 extraInfo:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithCapacity:", 3);
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("type"));

  objc_msgSend(v9, "setObject:forKey:", self, CFSTR("target"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("timeStamp"));

  if (v6)
    objc_msgSend(v9, "addEntriesFromDictionary:", v6);
  v11 = (void *)objc_msgSend(v9, "copy");

  return v11;
}

- (NSMutableDictionary)eventListenersMap
{
  return self->_eventListenersMap;
}

- (void)setEventListenersMap:(id)a3
{
  objc_storeStrong((id *)&self->_eventListenersMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventListenersMap, 0);
}

@end
