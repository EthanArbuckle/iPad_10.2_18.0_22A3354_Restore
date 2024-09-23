@implementation IMImagePreviewGenerator

+ (id)UTITypes
{
  return &unk_1E3FFF218;
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  const __CFURL *v10;
  id v11;
  NSObject *v12;
  CGImageSourceRef v13;
  __int128 v14;
  CGImage *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  _BYTE v20[32];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = (const __CFURL *)a3;
  v11 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v20 = 138412546;
      *(_QWORD *)&v20[4] = a1;
      *(_WORD *)&v20[12] = 2112;
      *(_QWORD *)&v20[14] = v10;
      _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Generating preview for class %@ from sourceURL %@", v20, 0x16u);
    }

  }
  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "IMImagePreviewGenerator - sourceURL is nil", v20, 2u);
      }

    }
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 5, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  v13 = CGImageSourceCreateWithURL(v10, 0);
  if (!v13)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v20 = 138412290;
        *(_QWORD *)&v20[4] = v10;
        _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "IMImagePreviewGenerator - Unable to generate image ref for %@", v20, 0xCu);
      }

    }
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 3, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
      v15 = 0;
      *a6 = v17;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  v14 = *(_OWORD *)&a5->var1.height;
  *(_OWORD *)v20 = *(_OWORD *)&a5->var0;
  *(_OWORD *)&v20[16] = v14;
  v21 = *(_QWORD *)&a5->var3;
  v15 = (CGImage *)objc_msgSend(a1, "_newCroppedAndScaledImageWithImageSource:withPreviewConstraints:", v13, v20);
  CFRelease(v13);
LABEL_22:

  return v15;
}

+ (CGImage)_newCroppedAndScaledImageWithImageSource:(CGImageSource *)a3 withPreviewConstraints:(IMPreviewConstraints *)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double var0;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  id v16;
  double v17;
  void *v18;
  const void *v19;
  __int128 v20;
  CGImage *v21;
  _BYTE v23[32];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[IMImageUtilities imageSourcePxSize:](IMImageUtilities, "imageSourcePxSize:");
  v8 = v7;
  v10 = v9;
  var0 = a4->var0;
  v12 = fmax(v8 / v9, 0.75);
  if (v12 > 1.77777778)
    v12 = 1.77777778;
  v13 = round(var0);
  v14 = round(var0 / v12);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      IMStringFromCGSize(v8, v10);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = a4->var0;
      IMStringFromCGSize(v13, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138412802;
      *(_QWORD *)&v23[4] = v16;
      *(_WORD *)&v23[12] = 2048;
      *(double *)&v23[14] = v17;
      *(_WORD *)&v23[22] = 2112;
      *(_QWORD *)&v23[24] = v18;
      _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Generating thumbnail for image with px size %@ maxWidth: %f thumbnailSize %@", v23, 0x20u);

    }
  }
  v19 = (const void *)objc_msgSend(a1, "newThumbnailFillToSize:imagePxSize:imageSource:scale:", a3, v13, v14, v8, v10, a4->var2);
  v20 = *(_OWORD *)&a4->var1.height;
  *(_OWORD *)v23 = *(_OWORD *)&a4->var0;
  *(_OWORD *)&v23[16] = v20;
  v24 = *(_QWORD *)&a4->var3;
  v21 = (CGImage *)objc_msgSend(a1, "newCroppedAndRescaledImageFromImage:constraints:targetPxSize:", v19, v23, v13, v14);
  if (v19)
    CFRelease(v19);
  return v21;
}

