@implementation CalWidgetUtils

+ (void)refreshDateWidgets
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CalWidgetUtils_refreshDateWidgets__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (refreshDateWidgets_onceToken != -1)
    dispatch_once(&refreshDateWidgets_onceToken, block);
  objc_msgSend((id)refreshDateWidgets_refreshQueue, "executeBlock");
}

void __36__CalWidgetUtils_refreshDateWidgets__block_invoke(uint64_t a1)
{
  void *v2;
  CalLimitingQueue *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)refreshDateWidgets_widgetKinds;
  refreshDateWidgets_widgetKinds = (uint64_t)&unk_1E2A9B5C0;

  v3 = [CalLimitingQueue alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__CalWidgetUtils_refreshDateWidgets__block_invoke_2;
  v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = -[CalLimitingQueue initWithQueue:andBlock:](v3, "initWithQueue:andBlock:", 0, v6);
  v5 = (void *)refreshDateWidgets_refreshQueue;
  refreshDateWidgets_refreshQueue = v4;

}

uint64_t __36__CalWidgetUtils_refreshDateWidgets__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshWidgetKinds:reason:", refreshDateWidgets_widgetKinds, &stru_1E2A86598);
}

+ (void)refreshEventWidgets
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CalWidgetUtils_refreshEventWidgets__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (refreshEventWidgets_onceToken != -1)
    dispatch_once(&refreshEventWidgets_onceToken, block);
  objc_msgSend((id)refreshEventWidgets_refreshQueue, "executeBlock");
}

void __37__CalWidgetUtils_refreshEventWidgets__block_invoke(uint64_t a1)
{
  void *v2;
  CalLimitingQueue *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)refreshEventWidgets_widgetKinds;
  refreshEventWidgets_widgetKinds = (uint64_t)&unk_1E2A9B5D8;

  v3 = [CalLimitingQueue alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__CalWidgetUtils_refreshEventWidgets__block_invoke_2;
  v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = -[CalLimitingQueue initWithQueue:andBlock:](v3, "initWithQueue:andBlock:", 0, v6);
  v5 = (void *)refreshEventWidgets_refreshQueue;
  refreshEventWidgets_refreshQueue = v4;

}

uint64_t __37__CalWidgetUtils_refreshEventWidgets__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshWidgetKinds:reason:", refreshEventWidgets_widgetKinds, &stru_1E2A86598);
}

+ (void)_refreshWidgetKinds:(id)a3 reason:(id)a4
{
  id v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t v25[128];
  _BYTE buf[24];
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v5 = a4;
  if (!ChronoServicesLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_1E2A83FB8;
    *(_QWORD *)&buf[16] = 0;
    ChronoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (ChronoServicesLibraryCore_frameworkLibrary)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v6 = (void *)getCHSTimelineControllerClass_softClass;
    v24 = getCHSTimelineControllerClass_softClass;
    if (!getCHSTimelineControllerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getCHSTimelineControllerClass_block_invoke;
      v27 = &unk_1E2A83FD8;
      v28 = &v21;
      __getCHSTimelineControllerClass_block_invoke((uint64_t)buf);
      v6 = (void *)v22[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v21, 8);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = v15;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
          v12 = (void *)objc_msgSend([v7 alloc], "initWithExtensionBundleIdentifier:kind:", CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), v11);
          objc_msgSend(v12, "reloadTimelineWithReason:", v5);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v11;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v13;
              _os_log_error_impl(&dword_18FC12000, v14, OS_LOG_TYPE_ERROR, "Error while trying to reload widget with kind %@: %@", buf, 0x16u);
            }

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v8);
    }

  }
}

+ (double)lookaheadIntervalForDaysPerEntry:(int64_t)a3
{
  return (double)a3 * 86400.0;
}

@end
