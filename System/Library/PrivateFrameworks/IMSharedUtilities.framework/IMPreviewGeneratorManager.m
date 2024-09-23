@implementation IMPreviewGeneratorManager

- (IMPreviewGeneratorManager)init
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  __CFString *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  IMPreviewGeneratorManager *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const __CFString *inTagClass;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  __CFString *v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)IMPreviewGeneratorManager;
  v26 = -[IMPreviewGeneratorManager init](&v41, sel_init);
  if (!v26)
    return v26;
  IMPreviewGeneratorClasses();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v2;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (!v29)
    goto LABEL_33;
  v28 = *(_QWORD *)v38;
  inTagClass = (const __CFString *)*MEMORY[0x1E0CA5A88];
  do
  {
    v4 = 0;
    do
    {
      if (*(_QWORD *)v38 != v28)
      {
        v5 = v4;
        objc_enumerationMutation(obj);
        v4 = v5;
      }
      v30 = v4;
      v6 = *(__CFString **)(*((_QWORD *)&v37 + 1) + 8 * v4);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      -[__CFString UTITypes](v6, "UTITypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v34;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v34 != v9)
              objc_enumerationMutation(v7);
            v11 = *(__CFString **)(*((_QWORD *)&v33 + 1) + 8 * v10);
            objc_msgSend(v3, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12 == 0;

            if (v13)
            {
              objc_msgSend(v3, "setObject:forKey:", v6, v11);
              if (!IMUTTypeIsDynamic(v11, v16))
                goto LABEL_27;
              v17 = (__CFString *)UTTypeCopyPreferredTagWithClass(v11, inTagClass);
              -[__CFString lowercaseString](v17, "lowercaseString");
              v14 = objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                objc_msgSend(v31, "objectForKey:", v14);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = v18 == 0;

                if (v19)
                {
                  objc_msgSend(v31, "setObject:forKey:", v11, v14);
                }
                else if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v31, "objectForKey:", v14);
                    v21 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v43 = v14;
                    v44 = 2112;
                    v45 = v11;
                    v46 = 2112;
                    v47 = v21;
                    v22 = (void *)v21;
                    _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "Can't register extension %@ for UTIType %@. It is already registered for %@. Please file a bug.", buf, 0x20u);

                  }
                }
              }
              if (v17)
                CFRelease(v17);
            }
            else
            {
              if (!IMOSLoggingEnabled())
                goto LABEL_27;
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v3, "objectForKey:", v11);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v43 = v11;
                v44 = 2112;
                v45 = v6;
                v46 = 2112;
                v47 = (uint64_t)v15;
                _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Can't register UTIType %@ for class %@. It is already registered for %@. Please file a bug.", buf, 0x20u);

              }
            }

LABEL_27:
            ++v10;
          }
          while (v8 != v10);
          v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
          v8 = v23;
        }
        while (v23);
      }

      v4 = v30 + 1;
    }
    while (v30 + 1 != v29);
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  }
  while (v29);
LABEL_33:

  -[IMPreviewGeneratorManager setUTITypes:](v26, "setUTITypes:", v3);
  -[IMPreviewGeneratorManager setDynamicTypes:](v26, "setDynamicTypes:", v31);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v3;
      _os_log_impl(&dword_19E239000, v24, OS_LOG_TYPE_INFO, "The generated UTI type class mapping is: %@", buf, 0xCu);
    }

  }
  return v26;
}

+ (id)sharedInstance
{
  if (qword_1ECFC70D0 != -1)
    dispatch_once(&qword_1ECFC70D0, &unk_1E3FB36E8);
  return (id)qword_1ECFC7020;
}

