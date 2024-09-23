@implementation APReceiverAudioSessionBufferedHoseSetRate

uint64_t __APReceiverAudioSessionBufferedHoseSetRate_block_invoke(uint64_t a1, int a2)
{
  return AirPlayReceiverSessionControl(*(_QWORD *)(a1 + 32), a2, CFSTR("handleMediaAudioResumedForSession"), *(__CFString **)(*(_QWORD *)(a1 + 40) + 32), 0, 0);
}

@end
