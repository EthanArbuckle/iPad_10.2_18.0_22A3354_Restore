@implementation NTKBundleComplicationMigrationServiceLookupDirectory

void __NTKBundleComplicationMigrationServiceLookupDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  NTKCacheDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("WidgetMigrationTypeLookup"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKBundleComplicationMigrationServiceLookupDirectory_path;
  NTKBundleComplicationMigrationServiceLookupDirectory_path = v0;

}

@end
