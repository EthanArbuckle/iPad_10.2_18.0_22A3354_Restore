@implementation IMContactCardPreviewGenerator

+ (id)UTITypes
{
  return &unk_1E3FFF230;
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 withPreviewConstraints:(IMPreviewConstraints *)a4 error:(id *)a5
{
  void *v7;
  __int128 v8;
  CGImage *v9;
  _OWORD v11[2];
  uint64_t v12;

  objc_msgSend(a1, "vCardDataForURL:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a4->var1.height;
  v11[0] = *(_OWORD *)&a4->var0;
  v11[1] = v8;
  v12 = *(_QWORD *)&a4->var3;
  v9 = (CGImage *)objc_msgSend(a1, "newMonogramImageForData:constraints:", v7, v11);

  return v9;
}

+ (id)vCardDataForURL:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 8, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (CGImage)newMonogramImageForData:(id)a3 constraints:(IMPreviewConstraints *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
LABEL_24:
    v16 = 0;
    goto LABEL_25;
  }
  v6 = (void *)MEMORY[0x1A1AE7D4C](CFSTR("CNContactVCardSerialization"), CFSTR("Contacts"));
  if (!v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "IMContactCardPreviewGenerator - Unable to weaklink CNContactVCardSerialization", buf, 2u);
      }

    }
    goto LABEL_24;
  }
  v21 = 0;
  objc_msgSend(v6, "contactsWithData:error:", v5, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  if (v8 || !v7 || !objc_msgSend(v7, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v8;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "IMContactCardPreviewGenerator - Unable to extract contact for data. Error %@", buf, 0xCu);
      }

    }
    goto LABEL_24;
  }
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)MEMORY[0x1A1AE7D4C](CFSTR("CNMonogrammer"), CFSTR("ContactsUI"));
  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "IMContactCardPreviewGenerator -- Unable to weaklink CNMonogrammer", buf, 2u);
      }

    }
    goto LABEL_24;
  }
  v11 = [v10 alloc];
  objc_msgSend(a1, "contactMonogramDiameter");
  v12 = (void *)objc_msgSend(v11, "initWithStyle:diameter:", 1);
  objc_msgSend(v9, "givenName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "familyName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "monogramForPersonWithFirstName:lastName:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (const void *)objc_msgSend(v15, "CGImage");

  if (v16)
    CFRetain(v16);

LABEL_25:
  return (CGImage *)v16;
}

+ (BOOL)supportsBlastDoor
{
  return 1;
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 previewURL:(id)a4 senderContext:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  CGImage *v20;
  CGImage *v21;
  size_t Width;
  double Height;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  CGImage *v28;
  NSObject *v29;
  void *v30;
  id v31;
  _BYTE v33[32];
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6->var1.width);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6->var1.height);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6->var0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v33 = 138413058;
      *(_QWORD *)&v33[4] = v12;
      *(_WORD *)&v33[12] = 2112;
      *(_QWORD *)&v33[14] = v16;
      *(_WORD *)&v33[22] = 2112;
      *(_QWORD *)&v33[24] = v17;
      LOWORD(v34[0]) = 2112;
      *(_QWORD *)((char *)v34 + 2) = v18;
      _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Generating preview image for vcard %@ with constraints min size width %@ size height %@ max width %@", v33, 0x2Au);

    }
  }
  if (!v12)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = (void *)objc_opt_class();
        *(_DWORD *)v33 = 138412290;
        *(_QWORD *)&v33[4] = v30;
        v31 = v30;
        _os_log_impl(&dword_19E239000, v29, OS_LOG_TYPE_INFO, "%@ - sourceURL is nil", v33, 0xCu);

      }
    }
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 5, 0);
      v28 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_14:
    v28 = 0;
    goto LABEL_15;
  }
  v19 = *(_OWORD *)&a6->var1.height;
  *(_OWORD *)v33 = *(_OWORD *)&a6->var0;
  *(_OWORD *)&v33[16] = v19;
  v34[0] = *(_QWORD *)&a6->var3;
  v20 = (CGImage *)objc_msgSend(a1, "newContactCardPreviewFrom:previewURL:senderContext:withPreviewConstraints:error:", v12, v13, v14, v33, a7);
  v21 = v20;
  if (!v20)
    goto LABEL_14;
  Width = CGImageGetWidth(v20);
  Height = (double)CGImageGetHeight(v21);
  objc_msgSend(a1, "thumbnailFillSizeForWidth:imageSize:scale:", a6->var0, (double)Width, Height, a6->var2);
  v26 = fmax(v24 / (double)Width, v25 / Height);
  v27 = *(_OWORD *)&a6->var1.height;
  *(_OWORD *)v33 = *(_OWORD *)&a6->var0;
  *(_OWORD *)&v33[16] = v27;
  v34[0] = *(_QWORD *)&a6->var3;
  v28 = (CGImage *)objc_msgSend(a1, "newCroppedAndRescaledImageFromImage:constraints:targetPxSize:", v21, v33, ceil(v26 * (double)Width), ceil(v26 * Height));
  CGImageRelease(v21);
