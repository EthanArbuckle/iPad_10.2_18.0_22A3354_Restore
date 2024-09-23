@implementation FigAudioSessionGetMXNotificationTranslationInternal

void __FigAudioSessionGetMXNotificationTranslationInternal_block_invoke()
{
  const __CFAllocator *v0;
  __CFDictionary *Mutable;
  const void *v2;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v2 = (const void *)*MEMORY[0x1E0D493E0];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D493E0], CFSTR("Interruption"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48620], CFSTR("ActiveAudioRouteDidChange"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48628], CFSTR("ActiveNeroVisualStreamInfoDidChange"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D49388], CFSTR("AvailableFormatsDidChange"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48638], CFSTR("DisplayLayoutDidChange"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D48640], CFSTR("UserVolumeDidChange"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D49358], CFSTR("AirPlayVideoWillBeInterrupted"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D49368], CFSTR("ApplicationStateDidChange"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D49370], CFSTR("AudioBehaviorDidChange"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D49380], CFSTR("AudioModeDidChange"));
  CFDictionarySetValue(Mutable, v2, CFSTR("Interruption"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D493E8], CFSTR("IsActiveDidChange"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D49420], CFSTR("PiPIsPossibleDidChange"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D49428], CFSTR("PickableRoutesDidChange"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D49448], CFSTR("RoutingContextDidChange"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D493F0], CFSTR("IsMutedDidChange"));
  CFDictionarySetValue(Mutable, CFSTR("PrefersConcurrentAirPlayAudioDidChange"), CFSTR("PrefersConcurrentAirPlayAudioDidChange"));
  FigAudioSessionGetMXNotificationTranslationInternal_sNotificationTranslation = (uint64_t)CFDictionaryCreateCopy(v0, Mutable);
  if (Mutable)
    CFRelease(Mutable);
}

@end
