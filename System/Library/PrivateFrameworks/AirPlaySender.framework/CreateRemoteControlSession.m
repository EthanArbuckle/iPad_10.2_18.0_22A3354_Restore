@implementation CreateRemoteControlSession

uint64_t __carEndpoint_CreateRemoteControlSession_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  int v5;

  v1 = result;
  v2 = *(_QWORD *)(result + 48);
  if (!*(_DWORD *)(v2 + 204))
  {
    if (gLogCategory_APEndpointCarPlay <= 90)
    {
      if (gLogCategory_APEndpointCarPlay != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      {
        IsAppleInternalBuild();
        result = LogPrintF();
      }
    }
    v4 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 8);
    v5 = -17605;
    goto LABEL_18;
  }
  if (*(_BYTE *)(result + 104))
  {
    result = *(_QWORD *)(v2 + 440);
    if (result)
    {
      **(_QWORD **)(v1 + 72) = CFDictionaryGetValue((CFDictionaryRef)result, **(const void ***)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24));
      v3 = **(const void ***)(v1 + 72);
      if (v3)
      {
        result = (uint64_t)CFRetain(v3);
        if (gLogCategory_APEndpointCarPlay <= 50)
        {
          if (gLogCategory_APEndpointCarPlay != -1)
            return LogPrintF();
          result = _LogCategory_Initialize();
          if ((_DWORD)result)
            return LogPrintF();
        }
        return result;
      }
      result = APSLogErrorAt();
    }
    v4 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 8);
    v5 = -17606;
LABEL_18:
    *(_DWORD *)(v4 + 24) = v5;
    return result;
  }
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = carEndpoint_createCommChannelInternal(*(const void **)(v1 + 88), *(__CFDictionary **)(v1 + 96), *(CFTypeRef **)(v1 + 72), *(CFTypeRef **)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8)+ 24));
  if (gLogCategory_APEndpointCarPlay <= 50
    && (gLogCategory_APEndpointCarPlay != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  return result;
}

@end
