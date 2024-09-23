@implementation APReceiverAudioSessionBufferedHoseFlushAudio

uint64_t __APReceiverAudioSessionBufferedHoseFlushAudio_block_invoke(uint64_t a1)
{
  return audioSessionBufferedHose_cancelUnderrun(*(_QWORD *)(a1 + 32));
}

@end
