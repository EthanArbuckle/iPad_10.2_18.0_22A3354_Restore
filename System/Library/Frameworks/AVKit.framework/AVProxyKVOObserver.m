@implementation AVProxyKVOObserver

- (void)startObserving:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[5];
  id v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (-[AVProxyKVOObserver includeChanges](self, "includeChanges"))
      v8 = 3;
    else
      v8 = 0;
    kdebug_trace();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[AVProxyKVOObserver keyPaths](self, "keyPaths", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13++), v8, AVObservationControllerObservationContext);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v11);
    }

    kdebug_trace();
    self->_canHandleChanges = 1;
    if (-[AVProxyKVOObserver includeInitialValue](self, "includeInitialValue"))
    {
      kdebug_trace();
      -[AVProxyKVOObserver keyPaths](self, "keyPaths");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "anyObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "valueForKeyPath:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVProxyKVOObserver _handleValueChangeForKeyPath:ofObject:oldValue:newValue:context:](self, "_handleValueChangeForKeyPath:ofObject:oldValue:newValue:context:", v15, v6, 0, v16, AVObservationControllerObservationContext);

      kdebug_trace();
    }
    v7[2](v7);
  }
  else
  {
    v17 = (void *)objc_msgSend(v7, "copy");

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__AVProxyKVOObserver_startObserving_completion___block_invoke;
    block[3] = &unk_1E5BB4C38;
    block[4] = self;
    v23 = v6;
    v7 = v17;
    v24 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (NSSet)keyPaths
{
  return self->_keyPaths;
}

- (BOOL)includeChanges
{
  return self->_includeChanges;
}

- (BOOL)includeInitialValue
{
  return self->_includeInitialValue;
}

- (void)_handleValueChangeForKeyPath:(id)a3 ofObject:(id)a4 oldValue:(id)a5 newValue:(id)a6 context:(void *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void (**v16)(id, id, id, id, id, void *);

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[AVProxyKVOObserver changesBlock](self, "changesBlock");
  v16 = (void (**)(id, id, id, id, id, void *))objc_claimAutoreleasedReturnValue();
  -[AVProxyKVOObserver token](self, "token");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2](v16, v13, v14, v11, v12, v15);

}

- (NSString)token
{
  return self->_token;
}

- (id)changesBlock
{
  return self->_changesBlock;
}

- (AVProxyKVOObserver)initWithObservedObject:(id)a3 observer:(id)a4 keyPaths:(id)a5 retainingObservedObject:(BOOL)a6 includeInitialValue:(BOOL)a7 includeChanges:(BOOL)a8 changesBlock:(id)a9
{
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  AVProxyKVOObserver *v18;
  AVProxyKVOObserver *v19;
  uint64_t v20;
  NSSet *keyPaths;
  void *v22;
  uint64_t v23;
  NSString *token;
  uint64_t v25;
  id changesBlock;
  objc_super v28;

  v11 = a6;
  v15 = a3;
  v16 = a5;
  v17 = a9;
  v28.receiver = self;
  v28.super_class = (Class)AVProxyKVOObserver;
  v18 = -[AVProxyKVOObserver init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    if (v11)
      objc_storeStrong(&v18->_retainedObservedObject, a3);
    v19->_unsafeUnretainedObservedObject = v15;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
    v20 = objc_claimAutoreleasedReturnValue();
    keyPaths = v19->_keyPaths;
    v19->_keyPaths = (NSSet *)v20;

    v19->_includeInitialValue = a7;
    v19->_includeChanges = a8;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "globallyUniqueString");
    v23 = objc_claimAutoreleasedReturnValue();
    token = v19->_token;
    v19->_token = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    changesBlock = v19->_changesBlock;
    v19->_changesBlock = (id)v25;

  }
  return v19;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  kdebug_trace();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVProxyKVOObserver _handleValueChangeForKeyPath:ofObject:oldValue:newValue:context:](self, "_handleValueChangeForKeyPath:ofObject:oldValue:newValue:context:", v12, v11, v14, v13, a6);
  kdebug_trace();

}

- (void)stopObserving
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id retainedObservedObject;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[AVProxyKVOObserver keyPaths](self, "keyPaths", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(self->_unsafeUnretainedObservedObject, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), AVObservationControllerObservationContext);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  retainedObservedObject = self->_retainedObservedObject;
  self->_retainedObservedObject = 0;

  self->_unsafeUnretainedObservedObject = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changesBlock, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong(&self->_retainedObservedObject, 0);
}

uint64_t __48__AVProxyKVOObserver_startObserving_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startObserving:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
