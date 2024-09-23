id MDMAppManagementFilePath()
{
  if (MDMAppManagementFilePath_once != -1)
    dispatch_once(&MDMAppManagementFilePath_once, &__block_literal_global_54);
  return (id)MDMAppManagementFilePath_str;
}

id DMCSystemGroupContainerPathWithGroupIdentifier(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "UTF8String");
  v2 = (void *)container_system_group_path_for_identifier();
  v3 = *DMCLogObjects();
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v7 = v1;
      v8 = 2082;
      v9 = (uint64_t)v2;
      _os_log_impl(&dword_1A4951000, v3, OS_LOG_TYPE_DEFAULT, "Got system group container path from MCM for %{public}@: %{public}s", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v2, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    free(v2);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v7 = v1;
      v8 = 2048;
      v9 = 1;
      _os_log_impl(&dword_1A4951000, v3, OS_LOG_TYPE_ERROR, "Error getting system group container for %{public}@: %llu", buf, 0x16u);
    }
    v4 = 0;
  }

  return v4;
}

id MDMCloudConfigurationSetAsideDetailsFilePath()
{
  if (MDMCloudConfigurationSetAsideDetailsFilePath_once != -1)
    dispatch_once(&MDMCloudConfigurationSetAsideDetailsFilePath_once, &__block_literal_global_66_0);
  return (id)MDMCloudConfigurationSetAsideDetailsFilePath_str;
}

id MDMCloudConfigurationDetailsFilePath()
{
  if (MDMCloudConfigurationDetailsFilePath_once != -1)
    dispatch_once(&MDMCloudConfigurationDetailsFilePath_once, &__block_literal_global_63_0);
  return (id)MDMCloudConfigurationDetailsFilePath_str;
}

void sub_1A4952F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1A49532E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t *DMCLogObjects()
{
  if (DMCLogObjects_onceToken != -1)
    dispatch_once(&DMCLogObjects_onceToken, &__block_literal_global_11);
  return &DMCLogObjects__DMCLogObjects;
}

id MDMManagedNonStoreBooksDirectory()
{
  if (MDMManagedNonStoreBooksDirectory_once != -1)
    dispatch_once(&MDMManagedNonStoreBooksDirectory_once, &__block_literal_global_89);
  return (id)MDMManagedNonStoreBooksDirectory_str;
}

void AppleAccountLibrary()
{
  void *v0;

  if (!AppleAccountLibraryCore_frameworkLibrary)
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void sub_1A4953FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1A4954294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getAAQuotaInfoRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppleAccountLibrary();
  result = objc_getClass("AAQuotaInfoRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAAQuotaInfoRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAAQuotaInfoRequestClass_block_invoke_cold_1();
    return __getAAQuotaInfoResponseClass_block_invoke(v3);
  }
  return result;
}

Class __getAAQuotaInfoResponseClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppleAccountLibrary();
  result = objc_getClass("AAQuotaInfoResponse");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAAQuotaInfoResponseClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAAQuotaInfoResponseClass_block_invoke_cold_1();
    return (Class)__77__ACAccountStore_DeviceManagementClient__dmc_visibleRemoteManagementAccounts__block_invoke(v3);
  }
  return result;
}

void sub_1A4955E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1A495765C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1A495793C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4957D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

Class __getCDPUIControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreCDPUILibraryCore_frameworkLibrary)
  {
    CoreCDPUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreCDPUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CDPUIController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCDPUIControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getCDPUIControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A4958B38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void DMCActivationUtilitiesWaitingForReady()
{
  NSObject *v0;
  void *v1;
  void *v2;
  uint8_t v3[16];

  v0 = *DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A4951000, v0, OS_LOG_TYPE_INFO, "Activation state changed.", v3, 2u);
  }
  +[DMCActivationUtilities sharedInstance](DMCActivationUtilities, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_clearCache");

  +[DMCActivationUtilities sharedInstance](DMCActivationUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsReady:", 1);

}

void DMCActivationUtilitiesDeactivated()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  v0 = *DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A4951000, v0, OS_LOG_TYPE_INFO, "Device deactivated. Clearing activation record cache.", v2, 2u);
  }
  +[DMCActivationUtilities sharedInstance](DMCActivationUtilities, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_clearCache");

}

void sub_1A4959078(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A49591D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id syncQueue()
{
  if (syncQueue_onceToken != -1)
    dispatch_once(&syncQueue_onceToken, &__block_literal_global_1);
  return (id)syncQueue_queue;
}

id syncQueueAlertQueue()
{
  if (syncQueueAlertQueue_onceToken != -1)
    dispatch_once(&syncQueueAlertQueue_onceToken, &__block_literal_global_9);
  return (id)syncQueueAlertQueue_queue;
}

void syncQueueShowNextAlert()
{
  void *v0;
  void *v1;
  __int128 v2;
  const __CFAllocator *v3;
  const __CFString *v4;
  const __CFDictionary *v5;
  __CFUserNotification *v6;
  __CFUserNotification *v7;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  SInt32 v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  __CFRunLoop *Main;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  double v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  double v29;
  dispatch_time_t v30;
  void *v31;
  __int128 v32;
  _QWORD block[5];
  CFOptionFlags flags;
  SInt32 error;
  uint8_t buf[4];
  _QWORD v37[5];

  *(_QWORD *)((char *)&v37[3] + 4) = *MEMORY[0x1E0C80C00];
  if (!syncQueueCurrentAlert)
  {
    syncQueueAlertQueue();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "firstObject");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1)
    {
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v4 = (const __CFString *)*MEMORY[0x1E0C9B270];
      *(_QWORD *)&v2 = 134217984;
      v32 = v2;
      do
      {
        error = 0;
        flags = 0;
        objc_msgSend(v1, "notificationParametersOutFlags:", &flags, v32);
        v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v6 = CFUserNotificationCreate(v3, 0.0, flags, &error, v5);
        if (!v6)
        {
          v13 = *DMCLogObjects();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = error;
            v15 = v13;
            objc_msgSend(v1, "summary");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            LODWORD(v37[0]) = v14;
            WORD2(v37[0]) = 2114;
            *(_QWORD *)((char *)v37 + 6) = v16;
            _os_log_impl(&dword_1A4951000, v15, OS_LOG_TYPE_ERROR, "DMCAlertManager cannot create alert with error: %d. Alert: '%{public}@'", buf, 0x12u);

          }
          goto LABEL_21;
        }
        v7 = v6;
        RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v6, (CFUserNotificationCallBack)mainQueueAlertCallback, 0);
        if (RunLoopSource)
        {
          v9 = RunLoopSource;
          syncQueueAlertQueue();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "count");

          if (v11)
          {
            syncQueueAlertQueue();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "removeObjectAtIndex:", 0);

          }
          else
          {
            v20 = *DMCLogObjects();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A4951000, v20, OS_LOG_TYPE_ERROR, "DMCAlertManager missing alert in sync alert queue", buf, 2u);
            }
          }
          objc_storeStrong((id *)&syncQueueCurrentAlert, v1);
          objc_msgSend(v1, "setNotification:", v7);
          Main = CFRunLoopGetMain();
          CFRunLoopAddSource(Main, v9, v4);
          CFRelease(v9);
          v22 = *DMCLogObjects();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v22;
            objc_msgSend(v1, "summary");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v37[0] = v24;
            _os_log_impl(&dword_1A4951000, v23, OS_LOG_TYPE_DEFAULT, "Displaying alert: '%{public}@'", buf, 0xCu);

          }
          objc_msgSend(v1, "dismissAfterTimeInterval");
          if (v25 > 0.0)
          {
            v26 = *DMCLogObjects();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = v26;
              objc_msgSend(v1, "dismissAfterTimeInterval");
              *(_DWORD *)buf = v32;
              v37[0] = v28;
              _os_log_impl(&dword_1A4951000, v27, OS_LOG_TYPE_DEFAULT, "Scheduling automatic alert dismissal after %0.0f seconds.", buf, 0xCu);

            }
            CFRetain(v7);
            objc_msgSend(v1, "dismissAfterTimeInterval");
            v30 = dispatch_time(0, (uint64_t)(v29 * 1000000000.0));
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __syncQueueShowNextAlert_block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0l;
            block[4] = v7;
            dispatch_after(v30, MEMORY[0x1E0C80D38], block);
            goto LABEL_21;
          }
        }
        else
        {
          v17 = *DMCLogObjects();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = v17;
            objc_msgSend(v1, "summary");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v37[0] = v19;
            _os_log_impl(&dword_1A4951000, v18, OS_LOG_TYPE_ERROR, "DMCAlertManager cannot create run loop source to display alert: '%{public}@'", buf, 0xCu);

          }
        }
        CFRelease(v7);
LABEL_21:

        syncQueueAlertQueue();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v1 = (void *)objc_claimAutoreleasedReturnValue();

      }
      while (v1);
    }
  }
}

id syncQueueiTunesLoginCompletionBlocks()
{
  if (syncQueueiTunesLoginCompletionBlocks_onceToken != -1)
    dispatch_once(&syncQueueiTunesLoginCompletionBlocks_onceToken, &__block_literal_global_24);
  return (id)syncQueueiTunesLoginCompletionBlocks_blocks;
}

void __syncQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.devicemanagementclient.DMCAlertManager.syncQueue", 0);
  v1 = (void *)syncQueue_queue;
  syncQueue_queue = (uint64_t)v0;

}

void __syncQueueAlertQueue_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)syncQueueAlertQueue_queue;
  syncQueueAlertQueue_queue = v0;

}

void mainQueueAlertCallback(uint64_t a1, unint64_t a2)
{
  int v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  int v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v2 = a2;
  v10 = *MEMORY[0x1E0C80C00];
  if (a2 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown (%lu)"), a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = 5;
  }
  else
  {
    v3 = *(&off_1E4D36FB0 + a2);
  }
  v4 = *DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_DEFAULT, "DMCAlert dismissed with response: %{public}@", buf, 0xCu);
  }
  syncQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __mainQueueAlertCallback_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v7 = v2;
  dispatch_sync(v5, block);

}

void __syncQueueShowNextAlert_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = *DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A4951000, v2, OS_LOG_TYPE_DEFAULT, "Automatically dismissing alert.", v3, 2u);
  }
  CFUserNotificationCancel(*(CFUserNotificationRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __mainQueueAlertCallback_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  int v12;

  v2 = (id)syncQueueCurrentAlert;
  v3 = (void *)syncQueueCurrentAlert;
  syncQueueCurrentAlert = 0;

  objc_msgSend(v2, "completionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __mainQueueAlertCallback_block_invoke_2;
    v10[3] = &unk_1E4D36EE0;
    v11 = v2;
    v12 = *(_DWORD *)(a1 + 32);
    dispatch_async(v9, v10);

  }
  syncQueueShowNextAlert(v5, v6, v7, v8);

}

void __mainQueueAlertCallback_block_invoke_2(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(unsigned int *)(a1 + 40));

}

void __syncQueueiTunesLoginCompletionBlocks_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)syncQueueiTunesLoginCompletionBlocks_blocks;
  syncQueueiTunesLoginCompletionBlocks_blocks = v0;

}

void sub_1A495A7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAMSProcessInfoClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AMSProcessInfo");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAMSProcessInfoClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAMSProcessInfoClass_block_invoke_cold_1();
    AppleMediaServicesLibrary();
  }
}

