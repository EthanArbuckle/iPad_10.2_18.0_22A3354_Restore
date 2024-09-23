@implementation CASlotProxy

- (Object)CA_copyRenderValue
{
  Object *result;
  Atomic *p_var1;
  unsigned int v4;
  unsigned int v5;

  result = (Object *)self->_proxy;
  if (result)
  {
    p_var1 = &result->var1;
    do
      v4 = __ldaxr((unsigned int *)p_var1);
    while (__stlxr(v4 + 1, (unsigned int *)p_var1));
    if (!v4)
    {
      result = 0;
      do
        v5 = __ldaxr((unsigned int *)p_var1);
      while (__stlxr(v5 - 1, (unsigned int *)p_var1));
    }
  }
  return result;
}

- (CASlotProxy)initWithName:(unsigned int)a3
{
  CASlotProxy *v4;
  malloc_zone_t *malloc_zone;
  _DWORD *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CASlotProxy;
  v4 = -[CASlotProxy init](&v8, sel_init);
  if (v4)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v6 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x18uLL, 0x743898A5uLL);
    if (v6)
    {
      v6[2] = 1;
      v6[3] = 43;
      ++dword_1ECDC7CD4;
      *(_QWORD *)v6 = off_1E1598A58;
      *((_QWORD *)v6 + 2) = a3;
      v4->_proxy = v6;
    }
    else
    {
      v4->_proxy = 0;

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  unsigned int *proxy;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  proxy = (unsigned int *)self->_proxy;
  if (proxy)
  {
    v4 = proxy + 2;
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
      (*(void (**)(unsigned int *, SEL))(*(_QWORD *)proxy + 16))(proxy, a2);
  }
  v7.receiver = self;
  v7.super_class = (Class)CASlotProxy;
  -[CASlotProxy dealloc](&v7, sel_dealloc);
}

@end
