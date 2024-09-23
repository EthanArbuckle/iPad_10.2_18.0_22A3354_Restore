@implementation SGCuratedChangeNotifications

+ (id)_getListenerByClassMap
{
  if (_getListenerByClassMap__pasOnceToken2 != -1)
    dispatch_once(&_getListenerByClassMap__pasOnceToken2, &__block_literal_global_16494);
  return (id)_getListenerByClassMap__pasExprOnceResult;
}

+ (id)_getListener:(Class)a3
{
  id v4;
  void *v5;

  objc_msgSend(a1, "_getListenerByClassMap");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend(v4, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "setObject:forKey:", v5, a3);
  }
  objc_sync_exit(v4);

  return v5;
}

+ (void)_addObserver:(id)a3 forObjectLifetime:(id)a4 listenerClass:(Class)a5
{
  id v8;
  id v9;
  id value;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "_getListener:", a5);
  value = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(value, "addObserver:forObjectLifetime:", v9, v8);

  objc_setAssociatedObject(v8, a5, value, (void *)0x301);
}

+ (void)addAddressBookObserver:(id)a3 forObjectLifetime:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_addObserver:forObjectLifetime:listenerClass:", v7, v6, objc_opt_class());

}

+ (void)addCalendarObserver:(id)a3 forObjectLifetime:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_addObserver:forObjectLifetime:listenerClass:", v7, v6, objc_opt_class());

}

void __54__SGCuratedChangeNotifications__getListenerByClassMap__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 1);
  v2 = (void *)_getListenerByClassMap__pasExprOnceResult;
  _getListenerByClassMap__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

+ (void)simulateAddressBookChange
{
  id v2;

  objc_msgSend(a1, "_getListener:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fire");

}

+ (void)simulateCalendarChange
{
  id v2;

  objc_msgSend(a1, "_getListener:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fire");

}

@end
