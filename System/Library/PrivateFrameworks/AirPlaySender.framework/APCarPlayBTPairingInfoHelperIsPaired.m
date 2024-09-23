@implementation APCarPlayBTPairingInfoHelperIsPaired

void __APCarPlayBTPairingInfoHelperIsPaired_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  const __CFArray *v4;
  CFIndex v5;
  const __CFAllocator *v6;
  const __CFString *ValueAtIndex;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  int v12;
  const __CFString *v13;
  BOOL v14;
  int v15;
  _QWORD v16[256];
  _QWORD v17[2];
  CFIndex Count;
  unint64_t v19;
  char v20[264];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 32))
  {
    v17[1] = v17;
    v19 = 0;
    v2 = MEMORY[0x1E0C80A78]();
    memset(v16, 0, 512);
    v3 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTLocalDeviceGetPairedDevices[0])(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 32), (uint64_t)v16, (uint64_t)&v19, 256);
    if (v3)
    {
      v15 = v3;
    }
    else
    {
      v4 = *(const __CFArray **)(a1 + 56);
      if (!v4)
        return;
      Count = CFArrayGetCount(v4);
      if (Count < 1)
        return;
      v5 = 0;
      v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      while (1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v5);
        if (ValueAtIndex && v19 != 0)
          break;
        v9 = *(_QWORD *)(a1 + 32);
LABEL_26:
        ++v5;
        if (*(_BYTE *)(*(_QWORD *)(v9 + 8) + 24))
          v14 = 1;
        else
          v14 = v5 == Count;
        if (v14)
          return;
      }
      v10 = ValueAtIndex;
      v11 = 0;
      while (1)
      {
        memset(v20, 0, 256);
        v12 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString[0])(v16[v11], (uint64_t)v20, 256);
        if (v12)
          break;
        v13 = CFStringCreateWithCString(v6, v20, 0x8000100u);
        if (gLogCategory_APCarPlayBTPairingInfoHelper <= 50
          && (gLogCategory_APCarPlayBTPairingInfoHelper != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (CFStringCompare(v10, v13, 1uLL) == kCFCompareEqualTo)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
          if (gLogCategory_APCarPlayBTPairingInfoHelper <= 50
            && (gLogCategory_APCarPlayBTPairingInfoHelper != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
        }
        if (v13)
          CFRelease(v13);
        v9 = *(_QWORD *)(a1 + 32);
        if (!*(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) && ++v11 < v19)
          continue;
        goto LABEL_26;
      }
      v15 = v12;
    }
    APSLogErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15;
    if (gLogCategory_APCarPlayBTPairingInfoHelper <= 90
      && (gLogCategory_APCarPlayBTPairingInfoHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

@end
