@implementation NEIPSecDBRemovePolicyIDFromSAs

void __NEIPSecDBRemovePolicyIDFromSAs_block_invoke(uint64_t a1)
{
  NERemoveValueFromIntKeyedDictionary(*(__CFDictionary **)(*(_QWORD *)(a1 + 32) + 88), *(_DWORD *)(a1 + 40));
}

@end