- (BOOL)generateAndPersistPreviewFromSourceURL:(id)a3 previewURL:(id)a4 senderContext:(id)a5 size:(CGSize *)a6 balloonBundleID:(id)a7 previewConstraints:(IMPreviewConstraints *)a8 error:(id *)a9
{
  id v15;
  id v16;
  __int128 v17;
  objc_class *v18;
  NSObject *v19;
  NSObject *v20;
  __int128 v21;
  BOOL v22;
  NSObject *v23;
  __int128 v24;
  int v25;
  id v26;
  __int128 v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  const __CFString *v36;
  __int128 v37;
  CGImage *v38;
  id v39;
  size_t Width;
  size_t Height;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  __int128 v53;
  void *v54;
  id v55;
  BOOL v56;
  NSObject *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  CGSize v75;
  id v76;
  id v77;
  _QWORD v78[2];
  _BYTE buf[32];
  _QWORD v80[4];

  v80[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v69 = a5;
  v68 = a7;
  v17 = *(_OWORD *)&a8->var1.height;
  *(_OWORD *)buf = *(_OWORD *)&a8->var0;
  *(_OWORD *)&buf[16] = v17;
  v80[0] = *(_QWORD *)&a8->var3;
  v18 = -[IMPreviewGeneratorManager _previewGeneratorClassForSourceURL:previewConstraints:](self, "_previewGeneratorClassForSourceURL:previewConstraints:", v15, buf);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Generating preview for source %@ with class %@", buf, 0x16u);
    }

  }
  if (-[objc_class isEqual:](v18, "isEqual:", objc_opt_class()))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "Going down map generation path", buf, 2u);
      }

    }
    v21 = *(_OWORD *)&a8->var1.height;
    *(_OWORD *)buf = *(_OWORD *)&a8->var0;
    *(_OWORD *)&buf[16] = v21;
    v80[0] = *(_QWORD *)&a8->var3;
    v22 = -[IMPreviewGeneratorManager generateAndPersistMapPreviewFromSourceURL:previewURL:senderContext:size:previewConstraints:error:](self, "generateAndPersistMapPreviewFromSourceURL:previewURL:senderContext:size:previewConstraints:error:", v15, v16, v69, a6, buf, a9);
