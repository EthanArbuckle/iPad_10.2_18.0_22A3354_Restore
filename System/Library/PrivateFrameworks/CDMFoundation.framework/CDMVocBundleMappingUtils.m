@implementation CDMVocBundleMappingUtils

+ (id)mapVocGenericBundleIdToPlatformBundleId:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.applemusic")) & 1) != 0)
  {
    v4 = CFSTR("com.apple.Music");
  }
  else
  {
    v4 = CFSTR("com.apple.tv");
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.tv")) & 1) == 0)
    {
      v4 = CFSTR("com.apple.mobilemail");
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) == 0)
      {
        v4 = CFSTR("com.apple.mobilesafari");
        if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) == 0)
        {
          v4 = CFSTR("com.apple.DocumentsApp");
          if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
            v4 = 0;
        }
      }
    }
  }

  return (id)v4;
}

@end
