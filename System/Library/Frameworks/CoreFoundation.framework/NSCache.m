@implementation NSCache

void __24__NSCache_objectForKey___block_invoke(uint64_t a1, id a2, _BYTE *a3)
{
  int v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "evictsObjectsWithDiscardedContent"))
  {
    v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24);
    if (v5 == 255
      || v5 == 2
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isContentDiscarded"))
      {

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
        *a3 = 1;
      }
    }
  }
}

- (BOOL)evictsObjectsWithDiscardedContent
{
  return self->_evictsDiscarded;
}

- (id)objectForKey:(id)key
{
  void *v3;
  id v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  if (key)
  {
    cache_get();
    v3 = (void *)v7[5];
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  _Block_object_dispose(&v6, 8);
  return v4;
}

- (id)allObjects
{
  NSArray *v2;
  uint64_t v4;

  v2 = +[NSArray array](NSMutableArray, "array");
  v4 = MEMORY[0x1E0C809B0];
  cache_invoke();
  return (id)-[NSArray copy](v2, "copy", v4, 3221225472, __21__NSCache_allObjects__block_invoke, &unk_1E1335A80, v2);
}

- (void)setTotalCostLimit:(NSUInteger)totalCostLimit
{
  __NSCheckReentrancy((objc_class *)self, a2);
  cache_set_cost_hint();
}

- (void)removeAllObjects
{
  __NSCheckReentrancy((objc_class *)self, a2);
  cache_remove_all(self->_cache);
}

- (void)removeObjectForKey:(id)key
{
  __NSCheckReentrancy((objc_class *)self, a2);
  if (key)
    cache_remove(self->_cache, key);
}

- (void)setMinimumObjectCount:(unint64_t)a3
{
  __NSCheckReentrancy((objc_class *)self, a2);
  cache_set_minimum_values_hint();
}

- (void)setCountLimit:(NSUInteger)countLimit
{
  __NSCheckReentrancy((objc_class *)self, a2);
  cache_set_count_hint();
}

- (void)setObject:(id)obj forKey:(id)key
{
  __NSCheckReentrancy((objc_class *)self, a2);
  -[NSCache setObject:forKey:cost:](self, "setObject:forKey:cost:", obj, key, 0);
}

- (void)setObject:(id)obj forKey:(id)key cost:(NSUInteger)g
{
  int discardableContentState;
  unsigned __int8 v11;
  uint64_t v12;
  NSException *v13;

  __NSCheckReentrancy((objc_class *)self, a2);
  if (key)
  {
    if (!obj)
    {
      v12 = __CFExceptionProem((objc_class *)self, a2);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@: attempt to insert nil value (key: %@)"), v12, key);
      v13 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
      objc_exception_throw(v13);
    }
    discardableContentState = self->_discardableContentState;
    if (self->_evictsDiscarded)
    {
      if (discardableContentState == 255)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          goto LABEL_27;
        }
      }
      else
      {
        if (discardableContentState != 1)
        {
          if (self->_discardableContentState)
            goto LABEL_27;
          if ((objc_opt_respondsToSelector() & 1) != 0
            && (objc_opt_respondsToSelector() & 1) != 0
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v11 = -1;
            else
              v11 = 1;
          }
          else
          {
            v11 = 1;
          }
          goto LABEL_26;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (objc_opt_respondsToSelector() & 1) == 0
          || (objc_opt_respondsToSelector() & 1) == 0
          || (objc_opt_respondsToSelector() & 1) == 0)
        {
          goto LABEL_27;
        }
      }
    }
    else if (discardableContentState != 255)
    {
LABEL_27:
      if (!cache_set_and_retain(self->_cache, key, obj, g))
        cache_release_value(self->_cache, obj);
      return;
    }
    v11 = 2;
LABEL_26:
    self->_discardableContentState = v11;
    goto LABEL_27;
  }
}

