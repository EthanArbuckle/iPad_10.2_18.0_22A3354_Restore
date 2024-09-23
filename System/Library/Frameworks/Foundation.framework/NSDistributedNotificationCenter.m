@implementation NSDistributedNotificationCenter

- (void)removeObserver:(id)observer name:(NSNotificationName)aName object:(NSString *)anObject
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSDistributedNotificationCenter;
  -[NSNotificationCenter removeObserver:name:object:](&v5, sel_removeObserver_name_object_, observer, aName, anObject);
}

+ (NSDistributedNotificationCenter)defaultCenter
{
  return (NSDistributedNotificationCenter *)objc_msgSend(a1, "notificationCenterForType:", CFSTR("_NSLocalNotificationCenter"));
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(NSString *)anObject
{
  -[NSDistributedNotificationCenter addObserver:selector:name:object:suspensionBehavior:](self, "addObserver:selector:name:object:suspensionBehavior:", observer, aSelector, aName, anObject, 2);
}

- (void)postNotificationName:(NSNotificationName)name object:(NSString *)object userInfo:(NSDictionary *)userInfo deliverImmediately:(BOOL)deliverImmediately
{
  -[NSDistributedNotificationCenter postNotificationName:object:userInfo:options:](self, "postNotificationName:object:userInfo:options:", name, object, userInfo, deliverImmediately);
}

+ (NSDistributedNotificationCenter)notificationCenterForType:(NSDistributedNotificationCenterType)notificationCenterType
{
  const __CFDictionary *Mutable;
  NSDistributedNotificationCenter *Value;
  objc_class *v7;

  os_unfair_lock_lock_with_options();
  Mutable = (const __CFDictionary *)qword_1ECD098F8;
  if (!qword_1ECD098F8)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    qword_1ECD098F8 = (uint64_t)Mutable;
  }
  Value = (NSDistributedNotificationCenter *)CFDictionaryGetValue(Mutable, notificationCenterType);
  if (!Value)
  {
    v7 = NSClassFromString(notificationCenterType);
    if (!v7)
      v7 = (objc_class *)a1;
    Value = (NSDistributedNotificationCenter *)objc_alloc_init(v7);
    if (Value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)qword_1ECD098F8, notificationCenterType, Value);

    }
  }
  os_unfair_lock_unlock(&stru_1ECD098DC);
  return Value;
}

- (NSDistributedNotificationCenter)init
{
  self->super._impl = (__CFNotificationCenter *)_CFXNotificationCenterCreate();
  return self;
}

- (void)addObserver:(id)observer selector:(SEL)selector name:(NSNotificationName)name object:(NSString *)object suspensionBehavior:(NSNotificationSuspensionBehavior)suspensionBehavior
{
  objc_class *Class;

  Class = object_getClass(observer);
  class_isMetaClass(Class);
  _CFXNotificationRegisterObserver();
}

- (void)postNotificationName:(NSNotificationName)aName object:(NSString *)anObject
{
  -[NSDistributedNotificationCenter postNotificationName:object:userInfo:deliverImmediately:](self, "postNotificationName:object:userInfo:deliverImmediately:", aName, anObject, 0, 0);
}

- (id)addObserverForName:(id)a3 object:(id)a4 suspensionBehavior:(unint64_t)a5 queue:(id)a6 usingBlock:(id)a7
{
  _QWORD *v7;
  void *v9;

  if (!a7)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Block cannot be nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  v7 = +[__NSObserver observerWithCenter:]((uint64_t)__NSObserver, self);
  objc_msgSend(v7, "setToken:", _CFXNotificationRegisterObserver());
  return v7;
}

- (id)addObserverForName:(id)a3 object:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  return -[NSDistributedNotificationCenter addObserverForName:object:suspensionBehavior:queue:usingBlock:](self, "addObserverForName:object:suspensionBehavior:queue:usingBlock:", a3, a4, 2, a5, a6);
}

- (void)postNotificationName:(NSNotificationName)aName object:(NSString *)anObject userInfo:(NSDictionary *)aUserInfo
{
  -[NSDistributedNotificationCenter postNotificationName:object:userInfo:deliverImmediately:](self, "postNotificationName:object:userInfo:deliverImmediately:", aName, anObject, aUserInfo, 0);
}

- (void)postNotificationName:(NSNotificationName)name object:(NSString *)object userInfo:(NSDictionary *)userInfo options:(NSDistributedNotificationOptions)options
{
  NSNotification *v6;

  v6 = -[NSNotification initWithName:object:userInfo:]([NSNotification alloc], "initWithName:object:userInfo:", name, object, userInfo);
  _CFXNotificationPost();

}

- (void)setSuspended:(BOOL)suspended
{
  _CFXNotificationSetSuspended();
}

- (void)postNotification:(id)a3
{
  void *v3;

  if (!a3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: notification is nil"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v3);
  }
  _CFXNotificationPost();
}

- (BOOL)suspended
{
  return _CFXNotificationGetSuspended();
}

@end
