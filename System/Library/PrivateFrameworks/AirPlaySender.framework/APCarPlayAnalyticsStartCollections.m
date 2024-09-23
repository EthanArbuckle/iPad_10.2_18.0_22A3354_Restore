@implementation APCarPlayAnalyticsStartCollections

uint64_t __APCarPlayAnalyticsStartCollections_block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  if (*(unsigned __int8 *)(v1 + 48) | *(unsigned __int8 *)(v1 + 192) | *(unsigned __int8 *)(v1 + 392))
  {
    v2 = *(_DWORD *)(result + 48);
    v3 = *(_QWORD *)(result + 40);
    if (*(unsigned __int8 *)(v1 + 193) | *(unsigned __int8 *)(result + 52) | *(unsigned __int8 *)(v1 + 49) | *(unsigned __int8 *)(v1 + 393))
    {
      if (gLogCategory_APCarPlayAnalytics <= 50)
      {
        if (gLogCategory_APCarPlayAnalytics != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
          result = LogPrintF();
      }
      *(_DWORD *)(v1 + 24) = 0;
    }
    *(_QWORD *)(v1 + 40) = v3;
    *(_DWORD *)(v1 + 32) = v2;
    *(_BYTE *)(v1 + 28) = 1;
  }
  else if (gLogCategory_APCarPlayAnalytics <= 60)
  {
    if (gLogCategory_APCarPlayAnalytics != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

@end
