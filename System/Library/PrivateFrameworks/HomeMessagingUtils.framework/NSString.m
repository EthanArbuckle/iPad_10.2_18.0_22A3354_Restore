@implementation NSString

void __37__NSString_HMUAdditions__hmu_isEmail__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR(".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hmu_isEmail_emailPredicate;
  hmu_isEmail_emailPredicate = v0;

}

@end
