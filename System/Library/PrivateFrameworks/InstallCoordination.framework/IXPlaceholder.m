@implementation IXPlaceholder

+ (id)placeholderForRemovableSystemAppWithBundleID:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v19;

  v10 = a3;
  v19 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifierOfSystemPlaceholder:error:", v10, &v19);
  v12 = v19;
  if (v11 && (objc_msgSend(v11, "isPlaceholder") & 1) != 0)
  {
    objc_msgSend(v11, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "placeholderForInstallable:client:installType:metadata:error:", v13, a4, a5, 0, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v12;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder placeholderForRemovableSystemAppWithBundleID:client:installType:error:].cold.1();

    _CreateError((uint64_t)"+[IXPlaceholder placeholderForRemovableSystemAppWithBundleID:client:installType:error:]", 72, CFSTR("IXErrorDomain"), 0xBuLL, v12, 0, CFSTR("Failed to get system app placeholder location from LaunchServices for %@"), v17, (uint64_t)v10);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a6)
    {
      v15 = objc_retainAutorelease(v15);
      v14 = 0;
      *a6 = v15;
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

+ (id)_pngDataForCGImage:(CGImage *)a3 error:(id *)a4
{
  __CFData *v6;
  __CFString *v7;
  CGImageDestination *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v16;

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v6 = (__CFData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = CGImageDestinationCreateWithData(v6, v7, 1uLL, 0);

  if (v8)
  {
    CGImageDestinationAddImage(v8, a3, 0);
    if (CGImageDestinationFinalize(v8))
    {
      v9 = (void *)-[__CFData copy](v6, "copy");
      v10 = 0;
    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[IXPlaceholder _pngDataForCGImage:error:].cold.2();

      _CreateError((uint64_t)"+[IXPlaceholder _pngDataForCGImage:error:]", 103, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to finalize image"), v14, v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
    }
    CFRelease(v8);
    if (a4)
    {
LABEL_12:
      if (!v9)
        *a4 = objc_retainAutorelease(v10);
    }
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _pngDataForCGImage:error:].cold.1();

    _CreateError((uint64_t)"+[IXPlaceholder _pngDataForCGImage:error:]", 96, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to create CGImageDestination"), v12, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (a4)
      goto LABEL_12;
  }

  return v9;
}

+ (id)_iconDataForBundle:(__CFBundle *)a3 atURL:(id)a4 isFromSerializedPlaceholder:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  __CFBundle *ValueForInfoDictionaryKey;
  __CFBundle *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  CFTypeRef v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  char v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  __CFBundle *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  id v48;
  id *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  __CFBundle *v59;
  NSObject *v60;
  __CFBundle *v61;
  NSObject *v62;
  void *v63;
  id *v64;
  id v65;
  id v66;
  NSObject *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  void *v73;
  uint8_t v74[4];
  const char *v75;
  __int16 v76;
  __CFBundle *v77;
  __int16 v78;
  NSObject *v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  __CFBundle *v83;
  __int16 v84;
  NSObject *v85;
  uint64_t v86;

  v7 = a5;
  v86 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (v7)
  {
    ValueForInfoDictionaryKey = (__CFBundle *)CFBundleGetValueForInfoDictionaryKey(a3, CFSTR("CF_MIPlaceholderConstructorVersion"));
    if (ValueForInfoDictionaryKey)
    {
      v12 = ValueForInfoDictionaryKey;
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v81 = "_BundleHasMalformedIconKeys";
        v82 = 2112;
        v83 = v12;
        _os_log_impl(&dword_1A4BF6000, v13, OS_LOG_TYPE_DEFAULT, "%s: Using placeholder generated by OS version %@", buf, 0x16u);
      }
      goto LABEL_32;
    }
    v14 = (void *)CFBundleGetValueForInfoDictionaryKey(a3, (CFStringRef)*MEMORY[0x1E0C9AE70]);
    objc_opt_class();
    v13 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v13 && -[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR("Executable")))
      {
        v15 = (void *)CFBundleGetValueForInfoDictionaryKey(a3, (CFStringRef)*MEMORY[0x1E0C9AAD8]);
        objc_opt_class();
        v16 = v15;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v16 && (objc_msgSend(v16, "isEqualToString:", CFSTR("Icon")) & 1) != 0)
          {
            v17 = CFBundleGetValueForInfoDictionaryKey(a3, CFSTR("CFBundleIcons"));

            if (!v17)
              goto LABEL_33;
            IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v81 = "+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]";
              v82 = 2112;
              v83 = a3;
              _os_log_impl(&dword_1A4BF6000, v18, OS_LOG_TYPE_DEFAULT, "%s: Attempting malformed icon key fixup for %@", buf, 0x16u);
            }

            v19 = (void *)_CFBundleCopyInfoPlistURL();
            if (!v19)
            {
              IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v81 = "_UpdateBundleWithCorrectedIconKeys";
                v82 = 2112;
                v83 = a3;
                _os_log_impl(&dword_1A4BF6000, v21, OS_LOG_TYPE_DEFAULT, "%s: Failed to get Info.plist URL from %@", buf, 0x16u);
              }
              goto LABEL_66;
            }
            v72 = 0;
            objc_msgSend(MEMORY[0x1E0C99D80], "IX_dictionaryWithContentsOfURL:options:error:", v19, 0, &v72);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v72;
            v22 = (void *)objc_msgSend(v20, "mutableCopy");

            if (!v22)
            {
              IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v19, "path");
                v59 = (__CFBundle *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v81 = "_UpdateBundleWithCorrectedIconKeys";
                v82 = 2112;
                v83 = v59;
                v84 = 2112;
                v85 = v21;
                _os_log_impl(&dword_1A4BF6000, v58, OS_LOG_TYPE_DEFAULT, "%s: Failed to fetch info plist from %@ : %@", buf, 0x20u);

              }
              goto LABEL_66;
            }
            v65 = a1;
            v70 = 0u;
            v71 = 0u;
            v68 = 0u;
            v69 = 0u;
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("CFBundleIcons~iphone"), CFSTR("CFBundleIcons~ipad"), 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, buf, 16);
            if (v24)
            {
              v25 = v24;
              v62 = v21;
              v63 = v19;
              v64 = a6;
              v26 = 0;
              v27 = *(_QWORD *)v69;
              do
              {
                for (i = 0; i != v25; ++i)
                {
                  if (*(_QWORD *)v69 != v27)
                    objc_enumerationMutation(v23);
                  v29 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
                  objc_msgSend(v22, "objectForKeyedSubscript:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v30)
                  {
                    objc_msgSend(v22, "setObject:forKeyedSubscript:", 0, v29);
                    v26 = 1;
                  }
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, buf, 16);
              }
              while (v25);

              v19 = v63;
              a6 = v64;
              v21 = v62;
              if ((v26 & 1) != 0)
              {
                v67 = v62;
                v31 = objc_msgSend(v22, "IX_writeToURL:format:options:error:", v63, 200, 268435457, &v67);
                v32 = v67;

                if ((v31 & 1) != 0)
                {
                  _CFBundleFlushBundleCaches();
                  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  v33 = objc_claimAutoreleasedReturnValue();
                  a1 = v65;
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v74 = 136315394;
                    v75 = "_UpdateBundleWithCorrectedIconKeys";
                    v76 = 2112;
                    v77 = a3;
                    _os_log_impl(&dword_1A4BF6000, v33, OS_LOG_TYPE_DEFAULT, "%s: Fixed up malformed icon keys in %@", v74, 0x16u);
                  }
                }
                else
                {
                  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  v33 = objc_claimAutoreleasedReturnValue();
                  a1 = v65;
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v63, "path");
                    v61 = (__CFBundle *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v74 = 136315650;
                    v75 = "_UpdateBundleWithCorrectedIconKeys";
                    v76 = 2112;
                    v77 = v61;
                    v78 = 2112;
                    v79 = v32;
                    _os_log_impl(&dword_1A4BF6000, v33, OS_LOG_TYPE_DEFAULT, "%s: Failed to write updated Info.plist to %@ : %@", v74, 0x20u);

                  }
                }

                v21 = v32;
LABEL_66:

                goto LABEL_33;
              }
            }
            else
            {

            }
            IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v74 = 136315394;
              v75 = "_UpdateBundleWithCorrectedIconKeys";
              v76 = 2112;
              v77 = a3;
              _os_log_impl(&dword_1A4BF6000, v60, OS_LOG_TYPE_DEFAULT, "%s: No offending keys found; skipping icon fixup for %@",
                v74,
                0x16u);
            }

            a1 = v65;
            goto LABEL_66;
          }
        }
        else
        {

          v16 = 0;
        }

      }
    }
    else
    {

      v13 = 0;
    }
LABEL_32:

  }
LABEL_33:
  v34 = (void *)MEMORY[0x1A85A5738]();
  CFBundleGetIdentifier(a3);
  v35 = (__CFBundle *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithURL:", v10);
  if (!v36)
  {
    objc_msgSend(v10, "path");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]", 228, CFSTR("IXErrorDomain"), 0xCuLL, 0, 0, CFSTR("Failed to initialize an icon for bundle at %@ "), v53, (uint64_t)v50);
LABEL_45:
    v48 = (id)objc_claimAutoreleasedReturnValue();
    v39 = 0;
LABEL_46:
    v42 = 0;
    goto LABEL_47;
  }
  v37 = *MEMORY[0x1E0D3A870];
  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A870]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    objc_msgSend(v10, "path");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]", 234, CFSTR("IXErrorDomain"), 0xCuLL, 0, 0, CFSTR("Failed to create image descriptor with name %@ while creating an icon for bundle at %@"), v54, v37);
    goto LABEL_45;
  }
  v39 = v38;
  objc_msgSend(v38, "setShouldApplyMask:", 0);
  v73 = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "prepareImagesForImageDescriptors:", v40);

  objc_msgSend(v36, "prepareImageForDescriptor:", v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    objc_msgSend(v10, "path");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]", 245, CFSTR("IXErrorDomain"), 0xCuLL, 0, 0, CFSTR("Failed to create image with descriptor %@ for bundle at %@"), v56, (uint64_t)v39);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
  v42 = v41;
  if (objc_msgSend(v41, "placeholder"))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "path");
      v44 = a6;
      v45 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v81 = "+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]";
      v82 = 2112;
      v83 = v35;
      v84 = 2112;
      v85 = v45;
      _os_log_impl(&dword_1A4BF6000, v43, OS_LOG_TYPE_DEFAULT, "%s: IconServices returned a placeholder icon for bundle with identifer %@ located at %@", buf, 0x20u);

      a6 = v44;
    }

  }
  v46 = objc_msgSend(v42, "CGImage");
  if (!v46)
  {
    objc_msgSend(v10, "path");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]", 255, CFSTR("IXErrorDomain"), 0xCuLL, 0, 0, CFSTR("Failed to get CGImageRef from ISImage %@ for bundle at %@"), v57, (uint64_t)v42);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  v66 = 0;
  objc_msgSend(a1, "_pngDataForCGImage:error:", v46, &v66);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v66;
  if (!v47)
  {
    v49 = a6;
    objc_msgSend(v10, "path");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder _iconDataForBundle:atURL:isFromSerializedPlaceholder:error:]", 261, CFSTR("IXErrorDomain"), 0xCuLL, v48, 0, CFSTR("Failed to create PNG data when constructing icon for bundle at %@"), v51, (uint64_t)v50);
    v52 = objc_claimAutoreleasedReturnValue();

    v48 = (id)v52;
    a6 = v49;
LABEL_47:

    v47 = 0;
  }

  objc_autoreleasePoolPop(v34);
  if (a6 && !v47)
    *a6 = objc_retainAutorelease(v48);

  return v47;
}

+ (id)_iconContentForBundleAtURL:(id)a3 infoPlistIconContent:(id *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  void *v22;
  id v23;

  v7 = a3;
  +[IXFileManager defaultManager](IXFileManager, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v8, "createTemporaryIconsDirectoryWithError:", &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;
  v11 = v10;
  if (!v9)
  {
    v13 = 0;
    if (a5)
    {
LABEL_14:
      v14 = objc_retainAutorelease(v11);
      v17 = 0;
      *a5 = v14;
      goto LABEL_15;
    }
LABEL_8:
    v17 = 0;
    v14 = v11;
    goto LABEL_15;
  }
  v22 = v10;
  v12 = IFCaptureIconContent();
  v13 = 0;
  v14 = v22;

  if ((v12 & 1) == 0)
  {
    if (v14)
    {
      objc_msgSend(v7, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError((uint64_t)"+[IXPlaceholder _iconContentForBundleAtURL:infoPlistIconContent:error:]", 292, CFSTR("IXErrorDomain"), 0xCuLL, v14, 0, CFSTR("Failed to capture icon content for placeholder from bundle at %@"), v19, (uint64_t)v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _CreateError((uint64_t)"+[IXPlaceholder _iconContentForBundleAtURL:infoPlistIconContent:error:]", 290, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("Bundle has no icon"), v15, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_13:
    objc_msgSend(v8, "removeItemAtURL:error:", v9, 0);
    if (a5)
      goto LABEL_14;
    goto LABEL_8;
  }
  if (!objc_msgSend(v13, "count"))
  {
    _CreateError((uint64_t)"+[IXPlaceholder _iconContentForBundleAtURL:infoPlistIconContent:error:]", 299, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("Bundle has no icon"), v16, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v13);
  v17 = v9;
LABEL_15:

  return v17;
}

+ (id)_infoPlistLocalizationDictionaryForBundleURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v30;
  id *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  +[IXFileManager defaultManager](IXFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v7, "urlsForItemsInDirectoryAtURL:ignoringSymlinks:error:", v5, 1, &v41);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v41;

  if (!v8)
  {
    v28 = 0;
    if (a4)
      goto LABEL_24;
    goto LABEL_26;
  }
  v31 = a4;
  v32 = v5;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v30 = v8;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (!v10)
    goto LABEL_21;
  v11 = v10;
  v12 = *(_QWORD *)v38;
  v34 = *MEMORY[0x1E0CB28A8];
  v33 = v6;
  do
  {
    v13 = 0;
    v14 = v9;
    do
    {
      if (*(_QWORD *)v38 != v12)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v13);
      objc_msgSend(v15, "pathExtension");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("lproj"));

      if (!v17)
      {
        v9 = v14;
        goto LABEL_19;
      }
      objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", CFSTR("InfoPlist.strings"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByDeletingPathExtension");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v18, &v36);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v36;

      v22 = v21;
      if (!v21)
      {
        objc_msgSend(v9, "domain");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v23, "isEqualToString:", v34))
        {

LABEL_15:
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "path");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v43 = "+[IXPlaceholder _infoPlistLocalizationDictionaryForBundleURL:error:]";
            v44 = 2112;
            v45 = v27;
            v46 = 2112;
            v47 = v9;
            _os_log_impl(&dword_1A4BF6000, v26, OS_LOG_TYPE_DEFAULT, "%s: Failed to read %@: %@", buf, 0x20u);

            v6 = v33;
          }

          v22 = (void *)MEMORY[0x1E0C9AA70];
          goto LABEL_18;
        }
        v24 = objc_msgSend(v9, "code");

        v22 = (void *)MEMORY[0x1E0C9AA70];
        v25 = v24 == 260;
        v6 = v33;
        if (!v25)
          goto LABEL_15;
      }
LABEL_18:
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, v20);

      v14 = v9;
LABEL_19:
      ++v13;
    }
    while (v11 != v13);
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  }
  while (v11);
LABEL_21:

  v28 = (void *)objc_msgSend(v6, "copy");
  a4 = v31;
  v5 = v32;
  v8 = v30;
  if (!v31)
    goto LABEL_26;
LABEL_24:
  if (!v28)
    *a4 = objc_retainAutorelease(v9);
