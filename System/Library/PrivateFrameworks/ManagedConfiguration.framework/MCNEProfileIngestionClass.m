@implementation MCNEProfileIngestionClass

void __MCNEProfileIngestionClass_block_invoke()
{
  id v0;

  URLForCanonicalFilePath(CFSTR("/System/Library/Frameworks/NetworkExtension.framework"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[MCLazyInitializationUtilities loadNSBundleAtURL:completionBlock:](MCLazyInitializationUtilities, "loadNSBundleAtURL:completionBlock:", v0, &__block_literal_global_194);

}

void __MCNEProfileIngestionClass_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = v4;
  if (a2)
  {
    MCNEProfileIngestionClass_theClass = objc_msgSend(v4, "classNamed:", CFSTR("NEProfileIngestion"));
  }
  else
  {
    v6 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Could not load NetworkExtension framework.", v7, 2u);
    }
  }

}

@end
