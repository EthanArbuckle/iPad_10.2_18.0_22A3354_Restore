@implementation MCPLPhotoLibraryClass

void __MCPLPhotoLibraryClass_block_invoke()
{
  void *v0;
  NSObject *v1;
  _QWORD v2[4];
  __CFString *v3;
  uint8_t buf[4];
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  URLForCanonicalFilePath(CFSTR("/System/Library/PrivateFrameworks/PhotoLibraryServices.framework"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __MCPLPhotoLibraryClass_block_invoke_2;
  v2[3] = &unk_1E41E30B8;
  v3 = CFSTR("PLPhotoLibrary");
  +[MCLazyInitializationUtilities loadNSBundleAtURL:completionBlock:](MCLazyInitializationUtilities, "loadNSBundleAtURL:completionBlock:", v0, v2);

  if (!MCPLPhotoLibraryClass_theClass)
  {
    v1 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v5 = CFSTR("PLPhotoLibrary");
      _os_log_impl(&dword_19ECC4000, v1, OS_LOG_TYPE_ERROR, "Could not load %{public}@", buf, 0xCu);
    }
  }

}

uint64_t __MCPLPhotoLibraryClass_block_invoke_2(uint64_t result, int a2, void *a3)
{
  if (a2)
  {
    result = objc_msgSend(a3, "classNamed:", *(_QWORD *)(result + 32));
    MCPLPhotoLibraryClass_theClass = result;
  }
  return result;
}

@end
