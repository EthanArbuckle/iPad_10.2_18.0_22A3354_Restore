@implementation UpdateHoseReadiness

void __audioHoseManagerBuffered_UpdateHoseReadiness_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD, _QWORD, uint64_t);
  int v8;
  const void *v9;
  const __CFDictionary *v10;
  int v11;
  const __CFDictionary *v12;
  const void *v13;
  _DWORD *Value;
  uint64_t v15;
  const void *v16;

  v5 = *a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v7)
    v7(v5, *MEMORY[0x1E0CA4818], 0, v6 + 24);
  if (*(_DWORD *)(a1 + 80))
    goto LABEL_49;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = APSGetFBOPropertyInt64() != 0;
  v8 = *((_DWORD *)a3 + 23);
  if ((v8 - 1) <= 2)
  {
    v9 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v9)
    {
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        v10 = *(const __CFDictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        if (v10)
          goto LABEL_15;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
        v10 = *(const __CFDictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        if (v10)
        {
          v9 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
LABEL_15:
          v11 = CFDictionaryContainsKey(v10, v9);
          v12 = *(const __CFDictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          v13 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
          if (v11)
          {
            Value = CFDictionaryGetValue(v12, v13);
            if (Value[23] == 1)
            {
              Value[23] = 2;
              *(_BYTE *)(*(_QWORD *)(a1 + 56) + 372) = 1;
              if (gLogCategory_APAudioHoseManagerBuffered <= 50
                && (gLogCategory_APAudioHoseManagerBuffered != -1 || _LogCategory_Initialize()))
              {
                if (*(_QWORD *)(a1 + 64))
                  CMBaseObjectGetDerivedStorage();
                LogPrintF();
              }
            }
            if (*((_DWORD *)a3 + 23) != 1)
              goto LABEL_42;
            *((_DWORD *)a3 + 23) = 2;
            *(_BYTE *)(*(_QWORD *)(a1 + 56) + 372) = 1;
            if (gLogCategory_APAudioHoseManagerBuffered > 50
              || gLogCategory_APAudioHoseManagerBuffered == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_42;
            }
            if (!*(_QWORD *)(a1 + 64))
              goto LABEL_29;
          }
          else
          {
            CFDictionaryAddValue(v12, v13, a3);
            if (*((_DWORD *)a3 + 23) != 1)
              goto LABEL_42;
            v15 = *(_QWORD *)(a1 + 56);
            if ((unint64_t)(*(_QWORD *)(a1 + 72) - a3[6]) < *(_QWORD *)(v15 + 360))
              goto LABEL_42;
            *((_DWORD *)a3 + 23) = 2;
            *(_BYTE *)(v15 + 372) = 1;
            if (gLogCategory_APAudioHoseManagerBuffered > 50
              || gLogCategory_APAudioHoseManagerBuffered == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_42;
            }
            if (!*(_QWORD *)(a1 + 64))
              goto LABEL_29;
          }
          goto LABEL_11;
        }
LABEL_49:
        APSLogErrorAt();
        return;
      }
    }
  }
  if (v8 != 1)
    goto LABEL_42;
  *((_DWORD *)a3 + 23) = 2;
  *(_BYTE *)(*(_QWORD *)(a1 + 56) + 372) = 1;
  if (gLogCategory_APAudioHoseManagerBuffered > 50
    || gLogCategory_APAudioHoseManagerBuffered == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_42;
  }
  if (*(_QWORD *)(a1 + 64))
LABEL_11:
    CMBaseObjectGetDerivedStorage();
LABEL_29:
  LogPrintF();
LABEL_42:
  v16 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v16)
  {
    CFRelease(v16);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  if (*((_DWORD *)a3 + 23) == 2 && !a3[30])
    a3[30] = UpTicksToMilliseconds();
}

@end
