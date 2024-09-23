@implementation APMetadataSourceStart

uint64_t __APMetadataSourceStart_block_invoke(uint64_t result)
{
  uint64_t v1;
  APMRNowPlayingControllerDelegate *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  APMRNowPlayingControllerDelegate *v6;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 128))
    return result;
  v1 = result;
  v2 = -[APMRNowPlayingControllerDelegate initWithMetadataSource:]([APMRNowPlayingControllerDelegate alloc], "initWithMetadataSource:", *(_QWORD *)(result + 32));
  v3 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v3 + 128) = v2;
  if (gLogCategory_APMetadataSource <= 50)
  {
    if (gLogCategory_APMetadataSource == -1)
    {
      v4 = _LogCategory_Initialize();
      v3 = *(_QWORD *)(v1 + 32);
      if (!v4)
        goto LABEL_6;
      v2 = *(APMRNowPlayingControllerDelegate **)(v3 + 128);
    }
    v5 = v3;
    v6 = v2;
    LogPrintF();
    v3 = *(_QWORD *)(v1 + 32);
  }
LABEL_6:
  result = objc_msgSend(*(id *)(v3 + 128), "start", v5, v6);
  if (gLogCategory_APMetadataSource <= 50)
  {
    if (gLogCategory_APMetadataSource != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

@end
