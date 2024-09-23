@implementation FigGetFileTypeForMovieFamilyExtension

void __FigGetFileTypeForMovieFamilyExtension_block_invoke()
{
  const __CFAllocator *v0;
  __CFArray *Mutable;
  __CFDictionary *v2;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 5, MEMORY[0x1E0C9B378]);
  CFArrayAppendValue(Mutable, CFSTR("com.apple.quicktime-movie"));
  CFArrayAppendValue(Mutable, CFSTR("public.mpeg-4"));
  CFArrayAppendValue(Mutable, CFSTR("com.apple.m4v-video"));
  CFArrayAppendValue(Mutable, CFSTR("com.apple.m4a-audio"));
  CFArrayAppendValue(Mutable, CFSTR("public.3gpp"));
  CFArrayAppendValue(Mutable, CFSTR("com.apple.immersive-video"));
  FigGetFileTypeForMovieFamilyExtension_sNumMovieFamilyTypes = CFArrayGetCount(Mutable);
  FigGetFileTypeForMovieFamilyExtension_sMovieFamilyTypes = (uint64_t)Mutable;
  v2 = CFDictionaryCreateMutable(v0, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(v2, (const void *)*MEMORY[0x1E0CA5AA8], CFSTR("com.apple.m4a-audio"));
  CFDictionarySetValue(v2, CFSTR("com.apple.mpeg-4-ringtone"), CFSTR("com.apple.m4a-audio"));
  CFDictionarySetValue(v2, CFSTR("public.3gpp2"), CFSTR("public.3gpp"));
  FigGetFileTypeForMovieFamilyExtension_sMovieFamilySubstitutions = (uint64_t)v2;
}

@end
