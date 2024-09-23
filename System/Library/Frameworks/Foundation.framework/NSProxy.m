@implementation NSProxy

- (id)forwardingTargetForSelector:(SEL)a3
{
  return 0;
}

- (BOOL)allowsWeakReference
{
  return !-[NSProxy _isDeallocating](self, "_isDeallocating");
}

- (BOOL)_tryRetain
{
  int v2;

  v2 = _objc_rootTryRetain();
  if (v2 && *MEMORY[0x1E0C9A980])
    __CFRecordAllocationEvent();
  return v2;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v4 = (void *)_NSMessageBuilder();
  objc_opt_respondsToSelector();
  object_dispose(v4);
  -[NSProxy forwardInvocation:](self, "forwardInvocation:", 0);
  objc_msgSend(0, "getReturnValue:", v6);
  return v6[0];
}

+ (id)alloc
{
  void *v2;

  v2 = (void *)_objc_rootAlloc();
  object_getClassName(v2);
  __CFSetLastAllocationEventName();
  return v2;
}

+ (id)allocWithZone:(NSZone *)zone
{
  void *v3;

  v3 = (void *)_objc_rootAllocWithZone();
  object_getClassName(v3);
  __CFSetLastAllocationEventName();
  return v3;
}

- (NSProxy)autorelease
{
  _CFAutoreleasePoolAddObject();
  return self;
}

- (NSProxy)retain
{
  NSProxy *v2;

  v2 = (NSProxy *)_objc_rootRetain();
  if (*MEMORY[0x1E0C9A980])
    __CFRecordAllocationEvent();
  return v2;
}

- (void)release
{
  if (*MEMORY[0x1E0C9A980])
    __CFRecordAllocationEvent();
  _objc_rootRelease();
}

+ (id)performSelector:(SEL)a3 withObject:(id)a4
{
  if (!a3)
    _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  return objc_msgSend(a1, a3, a4);
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

+ (BOOL)isSubclassOfClass:(Class)a3
{
  BOOL v3;

  v3 = Superclass != 0;
  if (Superclass && Superclass != a3)
  {
    do
    {
      Superclass = class_getSuperclass((Class)Superclass);
      v3 = Superclass != 0;
    }
    while (Superclass != a3 && Superclass);
  }
  return v3;
}

- (Class)superclass
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return class_getSuperclass(v2);
}

+ (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)respondsToSelector:(SEL)aSelector
{
  objc_class *Class;

  if (!aSelector)
    return 0;
  Class = object_getClass(a1);
  return class_respondsToSelector(Class, aSelector);
}

+ (BOOL)isAncestorOfObject:(id)a3
{
  objc_class *Superclass;
  BOOL i;

  Superclass = (objc_class *)objc_opt_class();
  for (i = Superclass != 0; Superclass != a1 && Superclass; i = Superclass != 0)
    Superclass = class_getSuperclass(Superclass);
  return i;
}

+ (id)forwardingTargetForSelector:(SEL)a3
{
  return 0;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("*** -[NSProxy forwardInvocation:] called!"), 0));
}

- (NSMethodSignature)methodSignatureForSelector:(SEL)sel
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("*** -[NSProxy methodSignatureForSelector:] called!"), 0));
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -[NSProxy doesNotRecognizeSelector:%s] called!"), sel_getName(a3)), 0);
  objc_exception_throw(v3);
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  uint64_t v3;

  if (a3 && __methodDescriptionForSelector((Class)a1, a3))
    return (id)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", v3);
  else
    return 0;
}

+ (id)methodSignatureForSelector:(SEL)a3
{
  objc_class *Class;
  uint64_t v5;

  if (a3 && (Class = object_getClass(a1), __methodDescriptionForSelector(Class, a3)))
    return (id)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", v5);
  else
    return 0;
}

+ (void)forwardInvocation:(id)a3
{
  if (a3)
    a3 = (id)objc_msgSend(a3, "selector");
  objc_msgSend(a1, "doesNotRecognizeSelector:", a3);
}

+ (void)doesNotRecognizeSelector:(SEL)a3
{
  NSString *v4;
  NSString *v5;

  v4 = _NSMethodExceptionProem((objc_class *)a1, a3);
  NSLog((NSString *)CFSTR("%@: unrecognized selector sent to class %p"), v4, a1);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unrecognized selector sent to class %p"), v4, a1);
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v5, 0));
}

+ (NSProxy)init
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** +[%s<%p> init]: cannot init a class object."), class_getName((Class)a1), a1), 0);
  objc_exception_throw(v2);
}

+ (void)dealloc
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** +[%s<%p> dealloc]: cannot dealloc a class object."), class_getName((Class)a1), a1), 0);
  objc_exception_throw(v2);
}

