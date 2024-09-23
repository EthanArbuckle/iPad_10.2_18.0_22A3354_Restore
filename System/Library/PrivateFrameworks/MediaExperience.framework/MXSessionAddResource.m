@implementation MXSessionAddResource

uint64_t __MXSessionAddResource_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "_addResource:resourceInfo:token:", a1[6], a1[7], a1[8]);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
