@implementation NTNewsEdgeTagEncodedFields

void __NTNewsEdgeTagEncodedFields_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = *MEMORY[0x24BE6C6E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)NTNewsEdgeTagEncodedFields_result;
  NTNewsEdgeTagEncodedFields_result = v2;

}

@end
