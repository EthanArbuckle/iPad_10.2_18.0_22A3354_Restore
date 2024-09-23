@implementation APReceiverStatsCollectorDisableHUD

uint64_t __APReceiverStatsCollectorDisableHUD_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 256))
  {
    v2 = result;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    objc_msgSend(*(id *)(v1 + 32), "removeFromSuperlayer");

    *(_QWORD *)(v1 + 32) = 0;
    objc_msgSend(*(id *)(v1 + 40), "removeFromSuperlayer");

    *(_QWORD *)(v1 + 40) = 0;
    *(_QWORD *)(v1 + 24) = 0;
    v3 = *(void **)(v1 + 264);
    if (v3)
    {
      objc_msgSend((id)objc_msgSend(v3, "layer"), "removeFromSuperlayer");

      *(_QWORD *)(v1 + 264) = 0;
    }
    result = objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    if (gLogCategory_APReceiverStatsCollector <= 30)
    {
      if (gLogCategory_APReceiverStatsCollector != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 256) = 0;
  }
  return result;
}

@end
