@implementation APCarPlayAVVCServerInit

uint64_t __APCarPlayAVVCServerInit_block_invoke(uint64_t a1)
{
  _QWORD *Instance;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  int v6;

  if (gAPCarPlayAVVCServerInitOnce != -1)
    dispatch_once_f(&gAPCarPlayAVVCServerInitOnce, 0, (dispatch_function_t)_APCarPlayAVVCServerGetTypeID);
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (!Instance)
  {
    result = APSLogErrorAt();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = -6728;
LABEL_14:
    *(_DWORD *)(v5 + 24) = v6;
    return result;
  }
  Instance[2] = 0;
  v3 = Instance + 2;
  Instance[3] = 0;
  Instance[4] = 0;
  gCarPlayAVVCServer = (uint64_t)Instance;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigXPCServerStart();
  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((_DWORD)result)
    return APSLogErrorAt();
  if (!*v3)
  {
    result = APSLogErrorAt();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = -6718;
    goto LABEL_14;
  }
  if (gLogCategory_APCarPlayAVVCServer <= 50)
  {
    if (gLogCategory_APCarPlayAVVCServer != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

@end
