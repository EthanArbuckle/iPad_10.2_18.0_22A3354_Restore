@implementation NPKExpressConfigurationFromInformation

id __NPKExpressConfigurationFromInformation_block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BE6EAE8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:", v3, 1, 0);

  return v4;
}

@end
