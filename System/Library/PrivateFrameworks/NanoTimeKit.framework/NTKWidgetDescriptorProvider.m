@implementation NTKWidgetDescriptorProvider

+ (NTKWidgetDescriptorProvider)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1)
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_60);
  return (NTKWidgetDescriptorProvider *)(id)sharedInstance_instance_0;
}

void __45__NTKWidgetDescriptorProvider_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = v0;

}

- (NTKWidgetDescriptorProvider)init
{
  NTKWidgetDescriptorProvider *v2;
  NTKWidgetDescriptorProvider *v3;
  uint64_t v4;
  NSHashTable *lock_observers;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _QWORD block[4];
  NTKWidgetDescriptorProvider *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKWidgetDescriptorProvider;
  v2 = -[NTKWidgetDescriptorProvider init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    lock_observers = v3->_lock_observers;
    v3->_lock_observers = (NSHashTable *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.NanoTimeKit.NTKWidgetDescriptorProvider", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v9 = v3->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__NTKWidgetDescriptorProvider_init__block_invoke;
    block[3] = &unk_1E6BCD5F0;
    v12 = v3;
    dispatch_async(v9, block);

  }
  return v3;
}

uint64_t __35__NTKWidgetDescriptorProvider_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObserver:");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_widgetDescriptorsChanged");
}

- (void)registerObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (NSSet)descriptors
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSSet copy](self->_lock_widgetDescriptors, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (NSDictionary)descriptorsByExtensionIdentifier
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSDictionary copy](self->_lock_descriptorsByExtensionIdentifier, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (id)collatedDescriptors
{
  void *v3;
  os_unfair_lock_s *p_lock;
  NSDictionary *lock_descriptorsByExtensionIdentifier;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_opt_new();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_descriptorsByExtensionIdentifier = self->_lock_descriptorsByExtensionIdentifier;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__NTKWidgetDescriptorProvider_collatedDescriptors__block_invoke;
  v9[3] = &unk_1E6BD2B08;
  v10 = v3;
  v6 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](lock_descriptorsByExtensionIdentifier, "enumerateKeysAndObjectsUsingBlock:", v9);
  os_unfair_lock_unlock(p_lock);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

uint64_t __50__NTKWidgetDescriptorProvider_collatedDescriptors__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (void)reloadDescriptorsForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__NTKWidgetDescriptorProvider_reloadDescriptorsForContainerIdentifier_completion___block_invoke;
  block[3] = &unk_1E6BCD820;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __82__NTKWidgetDescriptorProvider_reloadDescriptorsForContainerIdentifier_completion___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "reloadDescriptorsForContainerIdentifier:completion:", a1[5], a1[6]);
}

- (void)descriptorsDidChangeForDescriptorProvider:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__NTKWidgetDescriptorProvider_descriptorsDidChangeForDescriptorProvider___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __73__NTKWidgetDescriptorProvider_descriptorsDidChangeForDescriptorProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_widgetDescriptorsChanged");
}

- (void)_queue_widgetDescriptorsChanged
{
  NSSet *v3;
  NSDictionary *v4;
  NSSet *lock_widgetDescriptors;
  NSSet *v6;
  NSDictionary *lock_descriptorsByExtensionIdentifier;
  NSDictionary *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CHSWidgetDescriptorProvider descriptors](self->_widgetDescriptorProvider, "descriptors");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  -[CHSWidgetDescriptorProvider descriptorsByExtensionIdentifier](self->_widgetDescriptorProvider, "descriptorsByExtensionIdentifier");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  lock_widgetDescriptors = self->_lock_widgetDescriptors;
  self->_lock_widgetDescriptors = v3;
  v6 = v3;

  lock_descriptorsByExtensionIdentifier = self->_lock_descriptorsByExtensionIdentifier;
  self->_lock_descriptorsByExtensionIdentifier = v4;
  v8 = v4;

  self->_lock_firstLoadCompleted = 1;
  v9 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");
  objc_msgSend(v9, "allObjects");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__NTKWidgetDescriptorProvider__queue_widgetDescriptorsChanged__block_invoke;
  v11[3] = &unk_1E6BD2B30;
  v11[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

uint64_t __62__NTKWidgetDescriptorProvider__queue_widgetDescriptorsChanged__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "descriptorsDidChangeForDescriptorProvider:", *(_QWORD *)(a1 + 32));
}

- (BOOL)initalLoadCompleted
{
  return self->_initalLoadCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_descriptorsByExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_widgetDescriptors, 0);
  objc_storeStrong((id *)&self->_widgetDescriptorProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
