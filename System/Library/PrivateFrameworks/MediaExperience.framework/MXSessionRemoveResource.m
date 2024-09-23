@implementation MXSessionRemoveResource

uint64_t __MXSessionRemoveResource_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "_removeResourceWithToken:", a1[6]);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
