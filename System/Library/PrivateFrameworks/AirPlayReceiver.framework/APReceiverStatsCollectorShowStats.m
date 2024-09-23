@implementation APReceiverStatsCollectorShowStats

void __APReceiverStatsCollectorShowStats_block_invoke(uint64_t a1)
{
  uint64_t v1;
  double Current;
  double v3;
  double v4;
  int v5;
  const __CFDictionary *v6;
  const __CFArray *Value;
  const __CFArray *v8;
  CFTypeID v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  const __CFDictionary *ValueAtIndex;
  unsigned int *v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int *v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t CMBaseObject;
  unsigned int (*v24)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;
  CFTypeRef v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 257) || *(_BYTE *)(v1 + 256))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v3 = Current - *(double *)(v1 + 232);
    if (v3 >= 0.5)
    {
      v4 = *(double *)(v1 + 104);
      v50 = *(_DWORD *)(v1 + 260);
      *(double *)(v1 + 232) = Current;
      FigCFDictionaryGetDoubleIfPresent();
      FigCFDictionaryGetDoubleIfPresent();
      FigCFDictionaryGetDoubleIfPresent();
      FigCFDictionaryGetDoubleIfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      FigCFDictionaryGetInt32IfPresent();
      v51 = *(_DWORD *)(v1 + 72);
      v5 = v51 - *(_DWORD *)(v1 + 76);
      *(_DWORD *)(v1 + 76) = v51;
      v6 = *(const __CFDictionary **)(v1 + 136);
      if (v6)
      {
        Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(v1 + 136), (const void *)*MEMORY[0x24BDDCFC8]);
        if (Value)
        {
          v8 = Value;
          v9 = CFGetTypeID(Value);
          if (v9 == CFArrayGetTypeID())
          {
            Count = CFArrayGetCount(v8);
            if (Count >= 1)
            {
              v11 = Count;
              v12 = 0;
              while (1)
              {
                ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, v12);
                v57 = 0;
                if (FigCFDictionaryGetInt32IfPresent())
                  break;
                if (v11 == ++v12)
                  goto LABEL_13;
              }
              v6 = ValueAtIndex;
            }
          }
        }
      }
