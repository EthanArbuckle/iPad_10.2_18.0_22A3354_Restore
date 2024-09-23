@implementation __NSCFSet

- (unint64_t)count
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  return CFSetGetCount((CFSetRef)self);
}

- (id)member:(id)a3
{
  uint64_t v3;
  const void *v7[2];

  v7[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  v7[0] = 0;
  if (CFSetGetValueIfPresent((CFSetRef)self, a3, v7))
    return (id)v7[0];
  else
    return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v5;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableSet);
  return _CFSetFastEnumeration((__objc2_class **)self, (uint64_t *)a3, (uint64_t)a4, a5);
}

- (void)removeObject:(id)a3
{
  uint64_t v3;

  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  if (!_CFSetIsMutable((uint64_t)self))
    -[__NSCFSet removeObject:].cold.2((objc_class *)self, a2);
  if (!a3)
    -[__NSCFSet removeObject:].cold.1((objc_class *)self, a2);
  CFSetRemoveValue((CFMutableSetRef)self, a3);
}

- (void)addObject:(id)a3
{
  uint64_t v3;

  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  if (!_CFSetIsMutable((uint64_t)self))
    -[__NSCFSet addObject:].cold.2((objc_class *)self, a2);
  if (!a3)
    -[__NSCFSet addObject:].cold.1((objc_class *)self, a2);
  CFSetAddValue((CFMutableSetRef)self, a3);
}

- (void)removeAllObjects
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_36(v2, CFSTR("%@: mutating method sent to immutable object"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  __NSCFSet *theSet;

  theSet = self;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    self = theSet;
  }
  if (_CFSetIsMutable((uint64_t)self))
    return CFSetCreateCopy(0, (CFSetRef)theSet);
  else
    return theSet;
}

- (void)getObjects:(id *)a3
{
  uint64_t v3;
  CFIndex Count;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  Count = CFSetGetCount((CFSetRef)self);
  if (a3)
  {
    if (Count)
      CFSetGetValues((CFSetRef)self, (const void **)a3);
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  return CFSetCreateMutableCopy(0, 0, (CFSetRef)self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  if (_CFExecutableLinkedOnOrAfter(6uLL))
  {
    v7.receiver = self;
    v7.super_class = (Class)__NSCFSet;
    return -[NSSet isEqual:](&v7, sel_isEqual_, a3);
  }
  else
  {
    return a3 && _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (id)description
{
  uint64_t v2;
  double Callbacks;
  objc_super v7;
  _BYTE v8[24];
  CFStringRef (__cdecl *v9)(CFTypeRef);
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  Callbacks = __CFSetGetCallbacks((uint64_t)self, (uint64_t)v8);
  if (v9 != CFCopyDescription && v9 != 0)
    return (id)(id)CFCopyDescription(self);
  v7.receiver = self;
  v7.super_class = (Class)__NSCFSet;
  return -[NSSet description](&v7, sel_description, Callbacks);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (Class)classForCoder
{
  _CFSetIsMutable((uint64_t)self);
  return (Class)objc_opt_self();
}

- (id)objectEnumerator
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  return (id)objc_msgSend(objc_allocWithZone((Class)__NSFastEnumerationEnumerator), "initWithObject:", self);
}

- (void)addObject:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_36(v2, CFSTR("%@: attempt to insert nil"));
}

- (void)addObject:(objc_class *)a1 .cold.2(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_36(v2, CFSTR("%@: mutating method sent to immutable object"));
}

- (void)removeObject:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_36(v2, CFSTR("%@: attempt to remove nil"));
}

- (void)removeObject:(objc_class *)a1 .cold.2(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_36(v2, CFSTR("%@: mutating method sent to immutable object"));
}

@end