LABEL_15:

  return v28;
}

+ (id)contactCardPreviewPayloadsDirectoryFrom:(id)a3 previewURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

  if ((v9 & 1) == 0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (id)objc_opt_class();
      objc_msgSend(v7, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "%@ - Failed to create the preview directory: %@!", (uint8_t *)&v14, 0x16u);

    }
  }

  return v7;
}

+ (id)contactCardPreviewPayloadFileURLFrom:(id)a3 previewURL:(id)a4 withFileExtension:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "contactCardPreviewPayloadsDirectoryFrom:previewURL:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathExtension:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (double)contactMonogramDiameter
{
  return 32.0;
}

+ (CGImage)monogramForFirstName:(id)a3 lastName:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  CGImage *v12;
  NSObject *v13;
  uint8_t v15[16];

  v6 = a3;
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x1A1AE7D4C](CFSTR("CNMonogrammer"), CFSTR("ContactsUI"));
  if (v8)
  {
    v9 = [v8 alloc];
    objc_msgSend(a1, "contactMonogramDiameter");
    v10 = (void *)objc_msgSend(v9, "initWithStyle:diameter:", 1);
    objc_msgSend(v10, "monogramForPersonWithFirstName:lastName:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (CGImage *)objc_msgSend(v11, "CGImage");

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "IMContactCardPreviewGenerator -- Unable to weaklink CNMonogrammer", v15, 2u);
      }

    }
    v12 = 0;
  }

  return v12;
}

+ (id)generateContactPlistFrom:(id)a3 previewURL:(id)a4 senderContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v43;
  id *v44;
  void *v45;
  id v46;
  _QWORD v47[6];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  dispatch_semaphore_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = _os_activity_create(&dword_19E239000, "com.apple.messages.AttachmentGeneratePreviewContact", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  if ((objc_msgSend(a1, "supportsBlastDoor") & 1) != 0)
  {
    objc_msgSend(a1, "vCardDataForURL:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = sub_19E2476DC;
    v58 = sub_19E247554;
    v59 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = sub_19E2476DC;
    v52 = sub_19E247554;
    v53 = 0;
    v53 = dispatch_semaphore_create(0);
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = sub_19E30C8F8;
    v47[3] = &unk_1E3FBA010;
    v47[4] = &v54;
    v47[5] = &v48;
    v45 = (void *)v14;
    +[IMAttachmentBlastdoor sendData:senderContext:forPreviewType:withCompletionBlock:](IMAttachmentBlastdoor, "sendData:senderContext:forPreviewType:withCompletionBlock:", v14, v12, 1, v47);
    dispatch_semaphore_wait((dispatch_semaphore_t)v49[5], 0xFFFFFFFFFFFFFFFFLL);
    v44 = a6;
    if (v55[5])
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Received contactObj from BlastDoor!", buf, 2u);
        }

      }
      MEMORY[0x1A1AE7D4C](CFSTR("BlastDoorContactMessage"), CFSTR("BlastDoor"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = (void *)v55[5];
      else
        v17 = 0;
      v21 = v17;
      objc_msgSend(v21, "contactInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "givenName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, qword_1EE5014D0);

      objc_msgSend(v21, "contactInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "familyName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, qword_1EE5014D8);

      objc_msgSend(v21, "contactInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "organizationNameTitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, qword_1EE5014E0);

      objc_msgSend(v21, "contactInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "contactFormatterTitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v29, qword_1EE5014E8);

      objc_msgSend(v21, "contactInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "contactNameTitle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v31, qword_1EE5014F0);

      objc_msgSend(v21, "contactInfo");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "organizationNameSubtitle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v33, qword_1EE5014F8);

      objc_msgSend(v21, "contactInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "contactNameSubtitle");
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v35, qword_1EE501500);

      objc_msgSend((id)objc_opt_class(), "contactCardPreviewPayloadFileURLFrom:previewURL:withFileExtension:", v10, v11, CFSTR("plist"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      LOBYTE(v35) = objc_msgSend(v15, "writeToURL:error:", v36, &v46);
      v37 = v46;
      if ((v35 & 1) != 0)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v36, "path");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v62 = v39;
            _os_log_impl(&dword_19E239000, v38, OS_LOG_TYPE_INFO, "Successfully written the contact card plist at: %@", buf, 0xCu);

          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v43 = (id)objc_opt_class();
            objc_msgSend(v36, "path");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v62 = v43;
            v63 = 2112;
            v64 = v41;
            v65 = 2112;
            v66 = v37;
            _os_log_impl(&dword_19E239000, v40, OS_LOG_TYPE_INFO, "%@ - Failed to write to %@ with error %@!", buf, 0x20u);

          }
        }
        if (v44)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 9, 0);
          *v44 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v62 = v19;
          v20 = v19;
          _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "%@ - BlastDoor returned null contactObj!", buf, 0xCu);

        }
      }
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 11, 0);
        v15 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
    }
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(&v54, 8);
  }
  else
  {
    v15 = 0;
  }
  os_activity_scope_leave(&state);

  return v15;
}