LABEL_17:
    LOBYTE(v25) = v22;
    v26 = 0;
    goto LABEL_18;
  }
  if (-[objc_class isEqual:](v18, "isEqual:", objc_opt_class()))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "Going down contact card generation path", buf, 2u);
      }

    }
    v24 = *(_OWORD *)&a8->var1.height;
    *(_OWORD *)buf = *(_OWORD *)&a8->var0;
    *(_OWORD *)&buf[16] = v24;
    v80[0] = *(_QWORD *)&a8->var3;
    v22 = -[IMPreviewGeneratorManager generateAndPersistContactCardPreviewFromSourceURL:previewURL:senderContext:size:previewConstraints:error:](self, "generateAndPersistContactCardPreviewFromSourceURL:previewURL:senderContext:size:previewConstraints:error:", v15, v16, v69, a6, buf, a9);
    goto LABEL_17;
  }
  v25 = -[objc_class generatesPreview](v18, "generatesPreview");
  if (v25)
  {
    if ((-[objc_class writesToDisk](v18, "writesToDisk") & 1) != 0)
    {
      v75 = (CGSize)0;
      v74 = 0;
      v28 = *(_OWORD *)&a8->var1.height;
      *(_OWORD *)buf = *(_OWORD *)&a8->var0;
      *(_OWORD *)&buf[16] = v28;
      v80[0] = *(_QWORD *)&a8->var3;
      -[objc_class generateAndPersistPreviewFromSourceURL:senderContext:balloonBundleID:withPreviewConstraints:outSize:error:](v18, "generateAndPersistPreviewFromSourceURL:senderContext:balloonBundleID:withPreviewConstraints:outSize:error:", v15, v69, v68, buf, &v75, &v74);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v74;
      v26 = v29;
      v66 = 0;
      if (v64 && !v29)
      {
        v73 = 0;
        v66 = -[IMPreviewGeneratorManager movePreviewToDiskCache:previewURL:error:](self, "movePreviewToDiskCache:previewURL:error:", v64, v16, &v73);
        v26 = v73;
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            *(CGFloat *)&buf[4] = v75.width;
            *(_WORD *)&buf[12] = 2048;
            *(CGFloat *)&buf[14] = v75.height;
            _os_log_impl(&dword_19E239000, v30, OS_LOG_TYPE_INFO, "Size for persisted preview is %f-%f", buf, 0x16u);
          }

        }
        if (a6)
          *a6 = v75;
        objc_msgSend(v64, "URLByDeletingPathExtension");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "URLByAppendingPathExtension:", CFSTR("plist"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "URLByDeletingPathExtension");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "URLByAppendingPathExtension:", CFSTR("plist"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[IMPreviewGeneratorManager movePreviewToDiskCache:previewURL:error:](self, "movePreviewToDiskCache:previewURL:error:", v62, v33, 0)&& IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19E239000, v34, OS_LOG_TYPE_INFO, "Successfully moved preview metadata", buf, 2u);
          }

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = CFSTR("YES");
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v64;
          if (!v66)
            v36 = CFSTR("NO");
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v36;
          LOWORD(v80[0]) = 2112;
          *(_QWORD *)((char *)v80 + 2) = v26;
          _os_log_impl(&dword_19E239000, v35, OS_LOG_TYPE_INFO, "Moving preview from %@ to %@ success %@ error %@", buf, 0x2Au);
        }

      }
    }
    else
    {
      v77 = 0;
      v37 = *(_OWORD *)&a8->var1.height;
      *(_OWORD *)buf = *(_OWORD *)&a8->var0;
      *(_OWORD *)&buf[16] = v37;
      v80[0] = *(_QWORD *)&a8->var3;
      v38 = (CGImage *)-[objc_class newPreviewFromSourceURL:senderContext:withPreviewConstraints:error:](v18, "newPreviewFromSourceURL:senderContext:withPreviewConstraints:error:", v15, v69, buf, &v77);
      v39 = v77;
      v26 = v39;
      if (!v38 || v39)
      {
        if (!v38)
        {
          LOBYTE(v25) = 0;
          goto LABEL_85;
        }
        v66 = 0;
      }
      else
      {
        if (a6)
        {
          Width = CGImageGetWidth(v38);
          Height = CGImageGetHeight(v38);
          a6->width = (double)Width;
          a6->height = (double)Height;
        }
        v76 = 0;
        v66 = -[IMPreviewGeneratorManager persistPreviewToDiskCache:previewURL:error:](self, "persistPreviewToDiskCache:previewURL:error:", v38, v16, &v76);
        v26 = v76;
      }
      CFRelease(v38);
    }
    if (!v66)
    {
      LOBYTE(v25) = 0;
      goto LABEL_85;
    }
  }
  else
  {
    v26 = 0;
  }
  if (a8->var4 && -[objc_class generatesMetadata](v18, "generatesMetadata"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v42, OS_LOG_TYPE_INFO, "Going down metadata generation path", buf, 2u);
      }

    }
    objc_msgSend(v16, "lastPathComponent");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    IMAttachmentFileNameAndExtension(v65, (uint64_t *)&v72, 0);
    v63 = v72;
    -[objc_class metadataExtension](v18, "metadataExtension");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "stringByAppendingFormat:", CFSTR("-metadata.%@"), v43);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "URLByDeletingLastPathComponent");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "path");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v45;
    v78[1] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v60);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v59, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "URLByDeletingLastPathComponent");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v47, 1, 0, 0);

      if ((v48 & 1) != 0)
      {
LABEL_72:
        v71 = v26;
        v53 = *(_OWORD *)&a8->var1.height;
        *(_OWORD *)buf = *(_OWORD *)&a8->var0;
        *(_OWORD *)&buf[16] = v53;
        v80[0] = *(_QWORD *)&a8->var3;
        -[objc_class generateAndPersistMetadataFromSourceURL:senderContext:withPreviewConstraints:error:](v18, "generateAndPersistMetadataFromSourceURL:senderContext:withPreviewConstraints:error:", v15, v69, buf, &v71);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v71;

        v56 = v67 == 0;
        if (!v54)
          v56 = 1;
        if (v56 || v55)
        {
          v26 = v55;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              v58 = CFSTR("NO");
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v54;
              *(_WORD *)&buf[12] = 2112;
              if (v25)
                v58 = CFSTR("YES");
              *(_QWORD *)&buf[14] = v67;
              *(_WORD *)&buf[22] = 2112;
              *(_QWORD *)&buf[24] = v58;
              LOWORD(v80[0]) = 2112;
              *(_QWORD *)((char *)v80 + 2) = 0;
              _os_log_impl(&dword_19E239000, v57, OS_LOG_TYPE_INFO, "Moving preview metadata from %@ to %@ success %@ error %@", buf, 0x2Au);
            }

          }
          v70 = 0;
          LOBYTE(v25) = -[IMPreviewGeneratorManager movePreviewToDiskCache:previewURL:error:](self, "movePreviewToDiskCache:previewURL:error:", v54, v67, &v70);
          v26 = v70;
        }

        goto LABEL_85;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19E239000, v49, OS_LOG_TYPE_INFO, "Failed to create metadata destination directory", buf, 2u);
        }

      }
      v50 = 9;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19E239000, v51, OS_LOG_TYPE_INFO, "Failed to generate preview metadata URL", buf, 2u);
        }

      }
      v50 = 6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), v50, 0);
    v52 = objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v26 = (id)v52;
    goto LABEL_72;
  }
