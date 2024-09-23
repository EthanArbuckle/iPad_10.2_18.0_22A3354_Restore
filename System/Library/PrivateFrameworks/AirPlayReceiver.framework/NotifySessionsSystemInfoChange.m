@implementation NotifySessionsSystemInfoChange

void ___NotifySessionsSystemInfoChange_block_invoke(uint64_t a1, uint64_t a2)
{
  APReceiverRequestProcessorSendSystemInfoUpdate(a2, *(const __CFDictionary **)(a1 + 32));
}

@end
