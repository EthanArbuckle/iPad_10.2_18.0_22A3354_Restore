@implementation IMMultiQueue

- (IMMultiQueue)init
{
  uint64_t v2;

  return (IMMultiQueue *)objc_msgSend_initWithQueue_(self, a2, MEMORY[0x1E0C80D38], v2);
}

- (IMMultiQueue)initWithQueue:(id)a3
{
  id v5;
  IMMultiQueue *v6;
  IMMultiQueue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMMultiQueue;
  v6 = -[IMMultiQueue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (void)_popEnqueuedBlockWithGUID:(id)a3 key:(id)a4
{
  NSMutableDictionary *queueMap;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void (**v32)(void);
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableDictionary *v36;
  id v37;

  v37 = a4;
  queueMap = self->_queueMap;
  v7 = a3;
  objc_msgSend_objectForKey_(queueMap, v8, (uint64_t)v37, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_GUID(v14, v15, v16, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 == v7)
  {
    objc_msgSend_removeLastObject(v10, v19, v20, v21);
    if (objc_msgSend_count(v10, v22, v23, v24))
    {
      objc_msgSend_lastObject(v10, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_block(v28, v29, v30, v31);
      v32 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v32[2]();

    }
    else
    {
      objc_msgSend_removeObjectForKey_(self->_queueMap, v25, (uint64_t)v37, v27);
    }
    if (!objc_msgSend_count(self->_queueMap, v33, v34, v35))
    {
      v36 = self->_queueMap;
      self->_queueMap = 0;

    }
  }

}

- (BOOL)addBlock:(id)a3 withTimeout:(double)a4 forKey:(id)a5 description:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  const char *v21;
  _QWORD aBlock[5];
  id v24;
  id v25;
  id v26;
  double v27;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v16 = 0;
  if (v10 && v11)
  {
    v17 = (void *)objc_msgSend_copyStringGUID(MEMORY[0x1E0CB3940], v13, v14, v15);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1906AF900;
    aBlock[3] = &unk_1E2C464E0;
    aBlock[4] = self;
    v24 = v17;
    v18 = v11;
    v25 = v18;
    v27 = a4;
    v26 = v10;
    v19 = v17;
    v20 = _Block_copy(aBlock);
    v16 = objc_msgSend__addBlock_withGUID_forKey_description_(self, v21, (uint64_t)v20, (uint64_t)v19, v18, v12);

  }
  return v16;
}

- (BOOL)addBlock:(id)a3 forKey:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  const char *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  IMMultiQueue *v25;
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v14 = 0;
  if (v8 && v9)
  {
    v15 = (void *)objc_msgSend_copyStringGUID(MEMORY[0x1E0CB3940], v11, v12, v13);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = sub_1906AFC2C;
    v24 = &unk_1E2C46508;
    v25 = self;
    v26 = v15;
    v16 = v9;
    v27 = v16;
    v28 = v8;
    v17 = v15;
    v18 = _Block_copy(&v21);
    v14 = objc_msgSend__addBlock_withGUID_forKey_description_(self, v19, (uint64_t)v18, (uint64_t)v17, v16, v10, v21, v22, v23, v24, v25);

  }
  return v14;
}

- (BOOL)_addBlock:(id)a3 withGUID:(id)a4 forKey:(id)a5 description:(id)a6
{
  void (**v10)(_QWORD);
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *queueMap;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const void *v27;
  IMMultiQueueItem *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  IMMultiQueueItem *v33;
  const char *v34;
  const char *v35;

  v10 = (void (**)(_QWORD))a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_objectForKey_(self->_queueMap, v14, (uint64_t)v12, v15);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    if (!self->_queueMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      queueMap = self->_queueMap;
      self->_queueMap = Mutable;

    }
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend_setObject_forKey_(self->_queueMap, v22, (uint64_t)v19, (uint64_t)v12);
  }
  v26 = objc_msgSend_count(v19, v16, v17, v18);
  if (v26)
  {
    v27 = (const void *)objc_msgSend_copy(v10, v23, v24, v25);

    v28 = [IMMultiQueueItem alloc];
    v29 = _Block_copy(v27);
    v31 = (void *)objc_msgSend_initWithBlock_GUID_description_(v28, v30, (uint64_t)v29, (uint64_t)v11, v13);

    objc_msgSend_insertObject_atIndex_(v19, v32, (uint64_t)v31, 0);
    v10 = (void (**)(_QWORD))v27;
  }
  else
  {
    v33 = [IMMultiQueueItem alloc];
    v31 = (void *)objc_msgSend_initWithBlock_GUID_description_(v33, v34, 0, (uint64_t)v11, v13);
    objc_msgSend_insertObject_atIndex_(v19, v35, (uint64_t)v31, 0);
    v10[2](v10);
  }

  return v26 != 0;
}

- (id)loggableOverview
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = objc_msgSend_count(self->_queueMap, a2, v2, v3);
  objc_msgSend_arrayWithCapacity_(v5, v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x19400E788]();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_queueMap;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v11);
        objc_msgSend_loggableOverviewForKey_(self, v14, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18), v15, (_QWORD)v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v9, v20, (uint64_t)v19, v21);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v16);
  }

  objc_autoreleasePoolPop(v10);
  return v9;
}

- (id)loggableOverviewForKey:(id)a3
{
  NSMutableDictionary *queueMap;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  queueMap = self->_queueMap;
  v4 = a3;
  objc_msgSend_objectForKey_(queueMap, v5, (uint64_t)v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = objc_msgSend_count(v7, v9, v10, v11);
  objc_msgSend_lastObject(v7, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_describer(v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithFormat_(v8, v21, (uint64_t)CFSTR("<%@  ->  count: %ld,  current: %@>"), v22, v4, v12, v20);

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queueMap, 0);
}

@end
