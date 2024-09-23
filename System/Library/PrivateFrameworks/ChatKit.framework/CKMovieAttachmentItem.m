@implementation CKMovieAttachmentItem

- (BOOL)isJellyfishVideo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentItem transferGUID](self, "transferGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D37F30]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    IMBalloonExtensionIDWithSuffix();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)UTITypes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C8B3C0], "audiovisualTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexesOfObjectsPassingTest:", &__block_literal_global_244);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsAtIndexes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __33__CKMovieAttachmentItem_UTITypes__block_invoke(int a1, CFStringRef inUTI)
{
  return UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E0CA5BF8]) != 0;
}

- (void)generatePreviewWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CKMovieAttachmentItem *v20;
  id v21;
  _QWORD v22[7];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "previewCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKAttachmentPreviewCacheKey(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewMaxWidth");
  v10 = v9;
  -[CKMovieAttachmentItem size](self, "size");
  objc_msgSend(v7, "thumbnailFillSizeForWidth:imageSize:", v10, v11, v12);
  v14 = v13;
  v16 = v15;

  if ((objc_msgSend(v5, "isGeneratingPreviewForKey:", v6) & 1) == 0)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __55__CKMovieAttachmentItem_generatePreviewWithCompletion___block_invoke;
    v22[3] = &unk_1E274DD58;
    v22[4] = self;
    v22[5] = v14;
    v22[6] = v16;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__CKMovieAttachmentItem_generatePreviewWithCompletion___block_invoke_2;
    v17[3] = &unk_1E274CF80;
    v18 = v5;
    v19 = v6;
    v20 = self;
    v21 = v4;
    objc_msgSend(v18, "enqueueGenerationBlock:completion:withPriority:forKey:", v22, v17, 1, v19);

  }
}

uint64_t __55__CKMovieAttachmentItem_generatePreviewWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateThumbnailFillToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __55__CKMovieAttachmentItem_generatePreviewWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__CKMovieAttachmentItem_generatePreviewWithCompletion___block_invoke_3;
  v5[3] = &unk_1E274CF80;
  v6 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v7 = v2;
  v8 = v3;
  v9 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __55__CKMovieAttachmentItem_generatePreviewWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "_savePreview:", v2);
    v2 = v4;
  }
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v2);
    v2 = v4;
  }

}

