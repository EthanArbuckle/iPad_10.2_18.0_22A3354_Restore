@implementation SGNoCloudNSUbiquitousKeyValueStore

- (SGNoCloudNSUbiquitousKeyValueStore)init
{
  SGNoCloudNSUbiquitousKeyValueStore *v2;
  uint64_t v3;
  NSMutableDictionary *kv;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGNoCloudNSUbiquitousKeyValueStore;
  v2 = -[SGNoCloudNSUbiquitousKeyValueStore init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    kv = v2->_kv;
    v2->_kv = (NSMutableDictionary *)v3;

    pthread_mutex_init(&v2->_lock, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)SGNoCloudNSUbiquitousKeyValueStore;
  -[SGNoCloudNSUbiquitousKeyValueStore dealloc](&v3, sel_dealloc);
}

- (BOOL)synchronize
{
  return 1;
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (id)objectForKey:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_kv, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  return v6;
}

- (id)dataForKey:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_kv, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  return v6;
}

- (id)arrayForKey:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_kv, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_kv, "setObject:forKeyedSubscript:", v8, v7);

  pthread_mutex_unlock(p_lock);
}

- (void)setData:(id)a3 forKey:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_kv, "setObject:forKeyedSubscript:", v8, v7);

  pthread_mutex_unlock(p_lock);
}

- (void)setArray:(id)a3 forKey:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_kv, "setObject:forKeyedSubscript:", v8, v7);

  pthread_mutex_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kv, 0);
}

@end