void AppleMediaServicesLibrary()
{
  void *v0;

  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getAMSUserAgentClass_block_invoke(uint64_t a1)
{
  Class result;
  id v3;
  SEL v4;
  id *v5;

  AppleMediaServicesLibrary();
  result = objc_getClass("AMSUserAgent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAMSUserAgentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAMSUserAgentClass_block_invoke_cold_1();
    return (Class)+[DMCAuthKitUtilities midWithError:](v3, v4, v5);
  }
  return result;
}

uint64_t DMCHCUCreateCSR(void *a1)
{
  id v1;
  void *v2;
  const __CFAllocator *v3;
  const __CFDictionary *v4;
  CFDictionaryRef v5;
  __SecKey *RandomKey;
  SecKeyRef v7;
  BOOL v8;
  NSObject *v9;
  uint64_t CertificateRequestWithParameters;
  CFStringRef v11;
  CFTypeRef cf;
  int valuePtr;
  uint8_t *v15;
  uint64_t v16;
  uint8_t buf[8];
  char v18;
  CFStringRef v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uuid_t out;
  char cStr[40];
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)*MEMORY[0x1E0CD6A20];
  keys[0] = *(void **)MEMORY[0x1E0CD6A38];
  keys[1] = v2;
  values[0] = *(void **)MEMORY[0x1E0CD6A70];
  values[1] = CFSTR("1024");
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  valuePtr = 5;
  cf = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
  v5 = CFDictionaryCreate(v3, MEMORY[0x1E0CD6C90], &cf, 1, 0, 0);
  if (cf)
    CFRelease(cf);
  RandomKey = SecKeyCreateRandomKey(v4, 0);
  v7 = SecKeyCopyPublicKey(RandomKey);
  if (v4)
    CFRelease(v4);
  if (RandomKey)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = *DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v9, OS_LOG_TYPE_ERROR, "Could not create public/private key pair for CSR.", buf, 2u);
    }
    if (v5)
      CFRelease(v5);
    if (RandomKey)
      CFRelease(RandomKey);
    if (v7)
      CFRelease(v7);
    CertificateRequestWithParameters = 0;
  }
  else
  {
    memset(cStr, 0, 37);
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    uuid_unparse(out, cStr);
    v11 = CFStringCreateWithCString(v3, cStr, 0x600u);
    *(_QWORD *)buf = *MEMORY[0x1E0CD6F48];
    v18 = *MEMORY[0x1E0CD5E80];
    v19 = v11;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v15 = buf;
    v16 = 0;
    objc_msgSend(v1, "setObject:forKey:", v7, CFSTR("PublicKey"));
    objc_msgSend(v1, "setObject:forKey:", RandomKey, CFSTR("PrivateKey"));
    CertificateRequestWithParameters = SecGenerateCertificateRequestWithParameters();
    if (v5)
      CFRelease(v5);
    CFRelease(RandomKey);
    CFRelease(v7);
    if (v11)
      CFRelease(v11);
  }

  return CertificateRequestWithParameters;
}

id DMCHCUSetCertificateDataForMappedLabel(const __CFData *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  SecCertificateRef v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v7 = a2;
  v8 = a3;
  v9 = SecCertificateCreateWithData(0, a1);
  objc_msgSend(v8, "objectForKey:", CFSTR("PrivateKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (a1 && v10)
  {
    v12 = SecIdentityCreate();
    if (v12)
    {
      v13 = (const void *)v12;
      v14 = v7;
      if (v14)
      {
        +[DMCKeychain saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:](DMCKeychain, "saveItem:withLabel:group:useSystemKeychain:enforcePersonalPersona:", v13, v14, CFSTR("apple"), 1, a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          _persistentKeyMapTable();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v11, v14);
          v16 = v15;
          MTiPCUKeychainMapPath();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "DMCWriteToBinaryFile:", v17);

        }
      }
      else
      {
        v11 = 0;
      }

      CFRelease(v13);
    }
    else
    {
      v11 = 0;
    }
  }
  if (v9)
    CFRelease(v9);

  return v11;
}

SecCertificateRef DMCHCUCopyCertificateFromKeychainForMappedLabel(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  CFTypeID v4;
  CFTypeID v5;
  SecCertificateRef certificateRef;

  certificateRef = 0;
  v2 = _copyObjectFromKeychainForLabel(a1, a2);
  v3 = v2;
  if (v2)
  {
    v4 = CFGetTypeID(v2);
    if (v4 != SecCertificateGetTypeID())
    {
      v5 = CFGetTypeID(v3);
      if (v5 == SecIdentityGetTypeID())
      {
        SecIdentityCopyCertificate((SecIdentityRef)v3, &certificateRef);
        CFRelease(v3);
        return certificateRef;
      }
      else
      {
        CFRelease(v3);
        return 0;
      }
    }
  }
  return (SecCertificateRef)v3;
}

void *_copyObjectFromKeychainForLabel(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (!a1)
    return 0;
  v3 = a1;
  _persistentKeyMapTable();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = +[DMCKeychain copyItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:](DMCKeychain, "copyItemWithPersistentID:useSystemKeychain:enforcePersonalPersona:", v5, 1, a2);
  else
    v6 = 0;

  return v6;
}

void *DMCHCUCopyHostCertificateForMappedLabel(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "stringByAppendingString:", CFSTR("-HostCert"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _copyObjectFromKeychainForLabel(v3, a2);

  return v4;
}

id certificatesFromDERCertificateDataArray(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  SecCertificateRef v9;
  SecCertificateRef v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  NSObject *v15;
  uint8_t v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v3 = 0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v5)
    goto LABEL_15;
  v6 = v5;
  v7 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v19 != v7)
        objc_enumerationMutation(v4);
      v9 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((_QWORD *)&v18 + 1) + 8 * i));
      if (v9)
      {
        v10 = v9;
        objc_msgSend(v3, "addObject:", v9);

        v11 = *DMCLogObjects();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          continue;
        *(_WORD *)v17 = 0;
        v12 = v11;
        v13 = OS_LOG_TYPE_INFO;
        v14 = "SecCertificateCreateWithData succeed";
      }
      else
      {
        v15 = *DMCLogObjects();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          continue;
        *(_WORD *)v17 = 0;
        v12 = v15;
        v13 = OS_LOG_TYPE_ERROR;
        v14 = "Could not parse anchor certificate data. Ignoring.";
      }
      _os_log_impl(&dword_1A4951000, v12, v13, v14, v17, 2u);
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v6);
LABEL_15:

LABEL_17:
  return v3;
}

id _persistentKeyMapTable()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0C99E08];
  MTiPCUKeychainMapPath();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfFile:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

BOOL DMCCTHasTelephony()
{
  return +[DMCMobileGestalt hasTelephonyCapability](DMCMobileGestalt, "hasTelephonyCapability");
}

BOOL DMCCTHasCellular()
{
  return +[DMCMobileGestalt hasCellularDataCapability](DMCMobileGestalt, "hasCellularDataCapability");
}

id DMCCTIMEI()
{
  if (DMCCTIMEI_once != -1)
    dispatch_once(&DMCCTIMEI_once, &__block_literal_global_4);
  return (id)DMCCTIMEI_imei;
}

id _EquipmentInfo()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _CoreTelephonyClient();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _DataServiceSubscriptionContextFromClient(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v7 = 0;
    objc_msgSend(v0, "getMobileEquipmentInfoFor:error:", v1, &v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v7;
    if (v2)
    {
      v4 = v2;
    }
    else
    {
      v5 = *DMCLogObjects();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v9 = v3;
        _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_DEFAULT, "getMobileEquipmentInfoFor:error: failed: %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id DMCCTMEID()
{
  if (DMCCTMEID_once != -1)
    dispatch_once(&DMCCTMEID_once, &__block_literal_global_1_0);
  return (id)DMCCTMEID_meid;
}

uint64_t DMCCTSupportsVoiceRoaming()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  const __CFString *v10;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!+[DMCMobileGestalt hasTelephonyCapability](DMCMobileGestalt, "hasTelephonyCapability"))
  {
    v5 = 0;
    goto LABEL_13;
  }
  _CoreTelephonyClient();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _DataServiceSubscriptionContextFromClient(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1);
  v12 = 0;
  v3 = (void *)objc_msgSend(v0, "copyCarrierBundleValue:key:bundleType:error:", v1, CFSTR("ShowVoiceRoamingSwitch"), v2, &v12);
  v4 = (__CFString *)v12;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(v3, "BOOLValue");
      v6 = 1;
      goto LABEL_12;
    }
    v7 = *DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v4;
      v8 = "voice roaming switch value from carrier bundle is not a BOOLean, assuming NO: %{public}@";
      goto LABEL_10;
    }
  }
  else
  {
    v7 = *DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v4;
      v8 = "could not get voice roaming switch from carrier bundle, assuming NO: %{public}@";
LABEL_10:
      _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
    }
  }
  v6 = 0;
  v5 = 0;
LABEL_12:

  if (!v6)
    return 0;
LABEL_13:
  v9 = *DMCLogObjects();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = CFSTR("NO");
    if ((_DWORD)v5)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v14 = v10;
    _os_log_impl(&dword_1A4951000, v9, OS_LOG_TYPE_INFO, "device supports voice roaming: %{public}@", buf, 0xCu);
  }
  return v5;
}

id _CoreTelephonyClient()
{
  if (_CoreTelephonyClient_onceToken != -1)
    dispatch_once(&_CoreTelephonyClient_onceToken, &__block_literal_global_12);
  return (id)_CoreTelephonyClient_coreTelephonyClient;
}

id _DataServiceSubscriptionContextFromClient(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v18 = 0;
    objc_msgSend(v1, "getPreferredDataSubscriptionContextSync:", &v18);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v18;
    v5 = v4;
    if (!v3)
    {
      v14 = *DMCLogObjects();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v5;
        _os_log_impl(&dword_1A4951000, v14, OS_LOG_TYPE_DEFAULT, "getPreferredDataSubscriptionContextSync failed: %{public}@", buf, 0xCu);
      }
      v13 = 0;
      v7 = v5;
      goto LABEL_19;
    }
    v17 = v4;
    objc_msgSend(v2, "getSIMStatus:error:", v3, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;

    if (v6)
    {
      if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA77F8]))
      {
        v13 = v3;
        goto LABEL_18;
      }
      v8 = *DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "rejecting data SIM that isn't inserted";
        v10 = v8;
        v11 = 2;
LABEL_15:
        _os_log_impl(&dword_1A4951000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
    else
    {
      v15 = *DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v7;
        v9 = "getSIMStatus failed: %{public}@";
        v10 = v15;
        v11 = 12;
        goto LABEL_15;
      }
    }
    v13 = 0;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  v12 = *DMCLogObjects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_ERROR, "nil client passed to _DataServiceSubscriptionContextFromClient", buf, 2u);
  }
  v13 = 0;
LABEL_20:

  return v13;
}

BOOL DMCCTHasGSM()
{
  void *v0;
  _BOOL8 v1;

  DMCCTIMEI();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0 != 0;

  return v1;
}

BOOL DMCCTHasCDMA()
{
  void *v0;
  _BOOL8 v1;

  DMCCTMEID();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0 != 0;

  return v1;
}

