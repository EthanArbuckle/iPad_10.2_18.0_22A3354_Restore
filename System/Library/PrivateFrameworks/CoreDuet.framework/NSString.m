@implementation NSString

void __33__NSString__DKDeduping__dk_dedup__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dk_dedup_set;
  dk_dedup_set = v0;

  dk_dedup_lock = 0;
}

@end