+ (CGImage)newContactCardPreviewFrom:(id)a3 previewURL:(id)a4 senderContext:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFData *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  __int128 v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v33;
  void *v34;
  _BYTE buf[32];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if ((objc_msgSend(a1, "supportsBlastDoor") & 1) != 0)
  {
    objc_msgSend(a1, "generateContactPlistFrom:previewURL:senderContext:error:", v12, v13, v14, a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", qword_1EE5014D0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", qword_1EE5014D8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(a1, "monogramForFirstName:lastName:", v17, v18);

      if (v19)
        CFRetain(v19);
      v20 = IMCreateASTCImageDataFromCGImageRef((CGImage *)v19);
      if (v20)
      {
        objc_msgSend((id)objc_opt_class(), "contactCardPreviewPayloadFileURLFrom:previewURL:withFileExtension:", v12, v13, CFSTR("ktx"));
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v21, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)v21;
        LOBYTE(v21) = -[__CFData writeToFile:atomically:](v20, "writeToFile:atomically:", v22, 1);

        v23 = IMOSLoggingEnabled();
        if ((v21 & 1) != 0)
        {
          v24 = v34;
          if (v23)
          {
            OSLogHandleForIMFoundationCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v34, "path");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v26;
              _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Successfully written the avatar preview image at: %@", buf, 0xCu);

            }
          }
        }
        else
        {
          v24 = v34;
          if (v23)
          {
            OSLogHandleForIMFoundationCategory();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              v33 = (id)objc_opt_class();
              objc_msgSend(v34, "path");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v33;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v31;
              _os_log_impl(&dword_19E239000, v30, OS_LOG_TYPE_INFO, "%@ - Failed to write to %@", buf, 0x16u);

            }
          }
          if (a7)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 9, 0);
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
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
            *(_QWORD *)&buf[4] = objc_opt_class();
            v29 = *(id *)&buf[4];
            _os_log_impl(&dword_19E239000, v28, OS_LOG_TYPE_INFO, "%@ - Failed to generate the avatar image!", buf, 0xCu);

          }
        }
        if (a7)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 3, 0);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v27 = *(_OWORD *)&a6->var1.height;
    *(_OWORD *)buf = *(_OWORD *)&a6->var0;
    *(_OWORD *)&buf[16] = v27;
    v36 = *(_QWORD *)&a6->var3;
    v19 = (void *)objc_msgSend(a1, "newPreviewFromSourceURL:withPreviewConstraints:error:", v12, buf, a7);
  }

  return (CGImage *)v19;
}

@end
