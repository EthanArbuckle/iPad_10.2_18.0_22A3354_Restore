@implementation FigRPCStartServerUsingMachChannel

void __FigRPCStartServerUsingMachChannel_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  mach_msg_header_t *msg;

  if (a2 == 7)
  {
    FigMachPortReleaseReceiveRight_(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), 0, 0, 0, 0);
    FigMachPortReleaseSendRight_(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 8), 0, 0, 0, 0);
  }
  else if (a2 == 2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v3 + 96))
      figRPCTimeoutDetector_setTimer(*(_QWORD *)(v3 + 96), *(const char **)v3, 0);
    v4 = dispatch_mach_mig_demux();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v5)
      figRPCTimeoutDetector_unsetTimer(v5);
    if ((v4 & 1) == 0)
    {
      msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
      mach_msg_destroy(msg);
    }
  }
}

@end
