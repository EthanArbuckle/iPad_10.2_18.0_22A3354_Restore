@implementation NSError(SHError)

- (uint64_t)sh_hasShazamKitPublicErrorDomain
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.ShazamKit"));

  return v2;
}

- (uint64_t)sh_isMediaLibraryPublicError
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_isMediaLibraryError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 500;
  return result;
}

- (uint64_t)isShazamPublicErrorWithCode:()SHError
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_hasShazamKitPublicErrorDomain");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == a3;
  return result;
}

- (uint64_t)sh_isInvalidAudioFormat
{
  return objc_msgSend(a1, "isShazamPublicErrorWithCode:", 100);
}

- (uint64_t)sh_isAudioDiscontinuity
{
  return objc_msgSend(a1, "isShazamPublicErrorWithCode:", 101);
}

- (uint64_t)sh_isSignatureInvalid
{
  return objc_msgSend(a1, "isShazamPublicErrorWithCode:", 200);
}

- (uint64_t)sh_isSignatureDurationInvalid
{
  return objc_msgSend(a1, "isShazamPublicErrorWithCode:", 201);
}

- (uint64_t)sh_isMatchAttemptFailed
{
  return objc_msgSend(a1, "isShazamPublicErrorWithCode:", 202);
}

- (uint64_t)sh_isCustomCatalogInvalid
{
  return objc_msgSend(a1, "isShazamPublicErrorWithCode:", 300);
}

- (uint64_t)sh_isCustomCatalogInvalidURL
{
  return objc_msgSend(a1, "isShazamPublicErrorWithCode:", 301);
}

- (uint64_t)sh_isInternalError
{
  return objc_msgSend(a1, "isShazamPublicErrorWithCode:", 500);
}

- (uint64_t)sh_isMediaLibraryError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.ShazamKit.ShazamLibrary"));

  return v2;
}

- (uint64_t)sh_isMatchAttemptCancelledError
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_hasShazamKitPublicErrorDomain");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 203;
  return result;
}

@end
