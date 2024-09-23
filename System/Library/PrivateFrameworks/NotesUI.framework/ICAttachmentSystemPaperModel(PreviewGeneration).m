@implementation ICAttachmentSystemPaperModel(PreviewGeneration)

- (uint64_t)generatePreviewsDuringCloudActivity
{
  return 0;
}

- (uint64_t)needToGeneratePreviews
{
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  os_log_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSObject *v23;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  _BYTE v52[14];
  __int16 v53;
  int v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!+[ICSystemPaperTextAttachment isEnabled](ICSystemPaperTextAttachment, "isEnabled"))
    return 0;
  objc_msgSend(a1, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPasswordProtectedAndLocked");

  if ((v6 & 1) != 0)
    return 0;
  objc_msgSend(a1, "attachment");
  v8 = (os_log_t)objc_claimAutoreleasedReturnValue();
  -[NSObject previewImages](v8, "previewImages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") <= 1)
    goto LABEL_17;
  objc_msgSend(a1, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "previewUpdateDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {

LABEL_17:
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(a1, "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasFallbackImage");

  if (!v13)
  {
LABEL_19:
    v7 = 1;
    goto LABEL_20;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(a1, "attachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "previewImages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (!v16)
  {

    LOBYTE(v19) = 0;
    LOBYTE(v18) = 0;
LABEL_25:
    v8 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attachment");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attachment");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "previewImages");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count");
      *(_DWORD *)buf = 138413570;
      v46 = v34;
      v47 = 2112;
      v48 = v35;
      v49 = 2112;
      v50 = v36;
      v51 = 2048;
      *(_QWORD *)v52 = v39;
      *(_WORD *)&v52[8] = 1024;
      *(_DWORD *)&v52[10] = v18 & 1;
      v53 = 1024;
      v54 = v19 & 1;
      _os_log_debug_impl(&dword_1AC7A1000, v8, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return 1 previewImages.count %lu hasDefault %d hasDark %d", buf, 0x36u);

    }
    goto LABEL_18;
  }
  v17 = v16;
  v18 = 0;
  v19 = 0;
  v20 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v42 != v20)
        objc_enumerationMutation(v15);
      v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      v18 |= objc_msgSend(v22, "appearanceType") == 0;
      v19 |= objc_msgSend(v22, "appearanceType") == 1;
    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  }
  while (v17);

  if ((v18 & v19 & 1) == 0)
    goto LABEL_25;
  v7 = 0;
LABEL_20:
  v23 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "previewImages");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");
    *(_DWORD *)buf = 138413314;
    v46 = v26;
    v47 = 2112;
    v48 = v27;
    v49 = 2112;
    v50 = v29;
    v51 = 1024;
    *(_DWORD *)v52 = v7;
    *(_WORD *)&v52[4] = 2048;
    *(_QWORD *)&v52[6] = v32;
    _os_log_debug_impl(&dword_1AC7A1000, v23, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d self.attachment.previewImages.count %lu", buf, 0x30u);

  }
  return v7;
}

+ (id)generateEmptyImage
{
  CGContext *v0;
  CGContext *v1;
  CGImageRef Image;
  CGImageRef v3;
  void *v4;
  CGRect v6;

  v0 = (CGContext *)TSUCreateRGBABitmapContext();
  if (v0)
  {
    v1 = v0;
    CGContextSetRGBFillColor(v0, 1.0, 0.0, 0.0, 1.0);
    v6.size.width = 50.0;
    v6.origin.x = 0.0;
    v6.origin.y = 0.0;
    v6.size.height = 50.0;
    CGContextFillRect(v1, v6);
    Image = CGBitmapContextCreateImage(v1);
    if (Image)
    {
      v3 = Image;
      objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithCGImage:", Image);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v3);
    }
    else
    {
      v4 = 0;
    }
    CGContextRelease(v1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)generateImageForAttachment:()PreviewGeneration fullResolution:appearanceInfo:
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint8_t v21[16];
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t *v25;
  char v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  v8 = a5;
  v9 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[ICAttachmentSystemPaperModel(PreviewGeneration) generateImageForAttachment:fullResolution:appearanceInfo:].cold.1(v7, v9);

  v10 = os_log_create("com.apple.notes", "SystemPaper");
  v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PreviewGeneration", ", buf, 2u);
  }

  +[ICSystemPaperImageGenerator imageGeneratorWithPaperAttachment:](ICSystemPaperImageGenerator, "imageGeneratorWithPaperAttachment:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v28 = buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__37;
  v31 = __Block_byref_object_dispose__37;
  v32 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __108__ICAttachmentSystemPaperModel_PreviewGeneration__generateImageForAttachment_fullResolution_appearanceInfo___block_invoke;
  v22[3] = &unk_1E5C20A10;
  v25 = buf;
  v15 = v14;
  v23 = v15;
  v26 = a4;
  v16 = v8;
  v24 = v16;
  objc_msgSend(v16, "performAsDefaultAppearance:", v22);
  v17 = v13;
  v18 = v17;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AC7A1000, v18, OS_SIGNPOST_INTERVAL_END, v11, "PreviewGeneration", ", v21, 2u);
  }

  v19 = *((id *)v28 + 5);
  _Block_object_dispose(buf, 8);

  return v19;
}

