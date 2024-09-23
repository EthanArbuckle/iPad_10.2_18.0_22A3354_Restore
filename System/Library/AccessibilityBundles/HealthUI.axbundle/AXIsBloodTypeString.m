@implementation AXIsBloodTypeString

void __AXIsBloodTypeString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_25022F7F8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXIsBloodTypeString_BloodTypes;
  AXIsBloodTypeString_BloodTypes = v0;

}

@end