LABEL_13:
      if (FigCFDictionaryGetInt32IfPresent())
      {
        v49 = (int)((double)(v51 - *(_DWORD *)(v1 + 80)) / v3 + 0.5);
        *(_DWORD *)(v1 + 80) = v51;
      }
      else
      {
        v49 = 0;
      }
      if (FigCFDictionaryGetInt32IfPresent())
      {
        v48 = (int)((double)(v51 - *(_DWORD *)(v1 + 84)) / v3 + 0.5);
        *(_DWORD *)(v1 + 84) = v51;
      }
      else
      {
        v48 = 0;
      }
      if (v6)
        CFDictionaryGetValue(v6, (const void *)*MEMORY[0x24BDDCFC0]);
      v46 = *(_DWORD *)(v1 + 88) - ((int)v4 & ((int)v4 >> 31));
      v14 = (unsigned int *)(v1 + 60);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15, v14));
      do
        v16 = __ldxr(v14);
      while (__stxr(v16 - v15, v14));
      v17 = (unsigned int *)(v1 + 64);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18, v17));
      do
        v19 = __ldxr(v17);
      while (__stxr(v19 - v18, v17));
      v20 = (unsigned int *)(v1 + 68);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21, v20));
      do
        v22 = __ldxr(v20);
      while (__stxr(v22 - v21, v20));
      if (*(_BYTE *)(v1 + 256))
      {
        v47 = (int)v4;
        v45 = objc_alloc_init(MEMORY[0x24BDD1460]);
        v55 = 0;
        v56 = 0;
        v54 = 0;
        v53 = 0;
        if (*(_QWORD *)(v1 + 128))
        {
          CFDictionaryGetValue(*(CFDictionaryRef *)(v1 + 128), CFSTR("trafficRegistration"));
          FigCFDictionaryGetBooleanIfPresent();
          FigCFDictionaryGetBooleanIfPresent();
          FigCFDictionaryGetInt32IfPresent();
          FigCFDictionaryGetInt32IfPresent();
          LODWORD(v52) = 0;
        }
        v52 = 0;
        APTransportGetSharedTransport();
        CMBaseObject = FigTransportGetCMBaseObject();
        v24 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 8)
                                                                                  + 48);
        if (v24 && !v24(CMBaseObject, *MEMORY[0x24BDFD7E8], *MEMORY[0x24BDBD240], &v52))
        {
          APTransportTrafficRegistrarGetRegistration();
          APTransportTrafficRegistrarGetRSSI();
          APTransportTrafficRegistrarGetWifiChannel();
          APTransportTrafficRegistrarGetAWDLChannelSequence();
        }
        if (v52)
          CFRelease(v52);
        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
        if (*(_DWORD *)(v1 + 260))
          v25 = "Mirroring 2";
        else
          v25 = "Mirroring 1";
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", 0, CFSTR("%s"), v25);
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", 1, CFSTR("%s"), v1 + 208);
        if (v50)
        {
          v26 = 2;
        }
        else
        {
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", 2, CFSTR("%s%s"), ", ");
          v26 = 3;
        }
        v27 = (v26 + 1);
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", v26, CFSTR("%s%s"), ", ");
        if (!v50)
        {
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v26 + 1), CFSTR("%.0fx%.0f"), *(_QWORD *)(v1 + 144), *(_QWORD *)(v1 + 152));
          v27 = (v26 + 2);
        }
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", v27, CFSTR("%.0fx%.0f"), *(_QWORD *)(v1 + 176), *(_QWORD *)(v1 + 184));
        v28 = (v27 + 2);
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v27 + 1), CFSTR("%c%c%c%c"), HIBYTE(*(_DWORD *)(v1 + 192)), BYTE2(*(_DWORD *)(v1 + 192)), BYTE1(*(_DWORD *)(v1 + 192)), *(_DWORD *)(v1 + 192));
        if (!v50)
        {
          v29 = *(const __CFString **)(v1 + 200);
          if (!v29)
            v29 = &stru_24E220A30;
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v27 + 2), CFSTR("%@"), v29);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v27 + 3), CFSTR("%u"), 0);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v27 + 4), CFSTR("%u"), 0);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v27 + 5), CFSTR("%u"), 0);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v27 + 6), CFSTR("%u"), 0);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v27 + 7), CFSTR("%u"), 0);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", v27 | 8, CFSTR("%u"), 0);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v27 + 9), CFSTR("%u"), 0);
          v28 = (v27 + 11);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v27 + 10), CFSTR("%u"), (int)((double)v5 / v3 + 0.5));
        }
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", v28, CFSTR("%u"), v49);
        v30 = (v28 + 2);
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v28 + 1), CFSTR("%u"), v48);
        if (!v50)
        {
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v28 + 2), CFSTR("%.2f"), 0.0 / 1000000.0);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v28 + 3), CFSTR("%.2f"), 0.0 / 1000000.0);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v28 + 4), CFSTR("%u%%"), (int)(0.0 * 100.0));
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v28 + 5), CFSTR("%u ms"), 0);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v28 + 6), CFSTR("%d"), v46);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v28 + 7), CFSTR("%d"), v47);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v28 + 8), CFSTR("%u"), 0);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v28 + 9), CFSTR("%u"), 0);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v28 + 10), CFSTR("%u"), 0);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v28 + 11), CFSTR("%u"), (int)0.0);
          v30 = (v28 + 13);
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v28 + 12), CFSTR("%d"), 0);
        }
        v31 = (v30 + 1);
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", v30, CFSTR("%d"), 0);
        if (!v50)
        {
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v30 + 1), CFSTR("%d"), 0);
          v31 = (v30 + 2);
        }
        v32 = (v31 + 1);
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", v31, CFSTR("%d"), 0);
        if (!v50)
        {
          v33 = v55;
          if (!v55)
            v33 = "N/A";
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v31 + 1), CFSTR("%s"), v33);
          v32 = (v31 + 3);
          v34 = v56;
          if (!v56)
            v34 = "N/A";
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v31 + 2), CFSTR("%s"), v34);
        }
        v35 = v53;
        if (!v53)
          v35 = "N/A";
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", v32, CFSTR("%s"), v35);
        v36 = (v32 + 2);
        v37 = v54;
        if (!v54)
          v37 = "N/A";
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v32 + 1), CFSTR("%s"), v37);
        if (!v50)
        {
          objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v32 + 2), CFSTR("%u"), 0);
          v36 = (v32 + 3);
        }
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", v36, CFSTR("%u ms"), *(unsigned int *)(v1 + 56));
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v36 + 1), CFSTR("%u"), v15);
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v36 + 2), CFSTR("%u"), v18);
        objc_msgSend(*(id *)(v1 + 32), "setValueAtIndex:format:", (v36 + 3), CFSTR("%u"), v21);
        objc_msgSend(*(id *)(v1 + 32), "setNeedsDisplay");
        objc_msgSend(*(id *)(v1 + 32), "display");
        *(float *)&v38 = (float)(int)v49;
        objc_msgSend(*(id *)(v1 + 40), "updateValue:value:", 0, v38);
        if (!v50)
        {
          *(float *)&v39 = (float)0;
          objc_msgSend(*(id *)(v1 + 40), "updateValue:value:", 1, v39);
          *(float *)&v40 = (float)(int)v47;
          objc_msgSend(*(id *)(v1 + 40), "updateValue:value:", 2, v40);
          HIDWORD(v41) = 0;
          *(float *)&v41 = (float)0.0 / 1000000.0;
          objc_msgSend(*(id *)(v1 + 40), "updateValue:value:", 3, v41);
          HIDWORD(v42) = 0;
          *(float *)&v42 = (float)0.0 / 1000000.0;
          objc_msgSend(*(id *)(v1 + 40), "updateValue:value:", 4, v42);
          *(float *)&v43 = (float)0;
          objc_msgSend(*(id *)(v1 + 40), "updateValue:value:", 5, v43);
        }
        objc_msgSend(*(id *)(v1 + 40), "setNeedsDisplay");
        objc_msgSend(*(id *)(v1 + 40), "display");
        v44 = *(void **)(v1 + 264);
        if (v44)
          objc_msgSend((id)objc_msgSend(v44, "layer"), "setFrame:", *(double *)(v1 + 160), *(double *)(v1 + 168), *(double *)(v1 + 176), *(double *)(v1 + 184));
        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
        free(v55);
        free(v56);
        free(v53);
        free(v54);
        objc_msgSend(v45, "drain");
      }
      if (*(_BYTE *)(v1 + 257)
        && gLogCategory_APReceiverStatsCollector <= 50
        && (gLogCategory_APReceiverStatsCollector != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

@end
