@implementation ICAttachmentInlineDrawingModel(PreviewGeneration)

- (BOOL)needToGeneratePreviews
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  unint64_t v8;
  _BOOL8 v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewImages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 < 2)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(a1, "attachment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "previewUpdateDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(a1, "attachment");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "hasFallbackImage"))
      {

        v9 = 0;
        goto LABEL_12;
      }
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
  }
  objc_msgSend(a1, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mergeableData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12 != 0;

  if (!v10)
  {
    if (v8 < 2)
      goto LABEL_13;
    goto LABEL_12;
  }

  if (v8 > 1)
  {
LABEL_12:

  }
LABEL_13:

  v13 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "previewImages");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v24 = v16;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v19;
    v29 = 1024;
    v30 = v9;
    v31 = 2048;
    v32 = objc_msgSend(v21, "count");
    _os_log_debug_impl(&dword_1AC7A1000, v13, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d self.attachment.previewImages.count %lu", buf, 0x30u);

  }
  return v9;
}

- (uint64_t)generatePreviewsDuringCloudActivity
{
  return 0;
}

+ (uint64_t)drawingPreviewVersion
{
  return (unsigned __int16)(objc_msgSend(MEMORY[0x1E0D63AF8], "serializationVersion") + 1);
}

+ (id)previewImageFromDrawing:()PreviewGeneration fullImage:scale:
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat y;
  double width;
  double height;
  double v27;
  double v28;
  CGFloat x;
  CGContext *v30;
  CGContext *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  size_t v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  CGFloat v49;
  CGImageRef Image;
  CGImageRef v51;
  CGFloat rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double r2;
  CGAffineTransform v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v6 = a4;
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = safeCanvasBoundsForDrawing(v6);
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v60.origin.x = v8;
  v60.origin.y = v10;
  v60.size.width = v12;
  v60.size.height = v14;
  v73.origin.x = v15;
  v73.origin.y = v17;
  r2 = v19;
  v73.size.width = v19;
  v73.size.height = v21;
  v61 = CGRectIntersection(v60, v73);
  v62 = CGRectOffset(v61, -v15, -v17);
  y = v62.origin.y;
  width = v62.size.width;
  if (v62.size.width == *MEMORY[0x1E0C9D820] && v62.size.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    y = 0.0;
    height = 100.0;
    width = 100.0;
    x = 0.0;
  }
  else
  {
    height = v62.size.height;
    if (v62.size.width < 50.0 || v62.size.height < 50.0)
    {
      if ((50.0 - v62.size.width) * -0.5 <= 0.0)
        v27 = (50.0 - v62.size.width) * -0.5;
      else
        v27 = 0.0;
      if ((50.0 - v62.size.height) * -0.5 <= 0.0)
        v28 = (50.0 - v62.size.height) * -0.5;
      else
        v28 = 0.0;
      v63 = CGRectInset(v62, v27, v28);
      v74.origin.x = v15;
      v74.origin.y = v17;
      v74.size.width = r2;
      v74.size.height = v21;
      v64 = CGRectIntersection(v63, v74);
      x = v64.origin.x;
      y = v64.origin.y;
      width = v64.size.width;
      height = v64.size.height;
    }
    else
    {
      x = v62.origin.x;
    }
  }
  v30 = (CGContext *)TSUCreateRGBABitmapContext();
  if (v30)
  {
    v31 = v30;
    CGContextTranslateCTM(v30, 30.72, 30.72);
    v32 = 322.56;
    v33 = 322.56 / height;
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    rect_24 = v21 - CGRectGetMaxY(v65);
    rect = x;
    if (width <= height * 4.0)
    {
      v40 = 322.56 / width;
      if (height <= width * 4.0)
      {
        if (width <= height)
        {
          v35 = width * v33;
          rect_8 = (322.56 - width * v33) * 0.5;
          rect_16 = 0.0;
        }
        else
        {
          v35 = 322.56;
          v32 = height * v40;
          rect_8 = 0.0;
          rect_16 = (322.56 - height * v40) * 0.5;
        }
        v37 = x;
        v38 = height;
        v34 = width;
        v36 = rect_24;
      }
      else
      {
        v38 = width + 30.72 / v40;
        v67.origin.x = x;
        v67.origin.y = rect_24;
        v67.size.width = width;
        v67.size.height = height;
        v36 = CGRectGetMaxY(v67) - v38;
        rect_8 = 0.0;
        v32 = 353.28;
        v35 = 322.56;
        rect_16 = -30.72;
        v37 = x;
        v34 = width;
      }
    }
    else
    {
      v34 = height + 30.72 / v33;
      rect_16 = 0.0;
      v35 = 353.28;
      if (objc_msgSend(MEMORY[0x1E0DC1290], "ic_isRTL"))
      {
        v66.origin.x = rect;
        v36 = rect_24;
        v66.origin.y = rect_24;
        v66.size.width = width;
        v66.size.height = height;
        v37 = CGRectGetMaxX(v66) - v34;
        rect_8 = -30.72;
        v38 = height;
      }
      else
      {
        v37 = rect;
        v38 = height;
        v36 = rect_24;
        rect_8 = 0.0;
      }
    }
    v41 = CGImageGetWidth(a5);
    CGAffineTransformMakeScale(&v59, (double)v41 / (r2 * a1) * a1, (double)v41 / (r2 * a1) * a1);
    v68.origin.x = v37;
    v68.origin.y = v36;
    v68.size.width = v34;
    v68.size.height = v38;
    v69 = CGRectApplyAffineTransform(v68, &v59);
    v42 = v69.origin.x;
    v43 = v69.origin.y;
    v44 = v69.size.width;
    if (v69.size.width / v69.size.height != v35 / v32
      && vabdd_f64(v69.size.width / v69.size.height, v35 / v32) >= fabs(v35 / v32 * 0.000000999999997))
    {
      v45 = (void *)MEMORY[0x1E0D641A0];
      NSStringFromCGRect(v69);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v70.origin.x = rect_8;
      v70.origin.y = rect_16;
      v70.size.width = v35;
      v70.size.height = v32;
      NSStringFromCGRect(v70);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v71.origin.x = rect;
      v71.origin.y = rect_24;
      v71.size.width = width;
      v71.size.height = height;
      NSStringFromCGRect(v71);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "TSUEqualFloats(scaledReadRect.size.width / scaledReadRect.size.height, drawRect.size.width / drawRect.size.height)", "+[ICAttachmentInlineDrawingModel(PreviewGeneration) previewImageFromDrawing:fullImage:scale:]", 1, 0, CFSTR("The aspect ratio of the rect for reading %@ should be the same as the aspect ratio for drawing %@, with strokebounds %@"), v46, v47, v48);

    }
    v49 = v35 / v44 * (double)CGImageGetWidth(a5);
    v72.size.height = v35 / v44 * (double)CGImageGetHeight(a5);
    v72.origin.x = rect_8 - v42 * (v35 / v44);
    v72.origin.y = rect_16 - v43 * (v35 / v44);
    v72.size.width = v49;
    CGContextDrawImage(v31, v72, a5);
    Image = CGBitmapContextCreateImage(v31);
    if (Image)
    {
      v51 = Image;
      objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithCGImage:", Image);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v51);
    }
    else
    {
      v39 = 0;
    }
    CGContextRelease(v31);
  }
  else
  {
    v39 = 0;
  }
  return v39;
}

