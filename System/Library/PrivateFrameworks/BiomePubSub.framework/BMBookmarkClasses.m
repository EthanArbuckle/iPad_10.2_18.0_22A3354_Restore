@implementation BMBookmarkClasses

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sharedInstance_bookmarkClasses;
}

- (id)allowedClassesForSecureCodingBMBookmark
{
  os_unfair_lock_s *p_lock;
  Class v4;
  Class v5;
  Class v6;
  Class v7;
  Class v8;
  Class v9;
  Class v10;
  void *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_addedBiomeStorageClasses)
  {
    v4 = NSClassFromString(CFSTR("BMStoreBookmark"));
    v5 = NSClassFromString(CFSTR("BMStoreEvent"));
    if (v4)
    {
      v6 = v5;
      if (v5)
      {
        -[NSMutableSet addObject:](self->_allowed, "addObject:", v4);
        -[NSMutableSet addObject:](self->_allowed, "addObject:", v6);
        self->_addedBiomeStorageClasses = 1;
      }
    }
  }
  if (!self->_addedBiomeStreamsClasses)
  {
    v7 = NSClassFromString(CFSTR("BMEventSession"));
    if (v7)
    {
      -[NSMutableSet addObject:](self->_allowed, "addObject:", v7);
      self->_addedBiomeStreamsClasses = 1;
    }
  }
  if (!self->_addedCascadeSetsClasses)
  {
    v8 = NSClassFromString(CFSTR("CCSetChangeBookmark"));
    v9 = NSClassFromString(CFSTR("CCReplicatedEntityEnumeratorBookmark"));
    if (v8)
    {
      v10 = v9;
      if (v9)
      {
        -[NSMutableSet addObject:](self->_allowed, "addObject:", v8);
        -[NSMutableSet addObject:](self->_allowed, "addObject:", v10);
        self->_addedCascadeSetsClasses = 1;
      }
    }
  }
  v11 = (void *)-[NSMutableSet copy](self->_allowed, "copy");
  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void)allowClassesForSecureCodingBMBookmark:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet addObjectsFromArray:](self->_allowed, "addObjectsFromArray:", v5);

  os_unfair_lock_unlock(p_lock);
}

void __35__BMBookmarkClasses_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_bookmarkClasses;
  sharedInstance_bookmarkClasses = v0;

}

- (BMBookmarkClasses)init
{
  BMBookmarkClasses *v2;
  BMBookmarkClasses *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSMutableSet *allowed;
  objc_super v9;
  _QWORD v10[15];

  v10[14] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)BMBookmarkClasses;
  v2 = -[BMBookmarkClasses init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    *(_WORD *)&v2->_addedBiomeStorageClasses = 0;
    v2->_addedCascadeSetsClasses = 0;
    v4 = (void *)MEMORY[0x1E0C99E20];
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    v10[2] = objc_opt_class();
    v10[3] = objc_opt_class();
    v10[4] = objc_opt_class();
    v10[5] = objc_opt_class();
    v10[6] = objc_opt_class();
    v10[7] = objc_opt_class();
    v10[8] = objc_opt_class();
    v10[9] = objc_opt_class();
    v10[10] = objc_opt_class();
    v10[11] = objc_opt_class();
    v10[12] = objc_opt_class();
    v10[13] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    allowed = v3->_allowed;
    v3->_allowed = (NSMutableSet *)v6;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowed, 0);
}

@end
