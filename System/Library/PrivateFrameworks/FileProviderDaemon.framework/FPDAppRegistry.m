@implementation FPDAppRegistry

+ (BOOL)keepInSync
{
  return 0;
}

- (void)addApps:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FPDAppRegistry;
  -[FPAppRegistry addApps:](&v7, sel_addApps_, v4);
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPDAppRegistry addApps:].cold.1(v4);

  objc_msgSend((id)*MEMORY[0x1E0CAA6B8], "fp_libnotifyPerUserNotificationName");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v6, "UTF8String"));

}

- (void)removeAppsWithBundleIDs:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FPDAppRegistry;
  -[FPAppRegistry removeAppsWithBundleIDs:](&v7, sel_removeAppsWithBundleIDs_, v4);
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPDAppRegistry removeAppsWithBundleIDs:].cold.1(v4);

  objc_msgSend((id)*MEMORY[0x1E0CAA6B8], "fp_libnotifyPerUserNotificationName");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  notify_post((const char *)objc_msgSend(v6, "UTF8String"));

}

- (void)addApps:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v1, v2, "[DEBUG] posting %@ for %lu apps", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeAppsWithBundleIDs:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v1, v2, "[DEBUG] posting %@ for removal of %lu apps", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

@end
