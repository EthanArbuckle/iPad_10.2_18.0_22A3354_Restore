@implementation NSNotificationCenter

- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
  NSNotification *v5;

  if (aName)
  {
    v5 = -[NSNotification initWithName:object:userInfo:]([NSNotification alloc], "initWithName:object:userInfo:", aName, anObject, aUserInfo);
    _CFXNotificationPost();

  }
}

+ (id)_defaultCenterWithoutCreating
{
  if (!atomic_load(&qword_1ECD09900))
    return 0;
  if (qword_1ECD09908 != -1)
    dispatch_once(&qword_1ECD09908, &__block_literal_global_138);
  return (id)atomic_load(&qword_1ECD09900);
}

- (id)addObserverForName:(NSNotificationName)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void *)block
{
  _QWORD *v7;
  objc_class *v8;
  void *v10;

  if (!block)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Block cannot be nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v10);
  }
  v7 = +[__NSObserver observerWithCenter:]((uint64_t)__NSObserver, self);
  if (_CFAppVersionCheck())
  {
    objc_msgSend(v7, "setBlock:", block);
    objc_msgSend(v7, "block");
  }
  v8 = (objc_class *)objc_opt_class();
  class_isMetaClass(v8);
  objc_msgSend(v7, "setToken:", _CFXNotificationRegisterObserver());
  return v7;
}

- (void)postNotificationName:(NSNotificationName)aName object:(id)anObject
{
  -[NSNotificationCenter postNotificationName:object:userInfo:](self, "postNotificationName:object:userInfo:", aName, anObject, 0);
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject
{
  objc_class *Class;
  NSNotification *v10;

  if (observer && aSelector)
  {
    if (CFSTR("NSWillBecomeMultiThreadedNotification") == (__CFString *)aName && _NSIsMultiThreaded == 0)
    {
      _NSIsMultiThreaded = 1;
      v10 = -[NSNotification initWithName:object:userInfo:]([NSNotification alloc], "initWithName:object:userInfo:", aName, 0, 0);
      objc_msgSend(observer, aSelector, v10);

    }
    else
    {
      if (addObserver_selector_name_object__once != -1)
        dispatch_once(&addObserver_selector_name_object__once, &__block_literal_global_84);
      Class = object_getClass(observer);
      class_isMetaClass(Class);
      _CFXNotificationRegisterObserver();
    }
  }
}

+ (NSNotificationCenter)defaultCenter
{
  const __CFDictionary *Mutable;
  NSNotificationCenter *Value;

  if (NSNotificationCenter == a1)
  {
    if (qword_1ECD09908 != -1)
      dispatch_once(&qword_1ECD09908, &__block_literal_global_138);
    return (NSNotificationCenter *)atomic_load(&qword_1ECD09900);
  }
  else
  {
    os_unfair_lock_lock_with_options();
    Mutable = (const __CFDictionary *)qword_1ECD098F0;
    if (!qword_1ECD098F0)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      qword_1ECD098F0 = (uint64_t)Mutable;
    }
    Value = (NSNotificationCenter *)CFDictionaryGetValue(Mutable, a1);
    if (!Value)
    {
      Value = (NSNotificationCenter *)objc_alloc_init((Class)a1);
      CFDictionarySetValue((CFMutableDictionaryRef)qword_1ECD098F0, a1, Value);

    }
    os_unfair_lock_unlock(&stru_1ECD098DC);
  }
  return Value;
}

- (unint64_t)_addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6 options:(unint64_t)a7
{
  objc_class *Class;

  Class = object_getClass(a3);
  class_isMetaClass(Class);
  return _CFXNotificationRegisterObserver();
}

- (void)removeObserver:(id)observer name:(NSNotificationName)aName object:(id)anObject
{
  int v6;
  uint64_t v7;
  id v8;

  if (!observer)
    return;
  objc_opt_self();
  os_unfair_lock_lock(&_MergedGlobals_9);
  if (!qword_1ECD098E8)
  {
    os_unfair_lock_unlock(&_MergedGlobals_9);
    goto LABEL_10;
  }
  v6 = CFSetContainsValue((CFSetRef)qword_1ECD098E8, observer);
  os_unfair_lock_unlock(&_MergedGlobals_9);
  if (!v6)
  {
LABEL_10:
    _CFXNotificationRemoveObservers();
    return;
  }
  objc_opt_self();
  os_unfair_lock_lock(&_MergedGlobals_9);
  if (qword_1ECD098E8 && CFSetContainsValue((CFSetRef)qword_1ECD098E8, observer))
  {
    CFSetRemoveValue((CFMutableSetRef)qword_1ECD098E8, observer);
    v8 = (id)*((_QWORD *)observer + 1);
    *((_QWORD *)observer + 1) = 0;
    v7 = objc_msgSend(observer, "token");
    os_unfair_lock_unlock(&_MergedGlobals_9);
    if (v8)
    {
      objc_msgSend(v8, "_removeObserver:", v7);

    }
  }
  else
  {
    os_unfair_lock_unlock(&_MergedGlobals_9);
  }
}

- (void)_removeObserver:(unint64_t)a3
{
  _CFXNotificationCancelToken();
}

- (void)removeObserver:(id)observer
{
  -[NSNotificationCenter removeObserver:name:object:](self, "removeObserver:name:object:", observer, 0, 0);
}

+ (void)load
{
  _CFNotificationCenterRegisterDependentNotificationList();
}

- (id)debugDescription
{
  pid_t v3;
  NSObject *v5;
  NSMutableString *v6;
  const void *v7;
  uint8_t buf[16];
  _OWORD buffer[2];
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  memset(buffer, 0, sizeof(buffer));
  v3 = getpid();
  if (proc_pidinfo(v3, 13, 0, buffer, 64) != 64 || (v11 & 2) == 0)
  {
    v5 = _NSOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1817D9000, v5, OS_LOG_TYPE_ERROR, "-[NSNotificationCenter debugDescription] should not be used programmatically and only be used in the debugger.", buf, 2u);
    }
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p>\n"), objc_opt_class(), self);
  }
  else
  {
    v6 = +[NSString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@:%p>\n"), objc_opt_class(), self);
    v7 = (const void *)_CFXNotificationCenterCopyDebugInfo();
    -[NSMutableString appendString:](v6, "appendString:", v7);
    CFRelease(v7);
  }
  return v6;
}

- (void)postNotification:(NSNotification *)notification
{
  void *v3;

  if (!notification)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: notification is nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v3);
  }
  _CFXNotificationPost();
}

- (NSNotificationCenter)init
{
  self->_impl = (__CFNotificationCenter *)_CFXNotificationCenterCreate();
  return self;
}

- (void)dealloc
{
  __CFNotificationCenter *impl;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
    CFRelease(impl);
  v4.receiver = self;
  v4.super_class = (Class)NSNotificationCenter;
  -[NSNotificationCenter dealloc](&v4, sel_dealloc);
}

- (id)_initWithCFNotificationCenter:(__CFNotificationCenter *)a3
{
  NSNotificationCenter *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSNotificationCenter;
  v4 = -[NSNotificationCenter init](&v6, sel_init);
  v4->_impl = (__CFNotificationCenter *)CFRetain(a3);
  return v4;
}

- (id)description
{
  return (id)(id)CFCopyDescription(self->_impl);
}

- (BOOL)isEmpty
{
  return _CFXNotificationCenterIsEmpty() != 0;
}

@end
