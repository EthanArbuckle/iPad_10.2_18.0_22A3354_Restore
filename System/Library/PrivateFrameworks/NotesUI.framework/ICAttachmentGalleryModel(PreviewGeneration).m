@implementation ICAttachmentGalleryModel(PreviewGeneration)

- (BOOL)needToGeneratePreviews
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22.receiver = a1;
  v22.super_class = (Class)&off_1EED56828;
  if (!objc_msgSendSuper2(&v22, sel_needToGeneratePreviews) || !objc_msgSend(a1, "subAttachmentCount"))
    return 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[ICPreviewDeviceContext sharedContext](ICPreviewDeviceContext, "sharedContext", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceInfoScalable:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "imageSize");
        v11 = v10;
        objc_msgSend(v9, "scale");
        v13 = v11 * v12;
        if (v7 < v13)
          v7 = v13;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  objc_msgSend(a1, "firstSubAttachment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attachmentPreviewImageWithMinSize:scale:", v7, v7, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v16 != 0;

  return v14;
}

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CGImageSource *v20;
  CFDictionaryRef v21;
  CFDictionaryRef v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  objc_class *v42;
  id v43;
  void *v44;
  uint64_t v45;
  CFDictionaryRef v46;
  NSObject *v47;
  const __CFData *v48;
  id v49;
  CGImageSource *cf;
  _QWORD v52[6];
  _QWORD v53[9];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  id v59;
  id v60;
  _QWORD v61[9];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD v72[5];
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint8_t v80[128];
  uint8_t buf[4];
  id v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  uint64_t v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v73 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__72;
  v78 = __Block_byref_object_dispose__72;
  v79 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__72;
  v72[4] = __Block_byref_object_dispose__72;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__72;
  v70 = __Block_byref_object_dispose__72;
  v71 = 0;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  +[ICPreviewDeviceContext sharedContext](ICPreviewDeviceContext, "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceInfoScalable:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v87, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v63;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v63 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v10, "imageSize");
        v12 = v11;
        objc_msgSend(v10, "scale");
        v14 = v12 * v13;
        if (v8 < v14)
          v8 = v14;
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v62, v87, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  objc_msgSend(a1, "attachment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v61[3] = &unk_1E5C23B70;
  *(double *)&v61[8] = v8;
  v61[4] = a1;
  v61[5] = &v66;
  v61[6] = v72;
  v61[7] = &v74;
  objc_msgSend(v16, "performBlockAndWait:", v61);

  v17 = (void *)v67[5];
  if (!v17)
  {
    v40 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v75[5];
      *(_DWORD *)buf = 138412802;
      v82 = v43;
      v83 = 2112;
      v84 = v44;
      v85 = 2112;
      v86 = v45;
      _os_log_debug_impl(&dword_1AC7A1000, v40, OS_LOG_TYPE_DEBUG, "%@ %@ %@ early return", buf, 0x20u);

    }
    v48 = (const __CFData *)v40;
    goto LABEL_32;
  }
  if (objc_msgSend(v17, "ic_imageOrientation"))
  {
    objc_msgSend(MEMORY[0x1E0CEE5A0], "imageWithRGBColorspaceFromImage:", v67[5]);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v67[5];
    v67[5] = v18;

  }
  objc_msgSend((id)v67[5], "ic_JPEGData");
  v48 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v20 = CGImageSourceCreateWithData(v48, 0);
  if (v20)
  {
    cf = v20;
    v21 = CGImageSourceCopyPropertiesAtIndex(v20, 0, 0);
    v22 = v21;
    v46 = v21;
    if (v21)
    {
      -[__CFDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v23 && v24)
      {
        objc_msgSend(a1, "attachment");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "managedObjectContext");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_11;
        v58[3] = &unk_1E5C1D7C0;
        v58[4] = a1;
        v59 = v23;
        v60 = v25;
        objc_msgSend(v27, "performBlockAndWait:", v58);

      }
    }
    v56 = 0u;
    v57 = 0u;
    v55 = 0u;
    v54 = 0u;
    +[ICPreviewDeviceContext sharedContext](ICPreviewDeviceContext, "sharedContext", v46, v48);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "deviceInfoScalable:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v80, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v55 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
          objc_msgSend(v33, "imageSize");
          v35 = v34;
          objc_msgSend(a1, "attachment");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "managedObjectContext");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2;
          v53[3] = &unk_1E5C23B98;
          v53[8] = v35;
          v53[4] = a1;
          v53[5] = v33;
          v53[6] = v72;
          v53[7] = cf;
          objc_msgSend(v37, "performBlockAndWait:", v53);

        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v80, 16);
      }
      while (v30);
    }

    objc_msgSend(a1, "attachment");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "managedObjectContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_3;
    v52[3] = &unk_1E5C1D9D0;
    v52[5] = v72;
    v52[4] = a1;
    objc_msgSend(v39, "performBlockAndWait:", v52);

    CFRelease(cf);
    v40 = v47;
LABEL_32:

  }
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(&v74, 8);

  return 1;
}

@end
