@implementation MDMLegacyManagedNonStoreBooksDirectory

void __MDMLegacyManagedNonStoreBooksDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(CFSTR("/var/mobile/Media/Books/Managed"), "copy");
  v1 = (void *)MDMLegacyManagedNonStoreBooksDirectory_str;
  MDMLegacyManagedNonStoreBooksDirectory_str = v0;

}

@end
