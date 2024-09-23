@implementation NEIPSecDBRemoveSAIDFromSAs

void __NEIPSecDBRemoveSAIDFromSAs_block_invoke(uint64_t a1)
{
  NERemoveValueFromIntKeyedDictionary(*(__CFDictionary **)(*(_QWORD *)(a1 + 32) + 80), *(_DWORD *)(a1 + 40));
}

@end
