@implementation NSNumber

void __33__NSNumber__DKDeduping__dk_dedup__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dk_dedup_set_4;
  dk_dedup_set_4 = v0;

  dk_dedup_lock_5 = 0;
}

@end
