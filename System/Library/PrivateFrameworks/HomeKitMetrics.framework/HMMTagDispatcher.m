@implementation HMMTagDispatcher

- (HMMTagDispatcher)initWithWorkQueue:(id)a3
{
  id v4;
  HMMTagDispatcher *v5;

  v4 = a3;
  v5 = -[HMMTagDispatcher initWithWorkQueue:startTime:](self, "initWithWorkQueue:startTime:", v4, clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0xF4240);

  return v5;
}

- (HMMTagDispatcher)initWithWorkQueue:(id)a3 startTime:(int64_t)a4
{
  id v7;
  HMMTagDispatcher *v8;
  uint64_t v9;
  NSMutableDictionary *tagObservers;
  uint64_t v11;
  NSPointerArray *allTagProcessors;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMMTagDispatcher;
  v8 = -[HMMTagDispatcher init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    tagObservers = v8->_tagObservers;
    v8->_tagObservers = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v11 = objc_claimAutoreleasedReturnValue();
    allTagProcessors = v8->_allTagProcessors;
    v8->_allTagProcessors = (NSPointerArray *)v11;

    objc_storeStrong((id *)&v8->_workQueue, a3);
    v8->_nextStaleCheckTime = a4 + 3600000;
  }

  return v8;
}

- (void)registerTagObserver:(id)a3 forTags:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMMTagDispatcher *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HMMTagDispatcher_registerTagObserver_forTags___block_invoke;
  block[3] = &unk_1E898A7D0;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, block);

}

- (void)unregisterTagObserver:(id)a3 forTags:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMMTagDispatcher *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HMMTagDispatcher_unregisterTagObserver_forTags___block_invoke;
  block[3] = &unk_1E898A7D0;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, block);

}

- (void)submitTaggedEvent:(id)a3 processorList:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMMTagDispatcher *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HMMTagDispatcher_submitTaggedEvent_processorList___block_invoke;
  block[3] = &unk_1E898A7D0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

- (NSMutableDictionary)tagObservers
{
  return self->_tagObservers;
}

- (void)setTagObservers:(id)a3
{
  objc_storeStrong((id *)&self->_tagObservers, a3);
}

- (NSPointerArray)allTagProcessors
{
  return self->_allTagProcessors;
}

- (void)setAllTagProcessors:(id)a3
{
  objc_storeStrong((id *)&self->_allTagProcessors, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (int64_t)nextStaleCheckTime
{
  return self->_nextStaleCheckTime;
}

- (void)setNextStaleCheckTime:(int64_t)a3
{
  self->_nextStaleCheckTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_allTagProcessors, 0);
  objc_storeStrong((id *)&self->_tagObservers, 0);
}

void __52__HMMTagDispatcher_submitTaggedEvent_processorList___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v35 = objc_msgSend(a1[4], "tagTime");
  objc_msgSend(a1[5], "tagObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "tagName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v34 = v4;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v49;
      v9 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v49 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v12 = a1[4];
          v44[0] = v9;
          v44[1] = 3221225472;
          v44[2] = __52__HMMTagDispatcher_submitTaggedEvent_processorList___block_invoke_2;
          v44[3] = &unk_1E898A7F8;
          v47 = v35;
          v13 = a1[6];
          v14 = a1[5];
          v45 = v13;
          v46 = v14;
          objc_msgSend(v11, "observeTaggedEvent:addProcessorBlock:", v12, v44);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v7);
    }

    v4 = v34;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(a1[6], "processors", v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        if (objc_msgSend(v20, "isActive"))
        {
          objc_msgSend(v20, "tagProcessingBlocks");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "tagName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", v22);
          v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            ((void (**)(_QWORD, void *, id))v23)[2](v23, v20, a1[4]);
            objc_msgSend(v20, "setLastUpdate:", v35);
          }

        }
        else
        {
          objc_msgSend(a1[6], "removeProcessor:", v20);
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    }
    while (v17);
  }

  if (v35 >= objc_msgSend(a1[5], "nextStaleCheckTime"))
  {
    objc_msgSend(a1[5], "allTagProcessors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addPointer:", 0);

    objc_msgSend(a1[5], "allTagProcessors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "compact");

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(a1[5], "allTagProcessors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v37;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v37 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * k);
          if (objc_msgSend(v32, "lastUpdate") <= v35 - 3600000)
          {
            objc_msgSend(v32, "closeForReason:", 2);
            objc_msgSend(a1[5], "allTagProcessors");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "hmf_removeObject:", v32);

          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
      }
      while (v29);
    }

    objc_msgSend(a1[5], "setNextStaleCheckTime:", v35 + 3600000);
  }

}

void __52__HMMTagDispatcher_submitTaggedEvent_processorList___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "setLastUpdate:", v3);
  objc_msgSend(*(id *)(a1 + 32), "addProcessor:", v4);
  objc_msgSend(*(id *)(a1 + 40), "allTagProcessors");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_addObject:", v4);

}

void __50__HMMTagDispatcher_unregisterTagObserver_forTags___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "tagObservers", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 48));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __48__HMMTagDispatcher_registerTagObserver_forTags___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "tagObservers", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "tagObservers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v9, v7);

        }
        objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 48));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

@end
