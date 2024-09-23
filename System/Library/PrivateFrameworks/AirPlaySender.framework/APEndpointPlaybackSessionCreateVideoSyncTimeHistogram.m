@implementation APEndpointPlaybackSessionCreateVideoSyncTimeHistogram

__CFDictionary *__APEndpointPlaybackSessionCreateVideoSyncTimeHistogram_block_invoke()
{
  __CFDictionary *result;

  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  APEndpointPlaybackSessionCreateVideoSyncTimeHistogram_histogramCreationOptions = (uint64_t)result;
  if (result)
  {
    CFDictionarySetValue(result, (const void *)*MEMORY[0x1E0CF75A0], CFSTR("second"));
    FigCFDictionarySetDouble();
    FigCFDictionarySetDouble();
    return (__CFDictionary *)FigCFDictionarySetInt32();
  }
  return result;
}

@end
