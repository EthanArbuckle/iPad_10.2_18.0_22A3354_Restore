@implementation APAdvertiserRapportManagerSetMode

void __APAdvertiserRapportManagerSetMode_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int16 *)(a1 + 48);
  v4 = *(unsigned __int16 *)(v2 + 56);
  if (v4 == v3)
    goto LABEL_18;
  if (gLogCategory_APAdvertiserRapportManager > 40)
    goto LABEL_6;
  if (gLogCategory_APAdvertiserRapportManager != -1)
    goto LABEL_4;
  if (_LogCategory_Initialize())
  {
    v4 = *(unsigned __int16 *)(v2 + 56);
LABEL_4:
    APAdvertiserRapportManager_stringForMode(v4);
    APAdvertiserRapportManager_stringForMode(v3);
    LogPrintF();
  }
LABEL_6:
  if (v3 == 1)
  {
    if (gLogCategory_APAdvertiserRapportManager <= 40
      && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*(_WORD *)(v2 + 56) == 1)
    {
      APSLogErrorAt();
    }
    else
    {
      *(_WORD *)(v2 + 56) = 1;
      APAdvertiserRapportManager_update(v2);
    }
    goto LABEL_18;
  }
  if (!v3)
  {
    APAdvertiserRapportManager_stop(v2);
LABEL_18:
    v5 = 0;
    goto LABEL_21;
  }
  if (gLogCategory_APAdvertiserRapportManager <= 90
    && (gLogCategory_APAdvertiserRapportManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = -72413;
LABEL_21:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
}

@end
