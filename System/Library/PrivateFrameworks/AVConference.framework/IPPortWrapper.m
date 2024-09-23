@implementation IPPortWrapper

- (IPPortWrapper)init
{
  IPPortWrapper *v2;
  tagIPPORT *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)IPPortWrapper;
  v2 = -[IPPortWrapper init](&v5, sel_init);
  if (v2)
  {
    v3 = (tagIPPORT *)malloc_type_calloc(1uLL, 0x28uLL, 0x100004053E81896uLL);
    v2->_ipport = v3;
    if (!v3)
      return 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  free(self->_ipport);
  v3.receiver = self;
  v3.super_class = (Class)IPPortWrapper;
  -[IPPortWrapper dealloc](&v3, sel_dealloc);
}

- (tagIPPORT)ipport
{
  return self->_ipport;
}

- (void)setIpport:(tagIPPORT *)a3
{
  self->_ipport = a3;
}

@end
