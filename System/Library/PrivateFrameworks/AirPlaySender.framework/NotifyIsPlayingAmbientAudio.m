@implementation NotifyIsPlayingAmbientAudio

uint64_t __realTimeAudioEngine_NotifyIsPlayingAmbientAudio_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = notify_register_check("com.apple.airplay.isPlayingAmbientAudioChanged", &realTimeAudioEngine_NotifyIsPlayingAmbientAudio_sToken);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
