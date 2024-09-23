@implementation MFMailDirectoryURL

void __MFMailDirectoryURL_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C99E98]);
  MFMailDirectory();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initFileURLWithPath:");
  v2 = (void *)MFMailDirectoryURL___MailDirURL;
  MFMailDirectoryURL___MailDirURL = v1;

}

@end