- (void)setEvictsObjectsWithDiscardedContent:(BOOL)evictsObjectsWithDiscardedContent
{
  BOOL v3;

  if (evictsObjectsWithDiscardedContent)
  {
    self->_discardableContentState = 2;
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  self->_evictsDiscarded = v3;
}

- (void)dealloc
{
  __CFNotificationCenter *LocalCenter;
  cache_s *cache;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
  self->_moribund = 1;
  cache = self->_cache;
  if (cache)
  {
    cache_remove_all(cache);
    while (cache_destroy(self->_cache) == 35)
      sleep(1u);
  }
  self->_cache = 0;
  v5.receiver = self;
  v5.super_class = (Class)NSCache;
  -[NSCache dealloc](&v5, sel_dealloc);
}

- (NSCache)init
{
  NSCache *v2;
  cache_t *v4;
  cache_attributes_t attrs;
  uint64_t v6;

  v2 = self;
  v6 = *MEMORY[0x1E0C80C00];
  *(&attrs.version + 1) = 0;
  attrs.key_hash_cb = (cache_key_hash_cb_t)__NSCacheKeyHash;
  attrs.version = 2;
  attrs.key_is_equal_cb = (cache_key_is_equal_cb_t)__NSCacheKeyEqual;
  attrs.key_retain_cb = (cache_key_retain_cb_t)__NSCacheKeyRetain;
  attrs.key_release_cb = (cache_release_cb_t)__NSCacheKeyRelease;
  attrs.value_release_cb = (cache_release_cb_t)__NSCacheValueRelease;
  attrs.value_make_nonpurgeable_cb = 0;
  attrs.value_make_purgeable_cb = 0;
  attrs.user_data = self;
  attrs.value_retain_cb = (cache_value_retain_cb_t)__NSCacheValueRetain;
  v4 = 0;
  if (cache_create("", &attrs, &v4))
  {

    return 0;
  }
  else
  {
    v2->_cache = v4;
    v2->_evictsDiscarded = 1;
    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v2, "setEvictsObjectsWhenApplicationEntersBackground:", 1);
  }
  return v2;
}

- (void)setEvictsObjectsWhenApplicationEntersBackground:(BOOL)a3
{
  _BOOL4 v3;
  __CFNotificationCenter *LocalCenter;

  if (self->_evictOnSuspension != a3)
  {
    v3 = a3;
    self->_evictOnSuspension = a3;
    LocalCenter = CFNotificationCenterGetLocalCenter();
    if (v3)
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)__NSCacheApplicationDidEnterBackgroundCallBack, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0, CFNotificationSuspensionBehaviorDrop);
    else
      CFNotificationCenterRemoveObserver(LocalCenter, self, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
  }
}

- (void)setName:(NSString *)name
{
  const __CFString *v3;
  UInt8 *v4;
  CFIndex maxBufLen[2];
  CFRange v6;
  CFRange v7;

  maxBufLen[1] = *MEMORY[0x1E0C80C00];
  if (name)
    v3 = (const __CFString *)name;
  else
    v3 = &stru_1E1337B18;
  maxBufLen[0] = 0;
  v6.length = CFStringGetLength(v3);
  v6.location = 0;
  CFStringGetBytes(v3, v6, 0x8000100u, 0, 0, 0, 0, maxBufLen);
  v4 = (UInt8 *)malloc_type_malloc(maxBufLen[0] + 1, 0x5379B3FBuLL);
  v7.length = CFStringGetLength(v3);
  v7.location = 0;
  CFStringGetBytes(v3, v7, 0x8000100u, 0, 0, v4, maxBufLen[0], 0);
  v4[maxBufLen[0]] = 0;
  cache_set_name();
  free(v4);
}

- (void)setDelegate:(id)delegate
{
  int v4;

  self->_cacheDelegate = (NSCacheDelegate *)delegate;
  v4 = objc_msgSend(delegate, "conformsToProtocol:", &unk_1EDCDC740);
  if (v4)
    LOBYTE(v4) = objc_opt_respondsToSelector();
  self->_doDelegateWillEvictValue = v4 & 1;
}

- (NSString)name
{
  const char *name;

  name = (const char *)cache_get_name();
  CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, name, 0x8000100u);
  return (NSString *)_CFAutoreleasePoolAddObject();
}

uint64_t __21__NSCache_allObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (id)delegate
{
  return self->_cacheDelegate;
}

- (NSUInteger)totalCostLimit
{
  return cache_get_cost_hint();
}

- (NSUInteger)countLimit
{
  return cache_get_count_hint();
}

- (unint64_t)minimumObjectCount
{
  return cache_get_minimum_values_hint();
}

- (BOOL)evictsObjectsWhenApplicationEntersBackground
{
  return self->_evictOnSuspension;
}

- (void)__apply:(id)a3
{
  cache_invoke();
}

@end