LABEL_26:

  return v28;
}

+ (id)placeholderForInstallable:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5 metadata:(id)a6 error:(id *)a7
{
  return (id)objc_msgSend(a1, "_placeholderForInstallable:client:installType:metadata:isFromSerializedPlaceholder:error:", a3, a4, a5, a6, 0, a7);
}

+ (id)_placeholderForInstallable:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5 metadata:(id)a6 isFromSerializedPlaceholder:(BOOL)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  BOOL v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  unint64_t v61;
  id v62;
  unint64_t v63;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  char v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = v12;
  v15 = v13;
  v72 = 0;
  +[IXFileManager defaultManager](IXFileManager, "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  LODWORD(v13) = objc_msgSend(v16, "itemExistsAtURL:isDirectory:error:", v14, &v72, &v71);
  v17 = v71;
  v18 = v17;
  if (!(_DWORD)v13)
  {
    v23 = 0;
    v19 = 0;
    v21 = v17;
    goto LABEL_8;
  }
  if (!v72)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForInstallable:client:installType:metadata:isFromSerializedPlaceholder:error:].cold.1(v14, v26);

    objc_msgSend(v14, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForInstallable:client:installType:metadata:isFromSerializedPlaceholder:error:]", 407, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Item at %@ is unexpectedly a file"), v28, (uint64_t)v27);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v19 = 0;
    goto LABEL_21;
  }
  v62 = a1;
  v63 = a4;
  objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("Payload"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v18;
  v20 = objc_msgSend(v16, "itemExistsAtURL:isDirectory:error:", v19, &v72, &v70);
  v21 = v70;

  if ((v20 & 1) == 0)
  {
    objc_msgSend(v21, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v23 = 0;
LABEL_21:
      v22 = v15;
LABEL_22:
      v24 = v14;
      goto LABEL_51;
    }
    v29 = objc_msgSend(v21, "code");

    if (v29 == 2)
    {
      v61 = a5;
      v30 = 0;
      v22 = v15;
      v24 = v14;
LABEL_50:
      v66 = v21;
      BYTE1(v55) = a7;
      LOBYTE(v55) = v30;
      objc_msgSend(v62, "_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:", v24, v63, 0, v61, v22, 1, v55, &v66);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v21;
      v21 = v66;
LABEL_51:
      v25 = a8;

      if (!a8)
        goto LABEL_54;
      goto LABEL_52;
    }
    v23 = 0;
LABEL_8:
    v22 = v15;
    v24 = v14;
    goto LABEL_9;
  }
  if (!v72)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForInstallable:client:installType:metadata:isFromSerializedPlaceholder:error:].cold.2(v19, v31);

    objc_msgSend(v19, "path");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForInstallable:client:installType:metadata:isFromSerializedPlaceholder:error:]", 439, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Item at %@ is a file"), v33, (uint64_t)v32);
    v34 = objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v18 = v21;
    v21 = (id)v34;
    goto LABEL_21;
  }
  if (v15)
  {
    v61 = a5;
    v22 = v15;
    goto LABEL_31;
  }
  objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("iTunesMetadata.plist"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v21;
  v35 = objc_msgSend(v16, "itemExistsAtURL:error:", v18, &v69);
  v36 = v69;

  if (v35)
  {
    v68 = v36;
    objc_msgSend(MEMORY[0x1E0D3AD68], "metadataFromPlistAtURL:error:", v18, &v68);
    v37 = v36;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v68;

    if (!v23)
      goto LABEL_56;
    goto LABEL_30;
  }
  objc_msgSend(v36, "domain");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v36;
  if (!objc_msgSend(v38, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {

    v23 = 0;
LABEL_56:
    v22 = 0;
    goto LABEL_22;
  }
  v57 = v36;
  v39 = objc_msgSend(v36, "code");

  v23 = 0;
  v40 = v39 == 2;
  v21 = v57;
  if (!v40)
  {
    v22 = 0;
    goto LABEL_22;
  }
LABEL_30:
  v61 = a5;

  v22 = v23;
LABEL_31:
  v24 = v14;
  +[IXFileManager defaultManager](IXFileManager, "defaultManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  objc_msgSend(v41, "urlsForItemsInDirectoryAtURL:ignoringSymlinks:error:", v24, 1, &v77);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v77;

  if (v42)
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v59 = v42;
    v43 = v42;
    v44 = -[NSObject countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
    if (v44)
    {
      v45 = v44;
      v56 = v19;
      v58 = v21;
      v46 = *(_QWORD *)v74;
      while (2)
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v74 != v46)
            objc_enumerationMutation(v43);
          v48 = v43;
          objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "lastPathComponent");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v49, "hasPrefix:", CFSTR("com.apple.deltainstallcommands.")) & 1) != 0
            || (objc_msgSend(v49, "hasPrefix:", CFSTR("com.apple.parallelpatchinfo.")) & 1) != 0)
          {

            v30 = 1;
            v21 = v58;
            v42 = v59;
            v43 = v48;
            goto LABEL_43;
          }

          v43 = v48;
        }
        v45 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
        if (v45)
          continue;
        break;
      }
      v30 = 0;
      v21 = v58;
      v42 = v59;
LABEL_43:
      v19 = v56;
    }
    else
    {
      v30 = 0;
    }
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v24, "path");
      v50 = v43;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v79 = "_DirectoryContainsDeltaManifest";
      v80 = 2112;
      v81 = v51;
      v82 = 2112;
      v83 = v60;
      _os_log_impl(&dword_1A4BF6000, v50, OS_LOG_TYPE_DEFAULT, "%s: Failed to get contents of %@ : %@", buf, 0x20u);

      v43 = v50;
    }
    v30 = 0;
  }

  v67 = v21;
  AppURLFromExtractedPayloadDir(v19, &v67);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v67;
  v53 = v21;
  v21 = v52;

  if (v23)
  {

    v24 = v23;
    goto LABEL_50;
  }
LABEL_9:
  v25 = a8;
  if (!a8)
    goto LABEL_54;
LABEL_52:
  if (!v23)
    *v25 = objc_retainAutorelease(v21);
LABEL_54:

  return v23;
}

+ (id)placeholderFromSerializedPlaceholder:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5 error:(id *)a6
{
  id v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  char v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  +[IXFileManager defaultManager](IXFileManager, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v36 = 0;
  v11 = objc_msgSend(v10, "itemExistsAtURL:isDirectory:error:", v9, &v37, &v36);
  v12 = v36;
  v13 = v12;
  if (!v11)
    goto LABEL_13;
  if (v37)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder placeholderFromSerializedPlaceholder:client:installType:error:].cold.2(v9, v14);

    objc_msgSend(v9, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder placeholderFromSerializedPlaceholder:client:installType:error:]", 467, CFSTR("IXErrorDomain"), 0x2AuLL, 0, 0, CFSTR("Expected the serialized placeholder at %@ to be an IPA"), v16, (uint64_t)v15);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v19 = 0;
    v13 = (id)v17;
    if (!a6)
      goto LABEL_16;
LABEL_14:
    if (!v19)
      *a6 = objc_retainAutorelease(v13);
    goto LABEL_16;
  }
  v35 = v12;
  objc_msgSend(v10, "createTemporaryExtractionDirectoryWithError:", &v35);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v35;

  if (!v18)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder placeholderFromSerializedPlaceholder:client:installType:error:].cold.1();

    _CreateError((uint64_t)"+[IXPlaceholder placeholderFromSerializedPlaceholder:client:installType:error:]", 473, CFSTR("IXErrorDomain"), 0x2AuLL, v20, 0, CFSTR("Failed to create directory for extraction"), v24, v31);
    v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v18 = 0;
    v19 = 0;
    if (!a6)
      goto LABEL_16;
    goto LABEL_14;
  }
  v34 = v20;
  v21 = objc_msgSend(MEMORY[0x1E0D4E428], "extractZipArchiveAtURL:toURL:withError:", v9, v18, &v34);
  v22 = v34;

  if ((v21 & 1) != 0)
  {
    v33 = v22;
    +[IXPlaceholder _placeholderForInstallable:client:installType:metadata:isFromSerializedPlaceholder:error:](IXPlaceholder, "_placeholderForInstallable:client:installType:metadata:isFromSerializedPlaceholder:error:", v18, a4, a5, 0, 1, &v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v33;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v39 = "+[IXPlaceholder placeholderFromSerializedPlaceholder:client:installType:error:]";
      v40 = 2112;
      v41 = v29;
      v42 = 2112;
      v43 = v30;
      v44 = 2112;
      v45 = v22;
      _os_log_error_impl(&dword_1A4BF6000, v26, OS_LOG_TYPE_ERROR, "%s: Failed to extract %@ to %@ : %@", buf, 0x2Au);

    }
    objc_msgSend(v9, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder placeholderFromSerializedPlaceholder:client:installType:error:]", 479, CFSTR("IXErrorDomain"), 0x2AuLL, v22, 0, CFSTR("Failed to extract %@ to %@"), v28, (uint64_t)v27);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v19 = 0;
  }

  objc_msgSend(v10, "removeItemAtURL:error:", v18, 0);
  if (a6)
    goto LABEL_14;
LABEL_16:

  return v19;
}

+ (BOOL)_setEntitlementsFromBundleExecutableURL:(id)a3 withBundleID:(id)a4 client:(unint64_t)a5 onPlaceholder:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  CFDictionaryRef Copy;
  id v22;
  id v23;
  IXPromisedInMemoryDictionary *v24;
  void *v25;
  IXPromisedInMemoryDictionary *v26;
  char v27;
  id v28;
  BOOL v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  const __CFDictionary *Value;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  uint64_t v42;
  id v43;
  CFDictionaryRef information;
  uint64_t v45;
  void *v46;
  _BYTE staticCode[12];
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v11;
  *(_QWORD *)staticCode = 0;
  information = 0;
  if (SecStaticCodeCreateWithPath((CFURLRef)v14, 0, (SecStaticCodeRef *)staticCode))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:].cold.5(v14);

    objc_msgSend(v14, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"_IXCopyEntitlementsForPath", 597, CFSTR("IXErrorDomain"), 0x2BuLL, 0, 0, CFSTR("Failed to construct SecStaticCode for %@ : %d"), v17, (uint64_t)v16);
LABEL_9:
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    Copy = 0;
    goto LABEL_10;
  }
  if (SecCodeCopySigningInformation(*(SecStaticCodeRef *)staticCode, 4u, &information))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:].cold.4(v14);

    objc_msgSend(v14, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"_IXCopyEntitlementsForPath", 603, CFSTR("IXErrorDomain"), 0x2BuLL, 0, 0, CFSTR("SecCodeCopySigningInformation for %@ returned error %d"), v19, (uint64_t)v16);
    goto LABEL_9;
  }
  Value = (const __CFDictionary *)CFDictionaryGetValue(information, (const void *)*MEMORY[0x1E0CD6D10]);
  if (Value)
  {
    Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Value);
  }
  else
  {
    Copy = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      +[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:].cold.3(v14, v39);

  }
  v20 = 0;
LABEL_10:
  if (*(_QWORD *)staticCode)
  {
    CFRelease(*(CFTypeRef *)staticCode);
    *(_QWORD *)staticCode = 0;
  }
  if (information)
  {
    CFRelease(information);
    information = 0;
  }
  if (Copy)
    v22 = 0;
  else
    v22 = objc_retainAutorelease(v20);

  v23 = v22;
  if (!Copy)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)staticCode = 136315906;
      *(_QWORD *)&staticCode[4] = "+[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:]";
      v48 = 2112;
      v49 = v12;
      v50 = 2112;
      v51 = v31;
      v52 = 2112;
      v53 = v23;
      _os_log_error_impl(&dword_1A4BF6000, v30, OS_LOG_TYPE_ERROR, "%s: Failed to fetch entitlements for %@ from %@ : %@", staticCode, 0x2Au);

    }
    goto LABEL_26;
  }
  if (!-[__CFDictionary count](Copy, "count"))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)staticCode = 136315650;
      *(_QWORD *)&staticCode[4] = "+[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:]";
      v48 = 2112;
      v49 = v12;
      v50 = 2112;
      v51 = v14;
      _os_log_impl(&dword_1A4BF6000, v30, OS_LOG_TYPE_DEFAULT, "%s: Executable for %@ at %@ had no entitlements", staticCode, 0x20u);
    }
LABEL_26:

    v26 = 0;
    v29 = 1;
    goto LABEL_45;
  }
  v24 = [IXPromisedInMemoryDictionary alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entitlements Promise for %@"), v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[IXPromisedInMemoryDictionary initWithName:client:dictionary:](v24, "initWithName:client:dictionary:", v25, a5, Copy);

  if (v26)
  {
    v43 = v23;
    v27 = objc_msgSend(v13, "setEntitlementsPromise:error:", v26, &v43);
    v28 = v43;

    if ((v27 & 1) != 0)
    {

      v26 = 0;
      v29 = 1;
      v23 = v28;
      goto LABEL_45;
    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:].cold.2();

    _CreateError((uint64_t)"+[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:]", 668, CFSTR("IXErrorDomain"), 2uLL, v28, 0, CFSTR("Failed to set alternative entitlements promise for %@"), v37, (uint64_t)v12);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v45 = *MEMORY[0x1E0CB3388];
      v46 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    _CreateError((uint64_t)"+[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:]", 682, CFSTR("IXErrorDomain"), 1uLL, 0, v23, CFSTR("An error occurred before the entitlements promise could be set on the placeholder."), v38, v42);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise cancelForReason:client:error:](v26, "cancelForReason:client:error:", v40, 15, 0);

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:].cold.1();

    _CreateError((uint64_t)"+[IXPlaceholder _setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:]", 663, CFSTR("IXErrorDomain"), 2uLL, 0, 0, CFSTR("Failed to create IXPromisedInMemoryDictionary for entitlements for %@"), v33, (uint64_t)v12);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a7)
  {
    v23 = objc_retainAutorelease(v34);
    v29 = 0;
    *a7 = v23;
  }
  else
  {
    v29 = 0;
    v23 = v34;
  }
LABEL_45:

  return v29;
}

