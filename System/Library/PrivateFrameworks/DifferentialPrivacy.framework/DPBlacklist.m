@implementation DPBlacklist

void __26___DPBlacklist_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v1 = (void *)_allBlacklists;
  _allBlacklists = v0;

}

@end
