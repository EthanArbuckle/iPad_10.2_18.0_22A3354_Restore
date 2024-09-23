@implementation BCSCoalesceHelper

- (BCSCoalesceHelper)initWithQOSClass:(unsigned int)a3
{
  BCSCoalesceHelper *v4;
  uint64_t v5;
  NSMutableDictionary *coalesceObjectPool;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *coalesceHelperDispatchQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BCSCoalesceHelper;
  v4 = -[BCSCoalesceHelper init](&v11, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    coalesceObjectPool = v4->_coalesceObjectPool;
    v4->_coalesceObjectPool = (NSMutableDictionary *)v5;

    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a3, -1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.businessservicesd.CoalesceHelperCoalesceObjectDispatchQueue"), "UTF8String"), v7);
    coalesceHelperDispatchQueue = v4->_coalesceHelperDispatchQueue;
    v4->_coalesceHelperDispatchQueue = (OS_dispatch_queue *)v8;

  }
  return v4;
}

- (void)enqueueCoalesceObject:(id)a3 isDuplicateRequest:(BOOL *)a4
{
  id v6;
  NSObject *coalesceHelperDispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL *v11;

  v6 = a3;
  if (self)
    coalesceHelperDispatchQueue = self->_coalesceHelperDispatchQueue;
  else
    coalesceHelperDispatchQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BCSCoalesceHelper_enqueueCoalesceObject_isDuplicateRequest___block_invoke;
  block[3] = &unk_24C39BFB8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(coalesceHelperDispatchQueue, block);

}

void __62__BCSCoalesceHelper_enqueueCoalesceObject_isDuplicateRequest___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  char *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1[4];
  v2 = (void *)a1[5];
  if (!v1)
  {
    v15 = v2;
    v6 = 0;
    goto LABEL_13;
  }
  v3 = (char *)a1[6];
  v4 = *(void **)(v1 + 8);
  v5 = v2;
  v6 = v4;
  objc_msgSend(v5, "coalesceKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  ABSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v16 = 136315138;
      v17 = "-[BCSCoalesceHelper _enqueueCoalesceObject:isDuplicateRequest:inCoalesceObjectPool:]";
      _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "Coalesce Helper - Enqueue CoalesceObject to existing CoalesceObject array %s", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(v8, "addObject:", v5);
    if (!v3)
      goto LABEL_12;
    v12 = 1;
  }
  else
  {
    if (v11)
    {
      v16 = 136315138;
      v17 = "-[BCSCoalesceHelper _enqueueCoalesceObject:isDuplicateRequest:inCoalesceObjectPool:]";
      _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "Coalesce Helper - Enqueue CoalesceObject to new CoalesceObject array %s", (uint8_t *)&v16, 0xCu);
    }

    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "addObject:", v5);
    objc_msgSend(v5, "coalesceKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v13, v14);

    if (!v3)
    {
      v8 = v13;
      goto LABEL_12;
    }
    v12 = 0;
    v8 = v13;
  }
  *v3 = v12;
LABEL_12:

LABEL_13:
}

- (id)dequeueCoalesceObjectsForCoalesceKey:(id)a3
{
  id v4;
  NSObject *coalesceHelperDispatchQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  if (self)
    coalesceHelperDispatchQueue = self->_coalesceHelperDispatchQueue;
  else
    coalesceHelperDispatchQueue = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__BCSCoalesceHelper_dequeueCoalesceObjectsForCoalesceKey___block_invoke;
  block[3] = &unk_24C39BFE0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(coalesceHelperDispatchQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __58__BCSCoalesceHelper_dequeueCoalesceObjectsForCoalesceKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  if (v2)
  {
    v3 = (void *)a1[5];
    v12 = *(id *)(v2 + 8);
    v4 = v3;
    objc_msgSend(v12, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");

    objc_msgSend(v12, "removeObjectForKey:", v4);
    v7 = -[NSObject count](v6, "count");
    ABSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[BCSCoalesceHelper _dequeueCoalesceObjectsForCoalesceKey:inCoalesceObjectPool:]";
        _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "Coalesce Helper - Dequeue CoalesceObject array - Found %s", buf, 0xCu);
      }
    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[BCSCoalesceHelper _dequeueCoalesceObjectsForCoalesceKey:inCoalesceObjectPool:]";
        _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "Coalesce Helper - Dequeue CoalesceObject array - Not Found %s", buf, 0xCu);
      }

      v8 = v6;
      v6 = MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v12 = 0;
    v6 = 0;
  }
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalesceHelperDispatchQueue, 0);
  objc_storeStrong((id *)&self->_coalesceObjectPool, 0);
}

@end