+ (id)_placeholderForBundle:(id)a3 client:(unint64_t)a4 withParent:(id)a5 installType:(unint64_t)a6 metadata:(id)a7 placeholderType:(unint64_t)a8 mayBeDeltaPackage:(BOOL)a9 isFromSerializedPlaceholder:(BOOL)a10 error:(id *)a11
{
  id v16;
  id v17;
  uint64_t Unique;
  __CFBundle *v19;
  IXPlaceholderAttributes *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  IXPromisedTransferToPath *v30;
  IXPromisedTransferToPath *v31;
  IXPromisedInMemoryData *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  void *ValueForInfoDictionaryKey;
  id v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  CFURLRef v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  IXPromisedTransferToPath *v51;
  void *v52;
  IXPromisedTransferToPath *v53;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  IXPlaceholder *v61;
  unint64_t v62;
  IXPlaceholderAttributes *v63;
  id v64;
  char v65;
  void *v66;
  char v67;
  uint64_t v68;
  char v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  IXPromisedTransferToPath *v73;
  void *v74;
  char v75;
  id v76;
  NSObject *v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  IXPromisedTransferToPath *v83;
  void *v84;
  int v85;
  int v86;
  NSObject *v87;
  _BOOL4 v88;
  void *v89;
  IXPromisedInMemoryData *v90;
  NSObject *v91;
  uint64_t v92;
  IXPromisedTransferToPath *v93;
  void *v94;
  IXPromisedTransferToPath *v95;
  void *v96;
  unint64_t v97;
  IXPromisedTransferToPath *v98;
  char v99;
  NSObject *v100;
  void *v101;
  void *v102;
  IXPromisedInMemoryData *v103;
  void *v104;
  char v105;
  IXPromisedInMemoryData *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  NSObject *v110;
  void *v111;
  IXPromisedTransferToPath *v112;
  void *v113;
  NSObject *v114;
  uint64_t v115;
  NSObject *v116;
  uint64_t v117;
  NSObject *v118;
  uint64_t v119;
  NSObject *v120;
  uint64_t v121;
  NSObject *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  IXPromisedTransferToPath *v126;
  void *v127;
  void *v128;
  char v129;
  id v130;
  uint64_t v131;
  int v132;
  char v133;
  IXPromisedTransferToPath *v134;
  NSObject *v135;
  uint64_t v136;
  NSObject *v137;
  void *v138;
  uint64_t v139;
  NSObject *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const __CFString *v145;
  const __CFString *v146;
  BOOL v147;
  void *v148;
  id v149;
  id v150;
  uint64_t i;
  void *v152;
  void *v153;
  int v154;
  BOOL v155;
  void *v156;
  NSObject *v157;
  void *v158;
  void *v159;
  char v160;
  NSObject *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  NSObject *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  NSObject *v170;
  uint64_t v171;
  NSObject *v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  id obj;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  unint64_t v183;
  unint64_t v184;
  id v185;
  void *v186;
  uint64_t v187;
  IXPromisedTransferToPath *v188;
  void *v189;
  void *v190;
  void *v191;
  id v192;
  void *v193;
  const __CFURL *v194;
  void *v195;
  IXPlaceholderAttributes *v196;
  void *v197;
  uint64_t v198;
  id v199;
  IXPromisedTransferToPath *v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  id v205;
  id v206;
  id v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  id v212;
  char v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  id v218;
  id v219;
  id v220;
  IXPromisedInMemoryData *v221;
  id v222;
  NSObject *v223;
  id v224;
  id v225;
  id v226;
  id v227;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  id v233;
  _BYTE v234[128];
  uint64_t v235;
  id v236;
  _BYTE v237[128];
  uint8_t v238[128];
  uint8_t buf[4];
  const char *v240;
  __int16 v241;
  void *v242;
  __int16 v243;
  void *v244;
  __int16 v245;
  NSObject *p_super;
  uint64_t v247;

  v247 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v199 = a5;
  v192 = a7;
  v17 = (id)objc_opt_new();
  +[IXFileManager defaultManager](IXFileManager, "defaultManager");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  Unique = _CFBundleCreateUnique();
  v195 = v16;
  if (!Unique)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.1(v16, v26);

    objc_msgSend(v16, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 730, CFSTR("IXErrorDomain"), 0xAuLL, 0, 0, CFSTR("Failed to create CFBundle from %@"), v28, (uint64_t)v27);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v190 = 0;
    v191 = 0;
    v186 = 0;
    v188 = 0;
    v196 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v194 = 0;
    v189 = 0;
    v23 = 0;
    v200 = 0;
    goto LABEL_29;
  }
  v19 = (__CFBundle *)Unique;
  v233 = 0;
  v20 = -[IXPlaceholderAttributes initWithInfoPlistFromBundle:error:]([IXPlaceholderAttributes alloc], "initWithInfoPlistFromBundle:error:", Unique, &v233);
  v21 = v233;
  v196 = v20;
  if (!v20)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.2();

    objc_msgSend(v16, "path");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 736, CFSTR("IXErrorDomain"), 2uLL, v21, 0, CFSTR("Failed create placeholder attributes from %@"), v35, (uint64_t)v34);
    goto LABEL_17;
  }
  v185 = a1;
  CFBundleGetIdentifier(v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.3(v16, v36);

    objc_msgSend(v16, "path");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 742, CFSTR("IXErrorDomain"), 0xDuLL, 0, 0, CFSTR("Failed to get bundle ID from %@"), v37, (uint64_t)v34);
LABEL_17:
    v38 = (id)objc_claimAutoreleasedReturnValue();

    v200 = 0;
    v23 = 0;
LABEL_25:
    v189 = 0;
LABEL_26:
    v44 = 0;
    v32 = 0;
    v186 = 0;
    v188 = 0;
    v31 = 0;
    v30 = 0;
    v190 = 0;
    v191 = 0;
    goto LABEL_27;
  }
  v23 = v22;
  if (objc_msgSend(v22, "containsString:", CFSTR("/")))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.4();

    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 747, CFSTR("IXErrorDomain"), 0x2CuLL, 0, 0, CFSTR("Bundle identifier %@ contains \"/\", which is not allowed"), v25, (uint64_t)v23);
LABEL_24:
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v200 = 0;
    goto LABEL_25;
  }
  if (!objc_msgSend(v23, "length"))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.5();

    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 752, CFSTR("IXErrorDomain"), 0x2CuLL, 0, 0, CFSTR("Bundle identifier is an empty string, which is not allowed"), v43, (uint64_t)v174);
    goto LABEL_24;
  }
  ValueForInfoDictionaryKey = (void *)CFBundleGetValueForInfoDictionaryKey(v19, (CFStringRef)*MEMORY[0x1E0C9AAC8]);
  objc_opt_class();
  v40 = ValueForInfoDictionaryKey;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v41 = v40;
  else
    v41 = 0;

  if (!v41 || !objc_msgSend(v41, "length"))
  {
    v183 = a4;
    v55 = v41;
    v56 = (void *)CFBundleGetValueForInfoDictionaryKey(v19, (CFStringRef)*MEMORY[0x1E0C9AE88]);
    objc_opt_class();
    v57 = v56;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v58 = v57;
    else
      v58 = 0;

    if (v58 && objc_msgSend(v58, "length"))
    {
      v41 = v58;
    }
    else
    {
      objc_msgSend(v16, "URLByDeletingPathExtension");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "lastPathComponent");
      v60 = objc_claimAutoreleasedReturnValue();

      v41 = (id)v60;
    }
    a4 = v183;
  }
  v61 = [IXPlaceholder alloc];
  v189 = v41;
  if (v199)
  {
    v230 = v21;
    v62 = a4;
    v31 = -[IXPlaceholder _initAppExtensionPlaceholderWithBundleURL:bundleName:bundleID:parentPlaceholder:client:error:](v61, "_initAppExtensionPlaceholderWithBundleURL:bundleName:bundleID:parentPlaceholder:client:error:", v16, v41, v23, v199, a4, &v230);
    v38 = v230;

    if (!v31)
    {
      v200 = 0;
      v44 = 0;
      v32 = 0;
      v186 = 0;
      v188 = 0;
      v30 = 0;
      v190 = 0;
      v191 = 0;
      goto LABEL_28;
    }
    v63 = v196;
    -[IXPlaceholderAttributes setLaunchProhibited:](v196, "setLaunchProhibited:", 0);
    v21 = v38;
    a4 = v62;
  }
  else
  {
    v232 = v21;
    v31 = -[IXPlaceholder initAppPlaceholderWithBundleName:bundleID:installType:client:error:](v61, "initAppPlaceholderWithBundleName:bundleID:installType:client:error:", v41, v23, a6, a4, &v232);
    v64 = v232;

    if (!v31)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.6();

      _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 770, CFSTR("IXErrorDomain"), 2uLL, v64, 0, CFSTR("Failed to create IXPlaceholder for app bundle ID %@"), v78, (uint64_t)v23);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v200 = 0;
      v21 = v64;
      goto LABEL_26;
    }
    v231 = v64;
    v65 = -[IXPromisedTransferToPath setMetadata:error:](v31, "setMetadata:error:", v192, &v231);
    v21 = v231;

    if ((v65 & 1) == 0)
    {
      v200 = v31;
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.21();

      _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 775, CFSTR("IXErrorDomain"), 2uLL, v21, 0, CFSTR("Failed to set metadata for %@"), v80, (uint64_t)v23);
      goto LABEL_79;
    }
    v63 = v196;
    -[IXPlaceholderAttributes setExtensionDictionary:](v196, "setExtensionDictionary:", 0);
    -[IXPlaceholderAttributes setExAppExtensionAttributes:](v196, "setExAppExtensionAttributes:", 0);
  }
  v66 = v21;
  v229 = v21;
  v67 = -[IXPromisedTransferToPath setPlaceholderAttributes:error:](v31, "setPlaceholderAttributes:error:", v63, &v229);
  v21 = v229;

  v200 = v31;
  if ((v67 & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.20();

    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 795, CFSTR("IXErrorDomain"), 2uLL, v21, 0, CFSTR("Failed to set placeholder attributes %@"), v71, (uint64_t)v23);
LABEL_79:
    v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v184 = a4;
  v44 = CFBundleCopyExecutableURL(v19);
  objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlaceholderEntitlements.plist"), 0);
  v68 = objc_claimAutoreleasedReturnValue();
  v191 = (void *)v68;
  if (v44 && objc_msgSend(v193, "itemExistsAtURL:", v44))
  {
    v228 = v21;
    v69 = objc_msgSend(v185, "_setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:", v44, v23, v184, v31, &v228);
    v38 = v228;

    if ((v69 & 1) == 0)
    {
      v32 = 0;
      v186 = 0;
      v188 = 0;
      v31 = 0;
      v30 = 0;
      v190 = 0;
      goto LABEL_28;
    }
    v194 = v44;
  }
  else
  {
    v194 = v44;
    if (objc_msgSend(v193, "itemExistsAtURL:", v68))
    {
      v72 = objc_msgSend(v193, "diskUsageForURL:", v68);
      v73 = [IXPromisedTransferToPath alloc];
      v198 = (uint64_t)v23;
      v174 = v23;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entitlements Promise for %@"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[IXPromisedTransferToPath initWithName:client:transferPath:diskSpaceNeeded:](v73, "initWithName:client:transferPath:diskSpaceNeeded:", v74, v184, v68, v72);

      if (!v31)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v81 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v198;
        v44 = v194;
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.7();

        _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 811, CFSTR("IXErrorDomain"), 2uLL, 0, 0, CFSTR("Failed to create IXPromisedTransferToPath for entitlements for %@"), v82, v198);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        v186 = 0;
        v188 = 0;
        v31 = 0;
        v30 = 0;
        v190 = 0;
        goto LABEL_27;
      }
      -[IXPromisedTransferToPath setShouldCopy:](v31, "setShouldCopy:", 1);
      -[IXPromisedTransferToPath setComplete:](v31, "setComplete:", 1);
      v227 = v21;
      v75 = -[IXPromisedTransferToPath setEntitlementsPromise:error:](v200, "setEntitlementsPromise:error:", v31, &v227);
      v76 = v227;

      v23 = (void *)v198;
      if ((v75 & 1) == 0)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v114 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.19();

        _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 819, CFSTR("IXErrorDomain"), 2uLL, v76, 0, CFSTR("Failed to set entitlements promise for %@"), v115, v198);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        v186 = 0;
        v188 = 0;
        v30 = 0;
        v190 = 0;
        v21 = v76;
        goto LABEL_156;
      }
      v21 = v76;
    }
    else
    {
      if (v199)
      {
        v38 = v21;
        goto LABEL_92;
      }
      v83 = (IXPromisedTransferToPath *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v23, 0, 0);
      v31 = v83;
      if (v83)
      {
        -[IXPromisedTransferToPath executableURL](v83, "executableURL");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if (v84)
        {
          v226 = v21;
          v85 = objc_msgSend(v185, "_setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:", v84, v23, v184, v200, &v226);
          v38 = v226;

          if (!v85)
          {

            v32 = 0;
            v186 = 0;
            v188 = 0;
            v30 = 0;
            v190 = 0;
            v21 = v31;
            v31 = 0;
            goto LABEL_156;
          }
          v21 = v38;
        }

      }
    }

    v38 = v21;
    v31 = v200;
  }
LABEL_92:
  v86 = objc_msgSend(MEMORY[0x1E0D3AD20], "fullFidelityIconsEnabled");
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v87 = objc_claimAutoreleasedReturnValue();
  v88 = os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT);
  if (v86)
  {
    if (v88)
    {
      objc_msgSend(v16, "path");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v240 = "+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPack"
             "age:isFromSerializedPlaceholder:error:]";
      v241 = 2112;
      v242 = v23;
      v243 = 2112;
      v244 = v89;
      _os_log_impl(&dword_1A4BF6000, v87, OS_LOG_TYPE_DEFAULT, "%s: Using full fidelity icons for %@ at %@", buf, 0x20u);

    }
    v225 = 0;
    v224 = v38;
    objc_msgSend(v185, "_iconContentForBundleAtURL:infoPlistIconContent:error:", v16, &v225, &v224);
    v90 = (IXPromisedInMemoryData *)objc_claimAutoreleasedReturnValue();
    v21 = v225;
    v91 = v224;

    v197 = v23;
    if (v90)
    {
      v92 = objc_msgSend(v193, "diskUsageForURL:", v90);
      v93 = [IXPromisedTransferToPath alloc];
      v94 = v23;
      v95 = v93;
      v174 = v94;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Icon resources for %@"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v184;
      v98 = -[IXPromisedTransferToPath initWithName:client:transferPath:diskSpaceNeeded:](v95, "initWithName:client:transferPath:diskSpaceNeeded:", v96, v184, v90, v92);

      v188 = v98;
      if (v98)
      {
        -[IXPromisedTransferToPath setComplete:](v98, "setComplete:", 1);
        v223 = v91;
        v99 = -[IXPromisedTransferToPath setIconResourcesPromise:withInfoPlistContent:error:](v200, "setIconResourcesPromise:withInfoPlistContent:error:", v98, v21, &v223);
        v100 = v223;

        if ((v99 & 1) != 0)
        {
          v32 = v90;
          v101 = v21;
          v21 = v100;
LABEL_105:
          v31 = v200;
          goto LABEL_135;
        }
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v120 = objc_claimAutoreleasedReturnValue();
        v23 = v197;
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.16();

        _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 860, CFSTR("IXErrorDomain"), 2uLL, v100, 0, CFSTR("Failed to set icon resources promise for %@"), v121, (uint64_t)v197);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v91 = v100;
      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v116 = objc_claimAutoreleasedReturnValue();
        v23 = v197;
        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.15();

        _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 853, CFSTR("IXErrorDomain"), 2uLL, 0, 0, CFSTR("Failed to create IXPromisedTransferToPath for icon resources at %@ for %@"), v117, (uint64_t)v90);
        v38 = (id)objc_claimAutoreleasedReturnValue();
      }

      v32 = 0;
      goto LABEL_130;
    }
    -[NSObject domain](v91, "domain");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v107, "isEqualToString:", CFSTR("IXErrorDomain")))
    {
      v108 = v23;
      v109 = -[NSObject code](v91, "code");

      v147 = v109 == 23;
      v23 = v108;
      if (v147)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v110 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
        {
LABEL_133:

          v31 = v200;
          v97 = v184;
          goto LABEL_134;
        }
        objc_msgSend(v16, "path");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v240 = "+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPa"
               "ckage:isFromSerializedPlaceholder:error:]";
        v241 = 2112;
        v242 = v108;
        v243 = 2112;
        v244 = v111;
        _os_log_impl(&dword_1A4BF6000, v110, OS_LOG_TYPE_DEFAULT, "%s: No icon found for bundle %@ at %@", buf, 0x20u);
LABEL_207:

        goto LABEL_133;
      }
    }
    else
    {

    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v110 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      goto LABEL_133;
    objc_msgSend(v16, "path");
    v169 = v23;
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v240 = "+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackag"
           "e:isFromSerializedPlaceholder:error:]";
    v241 = 2112;
    v242 = v169;
    v243 = 2112;
    v244 = v111;
    v245 = 2112;
    p_super = v91;
    _os_log_error_impl(&dword_1A4BF6000, v110, OS_LOG_TYPE_ERROR, "%s: Failed to get icon content for bundle with identifier %@ at %@ : %@", buf, 0x2Au);
    goto LABEL_207;
  }
  if (v88)
  {
    objc_msgSend(v16, "path");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v240 = "+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackag"
           "e:isFromSerializedPlaceholder:error:]";
    v241 = 2112;
    v242 = v23;
    v243 = 2112;
    v244 = v102;
    _os_log_impl(&dword_1A4BF6000, v87, OS_LOG_TYPE_DEFAULT, "%s: Using single PNG icon for %@ at %@", buf, 0x20u);

  }
  v222 = v38;
  objc_msgSend(v185, "_iconDataForBundle:atURL:isFromSerializedPlaceholder:error:", v19, v16, a10, &v222);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v90 = (IXPromisedInMemoryData *)v222;

  if (v21)
  {
    v103 = [IXPromisedInMemoryData alloc];
    v174 = v23;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Icon for %@"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v184;
    v32 = -[IXPromisedInMemoryData initWithName:client:data:](v103, "initWithName:client:data:", v104, v184, v21);

    if (v32)
    {
      v221 = v90;
      v105 = -[IXPromisedTransferToPath setIconPromise:error:](v200, "setIconPromise:error:", v32, &v221);
      v106 = v221;

      if ((v105 & 1) != 0)
      {
        v197 = v23;
        v188 = 0;
        v101 = v21;
        v21 = v106;
        goto LABEL_105;
      }
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v122 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
        +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.18();

      _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 885, CFSTR("IXErrorDomain"), 2uLL, v106, 0, CFSTR("Failed to set icon promise for %@"), v123, (uint64_t)v23);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v90 = v106;
    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v118 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.17();

      _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 880, CFSTR("IXErrorDomain"), 2uLL, 0, 0, CFSTR("Failed to create IXPromisedInMemoryData for icon for %@"), v119, (uint64_t)v23);
      v38 = (id)objc_claimAutoreleasedReturnValue();
    }

    v188 = 0;
