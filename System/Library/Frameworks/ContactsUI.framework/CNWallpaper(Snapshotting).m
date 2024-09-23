@implementation CNWallpaper(Snapshotting)

- (void)posterSnapshotForSize:()Snapshotting topPadding:contact:posterConfiguration:completion:
{
  void (**v14)(id, _QWORD);
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  CNPRUISIncomingCallPosterContext *v21;
  CNPRUISIncomingCallPosterContext *v22;
  void *v23;
  void *v24;
  CNPRUISPosterSnapshotController *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  CNPRUISIncomingCallPosterContext *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  void (**v44)(id, _QWORD);
  double v45;
  double v46;
  double v47;
  id v48;
  uint8_t buf[16];

  v40 = a6;
  v39 = a7;
  v14 = a8;
  objc_msgSend((id)objc_opt_class(), "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AC56000, v15, OS_LOG_TYPE_INFO, "Initiating request for poster snapshot", buf, 2u);
  }

  v16 = *MEMORY[0x1E0D13818];
  objc_msgSend(a1, "posterArchiveData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v17);

  if ((_DWORD)v16)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v18, OS_LOG_TYPE_ERROR, "Attempting to generate a snapshot when poster archive data is empty", buf, 2u);
    }

    v14[2](v14, 0);
  }
  else
  {
    v19 = v39;
    if (!v19)
    {
      objc_msgSend(a1, "posterArchiveData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:error:](CNPRSPosterArchiver, "unarchiveCNConfigurationFromData:error:", v20, 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v40)
    {
      v21 = -[CNPRUISIncomingCallPosterContext initWithContact:showName:]([CNPRUISIncomingCallPosterContext alloc], "initWithContact:showName:", v40, 0);
    }
    else
    {
      +[CNPRUISIncomingCallPosterContext emptyContext](CNPRUISIncomingCallPosterContext, "emptyContext");
      v21 = (CNPRUISIncomingCallPosterContext *)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;
    +[CNPRUISIncomingCallSnapshotDefinition contentsOnlySnapshotDefinitionWithContext:attachmentIdentifiers:](CNPRUISIncomingCallSnapshotDefinition, "contentsOnlySnapshotDefinitionWithContext:attachmentIdentifiers:", v21, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPRUISPosterSnapshotRequest requestForConfiguration:definition:interfaceOrientation:](CNPRUISPosterSnapshotRequest, "requestForConfiguration:definition:interfaceOrientation:", v19, v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc_init(CNPRUISPosterSnapshotController);
    objc_msgSend(a1, "extensionBundleID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = v26;
    }
    else
    {
      objc_msgSend(v19, "providerBundleIdentifier");
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v38 = v28;

    v48 = 0;
    -[CNPRUISPosterSnapshotController latestSnapshotBundleForRequest:error:](v25, "latestSnapshotBundleForRequest:error:", v24, &v48);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v48;
    if (!v29)
      goto LABEL_18;
    objc_msgSend(v23, "levelSets");
    v36 = v23;
    v30 = v22;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "snapshotForLevelSet:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v30;
    v23 = v36;
    if (v33)
    {
      v34 = v38;
      objc_msgSend(a1, "snapshotDataFromSnapshotImage:forSize:topPadding:extensionBundleID:", v33, v38, a2, a3, a4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v14)[2](v14, v35);

    }
    else
    {
LABEL_18:
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __101__CNWallpaper_Snapshotting__posterSnapshotForSize_topPadding_contact_posterConfiguration_completion___block_invoke;
      v41[3] = &unk_1E204DC80;
      v41[4] = a1;
      v44 = v14;
      v42 = v23;
      v45 = a2;
      v46 = a3;
      v47 = a4;
      v34 = v38;
      v43 = v38;
      -[CNPRUISPosterSnapshotController executeSnapshotRequest:completion:](v25, "executeSnapshotRequest:completion:", v24, v41);

    }
  }

}

- (uint64_t)imageIsFullyTransparent:()Snapshotting
{
  uint64_t Width;
  uint64_t Height;
  uint64_t v6;
  unsigned __int8 *v7;
  CGContext *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  unsigned __int8 *v12;
  CGRect v15;

  Width = CGImageGetWidth(image);
  Height = CGImageGetHeight(image);
  v6 = 1;
  v7 = (unsigned __int8 *)malloc_type_calloc(Height * Width, 1uLL, 0x100004077774924uLL);
  v8 = CGBitmapContextCreate(v7, Width, Height, 8uLL, Width, 0, 7u);
  v15.size.width = (double)Width;
  v15.size.height = (double)Height;
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  CGContextDrawImage(v8, v15, image);
  if (Height >= 1)
  {
    v9 = 0;
    v10 = v7;
    while (1)
    {
      v11 = Width;
      v12 = v10;
      if (Width >= 1)
        break;
LABEL_6:
      ++v9;
      v10 += Width;
      if (v9 == Height)
      {
        v6 = 1;
        goto LABEL_9;
      }
    }
    while (!*v12++)
    {
      if (!--v11)
        goto LABEL_6;
    }
    v6 = 0;
  }
LABEL_9:
  free(v7);
  CGContextRelease(v8);
  return v6;
}

- (__CFData)snapshotDataFromSnapshotImage:()Snapshotting forSize:topPadding:extensionBundleID:
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  CGImage *v18;
  _BOOL4 v19;
  double v20;
  double Width;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGImage *v27;
  double v28;
  double v29;
  double v30;
  float v31;
  double v32;
  double v33;
  uint64_t v34;
  CGFloat v35;
  CGImage *v36;
  __CFData *v37;
  double Height;
  size_t v39;
  _BOOL4 v40;
  CGImage *v41;
  double v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  CGImageDestination *v47;
  NSObject *v48;
  __CFData *v49;
  _QWORD v51[7];
  uint8_t buf[4];
  id v53;
  uint64_t v54;
  CGSize v55;

  v54 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  objc_msgSend((id)objc_opt_class(), "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v55.width = a2;
    v55.height = a3;
    NSStringFromCGSize(v55);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v53 = v15;
    _os_log_impl(&dword_18AC56000, v14, OS_LOG_TYPE_DEFAULT, "Generating image data for snapshot image of size: %@", buf, 0xCu);

  }
  v16 = objc_msgSend(v12, "ioSurface");
  if (v16)
  {
    objc_msgSend(v12, "ioSurface");
    v17 = UICreateCGImageFromIOSurface();
  }
  else
  {
    v17 = objc_msgSend(objc_retainAutorelease(v12), "CGImage");
  }
  v18 = (CGImage *)v17;
  v19 = +[CNWallpaperUtilities supportsWatchImageDataRepairFor:](_TtC10ContactsUI20CNWallpaperUtilities, "supportsWatchImageDataRepairFor:", v13);
  v20 = floor(a4);
  Width = (double)CGImageGetWidth(v18);
  v22 = Width / (double)CGImageGetHeight(v18);
  v23 = 0.0;
  if (!v19)
    v23 = v20;
  v24 = a3 + v23;
  v25 = a2 / (a3 + v23);
  if (v22 >= v25)
    v26 = a3 + v23;
  else
    v26 = a2 / v22;
  v27 = (CGImage *)CGImageCreateByScaling();
  if (v16)
    CGImageRelease(v18);
  if (v19)
    v28 = v20;
  else
    v28 = 0.0;
  v29 = v28 + v24;
  v30 = 0.0;
  if (v22 < v25)
  {
    if (v19)
    {
      +[CNWallpaperUtilities monogramPosterOffset](_TtC10ContactsUI20CNWallpaperUtilities, "monogramPosterOffset", 0.0);
      v30 = floor(v24 * -0.5 + v26 * v31 - v20);
    }
    else
    {
      v30 = v26 * 0.0;
    }
  }
  v32 = fmax(v30, 0.0);
  if (v30 > 0.0)
    v30 = 0.0;
  v33 = v29 + v30;
  v34 = 0;
  v35 = a2;
  v36 = CGImageCreateWithImageInRect(v27, *(CGRect *)(&v32 - 1));
  CGImageRelease(v27);
  v37 = (__CFData *)objc_opt_new();
  Height = (double)CGImageGetHeight(v36);
  v39 = CGImageGetWidth(v36);
  v40 = v29 > Height && v19;
  v41 = v36;
  if (v40)
  {
    v42 = (double)v39;
    v43 = (void *)objc_opt_new();
    objc_msgSend(v43, "setScale:", 1.0);
    objc_msgSend(v43, "setOpaque:", 0);
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v43, a2, v29);
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __96__CNWallpaper_Snapshotting__snapshotDataFromSnapshotImage_forSize_topPadding_extensionBundleID___block_invoke;
    v51[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v51[4] = v36;
    *(double *)&v51[5] = v42;
    *(double *)&v51[6] = Height;
    objc_msgSend(v44, "imageWithActions:", v51);
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v41 = (CGImage *)objc_msgSend(v45, "CGImage");

  }
  if (objc_msgSend(a1, "imageIsFullyTransparent:", v41))
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v13;
      _os_log_error_impl(&dword_18AC56000, v46, OS_LOG_TYPE_ERROR, "Failed to generate watch snapshot image data from image, resulting image is fully transparent. %@", buf, 0xCu);
    }

    CGImageRelease(v36);
  }
  else
  {
    v47 = CGImageDestinationCreateWithData(v37, CFSTR("public.heic"), 1uLL, 0);
    CGImageDestinationAddImage(v47, v41, 0);
    CGImageDestinationFinalize(v47);
    CGImageRelease(v36);
    if (v47)
      CFRelease(v47);
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13818] + 16))())
    {
      v49 = v37;
      goto LABEL_39;
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v48, OS_LOG_TYPE_ERROR, "Failed to generate watch snapshot image data from image", buf, 2u);
    }

  }
  v49 = 0;
