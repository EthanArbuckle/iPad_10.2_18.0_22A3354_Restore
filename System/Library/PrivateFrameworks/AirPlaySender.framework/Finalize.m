@implementation Finalize

void __manager_Finalize_block_invoke(uint64_t a1)
{
  CFSetRemoveValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
}

void __spmanager_Finalize_block_invoke(uint64_t a1)
{
  CFSetRemoveValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
}

void __carEndpoint_Finalize_block_invoke(uint64_t a1)
{
  CFSetRemoveValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
}

void __spendpoint_Finalize_block_invoke(uint64_t a1)
{
  CFSetRemoveValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
}

void __endpoint_Finalize_block_invoke(uint64_t a1)
{
  CFSetRemoveValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
}

@end