LABEL_130:
    v31 = 0;
    v30 = 0;
    v186 = 0;
    v190 = 0;
    goto LABEL_156;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v91 = objc_claimAutoreleasedReturnValue();
  v97 = v184;
  v197 = v23;
  if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v16, "path");
    v112 = v31;
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v240 = "+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackag"
           "e:isFromSerializedPlaceholder:error:]";
    v241 = 2112;
    v242 = v23;
    v243 = 2112;
    v244 = v113;
    v245 = 2112;
    p_super = &v90->super.super.super;
    _os_log_error_impl(&dword_1A4BF6000, v91, OS_LOG_TYPE_ERROR, "%s: Failed to get icon data for bundle with identifier %@ at %@ : %@", buf, 0x2Au);

    v31 = v112;
  }
LABEL_134:

  v188 = 0;
  v32 = v90;
  v101 = v21;
  v21 = 0;
LABEL_135:

  v124 = v195;
  objc_msgSend(v195, "URLByAppendingPathComponent:isDirectory:", CFSTR("InfoPlist.loctable"), 0);
  v125 = objc_claimAutoreleasedReturnValue();
  v52 = v193;
  v190 = (void *)v125;
  if (!objc_msgSend(v193, "itemExistsAtURL:", v125))
  {
    v130 = v21;
    goto LABEL_140;
  }
  v187 = objc_msgSend(v193, "diskUsageForURL:", v125);
  v126 = [IXPromisedTransferToPath alloc];
  v127 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v195, "path");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "stringWithFormat:", CFSTR("Loctable Promise for %@"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[IXPromisedTransferToPath initWithName:client:transferPath:diskSpaceNeeded:](v126, "initWithName:client:transferPath:diskSpaceNeeded:", v128, v97, v125, v187);

  if (!v30)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v137 = objc_claimAutoreleasedReturnValue();
    v23 = v197;
    if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.8(v195, v137);

    objc_msgSend(v195, "path");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 901, CFSTR("IXErrorDomain"), 2uLL, 0, 0, CFSTR("Failed to create IXPromisedTransferToPath for loctable for %@"), v139, (uint64_t)v138);
    v38 = (id)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    v31 = 0;
    v30 = 0;
    goto LABEL_155;
  }
  -[IXPromisedTransferToPath setShouldCopy:](v30, "setShouldCopy:", 1);
  -[IXPromisedTransferToPath setComplete:](v30, "setComplete:", 1);
  v220 = v21;
  v31 = v200;
  v129 = -[IXPromisedTransferToPath setInfoPlistLoctablePromise:error:](v200, "setInfoPlistLoctablePromise:error:", v30, &v220);
  v130 = v220;

  if ((v129 & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v140 = objc_claimAutoreleasedReturnValue();
    v23 = v197;
    if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.14();

    objc_msgSend(v190, "path");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 909, CFSTR("IXErrorDomain"), 2uLL, v130, 0, CFSTR("Failed to set loctable promise for %@"), v142, (uint64_t)v141);
    v38 = (id)objc_claimAutoreleasedReturnValue();

    v21 = v130;
    v32 = 0;
    v31 = 0;
LABEL_155:
    v186 = 0;
    goto LABEL_156;
  }

  v124 = v195;
  v52 = v193;
LABEL_140:
  v219 = v130;
  objc_msgSend(v185, "_infoPlistLocalizationDictionaryForBundleURL:error:", v124, &v219);
  v131 = objc_claimAutoreleasedReturnValue();
  v21 = v219;

  if (!v131)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v135 = objc_claimAutoreleasedReturnValue();
    v23 = v197;
    v44 = v194;
    if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.9();

    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 919, CFSTR("IXErrorDomain"), 2uLL, v21, 0, CFSTR("Failed to set localization dictionary for %@"), v136, (uint64_t)v197);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v31 = 0;
    v30 = 0;
    v186 = 0;
    goto LABEL_27;
  }
  v218 = v21;
  v186 = (void *)v131;
  v132 = -[IXPromisedTransferToPath setInfoPlistLocalizations:error:](v31, "setInfoPlistLocalizations:error:", v131, &v218);
  v38 = v218;

  if (!v132)
  {
    v32 = 0;
    v31 = 0;
    v30 = 0;
    v23 = v197;
    v44 = v194;
    goto LABEL_28;
  }
  if (v199)
    goto LABEL_143;
  v216 = 0u;
  v217 = 0u;
  v214 = 0u;
  v215 = 0u;
  v175 = objc_msgSend(&unk_1E4DD8778, "countByEnumeratingWithState:objects:count:", &v214, v238, 16);
  if (!v175)
    goto LABEL_193;
  v176 = *(_QWORD *)v215;
  do
  {
    v143 = 0;
    do
    {
      if (*(_QWORD *)v215 != v176)
        objc_enumerationMutation(&unk_1E4DD8778);
      v177 = v143;
      v144 = objc_msgSend(*(id *)(*((_QWORD *)&v214 + 1) + 8 * v143), "unsignedIntegerValue");
      v145 = CFSTR("Extensions");
      if (v144 != 3)
        v145 = 0;
      v178 = v144;
      if (v144 == 2)
        v146 = CFSTR("PlugIns");
      else
        v146 = v145;
      objc_msgSend(v124, "URLByAppendingPathComponent:isDirectory:", v146, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v213 = 0;
      if (objc_msgSend(v52, "itemExistsAtURL:isDirectory:error:", v21, &v213, 0))
        v147 = v213 == 0;
      else
        v147 = 1;
      if (v147)
        goto LABEL_191;
      v212 = v38;
      objc_msgSend(v52, "urlsForItemsInDirectoryAtURL:ignoringSymlinks:error:", v21, 1, &v212);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = v212;

      if (!v148)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v172 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR))
          +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.12();

        objc_msgSend(v21, "path");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 937, CFSTR("IXErrorDomain"), 2uLL, v149, 0, CFSTR("Failed to get URLs of items at %@"), v173, (uint64_t)v168);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v23 = v197;
LABEL_205:
        v44 = v194;

        v32 = 0;
        v31 = 0;
        v30 = 0;
        goto LABEL_27;
      }
      v210 = 0u;
      v211 = 0u;
      v208 = 0u;
      v209 = 0u;
      v150 = v148;
      v181 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v208, v237, 16);
      if (!v181)
        goto LABEL_190;
      v180 = *(_QWORD *)v209;
      obj = v150;
      while (2)
      {
        for (i = 0; i != v181; ++i)
        {
          v182 = v149;
          if (*(_QWORD *)v209 != v180)
            objc_enumerationMutation(obj);
          v152 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * i);
          objc_msgSend(v152, "pathExtension");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = objc_msgSend(v153, "isEqualToString:", CFSTR("appex"));

          if (!v154)
          {
            v124 = v195;
            v149 = v182;
            continue;
          }
          v23 = v197;
          v155 = a9;
          if (!a9)
            goto LABEL_185;
          objc_msgSend(v152, "URLByAppendingPathComponent:isDirectory:", CFSTR("Info.plist"), 0);
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v52, "itemDoesNotExistAtURL:", v156) & 1) == 0)
          {

            v155 = a9;
LABEL_185:
            v207 = v182;
            BYTE1(v174) = a10;
            LOBYTE(v174) = v155;
            objc_msgSend(v185, "_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:", v152, v184, v200, 0, 0, v178, v174, &v207);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            v159 = v152;
            v149 = v207;

            if (!v156)
            {
              v163 = v159;
              v164 = v149;
              IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
              v165 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
                +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.13();

              objc_msgSend(v163, "path");
              v166 = (void *)objc_claimAutoreleasedReturnValue();
              _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 958, CFSTR("IXErrorDomain"), 2uLL, v164, 0, CFSTR("Failed to create app extension placeholder for %@"), v167, (uint64_t)v166);
              v38 = (id)objc_claimAutoreleasedReturnValue();

              v168 = obj;
              v149 = obj;
              goto LABEL_205;
            }
            objc_msgSend(v17, "addObject:", v156);
            goto LABEL_187;
          }
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v157 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v152, "path");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v240 = "+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDel"
                   "taPackage:isFromSerializedPlaceholder:error:]";
            v241 = 2112;
            v242 = v158;
            _os_log_impl(&dword_1A4BF6000, v157, OS_LOG_TYPE_DEFAULT, "%s: Skipping incomplete app extension in delta package at %@", buf, 0x16u);

          }
          v149 = v182;
LABEL_187:

          v124 = v195;
        }
        v150 = obj;
        v181 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v208, v237, 16);
        if (v181)
          continue;
        break;
      }
LABEL_190:

      v38 = v149;
      v31 = v200;
LABEL_191:

      v143 = v177 + 1;
    }
    while (v177 + 1 != v175);
    v175 = objc_msgSend(&unk_1E4DD8778, "countByEnumeratingWithState:objects:count:", &v214, v238, 16);
  }
  while (v175);
LABEL_193:
  if (!objc_msgSend(v17, "count"))
    goto LABEL_196;
  v206 = v38;
  v160 = -[IXPromisedTransferToPath setAppExtensionPlaceholderPromises:error:](v31, "setAppExtensionPlaceholderPromises:error:", v17, &v206);
  v21 = v206;

  if ((v160 & 1) != 0)
  {
    v38 = v21;
LABEL_196:

    v17 = 0;
LABEL_143:
    v205 = v38;
    v133 = -[IXPromisedTransferToPath setConfigurationCompleteWithError:](v31, "setConfigurationCompleteWithError:", &v205);
    v21 = v205;

    if ((v133 & 1) != 0)
    {
      v134 = v31;
      CFRelease(v19);
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v200 = v134;
      v51 = v134;
      goto LABEL_42;
    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v161 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.10();

    v23 = v197;
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 975, CFSTR("IXErrorDomain"), 2uLL, v21, 0, CFSTR("Failed to set configuration complete for %@"), v162, (uint64_t)v197);
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v170 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
      +[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:].cold.11();

    v23 = v197;
    _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 968, CFSTR("IXErrorDomain"), 2uLL, v21, 0, CFSTR("Failed to set app extension placeholders for %@"), v171, (uint64_t)v197);
  }
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v31 = 0;
  v30 = 0;
LABEL_156:
  v44 = v194;
LABEL_27:

LABEL_28:
  v194 = v44;
  CFRelease(v19);
  v21 = v38;
LABEL_29:
  if (a11)
    *a11 = objc_retainAutorelease(v21);
  v197 = v23;
  if (v21)
  {
    v235 = *MEMORY[0x1E0CB3388];
    v236 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v236, &v235, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
  }
  _CreateError((uint64_t)"+[IXPlaceholder _placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:]", 993, CFSTR("IXErrorDomain"), 1uLL, 0, v45, CFSTR("Canceling because an error occurred during creation of the IXPlaceholder"), v29, (uint64_t)v174);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise cancelForReason:client:error:](v200, "cancelForReason:client:error:", v46, 15, 0);
  -[IXDataPromise cancelForReason:client:error:](v31, "cancelForReason:client:error:", v46, 15, 0);
  -[IXDataPromise cancelForReason:client:error:](v32, "cancelForReason:client:error:", v46, 15, 0);
  -[IXDataPromise cancelForReason:client:error:](v30, "cancelForReason:client:error:", v46, 15, 0);
  v201 = 0u;
  v202 = 0u;
  v203 = 0u;
  v204 = 0u;
  v17 = v17;
  v47 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v201, v234, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v202;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v202 != v49)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v201 + 1) + 8 * j), "cancelForReason:client:error:", v46, 15, 0);
      }
      v48 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v201, v234, 16);
    }
    while (v48);
  }

  v51 = 0;
  v52 = v193;
LABEL_42:
  v53 = v51;

  return v53;
}

- (id)initAppPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 client:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  IXPlaceholder *v15;
  IXPlaceholder *v16;
  objc_super v18;

  v12 = a3;
  v13 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("App Placeholder: %@ (%@)"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)IXPlaceholder;
  v15 = -[IXOwnedDataPromise initWithName:client:diskSpaceNeeded:](&v18, sel_initWithName_client_diskSpaceNeeded_, v14, a6, 0);

  if (v15
    && !-[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:](v15, "_doInitWithBundleName:bundleID:installType:placeholderType:error:", v12, v13, a5, 1, a7))
  {
    v16 = 0;
  }
  else
  {
    v16 = v15;
  }

  return v16;
}

- (id)_initAppExtensionPlaceholderWithBundleURL:(id)a3 bundleName:(id)a4 bundleID:(id)a5 parentPlaceholder:(id)a6 client:(unint64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  IXPlaceholder *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  objc_msgSend(v14, "URLByDeletingLastPathComponent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("PlugIns")))
  {
    v20 = -[IXPlaceholder initPlugInPlaceholderWithBundleName:bundleID:parentPlaceholder:client:error:](self, "initPlugInPlaceholderWithBundleName:bundleID:parentPlaceholder:client:error:", v15, v16, v17, a7, a8);
LABEL_5:
    self = (IXPlaceholder *)v20;
    v21 = self;
    goto LABEL_11;
  }
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("Extensions")))
  {
    v20 = -[IXPlaceholder initExtensionKitPlaceholderWithBundleName:bundleID:parentPlaceholder:client:error:](self, "initExtensionKitPlaceholderWithBundleName:bundleID:parentPlaceholder:client:error:", v15, v16, v17, a7, a8);
    goto LABEL_5;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[IXPlaceholder _initAppExtensionPlaceholderWithBundleURL:bundleName:bundleID:parentPlaceholder:client:error:].cold.1();

  _CreateError((uint64_t)"-[IXPlaceholder _initAppExtensionPlaceholderWithBundleURL:bundleName:bundleID:parentPlaceholder:client:error:]", 1029, CFSTR("IXErrorDomain"), 2uLL, 0, 0, CFSTR("Unable to determine IXPlaceholder type for this app extension bundle at %@"), v23, (uint64_t)v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (a8)
    *a8 = objc_retainAutorelease(v24);

  v21 = 0;
LABEL_11:

  return v21;
}

- (id)initExtensionKitPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 client:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  IXPlaceholder *v16;
  IXPlaceholder *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ExtensionKit app extension Placeholder: %@ (%@)"), v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)IXPlaceholder;
  v16 = -[IXOwnedDataPromise initWithName:client:diskSpaceNeeded:](&v19, sel_initWithName_client_diskSpaceNeeded_, v15, a6, 0);

  if (v16
    && !-[IXPlaceholder _internalInitAppExtensionPlaceholderWithBundleName:bundleID:parentPlaceholder:placeholderType:client:error:](v16, "_internalInitAppExtensionPlaceholderWithBundleName:bundleID:parentPlaceholder:placeholderType:client:error:", v12, v13, v14, 3, a6, a7))
  {
    v17 = 0;
  }
  else
  {
    v17 = v16;
  }

  return v17;
}

