@implementation CSIsVirtualMachine

void __CSIsVirtualMachine_block_invoke()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID())
      CSIsVirtualMachine_isVM = CFBooleanGetValue(v1) == 1;
    CFRelease(v1);
  }
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    if (CSIsVirtualMachine_isVM)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v5 = 136315394;
    v6 = "CSIsVirtualMachine_block_invoke";
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s isVirtualMachine ? %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

@end
