@implementation ACAccountStore

id __58__ACAccountStore_SyncPrivate___mailAccountTypeIdentifiers__block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDB4088], *MEMORY[0x24BDB40F8], *MEMORY[0x24BDB4068], *MEMORY[0x24BDB4160], *MEMORY[0x24BDB4118], *MEMORY[0x24BDB3FD8], 0);
  _mailAccountTypeIdentifiers_mailAccountTypes = (uint64_t)result;
  return result;
}

@end