- (id)initPlugInPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 client:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  IXPlaceholder *v16;
  IXPlaceholder *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PluginKit app extension Placeholder: %@ (%@)"), v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)IXPlaceholder;
  v16 = -[IXOwnedDataPromise initWithName:client:diskSpaceNeeded:](&v19, sel_initWithName_client_diskSpaceNeeded_, v15, a6, 0);

  if (v16
    && !-[IXPlaceholder _internalInitAppExtensionPlaceholderWithBundleName:bundleID:parentPlaceholder:placeholderType:client:error:](v16, "_internalInitAppExtensionPlaceholderWithBundleName:bundleID:parentPlaceholder:placeholderType:client:error:", v12, v13, v14, 2, a6, a7))
  {
    v17 = 0;
  }
  else
  {
    v17 = v16;
  }

  return v17;
}

- (id)initAppPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 client:(unint64_t)a6
{
  return -[IXPlaceholder initAppPlaceholderWithBundleName:bundleID:installType:client:error:](self, "initAppPlaceholderWithBundleName:bundleID:installType:client:error:", a3, a4, a5, a6, 0);
}

- (id)initExtensionKitPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 client:(unint64_t)a6
{
  return -[IXPlaceholder initExtensionKitPlaceholderWithBundleName:bundleID:parentPlaceholder:client:error:](self, "initExtensionKitPlaceholderWithBundleName:bundleID:parentPlaceholder:client:error:", a3, a4, a5, a6, 0);
}

- (id)initPlugInPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 client:(unint64_t)a6
{
  return -[IXPlaceholder initPlugInPlaceholderWithBundleName:bundleID:parentPlaceholder:client:error:](self, "initPlugInPlaceholderWithBundleName:bundleID:parentPlaceholder:client:error:", a3, a4, a5, a6, 0);
}

- (BOOL)_internalInitAppExtensionPlaceholderWithBundleName:(id)a3 bundleID:(id)a4 parentPlaceholder:(id)a5 placeholderType:(unint64_t)a6 client:(unint64_t)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "seed");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isAppExtension");

    if (!v18)
    {
      v34 = -[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:](self, "_doInitWithBundleName:bundleID:installType:placeholderType:error:", v13, v14, 0, a6, a8);
      goto LABEL_9;
    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[IXPlaceholder _internalInitAppExtensionPlaceholderWithBundleName:bundleID:parentPlaceholder:placeholderType:client:error:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[IXPlaceholder _internalInitAppExtensionPlaceholderWithBundleName:bundleID:parentPlaceholder:placeholderType:client:error:].cold.1(v19, v27, v28, v29, v30, v31, v32, v33);
  }

  v34 = 0;
LABEL_9:

  return v34;
}

- (BOOL)_doInitWithBundleName:(id)a3 bundleID:(id)a4 installType:(unint64_t)a5 placeholderType:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  BOOL v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  id v32;
  id v33;
  _QWORD v34[6];
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v12 = a3;
  v13 = a4;
  v14 = v13;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__4;
  v40 = __Block_byref_object_dispose__4;
  v41 = 0;
  if (!v12)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:].cold.1();

    _CreateError((uint64_t)"-[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:]", 1100, CFSTR("IXErrorDomain"), 0x35uLL, 0, 0, CFSTR("Bundle Name argument was nil."), v26, (uint64_t)v33);
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!v13)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:].cold.2();

    _CreateError((uint64_t)"-[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:]", 1105, CFSTR("IXErrorDomain"), 0x35uLL, 0, 0, CFSTR("Bundle ID argument was nil."), v29, (uint64_t)v33);
    v27 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v21 = 0;
    v24 = 0;
    v30 = (void *)v37[5];
    v37[5] = v27;
    goto LABEL_14;
  }
  -[IXDataPromise seed](self, "seed");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBundleName:", v12);

  -[IXDataPromise seed](self, "seed");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBundleID:", v14);

  -[IXDataPromise seed](self, "seed");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setInstallType:", a5);

  -[IXDataPromise seed](self, "seed");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPlaceholderType:", a6);

  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __82__IXPlaceholder__doInitWithBundleName_bundleID_installType_placeholderType_error___block_invoke;
  v35[3] = &unk_1E4DC41B0;
  v35[4] = &v36;
  objc_msgSend(v19, "synchronousRemoteObjectProxyWithErrorHandler:", v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[IXDataPromise seed](self, "seed");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v20;
    v34[1] = 3221225472;
    v34[2] = __82__IXPlaceholder__doInitWithBundleName_bundleID_installType_placeholderType_error___block_invoke_144;
    v34[3] = &unk_1E4DC4D90;
    v34[4] = self;
    v34[5] = &v36;
    objc_msgSend(v21, "_remote_createPlaceholderDataPromiseWithSeed:completion:", v22, v34);

    v23 = v37;
    if (!v37[5])
    {
      v33 = 0;
      v24 = -[IXOwnedDataPromise consumeSandboxExtensionWithError:](self, "consumeSandboxExtensionWithError:", &v33);
      v32 = v33;
      v30 = (void *)v23[5];
      v23[5] = (uint64_t)v32;
LABEL_14:

      if (!a7)
        goto LABEL_17;
      goto LABEL_15;
    }
  }
  v24 = 0;
  if (!a7)
    goto LABEL_17;
LABEL_15:
  if (!v24)
    *a7 = objc_retainAutorelease((id)v37[5]);
LABEL_17:

  _Block_object_dispose(&v36, 8);
  return v24;
}

void __82__IXPlaceholder__doInitWithBundleName_bundleID_installType_placeholderType_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __82__IXPlaceholder__doInitWithBundleName_bundleID_installType_placeholderType_error___block_invoke_144(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[IXPlaceholder _doInitWithBundleName:bundleID:installType:placeholderType:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up placeholder promise: %@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateInitWithSeed:notifyDaemon:", a2, 0);
  }

}

- (IXPlaceholder)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXPlaceholder;
  return -[IXOwnedDataPromise initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IXPlaceholder;
  -[IXDataPromise encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)setIconPromise:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  IXPlaceholder *v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  IXPlaceholder *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  v31 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __38__IXPlaceholder_setIconPromise_error___block_invoke;
  v22[3] = &unk_1E4DC4480;
  v9 = v6;
  v23 = v9;
  v24 = self;
  v25 = &v26;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __38__IXPlaceholder_setIconPromise_error___block_invoke_150;
  v18[3] = &unk_1E4DC4480;
  v13 = v9;
  v19 = v13;
  v20 = self;
  v21 = &v26;
  objc_msgSend(v10, "_remote_IXSPlaceholder:setIconPromiseUUID:completion:", v11, v12, v18);

  v14 = v27;
  if (a4)
  {
    v15 = (void *)v27[5];
    if (v15)
    {
      *a4 = objc_retainAutorelease(v15);
      v14 = v27;
    }
  }
  v16 = v14[5] == 0;

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __38__IXPlaceholder_setIconPromise_error___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXPlaceholder setIconPromise:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set icon promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

void __38__IXPlaceholder_setIconPromise_error___block_invoke_150(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXPlaceholder setIconPromise:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set icon promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

- (id)iconPromiseWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __38__IXPlaceholder_iconPromiseWithError___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v14;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __38__IXPlaceholder_iconPromiseWithError___block_invoke_151;
  v12[3] = &unk_1E4DC44D0;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v7, "_remote_IXSPlaceholder:getIconPromise:", v8, v12);

  v9 = (void *)v21[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
    v9 = (void *)v21[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __38__IXPlaceholder_iconPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[IXPlaceholder iconPromiseWithError:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get icon promise: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __38__IXPlaceholder_iconPromiseWithError___block_invoke_151(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      v9 = (objc_class *)objc_msgSend(v5, "clientPromiseClass");
      v10 = objc_msgSend([v9 alloc], "initWithSeed:", v5);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_17;
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = 0;

        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __38__IXPlaceholder_iconPromiseWithError___block_invoke_151_cold_2();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXPlaceholder iconPromiseWithError:]_block_invoke", 1219, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Seed object %@ should have been for an owned data promise subclass but was instead for class %@"), v17, (uint64_t)v5);
      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __38__IXPlaceholder_iconPromiseWithError___block_invoke_151_cold_1();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXPlaceholder iconPromiseWithError:]_block_invoke", 1216, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to initialize promise class %@ with seed %@"), v22, (uint64_t)v16);
      }
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
    }
    else
    {
      _CreateError((uint64_t)"-[IXPlaceholder iconPromiseWithError:]_block_invoke", 1211, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("An icon promise is not currently set."), v6, v25);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[IXPlaceholder iconPromiseWithError:]_block_invoke";
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get icon promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
LABEL_17:

}

- (BOOL)hasIconPromise
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__IXPlaceholder_hasIconPromise__block_invoke;
  v9[3] = &unk_1E4DC44F8;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __31__IXPlaceholder_hasIconPromise__block_invoke_160;
  v8[3] = &unk_1E4DC4520;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v5, "_remote_IXSPlaceholder:hasIconPromise:", v6, v8);

  LOBYTE(v3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __31__IXPlaceholder_hasIconPromise__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315650;
      v7 = "-[IXPlaceholder hasIconPromise]_block_invoke";
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an icon promise: %@", (uint8_t *)&v6, 0x20u);
    }

  }
}

void __31__IXPlaceholder_hasIconPromise__block_invoke_160(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXPlaceholder hasIconPromise]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an icon promise: %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (BOOL)setIconResourcesPromise:(id)a3 withInfoPlistContent:(id)a4 error:(id *)a5
{
  id v8;
  IXPromisedInMemoryDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  IXPromisedInMemoryDictionary *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  IXPlaceholder *v31;
  uint64_t *v32;
  _QWORD v33[4];
  id v34;
  IXPlaceholder *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v28 = a3;
  v8 = a4;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__4;
  v41 = __Block_byref_object_dispose__4;
  v42 = 0;
  if (!IXDictionaryContainsOnlyPlistContent(v8))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[IXPlaceholder setIconResourcesPromise:withInfoPlistContent:error:].cold.2();

    _CreateError((uint64_t)"-[IXPlaceholder setIconResourcesPromise:withInfoPlistContent:error:]", 1255, CFSTR("IXErrorDomain"), 0x1CuLL, 0, 0, CFSTR("Info.plist content dictionary contains content that cannot be contained in a property list."), v22, v27);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v9 = [IXPromisedInMemoryDictionary alloc];
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[IXPlaceholder bundleID](self, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Info.plist icon content for %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IXPromisedInMemoryDictionary initWithName:client:dictionary:](v9, "initWithName:client:dictionary:", v12, -[IXDataPromise creatorIdentifier](self, "creatorIdentifier"), v8);

  if (!v13)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[IXPlaceholder setIconResourcesPromise:withInfoPlistContent:error:].cold.1();

    _CreateError((uint64_t)"-[IXPlaceholder setIconResourcesPromise:withInfoPlistContent:error:]", 1261, CFSTR("IXErrorDomain"), 2uLL, 0, 0, CFSTR("Failed to create dictionary promise for Info.plist icon content for %@"), v25, (uint64_t)self);
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v20 = 0;
    v13 = (IXPromisedInMemoryDictionary *)v38[5];
    v38[5] = v23;
    goto LABEL_11;
  }
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __68__IXPlaceholder_setIconResourcesPromise_withInfoPlistContent_error___block_invoke;
  v33[3] = &unk_1E4DC4480;
  v15 = v28;
  v34 = v15;
  v35 = self;
  v36 = &v37;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v33);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](v13, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __68__IXPlaceholder_setIconResourcesPromise_withInfoPlistContent_error___block_invoke_168;
  v29[3] = &unk_1E4DC4480;
  v30 = v15;
  v31 = self;
  v32 = &v37;
  objc_msgSend(v16, "_remote_IXSPlaceholder:setIconResourcesPromiseUUID:withInfoPlistIconContentPromiseUUID:completion:", v17, v18, v19, v29);

  v20 = v38[5] == 0;
LABEL_11:

  if (a5 && !v20)
    *a5 = objc_retainAutorelease((id)v38[5]);
  _Block_object_dispose(&v37, 8);

  return v20;
}

void __68__IXPlaceholder_setIconResourcesPromise_withInfoPlistContent_error___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXPlaceholder setIconResourcesPromise:withInfoPlistContent:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set icon resources promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

void __68__IXPlaceholder_setIconResourcesPromise_withInfoPlistContent_error___block_invoke_168(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXPlaceholder setIconResourcesPromise:withInfoPlistContent:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set icon resources promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

- (id)iconResourcesPromiseWithInfoPlistContent:(id *)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[7];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke;
  v15[3] = &unk_1E4DC41B0;
  v15[4] = &v28;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke_169;
  v14[3] = &unk_1E4DC4DB8;
  v14[4] = &v28;
  v14[5] = &v22;
  v14[6] = &v16;
  objc_msgSend(v9, "_remote_IXSPlaceholder:getIconResourcesPromiseAndInfoPlistContentPromise:", v10, v14);

  v11 = (void *)v23[5];
  if (a3 && v11)
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v11 = (void *)v23[5];
  }
  if (a4 && !v11)
  {
    *a4 = objc_retainAutorelease((id)v29[5]);
    v11 = (void *)v23[5];
  }
  v12 = v11;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

void __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[IXPlaceholder iconResourcesPromiseWithInfoPlistContent:error:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get icon resources promise: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke_169(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id *v12;
  void *v13;
  objc_class *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v10 = a4;
  if (v10)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[IXPlaceholder iconResourcesPromiseWithInfoPlistContent:error:]_block_invoke";
      v33 = 2112;
      v34 = v10;
      _os_log_impl(&dword_1A4BF6000, v11, OS_LOG_TYPE_DEFAULT, "%s: Failed to get icon resources promise: %@", buf, 0x16u);
    }

    v12 = (id *)(*(_QWORD *)(a1[4] + 8) + 40);
    v13 = a4;
    goto LABEL_5;
  }
  if (!v7 || !v8)
  {
    _CreateError((uint64_t)"-[IXPlaceholder iconResourcesPromiseWithInfoPlistContent:error:]_block_invoke", 1307, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("An icon resources promise is not currently set."), v9, v30);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1[4] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;
LABEL_19:

    goto LABEL_20;
  }
  v14 = (objc_class *)objc_msgSend(v7, "clientPromiseClass");
  v15 = objc_msgSend([v14 alloc], "initWithSeed:", v7);
  v16 = *(_QWORD *)(a1[5] + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke_169_cold_1();

    NSStringFromClass(v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[IXPlaceholder iconResourcesPromiseWithInfoPlistContent:error:]_block_invoke", 1312, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to initialize promise class %@ with seed %@"), v23, (uint64_t)v22);
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = *(_QWORD *)(a1[5] + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = 0;

    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke_169_cold_2();

    NSStringFromClass(v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[IXPlaceholder iconResourcesPromiseWithInfoPlistContent:error:]_block_invoke", 1315, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Seed object %@ should have been for IXPromisedTransferToPath but was instead for class %@"), v27, (uint64_t)v7);