BOOL DMCCTSetManagedCellularProfile(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t ManagedCellularProfile;
  _BOOL8 v14;

  v3 = a1;
  v4 = _CTServerConnectionCreate();
  if (v4)
  {
    v12 = (const void *)v4;
    ManagedCellularProfile = _CTServerConnectionLoadManagedCellularProfile();
    v14 = ManagedCellularProfile == 0;
    if (a2 && (_DWORD)ManagedCellularProfile)
    {
      errorFromCTError(ManagedCellularProfile);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v12);
  }
  else if (a2)
  {
    cannotConnectError(0, v5, v6, v7, v8, v9, v10, v11);
    v14 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id errorFromCTError(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a1 == 2)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D98];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(a1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    DMCErrorArray(CFSTR("MACH_ERROR_P_CODE_%@"), v11, v12, v13, v14, v15, v16, v17, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "DMCErrorWithDomain:code:descriptionArray:errorType:", v9, a1 >> 32, v18, CFSTR("DMCFatalError"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    return v19;
  }
  else if ((_DWORD)a1 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", strerror(SHIDWORD(a1)));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0CB2FE0];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, a1 >> 32, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    return 0;
  }
}

id cannotConnectError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  DMCErrorArray(CFSTR("CELLULAR_CANNOT_CONNECT"), a2, a3, a4, a5, a6, a7, a8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DMCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DMCCellularErrorDomain"), 36001, v9, CFSTR("DMCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL DMCCTClearManagedCellularProfile(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  _BOOL8 v12;

  v2 = _CTServerConnectionCreate();
  if (v2)
  {
    v10 = (const void *)v2;
    v11 = _CTServerConnectionUnloadManagedCellularProfile();
    v12 = v11 == 0;
    if (a1 && (_DWORD)v11)
    {
      errorFromCTError(v11);
      *a1 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v10);
  }
  else if (a1)
  {
    cannotConnectError(0, v3, v4, v5, v6, v7, v8, v9);
    v12 = 0;
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v12;
}

BOOL DMCCTGetManagedCellularProfile(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t ManagedCellularProfile;
  _BOOL8 v14;

  v4 = _CTServerConnectionCreate();
  if (v4)
  {
    v12 = (const void *)v4;
    ManagedCellularProfile = _CTServerConnectionGetManagedCellularProfile();
    if (a1)
      *a1 = objc_retainAutorelease(0);
    v14 = ManagedCellularProfile == 0;
    if (a2 && (_DWORD)ManagedCellularProfile)
    {
      errorFromCTError(ManagedCellularProfile);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v12);

  }
  else if (a2)
  {
    cannotConnectError(0, v5, v6, v7, v8, v9, v10, v11);
    v14 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v14;
}

uint64_t ___queue_verifyThresholdAndAddDateRecord_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  double v7;

  result = objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", a2);
  if (v7 <= 3.0
    && *(double *)(a1 + 48) <= (double)(unint64_t)++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
  }
  return result;
}

void ___scheduleCleanup_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id i;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = v2; objc_msgSend(v2, "count"); v2 = i)
  {
    objc_msgSend(i, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 48));

    if (v4 == 1)
      break;
    objc_msgSend(i, "removeObjectAtIndex:", 0);
  }

}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

id DMCLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _bundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("DMCLocalizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _bundle()
{
  if (_bundle_once != -1)
    dispatch_once(&_bundle_once, &__block_literal_global_6);
  return (id)_bundle_bundle;
}

id DMCLocalizedStringByDevice(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[DMCMobileGestalt deviceClass](DMCMobileGestalt, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  DMCLocalizedStringForDevice(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DMCLocalizedStringForDevice(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a2, "uppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%@"), v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    DMCLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v7))
    {
      DMCLocalizedString(v4);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v8;
    }
    v10 = v9;

  }
  else
  {
    DMCLocalizedString(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id DMCLocalizedFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a1;
  v11 = [v9 alloc];
  DMCLocalizedString(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithFormat:arguments:", v12, &a9);
  return v13;
}

id DMCUSEnglishString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _bundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:localization:", v1, 0, CFSTR("DMCLocalizable"), CFSTR("en"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id DMCErrorArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  id v9;
  void *v10;

  v9 = a1;
  v10 = (void *)objc_opt_new();
  _DMCStashFormattedStringInArray(v10, v9, 0, (uint64_t)&a9);
  _DMCStashFormattedStringInArray(v10, v9, 1, (uint64_t)&a9);

  _DMCStashArgumentsInArray(v10, &a9);
  return v10;
}

void _DMCStashFormattedStringInArray(void *a1, void *a2, int a3, uint64_t a4)
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a2;
  v8 = a1;
  v9 = [v6 alloc];
  if (a3)
  {
    DMCUSEnglishString(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    DMCUSEnglishLocale();
  }
  else
  {
    DMCLocalizedString(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithFormat:locale:arguments:", v10, v11, a4, a4, a4);
  objc_msgSend(v8, "addObject:", v12);

}

void _DMCStashArgumentsInArray(void *a1, id *a2)
{
  id v3;
  id v4;
  void *v5;
  id *v6;
  id v7;
  id *v8;
  id *v9;
  id *v10;

  v3 = a1;
  v10 = a2;
  v8 = a2 + 1;
  v4 = *a2;
  if (v4)
  {
    v5 = v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5, v8, v10);
      v6 = v9;
      v8 = v9 + 1;
      v7 = *v6;

      v5 = v7;
    }
    while (v7);
  }

}

id DMCUnformattedErrorArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = a1;
  DMCLocalizedString(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DMCUSEnglishString(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "arrayWithObjects:", v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _DMCStashArgumentsInArray(v13, &a9);
  return v13;
}

void ___bundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_bundle_bundle;
  _bundle_bundle = v0;

}

BOOL DMCFixPermissionOfSystemGroupContainerFileFM(void *a1, void *a2, int a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v30 = 0;
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v8, &v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v30;
  v11 = *MEMORY[0x1E0CB2AA8];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AA8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    v13 = 511;
  else
    v13 = 438;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToNumber:", v14) & 1) == 0)
  {
    v37 = v11;
    v38[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v10;
    objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v22, v8, &v29);
    v23 = v29;

    v10 = v23;
  }
  if (v10)
  {
    v35[0] = *MEMORY[0x1E0CB2D50];
    DMCLocalizedFormat(CFSTR("ERROR_FAILED_TO_FIX_PERMISSIONS_%@"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = *MEMORY[0x1E0CB3388];
    v36[0] = v24;
    v36[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DMCInternalErrorDomain"), 2, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *DMCLogObjects();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v8;
      v33 = 2114;
      v34 = v26;
      _os_log_impl(&dword_1A4951000, v27, OS_LOG_TYPE_ERROR, "Failed to fix permissions of file at path %{public}@. Error: %{public}@", buf, 0x16u);
    }
    if (a4)
      *a4 = objc_retainAutorelease(v26);

  }
  return v10 == 0;
}

BOOL DMCFixPermissionsOfSystemGroupContainerDirectoryAndContents(void *a1, _QWORD *a2)
{
  void *v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a1;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = DMCFixPermissionsOfSystemGroupContainerDirectoryAndContentsFM(v5, v4, a2);

  return v6;
}

BOOL DMCFixPermissionsOfSystemGroupContainerDirectoryAndContentsFM(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v30;
  id v31;
  char v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v32) && v32)
  {
    v31 = 0;
    v8 = DMCFixPermissionOfSystemGroupContainerFileFM(v5, v6, 1, &v31);
    v9 = v31;
    if (!v8)
      objc_msgSend(v7, "addObject:", v9);

    objc_msgSend(v5, "enumeratorAtPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1A85A3A78]();
    objc_msgSend(v10, "nextObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      do
      {
        objc_msgSend(v6, "stringByAppendingPathComponent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        buf[0] = 0;
        objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v14, buf);
        v30 = 0;
        v15 = DMCFixPermissionOfSystemGroupContainerFileFM(v5, v14, buf[0], &v30);
        v16 = v30;
        if (!v15)
          objc_msgSend(v7, "addObject:", v16);

        objc_autoreleasePoolPop(v11);
        v11 = (void *)MEMORY[0x1A85A3A78]();
        objc_msgSend(v10, "nextObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      while (v13);
    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    v17 = *DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v6;
      _os_log_impl(&dword_1A4951000, v17, OS_LOG_TYPE_ERROR, "Path %{public}@ does not refer to a directory.", buf, 0xCu);
    }
    v37 = *MEMORY[0x1E0CB2D50];
    DMCLocalizedFormat(CFSTR("ERROR_NOT_A_DIRECTORY_P_PATH_%@"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DMCInternalErrorDomain"), 1, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v26);

  }
  v27 = objc_msgSend(v7, "count");
  if (v27)
  {
    v28 = *DMCLogObjects();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v34 = v6;
      v35 = 2114;
      v36 = v7;
      _os_log_impl(&dword_1A4951000, v28, OS_LOG_TYPE_ERROR, "Failed to change ownership of directory and contents at %{public}@. Errors: %{public}@", buf, 0x16u);
    }
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }

  return v27 == 0;
}

uint64_t DMCSafelyCopyItemAtPathToDestinationPath(void *a1, void *a2, _QWORD *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a2;
  v7 = a1;
  objc_msgSend(v5, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = DMCSafelyCopyItemAtPathToDestinationPathFM(v8, v7, v6, a3);

  return v9;
}

uint64_t DMCSafelyCopyItemAtPathToDestinationPathFM(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  unsigned int v19;
  id v20;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  id v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  id v34;
  _QWORD *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if ((objc_msgSend(v7, "fileExistsAtPath:", v8) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v42 = v10;
      v43 = 2114;
      v44 = v11;
      _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_DEFAULT, "Moving %{public}@ to %{public}@...", buf, 0x16u);
    }
    v40 = 0;
    objc_msgSend(v7, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v11, 1, &v40);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v40;
    if (!v13)
    {
      v29 = *DMCLogObjects();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v10;
        _os_log_impl(&dword_1A4951000, v29, OS_LOG_TYPE_ERROR, "Failed to get temporary directory path for item %{public}@", buf, 0xCu);
      }
      v21 = 0;
      goto LABEL_35;
    }
    v35 = a4;
    objc_msgSend(v10, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v30 = *DMCLogObjects();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v10;
        _os_log_impl(&dword_1A4951000, v30, OS_LOG_TYPE_ERROR, "Failed to create temporary URL for moving item %{public}@", buf, 0xCu);
      }
      v21 = 0;
      goto LABEL_34;
    }
    v39 = v14;
    v17 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v10, v16, &v39);
    v18 = v39;

    if (!v17 || v18)
    {
      v31 = *DMCLogObjects();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v42 = v10;
        v43 = 2114;
        v44 = v16;
        v45 = 2114;
        v46 = v18;
        _os_log_impl(&dword_1A4951000, v31, OS_LOG_TYPE_ERROR, "Copying of item %{public}@ to temporary %{public}@ failed with error %{public}@", buf, 0x20u);
      }
      v21 = 0;
      v14 = v18;
      goto LABEL_34;
    }
    v37 = 0;
    v38 = 0;
    v19 = objc_msgSend(v7, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v11, v16, 0, 1, &v38, &v37);
    v34 = v38;
    v20 = v37;
    if (v20)
      v21 = 0;
    else
      v21 = v19;
    if ((v21 & 1) == 0)
    {
      v14 = v20;
      v32 = *DMCLogObjects();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v42 = v11;
        v43 = 2114;
        v44 = v16;
        v45 = 2114;
        v46 = v14;
        _os_log_impl(&dword_1A4951000, v32, OS_LOG_TYPE_ERROR, "Replacement of item %{public}@ with %{public}@ failed with error %{public}@", buf, 0x20u);
      }
      goto LABEL_33;
    }
    objc_msgSend(v16, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v7, "fileExistsAtPath:", v22);

    if (v23)
    {
      v36 = 0;
      v24 = objc_msgSend(v7, "removeItemAtURL:error:", v16, &v36);
      v25 = v36;
      v26 = v25;
      if (v24)
      {
        v14 = 0;
        if (!v25)
          goto LABEL_33;
      }
      v27 = *DMCLogObjects();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v42 = v16;
        v43 = 2114;
        v44 = v26;
        _os_log_impl(&dword_1A4951000, v27, OS_LOG_TYPE_ERROR, "Removal of temporary item %{public}@ failed with error %{public}@", buf, 0x16u);
      }

    }
    v14 = 0;
LABEL_33:

LABEL_34:
    a4 = v35;
LABEL_35:

    if (a4 && v14)
    {
      v14 = objc_retainAutorelease(v14);
      *a4 = v14;
    }
    goto LABEL_38;
  }
  v28 = *DMCLogObjects();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v42 = v8;
    _os_log_impl(&dword_1A4951000, v28, OS_LOG_TYPE_ERROR, "Item does not exist at %{public}@", buf, 0xCu);
  }
  v21 = 0;
  v14 = 0;
LABEL_38:

  return v21;
}

uint64_t DMCSetSkipBackupAttributeToItemAtPath(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "path"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "fileExistsAtPath:", v6),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v22 = 0;
    v8 = *MEMORY[0x1E0C999D8];
    v9 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v22, *MEMORY[0x1E0C999D8], 0);
    v10 = v22;
    v11 = v10;
    if ((_DWORD)v9 && objc_msgSend(v10, "BOOLValue") == (_DWORD)a2)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v13 = objc_msgSend(v4, "setResourceValue:forKey:error:", v12, v8, &v21);
      v14 = v21;

      if (!v13 || (v15 = 0, v14))
      {
        v16 = *DMCLogObjects();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = v16;
          objc_msgSend(v4, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v24 = v18;
          v25 = 2114;
          v26 = v14;
          _os_log_impl(&dword_1A4951000, v17, OS_LOG_TYPE_ERROR, "Error excluding %{public}@ from backup %{public}@", buf, 0x16u);

        }
        v15 = v14;
      }
    }

  }
  else
  {
    v19 = *DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v3;
      _os_log_impl(&dword_1A4951000, v19, OS_LOG_TYPE_ERROR, "Error excluding %{public}@ from backup. Path does not exist.", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

void sub_1A4963304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A4963804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4963960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DMCHTTPAuthStringWithAuthToken(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), CFSTR("Bearer"), a1);
}

id DMCIOModelPrefixString()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  void *CFProperty;
  void *v5;
  id v6;
  void *v7;

  v0 = *MEMORY[0x1E0CBBAA8];
  v1 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService
    && (v3 = MatchingService,
        CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("model-number"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0), IOObjectRelease(v3), CFProperty))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = objc_retainAutorelease(CFProperty);
    objc_msgSend(v5, "stringWithCString:encoding:", objc_msgSend(v6, "bytes"), 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

id DMCIOModelString()
{
  void *v0;
  void *v1;
  void *v2;

  DMCIOModelPrefixString();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    +[DMCMobileGestalt regionCode](DMCMobileGestalt, "regionCode");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v0, v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id DMCIOSerialString()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  void *CFProperty;

  v0 = *MEMORY[0x1E0CBBAA8];
  v1 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    v3 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IOPlatformSerialNumber"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    IOObjectRelease(v3);
  }
  else
  {
    CFProperty = 0;
  }
  return CFProperty;
}

