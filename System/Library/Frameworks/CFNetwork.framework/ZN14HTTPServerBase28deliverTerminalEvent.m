@implementation ZN14HTTPServerBase28deliverTerminalEvent

_QWORD *___ZN14HTTPServerBase28deliverTerminalEvent_onQueueEv_block_invoke(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  int v3;

  if (a2)
  {
    v2 = result;
    result = (_QWORD *)result[4];
    v3 = *((_DWORD *)v2 + 10);
    if (v3 == 4)
    {
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 64))(result);
    }
    else if (v3 <= 3)
    {
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 56))(result);
    }
  }
  return result;
}

@end