LABEL_85:
  if (a9)
  {
    v26 = objc_retainAutorelease(v26);
    *a9 = v26;
  }
LABEL_18:

  return v25;
}

- (BOOL)generateAndPersistMapPreviewFromSourceURL:(id)a3 previewURL:(id)a4 senderContext:(id)a5 size:(CGSize *)a6 previewConstraints:(IMPreviewConstraints *)a7 error:(id *)a8
{
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  CGImage *v21;
  id v22;
  NSObject *v23;
  BOOL v24;
  size_t Width;
  size_t Height;
  void *v27;
  void *v28;
  NSObject *v29;
  BOOL v30;
  BOOL v31;
  id v32;
  id v33;
  id v36;
  id obj;
  id v38;
  id v39;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE buf[32];
  uint64_t v49;
  _BYTE v50[128];
  _QWORD v51[4];

  v51[2] = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v36 = a4;
  v39 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v45;
    LOBYTE(v17) = 1;
LABEL_3:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v16)
        objc_enumerationMutation(obj);
      if ((v17 & 1) == 0)
      {
        v31 = 0;
        v32 = obj;
        goto LABEL_37;
      }
      v19 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v18), "integerValue");
      v43 = 0;
      v20 = *(_OWORD *)&a7->var1.height;
      *(_OWORD *)buf = *(_OWORD *)&a7->var0;
      *(_OWORD *)&buf[16] = v20;
      v49 = *(_QWORD *)&a7->var3;
      v21 = +[IMMapPreviewGenerator newPreviewFromSourceURL:senderContext:withPreviewConstraints:interfaceStyle:error:](IMMapPreviewGenerator, "newPreviewFromSourceURL:senderContext:withPreviewConstraints:interfaceStyle:error:", v38, v39, buf, v19, &v43);
      v22 = v43;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v22;
          *(_WORD *)&buf[22] = 2048;
          *(_QWORD *)&buf[24] = v19;
          _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "Got map preview %@ error %@ style %ld", buf, 0x20u);
        }

      }
      if (v21)
        v24 = v22 == 0;
      else
        v24 = 0;
      if (!v24)
        goto LABEL_24;
      if (a6)
      {
        Width = CGImageGetWidth(v21);
        Height = CGImageGetHeight(v21);
        a6->width = (double)Width;
        a6->height = (double)Height;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd"), v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      IMAttachmentPreviewFileURLFromURLWithSuffix(v36, (uint64_t)v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v28;
          _os_log_impl(&dword_19E239000, v29, OS_LOG_TYPE_INFO, "Persisting map preview %@ to %@", buf, 0x16u);
        }

      }
      v42 = 0;
      v30 = -[IMPreviewGeneratorManager persistPreviewToDiskCache:previewURL:error:](self, "persistPreviewToDiskCache:previewURL:error:", v21, v28, &v42);
      v22 = v42;

      if (v30)
      {
        v17 = 1;
      }
      else
      {
LABEL_24:
        if (a8)
          *a8 = objc_retainAutorelease(v22);
        v17 = 0;
        if (!v21)
          goto LABEL_28;
      }
      CFRelease(v21);
LABEL_28:

      if (v15 == ++v18)
      {
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (v15)
          goto LABEL_3;

        if (!v17)
        {
          v31 = 0;
          goto LABEL_38;
        }
        goto LABEL_34;
      }
    }
  }

LABEL_34:
  v41 = 0;
  v33 = +[IMContactCardPreviewGenerator generateContactPlistFrom:previewURL:senderContext:error:](IMMapPreviewGenerator, "generateContactPlistFrom:previewURL:senderContext:error:", v38, v36, v39, &v41);
  v32 = v41;
  v31 = v32 == 0;
  if (a8 && v32)
  {
    v32 = objc_retainAutorelease(v32);
    v31 = 0;
    *a8 = v32;
  }
LABEL_37:

LABEL_38:
  return v31;
}

