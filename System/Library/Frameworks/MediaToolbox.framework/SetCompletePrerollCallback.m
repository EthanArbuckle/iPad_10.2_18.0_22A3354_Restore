@implementation SetCompletePrerollCallback

_QWORD *__customVideoCompositor_SetCompletePrerollCallback_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[4];
  v2 = result[5];
  if (*(_QWORD *)(v1 + 200) != v2 || *(_QWORD *)(v1 + 208) != result[6])
  {
    *(_QWORD *)(v1 + 200) = v2;
    *(_QWORD *)(result[4] + 208) = result[6];
  }
  return result;
}

@end
