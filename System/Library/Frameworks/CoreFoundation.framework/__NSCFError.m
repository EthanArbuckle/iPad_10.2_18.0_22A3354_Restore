@implementation __NSCFError

- (id)copyWithZone:(_NSZone *)a3
{
  return -[objc_class initWithDomain:code:userInfo:](-[objc_class allocWithZone:](objc_lookUpClass("NSError"), "allocWithZone:", a3), "initWithDomain:code:userInfo:", -[__NSCFError domain](self, "domain"), -[__NSCFError code](self, "code"), -[__NSCFError userInfo](self, "userInfo"));
}

- (id)userInfo
{
  return CFErrorCopyUserInfo((CFErrorRef)self);
}

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

- (__NSCFError)initWithCoder:(id)a3
{

  return (__NSCFError *)objc_msgSend(objc_alloc(objc_lookUpClass("NSError")), "initWithCoder:", a3);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (Class)classForCoder
{
  return objc_lookUpClass("NSError");
}

@end
