@implementation ICRadarUtilities

+ (void)promptUserToFileBugWithAlertMessage:(id)a3 bugTitle:(id)a4 bugDescription:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke;
  v14[3] = &unk_1EA824938;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = a1;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  __CFUserNotification *v16;
  __CFUserNotification *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  CFOptionFlags v29;
  _QWORD v30[5];
  _QWORD v31[6];

  v31[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisableAssertAlert"));

  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "Assert");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_5(a1, v12);

    v13 = *MEMORY[0x1E0C9B810];
    v30[0] = *MEMORY[0x1E0C9B800];
    v30[1] = v13;
    v14 = *(const __CFString **)(a1 + 32);
    if (!v14)
      v14 = &stru_1EA825738;
    v31[0] = CFSTR("Internal Notes Bug");
    v31[1] = v14;
    v15 = *MEMORY[0x1E0C9B830];
    v30[2] = *MEMORY[0x1E0C9B838];
    v30[3] = v15;
    v31[2] = CFSTR("File Radar");
    v31[3] = CFSTR("Stop Asking");
    v30[4] = *MEMORY[0x1E0C9B868];
    v31[4] = CFSTR("Cancel");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
    v4 = objc_claimAutoreleasedReturnValue();
    v16 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, (CFDictionaryRef)v4);
    if (v16)
    {
      v17 = v16;
      v29 = 0;
      CFUserNotificationReceiveResponse(v16, 604800.0, &v29);
      if ((v29 & 3) == 1)
      {
        v19 = os_log_create("com.apple.notes", "Assert");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_4(v19, v20, v21, v22, v23, v24, v25, v26);

        v27 = os_log_create("com.apple.notes", "SimulatedCrash");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_3(v27);

        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setBool:forKey:", 1, CFSTR("DisableAssertAlert"));

      }
      else if ((v29 & 3) == 0)
      {
        objc_msgSend(*(id *)(a1 + 56), "createRadarWithTitle:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
      CFRelease(v17);
    }
    else
    {
      v18 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_2((uint64_t)v4, v18);

    }
  }

}

+ (void)createRadarWithTitle:(id)a3 description:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v5 = (objc_class *)MEMORY[0x1E0CB3998];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v7, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentName"), CFSTR("Notes"));
  objc_msgSend(v8, "addObject:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("iOS"));
  objc_msgSend(v8, "addObject:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentID"), CFSTR("568784"));
  objc_msgSend(v8, "addObject:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
  objc_msgSend(v8, "addObject:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("Not Applicable"));
  objc_msgSend(v8, "addObject:", v13);

  if (objc_msgSend(v18, "length"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Title"), v18);
    objc_msgSend(v8, "addObject:", v14);

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Description"), v6);

  objc_msgSend(v8, "addObject:", v15);
  objc_msgSend(v7, "setQueryItems:", v8);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "openURL:configuration:completionHandler:", v17, 0, 0);

}

void __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, a1, a3, "Not showing alert for assertion because defaults key was set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

void __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_ERROR, "Failed to create CFUserNotificationRef for alertOptions: %@", (uint8_t *)&v2, 0xCu);
}

void __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DDAA5000, log, OS_LOG_TYPE_FAULT, "Disabled the assertion alert", v1, 2u);
  OUTLINED_FUNCTION_3_0();
}

void __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, a1, a3, "User decided to disable the assertion alerts", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

void __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_5(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_DEBUG, "Showing alert to file a bug with message: \"%@\", (uint8_t *)&v3, 0xCu);
}

@end
