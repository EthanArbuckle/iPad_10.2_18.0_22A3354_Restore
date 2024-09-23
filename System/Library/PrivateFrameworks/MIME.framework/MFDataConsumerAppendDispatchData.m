@implementation MFDataConsumerAppendDispatchData

uint64_t __MFDataConsumerAppendDispatchData_block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendData:", a2);
  return 1;
}

@end
