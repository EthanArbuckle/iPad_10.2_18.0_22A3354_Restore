@implementation IMTimingCollection(CKUtilities)

+ (id)globalTimingCollectionForKey:()CKUtilities
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)sGlobalTimingCollections;
  if (!sGlobalTimingCollections)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = (void *)sGlobalTimingCollections;
    sGlobalTimingCollections = (uint64_t)v5;

    v4 = (void *)sGlobalTimingCollections;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend((id)sGlobalTimingCollections, "setObject:forKey:", v7, v3);
  }

  return v7;
}

+ (id)activeGlobalTimingCollections
{
  if (sGlobalTimingCollections)
    objc_msgSend((id)sGlobalTimingCollections, "allValues");
  else
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)logTimingCollectionForKey:()CKUtilities
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (sGlobalTimingCollections && IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)sGlobalTimingCollections, "valueForKey:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "%@ - %@", (uint8_t *)&v6, 0x16u);

    }
  }

}

+ (void)invalidateGlobalTimingCollectionForKey:()CKUtilities
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (sGlobalTimingCollections)
  {
    v5 = v3;
    objc_msgSend((id)sGlobalTimingCollections, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v5;
    if (v4)
    {
      objc_msgSend((id)sGlobalTimingCollections, "removeObjectForKey:", v5);
      v3 = v5;
    }
  }

}

+ (void)invalidateGlobalTimingCollections
{
  void *v0;

  v0 = (void *)sGlobalTimingCollections;
  if (sGlobalTimingCollections)
  {
    sGlobalTimingCollections = 0;

  }
}

@end
