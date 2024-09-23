@implementation _NSNoChangeToken

+ (void)initialize
{
  id v3;
  objc_super v4;

  objc_opt_self();
  if (!_NSNoChangeSingleton)
  {
    v3 = NSAllocateObject((Class)a1, 0, 0);
    _NSNoChangeSingleton = (uint64_t)v3;
    if (v3)
    {
      v4.receiver = v3;
      v4.super_class = (Class)_NSNoChangeToken;
      objc_msgSendSuper2(&v4, sel_init);
    }
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)_NSNoChangeSingleton;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (id)description
{
  return CFSTR("~~[[NO CHANGE]]~~");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSNoChangeToken)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NSNoChangeToken;
  return -[_NSNoChangeToken init](&v4, sel_init, a3);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;

  v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (unint64_t)hash
{
  return _NSNoChangeSingleton;
}

@end
