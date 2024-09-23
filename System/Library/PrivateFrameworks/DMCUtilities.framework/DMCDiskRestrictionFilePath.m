@implementation DMCDiskRestrictionFilePath

void __DMCDiskRestrictionFilePath_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(0, "stringByAppendingPathComponent:", CFSTR("DiskManagement_Settings.plist"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)DMCDiskRestrictionFilePath_str;
  DMCDiskRestrictionFilePath_str = v0;

}

@end