id DMCIOBluetoothMAC()
{
  void *v0;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  const __CFData *v5;
  const __CFData *v6;
  UInt8 buffer[6];
  mach_port_t v8;
  CFRange v9;

  v8 = 0;
  if (!MEMORY[0x1A85A3514](0, &v8)
    && (v2 = IOServiceNameMatching("bluetooth")) != 0
    && (MatchingService = IOServiceGetMatchingService(v8, v2)) != 0)
  {
    v4 = MatchingService;
    v5 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IODeviceTree", CFSTR("local-mac-address"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1u);
    if (v5)
    {
      v6 = v5;
      v9.location = 0;
      v9.length = 6;
      CFDataGetBytes(v5, v9, buffer);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"), buffer[0], buffer[1], buffer[2], buffer[3], buffer[4], buffer[5]);
      v0 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v6);
    }
    else
    {
      v0 = 0;
    }
    IOObjectRelease(v4);
  }
  else
  {
    v0 = 0;
  }
  return v0;
}

void sub_1A4969814(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4969D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A496A08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1A496A994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A496AC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id URLForCanonicalFilePath(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  DMCSystemRootDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id DMCLKLogoutSupportClass()
{
  if (DMCLKLogoutSupportClass_onceToken != -1)
    dispatch_once(&DMCLKLogoutSupportClass_onceToken, &__block_literal_global_59);
  return (id)DMCLKLogoutSupportClass_LKLogoutSupportClass;
}

uint64_t DMCBYSetupAssistantNeedsToRun()
{
  +[DMCLazyInitializationUtilities initSetupAssistant](DMCLazyInitializationUtilities, "initSetupAssistant");
  return _BYSetupAssistantNeedsToRun();
}

id DMCBYSetupAssistantFinishedDarwinNotification()
{
  +[DMCLazyInitializationUtilities initSetupAssistant](DMCLazyInitializationUtilities, "initSetupAssistant");
  return (id)_BYSetupAssistantFinishedDarwinNotification;
}

uint64_t DMCSBUserNotificationDismissOnLock()
{
  +[DMCLazyInitializationUtilities initSpringBoardServices](DMCLazyInitializationUtilities, "initSpringBoardServices");
  return _SBUserNotificationDismissOnLock;
}

uint64_t DMCSBUserNotificationDontDismissOnUnlock()
{
  +[DMCLazyInitializationUtilities initSpringBoardServices](DMCLazyInitializationUtilities, "initSpringBoardServices");
  return _SBUserNotificationDontDismissOnUnlock;
}

id DMCUMUserManagerClass()
{
  if (DMCUMUserManagerClass_onceToken != -1)
    dispatch_once(&DMCUMUserManagerClass_onceToken, &__block_literal_global_63);
  return (id)DMCUMUserManagerClass_theClass;
}

id UserManagementBundle()
{
  if (UserManagementBundle_onceToken != -1)
    dispatch_once(&UserManagementBundle_onceToken, &__block_literal_global_104);
  return (id)UserManagementBundle_retval;
}

id DMCUMUserSwitchBlockingTaskClass()
{
  if (DMCUMUserSwitchBlockingTaskClass_onceToken != -1)
    dispatch_once(&DMCUMUserSwitchBlockingTaskClass_onceToken, &__block_literal_global_66);
  return (id)DMCUMUserSwitchBlockingTaskClass_theClass;
}

id DMCUMUserManagerErrorDomain()
{
  +[DMCLazyInitializationUtilities initUserManagement](DMCLazyInitializationUtilities, "initUserManagement");
  return (id)_UMUserManagerErrorDomain;
}

id DMCUMUserSessionProvisionTypeKey()
{
  +[DMCLazyInitializationUtilities initUserManagement](DMCLazyInitializationUtilities, "initUserManagement");
  return (id)_kUMUserSessionProvisionTypeKey;
}

id DMCUMUserSessionProvisionTypeEducation()
{
  +[DMCLazyInitializationUtilities initUserManagement](DMCLazyInitializationUtilities, "initUserManagement");
  return (id)_kUMUserSessionProvisionTypeEducation;
}

id DMCUMEducationUserSizeKey()
{
  +[DMCLazyInitializationUtilities initUserManagement](DMCLazyInitializationUtilities, "initUserManagement");
  return (id)_kUMEducationUserSizeKey;
}

id DMCAKAppleIDSession()
{
  if (DMCAKAppleIDSession_onceToken != -1)
    dispatch_once(&DMCAKAppleIDSession_onceToken, &__block_literal_global_69);
  return (id)DMCAKAppleIDSession_theClass;
}

id AuthKitBundle()
{
  if (AuthKitBundle_onceToken != -1)
    dispatch_once(&AuthKitBundle_onceToken, &__block_literal_global_106);
  return (id)AuthKitBundle_retval;
}

id DMCAKAuthenticationUsernameKey()
{
  +[DMCLazyInitializationUtilities initAuthKit](DMCLazyInitializationUtilities, "initAuthKit");
  return (id)_AKAuthenticationUsernameKey;
}

id DMCAKAuthenticationPasswordKey()
{
  +[DMCLazyInitializationUtilities initAuthKit](DMCLazyInitializationUtilities, "initAuthKit");
  return (id)_AKAuthenticationPasswordKey;
}

id DMCAKAuthenticationAlternateDSIDKey()
{
  +[DMCLazyInitializationUtilities initAuthKit](DMCLazyInitializationUtilities, "initAuthKit");
  return (id)_AKAuthenticationAlternateDSIDKey;
}

id DMCAKAuthenticationDSIDKey()
{
  +[DMCLazyInitializationUtilities initAuthKit](DMCLazyInitializationUtilities, "initAuthKit");
  return (id)_AKAuthenticationDSIDKey;
}

id DMCAKAuthenticationIDMSTokenKey()
{
  +[DMCLazyInitializationUtilities initAuthKit](DMCLazyInitializationUtilities, "initAuthKit");
  return (id)_AKAuthenticationIDMSTokenKey;
}

id DMCAKAnisetteProvisioningControllerClass()
{
  void *v0;
  void *v1;

  AuthKitBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "classNamed:", CFSTR("AKAnisetteProvisioningController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id DMCAIDAMutableServiceContextClass()
{
  void *v0;
  void *v1;

  AppleIDSSOAuthenticationBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "classNamed:", CFSTR("AIDAMutableServiceContext"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AppleIDSSOAuthenticationBundle()
{
  if (AppleIDSSOAuthenticationBundle_onceToken != -1)
    dispatch_once(&AppleIDSSOAuthenticationBundle_onceToken, &__block_literal_global_108);
  return (id)AppleIDSSOAuthenticationBundle_retval;
}

id DMCAIDAServiceOwnersManagerClass()
{
  void *v0;
  void *v1;

  AppleIDSSOAuthenticationBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "classNamed:", CFSTR("AIDAServiceOwnersManager"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id DMCAIDAServiceTypeCloud()
{
  +[DMCLazyInitializationUtilities initAppleIDSSOAuthentication](DMCLazyInitializationUtilities, "initAppleIDSSOAuthentication");
  return (id)_AIDAServiceTypeCloud;
}

id DMCAIDAServiceTypeMessages()
{
  +[DMCLazyInitializationUtilities initAppleIDSSOAuthentication](DMCLazyInitializationUtilities, "initAppleIDSSOAuthentication");
  return (id)_AIDAServiceTypeMessages;
}

id DMCAIDAServiceTypeFaceTime()
{
  +[DMCLazyInitializationUtilities initAppleIDSSOAuthentication](DMCLazyInitializationUtilities, "initAppleIDSSOAuthentication");
  return (id)_AIDAServiceTypeFaceTime;
}

id DMCAIDAServiceTypeStore()
{
  +[DMCLazyInitializationUtilities initAppleIDSSOAuthentication](DMCLazyInitializationUtilities, "initAppleIDSSOAuthentication");
  return (id)_AIDAServiceTypeStore;
}

id DMCAIDAServiceTypeGameCenter()
{
  +[DMCLazyInitializationUtilities initAppleIDSSOAuthentication](DMCLazyInitializationUtilities, "initAppleIDSSOAuthentication");
  return (id)_AIDAServiceTypeGameCenter;
}

uint64_t DMCAMSAuthenticateOptionsClass()
{
  if (AppleMediaServicesBundle_onceToken != -1)
    dispatch_once(&AppleMediaServicesBundle_onceToken, &__block_literal_global_110);
  return objc_msgSend((id)AppleMediaServicesBundle_retval, "classNamed:", CFSTR("AMSAuthenticateOptions"));
}

uint64_t DMCAMSUIAuthenticateTaskClass()
{
  if (AppleMediaServicesUIBundle_onceToken != -1)
    dispatch_once(&AppleMediaServicesUIBundle_onceToken, &__block_literal_global_112);
  return objc_msgSend((id)AppleMediaServicesUIBundle_retval, "classNamed:", CFSTR("AMSUIAuthenticateTask"));
}

id DMCkMAActivationStateActivated()
{
  +[DMCLazyInitializationUtilities initMobileActivation](DMCLazyInitializationUtilities, "initMobileActivation");
  return (id)_kMAActivationStateActivated;
}

id DMCkNotificationActivationStateChanged()
{
  +[DMCLazyInitializationUtilities initMobileActivation](DMCLazyInitializationUtilities, "initMobileActivation");
  return (id)_kNotificationActivationStateChanged;
}

uint64_t DMCMAEGetActivationStateWithError(uint64_t a1)
{
  +[DMCLazyInitializationUtilities initMobileActivation](DMCLazyInitializationUtilities, "initMobileActivation");
  return _MAEGetActivationStateWithError(a1);
}

uint64_t DMCMAECopyActivationRecordWithError(uint64_t a1)
{
  +[DMCLazyInitializationUtilities initMobileActivation](DMCLazyInitializationUtilities, "initMobileActivation");
  return _MAECopyActivationRecordWithError(a1);
}

BOOL DMCIsDeviceLocked()
{
  int v0;

  v0 = MKBGetDeviceLockState();
  return v0 != 3 && v0 != 0;
}

uint64_t DMCLockdownSetDeviceName(void *a1)
{
  id v1;
  uint64_t v2;
  int v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!objc_msgSend(v1, "length"))
  {
LABEL_6:
    v2 = 0;
    goto LABEL_7;
  }
  v2 = lockdown_connect();
  if (v2)
  {
    v3 = lockdown_set_value();
    lockdown_disconnect();
    if (!v3)
    {
      v2 = 1;
      goto LABEL_7;
    }
    v4 = *DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_ERROR, "Unable to set device name with error %d", (uint8_t *)v6, 8u);
    }
    goto LABEL_6;
  }
LABEL_7:

  return v2;
}

uint64_t DMCHasMDMMigrated()
{
  uint64_t v0;
  _QWORD block[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  char v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v6 = 0;
  if (migrationCheckQueue_onceToken != -1)
    dispatch_once(&migrationCheckQueue_onceToken, &__block_literal_global_12);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __DMCHasMDMMigrated_block_invoke;
  block[3] = &unk_1E4D36B88;
  block[4] = &v3;
  dispatch_sync((dispatch_queue_t)migrationCheckQueue_queue, block);
  v0 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v3, 8);
  return v0;
}

void __migrationCheckQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("DMC migration check queue", v2);
  v1 = (void *)migrationCheckQueue_queue;
  migrationCheckQueue_queue = (uint64_t)v0;

}

void sub_1A49724BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

uint64_t DMCDeviceIsNetworkTethered()
{
  const __SCPreferences *v0;
  const __SCPreferences *v1;
  const __SCNetworkSet *v2;
  const __SCNetworkSet *v3;
  const void *v4;
  uint64_t v5;
  __CFString *v6;
  NSObject *v7;
  SCNetworkServiceRef v8;
  SCNetworkServiceRef v9;
  __CFString *v10;
  SCNetworkInterfaceRef Interface;
  NSObject *v12;
  const __SCNetworkInterface *i;
  const __SCNetworkInterface *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  __CFString *IOInterfaceType;
  __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  __CFString *FamilyType;
  __CFString *v29;
  NSObject *v30;
  NSObject *v31;
  __CFString *FamilySubType;
  __CFString *v33;
  const __CFString *BSDName;
  NSObject *v35;
  _BOOL4 v36;
  CFStringRef NetworkInterfaceEntity;
  const __CFString *v38;
  const __SCDynamicStore *v39;
  const __SCDynamicStore *v40;
  const __CFDictionary *v41;
  NSObject *v42;
  _BOOL4 v43;
  const void *Value;
  const __SCDynamicStore *v45;
  NSObject *v46;
  NSObject *v47;
  const char *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  const __CFString *v52;
  SCNetworkProtocolRef v53;
  const __SCNetworkProtocol *v54;
  __CFString *v55;
  const __SCNetworkProtocol *v56;
  void *v57;
  NSObject *v58;
  const __CFArray *v59;
  NSObject *v60;
  __CFString *v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  int v65;
  const __CFString *NetworkServiceEntity;
  CFArrayRef v67;
  NSObject *v68;
  uint64_t j;
  const __CFString *v70;
  void *v71;
  const __CFArray *v72;
  NSObject *v73;
  NSObject *v74;
  const __SCNetworkProtocol *v75;
  const __SCNetworkProtocol *v76;
  const __SCDynamicStore *v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  const __SCNetworkProtocol *v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v88;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFArray *v93;
  const __SCNetworkSet *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const __CFString *v98;
  const __CFArray *v99;
  const __CFString *protocolType;
  const __SCNetworkProtocol *v101;
  uint64_t v102;
  uint64_t v103;
  __CFString *v104;
  const __SCDynamicStore *store;
  void *key;
  const void *v107;
  const __CFString *cf;
  CFDictionaryRef theDict;
  const __CFString *v110;
  const __CFString *domain;
  const __SCPreferences *v112;
  id obj;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint8_t v124[128];
  uint8_t buf[4];
  __CFString *v126;
  __int16 v127;
  void *v128;
  uint8_t v129[4];
  CFArrayRef v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v0 = SCPreferencesCreate(0, CFSTR("MCNetworkTetherUtilities"), 0);
  if (!v0)
    return 0;
  v1 = v0;
  v2 = SCNetworkSetCopyCurrent(v0);
  if (!v2)
  {
    v81 = DMCLogObjects()[5];
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v81, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: No network set!", buf, 2u);
    }
    v80 = 0;
    goto LABEL_131;
  }
  v3 = v2;
  SCNetworkSetGetServiceOrder(v2);
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
  if (!v115)
  {
    v80 = 0;
    goto LABEL_130;
  }
  v94 = v3;
  v114 = *(_QWORD *)v117;
  v4 = (const void *)*MEMORY[0x1E0CE8BB8];
  domain = (const __CFString *)*MEMORY[0x1E0CE8B30];
  v110 = (const __CFString *)*MEMORY[0x1E0CE8B90];
  v107 = (const void *)*MEMORY[0x1E0C9AE50];
  key = (void *)*MEMORY[0x1E0CE8D98];
  protocolType = (const __CFString *)*MEMORY[0x1E0CE8BF0];
  v95 = *MEMORY[0x1E0CE9108];
  v96 = *MEMORY[0x1E0CE8CD8];
  v91 = (const __CFString *)*MEMORY[0x1E0CE8B78];
  v92 = (const __CFString *)*MEMORY[0x1E0CE8B20];
  v98 = (const __CFString *)*MEMORY[0x1E0CE8BF8];
  v112 = v1;
LABEL_5:
  v5 = 0;
  while (1)
  {
    if (*(_QWORD *)v117 != v114)
      objc_enumerationMutation(obj);
    v6 = *(__CFString **)(*((_QWORD *)&v116 + 1) + 8 * v5);
    v7 = DMCLogObjects()[5];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v126 = v6;
      _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Checking service ID %{public}@", buf, 0xCu);
    }
    v8 = SCNetworkServiceCopy(v1, v6);
    if (v8)
      break;
    v16 = DMCLogObjects()[5];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v126 = v6;
      _os_log_impl(&dword_1A4951000, v16, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Cannot get service ref for service ID %{public}@", buf, 0xCu);
    }
LABEL_58:
    if (++v5 == v115)
    {
      v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
      v115 = v79;
      if (!v79)
      {
        v80 = 0;
        v3 = v94;
        goto LABEL_130;
      }
      goto LABEL_5;
    }
  }
  v9 = v8;
  v10 = v6;
  if (!SCNetworkServiceGetEnabled(v9))
  {
    v17 = DMCLogObjects()[5];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v126 = v10;
      v18 = v17;
      v19 = "DMCDeviceIsNetworkTethered: service ID %{public}@ is not enabled";
LABEL_56:
      _os_log_impl(&dword_1A4951000, v18, OS_LOG_TYPE_DEBUG, v19, buf, 0xCu);
    }
LABEL_57:

    CFRelease(v9);
    goto LABEL_58;
  }
  Interface = SCNetworkServiceGetInterface(v9);
  v12 = DMCLogObjects()[5];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v126 = (__CFString *)v9;
    _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_DEBUG, "_getBaseInterfaceForService(%{public}@)", buf, 0xCu);
  }
  for (i = Interface; ; i = v14)
  {
    v14 = Interface;
    v15 = DMCLogObjects()[5];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v126 = (__CFString *)v14;
      _os_log_impl(&dword_1A4951000, v15, OS_LOG_TYPE_DEBUG, "_getBaseInterfaceForService: Candidate interface %{public}@", buf, 0xCu);
    }
    if (!v14)
    {
      if (i)
        goto LABEL_30;
      v20 = DMCLogObjects()[5];
      v1 = v112;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        goto LABEL_57;
      *(_DWORD *)buf = 138543362;
      v126 = v10;
      v18 = v20;
      v19 = "DMCDeviceIsNetworkTethered: cannot get interface for service ID %{public}@";
      goto LABEL_56;
    }
    if (CFEqual(v14, v4))
      break;
    Interface = SCNetworkInterfaceGetInterface(v14);
  }
  v21 = DMCLogObjects()[5];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4951000, v21, OS_LOG_TYPE_DEBUG, "_getBaseInterfaceForService: Candidate interface is a good IPv4 interface", buf, 2u);
  }
  i = v14;
