@implementation IOAccessoryServiceMatchingCallbackTypeC

uint64_t __IOAccessoryServiceMatchingCallbackTypeC_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performTypeCMeasurement");
}

@end
