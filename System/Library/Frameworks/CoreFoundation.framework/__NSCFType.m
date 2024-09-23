@implementation __NSCFType

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (a3 == self)
    return 1;
  return _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
}

- (id)description
{
  return (id)(id)CFCopyDescription(self);
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (void)dealloc
{
  CFTypeID v3;
  void (*v4)(__NSCFType *);
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFGetTypeID(self);
  if (v3 == 2)
  {
    __CFAllocatorDeallocate(self);
  }
  else
  {
    v4 = *(void (**)(__NSCFType *))(_CFRuntimeGetClassWithTypeID(v3) + 32);
    if (v4)
      v4(self);
  }
  v5.receiver = self;
  v5.super_class = (Class)__NSCFType;
  -[__NSCFType dealloc](&v5, sel_dealloc);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
