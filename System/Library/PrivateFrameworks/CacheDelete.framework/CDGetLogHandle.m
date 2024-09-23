@implementation CDGetLogHandle

void __CDGetLogHandle_block_invoke(uint64_t a1)
{
  os_log_t v2;
  void *v3;

  v2 = os_log_create("com.apple.cache_delete", *(const char **)(a1 + 32));
  v3 = (void *)qword_1ECE24268;
  qword_1ECE24268 = (uint64_t)v2;

  qword_1ECE24270 = *(_QWORD *)(a1 + 32);
}

@end
