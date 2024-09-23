@implementation IMAnimatedImagePreviewGenerator

+ (id)UTITypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CA5B68];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  id v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  double var0;
  double var2;
  _BOOL8 var3;
  NSObject *v34;
  void *v35;
  dispatch_time_t v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  NSObject *v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  objc_class *v45;
  objc_class *v46;
  double v47;
  double v48;
  id v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  double v55;
  double v56;
  double v57;
  NSObject *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  id v70;
  NSObject *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  _QWORD *v78;
  void *v79;
  void *v81;
  id v82;
  NSObject *v83;
  uint64_t v84;
  _QWORD v85[4];
  NSObject *v86;
  uint64_t *v87;
  uint64_t *v88;
  _BYTE *v89;
  uint64_t v90;
  double *v91;
  uint64_t v92;
  void *v93;
  __int128 v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  char v98;
  os_activity_scope_state_s state;
  uint8_t v100[4];
  const __CFString *v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  void *v107;
  _BYTE buf[24];
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  _QWORD v112[5];
  NSSize v113;

  v112[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v82 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v83 = _os_activity_create(&dword_19E239000, "com.apple.messages.AttachmentGeneratePreviewAnimatedImage", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v83, &state);
  if (!v13)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v40;
        v41 = v40;
        _os_log_impl(&dword_19E239000, v39, OS_LOG_TYPE_INFO, "%@ - sourceURL is nil", buf, 0xCu);

      }
    }
    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 5, 0);
      v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:
      v38 = 0;
LABEL_54:
      *a8 = v42;
      goto LABEL_71;
    }
    goto LABEL_70;
  }
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isSessionAnimatedImageUnpackerEnabled");

  if (v16)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = a1;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "%@ generate animated preview using session BlastDoor.", buf, 0xCu);
      }

    }
    v18 = (void *)MEMORY[0x1E0C99E98];
    IMSafeTemporaryDirectory();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v112[0] = v20;
    v112[1] = CFSTR("IMAnimatedImagePreviewGeneratorPreview");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileURLWithPathComponents:", v21);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v81, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "URLByAppendingPathComponent:isDirectory:", v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    IMPreviewExtension();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URLByAppendingPathExtension:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v27 = v14;
    v28 = v13;
    v29 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(v29, "startTimingForKey:", CFSTR("IMAnimatedImagePreviewGenerator_PreviewGenerationTime"));
    v79 = v29;
    v95 = 0;
    v96 = &v95;
    v97 = 0x2020000000;
    v98 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v109 = sub_19E2476BC;
    v110 = sub_19E247544;
    v111 = 0;
    v90 = 0;
    v91 = (double *)&v90;
    v92 = 0x3010000000;
    v93 = &unk_19E3C9D87;
    v94 = *MEMORY[0x1E0C9D820];
    v30 = dispatch_group_create();
    dispatch_group_enter(v30);
    var0 = a6->var0;
    var2 = a6->var2;
    var3 = a6->var3;
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = sub_19E2FD118;
    v85[3] = &unk_1E3FB8E88;
    v87 = &v95;
    v88 = &v90;
    v89 = buf;
    v34 = v30;
    v86 = v34;
    v13 = v28;
    v35 = (void *)v26;
    +[IMAttachmentBlastdoor generateAnimatedImagePreview:senderContext:destinationFileURL:maxPixelDimension:scale:maxFrameCount:isSticker:withCompletionBlock:](IMAttachmentBlastdoor, "generateAnimatedImagePreview:senderContext:destinationFileURL:maxPixelDimension:scale:maxFrameCount:isSticker:withCompletionBlock:", v28, v27, v26, 200, var3, v85, var0, var2);
    v36 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v34, v36))
    {
      if (!IMOSLoggingEnabled())
      {
        v38 = 0;
        v14 = v27;
        goto LABEL_57;
      }
      v14 = v27;
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v100 = 0;
        _os_log_impl(&dword_19E239000, v37, OS_LOG_TYPE_INFO, "Timed out generating animated image preview.", v100, 2u);
      }

    }
    else
    {
      v55 = a6->var2;
      v56 = v55 * v91[4];
      v57 = v55 * v91[5];
      if (a7)
      {
        a7->width = v56;
        a7->height = v57;
      }
      objc_msgSend(v79, "stopTimingForKey:", CFSTR("IMAnimatedImagePreviewGenerator_PreviewGenerationTime"), a8);
      v14 = v27;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v59 = *((unsigned __int8 *)v96 + 24);
          v60 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          v113.width = v56;
          v113.height = v57;
          NSStringFromSize(v113);
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = (void *)v61;
          v63 = CFSTR("YES");
          *(_DWORD *)v100 = 138413058;
          if (!v59)
            v63 = CFSTR("NO");
          v101 = v63;
          v102 = 2112;
          v103 = v60;
          v104 = 2112;
          v105 = v61;
          v106 = 2112;
          v107 = v79;
          _os_log_impl(&dword_19E239000, v58, OS_LOG_TYPE_INFO, "Cache miss on animated image preview generation with success: (%@), error: (%@), outSize: %@ and timing: %@", v100, 0x2Au);

          v14 = v27;
        }

      }
      +[IMMetricsCollector sharedInstance](IMMetricsCollector, "sharedInstance");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "trackEvent:", CFSTR("com.apple.Messages.IMMetricsCollectorEventPreviewCacheMiss"));

      if (*((_BYTE *)v96 + 24))
      {
        v38 = v35;
        goto LABEL_57;
      }
      if (v78)
      {
        v38 = 0;
        *v78 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
        goto LABEL_57;
      }
    }
    v38 = 0;
