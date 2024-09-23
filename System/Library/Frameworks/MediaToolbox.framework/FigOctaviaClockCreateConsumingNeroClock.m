@implementation FigOctaviaClockCreateConsumingNeroClock

void __FigOctaviaClockCreateConsumingNeroClock_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  int64_t UpTimeNanoseconds;
  CMTime v6;
  __int128 destination;
  uint64_t v8;
  OpaqueCMBlockBuffer *v9;

  v9 = 0;
  destination = *MEMORY[0x1E0CA2E18];
  v8 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  if (!NeroTransportSendSyncMessageCreatingReply()
    && !CMBlockBufferCopyDataBytes(v9, 0, 0x18uLL, &destination))
  {
    MEMORY[0x19402EEEC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    v2 = *(_QWORD *)(a1 + 32);
    v3 = destination;
    *(_QWORD *)(v2 + 24) = v8;
    *(_OWORD *)(v2 + 8) = v3;
    v4 = *(_QWORD *)(a1 + 32);
    UpTimeNanoseconds = FigGetUpTimeNanoseconds();
    CMTimeMake(&v6, UpTimeNanoseconds, 1000000000);
    *(CMTime *)(v4 + 32) = v6;
    MEMORY[0x19402EF04](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  }
  if (v9)
    CFRelease(v9);
}

@end
