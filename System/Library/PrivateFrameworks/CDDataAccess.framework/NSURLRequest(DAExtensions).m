@implementation NSURLRequest(DAExtensions)

- (id)DARequestByApplyingStorageSession:()DAExtensions
{
  NSObject *v5;
  os_log_type_t v6;
  const void *MutableCopy;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D03918] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    v10 = 138412546;
    v11 = a3;
    v12 = 2112;
    v13 = a1;
    _os_log_impl(&dword_1C1CD1000, v5, v6, "Applying storage session %@ to request %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(objc_retainAutorelease(a1), "_CFURLRequest");
  MutableCopy = (const void *)CFURLRequestCreateMutableCopy();
  _CFURLRequestSetStorageSession();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "_initWithCFURLRequest:", MutableCopy);
  CFRelease(MutableCopy);
  return v8;
}

@end