- (BOOL)generateAndPersistContactCardPreviewFromSourceURL:(id)a3 previewURL:(id)a4 senderContext:(id)a5 size:(CGSize *)a6 previewConstraints:(IMPreviewConstraints *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  __int128 v17;
  CGImage *v18;
  id v19;
  BOOL v20;
  id v21;
  _BOOL4 v22;
  size_t Width;
  size_t Height;
  NSObject *v25;
  const __CFString *v26;
  id v28;
  id v29;
  _BYTE buf[32];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v29 = 0;
  v17 = *(_OWORD *)&a7->var1.height;
  *(_OWORD *)buf = *(_OWORD *)&a7->var0;
  *(_OWORD *)&buf[16] = v17;
  v31 = *(_QWORD *)&a7->var3;
  v18 = +[IMContactCardPreviewGenerator newPreviewFromSourceURL:previewURL:senderContext:withPreviewConstraints:error:](IMContactCardPreviewGenerator, "newPreviewFromSourceURL:previewURL:senderContext:withPreviewConstraints:error:", v14, v15, v16, buf, &v29);
  v19 = v29;
  if (v18)
    v20 = v19 == 0;
  else
    v20 = 0;
  if (!v20)
  {
    v21 = v19;
    v22 = 0;
    if (!a8)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (a6)
  {
    Width = CGImageGetWidth(v18);
    Height = CGImageGetHeight(v18);
    a6->width = (double)Width;
    a6->height = (double)Height;
  }
  v28 = 0;
  v22 = -[IMPreviewGeneratorManager persistPreviewToDiskCache:previewURL:error:](self, "persistPreviewToDiskCache:previewURL:error:", v18, v15, &v28);
  v21 = v28;
  if (a8)
  {
LABEL_10:
    if (!v22)
      *a8 = objc_retainAutorelease(v21);
  }
LABEL_12:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      if (v22)
        v26 = CFSTR("YES");
      *(_QWORD *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v26;
      _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Got contact card preview %@ error %@ success %@", buf, 0x20u);
    }

  }
  if (v18)
    CFRelease(v18);

  return v22;
}

- (BOOL)generateAndPersistMetadataFromSourceURL:(id)a3 destinationURL:(id)a4 senderContext:(id)a5 size:(CGSize *)a6 constraints:(IMPreviewConstraints *)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  __int128 v16;
  objc_class *v17;
  NSObject *v18;
  __int128 v19;
  void *v20;
  id v21;
  id v22;
  BOOL v23;
  int v24;
  int v25;
  NSObject *v26;
  BOOL v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  id v32;
  _BYTE buf[32];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = *(_OWORD *)&a7->var1.height;
  *(_OWORD *)buf = *(_OWORD *)&a7->var0;
  *(_OWORD *)&buf[16] = v16;
  v34[0] = *(_QWORD *)&a7->var3;
  v17 = -[IMPreviewGeneratorManager _previewGeneratorClassForSourceURL:previewConstraints:](self, "_previewGeneratorClassForSourceURL:previewConstraints:", v13, buf);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Generating metadata for source %@ with class %@", buf, 0x16u);
    }

  }
  if ((-[objc_class generatesMetadata](v17, "generatesMetadata") & 1) != 0)
  {
    v32 = 0;
    v19 = *(_OWORD *)&a7->var1.height;
    *(_OWORD *)buf = *(_OWORD *)&a7->var0;
    *(_OWORD *)&buf[16] = v19;
    v34[0] = *(_QWORD *)&a7->var3;
    -[objc_class generateAndPersistMetadataFromSourceURL:senderContext:withPreviewConstraints:error:](v17, "generateAndPersistMetadataFromSourceURL:senderContext:withPreviewConstraints:error:", v13, v15, buf, &v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v32;
    v22 = v21;
    if (v20)
      v23 = v21 == 0;
    else
      v23 = 0;
    v24 = v23;
    v25 = IMOSLoggingEnabled();
    if (v24)
    {
      if (v25)
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v14;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = CFSTR("NO");
          LOWORD(v34[0]) = 2112;
          *(_QWORD *)((char *)v34 + 2) = 0;
          _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, "Moving preview metadata from %@ to %@ success %@ error %@", buf, 0x2Au);
        }

      }
      v31 = 0;
      v27 = -[IMPreviewGeneratorManager movePreviewToDiskCache:previewURL:error:](self, "movePreviewToDiskCache:previewURL:error:", v20, v14, &v31);
      v22 = v31;
    }
    else
    {
      if (v25)
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v13;
          _os_log_impl(&dword_19E239000, v29, OS_LOG_TYPE_INFO, "Preview generation failed for: %@", buf, 0xCu);
        }

      }
      v27 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v17;
        _os_log_impl(&dword_19E239000, v28, OS_LOG_TYPE_INFO, "Preview generator does not support metadata: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 2, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0;
  }
  if (a8)
    *a8 = objc_retainAutorelease(v22);

  return v27;
}

