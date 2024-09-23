@implementation MTRAsyncWorkQueue

- (MTRAsyncWorkQueue)initWithContext:(id)a3
{
  return (MTRAsyncWorkQueue *)objc_msgSend_initWithContext_width_(self, a2, (uint64_t)a3, 1);
}

- (MTRAsyncWorkQueue)initWithContext:(id)a3 width:(unint64_t)a4
{
  id v6;
  MTRAsyncWorkQueue *v7;
  MTRAsyncWorkQueue *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *items;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTRAsyncWorkQueue;
  v7 = -[MTRAsyncWorkQueue init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_context, v6);
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    items = v8->_items;
    v8->_items = (NSMutableArray *)v11;

    v8->_width = a4;
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  id v12;
  id v13;

  sub_2340DC2CC((uint64_t)&v12, (os_unfair_lock *)self);
  os_unfair_lock_lock(&self->_lock);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = v13;
  v8 = objc_msgSend_count(self->_items, v6, v7);
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@ context: %@, items count: %lu>"), v4, v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);

  return v10;
}

- (void)enqueueWorkItem:(id)a3
{
  objc_msgSend_enqueueWorkItem_description_(self, a2, (uint64_t)a3, 0);
}

- (void)enqueueWorkItem:(id)a3 descriptionWithFormat:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BDD17C8]);
  v10 = (void *)objc_msgSend_initWithFormat_arguments_(v8, v9, (uint64_t)v7, &v12);
  objc_msgSend_enqueueWorkItem_description_(self, v11, (uint64_t)v6, v10);

}

- (void)enqueueWorkItem:(id)a3 description:(id)a4
{
  _QWORD *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  sub_2340DC2CC((uint64_t)&v29, (os_unfair_lock *)self);
  os_unfair_lock_lock(&self->_lock);
  if (v6)
    v6[2] = 2;
  objc_msgSend_addObject_(self->_items, v8, (uint64_t)v6);
  if (v7)
  {
    sub_234117B80(0, "NotSpecified");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v30;
      v13 = objc_msgSend_count(self->_items, v10, v11);
      v16 = objc_msgSend_uniqueID(v6, v14, v15);
      *(_DWORD *)buf = 138413058;
      v32 = v12;
      v33 = 2048;
      v34 = v13;
      v35 = 2048;
      v36 = v16;
      v37 = 2112;
      v38 = v7;
      _os_log_impl(&dword_233BF3000, v9, OS_LOG_TYPE_DEFAULT, "MTRAsyncWorkQueue<%@, items count: %lu> enqueued work item [%llu]: %@", buf, 0x2Au);
    }

    if (sub_234114844(2u))
    {
LABEL_11:
      objc_msgSend_count(self->_items, v17, v18);
      objc_msgSend_uniqueID(v6, v27, v28);
      sub_2341147D0(0, 2);
    }
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v30;
      v23 = objc_msgSend_count(self->_items, v20, v21);
      v26 = objc_msgSend_uniqueID(v6, v24, v25);
      *(_DWORD *)buf = 138412802;
      v32 = v22;
      v33 = 2048;
      v34 = v23;
      v35 = 2048;
      v36 = v26;
      _os_log_impl(&dword_233BF3000, v19, OS_LOG_TYPE_DEFAULT, "MTRAsyncWorkQueue<%@, items count: %lu> enqueued work item [%llu]", buf, 0x20u);
    }

    if (sub_234114844(2u))
      goto LABEL_11;
  }
  sub_2340DB5E8((uint64_t)self, (uint64_t)&v29);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)invalidate
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSMutableArray *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  sub_2340DC2CC((uint64_t)&v22, (os_unfair_lock *)self);
  os_unfair_lock_lock(&self->_lock);
  sub_234117B80(0, "NotSpecified");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v23;
    v7 = objc_msgSend_count(self->_items, v4, v5);
    *(_DWORD *)buf = 138412546;
    v26 = v6;
    v27 = 2048;
    v28 = v7;
    _os_log_impl(&dword_233BF3000, v3, OS_LOG_TYPE_DEFAULT, "MTRAsyncWorkQueue<%@> invalidate %lu items", buf, 0x16u);
  }

  if (sub_234114844(2u))
  {
    objc_msgSend_count(self->_items, v8, v9);
    sub_2341147D0(0, 2);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_items;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v18, v24, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        sub_2340DAEC8(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v15, (uint64_t)&v18, v24, 16);
    }
    while (v12);
  }

  objc_msgSend_removeAllObjects(self->_items, v16, v17);
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)hasDuplicateForTypeID:(unint64_t)a3 workItemData:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  const char *v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD);
  BOOL v21;
  __int16 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend_reverseObjectEnumerator(self->_items, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v24, v28, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend_duplicateCheckHandler(v17, v12, v13);
        v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          if (objc_msgSend_duplicateTypeID(v17, v18, v19) == a3)
          {
            v23 = 0;
            ((void (**)(_QWORD, id, __int16 *, char *))v20)[2](v20, v6, &v23, (char *)&v23 + 1);
            if (HIBYTE(v23))
            {
              v21 = (_BYTE)v23 != 0;

              goto LABEL_13;
            }
          }
        }

      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v24, v28, 16);
      if (v14)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_13:

  os_unfair_lock_unlock(p_lock);
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak(&self->_context);
}

@end
