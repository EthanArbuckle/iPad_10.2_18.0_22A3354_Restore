@implementation CADRealCalendarDatabaseDataProvider

- (int)databaseID:(CalDatabase *)a3
{
  return CalDatabaseGetAuxilliaryDatabaseID();
}

+ (id)realDataProvider
{
  if (realDataProvider_onceToken != -1)
    dispatch_once(&realDataProvider_onceToken, &__block_literal_global_21);
  return (id)realDataProvider_realDataProvider;
}

void __55__CADRealCalendarDatabaseDataProvider_realDataProvider__block_invoke()
{
  CADRealCalendarDatabaseDataProvider *v0;
  void *v1;

  v0 = objc_alloc_init(CADRealCalendarDatabaseDataProvider);
  v1 = (void *)realDataProvider_realDataProvider;
  realDataProvider_realDataProvider = (uint64_t)v0;

}

- (id)storesInDatabase:(CalDatabase *)a3
{
  return (id)CalDatabaseCopyOfAllStores();
}

- (BOOL)isLocalStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  unsigned int Type;

  Type = CalStoreGetType();
  return (Type < 7) & (0x71u >> Type);
}

- (BOOL)isStoreDelegate:(void *)a3 inDatabase:(CalDatabase *)a4
{
  void *v4;
  BOOL v5;

  v4 = (void *)CalStoreCopyDelegatedAccountOwnerStoreID();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isIntegrationStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  return CalStoreGetType() == 6;
}

- (id)accountIDForStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  void *v4;

  if (CalStoreGetType() - 1 > 1)
    v4 = 0;
  else
    v4 = (void *)CalStoreCopyExternalID();
  return v4;
}

- (id)storeIDForStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  return (id)CalStoreCopyUUID();
}

- (int)storeUIDForStore:(void *)a3 inDatabase:(CalDatabase *)a4
{
  return CalStoreGetUID();
}

- (void)gatherCalendarRowIDs:(id)a3 inStore:(void *)a4 inDatabase:(CalDatabase *)a5
{
  id v5;
  const __CFArray *v6;
  const __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex i;
  void *v11;
  void *v12;
  NSObject *v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (const __CFArray *)CalStoreCopyCalendars();
  if (v6)
  {
    v7 = v6;
    Count = CFArrayGetCount(v6);
    if (Count >= 1)
    {
      v9 = Count;
      for (i = 0; i != v9; ++i)
      {
        CFArrayGetValueAtIndex(v7, i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CalCalendarGetUID());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
    }
    CFRelease(v7);
  }
  else
  {
    v12 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v14[0] = 67109120;
      v14[1] = CalStoreGetUID();
      _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_ERROR, "Calendar are nil for store with RowID: [%i]", (uint8_t *)v14, 8u);

    }
  }

}

- (int)naturalLanguageSuggestionsCalendarRowIDInDatabase:(CalDatabase *)a3
{
  uint64_t v3;
  const void *v4;
  int UID;

  v3 = CalDatabaseCopyNaturalLanguageSuggestionsCalendar();
  if (!v3)
    return -1;
  v4 = (const void *)v3;
  UID = CalCalendarGetUID();
  CFRelease(v4);
  return UID;
}

- (int)suggestionsCalendarRowIDInDatabase:(CalDatabase *)a3
{
  uint64_t v3;
  const void *v4;
  int UID;

  v3 = CalDatabaseCopySuggestionsCalendar();
  if (!v3)
    return -1;
  v4 = (const void *)v3;
  UID = CalCalendarGetUID();
  CFRelease(v4);
  return UID;
}

@end