LABEL_30:
  v22 = DMCLogObjects()[5];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = v22;
    IOInterfaceType = (__CFString *)_SCNetworkInterfaceGetIOInterfaceType();
    *(_DWORD *)buf = 138543362;
    v126 = IOInterfaceType;
    v25 = IOInterfaceType;
    _os_log_impl(&dword_1A4951000, v23, OS_LOG_TYPE_DEBUG, "Interface type: %{public}@", buf, 0xCu);

  }
  v26 = DMCLogObjects()[5];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v27 = v26;
    FamilyType = (__CFString *)_SCNetworkInterfaceGetFamilyType();
    *(_DWORD *)buf = 138543362;
    v126 = FamilyType;
    v29 = FamilyType;
    _os_log_impl(&dword_1A4951000, v27, OS_LOG_TYPE_DEBUG, "Interface family: %{public}@", buf, 0xCu);

  }
  v30 = DMCLogObjects()[5];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v31 = v30;
    FamilySubType = (__CFString *)_SCNetworkInterfaceGetFamilySubType();
    *(_DWORD *)buf = 138543362;
    v126 = FamilySubType;
    v33 = FamilySubType;
    _os_log_impl(&dword_1A4951000, v31, OS_LOG_TYPE_DEBUG, "Interface family sub-type: %{public}@", buf, 0xCu);

  }
  if (objc_msgSend((id)_SCNetworkInterfaceGetIOInterfaceType(), "intValue") != 6)
  {
    v49 = DMCLogObjects()[5];
    v1 = v112;
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      goto LABEL_57;
    *(_DWORD *)buf = 138543362;
    v126 = v10;
    v18 = v49;
    v19 = "DMCDeviceIsNetworkTethered: service ID %{public}@ is not USB Ethernet";
    goto LABEL_56;
  }
  BSDName = SCNetworkInterfaceGetBSDName(i);
  v35 = DMCLogObjects()[5];
  v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
  if (!BSDName)
  {
    v1 = v112;
    if (!v36)
      goto LABEL_57;
    *(_DWORD *)buf = 138543362;
    v126 = v10;
    v18 = v35;
    v19 = "DMCDeviceIsNetworkTethered: could not get BSD name from service ID %{public}@";
    goto LABEL_56;
  }
  if (v36)
  {
    *(_DWORD *)buf = 138543618;
    v126 = v10;
    v127 = 2114;
    v128 = (void *)BSDName;
    _os_log_impl(&dword_1A4951000, v35, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: BSD name from service ID %{public}@ is: %{public}@", buf, 0x16u);
  }
  NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, domain, BSDName, v110);
  if (!NetworkInterfaceEntity)
  {
    v50 = DMCLogObjects()[5];
    v1 = v112;
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      goto LABEL_57;
    *(_DWORD *)buf = 138543362;
    v126 = v10;
    v18 = v50;
    v19 = "DMCDeviceIsNetworkTethered: could not network link from service ID %{public}@";
    goto LABEL_56;
  }
  v38 = NetworkInterfaceEntity;
  v39 = SCDynamicStoreCreate(0, CFSTR("MCNetworkTetherUtilities"), 0, 0);
  if (!v39)
  {
    v51 = DMCLogObjects()[5];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v51, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: could not create dynamic store!", buf, 2u);
    }
LABEL_62:
    v52 = v38;
