@implementation ShowUserNotice

void ___ShowUserNotice_block_invoke(uint64_t a1)
{
  __CFUserNotification *v2;
  __CFUserNotification *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFOptionFlags v13;
  SInt32 error;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  SInt32 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  error = 0;
  v2 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 2uLL, &error, *(CFDictionaryRef *)(a1 + 32));
  if (v2)
  {
    v3 = v2;
    v13 = 0;
    if (CFUserNotificationReceiveResponse(v2, 0.0, &v13))
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v16 = "_ShowUserNotice_block_invoke";
        v17 = 2112;
        v18 = v5;
        v19 = 1024;
        v20 = error;
        v6 = "%s: Failed to recieve notification response for error presentation alert for app with bundle ID %@, error code %d";
        v7 = v4;
        v8 = 28;
LABEL_5:
        _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
    else
    {
      if (v13 != 2)
      {
        if (v13 == 1)
        {
          v11 = *(_QWORD *)(a1 + 56);
          if (!v11)
            goto LABEL_7;
        }
        else
        {
          if (v13)
            goto LABEL_7;
          v11 = *(_QWORD *)(a1 + 48);
          if (!v11)
            goto LABEL_7;
        }
        (*(void (**)(void))(v11 + 16))();
        goto LABEL_7;
      }
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        v16 = "_ShowUserNotice_block_invoke";
        v17 = 2112;
        v18 = v12;
        v6 = "%s: Received an invalid response (kCFUserNotificationOtherResponse) from the error presentation alert for a"
             "pp with bundleID %@";
        v7 = v4;
        v8 = 22;
        goto LABEL_5;
      }
    }

LABEL_7:
    CFRelease(v3);
    return;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v16 = "_ShowUserNotice_block_invoke";
    v17 = 2112;
    v18 = v10;
    v19 = 1024;
    v20 = error;
    _os_log_impl(&dword_1A4BF6000, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to create error presentation alert for app with bundle ID %@, error code %d", buf, 0x1Cu);
  }

}

@end
