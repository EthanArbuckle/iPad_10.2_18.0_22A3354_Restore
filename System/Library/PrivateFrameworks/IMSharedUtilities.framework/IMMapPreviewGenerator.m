@implementation IMMapPreviewGenerator

+ (id)UTITypes
{
  __CFString *PreferredIdentifierForTag;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], CFSTR("loc.vcf"), (CFStringRef)*MEMORY[0x1E0CA5CB0]);
  v5[0] = PreferredIdentifierForTag;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  __int128 v6;
  _OWORD v8[2];
  uint64_t v9;

  v6 = *(_OWORD *)&a5->var1.height;
  v8[0] = *(_OWORD *)&a5->var0;
  v8[1] = v6;
  v9 = *(_QWORD *)&a5->var3;
  return (CGImage *)objc_msgSend(a1, "newPreviewFromSourceURL:senderContext:withPreviewConstraints:interfaceStyle:error:", a3, a4, v8, 1, a6);
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 interfaceStyle:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_class *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_class *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  dispatch_time_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  CGImage *Copy;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  id v57;
  void *v59;
  void *v60;
  _QWORD v61[4];
  NSObject *v62;
  _BYTE *v63;
  uint64_t *v64;
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  os_activity_scope_state_s state;
  uint8_t buf[16];
  __int128 v72;
  uint64_t v73;
  _BYTE v74[24];
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = _os_activity_create(&dword_19E239000, "com.apple.messages.AttachmentGeneratePreviewMap", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  if (v12)
  {
    if (qword_1EE504508 != -1)
      dispatch_once(&qword_1EE504508, &unk_1E3FB3CE8);
    v15 = objc_msgSend(a1, "coordinateForvCardURL:senderContext:", v12, v13);
    v17 = v16;
    v19 = v18;
    if ((off_1EE504500(v15) & 1) != 0)
    {
      v20 = (objc_class *)MEMORY[0x1A1AE7D4C](CFSTR("MKMapSnapshotOptions"), CFSTR("MapKit"));
      if (v20)
      {
        v21 = objc_alloc_init(v20);
        objc_msgSend(v21, "setMapType:", 0);
        objc_msgSend((id)MEMORY[0x1A1AE7D4C](CFSTR("UITraitCollection"), CFSTR("UIKit")), "traitCollectionWithUserInterfaceStyle:", a6);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setTraitCollection:", v60);
        objc_msgSend(v21, "_setUseSnapshotService:", 1);
        objc_msgSend(a1, "mapThumbnailFillSizeForWidth:", a5->var0);
        v23 = v22;
        v25 = v24;
        if (qword_1EE504518 != -1)
          dispatch_once(&qword_1EE504518, &unk_1E3FB43E8);
        off_1EE504510(v17, v19, 500.0, 500.0);
        objc_msgSend(v21, "setRegion:");
        objc_msgSend(v21, "setSize:", v23 * (1.0 / a5->var2), v25 * (1.0 / a5->var2));
        v26 = (objc_class *)MEMORY[0x1A1AE7D4C](CFSTR("MKMapSnapshotter"), CFSTR("MapKit"));
        if (!v26)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              v46 = (void *)objc_opt_class();
              *(_DWORD *)v74 = 138412802;
              *(_QWORD *)&v74[4] = v46;
              *(_WORD *)&v74[12] = 2112;
              *(_QWORD *)&v74[14] = CFSTR("MKMapSnapshotter");
              *(_WORD *)&v74[22] = 2112;
              v75 = (uint64_t (*)(uint64_t, uint64_t))CFSTR("MapKit");
              v47 = v46;
              _os_log_impl(&dword_19E239000, v45, OS_LOG_TYPE_INFO, "%@ = Failed weak linking %@ from %@.", v74, 0x20u);

            }
          }
          if (a7)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 10, 0);
            Copy = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            Copy = 0;
          }
          goto LABEL_63;
        }
        v59 = (void *)objc_msgSend([v26 alloc], "initWithOptions:", v21);
        *(_QWORD *)v74 = 0;
        *(_QWORD *)&v74[8] = v74;
        *(_QWORD *)&v74[16] = 0x3032000000;
        v75 = sub_19E2476CC;
        v76 = sub_19E24754C;
        v77 = 0;
        v66 = 0;
        v67 = &v66;
        v68 = 0x2020000000;
        v69 = 0;
        v27 = dispatch_group_create();
        dispatch_group_enter(v27);
        objc_msgSend(a1, "mapSnapshotterQueue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = sub_19E307BA4;
        v61[3] = &unk_1E3FB9FB0;
        v64 = &v66;
        v65 = a1;
        v63 = v74;
        v29 = v27;
        v62 = v29;
        objc_msgSend(v59, "startWithQueue:completionHandler:", v28, v61);

        v30 = dispatch_time(0, 20000000000);
        if (dispatch_group_wait(v29, v30))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              v32 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v32;
              v33 = v32;
              _os_log_impl(&dword_19E239000, v31, OS_LOG_TYPE_INFO, "%@ - Map snapshot generation timed out", buf, 0xCu);

            }
          }
          if (a7)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 12, 0);
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
          *((_BYTE *)v67 + 24) = 0;
        }
        else if (*((_BYTE *)v67 + 24))
        {
          v48 = (void *)MEMORY[0x1A1AE7D4C](CFSTR("_UIBackdropViewSettings"), CFSTR("UIKit"));
          if (v48)
          {
            if (a6 == 2)
              v49 = 2030;
            else
              v49 = 2020;
            v50 = *(_OWORD *)&a5->var1.height;
            *(_OWORD *)buf = *(_OWORD *)&a5->var0;
            v72 = v50;
            v73 = *(_QWORD *)&a5->var3;
            objc_msgSend(a1, "titleBarMaskImageForWidth:constraints:error:", buf, a7, v23, v21);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              objc_msgSend(v48, "settingsForPrivateStyle:graphicsQuality:", v49, 100);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "setGrayscaleTintMaskImage:", v51);
              objc_msgSend(v52, "setColorTintMaskImage:", v51);
              objc_msgSend(v52, "setFilterMaskImage:", v51);
              objc_msgSend(*(id *)(*(_QWORD *)&v74[8] + 40), "_applyBackdropViewSettings:", v52);
              v53 = objc_claimAutoreleasedReturnValue();
              v54 = *(void **)(*(_QWORD *)&v74[8] + 40);
              *(_QWORD *)(*(_QWORD *)&v74[8] + 40) = v53;

              Copy = CGImageCreateCopy((CGImageRef)objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)&v74[8] + 40)), "CGImage"));
            }
            else
            {
              Copy = 0;
            }

            goto LABEL_62;
          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              v56 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v56;
              v57 = v56;
              _os_log_impl(&dword_19E239000, v55, OS_LOG_TYPE_INFO, "%@ - Failed to link __UIBackdropViewSettingsClass", buf, 0xCu);

            }
          }
          if (!a7 || *a7)
            goto LABEL_19;
          goto LABEL_52;
        }
        if (!a7 || *a7)
        {
LABEL_19:
          Copy = 0;
LABEL_62:

          _Block_object_dispose(&v66, 8);
          _Block_object_dispose(v74, 8);

LABEL_63:
          goto LABEL_66;
        }