LABEL_39:

  return v49;
}

- (id)snapshotImageDataForWatch
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CNWallpaper_Snapshotting__snapshotImageDataForWatch__block_invoke;
  v8[3] = &unk_1E204DCC8;
  v3 = v2;
  v9 = v3;
  objc_msgSend(a1, "snapshotImageDataWithPreferredSize:topPadding:contact:posterConfiguration:completion:", 0, 0, v8, 410.0, 502.0, 165.0);
  objc_msgSend(v3, "future");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultWithTimeout:error:", 0, 5.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(*MEMORY[0x1E0D13880] + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (uint64_t)snapshotImageDataForWatchWithCompletion:()Snapshotting
{
  return objc_msgSend(a1, "snapshotImageDataWithPreferredSize:topPadding:contact:posterConfiguration:completion:", 0, 0, a3, 410.0, 502.0, 165.0);
}

- (uint64_t)snapshotImageDataForWatchForContact:()Snapshotting posterConfiguration:completion:
{
  return objc_msgSend(a1, "snapshotImageDataWithPreferredSize:topPadding:contact:posterConfiguration:completion:", 410.0, 502.0, 165.0);
}

- (uint64_t)snapshotImageDataForWatchForContact:()Snapshotting completion:
{
  return objc_msgSend(a1, "snapshotImageDataForWatchForContact:posterConfiguration:completion:", a3, 0, a4);
}

- (void)snapshotImageDataWithPreferredSize:()Snapshotting topPadding:contact:posterConfiguration:completion:
{
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint8_t v21[16];

  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = *MEMORY[0x1E0D13818];
  objc_msgSend(a1, "generatedWatchImageData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = (*(uint64_t (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  if ((v17 & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "posterSnapshotForSize:topPadding:contact:posterConfiguration:completion:", v14, v15, v16, a2, a3, a4);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
      }

      v16[2](v16, 0);
    }
  }
  else
  {
    objc_msgSend(a1, "generatedWatchImageData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v16)[2](v16, v19);

  }
}

+ (id)log
{
  if (log_cn_once_token_4_46400 != -1)
    dispatch_once(&log_cn_once_token_4_46400, &__block_literal_global_46401);
  return (id)log_cn_once_object_4_46402;
}

@end
