@implementation NTNewsEdgeArticleEncodedFields

void __NTNewsEdgeArticleEncodedFields_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BE6C6C0];
  v6[0] = *MEMORY[0x24BE6C690];
  v6[1] = v1;
  v2 = *MEMORY[0x24BE6C680];
  v6[2] = *MEMORY[0x24BE6C688];
  v6[3] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)NTNewsEdgeArticleEncodedFields_result;
  NTNewsEdgeArticleEncodedFields_result = v4;

}

@end