- (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  id v10;
  id v11;
  __int128 v12;
  objc_class *v13;
  NSObject *v14;
  __int128 v15;
  CGImage *v16;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = *(_OWORD *)&a5->var1.height;
  v18 = *(_OWORD *)&a5->var0;
  v19 = v12;
  v20 = *(_QWORD *)&a5->var3;
  v13 = -[IMPreviewGeneratorManager _previewGeneratorClassForSourceURL:previewConstraints:](self, "_previewGeneratorClassForSourceURL:previewConstraints:", v10, &v18);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(v18) = 138412290;
      *(_QWORD *)((char *)&v18 + 4) = v13;
      _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Generate Preview for class: %@", (uint8_t *)&v18, 0xCu);
    }

  }
  v15 = *(_OWORD *)&a5->var1.height;
  v18 = *(_OWORD *)&a5->var0;
  v19 = v15;
  v20 = *(_QWORD *)&a5->var3;
  v16 = (CGImage *)-[objc_class newPreviewFromSourceURL:senderContext:withPreviewConstraints:error:](v13, "newPreviewFromSourceURL:senderContext:withPreviewConstraints:error:", v10, v11, &v18, a6);

  return v16;
}

- (BOOL)persistPreviewToDiskCache:(CGImage *)a3 previewURL:(id)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  __CFData *v9;
  __CFData *v10;
  BOOL v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Persisting preview to disk @ %@", (uint8_t *)&v13, 0xCu);
    }

  }
  if (IMSupportsASTC())
  {
    v9 = IMCreateASTCImageDataFromCGImageRef(a3);
    v10 = v9;
    if (v9)
      v11 = IMFreeSpaceWriteDataToURL(v9, (uint64_t)v7, 1);
    else
      v11 = 0;

  }
  else
  {
    v11 = +[IMImageUtilities persistCPBitmapWithImage:url:](IMImageUtilities, "persistCPBitmapWithImage:url:", a3, v7);
  }
  if (a5 && !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 9, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)movePreviewToDiskCache:(id)a3 previewURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeItemAtURL:error:", v9, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "moveItemAtURL:toURL:error:", v7, v9, a5);

  }
  else
  {
    IMLogHandleForCategory("IMPreviewGeneratorManager");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_19E36CE1C((uint64_t)v7, (uint64_t)v9, v13);

    v12 = 0;
  }

  return v12;
}

- (Class)_previewGeneratorClassForSourceURL:(id)a3 previewConstraints:(IMPreviewConstraints *)a4
{
  const __CFURL *v6;
  const __CFURL *v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  objc_class *v11;

  v6 = (const __CFURL *)a3;
  v7 = v6;
  if (a4->var5)
  {
    v8 = (objc_class *)objc_opt_class();
  }
  else
  {
    -[__CFURL lastPathComponent](v6, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IMUTITypeForFilename(v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v8 = -[IMPreviewGeneratorManager previewGeneratorClassForUTIType:](self, "previewGeneratorClassForUTIType:", v10);
    if (IMUTTypeIsSupportedAnimatedImage(v10)
      && -[objc_class isEqual:](v8, "isEqual:", objc_opt_class())
      && IMFileURLIsActuallyAnimated(v7))
    {
      v8 = (objc_class *)objc_opt_class();
    }

  }
  v11 = v8;

  return v11;
}

- (Class)previewGeneratorClassForUTIType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;

  v4 = a3;
  -[IMPreviewGeneratorManager UTITypes](self, "UTITypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "objectForKey:", v4);

  if (!v6)
  {
    v6 = (id)objc_opt_class();
    -[IMPreviewGeneratorManager dynamicTypes](self, "dynamicTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMPreviewGeneratorManager UTITypes](self, "UTITypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "objectForKey:", v9);

    if (v11)
      v6 = v11;

  }
  v12 = (objc_class *)v6;

  return v12;
}

- (NSDictionary)UTITypes
{
  return self->_UTITypes;
}

- (void)setUTITypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)dynamicTypes
{
  return self->_dynamicTypes;
}

- (void)setDynamicTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicTypes, 0);
  objc_storeStrong((id *)&self->_UTITypes, 0);
}

@end
