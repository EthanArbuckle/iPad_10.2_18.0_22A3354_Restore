@implementation SunriseSunsetProvider

- (id)copySunsetSunriseInfoFromContext
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Class v29;
  id v30;
  id v31;
  SEL v32;
  SunriseSunsetProvider *v33;

  v33 = self;
  v32 = a2;
  v31 = 0;
  v30 = 0;
  if (self->_duetContextStore)
  {
    if (v33->_duetKeyPath)
    {
      v31 = (id)-[_CDClientContext objectForKeyedSubscript:](v33->_duetContextStore, "objectForKeyedSubscript:", v33->_duetKeyPath);
      if (v31)
      {
        v17 = 0x1E0C99000uLL;
        v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
        NSLog(CFSTR("dataDictionary : %s"), objc_msgSend((id)objc_msgSend(v31, "description"), "UTF8String"));
        v29 = 0;
        v29 = NSClassFromString(CFSTR("_CDContextQueries"));
        v28 = 0;
        v28 = -[objc_class sunriseSunsetAvailabilityStatusKey](v29, "sunriseSunsetAvailabilityStatusKey");
        v27 = 0;
        v27 = objc_msgSend(v31, "objectForKeyedSubscript:", v28);
        objc_msgSend(v30, "setValue:forKey:", v27, CFSTR("status"));
        v28 = -[objc_class currentSunriseKey](v29, "currentSunriseKey");
        v26 = 0;
        v26 = objc_msgSend(v31, "objectForKeyedSubscript:", v28);
        v25 = 0;
        v11 = v31;
        v2 = -[objc_class currentSunsetKey](v29, "currentSunsetKey");
        v25 = objc_msgSend(v11, "objectForKeyedSubscript:", v2);
        v24 = 0;
        v12 = v31;
        v3 = -[objc_class nextSunriseKey](v29, "nextSunriseKey");
        v24 = objc_msgSend(v12, "objectForKeyedSubscript:", v3);
        v23 = 0;
        v13 = v31;
        v4 = -[objc_class nextSunsetKey](v29, "nextSunsetKey");
        v23 = objc_msgSend(v13, "objectForKeyedSubscript:", v4);
        v22 = 0;
        v14 = v31;
        v5 = -[objc_class previousSunriseKey](v29, "previousSunriseKey");
        v22 = objc_msgSend(v14, "objectForKeyedSubscript:", v5);
        v21 = 0;
        v15 = v31;
        v6 = -[objc_class previousSunsetKey](v29, "previousSunsetKey");
        v21 = objc_msgSend(v15, "objectForKeyedSubscript:", v6);
        v20 = 0;
        v16 = v31;
        v7 = -[objc_class isDaylightKey](v29, "isDaylightKey");
        v20 = objc_msgSend(v16, "objectForKeyedSubscript:", v7);
        v19 = 0;
        v8 = objc_alloc(*(Class *)(v17 + 3592));
        v18 = &v10;
        v19 = (id)objc_msgSend(v8, "initWithObjectsAndKeys:", v26, CFSTR("sunrise"), v25, CFSTR("sunset"), v22, CFSTR("previousSunrise"), v21, CFSTR("previousSunset"), v24, CFSTR("nextSunrise"), v23, CFSTR("nextSunset"), v20, CFSTR("isDaylight"), 0);
        objc_msgSend(v30, "setObject:forKey:", v19, CFSTR("sunSchedule"));

      }
    }
  }
  return v30;
}

