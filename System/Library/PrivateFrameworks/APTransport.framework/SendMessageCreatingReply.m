@implementation SendMessageCreatingReply

_QWORD *__stream_SendMessageCreatingReply_block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  int v6;

  v1 = result;
  v2 = result[9];
  if (*(_BYTE *)(v2 + 72))
  {
    result = (_QWORD *)APSLogErrorAt();
    v5 = *(_QWORD *)(v1[4] + 8);
    v6 = -16617;
LABEL_12:
    *(_DWORD *)(v5 + 24) = v6;
    return result;
  }
  if (!*(_BYTE *)(result[10] + 9))
  {
    result = (_QWORD *)APSLogErrorAt();
    v5 = *(_QWORD *)(v1[4] + 8);
    v6 = -16614;
    goto LABEL_12;
  }
  if (*(_QWORD *)(v2 + 168))
  {
    if (gLogCategory_APTransportStream <= 90)
    {
      if (gLogCategory_APTransportStream != -1 || (result = (_QWORD *)_LogCategory_Initialize(), (_DWORD)result))
        result = (_QWORD *)LogPrintF();
    }
    v5 = *(_QWORD *)(v1[4] + 8);
    v6 = -6709;
    goto LABEL_12;
  }
  *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_DWORD *)(v2 + 176);
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = dispatch_semaphore_create(0);
  v3 = v1[9];
  *(_DWORD *)(v3 + 152) = 0;
  *(_QWORD *)(v3 + 168) = *(_QWORD *)(*(_QWORD *)(v1[6] + 8) + 24);
  dispatch_retain(*(dispatch_object_t *)(v1[9] + 168));
  CFRetain((CFTypeRef)v1[7]);
  v4 = (const void *)v1[8];
  if (v4)
    CFRetain(v4);
  return (_QWORD *)APSDispatchAsyncFHelper();
}

void __stream_SendMessageCreatingReply_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  _QWORD *v4;
  NSObject *v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 72))
  {
    APSLogErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -16617;
  }
  else
  {
    if (*(_BYTE *)(a1 + 56))
      v3 = -6722;
    else
      v3 = *(_DWORD *)(v2 + 152);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      APSLogErrorAt();
    }
    else
    {
      v4 = *(_QWORD **)(a1 + 48);
      if (v4)
      {
        *v4 = *(_QWORD *)(v2 + 160);
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160) = 0;
      }
    }
  }
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 168);
  if (v5)
  {
    dispatch_release(v5);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168) = 0;
  }
}

void __stream_SendMessageCreatingReply_block_invoke_3(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 160);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
  }
}

@end
