@implementation NTKDPromptToRaiseRadarWithAdditionalFiles

void __NTKDPromptToRaiseRadarWithAdditionalFiles_block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  id v29;
  _QWORD v30[4];
  id v31;
  CFOptionFlags v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v32 = 0;
  if (!*(_BYTE *)(a1 + 64)
    || (CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, *(CFStringRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), CFSTR("OK"), CFSTR("Cancel"), 0, &v32), !v32))
  {
    BOMCopierNew();
    v37 = CFSTR("createPKZip");
    v38[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("NanoTimeKit.zip"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NTKHomeDirectory();
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "fileSystemRepresentation");
    v10 = objc_retainAutorelease(v8);
    -[__CFString fileSystemRepresentation](v10, "fileSystemRepresentation");
    LODWORD(v6) = BOMCopierCopyWithOptions();

    BOMCopierFree();
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("tap-to-radar://new?ComponentName=Watch Faces&ComponentVersion=all&ComponentID=568147&Classification=Serious Bug&Reproducibility=Not Applicable&AutoDiagnostics=phone,watch&Description=Summary: \n\nSteps to Reproduce: "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((_DWORD)v6)
    {
      if (!*(_BYTE *)(a1 + 65))
        goto LABEL_10;
      v14 = CFSTR("\n\n(NOTE: Please attach contents of /var/mobile/Library/NanoTimeKit from both devices to this radar.)&");
      v12 = v11;
    }
    else
    {
      v14 = v10;
    }
    objc_msgSend(v12, "appendString:", v14);
LABEL_10:
    v15 = *(void **)(a1 + 48);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __NTKDPromptToRaiseRadarWithAdditionalFiles_block_invoke_2;
    v30[3] = &unk_1E6BD2FD8;
    v16 = v13;
    v31 = v16;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v30);
    if (objc_msgSend(v16, "length"))
      objc_msgSend(v11, "appendFormat:", CFSTR("&Attachments=%@&"), v16);
    objc_msgSend(v11, "appendFormat:", CFSTR("Title=%@"), *(_QWORD *)(a1 + 56));
    v17 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v22 = objc_msgSend(v21, "openURL:withOptions:error:", v20, MEMORY[0x1E0C9AA70], &v29);
    v23 = v29;

    _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        v34 = v20;
        v26 = "successfully launched Tap-to-Radar: %@";
        v27 = v24;
        v28 = 12;
LABEL_17:
        _os_log_impl(&dword_1B72A3000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
    }
    else if (v25)
    {
      *(_DWORD *)buf = 138412546;
      v34 = v20;
      v35 = 2112;
      v36 = v23;
      v26 = "failed to launch Tap-to-Radar: %@ %@";
      v27 = v24;
      v28 = 22;
      goto LABEL_17;
    }

    goto LABEL_19;
  }
  _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "user declined to open Tap-to-Radar", buf, 2u);
  }
LABEL_19:

}

void __NTKDPromptToRaiseRadarWithAdditionalFiles_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(*(id *)(a1 + 32), "length"))
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v4);
    v3 = v4;
  }

}

@end
