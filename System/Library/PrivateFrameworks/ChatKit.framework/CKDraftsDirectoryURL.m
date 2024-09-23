@implementation CKDraftsDirectoryURL

void __CKDraftsDirectoryURL_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  IMSMSDirectoryURL();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Drafts"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CKDraftsDirectoryURL_sAttachmentsDirectory;
  CKDraftsDirectoryURL_sAttachmentsDirectory = v0;

}

@end
