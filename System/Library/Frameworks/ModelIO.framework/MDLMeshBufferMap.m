@implementation MDLMeshBufferMap

- (void)dealloc
{
  void (**deallocator)(id, SEL);
  objc_super v4;

  deallocator = (void (**)(id, SEL))self->_deallocator;
  if (deallocator)
    deallocator[2](deallocator, a2);
  v4.receiver = self;
  v4.super_class = (Class)MDLMeshBufferMap;
  -[MDLMeshBufferMap dealloc](&v4, sel_dealloc);
}

- (void)bytes
{
  return self->_bytes;
}

- (MDLMeshBufferMap)initWithBytes:(void *)bytes deallocator:(void *)deallocator
{
  void *v6;
  MDLMeshBufferMap *v7;
  MDLMeshBufferMap *v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v6 = deallocator;
  v12.receiver = self;
  v12.super_class = (Class)MDLMeshBufferMap;
  v7 = -[MDLMeshBufferMap init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_bytes = bytes;
    v9 = MEMORY[0x1DF0D2748](v6);
    v10 = v8->_deallocator;
    v8->_deallocator = (id)v9;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocator, 0);
}

@end