LABEL_18:
    v28 = objc_claimAutoreleasedReturnValue();

    v29 = *(_QWORD *)(a1[4] + 8);
    v20 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;
    goto LABEL_19;
  }
  v12 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v13 = a3;
LABEL_5:
  objc_storeStrong(v12, v13);
LABEL_20:

}

- (BOOL)hasIconResourcesPromise
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__IXPlaceholder_hasIconResourcesPromise__block_invoke;
  v9[3] = &unk_1E4DC44F8;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __40__IXPlaceholder_hasIconResourcesPromise__block_invoke_175;
  v8[3] = &unk_1E4DC4520;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v5, "_remote_IXSPlaceholder:hasIconResourcesPromise:", v6, v8);

  LOBYTE(v3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __40__IXPlaceholder_hasIconResourcesPromise__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315650;
      v7 = "-[IXPlaceholder hasIconResourcesPromise]_block_invoke";
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an icon resources promise: %@", (uint8_t *)&v6, 0x20u);
    }

  }
}

void __40__IXPlaceholder_hasIconResourcesPromise__block_invoke_175(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXPlaceholder hasIconResourcesPromise]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an icon resources promise: %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (BOOL)setInfoPlistLocalizations:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IXPromisedInMemoryDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  IXPromisedInMemoryDictionary *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v28;
  _QWORD v29[6];
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__4;
  v35 = __Block_byref_object_dispose__4;
  v36 = 0;
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  if ((IXDictionaryContainsOnlyClassesCheckingValueTypes(v6, v7, v8, v9, v10) & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[IXPlaceholder setInfoPlistLocalizations:error:].cold.2();

    _CreateError((uint64_t)"-[IXPlaceholder setInfoPlistLocalizations:error:]", 1357, CFSTR("IXErrorDomain"), 0x1CuLL, 0, 0, CFSTR("Localizations dictionary contains objects other than those expected."), v23, v28);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v11 = [IXPromisedInMemoryDictionary alloc];
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[IXPlaceholder bundleID](self, "bundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Localizations for %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[IXPromisedInMemoryDictionary initWithName:client:dictionary:](v11, "initWithName:client:dictionary:", v14, -[IXDataPromise creatorIdentifier](self, "creatorIdentifier"), v6);

  if (!v15)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[IXPlaceholder setInfoPlistLocalizations:error:].cold.1();

    _CreateError((uint64_t)"-[IXPlaceholder setInfoPlistLocalizations:error:]", 1363, CFSTR("IXErrorDomain"), 2uLL, 0, 0, CFSTR("Failed to create dictionary promise for localizations for %@"), v26, (uint64_t)self);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v21 = 0;
    v15 = (IXPromisedInMemoryDictionary *)v32[5];
    v32[5] = v24;
    goto LABEL_11;
  }
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __49__IXPlaceholder_setInfoPlistLocalizations_error___block_invoke;
  v30[3] = &unk_1E4DC4430;
  v30[4] = self;
  v30[5] = &v31;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](v15, "uniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __49__IXPlaceholder_setInfoPlistLocalizations_error___block_invoke_183;
  v29[3] = &unk_1E4DC4430;
  v29[4] = self;
  v29[5] = &v31;
  objc_msgSend(v18, "_remote_IXSPlaceholder:setLocalizationPromiseUUID:completion:", v19, v20, v29);

  v21 = v32[5] == 0;
LABEL_11:

  if (a4 && !v21)
    *a4 = objc_retainAutorelease((id)v32[5]);
  _Block_object_dispose(&v31, 8);

  return v21;
}

void __49__IXPlaceholder_setInfoPlistLocalizations_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315650;
      v8 = "-[IXPlaceholder setInfoPlistLocalizations:error:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set Info plist localizations on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __49__IXPlaceholder_setInfoPlistLocalizations_error___block_invoke_183(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315650;
      v8 = "-[IXPlaceholder setInfoPlistLocalizations:error:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set Info plist localizations on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)infoPlistLocalizationsWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__IXPlaceholder_infoPlistLocalizationsWithError___block_invoke;
  v13[3] = &unk_1E4DC4430;
  v13[4] = self;
  v13[5] = &v20;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __49__IXPlaceholder_infoPlistLocalizationsWithError___block_invoke_184;
  v12[3] = &unk_1E4DC4DE0;
  v12[4] = self;
  v12[5] = &v20;
  v12[6] = &v14;
  objc_msgSend(v7, "_remote_IXSPlaceholder:getLocalizationDictionary:", v8, v12);

  v9 = (void *)v15[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v21[5]);
    v9 = (void *)v15[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __49__IXPlaceholder_infoPlistLocalizationsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315650;
      v8 = "-[IXPlaceholder infoPlistLocalizationsWithError:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set Info plist localizations on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __49__IXPlaceholder_infoPlistLocalizationsWithError___block_invoke_184(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BYTE v16[12];
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v8 = a3;
  if (v8)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      *(_DWORD *)v16 = 136315650;
      *(_QWORD *)&v16[4] = "-[IXPlaceholder infoPlistLocalizationsWithError:]_block_invoke";
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1A4BF6000, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to set Info plist localizations on %@ : %@", v16, 0x20u);
    }

    v11 = (id *)(*(_QWORD *)(a1[5] + 8) + 40);
    v12 = a3;
  }
  else
  {
    if (!v6)
    {
      _CreateError((uint64_t)"-[IXPlaceholder infoPlistLocalizationsWithError:]_block_invoke", 1408, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("A localization dictionary is not currently set."), v7, *(uint64_t *)v16);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1[5] + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      goto LABEL_8;
    }
    v11 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
    v12 = a2;
  }
  objc_storeStrong(v11, v12);
LABEL_8:

}

- (BOOL)setEntitlementsPromise:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  IXPlaceholder *v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  IXPlaceholder *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  v31 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __46__IXPlaceholder_setEntitlementsPromise_error___block_invoke;
  v22[3] = &unk_1E4DC4480;
  v9 = v6;
  v23 = v9;
  v24 = self;
  v25 = &v26;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __46__IXPlaceholder_setEntitlementsPromise_error___block_invoke_188;
  v18[3] = &unk_1E4DC4480;
  v13 = v9;
  v19 = v13;
  v20 = self;
  v21 = &v26;
  objc_msgSend(v10, "_remote_IXSPlaceholder:setEntitlementsPromiseUUID:completion:", v11, v12, v18);

  v14 = v27;
  if (a4)
  {
    v15 = (void *)v27[5];
    if (v15)
    {
      *a4 = objc_retainAutorelease(v15);
      v14 = v27;
    }
  }
  v16 = v14[5] == 0;

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __46__IXPlaceholder_setEntitlementsPromise_error___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXPlaceholder setEntitlementsPromise:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set entitlements promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

void __46__IXPlaceholder_setEntitlementsPromise_error___block_invoke_188(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXPlaceholder setEntitlementsPromise:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set entitlements promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

- (id)entitlementsPromiseWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v14;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke_189;
  v12[3] = &unk_1E4DC44D0;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v7, "_remote_IXSPlaceholder:getEntitlementsPromise:", v8, v12);

  v9 = (void *)v21[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
    v9 = (void *)v21[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[IXPlaceholder entitlementsPromiseWithError:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get entitlements promise: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      v9 = (objc_class *)objc_msgSend(v5, "clientPromiseClass");
      v10 = objc_msgSend([v9 alloc], "initWithSeed:", v5);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_17;
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = 0;

        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke_189_cold_2();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXPlaceholder entitlementsPromiseWithError:]_block_invoke", 1466, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Seed object %@ should have been for an owned data promise subclass but was instead for class %@"), v17, (uint64_t)v5);
      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke_189_cold_1();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXPlaceholder entitlementsPromiseWithError:]_block_invoke", 1463, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to initialize promise class %@ with seed %@"), v22, (uint64_t)v16);
      }
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
    }
    else
    {
      _CreateError((uint64_t)"-[IXPlaceholder entitlementsPromiseWithError:]_block_invoke", 1458, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("An entitlements promise is not currently set."), v6, v25);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[IXPlaceholder entitlementsPromiseWithError:]_block_invoke";
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get entitlements promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
LABEL_17:

}

- (BOOL)hasEntitlementsPromise
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__IXPlaceholder_hasEntitlementsPromise__block_invoke;
  v9[3] = &unk_1E4DC44F8;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __39__IXPlaceholder_hasEntitlementsPromise__block_invoke_192;
  v8[3] = &unk_1E4DC4520;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v5, "_remote_IXSPlaceholder:hasEntitlementsPromise:", v6, v8);

  LOBYTE(v3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __39__IXPlaceholder_hasEntitlementsPromise__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315650;
      v7 = "-[IXPlaceholder hasEntitlementsPromise]_block_invoke";
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an entitlements promise: %@", (uint8_t *)&v6, 0x20u);
    }

  }
}

void __39__IXPlaceholder_hasEntitlementsPromise__block_invoke_192(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXPlaceholder hasEntitlementsPromise]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an entitlements promise: %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (BOOL)setInfoPlistLoctablePromise:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  IXPlaceholder *v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  IXPlaceholder *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  v31 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __51__IXPlaceholder_setInfoPlistLoctablePromise_error___block_invoke;
  v22[3] = &unk_1E4DC4480;
  v9 = v6;
  v23 = v9;
  v24 = self;
  v25 = &v26;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __51__IXPlaceholder_setInfoPlistLoctablePromise_error___block_invoke_193;
  v18[3] = &unk_1E4DC4480;
  v13 = v9;
  v19 = v13;
  v20 = self;
  v21 = &v26;
  objc_msgSend(v10, "_remote_IXSPlaceholder:setInfoPlistLoctablePromiseUUID:completion:", v11, v12, v18);

  v14 = v27;
  if (a4)
  {
    v15 = (void *)v27[5];
    if (v15)
    {
      *a4 = objc_retainAutorelease(v15);
      v14 = v27;
    }
  }
  v16 = v14[5] == 0;

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __51__IXPlaceholder_setInfoPlistLoctablePromise_error___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXPlaceholder setInfoPlistLoctablePromise:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set loctable promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

void __51__IXPlaceholder_setInfoPlistLoctablePromise_error___block_invoke_193(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXPlaceholder setInfoPlistLoctablePromise:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set loctable promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

}

- (id)infoPlistLoctablePromiseWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v14;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke_194;
  v12[3] = &unk_1E4DC44D0;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v7, "_remote_IXSPlaceholder:getInfoPlistLoctablePromise:", v8, v12);

  v9 = (void *)v21[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
    v9 = (void *)v21[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[IXPlaceholder infoPlistLoctablePromiseWithError:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get loctable promise: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke_194(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      v9 = (objc_class *)objc_msgSend(v5, "clientPromiseClass");
      v10 = objc_msgSend([v9 alloc], "initWithSeed:", v5);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_17;
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = 0;

        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke_194_cold_2();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXPlaceholder infoPlistLoctablePromiseWithError:]_block_invoke", 1540, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Seed object %@ should have been for an owned data promise subclass but was instead for class %@"), v17, (uint64_t)v5);
      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke_194_cold_1();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXPlaceholder infoPlistLoctablePromiseWithError:]_block_invoke", 1537, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to initialize promise class %@ with seed %@"), v22, (uint64_t)v16);
      }
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
    }
    else
    {
      _CreateError((uint64_t)"-[IXPlaceholder infoPlistLoctablePromiseWithError:]_block_invoke", 1532, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("A loctable promise is not currently set."), v6, v25);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[IXPlaceholder infoPlistLoctablePromiseWithError:]_block_invoke";
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get loctable promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
LABEL_17:

}

- (BOOL)hasInfoPlistLoctablePromise
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__IXPlaceholder_hasInfoPlistLoctablePromise__block_invoke;
  v9[3] = &unk_1E4DC44F8;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __44__IXPlaceholder_hasInfoPlistLoctablePromise__block_invoke_197;
  v8[3] = &unk_1E4DC4520;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v5, "_remote_IXSPlaceholder:hasInfoPlistLoctablePromise:", v6, v8);

  LOBYTE(v3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __44__IXPlaceholder_hasInfoPlistLoctablePromise__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315650;
      v7 = "-[IXPlaceholder hasInfoPlistLoctablePromise]_block_invoke";
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a loctable promise: %@", (uint8_t *)&v6, 0x20u);
    }

  }
}

void __44__IXPlaceholder_hasInfoPlistLoctablePromise__block_invoke_197(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXPlaceholder hasInfoPlistLoctablePromise]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a loctable promise: %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (BOOL)setAppExtensionPlaceholderPromises:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  void *v34;
  BOOL v35;
  _QWORD v38[6];
  _QWORD v39[6];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _DWORD v50[12];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__4;
  v48 = __Block_byref_object_dispose__4;
  v49 = 0;
  v6 = (void *)objc_opt_new();
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[IXPlaceholder bundleID](self, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@."), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v41;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v12)
        objc_enumerationMutation(v10);
      v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v13);
      objc_msgSend(v14, "bundleID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasPrefix:", v9);

      if ((v16 & 1) == 0)
        break;
      objc_msgSend(v14, "seed");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isAppExtension");

      if ((v18 & 1) == 0)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[IXPlaceholder setAppExtensionPlaceholderPromises:error:].cold.1();

        _CreateError((uint64_t)"-[IXPlaceholder setAppExtensionPlaceholderPromises:error:]", 1587, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Attempt made to set an app placeholder as an app extension placeholder: %@"), v31, (uint64_t)v14);
        v32 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v45[5];
        v45[5] = v32;
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v14, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v19);

      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "bundleID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[IXPlaceholder setAppExtensionPlaceholderPromises:error:].cold.2(v25, (uint64_t)v9, v50);
    }

    objc_msgSend(v14, "bundleID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[IXPlaceholder setAppExtensionPlaceholderPromises:error:]", 1582, CFSTR("IXErrorDomain"), 8uLL, 0, 0, CFSTR("Attempted to set app extension placeholder promise with bundle ID %@ that does not match required prefix of %@ for parent"), v27, (uint64_t)v26);
    v28 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v45[5];
    v45[5] = v28;
    goto LABEL_17;
  }
LABEL_10:

  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __58__IXPlaceholder_setAppExtensionPlaceholderPromises_error___block_invoke;
  v39[3] = &unk_1E4DC4430;
  v39[4] = self;
  v39[5] = &v44;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v39);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v21;
  v38[1] = 3221225472;
  v38[2] = __58__IXPlaceholder_setAppExtensionPlaceholderPromises_error___block_invoke_204;
  v38[3] = &unk_1E4DC4430;
  v38[4] = self;
  v38[5] = &v44;
  objc_msgSend(v22, "_remote_IXSPlaceholder:setAppExtensionPlaceholderPromiseUUIDs:completion:", v23, v6, v38);

LABEL_18:
  v33 = v45;
  if (a4)
  {
    v34 = (void *)v45[5];
    if (v34)
    {
      *a4 = objc_retainAutorelease(v34);
      v33 = v45;
    }
  }
  v35 = v33[5] == 0;

  _Block_object_dispose(&v44, 8);
  return v35;
}

