@implementation __NSCFArray

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v3;
  id result;
  uint64_t Count;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v9 = 0;
  result = (id)_CFArrayCheckAndGetValueAtIndex((unint64_t *)self, a3, &v9);
  if (v9)
  {
    Count = _CFNonObjCArrayGetCount((uint64_t)self);
    _NSArrayRaiseBoundException((uint64_t)self, a2, a3, Count);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;

  if (!__cf_tsanReadFunction)
  {
    if (a3)
      return self == a3 || _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
    return 0;
  }
  __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  if (!a3)
    return 0;
  return self == a3 || _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  id result;
  uint64_t Count;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  v9 = 0;
  result = (id)_CFArrayCheckAndGetValueAtIndex((unint64_t *)self, a3, &v9);
  if (v9)
  {
    Count = _CFNonObjCArrayGetCount((uint64_t)self);
    _NSArrayRaiseBoundException((uint64_t)self, a2, a3, Count);
  }
  return result;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  unint64_t Count;
  unint64_t v11;
  CFRange v12;

  length = a4.length;
  location = a4.location;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  Count = _CFNonObjCArrayGetCount((uint64_t)self);
  v11 = location + length;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || Count < v11)
    _NSArrayRaiseBoundException((uint64_t)self, a2, v11 - 1, Count);
  if (length)
  {
    v12.location = location;
    v12.length = length;
    CFArrayGetValues((CFArrayRef)self, v12, (const void **)a3);
  }
}

- (Class)classForCoder
{
  _CFArrayIsMutable((uint64_t)self);
  return (Class)objc_opt_self();
}

- (void)addObject:(id)a3
{
  -[__NSCFArray insertObject:atIndex:](self, "insertObject:atIndex:", a3, _CFNonObjCArrayGetCount((uint64_t)self));
}

- (unint64_t)count
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  return _CFNonObjCArrayGetCount((uint64_t)self);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v5;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  return _CFArrayFastEnumeration((unint64_t *)self, a3);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = a3;
  if (!_CFArrayIsMutable((uint64_t)self))
    -[__NSCFArray insertObject:atIndex:].cold.2((objc_class *)self, a2);
  if (!__cf_tsanWriteFunction)
  {
    if (a3)
      goto LABEL_4;
LABEL_7:
    _NSArrayRaiseInsertNilException((uint64_t)self, a2);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!a3)
    goto LABEL_7;
LABEL_4:
  if (_CFNonObjCArrayGetCount((uint64_t)self) < a4)
    -[__NSCFArray insertObject:atIndex:].cold.1((uint64_t)self, a2, a4);
  _CFArrayReplaceValues((unint64_t)self, a4, 0, v9, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  __NSCFArray *theArray;

  theArray = self;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
    self = theArray;
  }
  if (_CFArrayIsMutable((uint64_t)self))
    return CFArrayCreateCopy(0, (CFArrayRef)theArray);
  else
    return theArray;
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t Count;

  if (!_CFArrayIsMutable((uint64_t)self))
    -[__NSCFArray removeObjectAtIndex:].cold.1((objc_class *)self, a2);
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  if (_CFNonObjCArrayGetCount((uint64_t)self) <= a3)
  {
    Count = _CFNonObjCArrayGetCount((uint64_t)self);
    _NSArrayRaiseBoundException((uint64_t)self, a2, a3, Count);
  }
  _CFArrayReplaceValues((unint64_t)self, a3, 1, 0, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  return CFArrayCreateMutableCopy(0, 0, (CFArrayRef)self);
}

- (id)description
{
  uint64_t v2;
  CFStringRef (__cdecl *copyDescription)(CFTypeRef);
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  copyDescription = __CFArrayGetCallBacks((uint64_t)self)->copyDescription;
  if (copyDescription != CFCopyDescription && copyDescription != 0)
    return (id)(id)CFCopyDescription(self);
  v7.receiver = self;
  v7.super_class = (Class)__NSCFArray;
  return -[NSArray description](&v7, sel_description);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)removeLastObject
{
  uint64_t Count;
  uint64_t v4;

  Count = _CFNonObjCArrayGetCount((uint64_t)self);
  if (_CFExecutableLinkedOnOrAfter(7uLL))
  {
    if (!Count)
      return;
    v4 = Count - 1;
  }
  else if (Count)
  {
    v4 = Count - 1;
  }
  else
  {
    v4 = 0;
  }
  -[__NSCFArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v4);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  uint64_t v4;
  uint64_t Count;

  if (!_CFArrayIsMutable((uint64_t)self))
    -[__NSCFArray replaceObjectAtIndex:withObject:].cold.1((objc_class *)self, a2);
  if (!__cf_tsanWriteFunction)
  {
    if (a4)
      goto LABEL_4;
LABEL_7:
    _NSArrayRaiseInsertNilException((uint64_t)self, a2);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!a4)
    goto LABEL_7;
LABEL_4:
  if (_CFNonObjCArrayGetCount((uint64_t)self) <= a3)
  {
    Count = _CFNonObjCArrayGetCount((uint64_t)self);
    _NSArrayRaiseBoundException((uint64_t)self, a2, a3, Count);
  }
  CFArraySetValueAtIndex((CFMutableArrayRef)self, a3, a4);
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

- (void)insertObject:(unint64_t)a3 atIndex:.cold.1(uint64_t a1, const char *a2, unint64_t a3)
{
  uint64_t Count;

  Count = _CFNonObjCArrayGetCount(a1);
  _NSArrayRaiseBoundException(a1, a2, a3, Count + 1);
}

- (void)insertObject:(objc_class *)a1 atIndex:(const char *)a2 .cold.2(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_3_3(v2, CFSTR("%@: mutating method sent to immutable object"));
}

- (void)replaceObjectAtIndex:(objc_class *)a1 withObject:(const char *)a2 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_3_3(v2, CFSTR("%@: mutating method sent to immutable object"));
}

- (void)removeObjectAtIndex:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_3_3(v2, CFSTR("%@: mutating method sent to immutable object"));
}

@end