+ (CGImage)_newBlastdoorPreviewForFileAtURL:(id)a3 senderContext:(id)a4 maxPxWidth:(double)a5 scale:(double)a6 isScreenshot:(BOOL *)a7 isMonoskiAsset:(BOOL *)a8 stickerEffect:(id *)a9 error:(id *)a10
{
  id v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  BOOL v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  CGImage *v35;
  char v36;
  void *v38;
  char v39;
  char v40;
  __int128 v42;
  uint8_t buf[4];
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v42 = (unint64_t)a8;
  v51 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  *(float *)&v17 = a5;
  *(float *)&v18 = a6;
  +[IMAttachmentBlastdoor generateImagePreviewForFileURL:senderContext:maxPixelDimension:scale:error:](IMAttachmentBlastdoor, "generateImagePreviewForFileURL:senderContext:maxPixelDimension:scale:error:", v15, v16, (char *)&v42 + 8, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *((id *)&v42 + 1);
  if (v19
    && (objc_msgSend(v19, "utTypeString"), (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (objc_msgSend(v19, "utTypeString"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "length") == 0,
        v22,
        v21,
        !v23))
  {
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v19, "utTypeString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setValue:forKey:", v25, CFSTR("uti_type"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "isFromMe"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setValue:forKey:", v26, CFSTR("is_from_me"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "isTrustedSender"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setValue:forKey:", v27, CFSTR("is_trusted_sender"));
    objc_msgSend(v16, "serviceName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setValue:forKey:", v28, CFSTR("service"));

    +[IMMetricsCollector sharedInstance](IMMetricsCollector, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorEventImagePreviewGenerationSuccess"), v24);

  }
  else
  {
    +[IMMetricsCollector sharedInstance](IMMetricsCollector, "sharedInstance");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trackEvent:", CFSTR("com.apple.Messages.IMMetricsCollectorEventImagePreviewGenerationFailure"));
  }

  +[IMDefaults sharedInstance](IMDefaults, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "getBoolFromDomain:forKey:defaultValue:", CFSTR("com.apple.imtranscoding.IMTranscoderAgent"), CFSTR("failBDPreviewGeneration"), 0);

  if (v31)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v44 = CFSTR("com.apple.imtranscoding.IMTranscoderAgent");
        v45 = 2112;
        v46 = CFSTR("failBDPreviewGeneration");
        v47 = 2112;
        v48 = v19;
        v49 = 2112;
        v50 = v20;
        _os_log_impl(&dword_19E239000, v32, OS_LOG_TYPE_INFO, "Forcing PreviewGeneration to fail due to default %@ %@. Actual result: image %@ error %@", buf, 0x2Au);
      }

    }
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 14, 0);

    v20 = (id)v33;
    goto LABEL_16;
  }
  if (!v19)
  {
LABEL_16:
    if (!v20)
      v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 1, 0);
    v19 = 0;
    v36 = 0;
    v35 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v19, "image");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = CGImageRetain((CGImageRef)objc_msgSend(v34, "cgImage"));

  if (+[IMImageUtilities isCroppingAvoidanceEnabled](IMImageUtilities, "isCroppingAvoidanceEnabled")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v36 = objc_msgSend(v19, "isScreenshot");
  }
  else
  {
    v36 = 0;
  }
  *(_BYTE *)v42 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(_BYTE *)v42 = objc_msgSend(v19, "isMonoskiAsset");
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isClingEnabled");

  v40 = v39 ^ 1;
  if (!a9)
    v40 = 1;
  if ((v40 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v19, "stickerEffect");
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_19:
  if (a10 && !v35)
    *a10 = objc_retainAutorelease(v20);
  if (a7)
    *a7 = v36;

  return v35;
}

