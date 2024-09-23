@implementation _BPSAbstractZip

- (_BPSAbstractZip)initWithDownstream:(id)a3 upstreamCount:(int64_t)a4
{
  _BPSAbstractZip *v7;
  _BPSAbstractZip *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *buffers;
  uint64_t v12;
  NSMutableArray *upstreamFinished;
  uint64_t v14;
  NSMutableArray *subscriptions;
  uint64_t v16;
  NSMutableArray *v17;
  void *v18;
  NSMutableArray *v19;
  void *v20;
  id v22;
  objc_super v23;

  v22 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_BPSAbstractZip;
  v7 = -[_BPSAbstractZip init](&v23, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_downstream, a3);
    v8->_upstreamCount = a4;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    v10 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    buffers = v8->_buffers;
    v8->_buffers = (NSMutableArray *)v10;

    v12 = objc_msgSend(v9, "mutableCopy");
    upstreamFinished = v8->_upstreamFinished;
    v8->_upstreamFinished = (NSMutableArray *)v12;

    v14 = objc_msgSend(v9, "mutableCopy");
    subscriptions = v8->_subscriptions;
    v8->_subscriptions = (NSMutableArray *)v14;

    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_downstreamLock = 0;
    if (a4 >= 1)
    {
      v16 = MEMORY[0x1E0C9AAA0];
      do
      {
        v17 = v8->_subscriptions;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v17, "addObject:", v18);

        v19 = v8->_buffers;
        v20 = (void *)objc_msgSend(v9, "mutableCopy");
        -[NSMutableArray addObject:](v19, "addObject:", v20);

        -[NSMutableArray addObject:](v8->_upstreamFinished, "addObject:", v16);
        --a4;
      }
      while (a4);
    }
  }

  return v8;
}

- (void)receiveSubscription:(id)a3 index:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (-[_BPSAbstractZip upstreamCount](self, "upstreamCount") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSZip.m"), 56, CFSTR("Index should be less than upstream count"));

  }
  os_unfair_lock_lock(&self->_lock);
  if (-[_BPSAbstractZip cancelled](self, "cancelled"))
    goto LABEL_16;
  if (-[_BPSAbstractZip errored](self, "errored"))
    goto LABEL_16;
  if (-[_BPSAbstractZip finished](self, "finished"))
    goto LABEL_16;
  -[_BPSAbstractZip subscriptions](self, "subscriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
LABEL_16:
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v7, "cancel");
  }
  else
  {
    -[_BPSAbstractZip subscriptions](self, "subscriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:atIndexedSubscript:", v7, a4);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[_BPSAbstractZip subscriptions](self, "subscriptions", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v17);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v18) = objc_msgSend(v18, "isEqual:", v19);

          if ((v18 & 1) != 0)
          {

            -[_BPSAbstractZip setRecursive:](self, "setRecursive:", 0);
            os_unfair_lock_unlock(&self->_lock);
            goto LABEL_17;
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v15)
          continue;
        break;
      }
    }

    -[_BPSAbstractZip setRecursive:](self, "setRecursive:", 1);
    os_unfair_lock_unlock(&self->_lock);
    os_unfair_recursive_lock_lock_with_options();
    -[_BPSAbstractZip downstream](self, "downstream");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "receiveSubscription:", self);

    os_unfair_recursive_lock_unlock();
    os_unfair_lock_lock(&self->_lock);
    -[_BPSAbstractZip setRecursive:](self, "setRecursive:", 0);
    -[_BPSAbstractZip resolvePendingDemandAndUnlock](self, "resolvePendingDemandAndUnlock");
  }
LABEL_17:

}