+ (void)finalize
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** +[%s<%p> finalize]: cannot finalize a class object"), class_getName((Class)a1), a1), 0);
  objc_exception_throw(v2);
}

+ (BOOL)_tryRetain
{
  return 1;
}

+ (BOOL)_isDeallocating
{
  return 0;
}

+ (BOOL)allowsWeakReference
{
  return 1;
}

+ (BOOL)retainWeakReference
{
  return 1;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (NSString)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%s: %p>"), class_getName(v3), self);
}

+ (id)_copyDescription
{
  id v3;

  _CFAutoreleasePoolPush();
  v3 = (id)objc_msgSend(a1, "description");
  _CFAutoreleasePoolPop();
  return v3;
}

- (id)_copyDescription
{
  NSString *v3;

  _CFAutoreleasePoolPush();
  v3 = -[NSProxy description](self, "description");
  _CFAutoreleasePoolPop();
  return v3;
}

+ (BOOL)isEqual:(id)a3
{
  return a3 == a1;
}

+ (id)performSelector:(SEL)a3
{
  if (!a3)
    _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  return objc_msgSend(a1, a3);
}

- (id)performSelector:(SEL)a3
{
  if (!a3)
    _NSObjectRaiseNullSelectorException((objc_class *)self, a2);
  return objc_msgSend(self, a3);
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  if (!a3)
    _NSObjectRaiseNullSelectorException((objc_class *)self, a2);
  return objc_msgSend(self, a3, a4);
}

+ (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (!a3)
    _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  return objc_msgSend(a1, a3, a4, a5);
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (!a3)
    _NSObjectRaiseNullSelectorException((objc_class *)self, a2);
  return objc_msgSend(self, a3, a4, a5);
}

+ (BOOL)isFault
{
  return 0;
}

- (BOOL)isFault
{
  return 0;
}

+ (BOOL)isProxy
{
  return 0;
}

- (BOOL)isProxy
{
  return 1;
}

+ (BOOL)isMemberOfClass:(Class)a3
{
  return object_getClass(a1) == a3;
}

+ (BOOL)isKindOfClass:(Class)a3
{
  objc_class *Class;
  BOOL i;

  Class = object_getClass(a1);
  for (i = Class != 0; Class != a3 && Class; i = Class != 0)
    Class = class_getSuperclass(Class);
  return i;
}

- (BOOL)isKindOfClass:(Class)a3
{
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v4 = (void *)_NSMessageBuilder();
  objc_opt_isKindOfClass();
  object_dispose(v4);
  -[NSProxy forwardInvocation:](self, "forwardInvocation:", 0);
  objc_msgSend(0, "getReturnValue:", v6);
  return v6[0];
}

- (BOOL)isMemberOfClass:(Class)a3
{
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v5 = (void *)_NSMessageBuilder();
  objc_msgSend(v5, "isMemberOfClass:", a3);
  object_dispose(v5);
  -[NSProxy forwardInvocation:](self, "forwardInvocation:", 0);
  objc_msgSend(0, "getReturnValue:", v7);
  return v7[0];
}

+ (BOOL)conformsToProtocol:(id)a3
{
  BOOL v3;
  objc_class *Superclass;

  v3 = 0;
  if (a1 && a3)
  {
    Superclass = (objc_class *)a1;
    do
    {
      v3 = class_conformsToProtocol(Superclass, (Protocol *)a3);
      if (v3)
        break;
      Superclass = class_getSuperclass(Superclass);
    }
    while (Superclass);
  }
  return v3;
}

- (BOOL)conformsToProtocol:(id)a3
{
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v5 = (void *)_NSMessageBuilder();
  objc_msgSend(v5, "conformsToProtocol:", a3);
  object_dispose(v5);
  -[NSProxy forwardInvocation:](self, "forwardInvocation:", 0);
  objc_msgSend(0, "getReturnValue:", v7);
  return v7[0];
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  return a3 && class_respondsToSelector((Class)a1, a3);
}

+ (void)instanceMethodForSelector:(SEL)a3
{
  if (!a3)
    _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  return class_getMethodImplementation((Class)a1, a3);
}

+ (void)methodForSelector:(SEL)a3
{
  objc_class *Class;

  if (!a3)
    _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  Class = object_getClass(a1);
  return class_getMethodImplementation(Class, a3);
}

- (BOOL)isNSObject__
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSArray__
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSCFConstantString__
{
  objc_lookUpClass("__NSCFConstantString");
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSData__
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSDate__
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSDictionary__
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSNumber__
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSOrderedSet__
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSSet__
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSString__
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSTimeZone__
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isNSValue__
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

+ (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), class_getName((Class)a1));
}

@end
