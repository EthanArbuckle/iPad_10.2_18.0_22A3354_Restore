@implementation __NSCFLocale

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (self == a3)
    return 1;
  return _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
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

- (id)objectForKey:(id)a3
{
  return (id)CFLocaleGetValue((CFLocaleRef)self, (CFLocaleKey)a3);
}

- (id)displayNameForKey:(id)a3 value:(id)a4
{
  return (id)(id)CFLocaleCopyDisplayNameForPropertyValue((CFLocaleRef)self, (CFLocaleKey)a3, (CFStringRef)a4);
}

- (__NSCFLocale)initWithLocaleIdentifier:(id)a3
{
  return (__NSCFLocale *)CFLocaleCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (CFLocaleIdentifier)a3);
}

@end