- (id)_generateThumbnailFillToSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  CGImage *v22;
  CGImage *v23;
  double v24;
  size_t v25;
  double v26;
  double v27;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v79;
  double v80;
  __int128 v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  CGSize v85;
  CGSize v86;
  CGSize v87;

  height = a3.height;
  width = a3.width;
  v6 = MEMORY[0x193FF3C24]("kCMTimeZero", CFSTR("CoreMedia"));
  v83 = *(_OWORD *)v6;
  v84 = *(_QWORD *)(v6 + 16);
  -[CKMovieAttachmentItem size](self, "size");
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;

  v14 = width * v13 / v8;
  if (v8 == 0.0)
    v14 = 0.0;
  v15 = height * v13 / v10;
  if (v10 == 0.0)
    v15 = 0.0;
  v16 = fmax(v14, v15);
  v17 = ceil(v8 * v16);
  v18 = ceil(v10 * v16);
  -[CKAttachmentItem fileURL](self, "fileURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CKAVURLAssetForURL(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAppliesPreferredTrackTransform:", 1);
  objc_msgSend(v21, "setMaximumSize:", v17, v18);
  v81 = v83;
  v82 = v84;
  v22 = (CGImage *)objc_msgSend(v21, "copyCGImageAtTime:actualTime:error:", &v81, 0, 0);
  if (v22)
  {
    v23 = v22;
    v24 = (double)CGImageGetWidth(v22);
    v25 = CGImageGetHeight(v23);
    v26 = 1.0 / v13 * v24;
    v27 = 1.0 / v13 * (double)v25;
    if (v26 == width && v27 == height)
    {
      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", v23, objc_msgSend(0, "imageOrientation"), v13);
      v39 = *MEMORY[0x1E0C9D538];
      v38 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    else
    {
      v29 = width / v26;
      if (v26 == 0.0)
        v29 = 0.0;
      if (v27 == 0.0)
        v30 = 0.0;
      else
        v30 = height / v27;
      v31 = fmax(v29, v30);
      if (CKMainScreenScale_once_96 != -1)
        dispatch_once(&CKMainScreenScale_once_96, &__block_literal_global_52_1);
      v32 = *(double *)&CKMainScreenScale_sMainScreenScale_96;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_96 == 0.0)
        v32 = 1.0;
      v33 = ceil(v31 * v32) / v32;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "scale");
      v36 = v35 / v33;

      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", v23, 0, v36);
      v85.width = width;
      v85.height = height;
      UIGraphicsBeginImageContextWithOptions(v85, 0, 0.0);
      v39 = *MEMORY[0x1E0C9D538];
      v38 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v37, "size");
      v41 = v40;
      v43 = v42;
      if (CKMainScreenScale_once_96 != -1)
        dispatch_once(&CKMainScreenScale_once_96, &__block_literal_global_52_1);
      v44 = *(double *)&CKMainScreenScale_sMainScreenScale_96;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_96 == 0.0)
        v44 = 1.0;
      objc_msgSend(v37, "drawAtPoint:", 1.0 / v44 * (v39 * v44 + floor((width * v44 - v41 * v44) * 0.5)), 1.0 / v44 * (v38 * v44 + floor((height * v44 - v43 * v44) * 0.5)));
      UIGraphicsGetImageFromCurrentImageContext();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();

    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "playButtonImage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "playButtonArrowImage");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v47, "playButtonPunchesOutArrow");
    v51 = objc_msgSend(v47, "playButtonBackdropStyle");
    v86.width = width;
    v86.height = height;
    UIGraphicsBeginImageContextWithOptions(v86, 0, 0.0);
    objc_msgSend(v48, "size");
    v53 = v52;
    v55 = v54;
    if (CKMainScreenScale_once_96 != -1)
      dispatch_once(&CKMainScreenScale_once_96, &__block_literal_global_52_1);
    v56 = *(double *)&CKMainScreenScale_sMainScreenScale_96;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_96 == 0.0)
      v56 = 1.0;
    v79 = v39;
    v80 = v38;
    v57 = v39 * v56 + floor((width * v56 - v53 * v56) * 0.5);
    v58 = v38 * v56 + floor((height * v56 - v55 * v56) * 0.5);
    v59 = 1.0 / v56;
    v60 = v59 * v57;
    v61 = v59 * v58;
    objc_msgSend(v49, "size");
    v63 = v62;
    v65 = v64;
    if (CKMainScreenScale_once_96 != -1)
      dispatch_once(&CKMainScreenScale_once_96, &__block_literal_global_52_1);
    if (*(double *)&CKMainScreenScale_sMainScreenScale_96 == 0.0)
      v66 = 1.0;
    else
      v66 = *(double *)&CKMainScreenScale_sMainScreenScale_96;
    v67 = v63 * v66;
    v68 = v65 * v66;
    v69 = 1.0 / v66;
    objc_msgSend(v48, "drawAtPoint:", v60, v61);
    if (v50)
      objc_msgSend(v49, "drawAtPoint:blendMode:alpha:", 23, v69 * (v79 * v66 + floor((width * v66 - v67) * 0.5)), v69 * (v80 * v66 + floor((height * v66 - v68) * 0.5)), 1.0);
    UIGraphicsGetImageFromCurrentImageContext();
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:graphicsQuality:", v51, 100);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setGrayscaleTintMaskImage:", v70);
    objc_msgSend(v71, "setColorTintMaskImage:", v70);
    objc_msgSend(v71, "setFilterMaskImage:", v70);
    objc_msgSend(v45, "_applyBackdropViewSettings:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v87.width = width;
    v87.height = height;
    UIGraphicsBeginImageContextWithOptions(v87, 0, 0.0);
    if (CKMainScreenScale_once_96 != -1)
      dispatch_once(&CKMainScreenScale_once_96, &__block_literal_global_52_1);
    v73 = v67 * v69;
    v74 = v68 * v69;
    v75 = *(double *)&CKMainScreenScale_sMainScreenScale_96;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_96 == 0.0)
      v75 = 1.0;
    objc_msgSend(v72, "drawInRect:", 1.0 / v75 * (v79 * v75 + floor((width * v75 - width * v75) * 0.5)), 1.0 / v75 * (v80 * v75 + floor((height * v75 - height * v75) * 0.5)), width * v75 * (1.0 / v75), height * v75 * (1.0 / v75));
    if (v50)
    {
      if (CKMainScreenScale_once_96 != -1)
        dispatch_once(&CKMainScreenScale_once_96, &__block_literal_global_52_1);
      v76 = *(double *)&CKMainScreenScale_sMainScreenScale_96;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_96 == 0.0)
        v76 = 1.0;
      objc_msgSend(v49, "drawInRect:blendMode:alpha:", 26, 1.0 / v76 * (v79 * v76 + floor((width * v76 - v73 * v76) * 0.5)), 1.0 / v76 * (v80 * v76 + floor((height * v76 - v74 * v76) * 0.5)), v73 * v76 * (1.0 / v76), v74 * v76 * (1.0 / v76), 0.4);
    }
    else
    {
      if (CKMainScreenScale_once_96 != -1)
        dispatch_once(&CKMainScreenScale_once_96, &__block_literal_global_52_1);
      v77 = *(double *)&CKMainScreenScale_sMainScreenScale_96;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_96 == 0.0)
        v77 = 1.0;
      objc_msgSend(v49, "drawInRect:", 1.0 / v77 * (v79 * v77 + floor((width * v77 - v73 * v77) * 0.5)), 1.0 / v77 * (v80 * v77 + floor((height * v77 - v74 * v77) * 0.5)), v73 * v77 * (1.0 / v77), v74 * v77 * (1.0 / v77));
    }
    UIGraphicsGetImageFromCurrentImageContext();
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    CFRelease(v23);

  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (CGSize)size
{
  CGSize *p_size;
  double width;
  double height;
  double v6;
  double v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGAffineTransform v20;
  CGSize result;
  CGRect v22;
  CGRect v23;

  p_size = &self->super._size;
  width = self->super._size.width;
  height = self->super._size.height;
  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (width == *MEMORY[0x1E0C9D820] && height == v7)
  {
    -[CKAttachmentItem fileURL](self, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CKAVURLAssetForURL(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0C9D538];
      v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v12, "naturalSize");
      v16 = v15;
      v18 = v17;
      if (v12)
        objc_msgSend(v12, "preferredTransform");
      else
        memset(&v20, 0, sizeof(v20));
      v22.origin.x = v13;
      v22.origin.y = v14;
      v22.size.width = v16;
      v22.size.height = v18;
      v23 = CGRectApplyAffineTransform(v22, &v20);
      p_size->width = v23.size.width;
      p_size->height = v23.size.height;

    }
    width = p_size->width;
    height = p_size->height;
  }
  if (width == v6 && height == v7)
  {
    -[CKMovieAttachmentItem _defaultSize](self, "_defaultSize");
    p_size->width = width;
    p_size->height = height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)_defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 50.0;
  v3 = 50.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isIrisAsset
{
  return 0;
}

- (id)previewItemTitle
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  if (-[CKMovieAttachmentItem isJellyfishVideo](self, "isJellyfishVideo"))
  {
    CKFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ANIMOJI");
  }
  else
  {
    -[CKAttachmentItem fileURL](self, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Video Message.mov"));

    CKFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v8)
      v5 = CFSTR("SUMMARY_VIDEO_MESSAGE");
    else
      v5 = CFSTR("SUMMARY_VIDEO_TYPE");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
