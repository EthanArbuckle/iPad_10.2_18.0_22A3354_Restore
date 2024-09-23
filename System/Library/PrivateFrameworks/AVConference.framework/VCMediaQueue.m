@implementation VCMediaQueue

void ___VCMediaQueue_ReportingRegisterPeriodicTask_block_invoke(uint64_t a1, uint64_t a2, __CFDictionary *a3)
{
  const __CFAllocator *v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  int v15;
  CFNumberRef v16;
  int v17;
  CFNumberRef v18;
  int v19;
  CFNumberRef v20;
  int v21;
  CFNumberRef v22;
  CFNumberRef v23;
  CFNumberRef v24;
  CFNumberRef v25;
  CFNumberRef v26;
  CFNumberRef v27;
  CFNumberRef v28;
  CFNumberRef v29;
  const CFDictionaryKeyCallBacks *v30;
  const CFDictionaryValueCallBacks *v31;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v33;
  __CFDictionary *v34;
  int v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  uint64_t v44;
  uint64_t v45;
  CFStringRef v46;
  int v47;
  int v48;
  CFNumberRef v49;
  __CFDictionary *v50;
  CFStringRef v51;
  unsigned int v52;
  double v53;
  int v54;
  int v55;
  CFNumberRef v56;
  int v57;
  int v58;
  CFNumberRef v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  __CFDictionary *v63;
  CFDictionaryRef theDict;
  uint64_t v65;
  int v66;
  int valuePtr;
  uint64_t v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  int v72;
  __int16 v73;
  CFMutableDictionaryRef v74;
  __int16 v75;
  __CFDictionary *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    valuePtr = *(_DWORD *)(a2 + 412);
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQSchBytes"), v6);
    CFRelease(v6);
    valuePtr = *(_DWORD *)(a2 + 416);
    v7 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQSchHeaderBytes"), v7);
    CFRelease(v7);
    valuePtr = *(_DWORD *)(a2 + 420);
    v8 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQSchPkts"), v8);
    CFRelease(v8);
    valuePtr = *(_DWORD *)(a2 + 424);
    v9 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQSentBytes"), v9);
    CFRelease(v9);
    valuePtr = *(_DWORD *)(a2 + 428);
    v10 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQSentHeaderBytes"), v10);
    CFRelease(v10);
    valuePtr = *(_DWORD *)(a2 + 436);
    v11 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQSentPkts"), v11);
    CFRelease(v11);
    valuePtr = *(_DWORD *)(a2 + 440);
    v12 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQUnsentPkts"), v12);
    CFRelease(v12);
    valuePtr = *(_DWORD *)(a2 + 432);
    v13 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQSavedBytes"), v13);
    CFRelease(v13);
    valuePtr = *(_DWORD *)(a2 + 420) - *(_DWORD *)(a2 + 436);
    v14 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQSavedPkts"), v14);
    CFRelease(v14);
    valuePtr = -1431655766;
    v15 = atomic_load((unint64_t *)(a2 + 512));
    valuePtr = v15;
    v16 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQIngressAudioPkts"), v16);
    CFRelease(v16);
    valuePtr = -1431655766;
    v17 = atomic_load((unint64_t *)(a2 + 504));
    valuePtr = v17;
    v18 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQIngressVideoPkts"), v18);
    CFRelease(v18);
    valuePtr = -1431655766;
    v19 = atomic_load((unint64_t *)(a2 + 520));
    valuePtr = v19;
    v20 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQIngressPkts"), v20);
    CFRelease(v20);
    valuePtr = -1431655766;
    v21 = atomic_load((unint64_t *)(a2 + 528));
    valuePtr = v21;
    v22 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQIngressQueuedPkts"), v22);
    CFRelease(v22);
    valuePtr = *(_QWORD *)(a2 + 536);
    v23 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQFlushedPkts"), v23);
    CFRelease(v23);
    valuePtr = *(_QWORD *)(a2 + 552);
    v24 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQEgressAudioPkts"), v24);
    CFRelease(v24);
    valuePtr = *(_QWORD *)(a2 + 544);
    v25 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQEgressVideoPkts"), v25);
    CFRelease(v25);
    valuePtr = *(_QWORD *)(a2 + 560);
    v26 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQEgressPkts"), v26);
    CFRelease(v26);
    valuePtr = *(_QWORD *)(a2 + 568);
    v27 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQEgressNonDupAudioPkts"), v27);
    CFRelease(v27);
    valuePtr = *(_QWORD *)(a2 + 576);
    v28 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQEgressNonDupVideoPkts"), v28);
    CFRelease(v28);
    valuePtr = *(_QWORD *)(a2 + 584);
    v29 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("VCMQEgressNonDupPkts"), v29);
    CFRelease(v29);
    v30 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v31 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v33 = CFDictionaryCreateMutable(v5, 0, v30, v31);
    v34 = CFDictionaryCreateMutable(v5, 0, v30, v31);
    if (Mutable && v33)
    {
      v63 = a3;
      theDict = Mutable;
      v35 = atomic_load((unsigned int *)(a2 + 760));
      valuePtr = 0;
      if (v35 >= 1)
      {
        v36 = 0;
        v65 = 176 * v35;
        do
        {
          v37 = *(_QWORD *)(a2 + 624);
          v38 = v37 + v36;
          if (!(v37 + v36))
            break;
          v39 = v37 + 176 * *(unsigned int *)(a2 + 348);
          if (v38 < v39 && v38 >= v37)
          {
            v41 = v37 + v36;
            v42 = atomic_load((unsigned __int8 *)(v37 + v36 + 97));
            if ((v42 & 1) != 0)
            {
              v44 = 2;
            }
            else
            {
              v43 = atomic_load((unsigned __int8 *)(v41 + 96));
              v44 = (v43 & 1) != 0 ? 3 : 1;
            }
            if (v41 + 176 <= v39)
              continue;
          }
          __break(0x5519u);
          v45 = v37 + v36;
          if (*(_DWORD *)(v37 + v36 + 156))
          {
            v46 = CFStringCreateWithFormat(v5, 0, CFSTR("%d"), v44);
            v47 = *(_DWORD *)(v45 + 156);
            if (FigCFDictionaryGetInt32IfPresent())
            {
              v48 = valuePtr;
              if (v47 > valuePtr)
                v48 = v47;
              v66 = v48;
              v49 = CFNumberCreate(v5, kCFNumberIntType, &v66);
              v50 = theDict;
            }
            else
            {
              v66 = v47;
              v49 = CFNumberCreate(v5, kCFNumberIntType, &v66);
              v50 = v34;
            }
            CFDictionaryAddValue(v50, v46, v49);
            CFRelease(v49);
            if (v46)
              CFRelease(v46);
          }
          *(_DWORD *)(v45 + 156) = 0;
          if (*(_DWORD *)(v45 + 72))
          {
            v51 = CFStringCreateWithFormat(v5, 0, CFSTR("%d"), v44);
            v52 = *(_DWORD *)(v45 + 72);
            if (v52)
              v53 = *(double *)(v37 + v36 + 56) / (double)v52 * 1000.0;
            else
              v53 = 0.0;
            v54 = (int)v53;
            if (FigCFDictionaryGetInt32IfPresent())
            {
              v55 = valuePtr;
              if (valuePtr <= v54)
                v55 = v54;
              v66 = v55;
            }
            else
            {
              v66 = v54;
            }
            v56 = CFNumberCreate(v5, kCFNumberIntType, &v66);
            CFDictionaryAddValue(v33, v51, v56);
            CFRelease(v56);
            v57 = (int)(*(double *)(v37 + v36 + 64) * 1000.0);
            if (FigCFDictionaryGetInt32IfPresent())
            {
              v58 = valuePtr;
              if (valuePtr <= v57)
                v58 = v57;
              v66 = v58;
            }
            else
            {
              v66 = v57;
            }
            v59 = CFNumberCreate(v5, kCFNumberIntType, &v66);
            CFDictionaryAddValue(v34, v51, v59);
            CFRelease(v59);
            if (v51)
              CFRelease(v51);
          }
          v60 = v37 + v36;
          *(_QWORD *)(v60 + 56) = 0;
          *(_QWORD *)(v60 + 64) = 0;
          *(_DWORD *)(v60 + 72) = 0;
          v36 += 176;
        }
        while (v65 != v36);
      }
      Mutable = theDict;
      if (CFDictionaryGetCount(theDict) >= 1)
        CFDictionaryAddValue(v63, CFSTR("VCMQFlushPerStream"), theDict);
      if (CFDictionaryGetCount(v33) >= 1)
        CFDictionaryAddValue(v63, CFSTR("VCMQQSizePerStream"), v33);
      if (CFDictionaryGetCount(v34) >= 1)
        CFDictionaryAddValue(v63, CFSTR("VCMQMaxQSizePerStream"), v34);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v61 = VRTraceErrorLogLevelToCSTR();
      v62 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        valuePtr = 136316162;
        v68 = v61;
        v69 = 2080;
        v70 = "_VCMediaQueue_ReportingRegisterPeriodicTask_block_invoke";
        v71 = 1024;
        v72 = 621;
        v73 = 2048;
        v74 = Mutable;
        v75 = 2048;
        v76 = v33;
        _os_log_error_impl(&dword_1D8A54000, v62, OS_LOG_TYPE_ERROR, "VCMediaQueue [%s] %s:%d Failed to allocate dictionaries in reporting flushCountDict=%p queueSizeDict=%p", (uint8_t *)&valuePtr, 0x30u);
      }
    }
    if (Mutable)
      CFRelease(Mutable);
    if (v33)
      CFRelease(v33);
    if (v34)
      CFRelease(v34);
  }
}

@end