+ (id)generateImageForAttachment:()PreviewGeneration fromDrawing:fullResolution:appearanceInfo:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__80;
  v26 = __Block_byref_object_dispose__80;
  v27 = 0;
  objc_msgSend(v9, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __122__ICAttachmentInlineDrawingModel_PreviewGeneration__generateImageForAttachment_fromDrawing_fullResolution_appearanceInfo___block_invoke;
  v17[3] = &unk_1E5C243C0;
  v13 = v10;
  v18 = v13;
  v21 = a5;
  v14 = v11;
  v19 = v14;
  v20 = &v22;
  objc_msgSend(v12, "performBlockAndWait:", v17);

  v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

+ (void)generatePreviewsForAttachment:()PreviewGeneration fromDrawing:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsForAttachment_fromDrawing___block_invoke;
  v11[3] = &unk_1E5C1E648;
  v12 = v7;
  v13 = v6;
  v14 = a1;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performBlockAndWait:", v11);

}

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__80;
  v15 = __Block_byref_object_dispose__80;
  v16 = 0;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v10[3] = &unk_1E5C1D9D0;
  v10[4] = a1;
  v10[5] = &v11;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  v7 = (void *)objc_opt_class();
  objc_msgSend(a1, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generatePreviewsForAttachment:fromDrawing:", v8, v12[5]);

  _Block_object_dispose(&v11, 8);
  return 1;
}

@end
