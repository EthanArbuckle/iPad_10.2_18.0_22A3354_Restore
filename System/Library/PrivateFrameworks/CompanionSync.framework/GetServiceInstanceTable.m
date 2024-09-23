@implementation GetServiceInstanceTable

void __GetServiceInstanceTable_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 6);
  v1 = (void *)GetServiceInstanceTable___table;
  GetServiceInstanceTable___table = v0;

}

@end
