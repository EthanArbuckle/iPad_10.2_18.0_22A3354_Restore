@implementation FigMetalAllocatorMetadata

- (FigMetalAllocatorMetadata)initWithFigMetalAllocator:(id)a3
{
  id v5;
  FigMetalAllocatorMetadata *v6;
  FigMetalAllocatorMetadata *v7;
  FigMetalAllocatorMetadata *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FigMetalAllocatorMetadata;
  v6 = -[FigMetalAllocatorMetadata init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      FigSignalErrorAt();
      v8 = 0;
      goto LABEL_5;
    }
    objc_storeStrong((id *)&v6->_allocator, a3);
    v7->_refCount = 1;
    v7->_size = 0;
    v7->_type = 0;
  }
  v8 = v7;
LABEL_5:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocator, 0);
}

@end
