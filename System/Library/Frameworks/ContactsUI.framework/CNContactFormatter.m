@implementation CNContactFormatter

void __58__CNContactFormatter_UIAdditions__sharedFullNameFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend(v0, "setStyle:", 0);
  v1 = (void *)sharedFullNameFormatter_cn_once_object_2;
  sharedFullNameFormatter_cn_once_object_2 = (uint64_t)v0;

}

void __71__CNContactFormatter_UIAdditions__sharedFullNameFormatterWithFallBacks__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend(v0, "setStyle:", 0);
  objc_msgSend(v0, "setFallbackStyle:", -1);
  v1 = (void *)sharedFullNameFormatterWithFallBacks_cn_once_object_1;
  sharedFullNameFormatterWithFallBacks_cn_once_object_1 = (uint64_t)v0;

}

@end