+ (id)previewImageForAttachment:()PreviewGeneration fullImage:scale:appearanceInfo:
{
  id v6;
  uint64_t v7;
  CGContext *v8;
  void *v9;
  void *v10;
  id v11;
  double Width;
  size_t Height;
  CGImageRef Image;
  CGImageRef v15;
  uint64_t v16;
  void *v17;
  CGRect v19;
  CGRect v20;

  v6 = a5;
  v7 = TSUCreateRGBABitmapContext();
  v8 = (CGContext *)v7;
  if (a4 && v7)
  {
    if ((objc_msgSend(v6, "isDark") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resolvedColorWithTraitCollection:", v9);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(v8, (CGColorRef)objc_msgSend(v11, "CGColor"));

      v19.size.width = 384.0;
      v19.origin.x = 0.0;
      v19.origin.y = 0.0;
      v19.size.height = 384.0;
      CGContextFillRect(v8, v19);

    }
    CGContextTranslateCTM(v8, 30.72, -30.72);
    Width = (double)CGImageGetWidth(a4);
    Height = CGImageGetHeight(a4);
    v20.size.width = 322.56 / Width * Width;
    v20.size.height = 322.56 / Width * (double)Height;
    v20.origin.y = 0.0 - (v20.size.height + -384.0);
    v20.origin.x = 0.0;
    CGContextDrawImage(v8, v20, a4);
    Image = CGBitmapContextCreateImage(v8);
    if (Image)
    {
      v15 = Image;
      objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithCGImage:", Image);
      v16 = objc_claimAutoreleasedReturnValue();
      CFRelease(v15);
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
    v17 = 0;
    if (!v7)
      goto LABEL_11;
  }
  CGContextRelease(v8);
  v17 = (void *)v16;
LABEL_11:

  return v17;
}

+ (uint64_t)generatePreviewsForAttachment:()PreviewGeneration paperIdentifier:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke;
  v13[3] = &unk_1E5C1E670;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v16 = &v18;
  v17 = a1;
  v15 = v10;
  objc_msgSend(v8, "performBlockAndWait:", v13);

  v11 = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  if (!+[ICSystemPaperTextAttachment isEnabled](ICSystemPaperTextAttachment, "isEnabled"))
    goto LABEL_5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__37;
  v23 = __Block_byref_object_dispose__37;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__37;
  v17 = __Block_byref_object_dispose__37;
  v18 = 0;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v12[3] = &unk_1E5C1DA20;
  v12[4] = a1;
  v12[5] = &v19;
  v12[6] = &v13;
  objc_msgSend(v6, "performBlockAndWait:", v12);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v14[5], "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend((id)v7, "fileExistsAtPath:", v8);

  if (v9)
  {
    v7 = objc_opt_class();
    objc_msgSend(a1, "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend((id)v7, "generatePreviewsForAttachment:paperIdentifier:", v10, v20[5]);

  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  if ((v9 & 1) == 0)
LABEL_5:
    LOBYTE(v7) = 0;

  return v7 & 1;
}

+ (void)generateImageForAttachment:()PreviewGeneration fullResolution:appearanceInfo:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, v4, "Generating System Paper image for attachment %@", (uint8_t *)&v5);

}

@end
