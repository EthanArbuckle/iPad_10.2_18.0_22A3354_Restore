@implementation ComponentAudio

- (BOOL)isPresent
{
  __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  const __CFBoolean *CFProperty;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v2 = IOServiceMatching("AppleEmbeddedAudio");
  CFDictionarySetValue(v2, CFSTR("CodecUID"), CFSTR("Codec"));
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    v4 = MatchingService;
    CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("Ping"), kCFAllocatorDefault, 0);
    IOObjectRelease(v4);
    v6 = CFProperty == kCFBooleanTrue;
    if (CFProperty != kCFBooleanTrue)
    {
      v7 = DiagnosticLogHandleForCategory(6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Audio NOT found. Codec ping failed.", buf, 2u);
      }

    }
    if (CFProperty)
      CFRelease(CFProperty);
  }
  else
  {
    v9 = DiagnosticLogHandleForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Audio NOT found. Cannot find AppleEmbeddedAudio service.", v12, 2u);
    }

    return 0;
  }
  return v6;
}

@end
