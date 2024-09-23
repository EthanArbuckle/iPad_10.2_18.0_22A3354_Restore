@implementation APTransportWifiManagerClientCopyWifiStatistics

void __APTransportWifiManagerClientCopyWifiStatistics_block_invoke(_QWORD *a1)
{
  CFMutableDictionaryRef *v2;
  int v3;
  uint64_t Samples;
  const void *v5;
  CFMutableDictionaryRef Mutable;
  int v7;

  v2 = (CFMutableDictionaryRef *)a1[6];
  if (!v2)
  {
    APSLogErrorAt();
    v7 = -71732;
    goto LABEL_11;
  }
  v3 = wifiManagerClient_ensureSubscribedForStatistics(a1[5]);
  if (v3)
  {
    v7 = v3;
    APSLogErrorAt();
LABEL_19:
    v5 = 0;
    goto LABEL_6;
  }
  Samples = IOReportCreateSamples();
  if (!Samples)
  {
    v7 = -71730;
    APSLogErrorAt();
    if (gLogCategory_APTransportWifiManagerClient <= 90
      && (gLogCategory_APTransportWifiManagerClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_19;
  }
  v5 = (const void *)Samples;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if ((IOReportIterate() & 1) != 0)
  {
    APSLogErrorAt();
    v7 = APSSignalErrorAt();
    goto LABEL_7;
  }
  v7 = 0;
  *v2 = Mutable;
LABEL_6:
  Mutable = 0;
LABEL_7:
  if (Mutable)
    CFRelease(Mutable);
  if (v5)
    CFRelease(v5);
LABEL_11:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v7;
}

@end