- (SunriseSunsetProvider)initWithCallback:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  Class v6;
  uint64_t v7;
  Class v8;
  uint64_t v9;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  SunriseSunsetProvider *v16;
  objc_super v18;
  id v19;
  SEL v20;
  SunriseSunsetProvider *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  NSLog(CFSTR("%s: SunriseSunsetProvider initialisation \n"), "-[SunriseSunsetProvider initWithCallback:]");
  v18.receiver = v21;
  v18.super_class = (Class)SunriseSunsetProvider;
  v21 = -[SunriseSunsetProvider init](&v18, sel_init);
  if (v21)
  {
    if (dlopen("/System/Library/PrivateFrameworks/CoreDuetContext.framework/CoreDuetContext", 1))
    {
      NSLog(CFSTR("%s: CoreDuet loaded dynamically \n"), "-[SunriseSunsetProvider initWithCallback:]");
      v3 = -[objc_class userContext](NSClassFromString(CFSTR("_CDClientContext")), "userContext");
      v21->_duetContextStore = (_CDClientContext *)v3;
      if (v21->_duetContextStore)
      {
        v21->_duetDispatchSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
        if (v19)
        {
          v4 = _Block_copy(v19);
          v21->_callbackBlock = v4;
        }
        v5 = -[objc_class keyPathForSunriseSunsetDataDictionary](NSClassFromString(CFSTR("_CDContextQueries")), "keyPathForSunriseSunsetDataDictionary");
        v21->_duetKeyPath = (_CDContextualKeyPath *)v5;
        v6 = NSClassFromString(CFSTR("_CDContextualPredicate"));
        v7 = -[objc_class predicateForChangeAtKeyPath:](v6, "predicateForChangeAtKeyPath:", v21->_duetKeyPath);
        v21->_predicate = (_CDContextualPredicate *)v7;
        v11 = MEMORY[0x1E0C809B0];
        v12 = -1073741824;
        v13 = 0;
        v14 = __42__SunriseSunsetProvider_initWithCallback___block_invoke;
        v15 = &unk_1E68EBD38;
        v16 = v21;
        v21->_duetCallback = &v11;
        v8 = NSClassFromString(CFSTR("_CDContextualChangeRegistration"));
        v9 = -[objc_class registrationWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:mustWake:callback:](v8, "registrationWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:mustWake:callback:", CFSTR("com.apple.CoreBrightness.registrationForSunsetSunrise"), v21->_predicate, 0, 0, 0, v21->_duetCallback);
        v21->_duetRegistration = (_CDContextualChangeRegistration *)v9;
        if (v21->_duetRegistration)
        {
          -[_CDClientContext registerCallback:](v21->_duetContextStore, "registerCallback:", v21->_duetRegistration);
          v21->_sunriseSunsetNotificationEnabled = 1;
        }
      }
      else
      {
        NSLog(CFSTR("%s: Duet context store not available \n"), "-[SunriseSunsetProvider initWithCallback:]");

        return 0;
      }
    }
    else
    {
      NSLog(CFSTR("%s: CoreDuet framework dynamic load failed \n"), "-[SunriseSunsetProvider initWithCallback:]");

      return 0;
    }
  }
  else
  {
    NSLog(CFSTR("%s: error on initialisation \n"), "-[SunriseSunsetProvider initWithCallback:]");

    return 0;
  }
  return v21;
}

uint64_t __42__SunriseSunsetProvider_initWithCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Identifier called: %@"), a2);
  objc_msgSend(*(id *)(a1 + 32), "updateSunriseSunsetInfo");
  return 1;
}

- (void)registerBlock:(id)a3
{
  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s: register async callback block \n"), "-[SunriseSunsetProvider registerBlock:]");
  objc_sync_enter(self);
  if (self->_callbackBlock)
  {
    _Block_release(self->_callbackBlock);
    self->_callbackBlock = 0;
  }
  if (a3)
    self->_callbackBlock = _Block_copy(a3);
  objc_sync_exit(self);
}

- (void)unregisterBlock
{
  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s: unregistering async callback block \n"), "-[SunriseSunsetProvider unregisterBlock]");
  objc_sync_enter(self);
  if (self->_callbackBlock)
  {
    _Block_release(self->_callbackBlock);
    self->_callbackBlock = 0;
  }
  objc_sync_exit(self);
}

- (void)unregisterNotification
{
  if (self->_logLevel >= 7)
    NSLog(CFSTR("%s: unregistering notification \n"), "-[SunriseSunsetProvider unregisterNotification]");
  objc_sync_enter(self);
  if (self->_duetRegistration)
  {
    -[_CDClientContext deregisterCallback:](self->_duetContextStore, "deregisterCallback:", self->_duetRegistration);

  }
  self->_sunriseSunsetNotificationEnabled = 0;
  objc_sync_exit(self);
}

- (void)cancel
{
  -[SunriseSunsetProvider unregisterNotification](self, "unregisterNotification");
  -[SunriseSunsetProvider unregisterBlock](self, "unregisterBlock");
}

- (void)dealloc
{
  objc_super v3;
  SEL v4;
  SunriseSunsetProvider *v5;

  v5 = self;
  v4 = a2;
  objc_sync_enter(self);
  if (v5->_duetDispatchSemaphore)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)v5->_duetDispatchSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release((dispatch_object_t)v5->_duetDispatchSemaphore);
    v5->_duetDispatchSemaphore = 0;
  }

  v5->_duetKeyPath = 0;
  v5->_duetContextStore = 0;

  v5->_predicate = 0;
  objc_sync_exit(self);
  v3.receiver = v5;
  v3.super_class = (Class)SunriseSunsetProvider;
  -[SunriseSunsetProvider dealloc](&v3, sel_dealloc);
}