LABEL_52:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 1, 0);
        Copy = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = (void *)objc_opt_class();
          *(_DWORD *)v74 = 138412802;
          *(_QWORD *)&v74[4] = v43;
          *(_WORD *)&v74[12] = 2112;
          *(_QWORD *)&v74[14] = CFSTR("MKMapSnapshotOptions");
          *(_WORD *)&v74[22] = 2112;
          v75 = (uint64_t (*)(uint64_t, uint64_t))CFSTR("MapKit");
          v44 = v43;
          _os_log_impl(&dword_19E239000, v42, OS_LOG_TYPE_INFO, "%@ = Failed weak linking %@ from %@.", v74, 0x20u);

        }
      }
      if (a7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 10, 0);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      }
LABEL_65:
      Copy = 0;
      goto LABEL_66;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = (void *)objc_opt_class();
        *(_DWORD *)v74 = 138412546;
        *(_QWORD *)&v74[4] = v40;
        *(_WORD *)&v74[12] = 2112;
        *(_QWORD *)&v74[14] = v12;
        v41 = v40;
        _os_log_impl(&dword_19E239000, v39, OS_LOG_TYPE_INFO, "%@ - Unable to parse coordinate for for %@", v74, 0x16u);

      }
    }
    if (!a7)
      goto LABEL_65;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 11, 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = (void *)objc_opt_class();
        *(_DWORD *)v74 = 138412290;
        *(_QWORD *)&v74[4] = v36;
        v37 = v36;
        _os_log_impl(&dword_19E239000, v35, OS_LOG_TYPE_INFO, "%@ - sourceURL is nil", v74, 0xCu);

      }
    }
    if (!a7)
      goto LABEL_65;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 5, 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_38:
  Copy = 0;
  *a7 = v38;