LABEL_66:
    CFRelease(v52);

    goto LABEL_67;
  }
  v40 = v39;
  cf = v38;
  v41 = (const __CFDictionary *)SCDynamicStoreCopyValue(v39, v38);
  v42 = DMCLogObjects()[5];
  v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG);
  theDict = v41;
  if (!v41)
  {
    if (v43)
    {
      *(_DWORD *)buf = 138543362;
      v126 = v10;
      _os_log_impl(&dword_1A4951000, v42, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: could not get network link info from service ID %{public}@", buf, 0xCu);
    }
    CFRelease(v40);
    v52 = cf;
    goto LABEL_66;
  }
  if (v43)
  {
    *(_DWORD *)buf = 138543618;
    v126 = v10;
    v127 = 2114;
    v128 = v41;
    _os_log_impl(&dword_1A4951000, v42, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: service ID %{public}@ has netlink info: %{public}@", buf, 0x16u);
  }
  Value = CFDictionaryGetValue(v41, key);
  v38 = cf;
  if (v107 != Value)
  {
    v45 = v40;
    v46 = DMCLogObjects()[5];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v126 = v10;
      v47 = v46;
      v48 = "DMCDeviceIsNetworkTethered: netlink for service ID %{public}@ is not active";
      goto LABEL_48;
    }
    goto LABEL_49;
  }
  v53 = SCNetworkServiceCopyProtocol(v9, protocolType);
  if (!v53)
  {
    v45 = v40;
    v63 = DMCLogObjects()[5];
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v126 = v10;
      v47 = v63;
      v48 = "DMCDeviceIsNetworkTethered: could not get IPv4 info for service ID %{public}@";
LABEL_48:
      _os_log_impl(&dword_1A4951000, v47, OS_LOG_TYPE_DEBUG, v48, buf, 0xCu);
    }
LABEL_49:
    CFRelease(theDict);
    CFRelease(v45);
    goto LABEL_62;
  }
  v54 = v53;
  store = v40;
  v55 = v10;
  SCNetworkProtocolGetConfiguration(v54);
  v56 = v54;
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v56;
  if (!v57 || !SCNetworkProtocolGetEnabled(v56))
  {
    v62 = DMCLogObjects()[5];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v129 = 0;
      _os_log_impl(&dword_1A4951000, v62, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Unable to get IPv4 info and/or it's disabled", v129, 2u);
    }

    v61 = v55;
    goto LABEL_105;
  }
  v58 = DMCLogObjects()[5];
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v129 = 138543362;
    v130 = (CFArrayRef)v57;
    _os_log_impl(&dword_1A4951000, v58, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: IPv4 info: %{public}@", v129, 0xCu);
  }
  v97 = v57;
  objc_msgSend(v57, "objectForKey:", v96, v90);
  v59 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v60 = DMCLogObjects()[5];
  v61 = v55;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v129 = 138543362;
    v130 = v59;
    _os_log_impl(&dword_1A4951000, v60, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: IPv4 config method: %{public}@", v129, 0xCu);
  }
  if (!-[__CFArray isEqualToString:](v59, "isEqualToString:", v95))
  {
    v64 = _isIPv4ConfigMethodAutomatic_onceToken;
    v93 = v59;
    if (v64 != -1)
      dispatch_once(&_isIPv4ConfigMethodAutomatic_onceToken, &__block_literal_global_15);
    v65 = objc_msgSend((id)_isIPv4ConfigMethodAutomatic_ipv4DynamicConfigMethods, "containsObject:", v93);

    if (v65)
    {
      NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, domain, v92, v91);
      if (NetworkServiceEntity)
      {
        v104 = v55;
        v90 = NetworkServiceEntity;
        v67 = SCDynamicStoreCopyKeyList(store, NetworkServiceEntity);
        v68 = DMCLogObjects()[5];
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v129 = 138543362;
          v130 = v67;
          _os_log_impl(&dword_1A4951000, v68, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv4 keys: %{public}@", v129, 0xCu);
        }
        v122 = 0u;
        v123 = 0u;
        v120 = 0u;
        v121 = 0u;
        v99 = v67;
        v103 = -[__CFArray countByEnumeratingWithState:objects:count:](v99, "countByEnumeratingWithState:objects:count:", &v120, buf, 16);
        if (v103)
        {
          v102 = *(_QWORD *)v121;
          while (2)
          {
            for (j = 0; j != v103; ++j)
            {
              if (*(_QWORD *)v121 != v102)
                objc_enumerationMutation(v99);
              v70 = *(const __CFString **)(*((_QWORD *)&v120 + 1) + 8 * j);
              _serviceIDFromDynamicStoreKey((uint64_t)v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v71, "isEqualToString:", v104))
              {
                v72 = (const __CFArray *)SCDynamicStoreCopyValue(store, v70);
                v73 = DMCLogObjects()[5];
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v129 = 138543362;
                  v130 = v72;
                  _os_log_impl(&dword_1A4951000, v73, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv4 service dict: %{public}@", v129, 0xCu);
                }
                if (_isIPv4ConfigInfoUseful(v72))
                {
                  v82 = DMCLogObjects()[5];
                  v3 = v94;
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)v129 = 0;
                    _os_log_impl(&dword_1A4951000, v82, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got useful dynamic IPv4 config!", v129, 2u);
                  }

                  CFRelease(v90);
                  v61 = v104;

                  goto LABEL_122;
                }

              }
            }
            v103 = -[__CFArray countByEnumeratingWithState:objects:count:](v99, "countByEnumeratingWithState:objects:count:", &v120, buf, 16, v90);
            if (v103)
              continue;
            break;
          }
        }

        CFRelease(v90);
        v61 = v104;
        goto LABEL_105;
      }
      v74 = DMCLogObjects()[5];
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v129 = 0;
        _os_log_impl(&dword_1A4951000, v74, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Unable to create network service entry", v129, 2u);
      }
    }
    goto LABEL_104;
  }
  if (!_isIPv4ConfigInfoUseful(v97))
  {
LABEL_104:

LABEL_105:
    v75 = SCNetworkServiceCopyProtocol(v9, v98);
    if (v75)
    {
      v76 = v75;
      if (_isUsefulIPv6Protocol(v75, store, v61))
      {
        v85 = DMCLogObjects()[5];
        v3 = v94;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v126 = v61;
          _os_log_impl(&dword_1A4951000, v85, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: got useful IPv6 info for service ID %{public}@!", buf, 0xCu);
        }
        CFRelease(v76);
        v84 = v101;
        goto LABEL_127;
      }
      CFRelease(v76);
      CFRelease(v101);
      CFRelease(theDict);
      v77 = store;
    }
    else
    {
      v78 = DMCLogObjects()[5];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v126 = v61;
        _os_log_impl(&dword_1A4951000, v78, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: could not get IPv6 info for service ID %{public}@", buf, 0xCu);
      }
      CFRelease(v101);
      CFRelease(theDict);
      v77 = store;
    }
    CFRelease(v77);
    CFRelease(cf);

LABEL_67:
    CFRelease(v9);
    v1 = v112;
    goto LABEL_58;
  }
  v88 = DMCLogObjects()[5];
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v129 = 0;
    _os_log_impl(&dword_1A4951000, v88, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got useful manual config of IPv4!", v129, 2u);
  }

  v3 = v94;
LABEL_122:
  v83 = DMCLogObjects()[5];
  v84 = v101;
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v126 = v61;
    _os_log_impl(&dword_1A4951000, v83, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: got useful IPv4 info for service ID %{public}@!", buf, 0xCu);
  }
LABEL_127:
  CFRelease(v84);
  CFRelease(theDict);
  CFRelease(store);
  CFRelease(cf);

  CFRelease(v9);
  v86 = DMCLogObjects()[5];
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v126 = v61;
    _os_log_impl(&dword_1A4951000, v86, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Found tethered Ethernet at Service ID %{public}@!!", buf, 0xCu);
  }
  v80 = 1;
  v1 = v112;
LABEL_130:

  CFRelease(v3);
LABEL_131:
  CFRelease(v1);
  return v80;
}

BOOL _isIPv4ConfigInfoUseful(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0CE8CC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0CE8D18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = DMCLogObjects()[5];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v2;
    _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv4 addresses: %{public}@", buf, 0xCu);
  }
  v5 = DMCLogObjects()[5];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v3;
    _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv4 netmasks: %{public}@", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___isIPv4ConfigInfoUseful_block_invoke;
  v9[3] = &unk_1E4D379D0;
  v6 = v3;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v9);
  v7 = *((_BYTE *)v13 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_1A497399C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___isIPv4ConfigInfoUseful_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (objc_msgSend(v9, "length") && objc_msgSend(v8, "length"))
  {
    HIDWORD(v12[0]) = 0;
    v12[1] = 0;
    v10 = objc_retainAutorelease(v9);
    if (inet_pton(2, (const char *)objc_msgSend(v10, "UTF8String"), (char *)v12 + 4) >= 1
      && BYTE4(v12[0])
      && BYTE4(v12[0]) != 127)
    {
      v11 = WORD2(v12[0]);

      if (v11 != 65193)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
    else
    {

    }
  }
  else
  {

  }
}

BOOL _isIPv6ConfigInfoUseful(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0CE8D28]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0CE8D50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = DMCLogObjects()[5];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v2;
    _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv6 addresses: %{public}@", buf, 0xCu);
  }
  v5 = DMCLogObjects()[5];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v3;
    _os_log_impl(&dword_1A4951000, v5, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv6 netmasks: %{public}@", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___isIPv6ConfigInfoUseful_block_invoke;
  v9[3] = &unk_1E4D379D0;
  v6 = v3;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v9);
  v7 = *((_BYTE *)v13 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_1A4973CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___isIPv6ConfigInfoUseful_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  int v13;
  __int128 v14;
  int v15;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = objc_msgSend(v9, "length");
  if (v8)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v14 = 0uLL;
    v15 = 0;
    v12 = objc_retainAutorelease(v9);
    if (inet_pton(30, (const char *)objc_msgSend(v12, "UTF8String", 0), &v14) >= 1)
    {
      if ((_DWORD)v14)
      {
        if (v14 == 254)
        {
          v13 = v14 & 0xC000;

          if (v13 == 0x8000)
            goto LABEL_17;
          goto LABEL_15;
        }
LABEL_14:

LABEL_15:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
        goto LABEL_17;
      }
      if (*(_QWORD *)((char *)&v14 + 4) || (HIDWORD(v14) & 0xFEFFFFFF) != 0)
        goto LABEL_14;
    }

    goto LABEL_17;
  }

LABEL_17:
}

BOOL _isUsefulIPv6Protocol(const __SCNetworkProtocol *a1, const __SCDynamicStore *a2, void *a3)
{
  id v5;
  const __CFArray *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  NSObject *v12;
  _BOOL8 v13;
  const __CFString *NetworkServiceEntity;
  CFArrayRef v15;
  NSObject *v16;
  const __CFArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __CFString *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  CFArrayRef v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SCNetworkProtocolGetConfiguration(a1);
  v6 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (v6 && SCNetworkProtocolGetEnabled(a1))
  {
    v7 = DMCLogObjects()[5];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v6;
      _os_log_impl(&dword_1A4951000, v7, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv6 info: %{public}@", buf, 0xCu);
    }
    -[__CFArray objectForKey:](v6, "objectForKey:", *MEMORY[0x1E0CE8D30]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CE9128]))
    {
      if (_isIPv6ConfigInfoUseful(v6))
      {
        v9 = DMCLogObjects()[5];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4951000, v9, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got useful IPv6 manual config!", buf, 2u);
        }
        v10 = 0;
        v11 = 1;
        goto LABEL_37;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CE9118]))
    {
      NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B20], (CFStringRef)*MEMORY[0x1E0CE8B80]);
      if (NetworkServiceEntity)
      {
        v10 = NetworkServiceEntity;
        v15 = SCDynamicStoreCopyKeyList(a2, NetworkServiceEntity);
        v16 = DMCLogObjects()[5];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v34 = v15;
          _os_log_impl(&dword_1A4951000, v16, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got IPv6 keys: %{public}@", buf, 0xCu);
        }
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v17 = v15;
        v18 = -[__CFArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v18)
        {
          v19 = v18;
          v27 = v8;
          v20 = *(_QWORD *)v29;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v29 != v20)
                objc_enumerationMutation(v17);
              _serviceIDFromDynamicStoreKey(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
              v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (-[__CFString isEqualToString:](v22, "isEqualToString:", v5))
              {
                v23 = (void *)SCDynamicStoreCopyValue(a2, v22);
                if (_isIPv6ConfigInfoUseful(v23))
                {
                  v25 = DMCLogObjects()[5];
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1A4951000, v25, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Got useful dynamic IPv6 config!", buf, 2u);
                  }

                  v11 = 1;
                  goto LABEL_34;
                }

              }
            }
            v19 = -[__CFArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            if (v19)
              continue;
            break;
          }
          v11 = 0;
LABEL_34:
          v8 = v27;
        }
        else
        {
          v11 = 0;
        }

        goto LABEL_37;
      }
      v24 = DMCLogObjects()[5];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4951000, v24, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Unable to create network service entry", buf, 2u);
      }
    }
    v10 = 0;
    v11 = 0;
LABEL_37:

    v13 = v11 != 0;
    if (v10)
      CFRelease(v10);
    goto LABEL_39;
  }
  v12 = DMCLogObjects()[5];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4951000, v12, OS_LOG_TYPE_DEBUG, "DMCDeviceIsNetworkTethered: Unable to get IPv6 info and/or it's disabled", buf, 2u);
  }

  v13 = 0;
LABEL_39:

  return v13;
}

id _serviceIDFromDynamicStoreKey(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  char v4;
  id v5;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (objc_msgSend(v1, "scanUpToString:intoString:", CFSTR("/Network/Service/"), 0))
  {
    v3 = 0;
    if (objc_msgSend(v1, "scanString:intoString:", CFSTR("/Network/Service/"), 0))
    {
      v7 = 0;
      v4 = objc_msgSend(v1, "scanUpToCharactersFromSet:intoString:", v2, &v7);
      v5 = v7;
      v3 = v5;
      if ((v4 & 1) == 0)
      {

        v3 = 0;
      }
    }
  }

  return v3;
}

void ___isIPv4ConfigMethodAutomatic_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CE9100];
  v6[0] = *MEMORY[0x1E0CE90F8];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0CE9110];
  v6[2] = *MEMORY[0x1E0CE90F0];
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_isIPv4ConfigMethodAutomatic_ipv4DynamicConfigMethods;
  _isIPv4ConfigMethodAutomatic_ipv4DynamicConfigMethods = v4;

}

uint64_t DMCSendSettingsChangedNotification()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = *DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A4951000, v0, OS_LOG_TYPE_DEFAULT, "Sending settings changed notification.", v2, 2u);
  }
  return notify_post((const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.settingschanged"), "cStringUsingEncoding:", 4));
}

uint64_t DMCSendUserSettingsChangedNotification()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = *DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A4951000, v0, OS_LOG_TYPE_DEFAULT, "Sending user settings changed notification.", v2, 2u);
  }
  return notify_post((const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.usersettingschanged"), "cStringUsingEncoding:", 4));
}

uint64_t DMCSendUPPTrustFailedNotification()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = *DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A4951000, v0, OS_LOG_TYPE_DEFAULT, "Sending UPP trust failed notification.", v2, 2u);
  }
  return notify_post((const char *)objc_msgSend(CFSTR("com.apple.devicemanagementclient.uppTrustFailed"), "cStringUsingEncoding:", 4));
}

