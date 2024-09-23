@implementation _CSStore2DataContainer

- (_CSStore2DataContainer)initWithBytesNoCopy:(Data *)a3 length:(unsigned int)a4
{
  _CSStore2DataContainer *result;
  unsigned int v7;
  unsigned int v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CSStore2DataContainer;
  result = -[_CSStore2DataContainer init](&v9, sel_init);
  if (result)
  {
    result->p = a3;
    v7 = *MEMORY[0x1E0C85AD8];
    v8 = a4 + *MEMORY[0x1E0C85AD8] - 1;
    if (v8 != v8 % *MEMORY[0x1E0C85AD8])
      v7 *= v8 / v7;
    result->pAllocatedLength = v7;
  }
  return result;
}

- (void)dealloc
{
  Data *p;
  objc_super v4;

  p = self->p;
  if (p)
    CSStore2::VM::Deallocate((CSStore2::VM *)p, (void *)self->pAllocatedLength);
  v4.receiver = self;
  v4.super_class = (Class)_CSStore2DataContainer;
  -[_CSStore2DataContainer dealloc](&v4, sel_dealloc);
}

- (_CSStore2DataContainer)init
{
  abort();
}

+ (id)new
{
  abort();
}

@end