LABEL_66:
  os_activity_scope_leave(&state);

  return Copy;
}

+ (BOOL)writesToDisk
{
  return 0;
}

+ (id)mapSnapshotterQueue
{
  if (qword_1EE504528 != -1)
    dispatch_once(&qword_1EE504528, &unk_1E3FB44A8);
  return (id)qword_1EE504520;
}

+ (CGSize)mapThumbnailFillSizeForWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = a3 / 1.33333333;
  v4 = round(a3);
  v5 = round(v3);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (id)vCardDataForURL:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 8, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)vCardURLSForData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  v4 = (void *)MEMORY[0x1A1AE7D4C](CFSTR("CNContactVCardSerialization"), CFSTR("Contacts"));
  if (!v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "IMMapPreviewGenerator - Unable to weaklink CNContactVCardSerialization", buf, 2u);
      }

    }
    goto LABEL_16;
  }
  v12 = 0;
  objc_msgSend(v4, "contactsWithData:error:", v3, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v6 || !v5 || !objc_msgSend(v5, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "IMMapPreviewGenerator - Unable to extract contact for data. Error %@", buf, 0xCu);
      }

    }
    goto LABEL_16;
  }
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v8;
}

+ (BOOL)supportsBlastDoor
{
  return 1;
}

+ (CLLocationCoordinate2D)coordinateForvCardURL:(id)a3 senderContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  void *v24;
  double v25;
  uint64_t v26;
  CLLocationCoordinate2D result;

  v6 = a3;
  v7 = a4;
  if (+[IMMapPreviewGenerator supportsBlastDoor](IMMapPreviewGenerator, "supportsBlastDoor"))
  {
    if (qword_1EE504538 != -1)
      dispatch_once(&qword_1EE504538, &unk_1E3FB4668);
    objc_msgSend(a1, "vCardDataForURL:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = (double *)&v21;
    v23 = 0x3010000000;
    v25 = 0.0;
    v26 = 0;
    v24 = &unk_19E3C9D87;
    v25 = sub_19E3081C0();
    v26 = v9;
    if (v8)
    {
      v10 = dispatch_group_create();
      dispatch_group_enter(v10);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = sub_19E308204;
      v18[3] = &unk_1E3FB5588;
      v20 = &v21;
      v11 = v10;
      v19 = v11;
      +[IMAttachmentBlastdoor sendData:senderContext:forPreviewType:withCompletionBlock:](IMAttachmentBlastdoor, "sendData:senderContext:forPreviewType:withCompletionBlock:", v8, v7, 0, v18);
      dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      v12 = v22[4];
      v13 = v22[5];

    }
    else
    {
      v12 = v22[4];
      v13 = v22[5];
    }
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    objc_msgSend(a1, "_legacyCoordinateForvCardURL:", v6);
    v12 = v14;
    v13 = v15;
  }

  v16 = v12;
  v17 = v13;
  result.longitude = v17;
  result.latitude = v16;
  return result;
}

