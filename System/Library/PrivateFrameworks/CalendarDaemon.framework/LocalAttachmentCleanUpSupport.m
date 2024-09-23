@implementation LocalAttachmentCleanUpSupport

+ (void)cleanUpOrphanedFiles
{
  NSObject *v2;
  uint64_t v3;
  const void *v4;
  uint8_t v5[16];

  if (DMIsMigrationNeeded())
  {
    v2 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B6A18000, v2, OS_LOG_TYPE_DEFAULT, "Skipping attachment cleanup because migration is needed.", v5, 2u);
    }
  }
  else
  {
    v3 = CalDatabaseCreateWithOptions();
    if (v3)
    {
      v4 = (const void *)v3;
      CalDatabaseCleanUpOrphanedLocalAttachments();
      CFRelease(v4);
    }
  }
}

@end
