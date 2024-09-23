@implementation V8CNRKernels

+ (id)kernelWithName:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  objc_msgSend_sharedKernels(RAWKernels, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_group_(v8, v9, (uint64_t)v3, (uint64_t)CFSTR("V8CNR"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