+ (BOOL)_getUncroppedSizeForImageAtURL:(id)a3 scale:(double)a4 withImageSizeInPx:(CGSize)a5 maximumSizeInPx:(CGSize)a6 minimumSizeInPx:(CGSize)a7 previewSize:(CGSize *)a8 senderContext:(id)a9
{
  double height;
  double width;
  double v13;
  double v14;
  double v15;
  double v16;
  id v19;
  id v20;
  BOOL v21;
  CGImage *v22;
  id v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  NSObject *v28;
  id v30;
  __int16 v31;

  height = a7.height;
  width = a7.width;
  v13 = a6.height;
  v14 = a6.width;
  v15 = a5.height;
  v16 = a5.width;
  v19 = a3;
  v20 = a9;
  if (!+[IMImageUtilities shouldCropImageOfSize:maximumSizeInPx:minimumSizeInPx:](IMImageUtilities, "shouldCropImageOfSize:maximumSizeInPx:minimumSizeInPx:", v16, v15, v14, v13, width, height))
  {
    v31 = 0;
    v30 = 0;
    v22 = (CGImage *)objc_msgSend(a1, "_newBlastdoorPreviewForFileAtURL:senderContext:maxPxWidth:scale:isScreenshot:isMonoskiAsset:stickerEffect:error:", v19, v20, (char *)&v31 + 1, &v31, 0, &v30, v14, a4);
    v23 = v30;
    if (v22)
    {
      +[IMImageUtilities uncroppedPreviewImageSizeFromImageSizeInPx:maximumSizeInPx:](IMImageUtilities, "uncroppedPreviewImageSizeFromImageSizeInPx:maximumSizeInPx:", v16, v15, v14, v13);
      v25 = v24;
      v27 = v26;
      if (HIBYTE(v31)
        || +[IMImageUtilities imageIsSubjectLift:](IMImageUtilities, "imageIsSubjectLift:", v22))
      {
        a8->width = v25;
        a8->height = v27;
        CGImageRelease(v22);
        v21 = 1;
LABEL_12:

        goto LABEL_13;
      }
      CGImageRelease(v22);
    }
    else
    {
      IMLogHandleForCategory("IMImagePreviewGenerator");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_19E36EA2C((uint64_t)v23, v19, v28);

    }
    v21 = 0;
    goto LABEL_12;
  }
  v21 = 0;
LABEL_13:

  return v21;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double var0;
  double var2;
  uint64_t v28;
  id v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  double v38;
  double v39;
  double v40;
  CGImage *v41;
  __int128 v42;
  CGImage *v43;
  _BOOL4 v44;
  id v45;
  CGImage *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  int v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  id v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  id v62;
  id v63;
  uint64_t v64;
  NSObject *v65;
  int v66;
  int v67;
  void *v69;
  void *v70;
  id v71;
  CGImage *image;
  void *v73;
  id v74;
  void *v75;
  id *v76;
  id v77;
  id v79;
  id v80;
  id v81;
  id v82;
  __int16 v83;
  os_activity_scope_state_s state;
  uint8_t buf[16];
  __int128 v86;
  uint64_t v87;
  _QWORD v88[4];

  v88[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v77 = a5;
  v15 = _os_activity_create(&dword_19E239000, "com.apple.messages.AttachmentGeneratePreviewImage", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  if (v13 && a7 && a8)
  {
    v76 = a8;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v13;
        _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Invoking Blastdoor for image at source URL: %@", buf, 0xCu);
      }

    }
    v17 = (void *)MEMORY[0x1E0C99E98];
    IMSafeTemporaryDirectory();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v19;
    v88[1] = CFSTR("ImagePreview");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileURLWithPathComponents:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v21, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URLByAppendingPathComponent:isDirectory:", v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URLByAppendingPathExtension:", CFSTR("ktx"));
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v13;
          _os_log_impl(&dword_19E239000, v61, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL for sourceURL: %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 6, 0);
      v25 = 0;
      v60 = 0;
      *v76 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_85;
    }
    if (!objc_msgSend(a1, "writesToDisk"))
    {
      v60 = 0;
LABEL_85:

      goto LABEL_86;
    }
    v83 = 0;
    var0 = a6->var0;
    if (a6->var0 < *(double *)"")
      var0 = *(double *)"";
    var2 = a6->var2;
    v81 = 0;
    v82 = 0;
    v28 = objc_msgSend(a1, "_newBlastdoorPreviewForFileAtURL:senderContext:maxPxWidth:scale:isScreenshot:isMonoskiAsset:stickerEffect:error:", v13, v14, (char *)&v83 + 1, &v83, &v82, &v81, var0, var2);
    v74 = v82;
    v29 = v81;
    v73 = v29;
    if (!v28 || v29)
    {
      if (v29)
      {
        v62 = v29;

        goto LABEL_83;
      }
      v62 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 1, 0);

      if (v62)
        goto LABEL_83;
LABEL_60:
      v63 = 0;
      v25 = 0;
