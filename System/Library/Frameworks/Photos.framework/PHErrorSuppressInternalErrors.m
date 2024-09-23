@implementation PHErrorSuppressInternalErrors

void __PHErrorSuppressInternalErrors_block_invoke()
{
  void *v0;
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PHErrorSuppressInternalErrors_suppressInternalErrors = objc_msgSend(v0, "BOOLForKey:", CFSTR("com.apple.photos.backend.SuppressInternalErrors"));

  if (PHErrorSuppressInternalErrors_suppressInternalErrors)
  {
    PLPhotoKitGetLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_1991EC000, v1, OS_LOG_TYPE_DEFAULT, "##### Suppressing internal errors", v2, 2u);
    }

  }
}

@end
