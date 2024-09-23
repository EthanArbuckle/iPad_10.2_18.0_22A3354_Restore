@implementation ICAttachmentPDFModel(PreviewGeneration)

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  void *v5;
  void *v6;
  const __CFURL *v7;
  CGPDFDocument *v8;
  CGPDFPage *Page;
  CGPDFPage *v10;
  CGFloat width;
  CGFloat height;
  CGFloat x;
  CGFloat y;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  objc_class *v38;
  id v39;
  void *v40;
  uint64_t v41;
  CGPDFDocument *document;
  id v43;
  id obj;
  CGPDFPage *v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  void *v49;
  _QWORD v50[11];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[9];
  _QWORD v56[7];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint8_t v69[128];
  uint8_t buf[4];
  id v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  uint64_t v75;
  uint64_t v76;
  CGRect BoxRect;

  v76 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__15;
  v67 = __Block_byref_object_dispose__15;
  v68 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__15;
  v61 = __Block_byref_object_dispose__15;
  v62 = 0;
  v46 = a1;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v56[3] = &unk_1E5C1DA20;
  v56[5] = &v63;
  v56[4] = v46;
  v56[6] = &v57;
  objc_msgSend(v6, "performBlockAndWait:", v56);

  v7 = (const __CFURL *)v58[5];
  if (!v7)
  {
    v36 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v64[5];
      *(_DWORD *)buf = 138412802;
      v71 = v39;
      v72 = 2112;
      v73 = v40;
      v74 = 2112;
      v75 = v41;
      _os_log_debug_impl(&dword_1AC7A1000, v36, OS_LOG_TYPE_DEBUG, "%@ %@ %@ early return", buf, 0x20u);

    }
    goto LABEL_26;
  }
  v8 = CGPDFDocumentCreateWithURL(v7);
  if (!v8)
  {
LABEL_26:
    v35 = 0;
    goto LABEL_27;
  }
  document = v8;
  Page = CGPDFDocumentGetPage(v8, 1uLL);
  v10 = Page;
  if (!Page
    || (BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox), width = BoxRect.size.width, BoxRect.size.width <= 0.0)
    || (height = BoxRect.size.height, BoxRect.size.height <= 0.0))
  {
    CGPDFDocumentRelease(document);
    goto LABEL_26;
  }
  x = BoxRect.origin.x;
  y = BoxRect.origin.y;
  v45 = v10;
  if (BoxRect.size.width < BoxRect.size.height)
    v15 = BoxRect.size.width / BoxRect.size.height;
  else
    v15 = 1.0;
  if (BoxRect.size.width < BoxRect.size.height)
    v16 = 1.0;
  else
    v16 = BoxRect.size.height / BoxRect.size.width;
  objc_msgSend(v46, "attachment", BoxRect.size.height / BoxRect.size.width);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_8;
  v55[3] = &unk_1E5C1ED60;
  v55[4] = v46;
  *(CGFloat *)&v55[5] = x;
  *(CGFloat *)&v55[6] = y;
  *(CGFloat *)&v55[7] = width;
  *(CGFloat *)&v55[8] = height;
  objc_msgSend(v18, "performBlockAndWait:", v55);

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  +[ICPreviewDeviceContext sharedContext](ICPreviewDeviceContext, "sharedContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deviceInfoScalable:", 0);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v52 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v23, "imageSize");
        v25 = v24;
        objc_msgSend(v23, "imageSize");
        v27 = v26;
        objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "scale");
        objc_msgSend(v28, "setScale:");
        v29 = v15 * v25;
        v30 = v16 * v27;
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v28, v29, v30);
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2;
        v50[3] = &__block_descriptor_88_e40_v16__0__UIGraphicsImageRendererContext_8l;
        v50[4] = 0;
        v50[5] = 0;
        *(double *)&v50[6] = v29;
        *(double *)&v50[7] = v30;
        *(double *)&v50[8] = v29;
        *(double *)&v50[9] = v30;
        v50[10] = v45;
        objc_msgSend(v31, "imageWithActions:", v50);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          objc_msgSend(v46, "attachment");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "managedObjectContext");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __71__ICAttachmentPDFModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_3;
          v47[3] = &unk_1E5C1D7C0;
          v47[4] = v46;
          v48 = v32;
          v49 = v23;
          objc_msgSend(v34, "performBlockAndWait:", v47);

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
    }
    while (v20);
  }

  CGPDFDocumentRelease(document);
  v35 = 1;
LABEL_27:
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  return v35;
}

@end