+ (CLLocationCoordinate2D)_legacyCoordinateForvCardURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double (*v27)(uint64_t, double, double);
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double (*v33)(uint64_t, double, double);
  void *v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  id v44;
  id obj;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;
  CLLocationCoordinate2D result;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1EE504548 != -1)
    dispatch_once(&qword_1EE504548, &unk_1E3FB1908);
  objc_msgSend(a1, "vCardDataForURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vCardURLSForData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = sub_19E3081C0();
  v9 = v8;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (!v10)
    goto LABEL_25;
  v11 = v10;
  v43 = v5;
  v44 = v4;
  v12 = *(_QWORD *)v48;
  v13 = obj;
  v46 = a1;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v48 != v12)
        objc_enumerationMutation(v13);
      v15 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "value", v43, v44);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "host");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v17, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("maps.apple.com")))
      {
        objc_msgSend(a1, "valueForKey:forURLComponents:", CFSTR("sll"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          v22 = v20;
        }
        else
        {
          objc_msgSend(a1, "valueForKey:forURLComponents:", CFSTR("ll"), v19);
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        v23 = v22;

        objc_msgSend(v23, "componentsSeparatedByString:", CFSTR(","));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count") == 2)
        {
          v27 = (double (*)(uint64_t, double, double))off_1EE504540;
          objc_msgSend(v24, "objectAtIndex:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          v29 = v28;
          objc_msgSend(v24, "objectAtIndex:", 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v26, "doubleValue");
          v7 = v27(v30, v29, v31);
          v9 = v32;
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {
        if (!objc_msgSend(v18, "isEqualToString:", CFSTR("maps.google.com")))
          goto LABEL_18;
        objc_msgSend(a1, "valueForKey:forURLComponents:", CFSTR("q"), v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsSeparatedByString:", CFSTR(" "));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "count"))
        {
          objc_msgSend(v24, "objectAtIndex:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "componentsSeparatedByString:", CFSTR(","));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "count") == 2)
          {
            v33 = (double (*)(uint64_t, double, double))off_1EE504540;
            objc_msgSend(v26, "objectAtIndex:", 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "doubleValue");
            v36 = v35;
            objc_msgSend(v26, "objectAtIndex:", 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "doubleValue");
            v7 = v33(v38, v36, v39);
            v9 = v40;

            goto LABEL_23;
          }

          v13 = obj;
        }
      }

      a1 = v46;
LABEL_18:

    }
    v11 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v11)
      continue;
    break;
  }
LABEL_24:
  v5 = v43;
  v4 = v44;
LABEL_25:

  v41 = v7;
  v42 = v9;
  result.longitude = v42;
  result.latitude = v41;
  return result;
}

+ (id)valueForKey:(id)a3 forURLComponents:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(a4, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("name=%@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)titleBarMaskImageForWidth:(double)a3 constraints:(IMPreviewConstraints *)a4 error:(id *)a5
{
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double var2;
  void (*v31)(_QWORD, double, double, double);
  void *v32;
  void (*v33)(double, double, double);
  void (*v34)(void);
  void *v35;
  void (*v36)(void);
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE buf[24];
  const __CFString *v43;
  uint64_t *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v9 = (void *)qword_1EE504568;
  v41 = qword_1EE504568;
  if (!qword_1EE504568)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_19E3090D8;
    v43 = (const __CFString *)&unk_1E3FB4F80;
    v44 = &v38;
    sub_19E3090D8((uint64_t)buf);
    v9 = (void *)v39[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v38, 8);
  if (!v10 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = CFSTR("UIColor");
      *(_WORD *)&buf[22] = 2112;
      v43 = CFSTR("UIKit");
      v13 = v12;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "%@ = Failed soft linking %@ from %@.", buf, 0x20u);

    }
  }
  if (!qword_1EE504570)
  {
    *(_OWORD *)buf = xmmword_1E3FB9FF0;
    *(_QWORD *)&buf[16] = 0;
    qword_1EE504570 = _sl_dlopen();
  }
  if ((!qword_1EE504570 || !sub_19E3091DC()) && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = CFSTR("UIGraphicsBeginImageContextWithOptions");
      *(_WORD *)&buf[22] = 2112;
      v43 = CFSTR("UIKit");
      v16 = v15;
      _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "%@ = Failed soft linking %@ from %@.", buf, 0x20u);

    }
  }
  if (!qword_1EE504570)
  {
    *(_OWORD *)buf = xmmword_1E3FB9FF0;
    *(_QWORD *)&buf[16] = 0;
    qword_1EE504570 = _sl_dlopen();
  }
  if ((!qword_1EE504570 || !sub_19E30926C()) && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = CFSTR("UIGraphicsGetImageFromCurrentImageContext");
      *(_WORD *)&buf[22] = 2112;
      v43 = CFSTR("UIKit");
      v19 = v18;
      _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "%@ = Failed soft linking %@ from %@.", buf, 0x20u);

    }
  }
  if (!qword_1EE504570)
  {
    *(_OWORD *)buf = xmmword_1E3FB9FF0;
    *(_QWORD *)&buf[16] = 0;
    qword_1EE504570 = _sl_dlopen();
  }
  if ((!qword_1EE504570 || !sub_19E3092FC()) && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = CFSTR("UIRectFill");
      *(_WORD *)&buf[22] = 2112;
      v43 = CFSTR("UIKit");
      v22 = v21;
      _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "%@ = Failed soft linking %@ from %@.", buf, 0x20u);

    }
  }
  if (!qword_1EE504570)
  {
    *(_OWORD *)buf = xmmword_1E3FB9FF0;
    *(_QWORD *)&buf[16] = 0;
    qword_1EE504570 = _sl_dlopen();
  }
  if ((!qword_1EE504570 || !sub_19E30938C()) && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = CFSTR("UIGraphicsEndImageContext");
      *(_WORD *)&buf[22] = 2112;
      v43 = CFSTR("UIKit");
      v25 = v24;
      _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "%@ = Failed soft linking %@ from %@.", buf, 0x20u);

    }
  }
  if (!v10)
    goto LABEL_63;
  if (!qword_1EE504570)
  {
    *(_OWORD *)buf = xmmword_1E3FB9FF0;
    *(_QWORD *)&buf[16] = 0;
    qword_1EE504570 = _sl_dlopen();
  }
  if (!qword_1EE504570 || !sub_19E3091DC())
    goto LABEL_63;
  if (!qword_1EE504570)
  {
    *(_OWORD *)buf = xmmword_1E3FB9FF0;
    *(_QWORD *)&buf[16] = 0;
    qword_1EE504570 = _sl_dlopen();
  }
  if (!qword_1EE504570 || !sub_19E30926C())
    goto LABEL_63;
  if (!qword_1EE504570)
  {
    *(_OWORD *)buf = xmmword_1E3FB9FF0;
    *(_QWORD *)&buf[16] = 0;
    qword_1EE504570 = _sl_dlopen();
  }
  if (!qword_1EE504570 || !sub_19E3092FC())
    goto LABEL_63;
  if (!qword_1EE504570)
  {
    *(_OWORD *)buf = xmmword_1E3FB9FF0;
    *(_QWORD *)&buf[16] = 0;
    qword_1EE504570 = _sl_dlopen();
  }
  if (qword_1EE504570 && sub_19E30938C())
  {
    objc_msgSend(a1, "mapThumbnailFillSizeForWidth:", a3, v38);
    v27 = v26;
    v29 = v28;
    var2 = a4->var2;
    v31 = (void (*)(_QWORD, double, double, double))sub_19E3091DC();
    if (!v31)
      goto LABEL_62;
    v31(0, v27, v29, 0.0);
    objc_msgSend(v10, "blackColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "set");

    v33 = (void (*)(double, double, double))sub_19E3092FC();
    if (!v33
      || (v33(0.0, v29 - var2 * 37.5, v27), (v34 = (void (*)(void))sub_19E30926C()) == 0)
      || (v34(), v35 = (void *)objc_claimAutoreleasedReturnValue(), (v36 = (void (*)(void))sub_19E30938C()) == 0))
    {
LABEL_62:
      sub_19E36B7D8();
      __break(1u);
      JUMPOUT(0x19E308F64);
    }
    v36();
  }
  else
  {
LABEL_63:
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 10, 0, v38);
      v35 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
  }
  return v35;
}

@end