void __58__IXPlaceholder_setAppExtensionPlaceholderPromises_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315650;
      v8 = "-[IXPlaceholder setAppExtensionPlaceholderPromises:error:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set app extension placeholder promises on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __58__IXPlaceholder_setAppExtensionPlaceholderPromises_error___block_invoke_204(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315650;
      v8 = "-[IXPlaceholder setAppExtensionPlaceholderPromises:error:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set app extension placeholder promises on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)appExtensionPlaceholderPromisesWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[6];
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _DWORD v48[12];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4;
  v46 = __Block_byref_object_dispose__4;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__4;
  v40 = __Block_byref_object_dispose__4;
  v41 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __58__IXPlaceholder_appExtensionPlaceholderPromisesWithError___block_invoke;
  v35[3] = &unk_1E4DC41B0;
  v35[4] = &v36;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v35);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v6;
  v34[1] = 3221225472;
  v34[2] = __58__IXPlaceholder_appExtensionPlaceholderPromisesWithError___block_invoke_205;
  v34[3] = &unk_1E4DC41D8;
  v34[4] = &v36;
  v34[5] = &v42;
  objc_msgSend(v7, "_remote_IXSPlaceholder:getAppExtensionPlaceholderPromises:", v8, v34);

  if (v37[5])
  {
    v9 = 0;
LABEL_21:
    v17 = 0;
    if (!a3)
      goto LABEL_24;
LABEL_22:
    if (!v17)
      *a3 = objc_retainAutorelease((id)v37[5]);
    goto LABEL_24;
  }
  v9 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = (id)v43[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v49, 16);
  if (!v11)
    goto LABEL_12;
  v12 = *(_QWORD *)v31;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(v10);
      v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      v15 = (objc_class *)objc_msgSend(v14, "clientPromiseClass");
      v16 = (void *)objc_msgSend([v15 alloc], "initWithSeed:", v14);
      if (!v16)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          NSStringFromClass(v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[IXPlaceholder appExtensionPlaceholderPromisesWithError:].cold.1(v19, (uint64_t)v14, v48);
        }

        NSStringFromClass(v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXPlaceholder appExtensionPlaceholderPromisesWithError:]", 1653, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to initialize promise class %@ with seed %@"), v21, (uint64_t)v20);
        v22 = objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          NSStringFromClass(v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[IXPlaceholder appExtensionPlaceholderPromisesWithError:].cold.2((uint64_t)v14, v24, v48);
        }

        NSStringFromClass(v15);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXPlaceholder appExtensionPlaceholderPromisesWithError:]", 1656, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Seed object %@ should have been for a placeholder promise but was instead for class %@"), v25, (uint64_t)v14);
        v22 = objc_claimAutoreleasedReturnValue();

LABEL_20:
        v26 = (void *)v37[5];
        v37[5] = v22;

        goto LABEL_21;
      }
      objc_msgSend(v9, "addObject:", v16);

    }
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v49, 16);
    if (v11)
      continue;
    break;
  }
LABEL_12:

  v17 = (void *)objc_msgSend(v9, "copy");
  if (a3)
    goto LABEL_22;
LABEL_24:
  v27 = v17;
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v27;
}

void __58__IXPlaceholder_appExtensionPlaceholderPromisesWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[IXPlaceholder appExtensionPlaceholderPromisesWithError:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get app extension placeholder promises: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __58__IXPlaceholder_appExtensionPlaceholderPromisesWithError___block_invoke_205(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BYTE v15[12];
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v8 = a3;
  if (v8)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 136315394;
      *(_QWORD *)&v15[4] = "-[IXPlaceholder appExtensionPlaceholderPromisesWithError:]_block_invoke";
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1A4BF6000, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to get app extension placeholder promises: %@", v15, 0x16u);
    }

    v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v11 = a3;
  }
  else
  {
    if (!v6)
    {
      _CreateError((uint64_t)"-[IXPlaceholder appExtensionPlaceholderPromisesWithError:]_block_invoke", 1637, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("No app extension placeholder promises are currently set."), v7, *(uint64_t *)v15);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      goto LABEL_8;
    }
    v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v11 = a2;
  }
  objc_storeStrong(v10, v11);
LABEL_8:

}

- (BOOL)hasPlugInPlaceholderPromises
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__IXPlaceholder_hasPlugInPlaceholderPromises__block_invoke;
  v9[3] = &unk_1E4DC44F8;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __45__IXPlaceholder_hasPlugInPlaceholderPromises__block_invoke_211;
  v8[3] = &unk_1E4DC4520;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v5, "_remote_IXSPlaceholder:hasAppExtensionPlaceholderPromises:", v6, v8);

  LOBYTE(v3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __45__IXPlaceholder_hasPlugInPlaceholderPromises__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315650;
      v7 = "-[IXPlaceholder hasPlugInPlaceholderPromises]_block_invoke";
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an icon promise: %@", (uint8_t *)&v6, 0x20u);
    }

  }
}

void __45__IXPlaceholder_hasPlugInPlaceholderPromises__block_invoke_211(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXPlaceholder hasPlugInPlaceholderPromises]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has app extension placeholder promises: %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (BOOL)setConfigurationCompleteWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__IXPlaceholder_setConfigurationCompleteWithError___block_invoke;
  v14[3] = &unk_1E4DC4430;
  v14[4] = self;
  v14[5] = &v15;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __51__IXPlaceholder_setConfigurationCompleteWithError___block_invoke_212;
  v13[3] = &unk_1E4DC4430;
  v13[4] = self;
  v13[5] = &v15;
  objc_msgSend(v7, "_remote_IXSPlaceholder:setConfigurationCompleteWithCompletion:", v8, v13);

  v9 = v16;
  if (a3)
  {
    v10 = (void *)v16[5];
    if (v10)
    {
      *a3 = objc_retainAutorelease(v10);
      v9 = v16;
    }
  }
  v11 = v9[5] == 0;
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __51__IXPlaceholder_setConfigurationCompleteWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315650;
      v8 = "-[IXPlaceholder setConfigurationCompleteWithError:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set app extension placeholder promises on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __51__IXPlaceholder_setConfigurationCompleteWithError___block_invoke_212(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315650;
      v8 = "-[IXPlaceholder setConfigurationCompleteWithError:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set configuration complete on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (IXPlaceholder)initWithSeed:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXPlaceholder;
  return -[IXOwnedDataPromise initWithSeed:](&v4, sel_initWithSeed_, a3);
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (NSString)bundleName
{
  void *v2;
  void *v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setBundleName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IXDataPromise seed](self, "seed");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleName:", v4);

}

- (NSString)bundleID
{
  void *v2;
  void *v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setBundleID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IXDataPromise seed](self, "seed");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleID:", v4);

}

- (unint64_t)placeholderType
{
  void *v2;
  unint64_t v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "placeholderType");

  return v3;
}

- (unint64_t)installType
{
  void *v2;
  unint64_t v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "installType");

  return v3;
}

- (MIStoreMetadata)metadata
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  IXPlaceholder *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  -[IXPlaceholder metadataWithError:](self, "metadataWithError:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v9 = "-[IXPlaceholder metadata]";
      v10 = 2112;
      v11 = self;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to get metadata for %@: %@", buf, 0x20u);
    }

  }
  return (MIStoreMetadata *)v3;
}

- (void)setMetadata:(id)a3
{
  BOOL v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  IXPlaceholder *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v4 = -[IXPlaceholder setMetadata:error:](self, "setMetadata:error:", a3, &v7);
  v5 = v7;
  if (!v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v9 = "-[IXPlaceholder setMetadata:]";
      v10 = 2112;
      v11 = self;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to set metadata for %@: %@", buf, 0x20u);
    }

  }
}

- (BOOL)setMetadata:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  IXPromisedInMemoryData *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  uint64_t v22[6];
  _QWORD v23[6];
  id obj;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v7 = v6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__4;
  v29 = __Block_byref_object_dispose__4;
  v30 = 0;
  if (!v6)
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_6;
  }
  obj = 0;
  IXEncodeRootObject(v6, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v30, obj);
  if (v8)
  {
    v9 = -[IXPromisedInMemoryData initWithName:client:data:]([IXPromisedInMemoryData alloc], "initWithName:client:data:", CFSTR("MIStoreMetadata data"), 15, v8);
    if (v9)
    {

      -[IXDataPromise uniqueIdentifier](v9, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __35__IXPlaceholder_setMetadata_error___block_invoke;
      v23[3] = &unk_1E4DC4430;
      v23[4] = self;
      v23[5] = &v25;
      objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = (uint64_t)__35__IXPlaceholder_setMetadata_error___block_invoke_220;
      v22[3] = (uint64_t)&unk_1E4DC4430;
      v22[4] = (uint64_t)self;
      v22[5] = (uint64_t)&v25;
      objc_msgSend(v12, "_remote_IXSPlaceholder:setMetadataPromiseUUID:completion:", v13, v8, v22);

      goto LABEL_11;
    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[IXPlaceholder setMetadata:error:].cold.1();

    _CreateError((uint64_t)"-[IXPlaceholder setMetadata:error:]", 1797, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to create data promise for serialized metadata"), v15, v22[0]);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v26[5];
    v26[5] = v16;

  }
  v9 = 0;
LABEL_11:

  v18 = v26[5];
  if (v18)
  {
    -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v18, 15, 0);
    v19 = (void *)v26[5];
    if (a4 && v19)
    {
      *a4 = objc_retainAutorelease(v19);
      v19 = (void *)v26[5];
    }
  }
  else
  {
    v19 = 0;
  }
  v20 = v19 == 0;

  _Block_object_dispose(&v25, 8);
  return v20;
}

void __35__IXPlaceholder_setMetadata_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXPlaceholder setMetadata:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get remote proxy for setting metadata promise on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __35__IXPlaceholder_setMetadata_error___block_invoke_220(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXPlaceholder setMetadata:error:]_block_invoke";
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set metadata promise UUID on %@ : %@", (uint8_t *)&v8, 0x20u);
    }

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

- (id)metadataWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  v23 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __35__IXPlaceholder_metadataWithError___block_invoke;
  v17[3] = &unk_1E4DC41B0;
  v17[4] = &v18;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __35__IXPlaceholder_metadataWithError___block_invoke_2;
  v16[3] = &unk_1E4DC4E08;
  v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend(v7, "_remote_IXSPlaceholder:getMetadataWithCompletion:", v8, v16);

  v10 = (void *)v25[5];
  if (!v10)
  {
    if (v19[5])
    {
      v10 = 0;
      if (!a3)
        goto LABEL_8;
    }
    else
    {
      _CreateError((uint64_t)"-[IXPlaceholder metadataWithError:]", 1841, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("Metadata is not currently set."), v9, v15);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v19[5];
      v19[5] = v11;

      v10 = (void *)v25[5];
      if (!a3)
        goto LABEL_8;
    }
    if (!v10)
    {
      *a3 = objc_retainAutorelease((id)v19[5]);
      v10 = (void *)v25[5];
    }
  }
LABEL_8:
  v13 = v10;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

void __35__IXPlaceholder_metadataWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__IXPlaceholder_metadataWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)setSinfData:(id)a3 error:(id *)a4
{
  id v6;
  IXPromisedInMemoryData *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  uint64_t v20;
  _QWORD v21[6];
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = 0;
  if (!v6)
  {
    v7 = 0;
    goto LABEL_7;
  }
  v7 = -[IXPromisedInMemoryData initWithName:client:data:]([IXPromisedInMemoryData alloc], "initWithName:client:data:", CFSTR("Placeholder Sinf Data"), 15, v6);
  if (v7)
  {
LABEL_7:
    -[IXDataPromise uniqueIdentifier](v7, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __35__IXPlaceholder_setSinfData_error___block_invoke;
    v22[3] = &unk_1E4DC4430;
    v22[4] = self;
    v22[5] = &v23;
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __35__IXPlaceholder_setSinfData_error___block_invoke_228;
    v21[3] = &unk_1E4DC4430;
    v21[4] = self;
    v21[5] = &v23;
    objc_msgSend(v14, "_remote_IXSPlaceholder:setSinfPromiseUUID:completion:", v15, v11, v21);

    goto LABEL_8;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[IXPlaceholder setSinfData:error:].cold.1();

  _CreateError((uint64_t)"-[IXPlaceholder setSinfData:error:]", 1861, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to create data promise for sinf data"), v9, v20);
  v10 = objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v11 = (void *)v24[5];
  v24[5] = v10;
LABEL_8:

  v16 = v24[5];
  if (v16)
  {
    -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v16, 15, 0);
    v17 = (void *)v24[5];
    if (a4 && v17)
    {
      *a4 = objc_retainAutorelease(v17);
      v17 = (void *)v24[5];
    }
  }
  else
  {
    v17 = 0;
  }
  v18 = v17 == 0;

  _Block_object_dispose(&v23, 8);
  return v18;
}

void __35__IXPlaceholder_setSinfData_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXPlaceholder setSinfData:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get remote proxy for setting sinf promise on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __35__IXPlaceholder_setSinfData_error___block_invoke_228(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXPlaceholder setSinfData:error:]_block_invoke";
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set sinf promise UUID on %@ : %@", (uint8_t *)&v8, 0x20u);
    }

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

- (id)sinfDataWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  v23 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __35__IXPlaceholder_sinfDataWithError___block_invoke;
  v17[3] = &unk_1E4DC41B0;
  v17[4] = &v18;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __35__IXPlaceholder_sinfDataWithError___block_invoke_2;
  v16[3] = &unk_1E4DC4E30;
  v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend(v7, "_remote_IXSPlaceholder:getSinfDataWithCompletion:", v8, v16);

  v10 = (void *)v25[5];
  if (!v10)
  {
    if (v19[5])
    {
      v10 = 0;
      if (!a3)
        goto LABEL_8;
    }
    else
    {
      _CreateError((uint64_t)"-[IXPlaceholder sinfDataWithError:]", 1905, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("Sinf data is not currently set."), v9, v15);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v19[5];
      v19[5] = v11;

      v10 = (void *)v25[5];
      if (!a3)
        goto LABEL_8;
    }
    if (!v10)
    {
      *a3 = objc_retainAutorelease((id)v19[5]);
      v10 = (void *)v25[5];
    }
  }
LABEL_8:
  v13 = v10;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

void __35__IXPlaceholder_sinfDataWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__IXPlaceholder_sinfDataWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)setLaunchProhibited:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43__IXPlaceholder_setLaunchProhibited_error___block_invoke;
  v15[3] = &unk_1E4DC41B0;
  v15[4] = &v16;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __43__IXPlaceholder_setLaunchProhibited_error___block_invoke_2;
  v14[3] = &unk_1E4DC41B0;
  v14[4] = &v16;
  objc_msgSend(v9, "_remote_IXSPlaceholder:setLaunchProhibited:completion:", v10, v5, v14);

  v11 = (void *)v17[5];
  if (a4 && v11)
  {
    *a4 = objc_retainAutorelease(v11);
    v11 = (void *)v17[5];
  }
  v12 = v11 == 0;
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __43__IXPlaceholder_setLaunchProhibited_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __43__IXPlaceholder_setLaunchProhibited_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)launchProhibited:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__IXPlaceholder_launchProhibited_error___block_invoke;
  v15[3] = &unk_1E4DC41B0;
  v15[4] = &v16;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __40__IXPlaceholder_launchProhibited_error___block_invoke_2;
  v14[3] = &unk_1E4DC4548;
  v14[4] = &v16;
  v14[5] = a3;
  objc_msgSend(v9, "_remote_IXSPlaceholder:getLaunchProhibitedWithCompletion:", v10, v14);

  v11 = (void *)v17[5];
  if (a4 && v11)
  {
    *a4 = objc_retainAutorelease(v11);
    v11 = (void *)v17[5];
  }
  v12 = v11 == 0;
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __40__IXPlaceholder_launchProhibited_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __40__IXPlaceholder_launchProhibited_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  _BYTE *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    v6 = *(_BYTE **)(a1 + 40);
    if (v6)
      *v6 = a2;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (BOOL)setPlaceholderAttributes:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[5];
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v6 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__4;
  v49 = __Block_byref_object_dispose__4;
  v50 = 0;
  v7 = -[IXPlaceholder placeholderType](self, "placeholderType");
  v8 = v7;
  switch(v7)
  {
    case 1uLL:
      objc_msgSend(v6, "extensionDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[IXPlaceholder setPlaceholderAttributes:error:].cold.4();

        _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 1963, CFSTR("IXErrorDomain"), 0x11uLL, 0, 0, CFSTR("extensionDictionary does not make sense as an attribute of an app placeholder"), v17, v42);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      objc_msgSend(v6, "exAppExtensionAttributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[IXPlaceholder setPlaceholderAttributes:error:].cold.3();

        _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 1968, CFSTR("IXErrorDomain"), 0x11uLL, 0, 0, CFSTR("exAppExtensionAttributes does not make sense as an attribute of an app placeholder"), v27, v42);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      goto LABEL_26;
    case 2uLL:
      objc_msgSend(v6, "extensionDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[IXPlaceholder setPlaceholderAttributes:error:].cold.5();

        _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 1976, CFSTR("IXErrorDomain"), 0x11uLL, 0, 0, CFSTR("extensionDictionary must be set in placeholder attributes for an app extension placeholder"), v31, v42);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      objc_msgSend(v6, "extensionDictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("NSExtensionPointIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[IXPlaceholder setPlaceholderAttributes:error:].cold.6();

        _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 1979, CFSTR("IXErrorDomain"), 0x11uLL, 0, 0, CFSTR("extensionDictionary must have the NSExtensionPointIdentifier key set to a valid extension point identifier string"), v22, v42);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      goto LABEL_26;
    case 3uLL:
      objc_msgSend(v6, "exAppExtensionAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[IXPlaceholder setPlaceholderAttributes:error:].cold.7();

        _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 1987, CFSTR("IXErrorDomain"), 0x11uLL, 0, 0, CFSTR("exAppExtensionAttributes must be set in placeholder attributes for an ExtensionKit app extension placeholder"), v24, v42);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      objc_msgSend(v6, "exAppExtensionAttributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EXExtensionPointIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[IXPlaceholder setPlaceholderAttributes:error:].cold.8();

        _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 1990, CFSTR("IXErrorDomain"), 0x11uLL, 0, 0, CFSTR("exAppExtensionAttributes must have the EXExtensionPointIdentifier key set to a valid extension point identifier string"), v13, v42);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_34:
        v32 = (void *)v46[5];
        v46[5] = v14;
LABEL_37:

        goto LABEL_38;
      }
