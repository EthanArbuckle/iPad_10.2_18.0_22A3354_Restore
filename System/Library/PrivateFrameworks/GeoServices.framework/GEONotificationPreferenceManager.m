@implementation GEONotificationPreferenceManager

- (BOOL)isEnabledForSubTestWithName:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[NSMutableDictionary objectForKey:](self->_enableFlags, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (id)sharedManager
{
  if (_MergedGlobals_225 != -1)
    dispatch_once(&_MergedGlobals_225, &__block_literal_global_73);
  return (id)qword_1ECDBBE08;
}

void __49__GEONotificationPreferenceManager_sharedManager__block_invoke()
{
  GEONotificationPreferenceManager *v0;
  void *v1;

  v0 = objc_alloc_init(GEONotificationPreferenceManager);
  v1 = (void *)qword_1ECDBBE08;
  qword_1ECDBBE08 = (uint64_t)v0;

}

- (GEONotificationPreferenceManager)init
{
  GEONotificationPreferenceManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *enableFlags;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEONotificationPreferenceManager;
  v2 = -[GEONotificationPreferenceManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    enableFlags = v2->_enableFlags;
    v2->_enableFlags = v3;

  }
  return v2;
}

- (void)setEnabled:(BOOL)a3 forSubTestWithName:(id)a4
{
  _BOOL8 v4;
  NSMutableDictionary *enableFlags;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  enableFlags = self->_enableFlags;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](enableFlags, "setObject:forKey:", v8, v7);

}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_enableFlags, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableFlags, 0);
}

@end
