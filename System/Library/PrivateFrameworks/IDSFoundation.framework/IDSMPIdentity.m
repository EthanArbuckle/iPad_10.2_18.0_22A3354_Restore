@implementation IDSMPIdentity

- (IDSMPIdentity)initWithBackingValue:(void *)a3
{
  IDSMPIdentity *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IDSMPIdentity;
  v4 = -[IDSMPIdentity init](&v6, sel_init);
  if (v4)
    v4->_backingValue = (void *)CFRetain(a3);
  return v4;
}

- (void)dealloc
{
  void *backingValue;
  objc_super v4;

  backingValue = self->_backingValue;
  if (backingValue)
    CFRelease(backingValue);
  v4.receiver = self;
  v4.super_class = (Class)IDSMPIdentity;
  -[IDSMPIdentity dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v8 = objc_msgSend_backingValue(self, v5, v6, v7);
  return (id)objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@ %p backingValue: %@>"), v10, v4, self, v8);
}

- (void)backingValue
{
  return self->_backingValue;
}

@end
