@implementation _LSDeviceIdentifierManager

- (id)cacheForPersona:(id)a3
{
  id v4;
  id v5;
  __CFString *v6;
  NSMutableDictionary *v7;
  _LSDeviceIdentifierCache *v8;

  v4 = a3;
  if (v4 && (getUMUserPersonaClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    if (objc_msgSend(v5, "isEnterprisePersona"))
    {
      objc_msgSend(v5, "userPersonaUniqueString");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1E10473A0;
    }

  }
  else
  {
    v6 = &stru_1E10473A0;
  }
  v7 = self->_sharedCaches;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKey:](self->_sharedCaches, "objectForKey:", v6);
  v8 = (_LSDeviceIdentifierCache *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = -[_LSDeviceIdentifierCache initWithPersona:]([_LSDeviceIdentifierCache alloc], "initWithPersona:", v6);
    -[NSMutableDictionary setObject:forKey:](self->_sharedCaches, "setObject:forKey:", v8, v6);
  }
  objc_sync_exit(v7);

  return v8;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  _LSAssertRunningInServer((uint64_t)"+[_LSDeviceIdentifierManager sharedInstance]");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___LSDeviceIdentifierManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[_LSDeviceIdentifierManager sharedInstance]::once != -1)
    dispatch_once(&+[_LSDeviceIdentifierManager sharedInstance]::once, block);
  return (id)+[_LSDeviceIdentifierManager sharedInstance]::result;
}

- (_LSDeviceIdentifierManager)init
{
  _LSDeviceIdentifierManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sharedCaches;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_LSDeviceIdentifierManager;
  v2 = -[_LSDeviceIdentifierManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sharedCaches = v2->_sharedCaches;
    v2->_sharedCaches = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedCaches, 0);
}

@end
