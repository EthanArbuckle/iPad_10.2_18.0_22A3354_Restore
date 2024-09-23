@implementation AFAnalyticsContextCreateForCrossDeviceCommandHandled

const __CFString *__AFAnalyticsContextCreateForCrossDeviceCommandHandled_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  const __CFString *v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("iPhone")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("iPad")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("iPod")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("Watch")) & 1) != 0)
  {
    v3 = CFSTR("PersonalDevice");
  }
  else
  {
    v3 = CFSTR("AppleTV");
    if ((objc_msgSend(v2, "hasPrefix:", CFSTR("AppleTV")) & 1) == 0)
    {
      v3 = CFSTR("AudioAccessory");
      if ((objc_msgSend(v2, "hasPrefix:", CFSTR("AudioAccessory")) & 1) == 0)
      {
        v5 = AFSiriLogContextService;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextService, OS_LOG_TYPE_ERROR))
        {
          v6 = 136315394;
          v7 = "AFAnalyticsContextCreateForCrossDeviceCommandHandled_block_invoke";
          v8 = 2112;
          v9 = v2;
          _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s Unexpected product type for CrossDeviceCommandHandled metric: %@", (uint8_t *)&v6, 0x16u);
        }
        v3 = CFSTR("Unknown");
      }
    }
  }

  return v3;
}

@end
