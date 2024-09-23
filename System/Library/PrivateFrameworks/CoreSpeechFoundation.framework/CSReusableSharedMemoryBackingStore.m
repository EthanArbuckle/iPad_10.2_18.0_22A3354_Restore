@implementation CSReusableSharedMemoryBackingStore

- (CSReusableSharedMemoryBackingStore)initWithBuffer:(void *)a3 bufferSize:(unint64_t)a4 deallocator:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSReusableSharedMemoryBackingStore;
  return -[CSReusableBufferBackingStore initWithBuffer:bufferSize:deallocator:](&v6, sel_initWithBuffer_bufferSize_deallocator_, a3, a4, a5);
}

@end
