@implementation _CHUISWidgetHostViewControllerCollection

+ (id)sharedInstance
{
  if (sharedInstance___once_1 != -1)
    dispatch_once(&sharedInstance___once_1, &__block_literal_global_735);
  return (id)sharedInstance___instance_0;
}

- (_CHUISWidgetHostViewControllerCollection)init
{
  _CHUISWidgetHostViewControllerCollection *v2;
  _CHUISWidgetHostViewControllerCollection *v3;
  uint64_t v4;
  NSHashTable *lock_viewControllers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CHUISWidgetHostViewControllerCollection;
  v2 = -[_CHUISWidgetHostViewControllerCollection init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    lock_viewControllers = v3->_lock_viewControllers;
    v3->_lock_viewControllers = (NSHashTable *)v4;

  }
  return v3;
}

- (NSArray)viewControllers
{
  void *v3;
  os_unfair_lock_s *p_lock;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_lock_viewControllers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
  v9 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v9;
}

- (void)noteCreated:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_viewControllers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)noteDestroyed:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_viewControllers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_viewControllers, 0);
}

@end
