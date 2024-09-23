@implementation NTNewsEdgeArticleListRecordOverrideKeys

void __NTNewsEdgeArticleListRecordOverrideKeys_block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("articleIds");
  v3[0] = *MEMORY[0x24BE6C698];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTNewsEdgeArticleListRecordOverrideKeys_result;
  NTNewsEdgeArticleListRecordOverrideKeys_result = v0;

}

@end
