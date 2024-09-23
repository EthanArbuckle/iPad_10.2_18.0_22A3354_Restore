@implementation SCNetworkCategoryManagerSetNotifyHandler

void *__SCNetworkCategoryManagerSetNotifyHandler_block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  const void *v5;
  void *result;

  v2 = a1[5];
  if (v2)
    dispatch_retain(v2);
  v3 = a1[6];
  v4 = *(NSObject **)(v3 + 72);
  if (v4)
  {
    dispatch_release(v4);
    v3 = a1[6];
  }
  *(_QWORD *)(v3 + 72) = a1[5];
  v5 = *(const void **)(a1[6] + 64);
  if (v5)
    _Block_release(v5);
  result = (void *)a1[4];
  if (result)
  {
    result = _Block_copy(result);
    *(_QWORD *)(a1[6] + 64) = result;
  }
  return result;
}

@end
