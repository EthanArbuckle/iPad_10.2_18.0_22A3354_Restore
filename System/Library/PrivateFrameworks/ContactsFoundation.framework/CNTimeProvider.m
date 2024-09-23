@implementation CNTimeProvider

- (double)timestamp
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

+ (CNTimeProvider)defaultProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CNTimeProvider_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultProvider_cn_once_token_0 != -1)
    dispatch_once(&defaultProvider_cn_once_token_0, block);
  return (CNTimeProvider *)(id)defaultProvider_cn_once_object_0;
}

void __33__CNTimeProvider_defaultProvider__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultProvider_cn_once_object_0;
  defaultProvider_cn_once_object_0 = (uint64_t)v1;

}

@end
