@implementation APSenderStatsCollectorCopySystemStats

CFDictionaryRef __APSenderStatsCollectorCopySystemStats_block_invoke(_QWORD *a1)
{
  CFDictionaryRef *v2;
  uint64_t v3;
  uint64_t v4;
  CFAllocatorRef *v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int Statistics;
  int tv_sec;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int v20;
  uint64_t CMBaseObject;
  unsigned int (*v22)(uint64_t, _QWORD, CFAllocatorRef, CFTypeRef *);
  CFDictionaryRef result;
  uint64_t v24;
  CFTypeRef cf;
  rusage v26;
  char **v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a1[5];
  v2 = (CFDictionaryRef *)a1[6];
  v4 = mach_absolute_time();
  v5 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (*(_BYTE *)(v3 + 112))
  {
    v6 = v4;
    v7 = v4 - *(_QWORD *)(v3 + 40);
    if (v7 > *(_QWORD *)(v3 + 32))
    {
      *(_QWORD *)(v3 + 40) = v4;
      v8 = (double)v7 / *(double *)(v3 + 64);
      memset(&v26, 0, sizeof(v26));
      if (getrusage(0, &v26))
      {
        APSLogErrorAt();
      }
      else
      {
        v9 = (double)v26.ru_utime.tv_usec / 1000000.0
           + (double)v26.ru_utime.tv_sec
           + (double)v26.ru_stime.tv_usec / 1000000.0
           + (double)v26.ru_stime.tv_sec;
        v10 = v9 - *(double *)(v3 + 96);
        *(double *)(v3 + 96) = v9;
        v11 = v10 / v8;
        if (*(_BYTE *)(v3 + 88))
        {
          *(double *)(v3 + 80) = *(double *)(v3 + 80) + *(double *)(v3 + 72) * (v11 - *(double *)(v3 + 80));
        }
        else
        {
          *(double *)(v3 + 80) = v11;
          *(_BYTE *)(v3 + 88) = 1;
        }
      }
      FigCFDictionarySetDouble();
      v27 = 0;
      v26.ru_utime.tv_sec = 0;
      v26.ru_utime.tv_usec = 0;
      Statistics = CARenderServerGetStatistics();
      tv_sec = (int)v27;
      if (v27)
      {
        v14 = Statistics;
        if (Statistics >= 3)
          v15 = 3;
        else
          v15 = Statistics;
        if (Statistics >= 1)
        {
          v24 = v6;
          v16 = 0;
          if (v15 <= 1)
            v17 = 1;
          else
            v17 = v15;
          do
          {
            LODWORD(cf) = 0;
            v18 = strchr(v27[v16], 10);
            if (v18 && sscanf(v18 + 1, " Total Frames: %d", &cf) == 1)
              *((_DWORD *)&v26.ru_utime.tv_sec + v16) = (_DWORD)cf;
            free(v27[v16++]);
          }
          while (v17 != v16);
          v6 = v24;
          v5 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
          if (v14 >= 4)
          {
            v19 = 3;
            do
              free(v27[v19++]);
            while (v14 != v19);
          }
        }
        free(v27);
        tv_sec = v26.ru_utime.tv_sec;
        v20 = *((_DWORD *)&v26.ru_utime.tv_sec + v15 - (v14 > 0));
      }
      else
      {
        v20 = 0;
      }
      *(_DWORD *)(v3 + 104) = tv_sec;
      *(_DWORD *)(v3 + 108) = v20;
      FigCFDictionarySetInt32();
      FigCFDictionarySetInt32();
      FigCFDictionarySetInt32();
      if (v6 - *(_QWORD *)(v3 + 56) > *(_QWORD *)(v3 + 48))
      {
        cf = 0;
        APTransportGetSharedTransport();
        CMBaseObject = FigTransportGetCMBaseObject();
        v22 = *(unsigned int (**)(uint64_t, _QWORD, CFAllocatorRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                          + 48);
        if (!v22 || v22(CMBaseObject, *MEMORY[0x1E0CF1E80], *v5, &cf))
        {
          if (gLogCategory_APSenderStatsCollector <= 50
            && (gLogCategory_APSenderStatsCollector != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
        }
        else
        {
          APTransportTrafficRegistrarGetRegistration();
          if (!CFPropertyListCreateFormatted())
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 24), CFSTR("trafficRegistration"), 0);
          if (!APTransportTrafficRegistrarGetRSSI())
            FigCFDictionarySetInt32();
          if (!APTransportTrafficRegistrarGetWifiChannel())
            FigCFDictionarySetInt32();
          APTransportTrafficRegistrarGetAWDLChannelSequence();
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v3 + 24), CFSTR("awdlChannelLength"));
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v3 + 24), CFSTR("awdlChannelSeq"));
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v3 + 24), CFSTR("awdlChannelFlags"));
        }
        if (cf)
          CFRelease(cf);
        *(_QWORD *)(v3 + 56) = v6;
      }
      if (gLogCategory_APSenderStatsCollector <= 20
        && (gLogCategory_APSenderStatsCollector != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  result = CFDictionaryCreateCopy(*v5, *(CFDictionaryRef *)(v3 + 24));
  *v2 = result;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
  return result;
}

@end
