@implementation AGXA10FamilyBuffer

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5
{
  AGXA10FamilyTexture *v6;
  unint64_t *v7;
  unint64_t v8;

  v6 = -[AGXTexture initWithBuffer:desc:offset:bytesPerRow:]([AGXA10FamilyTexture alloc], "initWithBuffer:desc:offset:bytesPerRow:", self, a3, a4, a5);
  if (v6)
  {
    v7 = (unint64_t *)(-[IOGPUMetalResource device](self, "device") + 816);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 | 0x20000, v7));
  }
  return v6;
}

- (void)initResourceGroupUsage
{
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51650]) = 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AGXA10FamilyBuffer;
  -[AGXBuffer dealloc](&v2, sel_dealloc);
}

@end
