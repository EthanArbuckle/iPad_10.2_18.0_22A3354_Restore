@implementation HFMutablePriorityQueue

uint64_t __30__HFMutablePriorityQueue_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "priority");
  if (v6 <= objc_msgSend(v5, "priority"))
  {
    v8 = objc_msgSend(v5, "priority");
    v7 = v8 > objc_msgSend(v4, "priority");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (id)enqueue:(id)a3
{
  id v4;
  HFMutablePriorityQueueEntry *v5;

  v4 = a3;
  v5 = -[HFMutablePriorityQueueEntry initWithValue:]([HFMutablePriorityQueueEntry alloc], "initWithValue:", v4);

  os_unfair_lock_lock(&self->_lock);
  -[NAQueue enqueue:](self->_queue, "enqueue:", v5);
  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

- (id)dequeue
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NAQueue dequeue](self->_queue, "dequeue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)prioritizeObjects:(id)a3
{
  -[HFMutablePriorityQueue prioritizeObjects:increment:](self, "prioritizeObjects:increment:", a3, 1);
}

- (void)prioritizeObjects:(id)a3 increment:(int64_t)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__HFMutablePriorityQueue_prioritizeObjects_increment___block_invoke;
  v4[3] = &__block_descriptor_40_e37_Q16__0__HFMutablePriorityQueueEntry_8l;
  v4[4] = a4;
  -[HFMutablePriorityQueue _prioritizeObjects:priorityBlock:](self, "_prioritizeObjects:priorityBlock:", a3, v4);
}

- (void)_prioritizeObjects:(id)a3 priorityBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__HFMutablePriorityQueue__prioritizeObjects_priorityBlock___block_invoke;
  v8[3] = &unk_1EA727D20;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[HFMutablePriorityQueue _operateOnMatchingObjects:removingMatched:lockedOperationBlock:](self, "_operateOnMatchingObjects:removingMatched:lockedOperationBlock:", a3, 1, v8);

}

- (void)_operateOnMatchingObjects:(id)a3 removingMatched:(BOOL)a4 lockedOperationBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  os_unfair_lock_t lock;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v23 = v8;
  objc_msgSend(v8, "na_reduceWithInitialValue:reducer:", v10, &__block_literal_global_30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HFMutablePriorityQueue queue](self, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v18, "value", lock);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v11, "containsObject:", v19);

        if (v20)
        {
          v9[2](v9, v18);
          if (v6)
          {
            objc_msgSend(v18, "value");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removeObject:", v21);

          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  os_unfair_lock_unlock(lock);
}

- (void)removeObjectsWithEntries:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
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
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[HFMutablePriorityQueue queue](self, "queue", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dequeueObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NAQueue)queue
{
  return (NAQueue *)objc_getProperty(self, a2, 16, 1);
}

id __89__HFMutablePriorityQueue__operateOnMatchingObjects_removingMatched_lockedOperationBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addObject:", a2);
  return v4;
}

- (HFMutablePriorityQueue)init
{
  HFMutablePriorityQueue *v2;
  uint64_t v3;
  NAQueue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFMutablePriorityQueue;
  v2 = -[HFMutablePriorityQueue init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D519E0], "priorityQueueWithComparator:", &__block_literal_global_10);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (NAQueue *)v3;

  }
  return v2;
}

- (unint64_t)count
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NAQueue count](self->_queue, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)removeFirstOfObjects:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__HFMutablePriorityQueue_removeFirstOfObjects___block_invoke;
  v3[3] = &unk_1EA727C18;
  v3[4] = self;
  -[HFMutablePriorityQueue _operateOnMatchingObjects:removingMatched:lockedOperationBlock:](self, "_operateOnMatchingObjects:removingMatched:lockedOperationBlock:", a3, 1, v3);
}

void __47__HFMutablePriorityQueue_removeFirstOfObjects___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "queue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueObject:", v3);

}

- (void)removeAllObjectsMatchingObjects:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__HFMutablePriorityQueue_removeAllObjectsMatchingObjects___block_invoke;
  v3[3] = &unk_1EA727C18;
  v3[4] = self;
  -[HFMutablePriorityQueue _operateOnMatchingObjects:removingMatched:lockedOperationBlock:](self, "_operateOnMatchingObjects:removingMatched:lockedOperationBlock:", a3, 0, v3);
}

void __58__HFMutablePriorityQueue_removeAllObjectsMatchingObjects___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "queue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueObject:", v3);

}

- (id)drain
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HFMutablePriorityQueue queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

uint64_t __31__HFMutablePriorityQueue_drain__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __54__HFMutablePriorityQueue_prioritizeObjects_increment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32) + objc_msgSend(v3, "priority");
  objc_msgSend(v3, "setPriority:", v4);

  return v4;
}

- (void)resetPriorityForObjects:(id)a3
{
  -[HFMutablePriorityQueue _prioritizeObjects:priorityBlock:](self, "_prioritizeObjects:priorityBlock:", a3, &__block_literal_global_27_0);
}

uint64_t __50__HFMutablePriorityQueue_resetPriorityForObjects___block_invoke()
{
  return 0;
}

void __59__HFMutablePriorityQueue__prioritizeObjects_priorityBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueObject:", v4);

  objc_msgSend(v4, "setPriority:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))());
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enqueue:", v4);

}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
