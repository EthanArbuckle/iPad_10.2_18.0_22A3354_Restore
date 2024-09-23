@implementation NSURL(SafariServicesExtras)

- (uint64_t)sf_isOfflineReadingListURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char __s[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isFileURL"))
    return 0;
  objc_msgSend(a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (!v3 || !objc_msgSend(a1, "getFileSystemRepresentation:maxLength:", __s, 1024))
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", __s, strlen(__s), 4, 0);
  objc_msgSend(MEMORY[0x1E0DCCBA0], "readingListArchivesDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", v5);

  return v6;
}

- (uint64_t)sf_isTestWebArchiveURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char __s[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isFileURL"))
    return 0;
  objc_msgSend(a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (!v3 || !objc_msgSend(a1, "getFileSystemRepresentation:maxLength:", __s, 1024))
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", __s, strlen(__s), 4, 0);
  _SFSafariTestContentDirectoryPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", v5);

  return v6;
}

- (uint64_t)sf_isFacetimeURL
{
  if ((objc_msgSend(a1, "isFaceTimeURL") & 1) != 0
    || (objc_msgSend(a1, "isFaceTimePromptURL") & 1) != 0
    || (objc_msgSend(a1, "isFaceTimeAudioURL") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isFaceTimeAudioPromptURL");
  }
}

+ (uint64_t)_sf_canCreateURLsFromDropSession:()SafariServicesExtras
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0D4EF50];
  v4 = a3;
  allowedClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "dropSession:containsItemsMatching:allowedTypeIdentifiers:allowedClasses:", v4, localObjectLoader_0, 0, v5);

  return v6;
}

+ (uint64_t)_sf_urlsFromDragItems:()SafariServicesExtras completionHandler:
{
  return objc_msgSend(MEMORY[0x1E0DC3758], "_sf_loadObjectsFromDragItems:usingLocalObjectLoader:objectLoader:completionHandler:", a3, localObjectLoader_0, objectLoader_0, a4);
}

@end
