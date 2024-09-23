@implementation APBrowserRapportManagerSetMode

uint64_t __APBrowserRapportManagerSetMode_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  v1 = result;
  v2 = *(_QWORD *)(result + 40);
  if (*(_BYTE *)(v2 + 51))
  {
    v4 = -72284;
    goto LABEL_18;
  }
  v3 = *(unsigned __int16 *)(result + 48);
  if (*(unsigned __int16 *)(v2 + 48) == v3)
  {
    v4 = 0;
    goto LABEL_18;
  }
  if (v3 == 1)
  {
    v5 = APBrowserRapportManager_ensurePreferencesUpdated(*(_BYTE **)(result + 40), 0);
    if (v5)
    {
      v4 = v5;
    }
    else
    {
      if (gLogCategory_APBrowserRapportManager <= 40
        && (gLogCategory_APBrowserRapportManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_WORD *)(v2 + 48) = 1;
      result = APBrowserRapportManager_update(v2);
      v4 = result;
      if (!(_DWORD)result)
        goto LABEL_18;
    }
    APSLogErrorAt();
LABEL_23:
    result = APSLogErrorAt();
    goto LABEL_18;
  }
  if (*(_WORD *)(result + 48))
  {
    if (gLogCategory_APBrowserRapportManager <= 90)
    {
      if (gLogCategory_APBrowserRapportManager != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
    v4 = -6705;
  }
  else
  {
    result = APBrowserRapportManager_stop(*(_QWORD *)(result + 40));
    v4 = result;
    if ((_DWORD)result)
      goto LABEL_23;
  }
LABEL_18:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = v4;
  return result;
}

@end