- (int64_t)receiveInput:(id)a3 index:(int64_t)a4
{
  id v7;
  _BPSAbstractZip *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int64_t v29;
  void *v30;
  void *v31;
  int64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  int64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = self;
  if (-[_BPSAbstractZip upstreamCount](v8, "upstreamCount") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("BPSZip.m"), 97, CFSTR("Expecting Index to be less than upstream count"));

  }
  os_unfair_lock_lock(&v8->_lock);
  if (-[_BPSAbstractZip cancelled](v8, "cancelled")
    || -[_BPSAbstractZip errored](v8, "errored")
    || -[_BPSAbstractZip finished](v8, "finished"))
  {
LABEL_37:
    os_unfair_lock_unlock(&v8->_lock);
LABEL_38:
    v29 = 0;
  }
  else
  {
    -[_BPSAbstractZip buffers](v8, "buffers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v7);

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[_BPSAbstractZip buffers](v8, "buffers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    v48 = a4;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v54;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v54 != v14)
            objc_enumerationMutation(v11);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "count"))
          {

            if (-[_BPSAbstractZip upstreamCount](v8, "upstreamCount") >= 1)
            {
              v37 = 0;
              while (1)
              {
                -[_BPSAbstractZip upstreamFinished](v8, "upstreamFinished");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "objectAtIndexedSubscript:", v37);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v39, "BOOLValue") & 1) != 0)
                {
                  -[_BPSAbstractZip buffers](v8, "buffers");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "objectAtIndexedSubscript:", v37);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = objc_msgSend(v41, "count");

                  if (!v42)
                  {
                    -[_BPSAbstractZip setFinished:](v8, "setFinished:", 1);
                    +[BPSCompletion success](BPSCompletion, "success");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_BPSAbstractZip lockSendCompletion:index:](v8, "lockSendCompletion:index:", v44, v48);

                    goto LABEL_38;
                  }
                }
                else
                {

                }
                if (++v37 >= -[_BPSAbstractZip upstreamCount](v8, "upstreamCount"))
                  goto LABEL_37;
              }
            }
            goto LABEL_37;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        if (v13)
          continue;
        break;
      }
    }
    v47 = v7;

    v16 = (void *)MEMORY[0x1E0C9AA60];
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v18 = (void *)objc_msgSend(v16, "mutableCopy");
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[_BPSAbstractZip buffers](v8, "buffers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObjectAtIndex:", 0);
          objc_msgSend(v18, "addObject:", v25);
          v26 = (void *)objc_msgSend(v24, "mutableCopy");
          objc_msgSend(v17, "addObject:", v26);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v21);
    }

    -[_BPSAbstractZip setBuffers:](v8, "setBuffers:", v17);
    -[_BPSAbstractZip setRecursive:](v8, "setRecursive:", 1);
    os_unfair_lock_unlock(&v8->_lock);
    -[_BPSAbstractZip convertValues:](v8, "convertValues:", v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_recursive_lock_lock_with_options();
    -[_BPSAbstractZip downstream](v8, "downstream");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "receiveInput:", v27);

    os_unfair_recursive_lock_unlock();
    os_unfair_lock_lock(&v8->_lock);
    -[_BPSAbstractZip setRecursive:](v8, "setRecursive:", 0);
    -[_BPSAbstractZip setPendingDemand:](v8, "setPendingDemand:", 0);
    if (v29 < 1)
    {
      os_unfair_lock_unlock(&v8->_lock);
      v29 = 0;
    }
    else
    {
      v46 = v27;
      -[_BPSAbstractZip subscriptions](v8, "subscriptions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "copy");

      os_unfair_lock_unlock(&v8->_lock);
      v32 = v48;
      if (objc_msgSend(v31, "count") >= 1)
      {
        v33 = 0;
        do
        {
          objc_msgSend(v31, "objectAtIndexedSubscript:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32 != v33)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v34, "isEqual:", v35);

            v32 = v48;
            if ((v36 & 1) == 0)
              objc_msgSend(v34, "requestDemand:", v29);
          }

          ++v33;
        }
        while (v33 < objc_msgSend(v31, "count"));
      }

      v27 = v46;
    }

    v7 = v47;
  }

  return v29;
}

- (void)receiveCompletion:(id)a3 index:(int64_t)a4
{
  _BPSAbstractZip *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v6 = self;
  os_unfair_lock_lock(&v6->_lock);
  if (-[_BPSAbstractZip cancelled](v6, "cancelled")
    || -[_BPSAbstractZip errored](v6, "errored")
    || -[_BPSAbstractZip finished](v6, "finished"))
  {
    goto LABEL_4;
  }
  v7 = objc_msgSend(v12, "state");
  if (v7 == 1)
  {
    -[_BPSAbstractZip setErrored:](v6, "setErrored:", 1);
    goto LABEL_11;
  }
  if (v7)
    goto LABEL_5;
  -[_BPSAbstractZip upstreamFinished](v6, "upstreamFinished");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:atIndexedSubscript:", MEMORY[0x1E0C9AAB0], a4);

  -[_BPSAbstractZip buffers](v6, "buffers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
  {
    -[_BPSAbstractZip setFinished:](v6, "setFinished:", 1);
LABEL_11:
    -[_BPSAbstractZip lockSendCompletion:index:](v6, "lockSendCompletion:index:", v12, a4);
    goto LABEL_5;
  }
LABEL_4:
  os_unfair_lock_unlock(&v6->_lock);
LABEL_5:

}

- (void)lockSendCompletion:(id)a3 index:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[_BPSAbstractZip subscriptions](self, "subscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (-[_BPSAbstractZip upstreamCount](self, "upstreamCount") >= 1)
  {
    v7 = 0;
    v8 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      v9 = (void *)objc_msgSend(v8, "mutableCopy");
      -[_BPSAbstractZip buffers](self, "buffers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v9, v7);

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BPSAbstractZip subscriptions](self, "subscriptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:atIndexedSubscript:", v11, v7);

      ++v7;
    }
    while (v7 < -[_BPSAbstractZip upstreamCount](self, "upstreamCount"));
  }
  -[_BPSAbstractZip setRecursive:](self, "setRecursive:", 1);
  os_unfair_lock_unlock(&self->_lock);
  if (objc_msgSend(v6, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EEAF3DC0))
        objc_msgSend(v14, "cancel");

      ++v13;
    }
    while (v13 < objc_msgSend(v6, "count"));
  }
  os_unfair_recursive_lock_lock_with_options();
  -[_BPSAbstractZip downstream](self, "downstream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "receiveCompletion:", v16);

  os_unfair_recursive_lock_unlock();
  os_unfair_lock_lock(&self->_lock);
  -[_BPSAbstractZip setRecursive:](self, "setRecursive:", 0);
  -[_BPSAbstractZip resolvePendingDemandAndUnlock](self, "resolvePendingDemandAndUnlock");

}

