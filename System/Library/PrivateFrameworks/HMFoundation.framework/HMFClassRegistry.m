@implementation HMFClassRegistry

- (Class)classForKey:(id)a3
{
  id v4;
  hmf_unfair_data_lock_s *p_lock;
  objc_class *v6;
  Class defaultClass;
  objc_class *v8;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_classes, "objectForKey:", v4);
  v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
  defaultClass = v6;
  if (!v6)
    defaultClass = self->_defaultClass;
  v8 = defaultClass;

  os_unfair_lock_unlock(&p_lock->lock);
  return v8;
}

- (HMFClassRegistry)init
{
  return -[HMFClassRegistry initWithDefaultClass:](self, "initWithDefaultClass:", 0);
}

- (HMFClassRegistry)initWithDefaultClass:(Class)a3
{
  HMFClassRegistry *v4;
  uint64_t v5;
  NSMutableDictionary *classes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMFClassRegistry;
  v4 = -[HMFClassRegistry init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    classes = v4->_classes;
    v4->_classes = (NSMutableDictionary *)v5;

    objc_storeStrong((id *)&v4->_defaultClass, a3);
  }
  return v4;
}

- (void)setClass:(Class)a3 forKey:(id)a4
{
  NSMutableDictionary *classes;
  id v7;

  v7 = a4;
  os_unfair_lock_lock_with_options();
  classes = self->_classes;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](classes, "setObject:forKey:", a3, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](classes, "removeObjectForKey:", v7);
  os_unfair_lock_unlock(&self->_lock.lock);

}

- (Class)defaultClass
{
  return self->_defaultClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultClass, 0);
  objc_storeStrong((id *)&self->_classes, 0);
}

@end
