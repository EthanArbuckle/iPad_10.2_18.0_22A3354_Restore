@implementation APReceiverAudioSessionBufferedHoseSetRateAndAnchorTime

uint64_t __APReceiverAudioSessionBufferedHoseSetRateAndAnchorTime_block_invoke(uint64_t a1, int a2)
{
  return AirPlayReceiverSessionControl(*(_QWORD *)(a1 + 32), a2, CFSTR("handleMediaAudioResumedForSession"), *(__CFString **)(*(_QWORD *)(a1 + 40) + 32), 0, 0);
}

uint64_t __APReceiverAudioSessionBufferedHoseSetRateAndAnchorTime_block_invoke_2(uint64_t a1)
{
  return audioSessionBufferedHose_cancelUnderrun(*(_QWORD *)(a1 + 32));
}

@end
