@implementation MediaControlClientNowPlayingInfoDidChange

void ___MediaControlClientNowPlayingInfoDidChange_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  int v3;
  int v5;
  const __CFData *Value;
  const __CFData *v7;
  CFTypeID v8;
  uint64_t v9;
  const __CFDictionary *v10;
  const void *v11;

  v3 = gLogCategory_MediaControlClientMetaData;
  if (!theDict)
  {
    if (gLogCategory_MediaControlClientMetaData <= 40
      && (gLogCategory_MediaControlClientMetaData != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 0;
    goto LABEL_33;
  }
  if (gLogCategory_MediaControlClientMetaData <= 10)
  {
    if (gLogCategory_MediaControlClientMetaData != -1)
      goto LABEL_4;
    v5 = _LogCategory_Initialize();
    v3 = gLogCategory_MediaControlClientMetaData;
    if (v5)
    {
      if (gLogCategory_MediaControlClientMetaData > 10)
        goto LABEL_26;
LABEL_4:
      if (v3 != -1 || _LogCategory_Initialize())
        goto LABEL_18;
      goto LABEL_26;
    }
  }
  if (v3 <= 40 && (v3 != -1 || _LogCategory_Initialize()))
  {
    Value = (const __CFData *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE65790]);
    if (Value)
    {
      v7 = Value;
      v8 = CFGetTypeID(Value);
      if (v8 == CFDataGetTypeID())
        CFDataGetLength(v7);
    }
    if (gLogCategory_MediaControlClientMetaData <= 40
      && (gLogCategory_MediaControlClientMetaData != -1 || _LogCategory_Initialize()))
    {
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE65780]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE65770]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE65850]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE65878]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE65870]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE657D8]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE657D0]);
      CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE657A0]);
LABEL_18:
      LogPrintF();
    }
  }
LABEL_26:
  if (CFDictionaryGetCount(theDict) != 2
    || !CFDictionaryGetInt64()
    || !CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE65848]))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = theDict;
LABEL_33:
    _MediaControlClientNowPlayingUpdate(v9, v10);
    goto LABEL_34;
  }
  if (gLogCategory_MediaControlClientMetaData <= 40
    && (gLogCategory_MediaControlClientMetaData != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_34:
  v11 = *(const void **)(a1 + 32);
  if (v11)
    CFRelease(v11);
}

@end
