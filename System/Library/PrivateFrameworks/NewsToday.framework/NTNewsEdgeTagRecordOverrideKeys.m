@implementation NTNewsEdgeTagRecordOverrideKeys

void __NTNewsEdgeTagRecordOverrideKeys_block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("publisherPaidDescriptionStrings");
  v3[0] = *MEMORY[0x24BE6C6E8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTNewsEdgeTagRecordOverrideKeys_result;
  NTNewsEdgeTagRecordOverrideKeys_result = v0;

}

@end
