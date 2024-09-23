@implementation ICCFTypeWrapper

- (ICCFTypeWrapper)initWithCFTypeRef:(void *)a3
{
  ICCFTypeWrapper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICCFTypeWrapper;
  v4 = -[ICCFTypeWrapper init](&v6, sel_init);
  if (v4)
    v4->_cfTypeRef = (void *)CFRetain(a3);
  return v4;
}

- (void)dealloc
{
  void *cfTypeRef;
  objc_super v4;

  cfTypeRef = self->_cfTypeRef;
  if (cfTypeRef)
    CFRelease(cfTypeRef);
  v4.receiver = self;
  v4.super_class = (Class)ICCFTypeWrapper;
  -[ICCFTypeWrapper dealloc](&v4, sel_dealloc);
}

- (void)ref
{
  return self->_cfTypeRef;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && CFEqual(self->_cfTypeRef, (CFTypeRef)objc_msgSend(v4, "cfTypeRef")) != 0;

  return v5;
}

- (unint64_t)hash
{
  return CFHash(self->_cfTypeRef);
}

- (void)cfTypeRef
{
  return self->_cfTypeRef;
}

- (void)setCfTypeRef:(void *)a3
{
  self->_cfTypeRef = a3;
}

@end
