@implementation BWSimpleCache

- (BWSimpleCache)init
{
  BWSimpleCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWSimpleCache;
  v2 = -[BWSimpleCache init](&v4, sel_init);
  if (v2)
  {
    v2->_cache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_propertyMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v2;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWSimpleCache;
  -[BWSimpleCache dealloc](&v3, sel_dealloc);
}

- (void)cacheObject:(id)a3 forKey:(id)a4
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", a3, a4);
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
}

- (id)copyAndClearObjectForKey:(id)a3
{
  id v5;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  v5 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", 0, a3);
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v5;
}

@end
