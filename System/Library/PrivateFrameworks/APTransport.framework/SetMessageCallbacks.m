@implementation SetMessageCallbacks

_QWORD *__stream_SetMessageCallbacks_block_invoke(_QWORD *result)
{
  *(_QWORD *)(result[4] + 112) = result[5];
  *(_QWORD *)(result[4] + 120) = result[6];
  if (result[7])
  {
    if (gLogCategory_APTransportStreamUnbuffered <= 60)
    {
      if (gLogCategory_APTransportStreamUnbuffered != -1)
        return (_QWORD *)LogPrintF();
      result = (_QWORD *)_LogCategory_Initialize();
      if ((_DWORD)result)
        return (_QWORD *)LogPrintF();
    }
  }
  return result;
}

_QWORD *__stream_SetMessageCallbacks_block_invoke_0(_QWORD *result)
{
  *(_QWORD *)(result[4] + 200) = result[5];
  *(_QWORD *)(result[4] + 208) = result[6];
  *(_QWORD *)(result[4] + 192) = result[7];
  return result;
}

@end
