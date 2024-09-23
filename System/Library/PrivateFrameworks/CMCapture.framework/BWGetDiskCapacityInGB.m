@implementation BWGetDiskCapacityInGB

void __BWGetDiskCapacityInGB_block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  BWGetDiskCapacityInGB_sDiskCapacityInGB = (int)((double)objc_msgSend((id)objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x1E0DE2CC0]), "longLongValue")/ 1000000000.0);

}

@end