- (id)copySunriseSunsetInfo:(int)a3
{
  NSObject *global_queue;
  dispatch_time_t v4;
  void *v6;
  NSObject *dsema;
  uint64_t block;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  SunriseSunsetProvider *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  int v19;
  int v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  int v24;
  int v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  void *v29;
  int v30;
  SEL v31;
  SunriseSunsetProvider *v32;

  v32 = self;
  v31 = a2;
  v30 = a3;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 1375731712;
  v25 = 48;
  v26 = __Block_byref_object_copy__19;
  v27 = __Block_byref_object_dispose__19;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x20000000;
  v20 = 32;
  v21 = 0;
  objc_sync_enter(self);
  if (!v32->_duetDispatchSemaphore || dispatch_semaphore_wait((dispatch_semaphore_t)v32->_duetDispatchSemaphore, 0))
  {
    if (v32->_logLevel >= 7)
      NSLog(CFSTR("%s: already stuck in a querry, passing \n"), "-[SunriseSunsetProvider copySunriseSunsetInfo:]");
  }
  else
  {
    global_queue = dispatch_get_global_queue(2, 0);
    block = MEMORY[0x1E0C809B0];
    v10 = -1073741824;
    v11 = 0;
    v12 = __47__SunriseSunsetProvider_copySunriseSunsetInfo___block_invoke;
    v13 = &unk_1E68EBD60;
    v15 = &v22;
    v14 = v32;
    v16 = &v17;
    dispatch_async(global_queue, &block);
    dsema = v32->_duetDispatchSemaphore;
    v4 = dispatch_time(0, 1000000 * v30);
    if (dispatch_semaphore_wait(dsema, v4))
    {
      if (v32->_logLevel >= 7)
        NSLog(CFSTR("%s: sunrise/sunset querry timeout \n"), "-[SunriseSunsetProvider copySunriseSunsetInfo:]");
      *((_BYTE *)v18 + 24) = 1;
    }
    else
    {
      if (v32->_logLevel >= 7)
        NSLog(CFSTR("%s: sunrise/sunset returned on time\n"), "-[SunriseSunsetProvider copySunriseSunsetInfo:]");
      dispatch_semaphore_signal((dispatch_semaphore_t)v32->_duetDispatchSemaphore);
      v29 = (void *)v23[5];
    }
  }
  objc_sync_exit(self);
  v6 = v29;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v22, 8);
  return v6;
}

uint64_t __47__SunriseSunsetProvider_copySunriseSunsetInfo___block_invoke(uint64_t a1)
{
  id obj;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "copySunsetSunriseInfoFromContext");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) & 1) != 0)
  {
    if (*(int *)(*(_QWORD *)(a1 + 32) + 80) >= 7)
      NSLog(CFSTR("%s: timeout detected, calling back with an update \n"), "-[SunriseSunsetProvider copySunriseSunsetInfo:]_block_invoke");
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();

  }
  return objc_sync_exit(obj);
}

- (void)updateSunriseSunsetInfo
{
  NSObject *global_queue;
  uint64_t block;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SunriseSunsetProvider *v9;
  SEL v10;
  SunriseSunsetProvider *v11;

  v11 = self;
  v10 = a2;
  objc_sync_enter(self);
  if (v11->_sunriseSunsetNotificationEnabled
    && v11->_duetDispatchSemaphore
    && !dispatch_semaphore_wait((dispatch_semaphore_t)v11->_duetDispatchSemaphore, 0))
  {
    global_queue = dispatch_get_global_queue(2, 0);
    block = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __48__SunriseSunsetProvider_updateSunriseSunsetInfo__block_invoke;
    v8 = &unk_1E68E9E60;
    v9 = v11;
    dispatch_async(global_queue, &block);
  }
  else if (v11->_logLevel >= 7)
  {
    NSLog(CFSTR("%s: already stuck in a querry, passing \n"), "-[SunriseSunsetProvider updateSunriseSunsetInfo]");
  }
  objc_sync_exit(self);
}

uint64_t __48__SunriseSunsetProvider_updateSunriseSunsetInfo__block_invoke(uint64_t a1)
{
  id obj;
  void *v4;

  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copySunsetSunriseInfoFromContext");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(int *)(*(_QWORD *)(a1 + 32) + 80) >= 7)
    NSLog(CFSTR("%s: calling back with an update \n"), "-[SunriseSunsetProvider updateSunriseSunsetInfo]_block_invoke");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();

  return objc_sync_exit(obj);
}

- (int)logLevel
{
  return self->_logLevel;
}

- (void)setLogLevel:(int)a3
{
  self->_logLevel = a3;
}

@end
