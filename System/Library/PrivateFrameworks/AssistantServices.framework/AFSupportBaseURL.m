@implementation AFSupportBaseURL

void __AFSupportBaseURL_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  CPSystemRootDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("System/Library/Assistant"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v3, 1);
  v2 = (void *)AFSupportBaseURL_sSupportBaseURL;
  AFSupportBaseURL_sSupportBaseURL = v1;

}

@end
