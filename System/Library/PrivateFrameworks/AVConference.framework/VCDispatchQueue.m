@implementation VCDispatchQueue

uint64_t __66__VCDispatchQueue_getCustomRootQueueWithPriority_isFixedPriority___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 32))
    return pthread_set_fixedpriority_self();
  return result;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken_0 != -1)
    dispatch_once(&defaultManager_onceToken_0, &__block_literal_global_23);
  return (id)_vcDispatchQueue;
}

- (id)getCustomRootQueueWithPriority:(int)a3 isFixedPriority:(BOOL)a4
{
  int v4;
  _opaque_pthread_mutex_t *p_lock;
  NSMutableArray *rootQueues;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;
  __int128 v16;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  sched_param v23;
  pthread_attr_t v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  rootQueues = self->_rootQueues;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rootQueues, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(rootQueues);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
      v24.__sig = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)v24.__opaque = 0xAAAAAAAAAAAAAAAALL;
      objc_msgSend(v13, "getValue:", &v24);
      if (LODWORD(v24.__sig) == a3 && BYTE4(v24.__sig) == v4)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rootQueues, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
    v15 = *(void **)v24.__opaque;
    if (*(_QWORD *)v24.__opaque)
      goto LABEL_17;
  }
LABEL_14:
  *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v24.__opaque[24] = v16;
  *(_OWORD *)&v24.__opaque[40] = v16;
  *(_OWORD *)&v24.__sig = v16;
  *(_OWORD *)&v24.__opaque[8] = v16;
  pthread_attr_init(&v24);
  v23 = (sched_param)0xAAAAAAAAAAAAAAAALL;
  pthread_attr_getschedparam(&v24, &v23);
  v23.sched_priority = a3;
  pthread_attr_setschedparam(&v24, &v23);
  pthread_attr_setschedpolicy(&v24, 4);
  v21 = -1431655766;
  v20 = a3;
  LOBYTE(v21) = v4;
  v18 = MEMORY[0x1E0C809B0];
  LOBYTE(v19) = v4;
  v22 = dispatch_pthread_root_queue_create();
  if (v22)
    -[NSMutableArray addObject:](self->_rootQueues, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v20, "{?=iB@}", v18, 3221225472, __66__VCDispatchQueue_getCustomRootQueueWithPriority_isFixedPriority___block_invoke, &__block_descriptor_33_e5_v8__0l, v19));
  pthread_attr_destroy(&v24);
  v15 = (void *)v22;
LABEL_17:
  pthread_mutex_unlock(p_lock);
  return v15;
}

VCDispatchQueue *__33__VCDispatchQueue_defaultManager__block_invoke()
{
  VCDispatchQueue *result;

  result = objc_alloc_init(VCDispatchQueue);
  _vcDispatchQueue = (uint64_t)result;
  return result;
}

- (VCDispatchQueue)init
{
  VCDispatchQueue *v2;
  VCDispatchQueue *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCDispatchQueue;
  v2 = -[VCDispatchQueue init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    v3->_rootQueues = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v3;
}

- (void)dealloc
{
  NSMutableArray *rootQueues;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  uint64_t v9;
  dispatch_object_t object;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  object = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  rootQueues = self->_rootQueues;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rootQueues, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(rootQueues);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "getValue:size:", &v9, 16);
        if (object)
          dispatch_release(object);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](rootQueues, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->_rootQueues, "removeAllObjects");

  pthread_mutex_destroy(&self->_lock);
  v8.receiver = self;
  v8.super_class = (Class)VCDispatchQueue;
  -[VCDispatchQueue dealloc](&v8, sel_dealloc);
}

@end
