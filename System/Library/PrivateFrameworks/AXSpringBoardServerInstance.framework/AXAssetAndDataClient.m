@implementation AXAssetAndDataClient

void __AXAssetAndDataClient_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = objc_alloc(MEMORY[0x24BDFF8F0]);
  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", getpid());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("AXAssetClient-springBoard-client-%@"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "initWithIdentifier:serviceBundleName:", v2, CFSTR("AXAssetAndDataServer"));
  v4 = (void *)AXAssetAndDataClient_Client;
  AXAssetAndDataClient_Client = v3;

}

@end
