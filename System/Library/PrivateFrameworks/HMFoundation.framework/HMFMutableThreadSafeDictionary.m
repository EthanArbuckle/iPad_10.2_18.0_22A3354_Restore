@implementation HMFMutableThreadSafeDictionary

- (id)objectForKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (HMFMutableThreadSafeDictionary)init
{
  return -[HMFMutableThreadSafeDictionary initWithDictionary:](self, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
}

- (HMFMutableThreadSafeDictionary)initWithDictionary:(id)a3
{
  id v4;
  HMFMutableThreadSafeDictionary *v5;
  HMFMutableThreadSafeDictionary *v6;
  uint64_t v7;
  NSMutableDictionary *dictionary;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMFMutableThreadSafeDictionary;
  v5 = -[HMFMutableThreadSafeDictionary init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "mutableCopy");
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSMutableDictionary *)v7;

  }
  return v6;
}

+ (id)threadSafeDictionary
{
  return objc_alloc_init((Class)a1);
}

- (unint64_t)count
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[NSMutableDictionary count](self->_dictionary, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)allKeys
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allKeys](self->_dictionary, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)allValues
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_dictionary, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectsForKeys:notFoundMarker:](self->_dictionary, "objectsForKeys:notFoundMarker:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", v7, v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictionary, "setObject:forKeyedSubscript:", v7, v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObjectsForKeys:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectsForKeys:](self->_dictionary, "removeObjectsForKeys:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)keyEnumerator
{
  void *v2;
  void *v3;

  -[HMFMutableThreadSafeDictionary rawDictionarySnapshot](self, "rawDictionarySnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)objectEnumerator
{
  void *v2;
  void *v3;

  -[HMFMutableThreadSafeDictionary rawDictionarySnapshot](self, "rawDictionarySnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  -[HMFMutableThreadSafeDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](self, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[HMFMutableThreadSafeDictionary rawDictionarySnapshot](self, "rawDictionarySnapshot");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateKeysAndObjectsWithOptions:usingBlock:", a3, v6);

}

- (NSDictionary)rawDictionarySnapshot
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary copy](self->_dictionary, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMFMutableThreadSafeDictionary *v4;
  void *v5;
  HMFMutableThreadSafeDictionary *v6;

  v4 = [HMFMutableThreadSafeDictionary alloc];
  -[HMFMutableThreadSafeDictionary rawDictionarySnapshot](self, "rawDictionarySnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMFMutableThreadSafeDictionary initWithDictionary:](v4, "initWithDictionary:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
