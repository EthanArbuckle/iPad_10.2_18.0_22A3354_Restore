@implementation AGXA10FamilyIndirectRenderCommandEncoder

- (AGXA10FamilyIndirectRenderCommandEncoder)initWithBuffer:(id)a3
{
  AGXA10FamilyIndirectRenderCommandEncoder *v4;
  _QWORD *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AGXA10FamilyIndirectRenderCommandEncoder;
  v4 = -[AGXA10FamilyIndirectRenderCommandEncoder init](&v8, sel_init);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AGXA10FamilyIndirectRenderCommandEncoder dealloc](v4, "dealloc");
      return 0;
    }
    else
    {
      v5 = (_QWORD *)operator new();
      v6 = *((_QWORD *)a3 + 48);
      *v5 = *((_QWORD *)a3 + 47);
      v5[1] = v6;
      v4->_impl = v5;
    }
  }
  return v4;
}

- (void)dealloc
{
  void *impl;
  objc_super v4;

  impl = self->_impl;
  if (impl)
    MEMORY[0x234927ECC](impl, 0xA0C40BD48D6D6);
  v4.receiver = self;
  v4.super_class = (Class)AGXA10FamilyIndirectRenderCommandEncoder;
  -[AGXA10FamilyIndirectRenderCommandEncoder dealloc](&v4, sel_dealloc);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return -[AGXA10FamilyIndirectRenderCommand initWithEncoder:withIndex:]([AGXA10FamilyIndirectRenderCommand alloc], "initWithEncoder:withIndex:", self->_impl, a3);
}

@end
