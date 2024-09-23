@implementation __NSCFDictionary

- (id)objectForKey:(id)a3
{
  uint64_t v3;

  if (!a3)
    return 0;
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  return (id)CFDictionaryGetValue((CFDictionaryRef)self, a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v5;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
  return _CFDictionaryFastEnumeration((__objc2_class **)self, (uint64_t *)a3, (uint64_t)a4, a5);
}

- (unint64_t)count
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  return CFDictionaryGetCount((CFDictionaryRef)self);
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v3;

  if (!_CFDictionaryIsMutable((uint64_t)self))
    -[__NSCFDictionary removeObjectForKey:].cold.1((objc_class *)self, a2);
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
  if (!a3)
    _NSDictionaryRaiseRemoveNilKeyException((objc_class *)self, a2);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)self, a3);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  id v9;

  if (!_CFDictionaryIsMutable((uint64_t)self))
    -[__NSCFDictionary setObject:forKey:].cold.1((objc_class *)self, a2);
  if (!__cf_tsanWriteFunction)
  {
    if (a4)
      goto LABEL_4;
LABEL_7:
    _NSDictionaryRaiseInsertNilKeyException((objc_class *)self, a2);
  }
  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a4)
    goto LABEL_7;
LABEL_4:
  if (!a3)
    _NSDictionaryRaiseInsertNilValueException((objc_class *)self, a2, (uint64_t)a4);
  v9 = (id)objc_msgSend(a4, "copyWithZone:", 0);
  CFDictionarySetValue((CFMutableDictionaryRef)self, v9, a3);

}

- (Class)classForCoder
{
  _CFDictionaryIsMutable((uint64_t)self);
  return (Class)objc_opt_self();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  __NSCFDictionary *theDict;

  theDict = self;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
    self = theDict;
  }
  if (_CFDictionaryIsMutable((uint64_t)self))
    return CFDictionaryCreateCopy(0, (CFDictionaryRef)theDict);
  else
    return theDict;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  return CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)self);
}

- (id)description
{
  uint64_t v2;
  CFStringRef (__cdecl *v4)(CFTypeRef);
  BOOL v5;
  objc_super v7;
  _QWORD v8[3];
  CFStringRef (__cdecl *v9)(CFTypeRef);
  _BYTE v10[24];
  CFStringRef (__cdecl *v11)(CFTypeRef);
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  __CFDictionaryGetKeyCallbacks((uint64_t)self, (uint64_t)v10);
  v4 = v11;
  __CFDictionaryGetValueCallbacks((uint64_t)self, v8);
  if (v4)
    v5 = v4 == CFCopyDescription;
  else
    v5 = 1;
  if (!v5 || v9 && v9 != CFCopyDescription)
    return (id)(id)CFCopyDescription(self);
  v7.receiver = self;
  v7.super_class = (Class)__NSCFDictionary;
  return -[NSDictionary description](&v7, sel_description);
}

- (id)keyEnumerator
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  return (id)objc_msgSend(objc_allocWithZone((Class)__NSFastEnumerationEnumerator), "initWithObject:", self);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)setObservationInfo:(void *)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _CFDictionarySetKVOBit((uint64_t)self, a3 != 0);
  v5.receiver = self;
  v5.super_class = (Class)__NSCFDictionary;
  -[__NSCFDictionary setObservationInfo:](&v5, sel_setObservationInfo_, a3);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  if (_CFExecutableLinkedOnOrAfter(6uLL))
  {
    v7.receiver = self;
    v7.super_class = (Class)__NSCFDictionary;
    return -[NSDictionary isEqual:](&v7, sel_isEqual_, a3);
  }
  else
  {
    return a3 && _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
  }
}

- (void)removeAllObjects
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_5(v2, CFSTR("%@: mutating method sent to immutable object"));
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (void)setObject:(objc_class *)a1 forKey:(const char *)a2 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_5(v2, CFSTR("%@: mutating method sent to immutable object"));
}

- (void)removeObjectForKey:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_5(v2, CFSTR("%@: mutating method sent to immutable object"));
}

@end
