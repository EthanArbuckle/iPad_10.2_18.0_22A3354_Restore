@implementation HKCVKernelCache

- (uint64_t)kernelWithIdentifier:(void *)a3 fromLibrary:(uint64_t)a4 archive:
{
  void *v8;
  uint64_t v9;
  id v10;

  if (!a1)
    return 0;
  v8 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", a2);
  if (v8)
  {
    v9 = (uint64_t)v8;
    v10 = v8;
  }
  else
  {
    v9 = NewComputePipelineState(a3, a4);
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v9, a2);
  }
  return v9;
}

- (HKCVKernelCache)init
{
  HKCVKernelCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKCVKernelCache;
  v2 = -[HKCVKernelCache init](&v4, sel_init);
  if (v2)
    v2->_cache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKCVKernelCache;
  -[HKCVKernelCache dealloc](&v3, sel_dealloc);
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

@end
