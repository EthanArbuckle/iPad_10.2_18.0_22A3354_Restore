@implementation RenderFrameFromWindow

_QWORD *__customVideoCompositor_RenderFrameFromWindow_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD, _QWORD, _QWORD, _QWORD);

  v1 = result[4];
  v2 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v1 + 176);
  if (v2)
    return (_QWORD *)v2(*(_QWORD *)(v1 + 184), result[5], 0, result[6]);
  return result;
}

@end
