@implementation CHKObjcUtilities

+ (id)createWorkLoopWithLabel:(id)a3 qos:(unsigned int)a4
{
  NSObject *inactive;

  inactive = dispatch_workloop_create_inactive((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
  dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_set_qos_class_fallback();
  dispatch_activate(inactive);
  return inactive;
}

+ (id)preferredLanguagesForContainerBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D3EFB0];
  v11 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLanguagesForBundleIDs:", v6, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

+ (id)archivedPreferencesWithHashesForBundleIDs:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "archivedPreferencesWithHashesForBundleIDs:", a3);
}

@end