LABEL_57:

    _Block_object_dispose(&v90, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v95, 8);
    goto LABEL_71;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = a1;
      _os_log_impl(&dword_19E239000, v43, OS_LOG_TYPE_INFO, "%@ generate animated preview using inefficient BlastDoor.", buf, 0xCu);
    }

  }
  v44 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1A1AE7D4C](CFSTR("CKAnimatedImage"), CFSTR("ChatKit"));
  v45 = (objc_class *)MEMORY[0x1A1AE7D4C](CFSTR("CKAnimatedImageMediaObject"), CFSTR("ChatKit"));
  v46 = v45;
  if (!v45 || !v44)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        v53 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v46;
        *(_WORD *)&buf[22] = 2112;
        v109 = v44;
        v54 = v53;
        _os_log_impl(&dword_19E239000, v52, OS_LOG_TYPE_INFO, "%@ failed to weak link CKAnimatedImageMediaObjectClass - %@ CKAnimatedImageClass - %@", buf, 0x20u);

      }
    }
    if (a8)
      goto LABEL_52;
    goto LABEL_70;
  }
  v47 = a6->var0;
  v48 = a6->var2;
  if (!-[objc_class conformsToProtocol:](v45, "conformsToProtocol:", &unk_1EE542AE0))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        v66 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v66;
        v67 = v66;
        _os_log_impl(&dword_19E239000, v65, OS_LOG_TYPE_INFO, "%@ CKAnimatedImageMediaObject not conforming to appropriate protocols", buf, 0xCu);

      }
    }
    if (a8)
    {
LABEL_52:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 10, 0);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_53;
    }
LABEL_70:
    v38 = 0;
    goto LABEL_71;
  }
  v49 = objc_alloc_init(v46);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "generateAndPersistAnimatedPreviewFromSourceURL:senderContext:forWidth:withTransferGUID:isSticker:", v13, v14, v50, a6->var3, v47 / v48);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v44, "conformsToProtocol:", &unk_1EE542D40))
  {
    if (a7)
    {
      if (v38)
      {
        v84 = 0;
        objc_msgSend(v44, "animatedImageFromOptimizedBitmapAtFileURL:error:", v38, &v84);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19E239000, v71, OS_LOG_TYPE_INFO, "Could not create CKAnimatedImage - previewURL is nil.", buf, 2u);
          }

        }
        v51 = 0;
      }
      objc_msgSend(v51, "size");
      v73 = v72;
      v75 = v74;
      objc_msgSend(v51, "scale");
      a7->width = v73 * v76;
      a7->height = v75 * v76;

    }
    goto LABEL_71;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      v69 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v69;
      v70 = v69;
      _os_log_impl(&dword_19E239000, v68, OS_LOG_TYPE_INFO, "%@ CKAnimatedImageMediaObject not conforming to appropriate protocols", buf, 0xCu);

    }
  }
  if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 10, 0);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
LABEL_71:
  os_activity_scope_leave(&state);

  return v38;
}

+ (BOOL)writesToDisk
{
  return 1;
}

@end
