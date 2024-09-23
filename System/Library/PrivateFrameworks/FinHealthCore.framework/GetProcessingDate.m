@implementation GetProcessingDate

void __GetProcessingDate_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)GetProcessingDate_processingDate;
  GetProcessingDate_processingDate = v0;

}

@end
