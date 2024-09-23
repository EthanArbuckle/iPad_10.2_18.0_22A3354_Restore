@implementation APTransportWifiManagerClientGetPeerRSSI

void __APTransportWifiManagerClientGetPeerRSSI_block_invoke(_QWORD *a1)
{
  uint64_t Samples;
  const void *v3;
  const void *v4;
  int v5;

  if (!a1[7])
  {
    APSLogErrorAt();
    v5 = -71732;
    goto LABEL_10;
  }
  v5 = wifiManagerClient_ensureSubscribedForStatistics(a1[5]);
  if (v5)
  {
    APSLogErrorAt();
  }
  else
  {
    Samples = IOReportCreateSamples();
    if (Samples)
    {
      v3 = (const void *)Samples;
      v4 = (const void *)CFStringCreateF();
      if ((IOReportSelectChannelsInGroup() & 1) != 0 || (IOReportIterate() & 1) != 0)
      {
        APSLogErrorAt();
        v5 = APSSignalErrorAt();
      }
      goto LABEL_6;
    }
    APSLogErrorAt();
    v5 = -71730;
    if (gLogCategory_APTransportWifiManagerClient <= 90
      && (gLogCategory_APTransportWifiManagerClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v3 = 0;
  v4 = 0;
LABEL_6:
  if (v3)
    CFRelease(v3);
  if (v4)
    CFRelease(v4);
LABEL_10:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v5;
}

@end
