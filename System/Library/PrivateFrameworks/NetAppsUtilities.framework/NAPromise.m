@implementation NAPromise

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NAFuture *v9;
  id v10;
  id v11;
  void *v12;
  id *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  BOOL v26;
  id *v28;
  BOOL v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = self->_future;
  v10 = v7;
  v11 = v8;
  v12 = v11;
  if (v9)
  {
    v30 = v11;
    v31 = v10;
    os_unfair_lock_lock(&v9->_lock);
    v29 = !v9->_finished;
    if (!v9->_finished)
    {
      objc_storeStrong(&v9->_resultValue, a3);
      objc_storeStrong((id *)&v9->_resultError, a4);
      v9->_finished = 1;
    }
    os_unfair_lock_unlock(&v9->_lock);
    v13 = v9;
    os_unfair_lock_lock(&v9->_lock);
    v14 = v13[4];
    v15 = v13[5];
    v16 = v13[2];
    v17 = (void *)objc_msgSend(v13[3], "copy");
    v18 = v13[3];
    v28 = v13;
    v13[3] = 0;

    os_unfair_lock_unlock(&v9->_lock);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      v23 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          v32[0] = v23;
          v32[1] = 3221225472;
          v32[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v32[3] = &unk_1E6228178;
          v35 = v25;
          v33 = v14;
          v34 = v15;
          objc_msgSend(v16, "performBlock:", v32, v28);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v21);
    }

    v10 = v31;
    v12 = v30;
    v26 = v29;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (NAPromise)init
{
  NAFuture *v3;
  NAPromise *v4;

  v3 = objc_alloc_init(NAFuture);
  v4 = -[NAPromise initWithFuture:](self, "initWithFuture:", v3);

  return v4;
}

- (NAPromise)initWithFuture:(id)a3
{
  id v5;
  NAPromise *v6;
  NAPromise *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NAPromise;
  v6 = -[NAPromise init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_future, a3);

  return v7;
}

- (NAFuture)future
{
  return (NAFuture *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
}

- (BOOL)finishWithResult:(id)a3
{
  id v5;
  NAFuture *v6;
  id v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  NSError *resultError;
  id *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  BOOL v24;
  BOOL v26;
  id v27;
  NAFuture *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_future;
  v7 = v5;
  v8 = v7;
  if (v6)
  {
    v27 = v7;
    p_lock = &v6->_lock;
    os_unfair_lock_lock(&v6->_lock);
    v26 = !v6->_finished;
    if (!v6->_finished)
    {
      objc_storeStrong(&v6->_resultValue, a3);
      resultError = v6->_resultError;
      v6->_resultError = 0;

      v6->_finished = 1;
    }
    os_unfair_lock_unlock(&v6->_lock);
    v28 = v6;
    v11 = v6;
    os_unfair_lock_lock(p_lock);
    v12 = v11[4];
    v13 = v11[5];
    v14 = v11[2];
    v15 = (void *)objc_msgSend(v11[3], "copy");
    v16 = v11[3];
    v11[3] = 0;

    os_unfair_lock_unlock(p_lock);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      v21 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29[0] = v21;
          v29[1] = 3221225472;
          v29[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v29[3] = &unk_1E6228178;
          v32 = v23;
          v30 = v12;
          v31 = v13;
          objc_msgSend(v14, "performBlock:", v29);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v19);
    }

    v8 = v27;
    v6 = v28;
    v24 = v26;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)completionHandlerAdapter
{
  return -[NAFuture completionHandlerAdapter](self->_future, "completionHandlerAdapter");
}

- (NSString)descriptor
{
  return -[NAFuture descriptor](self->_future, "descriptor");
}

- (void)setDescriptor:(id)a3
{
  -[NAFuture setDescriptor:](self->_future, "setDescriptor:", a3);
}

- (BOOL)finishWithError:(id)a3
{
  id v5;
  NAFuture *v6;
  id v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  id resultValue;
  id *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  BOOL v24;
  BOOL v26;
  id v27;
  NAFuture *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_future;
  v7 = v5;
  v8 = v7;
  if (v6)
  {
    v27 = v7;
    p_lock = &v6->_lock;
    os_unfair_lock_lock(&v6->_lock);
    v26 = !v6->_finished;
    if (!v6->_finished)
    {
      resultValue = v6->_resultValue;
      v6->_resultValue = 0;

      objc_storeStrong((id *)&v6->_resultError, a3);
      v6->_finished = 1;
    }
    os_unfair_lock_unlock(&v6->_lock);
    v28 = v6;
    v11 = v6;
    os_unfair_lock_lock(p_lock);
    v12 = v11[4];
    v13 = v11[5];
    v14 = v11[2];
    v15 = (void *)objc_msgSend(v11[3], "copy");
    v16 = v11[3];
    v11[3] = 0;

    os_unfair_lock_unlock(p_lock);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      v21 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29[0] = v21;
          v29[1] = 3221225472;
          v29[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v29[3] = &unk_1E6228178;
          v32 = v23;
          v30 = v12;
          v31 = v13;
          objc_msgSend(v14, "performBlock:", v29);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v19);
    }

    v8 = v27;
    v6 = v28;
    v24 = v26;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)finishWithNoResult
{
  return -[NAFuture finishWithNoResult](self->_future, "finishWithNoResult");
}

- (id)errorOnlyCompletionHandlerAdapter
{
  return -[NAFuture errorOnlyCompletionHandlerAdapter](self->_future, "errorOnlyCompletionHandlerAdapter");
}

@end
