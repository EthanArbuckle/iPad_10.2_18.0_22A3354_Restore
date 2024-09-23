@implementation MPCFWrapper

- (void)refValue
{
  return self->_refValue;
}

- (MPCFWrapper)initWithCFType:(void *)a3
{
  MPCFWrapper *v3;
  MPCFWrapper *v4;
  objc_super v6;

  v3 = (MPCFWrapper *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)MPCFWrapper;
    v4 = -[MPCFWrapper init](&v6, sel_init);
    if (v4)
    {
      CFRetain(v3);
      v4->_refValue = v3;
    }
    self = v4;
    v3 = self;
  }
  else
  {
    self->_nullRef = 1;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_nullRef)
    CFRelease(self->_refValue);
  v3.receiver = self;
  v3.super_class = (Class)MPCFWrapper;
  -[MPCFWrapper dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_refValue);
}

- (BOOL)isNullRef
{
  return self->_nullRef;
}

- (void)setNullRef:(BOOL)a3
{
  self->_nullRef = a3;
}

@end
