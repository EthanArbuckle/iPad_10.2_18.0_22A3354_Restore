@implementation NSString

void __34__NSString__OSDeduping___os_dedup__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14E0], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_os_dedup_set;
  _os_dedup_set = v0;

  _os_dedup_lock = 0;
}

void __34__NSString__OSDeduping___os_dedup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((unint64_t)objc_msgSend((id)_os_dedup_set, "countForObject:") <= 2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
