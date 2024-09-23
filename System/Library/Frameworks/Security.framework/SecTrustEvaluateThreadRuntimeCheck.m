@implementation SecTrustEvaluateThreadRuntimeCheck

dispatch_queue_t __SecTrustEvaluateThreadRuntimeCheck_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("Runtime Issue Logging", 0);
  SecTrustEvaluateThreadRuntimeCheck_runtimeLogQueue = (uint64_t)result;
  return result;
}

void __SecTrustEvaluateThreadRuntimeCheck_block_invoke_2()
{
  __CFBundle *MainBundle;
  __CFBundle *v1;
  const __CFURL *v2;
  const __CFURL *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *Identifier;
  double Current;
  NSObject *v8;
  uint8_t v9[8];
  uint64_t propertyValueTypeRefPtr;

  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    v1 = MainBundle;
    v2 = CFBundleCopyBundleURL(MainBundle);
    if (v2)
    {
      v3 = v2;
      v4 = CFURLCopyFileSystemPath(v2, kCFURLPOSIXPathStyle);
      if (v4)
      {
        v5 = v4;
        if (CFStringHasSuffix(v4, CFSTR(".app")))
        {
          Identifier = CFBundleGetIdentifier(v1);
          if (Identifier)
          {
            if (!CFStringHasPrefix(Identifier, CFSTR("com.apple.")))
            {
              propertyValueTypeRefPtr = 0;
              if (CFURLCopyResourcePropertyForKey(v3, (CFStringRef)*MEMORY[0x1E0C9B4D8], &propertyValueTypeRefPtr, 0))
              {
                if (propertyValueTypeRefPtr == *MEMORY[0x1E0C9AE50])
                {
                  if (checkmap_block_invoke_2_onceToken != -1)
                    dispatch_once(&checkmap_block_invoke_2_onceToken, &__block_literal_global_338);
                  Current = CFAbsoluteTimeGetCurrent();
                  if (Current >= *(double *)&checkmap_block_invoke_2_startTime)
                  {
                    v8 = checkmap_block_invoke_2_runtimeLog;
                    if (os_log_type_enabled((os_log_t)checkmap_block_invoke_2_runtimeLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)v9 = 0;
                      _os_log_fault_impl(&dword_18A900000, v8, OS_LOG_TYPE_FAULT, "__delegate_identifier__:Performance Diagnostics__:::____message__:This method should not be called on the main thread as it may lead to UI unresponsiveness.", v9, 2u);
                    }
                    ++checkmap_block_invoke_2_faultsSinceStartTime;
                    if (SecFrameworkIsRunningInXcode_envCheckOnce != -1)
                      dispatch_once(&SecFrameworkIsRunningInXcode_envCheckOnce, &__block_literal_global_710);
                    if ((SecFrameworkIsRunningInXcode_runningInXcode & 1) != 0
                      || (unint64_t)checkmap_block_invoke_2_faultsSinceStartTime < 0xB)
                    {
                      if (Current - *(double *)&checkmap_block_invoke_2_startTime > 60.0)
                      {
                        checkmap_block_invoke_2_startTime = *(_QWORD *)&Current;
                        checkmap_block_invoke_2_faultsSinceStartTime = 0;
                      }
                    }
                    else
                    {
                      *(double *)&checkmap_block_invoke_2_startTime = Current + 300.0;
                    }
                  }
                  else
                  {
                    checkmap_block_invoke_2_faultsSinceStartTime = 0;
                  }
                }
              }
            }
          }
        }
        CFRelease(v5);
      }
      CFRelease(v3);
    }
  }
}

os_log_t __SecTrustEvaluateThreadRuntimeCheck_block_invoke_3()
{
  os_log_t result;

  result = os_log_create("com.apple.runtime-issues", "Security");
  checkmap_block_invoke_2_runtimeLog = (uint64_t)result;
  return result;
}

@end