- (void)cancel
{
  _BPSAbstractZip *v2;
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = self;
  p_lock = &v2->_lock;
  os_unfair_lock_lock(&v2->_lock);
  if (-[_BPSAbstractZip cancelled](v2, "cancelled"))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[_BPSAbstractZip subscriptions](v2, "subscriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    -[_BPSAbstractZip setCancelled:](v2, "setCancelled:", 1);
    if (-[_BPSAbstractZip upstreamCount](v2, "upstreamCount") >= 1)
    {
      v6 = 0;
      v7 = (void *)MEMORY[0x1E0C9AA60];
      do
      {
        v8 = (void *)objc_msgSend(v7, "mutableCopy");
        -[_BPSAbstractZip buffers](v2, "buffers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:atIndexedSubscript:", v8, v6);

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_BPSAbstractZip subscriptions](v2, "subscriptions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:atIndexedSubscript:", v10, v6);

        ++v6;
      }
      while (v6 < -[_BPSAbstractZip upstreamCount](v2, "upstreamCount"));
    }
    os_unfair_lock_unlock(p_lock);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v17, "cancel", (_QWORD)v18);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

- (void)resolvePendingDemandAndUnlock
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[_BPSAbstractZip subscriptions](self, "subscriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = -[_BPSAbstractZip pendingDemand](self, "pendingDemand");
  -[_BPSAbstractZip setPendingDemand:](self, "setPendingDemand:", 0);
  os_unfair_lock_unlock(&self->_lock);
  if (v5 >= 1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v11, "requestDemand:", v5, (_QWORD)v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)requestDemand:(int64_t)a3
{
  _BPSAbstractZip *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = self;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("BPSZip.m"), 272, CFSTR("Demand should be greater than 0"));

  }
  os_unfair_lock_lock(&v5->_lock);
  if (-[_BPSAbstractZip recursive](v5, "recursive"))
  {
    -[_BPSAbstractZip setPendingDemand:](v5, "setPendingDemand:", -[_BPSAbstractZip pendingDemand](v5, "pendingDemand") + a3);
LABEL_8:
    os_unfair_lock_unlock(&v5->_lock);
    goto LABEL_9;
  }
  if (-[_BPSAbstractZip cancelled](v5, "cancelled")
    || -[_BPSAbstractZip errored](v5, "errored")
    || -[_BPSAbstractZip finished](v5, "finished"))
  {
    goto LABEL_8;
  }
  -[_BPSAbstractZip subscriptions](v5, "subscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  os_unfair_lock_unlock(&v5->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(v13, "requestDemand:", a3, (_QWORD)v15);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

LABEL_9:
}

- (id)convertValues:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Abstract method"));
  return 0;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (NSMutableArray)buffers
{
  return self->_buffers;
}

- (void)setBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_buffers, a3);
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptions, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)errored
{
  return self->_errored;
}

- (void)setErrored:(BOOL)a3
{
  self->_errored = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSMutableArray)upstreamFinished
{
  return self->_upstreamFinished;
}

- (void)setUpstreamFinished:(id)a3
{
  objc_storeStrong((id *)&self->_upstreamFinished, a3);
}

- (int64_t)upstreamCount
{
  return self->_upstreamCount;
}

- (void)setUpstreamCount:(int64_t)a3
{
  self->_upstreamCount = a3;
}

- (BOOL)recursive
{
  return self->_recursive;
}

- (void)setRecursive:(BOOL)a3
{
  self->_recursive = a3;
}

- (int64_t)pendingDemand
{
  return self->_pendingDemand;
}

- (void)setPendingDemand:(int64_t)a3
{
  self->_pendingDemand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstreamFinished, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
