@implementation _NSJSONRoundTrippingNumber

- (_NSJSONRoundTrippingNumber)initWithNumber:(id)a3 representation:(id)a4
{
  _NSJSONRoundTrippingNumber *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_NSJSONRoundTrippingNumber;
  v6 = -[_NSJSONRoundTrippingNumber init](&v8, sel_init);
  if (v6)
  {
    v6->_number = (NSNumber *)a3;
    v6->_representation = (NSString *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSJSONRoundTrippingNumber;
  -[_NSJSONRoundTrippingNumber dealloc](&v3, sel_dealloc);
}

- (id)stringValue
{
  return (id)-[NSString copy](self->_representation, "copy");
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3)
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v5 = objc_msgSend(a3, "isNSNumber");
      if (v5)
        LOBYTE(v5) = -[_NSJSONRoundTrippingNumber isEqualToNumber:](self, "isEqualToNumber:", a3);
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isEqualToNumber:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3 && object_getClass(a3) == (Class)_NSJSONRoundTrippingNumber)
    return -[NSString isEqualToString:](self->_representation, "isEqualToString:", *((_QWORD *)a3 + 2));
  return 0;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_representation, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (_NSJSONRoundTrippingNumber)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  const __CFString **v10;
  const __CFString **v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("_NSJSONRoundTrippingNumber can only be decoded by NSXPCCoder."), 0));
  }
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.number"));
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.representation"));
    if (v7)
      return -[_NSJSONRoundTrippingNumber initWithNumber:representation:](self, "initWithNumber:representation:", v6, v7);

    v12 = CFSTR("NSDebugDescription");
    v13 = CFSTR("Unable to decode underlying string representation for round-tripping number.");
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = &v13;
    v11 = &v12;
  }
  else
  {

    v14 = CFSTR("NSDebugDescription");
    v15[0] = CFSTR("Unable to decode underlying NSNumber instance for round-tripping number.");
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = (const __CFString **)v15;
    v11 = &v14;
  }
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1)));
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("_NSJSONRoundTrippingNumber can only be encoded by NSXPCCoder."), 0));
  objc_msgSend(a3, "encodeObject:forKey:", self->_number, CFSTR("NS.number"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_representation, CFSTR("NS.representation"));
}

- (Class)superclass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isSubclassOfClass:(Class)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSNumber == (__objc2_class *)a3)
    return 1;
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____NSJSONRoundTrippingNumber;
  return objc_msgSendSuper2(&v4, sel_isSubclassOfClass_);
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSNumber == (__objc2_class *)a3)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)_NSJSONRoundTrippingNumber;
  return -[_NSJSONRoundTrippingNumber isKindOfClass:](&v4, sel_isKindOfClass_);
}

- (BOOL)isNSNumber__
{
  return 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  return sel_initWithNumber_representation_ == a3
      || sel_dealloc == a3
      || sel_stringValue == a3
      || sel_initWithCoder_ == a3
      || sel_encodeWithCoder_ == a3
      || sel__allowsDirectEncoding == a3
      || sel_isEqual_ == a3
      || sel_isEqualToNumber_ == a3
      || sel_hash == a3;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3);
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  return (id)+[NSNumber instanceMethodSignatureForSelector:](NSNumber, "instanceMethodSignatureForSelector:", a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[NSNumber methodSignatureForSelector:](self->_number, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "invokeWithTarget:", self->_number);
}

@end
