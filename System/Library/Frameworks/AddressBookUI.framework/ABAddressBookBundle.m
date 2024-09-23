@implementation ABAddressBookBundle

id __ABAddressBookBundle_block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AddressBook"));
  ABAddressBookBundle___bundle = (uint64_t)result;
  return result;
}

@end