uint64_t DMCSendUPPVerificationOfflineNotification()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = *DMCLogObjects();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A4951000, v0, OS_LOG_TYPE_DEFAULT, "Sending UPP verification offline notification.", v2, 2u);
  }
  return notify_post((const char *)objc_msgSend(CFSTR("com.apple.devicemanagementclient.uppVerificationOffline"), "cStringUsingEncoding:", 4));
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

const __CFString *DMCSystemRootDirectory()
{
  return CFSTR("/");
}

id DMCSystemContainerPathWithBundleIdentifier(void *a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v1 = (void *)container_system_path_for_identifier();
  v2 = *DMCLogObjects();
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v6 = (uint64_t)v1;
      _os_log_impl(&dword_1A4951000, v2, OS_LOG_TYPE_DEFAULT, "Got system container path from MCM: %{public}s", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v1, 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    free(v1);
    return v3;
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v6 = 1;
      _os_log_impl(&dword_1A4951000, v2, OS_LOG_TYPE_ERROR, "Error getting system container: %llu", buf, 0xCu);
    }
    return 0;
  }
}

id MCSystemMetadataFilePath()
{
  if (MCSystemMetadataFilePath_once != -1)
    dispatch_once(&MCSystemMetadataFilePath_once, &__block_literal_global_16);
  return (id)MCSystemMetadataFilePath_str;
}

id MCUserMetadataFilePath()
{
  if (MCUserMetadataFilePath_once != -1)
    dispatch_once(&MCUserMetadataFilePath_once, &__block_literal_global_4_0);
  return (id)MCUserMetadataFilePath_str;
}

id MCLegacyMetadataFilePath()
{
  if (MCLegacyMetadataFilePath_once != -1)
    dispatch_once(&MCLegacyMetadataFilePath_once, &__block_literal_global_5);
  return (id)MCLegacyMetadataFilePath_str;
}

id DMCConfigurationProfilesSystemGroupContainerMetadataFilePath()
{
  if (DMCConfigurationProfilesSystemGroupContainerMetadataFilePath_once != -1)
    dispatch_once(&DMCConfigurationProfilesSystemGroupContainerMetadataFilePath_once, &__block_literal_global_6);
  return (id)DMCConfigurationProfilesSystemGroupContainerMetadataFilePath_str;
}

id MCConfigurationProfilesSystemGroupContainer()
{
  if (MCConfigurationProfilesSystemGroupContainer_onceToken != -1)
    dispatch_once(&MCConfigurationProfilesSystemGroupContainer_onceToken, &__block_literal_global_119);
  return (id)MCConfigurationProfilesSystemGroupContainer_systemGroupContainerPath;
}

id DMCMultiUserDeviceConfigurationFilePath()
{
  if (DMCMultiUserDeviceConfigurationFilePath_once != -1)
    dispatch_once(&DMCMultiUserDeviceConfigurationFilePath_once, &__block_literal_global_9_0);
  return (id)DMCMultiUserDeviceConfigurationFilePath_str;
}

id DMCMultiUserUserConfigurationFilePath()
{
  if (DMCMultiUserUserConfigurationFilePath_once != -1)
    dispatch_once(&DMCMultiUserUserConfigurationFilePath_once, &__block_literal_global_12_0);
  return (id)DMCMultiUserUserConfigurationFilePath_str;
}

id DMCHangTracerDirectory()
{
  if (DMCHangTracerDirectory_once != -1)
    dispatch_once(&DMCHangTracerDirectory_once, &__block_literal_global_15);
  return (id)DMCHangTracerDirectory_str;
}

id DMCLoggingDirectory()
{
  if (DMCLoggingDirectory_once != -1)
    dispatch_once(&DMCLoggingDirectory_once, &__block_literal_global_18);
  return (id)DMCLoggingDirectory_str;
}

id DMCEventsFilePath()
{
  if (DMCEventsFilePath_once != -1)
    dispatch_once(&DMCEventsFilePath_once, &__block_literal_global_21);
  return (id)DMCEventsFilePath_str;
}

uint64_t DMCDiskManagementDirectory()
{
  return 0;
}

id DMCDiskRestrictionFilePath()
{
  if (DMCDiskRestrictionFilePath_once != -1)
    dispatch_once(&DMCDiskRestrictionFilePath_once, &__block_literal_global_24_0);
  return (id)DMCDiskRestrictionFilePath_str;
}

id DMCManagedEventsDaemonKeepAliveFilePath()
{
  if (DMCManagedEventsDaemonKeepAliveFilePath_once != -1)
    dispatch_once(&DMCManagedEventsDaemonKeepAliveFilePath_once, &__block_literal_global_27);
  return (id)DMCManagedEventsDaemonKeepAliveFilePath_str;
}

id DMCDeviceManagementDaemonSetupOptionDirectoryPath()
{
  if (DMCDeviceManagementDaemonSetupOptionDirectoryPath_once != -1)
    dispatch_once(&DMCDeviceManagementDaemonSetupOptionDirectoryPath_once, &__block_literal_global_30);
  return (id)DMCDeviceManagementDaemonSetupOptionDirectoryPath_str;
}

id MTiPCUKeychainMapPath()
{
  if (MTiPCUKeychainMapPath_once != -1)
    dispatch_once(&MTiPCUKeychainMapPath_once, &__block_literal_global_33);
  return (id)MTiPCUKeychainMapPath_str;
}

id DMCSystemLostModeRequestPath()
{
  if (DMCSystemLostModeRequestPath_once != -1)
    dispatch_once(&DMCSystemLostModeRequestPath_once, &__block_literal_global_36);
  return (id)DMCSystemLostModeRequestPath_str;
}

id MDMFilePath()
{
  if (MDMFilePath_once != -1)
    dispatch_once(&MDMFilePath_once, &__block_literal_global_39);
  return (id)MDMFilePath_str;
}

id MDMUserFilePath()
{
  if (MDMUserFilePath_once != -1)
    dispatch_once(&MDMUserFilePath_once, &__block_literal_global_42);
  return (id)MDMUserFilePath_str;
}

id MDMPropertiesFilePath()
{
  if (MDMPropertiesFilePath_once != -1)
    dispatch_once(&MDMPropertiesFilePath_once, &__block_literal_global_43);
  return (id)MDMPropertiesFilePath_str;
}

id MDMPropertiesUserFilePath()
{
  if (MDMPropertiesUserFilePath_once != -1)
    dispatch_once(&MDMPropertiesUserFilePath_once, &__block_literal_global_46);
  return (id)MDMPropertiesUserFilePath_str;
}

id MDMOutstandingActivitiesFilePath()
{
  if (MDMOutstandingActivitiesFilePath_once != -1)
    dispatch_once(&MDMOutstandingActivitiesFilePath_once, &__block_literal_global_47);
  return (id)MDMOutstandingActivitiesFilePath_str;
}

id MDMDEPTokenSyncActivitiesFilePath()
{
  if (MDMDEPTokenSyncActivitiesFilePath_once != -1)
    dispatch_once(&MDMDEPTokenSyncActivitiesFilePath_once, &__block_literal_global_50);
  return (id)MDMDEPTokenSyncActivitiesFilePath_str;
}

id MDMUserOutstandingActivitiesFilePath()
{
  if (MDMUserOutstandingActivitiesFilePath_once != -1)
    dispatch_once(&MDMUserOutstandingActivitiesFilePath_once, &__block_literal_global_53);
  return (id)MDMUserOutstandingActivitiesFilePath_str;
}

id MDMEventsFilePath()
{
  if (MDMEventsFilePath_once != -1)
    dispatch_once(&MDMEventsFilePath_once, &__block_literal_global_57);
  return (id)MDMEventsFilePath_str;
}

id MDMDirtyEnrollmentStateFilePath()
{
  if (MDMDirtyEnrollmentStateFilePath_once != -1)
    dispatch_once(&MDMDirtyEnrollmentStateFilePath_once, &__block_literal_global_60);
  return (id)MDMDirtyEnrollmentStateFilePath_str;
}

id MDMPostSetupAutoInstallProfilePath()
{
  if (MDMPostSetupAutoInstallProfilePath_once != -1)
    dispatch_once(&MDMPostSetupAutoInstallProfilePath_once, &__block_literal_global_69_0);
  return (id)MDMPostSetupAutoInstallProfilePath_str;
}

id MDMPostSetupAutoInstallSetAsideProfilePath()
{
  if (MDMPostSetupAutoInstallSetAsideProfilePath_once != -1)
    dispatch_once(&MDMPostSetupAutoInstallSetAsideProfilePath_once, &__block_literal_global_72);
  return (id)MDMPostSetupAutoInstallSetAsideProfilePath_str;
}

id MDMSystemRestartLogPath()
{
  if (MDMSystemRestartLogPath_once != -1)
    dispatch_once(&MDMSystemRestartLogPath_once, &__block_literal_global_75);
  return (id)MDMSystemRestartLogPath_str;
}

id MDMSystemShutDownLogPath()
{
  if (MDMSystemShutDownLogPath_once != -1)
    dispatch_once(&MDMSystemShutDownLogPath_once, &__block_literal_global_78);
  return (id)MDMSystemShutDownLogPath_str;
}

id MDMSetupAssistantSettingsFilePath()
{
  if (MDMSetupAssistantSettingsFilePath_once != -1)
    dispatch_once(&MDMSetupAssistantSettingsFilePath_once, &__block_literal_global_81);
  return (id)MDMSetupAssistantSettingsFilePath_str;
}

id MDMManagedStoreBooksManifestPath()
{
  if (MDMManagedStoreBooksManifestPath_once != -1)
    dispatch_once(&MDMManagedStoreBooksManifestPath_once, &__block_literal_global_84);
  return (id)MDMManagedStoreBooksManifestPath_str;
}

id MDMManagedNonStoreBooksSystemGroupContainer()
{
  void *v0;
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  v0 = (void *)MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath;
  if (!MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath)
  {
    DMCSystemGroupContainerPathWithGroupIdentifier(CFSTR("systemgroup.com.apple.media.books.managed"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath;
    MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath = v1;

    v0 = (void *)MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath;
    if (!MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath)
    {
      v3 = *DMCLogObjects();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1A4951000, v3, OS_LOG_TYPE_ERROR, "Failed to get managed books system group container", v5, 2u);
      }
      v0 = (void *)MDMManagedNonStoreBooksSystemGroupContainer_booksSystemGroupContainerPath;
    }
  }
  return v0;
}

id MDMManagedNonStoreBooksManifestPath()
{
  if (MDMManagedNonStoreBooksManifestPath_once != -1)
    dispatch_once(&MDMManagedNonStoreBooksManifestPath_once, &__block_literal_global_92);
  return (id)MDMManagedNonStoreBooksManifestPath_str;
}

id MDMLegacyManagedNonStoreBooksDirectory()
{
  if (MDMLegacyManagedNonStoreBooksDirectory_once != -1)
    dispatch_once(&MDMLegacyManagedNonStoreBooksDirectory_once, &__block_literal_global_95);
  return (id)MDMLegacyManagedNonStoreBooksDirectory_str;
}

id MDMAuthenticationResultsCacheFilePath()
{
  if (MDMAuthenticationResultsCacheFilePath_once != -1)
    dispatch_once(&MDMAuthenticationResultsCacheFilePath_once, &__block_literal_global_98);
  return (id)MDMAuthenticationResultsCacheFilePath_str;
}

id MDMUserReturnToServiceStorageDirectory()
{
  if (MDMUserReturnToServiceStorageDirectory_once != -1)
    dispatch_once(&MDMUserReturnToServiceStorageDirectory_once, &__block_literal_global_101_0);
  return (id)MDMUserReturnToServiceStorageDirectory_str;
}

id MDMSystemReturnToServiceStorageDirectory()
{
  if (MDMSystemReturnToServiceStorageDirectory_once != -1)
    dispatch_once(&MDMSystemReturnToServiceStorageDirectory_once, &__block_literal_global_104_0);
  return (id)MDMSystemReturnToServiceStorageDirectory_str;
}

id MDMDirtyPersonaFilePath()
{
  if (MDMDirtyPersonaFilePath_once != -1)
    dispatch_once(&MDMDirtyPersonaFilePath_once, &__block_literal_global_107_0);
  return (id)MDMDirtyPersonaFilePath_str;
}

void sub_1A497781C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1A4977C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _assertionQueue()
{
  if (_assertionQueue_onceToken != -1)
    dispatch_once(&_assertionQueue_onceToken, &__block_literal_global_67);
  return (id)_assertionQueue_queue;
}

