@implementation NTKPhotoAssetScrubbingOperation

- (id)supportedExtensions
{
  return &unk_1E6CA9B50;
}

- (BOOL)scrubAssetAtURL:(id)a3 toDestinationURL:(id)a4 error:(id *)a5
{
  const __CFURL *v7;
  const __CFURL *v8;
  CGImageSource *v9;
  CGImageSource *v10;
  CFDictionaryRef v11;
  void *v12;
  const __CFString *Type;
  CGImageDestinationRef v14;
  CGImageDestination *v15;
  CGMutableImageMetadataRef Mutable;
  CGMutableImageMetadataRef v17;
  NSObject *v18;
  uint64_t v19;
  const __CFDictionary *v20;
  char v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v28[3];
  _QWORD v29[3];
  _BYTE buf[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = (const __CFURL *)a3;
  v8 = (const __CFURL *)a4;
  v9 = CGImageSourceCreateWithURL(v7, 0);
  if (v9)
  {
    v10 = v9;
    v11 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
    -[__CFDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E0CBCD68]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v7;
        _os_log_impl(&dword_1B72A3000, v23, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Location data not found in asset: '%@'. Passing through.", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v24, "copyItemAtURL:toURL:error:", v7, v8, a5);

      CFRelease(v10);
      goto LABEL_27;
    }
    Type = CGImageSourceGetType(v10);
    if (Type)
    {
      v14 = CGImageDestinationCreateWithURL(v8, Type, 1uLL, 0);
      if (v14)
      {
        v15 = v14;
        Mutable = CGImageMetadataCreateMutable();
        if (Mutable)
        {
          v17 = Mutable;
          _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v7;
            _os_log_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Found location data in asset: '%@'. Will scrub.", buf, 0xCu);
          }

          v19 = *MEMORY[0x1E0CBC790];
          v28[0] = *MEMORY[0x1E0CBC798];
          v28[1] = v19;
          v29[0] = v17;
          v29[1] = MEMORY[0x1E0C9AAB0];
          v28[2] = *MEMORY[0x1E0CBC7F0];
          v29[2] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
          v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          v21 = CGImageDestinationCopyImageSource(v15, v10, v20, (CFErrorRef *)buf);
          CFRelease(v17);
          CFRelease(v15);
          CFRelease(v10);
          v22 = *(void **)buf;
          if (*(_QWORD *)buf)
          {
            if (a5)
              *a5 = objc_retainAutorelease(*(id *)buf);

          }
          goto LABEL_27;
        }
        CFRelease(v15);
        CFRelease(v10);
        if (a5)
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v26 = 1004;
          goto LABEL_25;
        }
LABEL_26:
        v21 = 0;
        goto LABEL_27;
      }
      CFRelease(v10);
      if (!a5)
        goto LABEL_26;
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = 1003;
    }
    else
    {
      CFRelease(v10);
      if (!a5)
        goto LABEL_26;
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = 1002;
    }
LABEL_25:
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.photos"), v26, 0);
    v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

    goto LABEL_28;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.photos"), 1002, 0);
    v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_28:

  return v21;
}

@end
