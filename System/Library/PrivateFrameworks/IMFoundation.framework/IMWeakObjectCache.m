@implementation IMWeakObjectCache

+ (id)sharedInstance
{
  if (qword_1ECD91000 != -1)
    dispatch_once(&qword_1ECD91000, &unk_1E2C42C48);
  return (id)qword_1ECD90FB0;
}

- (IMWeakObjectCache)init
{
  IMWeakObjectCache *v2;
  IMWeakObjectCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMWeakObjectCache;
  v2 = -[IMWeakObjectCache init](&v5, sel_init);
  v3 = v2;
  if (v2)
    pthread_mutex_init(&v2->_tableLock, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_tableLock);
  v3.receiver = self;
  v3.super_class = (Class)IMWeakObjectCache;
  -[IMWeakObjectCache dealloc](&v3, sel_dealloc);
}

- (id)copyOrSetObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSMutableDictionary *weakObjectCache;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  IMWeakReference *v23;
  const char *v24;
  uint64_t v25;
  uint64_t inited;
  const char *v27;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    pthread_mutex_lock(&self->_tableLock);
    weakObjectCache = self->_weakObjectCache;
    if (!weakObjectCache)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v14 = self->_weakObjectCache;
      self->_weakObjectCache = Mutable;

      weakObjectCache = self->_weakObjectCache;
    }
    objc_msgSend_objectForKey_(weakObjectCache, v10, (uint64_t)v8, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v15;
    if (v15)
    {
      v20 = objc_msgSend_copyObject(v15, v16, v17, v18);
      if (v20)
      {
        v9 = (id)v20;
        pthread_mutex_unlock(&self->_tableLock);
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend_removeObjectForKey_(self->_weakObjectCache, v21, (uint64_t)v8, v22);
    }
    v23 = [IMWeakReference alloc];
    inited = objc_msgSend_initRefWithObject_(v23, v24, (uint64_t)v6, v25);

    objc_msgSend_setObject_forKey_(self->_weakObjectCache, v27, inited, (uint64_t)v8);
    pthread_mutex_unlock(&self->_tableLock);
    v9 = v6;
    v19 = (void *)inited;
    goto LABEL_10;
  }
LABEL_11:

  return v9;
}

- (id)copyObjectForKey:(id)a3
{
  _opaque_pthread_mutex_t *p_tableLock;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  p_tableLock = &self->_tableLock;
  v5 = a3;
  pthread_mutex_lock(p_tableLock);
  objc_msgSend_objectForKey_(self->_weakObjectCache, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend_copyObject(v8, v9, v10, v11);
  pthread_mutex_unlock(p_tableLock);

  return v12;
}

- (id)objectForKey:(id)a3
{
  _opaque_pthread_mutex_t *p_tableLock;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  p_tableLock = &self->_tableLock;
  v5 = a3;
  pthread_mutex_lock(p_tableLock);
  objc_msgSend_objectForKey_(self->_weakObjectCache, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_object(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_tableLock);

  return v12;
}

- (void)removeObject:(id)a3 key:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSMutableDictionary *weakObjectCache;
  char *v18;

  v18 = (char *)a3;
  v6 = a4;
  pthread_mutex_lock(&self->_tableLock);
  objc_msgSend_objectForKey_(self->_weakObjectCache, v7, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v9, v10, v11, v12);
  v16 = v18;
  if ((char *)v13 == v18)
    objc_msgSend_removeObjectForKey_(self->_weakObjectCache, v18, (uint64_t)v6, v15);
  if (!objc_msgSend_count(self->_weakObjectCache, v16, v14, v15))
  {
    weakObjectCache = self->_weakObjectCache;
    self->_weakObjectCache = 0;

  }
  pthread_mutex_unlock(&self->_tableLock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakObjectCache, 0);
}

@end