void _retainPowerAssertion()
{
  NSObject *v0;
  NSObject *v1;
  void *v2;
  const __CFDictionary *v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  uint8_t buf[4];
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = DMCLogObjects()[2];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v8 = powerAssertionRetainCount;
    v9 = 1024;
    v10 = powerAssertionRetainCount + 1;
    _os_log_impl(&dword_1A4951000, v0, OS_LOG_TYPE_DEFAULT, "Retaining power assertion. Count: %d -> %d", buf, 0xEu);
  }
  if (powerAssertionRetainCount)
  {
    IOPMAssertionRetain(assertionID);
  }
  else
  {
    v1 = DMCLogObjects()[2];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4951000, v1, OS_LOG_TYPE_DEFAULT, "Creating new IOPMAssertion.", buf, 2u);
    }
    v6[0] = CFSTR("PreventUserIdleSystemSleep");
    v6[1] = CFSTR("MC activity");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 3600.0, CFSTR("AssertType"), CFSTR("AssertName"), CFSTR("TimeoutSeconds"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2] = v2;
    v6[3] = CFSTR("TimeoutActionTurnOff");
    v5[3] = CFSTR("TimeoutAction");
    v5[4] = CFSTR("AllowsDeviceRestart");
    v6[4] = *MEMORY[0x1E0C9AE50];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
    v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    IOPMAssertionCreateWithProperties(v3, (IOPMAssertionID *)&assertionID);
    v4 = DMCLogObjects()[2];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v8 = assertionID;
      _os_log_impl(&dword_1A4951000, v4, OS_LOG_TYPE_DEFAULT, "IOPMAssertion created %d", buf, 8u);
    }

  }
  ++powerAssertionRetainCount;
}

void _releasePowerAssertion()
{
  NSObject *v0;
  BOOL v1;
  NSObject *v2;
  int v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = DMCLogObjects()[2];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 67109376;
    v4 = powerAssertionRetainCount;
    v5 = 1024;
    v6 = powerAssertionRetainCount - 1;
    _os_log_impl(&dword_1A4951000, v0, OS_LOG_TYPE_DEFAULT, "Releasing power assertion. Count: %d -> %d.", (uint8_t *)&v3, 0xEu);
  }
  IOPMAssertionRelease(assertionID);
  v1 = __OFSUB__(powerAssertionRetainCount--, 1);
  if ((powerAssertionRetainCount < 0) ^ v1 | (powerAssertionRetainCount == 0))
  {
    v2 = DMCLogObjects()[2];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 67109120;
      v4 = assertionID;
      _os_log_impl(&dword_1A4951000, v2, OS_LOG_TYPE_DEFAULT, "IOPMAssertion released %d.", (uint8_t *)&v3, 8u);
    }
  }
}

void ___assertionQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("Power assertion queue", 0);
  v1 = (void *)_assertionQueue_queue;
  _assertionQueue_queue = (uint64_t)v0;

}

id getLARatchetManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getLARatchetManagerClass_softClass;
  v7 = getLARatchetManagerClass_softClass;
  if (!getLARatchetManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getLARatchetManagerClass_block_invoke;
    v3[3] = &unk_1E4D36B88;
    v3[4] = &v4;
    __getLARatchetManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A497A46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getLARatchetClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getLARatchetClass_softClass;
  v7 = getLARatchetClass_softClass;
  if (!getLARatchetClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getLARatchetClass_block_invoke;
    v3[3] = &unk_1E4D36B88;
    v3[4] = &v4;
    __getLARatchetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A497A8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getLARatchetMaxEnablementGracePeriod()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getLARatchetMaxEnablementGracePeriodSymbolLoc_ptr;
  v6 = getLARatchetMaxEnablementGracePeriodSymbolLoc_ptr;
  if (!getLARatchetMaxEnablementGracePeriodSymbolLoc_ptr)
  {
    v1 = (void *)LocalAuthenticationLibrary();
    v0 = dlsym(v1, "LARatchetMaxEnablementGracePeriod");
    v4[3] = (uint64_t)v0;
    getLARatchetMaxEnablementGracePeriodSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getLARatchetMaxEnablementGracePeriod_cold_1();
  return *(_QWORD *)v0;
}

void sub_1A497A96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getLARatchetManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  LocalAuthenticationLibrary();
  result = objc_getClass("LARatchetManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLARatchetManagerClass_block_invoke_cold_1();
  getLARatchetManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t LocalAuthenticationLibrary()
{
  uint64_t v0;
  void *v2;

  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = LocalAuthenticationLibraryCore_frameworkLibrary;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getLARatchetClass_block_invoke(uint64_t a1)
{
  Class result;

  LocalAuthenticationLibrary();
  result = objc_getClass("LARatchet");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLARatchetClass_block_invoke_cold_1();
  getLARatchetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DMCIsSetupBuddyDone()
{
  if ((DMCBYSetupAssistantNeedsToRun() & 1) != 0)
    return 0;
  else
    return DMCIsBundleIDRunning((uint64_t)CFSTR("com.apple.purplebuddy")) ^ 1;
}

uint64_t DMCIsGreenTea()
{
  if (DMCIsGreenTea_once != -1)
    dispatch_once(&DMCIsGreenTea_once, &__block_literal_global_18);
  return DMCIsGreenTea_isGreenTea;
}

uint64_t DMCIsBundleIDRunning(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87D68], "handleForPredicate:error:", v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRunning");

  return v4;
}

const __CFString *DMCStringForBool(int a1)
{
  if (a1)
    return CFSTR("Yes");
  else
    return CFSTR("No");
}

id DMCUSEnglishLocale()
{
  if (DMCUSEnglishLocale_once != -1)
    dispatch_once(&DMCUSEnglishLocale_once, &__block_literal_global_19);
  return (id)DMCUSEnglishLocale_locale;
}

id DMCUSEnglishNumberFormatter()
{
  if (DMCUSEnglishNumberFormatter_once != -1)
    dispatch_once(&DMCUSEnglishNumberFormatter_once, &__block_literal_global_10);
  return (id)DMCUSEnglishNumberFormatter_formatter;
}

void sub_1A497B790(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t __getAAQuotaInfoRequestClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getAAQuotaInfoResponseClass_block_invoke_cold_1();
}

uint64_t __getAAQuotaInfoResponseClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCDPUIControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCDPUIControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAMSProcessInfoClass_block_invoke_cold_1(v0);
}

uint64_t __getAMSProcessInfoClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAMSUserAgentClass_block_invoke_cold_1(v0);
}

void __getAMSUserAgentClass_block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)abort_report_np();
  __53__DMCDaemonConnectionTracker_trackConnectionFromPID___block_invoke_cold_1(v0, v1);
}

void getLARatchetMaxEnablementGracePeriod_cold_1()
{
  dlerror();
  abort_report_np();
  __getLARatchetManagerClass_block_invoke_cold_1();
}

void __getLARatchetManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getLARatchetClass_block_invoke_cold_1(v0);
}

void __getLARatchetClass_block_invoke_cold_1()
{
  const void *v0;
  CC_LONG v1;
  unsigned __int8 *v2;

  v0 = (const void *)abort_report_np();
  CC_SHA256(v0, v1, v2);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

void *__cdecl CFBundleGetDataPointerForName(CFBundleRef bundle, CFStringRef symbolName)
{
  return (void *)MEMORY[0x1E0C980F8](bundle, symbolName);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x1E0C98108](bundle, functionName);
}

Boolean CFBundleLoadExecutableAndReturnError(CFBundleRef bundle, CFErrorRef *error)
{
  return MEMORY[0x1E0C981A8](bundle, error);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98630](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1E0CBB680](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB718](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

void IOPMAssertionRetain(IOPMAssertionID theAssertion)
{
  MEMORY[0x1E0CBB740](*(_QWORD *)&theAssertion);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB9A0](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA08](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1E0D4E580]();
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1E0CB2D70]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

CFArrayRef SCDynamicStoreCopyKeyList(SCDynamicStoreRef store, CFStringRef pattern)
{
  return (CFArrayRef)MEMORY[0x1E0CE8748](store, pattern);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE8768](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1E0CE8770](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87A8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87B0](allocator, domain, serviceID, entity);
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1E0CE8848](interface);
}

SCNetworkInterfaceRef SCNetworkInterfaceGetInterface(SCNetworkInterfaceRef interface)
{
  return (SCNetworkInterfaceRef)MEMORY[0x1E0CE8868](interface);
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return (CFDictionaryRef)MEMORY[0x1E0CE8888](protocol);
}

Boolean SCNetworkProtocolGetEnabled(SCNetworkProtocolRef protocol)
{
  return MEMORY[0x1E0CE8890](protocol);
}

SCNetworkServiceRef SCNetworkServiceCopy(SCPreferencesRef prefs, CFStringRef serviceID)
{
  return (SCNetworkServiceRef)MEMORY[0x1E0CE8910](prefs, serviceID);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return (SCNetworkProtocolRef)MEMORY[0x1E0CE8928](service, protocolType);
}

Boolean SCNetworkServiceGetEnabled(SCNetworkServiceRef service)
{
  return MEMORY[0x1E0CE8940](service);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x1E0CE8948](service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x1E0CE8990](prefs);
}

CFArrayRef SCNetworkSetGetServiceOrder(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x1E0CE89A0](set);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1E0CE89C8](allocator, name, prefsID);
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1E0CD5EA8](allocator, protection, flags, error);
}

uint64_t SecCMSCreateSignedData()
{
  return MEMORY[0x1E0CD5F10]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1E0CD5FF8](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x1E0CD6050]();
}

uint64_t SecGenerateCertificateRequestWithParameters()
{
  return MEMORY[0x1E0CD6260]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1E0CD6270](identityRef, certificateRef);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1E0CD6280]();
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x1E0CD6288]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1E0CD6318](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD6388](parameters, error);
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return (SecPolicyRef)MEMORY[0x1E0CD6510](revocationFlags);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x1E0CD6520](server, hostname);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1E0CD6648](trust);
}

uint64_t SecTrustDeserialize()
{
  return MEMORY[0x1E0CD66A0]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1E0CD66E0](trust);
}

uint64_t SecTrustSerialize()
{
  return MEMORY[0x1E0CD6708]();
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x1E0CD6710](trust, anchorCertificates);
}

OSStatus SecTrustSetAnchorCertificatesOnly(SecTrustRef trust, Boolean anchorCertificatesOnly)
{
  return MEMORY[0x1E0CD6718](trust, anchorCertificatesOnly);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1E0CD6748](trust, policies);
}

uint64_t WriteStackshotReport()
{
  return MEMORY[0x1E0D1BD38]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x1E0CA6F18]();
}

uint64_t _CTServerConnectionGetManagedCellularProfile()
{
  return MEMORY[0x1E0CA6FA8]();
}

uint64_t _CTServerConnectionLoadManagedCellularProfile()
{
  return MEMORY[0x1E0CA7018]();
}

uint64_t _CTServerConnectionUnloadManagedCellularProfile()
{
  return MEMORY[0x1E0CA7088]();
}

uint64_t _SCNetworkInterfaceGetFamilySubType()
{
  return MEMORY[0x1E0CE8AA0]();
}

uint64_t _SCNetworkInterfaceGetFamilyType()
{
  return MEMORY[0x1E0CE8AA8]();
}

uint64_t _SCNetworkInterfaceGetIOInterfaceType()
{
  return MEMORY[0x1E0CE8AB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1E0C82A90]();
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x1E0C82A98]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1E0C83970](*(_QWORD *)&a1, a2, a3);
}

uint64_t lockdown_connect()
{
  return MEMORY[0x1E0DE6C48]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x1E0DE6C80]();
}

uint64_t lockdown_set_value()
{
  return MEMORY[0x1E0DE6CA8]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1E0C83DB0]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE48](monitor);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x1E0CCFE50]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCFE60](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x1E0CCFE68](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x1E0CCFE70](monitor);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x1E0C85290](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x1E0C852A8](a1, *(_QWORD *)&a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

kern_return_t thread_get_state(thread_read_t target_act, thread_state_flavor_t flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  return MEMORY[0x1E0C858F0](*(_QWORD *)&target_act, *(_QWORD *)&flavor, old_state, old_stateCnt);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x1E0C85A20](out);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

kern_return_t vm_read_overwrite(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_address_t data, vm_size_t *outsize)
{
  return MEMORY[0x1E0C85AF8](*(_QWORD *)&target_task, address, size, data, outsize);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

