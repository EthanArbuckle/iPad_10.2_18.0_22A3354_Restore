@implementation NSPlaceholderValue

- (NSPlaceholderValue)initWithCoder:(id)a3
{
  return (NSPlaceholderValue *)newDecodedValue(a3, self->zoneForInstance);
}

- (NSPlaceholderValue)initWithBytes:(const void *)a3 objCType:(const char *)a4
{
  return (NSPlaceholderValue *)_NSNewValue((float64x2_t *)a3, (char *)a4, self->zoneForInstance);
}

- (unint64_t)retainCount
{
  return -1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (NSPlaceholderValue)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (const)objCType
{
  uint64_t v4;
  uint64_t v5;
  __objc2_class **v6;

  NSLog((NSString *)CFSTR("Did you forget to nest alloc and init?"));
  v4 = objc_opt_class();
  v5 = objc_opt_self();
  v6 = __SCR_NSValue;
  if (v4 == v5)
    v6 = __SCR_NSNumber;
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)*v6);
}

- (void)getValue:(void *)a3
{
  uint64_t v5;
  uint64_t v6;
  __objc2_class **v7;

  NSLog((NSString *)CFSTR("Did you forget to nest alloc and init?"), a2, a3);
  v5 = objc_opt_class();
  v6 = objc_opt_self();
  v7 = __SCR_NSValue;
  if (v5 == v6)
    v7 = __SCR_NSNumber;
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)*v7);
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  __objc2_class **v8;

  NSLog((NSString *)CFSTR("Did you forget to nest alloc and init?"), a2, a3, a4);
  v6 = objc_opt_class();
  v7 = objc_opt_self();
  v8 = __SCR_NSValue;
  if (v6 == v7)
    v8 = __SCR_NSNumber;
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)*v8);
}

@end
