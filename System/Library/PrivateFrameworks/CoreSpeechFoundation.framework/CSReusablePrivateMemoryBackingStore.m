@implementation CSReusablePrivateMemoryBackingStore

- (CSReusablePrivateMemoryBackingStore)initWithBufferSize:(unint64_t)a3
{
  objc_super v6;
  _QWORD v7[4];
  void *v8;

  v7[1] = 3221225472;
  v7[2] = __58__CSReusablePrivateMemoryBackingStore_initWithBufferSize___block_invoke;
  v7[3] = &__block_descriptor_40_e5_v8__0l;
  v8 = malloc_type_malloc(a3, 0xC5F8452CuLL);
  v6.receiver = self;
  v6.super_class = (Class)CSReusablePrivateMemoryBackingStore;
  v7[0] = MEMORY[0x1E0C809B0];
  return -[CSReusableBufferBackingStore initWithBuffer:bufferSize:deallocator:](&v6, sel_initWithBuffer_bufferSize_deallocator_, v8, a3, v7);
}

void __58__CSReusablePrivateMemoryBackingStore_initWithBufferSize___block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

@end