LABEL_84:
      v25 = v25;

      v60 = v25;
      goto LABEL_85;
    }
    v71 = v14;
    image = (CGImage *)v28;
    +[IMImageUtilities imageRefPxSize:](IMImageUtilities, "imageRefPxSize:", v28);
    v31 = v30;
    v33 = v32;
    v34 = a6->var0;
    v35 = fmax(v30 / v32, 0.75);
    if (v35 <= 1.77777778)
      v36 = v35;
    else
      v36 = 1.77777778;
    v37 = +[IMImageUtilities isCroppingAvoidanceEnabled](IMImageUtilities, "isCroppingAvoidanceEnabled");
    v38 = v34 / v36;
    v39 = round(v34);
    v40 = round(v38);
    if (v37
      && (v41 = +[IMImageUtilities newUncroppedPreviewImageFromImage:isScreenshot:maximumSizeInPx:minimumSizeInPx:](IMImageUtilities, "newUncroppedPreviewImageFromImage:isScreenshot:maximumSizeInPx:minimumSizeInPx:", v28, HIBYTE(v83), v39, v40, a6->var1.width, a6->var1.height)) != 0|| (v42 = *(_OWORD *)&a6->var1.height, *(_OWORD *)buf = *(_OWORD *)&a6->var0, v86 = v42, v87 = *(_QWORD *)&a6->var3, (v41 = (CGImage *)objc_msgSend(a1, "newCroppedAndRescaledImageFromImage:constraints:targetPxSize:", v28, buf, v39, v40)) != 0))
    {
      v80 = 0;
      v43 = v41;
      v44 = +[IMImageUtilities persistPreviewToDiskCache:previewURL:error:](IMImageUtilities, "persistPreviewToDiskCache:previewURL:error:", v41, v25, &v80);
      v45 = v80;
      if (v44)
      {
        v46 = v43;
        v75 = v45;
        +[IMImageUtilities imageRefPxSize:](IMImageUtilities, "imageRefPxSize:", v43);
        v31 = v47;
        v33 = v48;
        objc_msgSend(v25, "URLByDeletingPathExtension");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "URLByAppendingPathExtension:", CFSTR("plist"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "isClingEnabled");

        if (v51 && objc_msgSend(v74, "length") && (objc_msgSend(v74, "isEqualToString:", CFSTR("none")) & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v74;
              _os_log_impl(&dword_19E239000, v52, OS_LOG_TYPE_INFO, "Sticker had effect: %@", buf, 0xCu);
            }

          }
          objc_msgSend(v70, "setObject:forKeyedSubscript:", v74, CFSTR("stickerEffectType"));
        }
        if ((_BYTE)v83)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19E239000, v53, OS_LOG_TYPE_INFO, "Image was monoski.", buf, 2u);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v83);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setObject:forKeyedSubscript:", v54, CFSTR("IMIsMonoskiAssetKey"));

        }
        if (!objc_msgSend(v70, "count"))
          goto LABEL_75;
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19E239000, v55, OS_LOG_TYPE_INFO, "Writing preview metadata", buf, 2u);
          }

        }
        v79 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v70, 200, 0, &v79);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v79;
        if (v56)
        {
          if (objc_msgSend(v56, "writeToURL:atomically:", v69, 1))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v69;
                _os_log_impl(&dword_19E239000, v58, OS_LOG_TYPE_INFO, "Wrote down preview metadata plist to %@", buf, 0xCu);
              }
LABEL_73:

            }
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v69;
              _os_log_impl(&dword_19E239000, v58, OS_LOG_TYPE_INFO, "Couldn't write down preview metadata plist to %@", buf, 0xCu);
            }
            goto LABEL_73;
          }
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v57;
            _os_log_impl(&dword_19E239000, v58, OS_LOG_TYPE_INFO, "Failed making preview metadata plist %@", buf, 0xCu);
          }
          goto LABEL_73;
        }

LABEL_75:
        v64 = 0;
        v66 = 1;
        goto LABEL_77;
      }
    }
    else
    {
      v43 = 0;
      v45 = 0;
    }
    v75 = v45;
    v64 = objc_msgSend(v45, "copy");
    if (IMOSLoggingEnabled())
    {
      v46 = v43;
      OSLogHandleForIMFoundationCategory();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v64;
        _os_log_impl(&dword_19E239000, v65, OS_LOG_TYPE_INFO, "IMImagePreviewGenerator - Unable to generate image: error=%@", buf, 0xCu);
      }

      v66 = 0;
    }
    else
    {
      v66 = 0;
      v46 = v43;
    }
LABEL_77:
    CGImageRelease(v46);
    v62 = (id)v64;
    CGImageRelease(image);

    v14 = v71;
    if (v64)
      v67 = 0;
    else
      v67 = v66;
    if (v67 == 1)
    {
      v63 = 0;
      a7->width = v31;
      a7->height = v33;
      goto LABEL_84;
    }

    if (v64)
    {
LABEL_83:
      v63 = objc_retainAutorelease(v62);
      v25 = 0;
      *v76 = v63;
      goto LABEL_84;
    }
    goto LABEL_60;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v59, OS_LOG_TYPE_INFO, "Invalid parameters", buf, 2u);
    }

  }
  v60 = 0;
LABEL_86:
  os_activity_scope_leave(&state);

  return v60;
}

+ (BOOL)writesToDisk
{
  return 1;
}

+ (CGImage)newThumbnailFillToSize:(CGSize)a3 imagePxSize:(CGSize)a4 imageSource:(CGImageSource *)a5 scale:(double)a6
{
  return +[IMImageUtilities newThumbnailForTargetSize:imageSize:imageSource:mode:scale:](IMImageUtilities, "newThumbnailForTargetSize:imageSize:imageSource:mode:scale:", a5, 1, a3.width, a3.height, a4.width, a4.height, a6);
}

@end
