@implementation NSString

void __55__NSString_MCUtilities__MCSHA256DigestWithPasscodeSalt__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &_block_invoke_saltBytes, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MCSHA256DigestWithPasscodeSalt_salt;
  MCSHA256DigestWithPasscodeSalt_salt = v0;

}

@end
