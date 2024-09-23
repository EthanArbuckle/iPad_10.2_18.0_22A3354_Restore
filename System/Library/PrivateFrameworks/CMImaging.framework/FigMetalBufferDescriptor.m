@implementation FigMetalBufferDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setAllocationHint:(int)a3
{
  self->_allocationHint = a3;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (int)allocationHint
{
  return self->_allocationHint;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (FigMetalBufferDescriptor)init
{
  FigMetalBufferDescriptor *v2;
  FigMetalBufferDescriptor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigMetalBufferDescriptor;
  v2 = -[FigMetalBufferDescriptor init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_length = 0;
    if (getDefaultStorageMode_once != -1)
      dispatch_once(&getDefaultStorageMode_once, &__block_literal_global_6);
    v3->_options = (16 * (getDefaultStorageMode_defaultStorageMode & 0xF)) | 0x200;
  }
  return v3;
}

- (FigMetalBufferDescriptor)initWithDescriptor:(id)a3 allocatorLabel:(id)a4
{
  id v5;
  FigMetalBufferDescriptor *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FigMetalBufferDescriptor;
  v6 = -[FigMetalBufferDescriptor init](&v8, sel_init);
  if (v6)
  {
    -[FigMetalBufferDescriptor setLength:](v6, "setLength:", objc_msgSend(v5, "length"));
    -[FigMetalBufferDescriptor setOptions:](v6, "setOptions:", objc_msgSend(v5, "options"));
    -[FigMetalBufferDescriptor setLabel:](v6, "setLabel:", 0);
  }

  return v6;
}

@end
