@implementation NSURLProtectionSpace

uint64_t __60__NSURLProtectionSpace_SafariServicesExtras___sf_identities__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CFTypeID v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OSStatus v8;
  char IsValid;
  CFTypeRef result;
  SecCertificateRef certificateRef;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = CFGetTypeID(v3);
  if (v4 == SecIdentityGetTypeID())
  {
    certificateRef = 0;
    v5 = 0;
    if (!SecIdentityCopyCertificate((SecIdentityRef)v3, &certificateRef))
    {
      if (certificateRef)
      {
        result = 0;
        v6 = *MEMORY[0x1E0CD6F20];
        v13[0] = *MEMORY[0x1E0CD70E8];
        v13[1] = v6;
        v7 = *(_QWORD *)(a1 + 32);
        v14[0] = certificateRef;
        v14[1] = v7;
        v13[2] = *MEMORY[0x1E0CD7028];
        v14[2] = MEMORY[0x1E0C9AAB0];
        v8 = SecItemCopyMatching((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3), &result);
        IsValid = SecCertificateIsValid();
        CFRelease(certificateRef);
        v5 = 0;
        if (!v8)
        {
          if (result)
          {
            CFRelease(result);
            if ((IsValid & 1) != 0)
            {
              v5 = 1;
            }
            else
            {
              v5 = 0;
              ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            }
          }
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
