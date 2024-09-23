@implementation MDMManagedNonStoreBooksManifestPath

void __MDMManagedNonStoreBooksManifestPath_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  MDMManagedNonStoreBooksDirectory();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Managed.plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)MDMManagedNonStoreBooksManifestPath_str;
  MDMManagedNonStoreBooksManifestPath_str = v1;

}

@end
