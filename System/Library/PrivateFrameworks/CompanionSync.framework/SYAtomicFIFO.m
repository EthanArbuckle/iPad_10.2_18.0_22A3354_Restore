@implementation SYAtomicFIFO

- (SYAtomicFIFO)init
{
  return -[SYAtomicFIFO initWithCapacity:](self, "initWithCapacity:", 0);
}

- (SYAtomicFIFO)initWithCapacity:(unint64_t)a3
{
  SYAtomicFIFO *v4;
  SYAtomicFIFO *v5;
  uint64_t v6;
  NSMutableArray *store;
  SYAtomicFIFO *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SYAtomicFIFO;
  v4 = -[SYAtomicFIFO init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
    store = v5->_store;
    v5->_store = (NSMutableArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)enqueue:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray addObject:](self->_store, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)dequeue
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray firstObject](self->_store, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableArray removeObjectAtIndex:](self->_store, "removeObjectAtIndex:", 0);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)dequeueUntil:(id)a3
{
  id v4;
  NSMutableArray *store;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3010000000;
  v23 = 0;
  v24 = 0;
  v22 = &unk_2117B9E81;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  store = self->_store;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __29__SYAtomicFIFO_dequeueUntil___block_invoke;
  v9[3] = &unk_24CC657B0;
  v11 = &v19;
  v6 = v4;
  v10 = v6;
  v12 = &v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](store, "enumerateObjectsUsingBlock:", v9);
  -[NSMutableArray removeObjectsInRange:](self->_store, "removeObjectsInRange:", v20[4], v20[5]);
  os_unfair_lock_unlock(&self->_lock);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __29__SYAtomicFIFO_dequeueUntil___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;

  v7 = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  v8 = v7;
  if ((*(unsigned int (**)(void))(a1[4] + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)removeAllObjects
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray removeAllObjects](self->_store, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (id)head
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray firstObject](self->_store, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)tail
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray lastObject](self->_store, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
