@implementation CSSiriUserSupportBaseURL

void __CSSiriUserSupportBaseURL_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  AFUserSupportDirectoryPath();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v3, 1);
  v1 = (void *)CSSiriUserSupportBaseURL_sUserSupportBaseURL;
  CSSiriUserSupportBaseURL_sUserSupportBaseURL = v0;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", CSSiriUserSupportBaseURL_sUserSupportBaseURL, 1, 0, 0);

}

@end
