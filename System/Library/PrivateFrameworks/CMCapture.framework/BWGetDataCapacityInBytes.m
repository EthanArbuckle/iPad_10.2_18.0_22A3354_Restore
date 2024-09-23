@implementation BWGetDataCapacityInBytes

void __BWGetDataCapacityInBytes_block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  BWGetDataCapacityInBytes_sDataCapacityInBytes = objc_msgSend((id)objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x1E0DE2CB8]), "longLongValue");

}

@end