LABEL_26:
      if (IXIsAppExtensionForPlaceholderType(v8))
      {
        if (objc_msgSend(v6, "launchProhibited"))
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            -[IXPlaceholder setPlaceholderAttributes:error:].cold.1();

          _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 2003, CFSTR("IXErrorDomain"), 0x11uLL, 0, 0, CFSTR("launchProhibited = YES does not make sense as an attribute of an app extension placeholder"), v29, v42);
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        objc_msgSend(v6, "bundleVersion");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            -[IXPlaceholder setPlaceholderAttributes:error:].cold.2();

          _CreateError((uint64_t)"-[IXPlaceholder setPlaceholderAttributes:error:]", 2006, CFSTR("IXErrorDomain"), 0x11uLL, 0, 0, CFSTR("bundleVersion must be set in placeholder attributes for an app extension placeholder"), v41, v42);
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
      }
      +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __48__IXPlaceholder_setPlaceholderAttributes_error___block_invoke;
      v44[3] = &unk_1E4DC41B0;
      v44[4] = &v45;
      objc_msgSend(v32, "synchronousRemoteObjectProxyWithErrorHandler:", v44);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v34;
      v43[1] = 3221225472;
      v43[2] = __48__IXPlaceholder_setPlaceholderAttributes_error___block_invoke_2;
      v43[3] = &unk_1E4DC41B0;
      v43[4] = &v45;
      objc_msgSend(v35, "_remote_IXSPlaceholder:setAttributes:completion:", v36, v6, v43);

      goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unknown placeholder type: %lu"), v7);
LABEL_38:
  v37 = (void *)v46[5];
  if (a4 && v37)
  {
    *a4 = objc_retainAutorelease(v37);
    v37 = (void *)v46[5];
  }
  v38 = v37 == 0;
  _Block_object_dispose(&v45, 8);

  return v38;
}

void __48__IXPlaceholder_setPlaceholderAttributes_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__IXPlaceholder_setPlaceholderAttributes_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)placeholderAttributesWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  v23 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __48__IXPlaceholder_placeholderAttributesWithError___block_invoke;
  v17[3] = &unk_1E4DC41B0;
  v17[4] = &v18;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __48__IXPlaceholder_placeholderAttributesWithError___block_invoke_2;
  v16[3] = &unk_1E4DC4E58;
  v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend(v7, "_remote_IXSPlaceholder:getAttributesWithCompletion:", v8, v16);

  v10 = (void *)v25[5];
  if (!v10)
  {
    if (v19[5])
    {
      v10 = 0;
      if (!a3)
        goto LABEL_8;
    }
    else
    {
      _CreateError((uint64_t)"-[IXPlaceholder placeholderAttributesWithError:]", 2038, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("Placeholder attributes are not currently set."), v9, v15);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v19[5];
      v19[5] = v11;

      v10 = (void *)v25[5];
      if (!a3)
        goto LABEL_8;
    }
    if (!v10)
    {
      *a3 = objc_retainAutorelease((id)v19[5]);
      v10 = (void *)v25[5];
    }
  }
LABEL_8:
  v13 = v10;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

void __48__IXPlaceholder_placeholderAttributesWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48__IXPlaceholder_placeholderAttributesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

+ (void)placeholderForRemovableSystemAppWithBundleID:client:installType:error:.cold.1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to get system app placeholder location from LaunchServices for %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

+ (void)_pngDataForCGImage:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to create CGImageDestination : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

+ (void)_pngDataForCGImage:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to finalize image : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

+ (void)_placeholderForInstallable:(void *)a1 client:(NSObject *)a2 installType:metadata:isFromSerializedPlaceholder:error:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a2, v4, "%s: Item at %@ is unexpectedly a file : %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_15_0();
}

+ (void)_placeholderForInstallable:(void *)a1 client:(NSObject *)a2 installType:metadata:isFromSerializedPlaceholder:error:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a2, v4, "%s: Item at %@ is a file : %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_15_0();
}

+ (void)placeholderFromSerializedPlaceholder:client:installType:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to create directory for extraction : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

+ (void)placeholderFromSerializedPlaceholder:(void *)a1 client:(NSObject *)a2 installType:error:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a2, v4, "%s: Expected the serialized placeholder at %@ to be an IPA : %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_15_0();
}

+ (void)_setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v1, "%s: Failed to create IXPromisedInMemoryDictionary for entitlements for %@ : %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_10();
}

+ (void)_setEntitlementsFromBundleExecutableURL:withBundleID:client:onPlaceholder:error:.cold.2()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to set alternative entitlements promise for %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

+ (void)_setEntitlementsFromBundleExecutableURL:(void *)a1 withBundleID:(NSObject *)a2 client:onPlaceholder:error:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1A4BF6000, a2, OS_LOG_TYPE_DEBUG, "%s: Failed to get entitlements dictionary for %@", (uint8_t *)v4, 0x16u);

  OUTLINED_FUNCTION_10();
}

+ (void)_setEntitlementsFromBundleExecutableURL:(void *)a1 withBundleID:client:onPlaceholder:error:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_18_0(&dword_1A4BF6000, v2, v3, "%s: SecCodeCopySigningInformation for %@ returned error %d : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_setEntitlementsFromBundleExecutableURL:(void *)a1 withBundleID:client:onPlaceholder:error:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_18_0(&dword_1A4BF6000, v2, v3, "%s: Failed to construct SecStaticCode for %@ : %d : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_placeholderForBundle:(void *)a1 client:(NSObject *)a2 withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a2, v4, "%s: Failed to create CFBundle from %@ : %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_15_0();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  int v4[10];
  uint64_t v5;

  OUTLINED_FUNCTION_21();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v3, "%s: Failed create placeholder attributes from %@ : %@", (uint8_t *)v4);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_placeholderForBundle:(void *)a1 client:(NSObject *)a2 withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a2, v4, "%s: Failed to get bundle ID from %@ : %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_15_0();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v1, "%s: Bundle identifier %@ contains \"/\", which is not allowed : %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_10();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Bundle identifier is an empty string, which is not allowed : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.6()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to create IXPlaceholder for app bundle ID %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v1, "%s: Failed to create IXPromisedTransferToPath for entitlements for %@ : %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_10();
}

+ (void)_placeholderForBundle:(void *)a1 client:(NSObject *)a2 withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a2, v4, "%s: Failed to create IXPromisedTransferToPath for loctable for %@ : %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_15_0();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.9()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to set localization dictionary for %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.10()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to set configuration complete for %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.11()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to set app extension placeholders for %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.12()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  int v4[10];
  uint64_t v5;

  OUTLINED_FUNCTION_21();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v3, "%s: Failed to get URLs of items at %@ : %@", (uint8_t *)v4);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.13()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  int v4[10];
  uint64_t v5;

  OUTLINED_FUNCTION_21();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v3, "%s: Failed to create app extension placeholder for %@ : %@", (uint8_t *)v4);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.14()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  int v4[10];
  uint64_t v5;

  OUTLINED_FUNCTION_21();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v3, "%s: Failed to set loctable promise for %@ : %@", (uint8_t *)v4);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.15()
{
  __int16 v0;
  NSObject *v1;
  int v2[8];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_0_3();
  v3 = v0;
  v4 = 0;
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v1, (uint64_t)v1, "%s: Failed to create IXPromisedTransferToPath for icon resources at %@ for %@ : %@", (uint8_t *)v2);
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.16()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to set icon resources promise for %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v1, "%s: Failed to create IXPromisedInMemoryData for icon for %@ : %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_10();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.18()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to set icon promise for %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.19()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to set entitlements promise for %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.20()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to set placeholder attributes %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

+ (void)_placeholderForBundle:client:withParent:installType:metadata:placeholderType:mayBeDeltaPackage:isFromSerializedPlaceholder:error:.cold.21()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to set metadata for %@ : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

- (void)_initAppExtensionPlaceholderWithBundleURL:bundleName:bundleID:parentPlaceholder:client:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v1, "%s: Unable to determine IXPlaceholder type for this app extension bundle at %@ : %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_10();
}

- (void)_internalInitAppExtensionPlaceholderWithBundleName:(uint64_t)a3 bundleID:(uint64_t)a4 parentPlaceholder:(uint64_t)a5 placeholderType:(uint64_t)a6 client:(uint64_t)a7 error:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_19_0(&dword_1A4BF6000, a1, a3, "%s: parentPlaceholder argument was unexpectedly nil!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)_internalInitAppExtensionPlaceholderWithBundleName:(uint64_t)a3 bundleID:(uint64_t)a4 parentPlaceholder:(uint64_t)a5 placeholderType:(uint64_t)a6 client:(uint64_t)a7 error:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_19_0(&dword_1A4BF6000, a1, a3, "%s: parentPlaceholder argument must be an app placeholder but was an app extension placeholder", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)_doInitWithBundleName:bundleID:installType:placeholderType:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Bundle Name argument was nil. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)_doInitWithBundleName:bundleID:installType:placeholderType:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Bundle ID argument was nil. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void __38__IXPlaceholder_iconPromiseWithError___block_invoke_151_cold_1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_21();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __38__IXPlaceholder_iconPromiseWithError___block_invoke_151_cold_2()
{
  uint64_t v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_22();
  v1 = (objc_class *)OUTLINED_FUNCTION_20(v0, *MEMORY[0x1E0C80C00]);
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v3, v4, "%s: Seed object %@ should have been for an owned data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6_0();
}

- (void)setIconResourcesPromise:withInfoPlistContent:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v1, "%s: Failed to create dictionary promise for Info.plist icon content for %@ : %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_10();
}

- (void)setIconResourcesPromise:withInfoPlistContent:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Info.plist content dictionary contains content that cannot be contained in a property list. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke_169_cold_1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_21();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __64__IXPlaceholder_iconResourcesPromiseWithInfoPlistContent_error___block_invoke_169_cold_2()
{
  uint64_t v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_22();
  v1 = (objc_class *)OUTLINED_FUNCTION_20(v0, *MEMORY[0x1E0C80C00]);
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v3, v4, "%s: Seed object %@ should have been for IXPromisedTransferToPath but was instead for class %@ : %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6_0();
}

- (void)setInfoPlistLocalizations:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v1, "%s: Failed to create dictionary promise for localizations for %@ : %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_10();
}

- (void)setInfoPlistLocalizations:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Localizations dictionary contains objects other than those expected. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke_189_cold_1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_21();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __46__IXPlaceholder_entitlementsPromiseWithError___block_invoke_189_cold_2()
{
  uint64_t v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_22();
  v1 = (objc_class *)OUTLINED_FUNCTION_20(v0, *MEMORY[0x1E0C80C00]);
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v3, v4, "%s: Seed object %@ should have been for an owned data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke_194_cold_1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_21();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __51__IXPlaceholder_infoPlistLoctablePromiseWithError___block_invoke_194_cold_2()
{
  uint64_t v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_22();
  v1 = (objc_class *)OUTLINED_FUNCTION_20(v0, *MEMORY[0x1E0C80C00]);
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v3, v4, "%s: Seed object %@ should have been for an owned data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6_0();
}

- (void)setAppExtensionPlaceholderPromises:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v1, "%s: Attempt made to set an app placeholder as an app extension placeholder: %@ : %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_10();
}

- (void)setAppExtensionPlaceholderPromises:(_DWORD *)a3 error:.cold.2(void *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  *a3 = 136315906;
  OUTLINED_FUNCTION_14((uint64_t)a1, a2, (uint64_t)a3);
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v6, v4, "%s: Attempted to set app extension placeholder promise with bundle ID %@ that does not match required prefix of %@ for parent : %@", v5);

  OUTLINED_FUNCTION_16();
}

- (void)appExtensionPlaceholderPromisesWithError:(_DWORD *)a3 .cold.1(void *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  *a3 = 136315906;
  OUTLINED_FUNCTION_14((uint64_t)a1, a2, (uint64_t)a3);
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v6, v4, "%s: Failed to initialize promise class %@ with seed %@ : %@", v5);

  OUTLINED_FUNCTION_16();
}

- (void)appExtensionPlaceholderPromisesWithError:(_DWORD *)a3 .cold.2(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  *a3 = 136315906;
  OUTLINED_FUNCTION_14(a1, (uint64_t)a2, (uint64_t)a3);
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v6, v4, "%s: Seed object %@ should have been for a placeholder promise but was instead for class %@ : %@", v5);

  OUTLINED_FUNCTION_16();
}

- (void)setMetadata:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to create data promise for serialized metadata : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setSinfData:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to create data promise for sinf data : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPlaceholderAttributes:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: launchProhibited = YES does not make sense as an attribute of an app extension placeholder : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPlaceholderAttributes:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: bundleVersion must be set in placeholder attributes for an app extension placeholder : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPlaceholderAttributes:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: exAppExtensionAttributes does not make sense as an attribute of an app placeholder : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPlaceholderAttributes:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: extensionDictionary does not make sense as an attribute of an app placeholder : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPlaceholderAttributes:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: extensionDictionary must be set in placeholder attributes for an app extension placeholder : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPlaceholderAttributes:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: extensionDictionary must have the NSExtensionPointIdentifier key set to a valid extension point identifier string : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPlaceholderAttributes:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: exAppExtensionAttributes must be set in placeholder attributes for an ExtensionKit app extension placeholder : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPlaceholderAttributes:error:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: exAppExtensionAttributes must have the EXExtensionPointIdentifier key set to a valid extension point identifier string : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

@end
