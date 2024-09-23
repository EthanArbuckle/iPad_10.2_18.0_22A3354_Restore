@implementation CKLegacyAttachmentsDirectoryURL

void __CKLegacyAttachmentsDirectoryURL_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  IMSMSDirectoryURL();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Parts"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CKLegacyAttachmentsDirectoryURL_sLegacyAttachmentsDirectory;
  CKLegacyAttachmentsDirectoryURL_sLegacyAttachmentsDirectory = v0;

}

@end
