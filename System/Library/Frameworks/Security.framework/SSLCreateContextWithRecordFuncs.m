@implementation SSLCreateContextWithRecordFuncs

uint64_t __SSLCreateContextWithRecordFuncs_block_invoke()
{
  const __CFAllocator *v0;
  const __CFURL *v1;
  const __CFURL *v2;
  __CFReadStream *v3;
  __CFReadStream *v4;
  const __CFDictionary *v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  CFTypeID v8;
  Boolean Value;
  CFPropertyListRef v10;
  const void *v11;
  CFTypeID v12;
  uint64_t result;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("/Library/Managed Preferences/mobile/.GlobalPreferences.plist"), kCFURLPOSIXPathStyle, 0);
  if (v1)
  {
    v2 = v1;
    v3 = CFReadStreamCreateWithFile(v0, v1);
    if (v3)
    {
      v4 = v3;
      if (CFReadStreamOpen(v3))
        v5 = (const __CFDictionary *)CFPropertyListCreateWithStream(v0, v4, 0, 0, 0, 0);
      else
        v5 = 0;
      CFRelease(v4);
    }
    else
    {
      v5 = 0;
    }
    CFRelease(v2);
  }
  else
  {
    v5 = 0;
  }
  v6 = (const __CFBoolean *)SSLPreferencesCopyValue(CFSTR("SSLDisableRecordSplitting"), v5);
  if (v6)
  {
    v7 = v6;
    v8 = CFGetTypeID(v6);
    if (v8 == CFBooleanGetTypeID())
      Value = CFBooleanGetValue(v7);
    else
      Value = 0;
    CFRelease(v7);
  }
  else
  {
    Value = 0;
  }
  kSSLDisableRecordSplittingDefaultValue = Value;
  kMinDhGroupSizeDefaultValue = (uint64_t)SSLPreferencesGetInteger(CFSTR("SSLMinDhGroupSize"), v5);
  kMinProtocolVersionDefaultValue = (uint64_t)SSLPreferencesGetInteger(CFSTR("SSLMinProtocolVersion"), v5);
  v10 = SSLPreferencesCopyValue(CFSTR("SSLSessionConfig"), v5);
  v11 = v10;
  if (v10)
  {
    v12 = CFGetTypeID(v10);
    if (v12 != CFStringGetTypeID())
    {
      CFRelease(v11);
      v11 = 0;
    }
  }
  kSSLSessionConfigDefaultValue = (uint64_t)v11;
  if (v5)
    CFRelease(v5);
  result = tls_cache_create();
  g_session_cache = result;
  return result;
}

@end
