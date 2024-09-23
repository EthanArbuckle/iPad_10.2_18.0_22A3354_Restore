@implementation NSMutableCharacterSet

- (NSMutableCharacterSet)init
{
  NSMutableCharacterSet *Mutable;

  if (!init___NSMutableCharacterSetClass)
    init___NSMutableCharacterSetClass = objc_opt_class();
  if (!-[NSMutableCharacterSet isMemberOfClass:](self, "isMemberOfClass:"))
    return self;
  Mutable = (NSMutableCharacterSet *)CFCharacterSetCreateMutable(0);

  return Mutable;
}

+ (NSMutableCharacterSet)decimalDigitCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)alphanumericCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet alphanumericCharacterSet](NSCharacterSet, "alphanumericCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)whitespaceCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)characterSetWithRange:(NSRange)aRange
{
  CFIndex length;
  CFIndex location;
  __CFCharacterSet *Mutable;
  CFRange v7;

  length = aRange.length;
  location = aRange.location;
  Mutable = CFCharacterSetCreateMutable(0);
  v7.location = location;
  v7.length = length;
  CFCharacterSetAddCharactersInRange(Mutable, v7);
  return (NSMutableCharacterSet *)Mutable;
}

+ (NSMutableCharacterSet)whitespaceAndNewlineCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)characterSetWithCharactersInString:(NSString *)aString
{
  __CFCharacterSet *Mutable;

  Mutable = CFCharacterSetCreateMutable(0);
  CFCharacterSetAddCharactersInString(Mutable, (CFStringRef)aString);
  return (NSMutableCharacterSet *)Mutable;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3;

  v3 = -[NSMutableCharacterSet mutableCopyWithZone:](self, "mutableCopyWithZone:", a3);
  objc_msgSend(v3, "makeImmutable");
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  const char *Name;

  v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)CFSTR("Abstract class %@ does not implement method %s; it must be implemented in subclasses."),
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)addCharactersInRange:(NSRange)aRange
{
  uint64_t v5;
  const char *Name;

  v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)CFSTR("Abstract class %@ does not implement method %s; it must be implemented in subclasses."),
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)removeCharactersInRange:(NSRange)aRange
{
  uint64_t v5;
  const char *Name;

  v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)CFSTR("Abstract class %@ does not implement method %s; it must be implemented in subclasses."),
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)addCharactersInString:(NSString *)aString
{
  uint64_t v5;
  const char *Name;

  v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)CFSTR("Abstract class %@ does not implement method %s; it must be implemented in subclasses."),
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)removeCharactersInString:(NSString *)aString
{
  uint64_t v5;
  const char *Name;

  v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)CFSTR("Abstract class %@ does not implement method %s; it must be implemented in subclasses."),
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)formUnionWithCharacterSet:(NSCharacterSet *)otherSet
{
  uint64_t v5;
  const char *Name;

  v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)CFSTR("Abstract class %@ does not implement method %s; it must be implemented in subclasses."),
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)formIntersectionWithCharacterSet:(NSCharacterSet *)otherSet
{
  uint64_t v5;
  const char *Name;

  v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)CFSTR("Abstract class %@ does not implement method %s; it must be implemented in subclasses."),
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)invert
{
  uint64_t v4;
  const char *Name;

  v4 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)CFSTR("Abstract class %@ does not implement method %s; it must be implemented in subclasses."),
    v4,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)isMutable
{
  return 1;
}

+ (NSMutableCharacterSet)controlCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet controlCharacterSet](NSCharacterSet, "controlCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)letterCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)lowercaseLetterCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet lowercaseLetterCharacterSet](NSCharacterSet, "lowercaseLetterCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)uppercaseLetterCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet uppercaseLetterCharacterSet](NSCharacterSet, "uppercaseLetterCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)nonBaseCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet nonBaseCharacterSet](NSCharacterSet, "nonBaseCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)decomposableCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet decomposableCharacterSet](NSCharacterSet, "decomposableCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)illegalCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet illegalCharacterSet](NSCharacterSet, "illegalCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)punctuationCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet punctuationCharacterSet](NSCharacterSet, "punctuationCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)capitalizedLetterCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet capitalizedLetterCharacterSet](NSCharacterSet, "capitalizedLetterCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)symbolCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet symbolCharacterSet](NSCharacterSet, "symbolCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)newlineCharacterSet
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)characterSetWithBitmapRepresentation:(NSData *)data
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet characterSetWithBitmapRepresentation:](NSCharacterSet, "characterSetWithBitmapRepresentation:", data), "mutableCopyWithZone:", 0);
}

+ (NSMutableCharacterSet)characterSetWithContentsOfFile:(NSString *)fName
{
  return (NSMutableCharacterSet *)-[NSCharacterSet mutableCopyWithZone:](+[NSCharacterSet characterSetWithContentsOfFile:](NSCharacterSet, "characterSetWithContentsOfFile:", fName), "mutableCopyWithZone:", 0);
}

- (NSMutableCharacterSet)initWithCoder:(id)a3
{
  NSMutableCharacterSet *v4;
  NSMutableCharacterSet *v5;
  NSString *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSMutableCharacterSet;
  v4 = -[NSCharacterSet initWithCoder:](&v8, sel_initWithCoder_);
  v5 = -[NSMutableCharacterSet mutableCopyWithZone:](v4, "mutableCopyWithZone:", 0);
  if (v5)
  {

  }
  else
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to create mutable copy of the character set %p!"), v4);

    v9 = CFSTR("NSLocalizedDescription");
    v10[0] = v6;
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
