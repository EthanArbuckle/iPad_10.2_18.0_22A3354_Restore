@implementation IMWorkoutPreviewGenerator

+ (BOOL)_isAvailable
{
  return 1;
}

+ (BOOL)writesToDisk
{
  return 1;
}

+ (BOOL)generateWorkoutPreview:(id)a3 andWriteToURL:(id)a4 maxPxWidth:(double)a5 scale:(double)a6 imagePxSize:(CGSize *)a7
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;
  const __CFData *v23;
  const __CFData *v24;
  CGDataProvider *v25;
  CGImage *v26;
  BOOL v27;
  id v28;
  size_t Width;
  size_t Height;
  NSObject *v31;
  char v32;
  NSObject *v33;
  id v35;
  id v36;
  _BYTE buf[24];
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v35 = a4;
  *a7 = *(CGSize *)MEMORY[0x1E0C9D820];
  MEMORY[0x1A1AE7D4C](CFSTR("BlastDoorWorkoutPreview"), CFSTR("BlastDoor"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;
  v13 = objc_msgSend(v12, "activityType");
  v14 = objc_msgSend(v12, "isIndoor");
  v15 = objc_msgSend(v12, "configurationType");
  objc_msgSend(v12, "configurationName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "goalTypeIdentifier");
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v18 = (void *)qword_1EE504148;
  v43 = qword_1EE504148;
  if (!qword_1EE504148)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_19E2DA818;
    v38 = &unk_1E3FB4F80;
    v39 = &v40;
    sub_19E2DA818((uint64_t)buf);
    v18 = (void *)v41[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v40, 8);
  v20 = (void *)objc_msgSend([v19 alloc], "initWithActivityType:isIndoor:configurationType:configurationName:goalTypeIdentifier:", v13, v14, v15, v16, v17);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v21 = (void *)qword_1EE504158;
  v43 = qword_1EE504158;
  if (!qword_1EE504158)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_19E2DA918;
    v38 = &unk_1E3FB4F80;
    v39 = &v40;
    sub_19E2DA918((uint64_t)buf);
    v21 = (void *)v41[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v22, "uiImageRepresentationForBlastDoorDataSource:scale:", v20, a6);
  v23 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23
    && (v25 = CGDataProviderCreateWithCFData(v23),
        v26 = CGImageCreateWithPNGDataProvider(v25, 0, 1, kCGRenderingIntentDefault),
        CGDataProviderRelease(v25),
        v26))
  {
    v36 = 0;
    v27 = +[IMImageUtilities persistPreviewToDiskCache:previewURL:error:](IMImageUtilities, "persistPreviewToDiskCache:previewURL:error:", v26, v35, &v36);
    v28 = v36;
    if (v27)
    {
      Width = CGImageGetWidth(v26);
      Height = CGImageGetHeight(v26);
      a7->width = (double)Width;
      a7->height = (double)Height;
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v35;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v28;
        _os_log_impl(&dword_19E239000, v33, OS_LOG_TYPE_INFO, "IMWorkoutPreviewGenerator - Failed to write decorated image to URL %@: %@", buf, 0x16u);
      }

    }
    CGImageRelease(v26);

    v32 = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v31, OS_LOG_TYPE_INFO, "IMWorkoutPreviewGenerator - Failed to get image from IMWorkoutPreviewUnpacker_SwiftImpl", buf, 2u);
      }

    }
    v27 = 0;
    v32 = 1;
  }

  if ((v32 & 1) != 0)
    v27 = 0;

  return v27;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  double var0;
  double var2;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  CGSize *v33;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t *v36;
  uint64_t *v37;
  __int128 *p_buf;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  __int128 buf;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _QWORD v54[4];

  v54[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (v13 && a7 && a8)
  {
    v33 = a7;
    v16 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v17;
    v54[1] = CFSTR("ImagePreview");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLWithPathComponents:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLByAppendingPathExtension:", CFSTR("ktx"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v45 = 0;
      v46 = &v45;
      v47 = 0x2020000000;
      v48 = 0;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v50 = 0x3032000000;
      v51 = sub_19E24765C;
      v52 = sub_19E247514;
      v53 = 0;
      v39 = 0;
      v40 = &v39;
      v41 = 0x3032000000;
      v42 = sub_19E24765C;
      v43 = sub_19E247514;
      v44 = 0;
      v24 = dispatch_group_create();
      dispatch_group_enter(v24);
      var0 = a6->var0;
      var2 = a6->var2;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = sub_19E2DA674;
      v34[3] = &unk_1E3FB8128;
      v36 = &v45;
      v37 = &v39;
      p_buf = &buf;
      v27 = v24;
      v35 = v27;
      +[IMAttachmentBlastdoor generateWorkoutPreview:senderContext:maxPxWidth:scale:withCompletionBlock:](IMAttachmentBlastdoor, "generateWorkoutPreview:senderContext:maxPxWidth:scale:withCompletionBlock:", v13, v14, v34, var0, var2);
      dispatch_group_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
      if (v40[5] && *((_BYTE *)v46 + 24) && !*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      {
        objc_msgSend((id)objc_opt_class(), "generateWorkoutPreview:andWriteToURL:maxPxWidth:scale:imagePxSize:", v40[5], v23, v33, a6->var0, a6->var2);
      }
      else
      {

        v28 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        v23 = 0;
        if (v28)
          *a8 = objc_retainAutorelease(v28);
      }
      v30 = v23;

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(&buf, 8);

      _Block_object_dispose(&v45, 8);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v21;
          _os_log_impl(&dword_19E239000, v31, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL %@", (uint8_t *)&buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("__kIMPreviewGenerationErrorDomain"), 12, 0);
      v30 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19E239000, v29, OS_LOG_TYPE_INFO, "Invalid parameters", (uint8_t *)&buf, 2u);
      }

    }
    v30 = 0;
  }

  return v30;
}

@end
