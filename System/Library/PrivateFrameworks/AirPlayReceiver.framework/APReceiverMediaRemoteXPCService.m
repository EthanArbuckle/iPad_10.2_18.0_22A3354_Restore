@implementation APReceiverMediaRemoteXPCService

void __APReceiverMediaRemoteXPCService_copyProperty_block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  CFTypeRef cf;

  cf = 0;
  APReceiverSessionManagerCopyAirPlaySessionWithAttribute(*(_QWORD *)(gAPReceiverMediaRemoteService_0 + 216), 0, 0, &cf);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    APSLogErrorAt();
  }
  else
  {
    if (cf)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = AirPlayReceiverSessionCopyProperty((uint64_t)cf, v2, CFSTR("MRInfo"), v3, 0);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        goto LABEL_4;
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v5 = -6727;
    }
    else
    {
      APSLogErrorAt();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v5 = -6709;
    }
    *(_DWORD *)(v4 + 24) = v5;
  }
LABEL_4:
  if (cf)
    CFRelease(cf);
}

@end
