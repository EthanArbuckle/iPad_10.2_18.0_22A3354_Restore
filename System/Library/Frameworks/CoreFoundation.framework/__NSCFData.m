@implementation __NSCFData

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((__CFDataMtbl((uint64_t)self) & 1) == 0 && _CFExecutableLinkedOnOrAfter(6uLL))
    return _CFNonObjCRetain((unint64_t *)self);
  v6.receiver = self;
  v6.super_class = (Class)__NSCFData;
  return -[__NSCFData copyWithZone:](&v6, sel_copyWithZone_, a3);
}

- (Class)classForCoder
{
  __CFDataMtbl((uint64_t)self);
  return (Class)objc_opt_self();
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (self == a3)
    return 1;
  return _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
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

- (void)setLength:(unint64_t)a3
{
  CFDataSetLength((CFMutableDataRef)self, a3);
}

@end
