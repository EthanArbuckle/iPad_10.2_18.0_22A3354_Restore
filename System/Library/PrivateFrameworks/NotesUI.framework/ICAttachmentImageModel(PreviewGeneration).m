@implementation ICAttachmentImageModel(PreviewGeneration)

- (BOOL)needToGeneratePreviews
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  +[ICPreviewDeviceContext sharedContext](ICPreviewDeviceContext, "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  objc_msgSend(v4, "deviceInfoScalable:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = objc_msgSend(a1, "needsFullSizePreview");
  v25.receiver = a1;
  v25.super_class = (Class)&off_1EED38030;
  if ((objc_msgSendSuper2(&v25, sel_needToGeneratePreviews) & 1) == 0)
  {
    v9 = v7 + v8;
    objc_msgSend(a1, "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "previewImages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v11, "count") < v9;

  }
  v12 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "previewImages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    +[ICPreviewDeviceContext sharedContext](ICPreviewDeviceContext, "sharedContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deviceInfoScalable:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 138413570;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v17;
    v32 = 1024;
    v33 = v5;
    v34 = 2048;
    v35 = v20;
    v36 = 2048;
    v37 = v23;
    _os_log_debug_impl(&dword_1AC7A1000, v12, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d self.attachment.previewImages.count %lu [[ICPreviewDeviceContext sharedContext] deviceInfoScalable:YES].count %lu", buf, 0x3Au);

  }
  return v5;
}

- (BOOL)generatePreviewsDuringCloudActivity
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "markupModelData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") == 0;

  return v3;
}

- (uint64_t)needToPostProcessAttachment
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(a1, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__ICAttachmentImageModel_PreviewGeneration__needToPostProcessAttachment__block_invoke;
  v9[3] = &unk_1E5C1EC30;
  v6 = v4;
  v10 = v6;
  v11 = a1;
  v12 = &v14;
  v13 = a2;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v7;
}

- (id)generateFullSizePreviewWithAttachmentIdentifier:()PreviewGeneration existingPreviewImage:markupModelData:imageOrientation:imageFilterType:mediaDecryptedData:mediaURL:mediaSize:croppingQuad:
{
  id v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  uint64_t v48;
  CGImageSourceRef v49;
  CGImageSourceRef v50;
  void *v51;
  void *v52;
  id v55;
  id v56;
  _QWORD v57[5];
  id v58;
  CGImageSourceRef v59;
  double v60;
  _QWORD v61[8];

  v56 = a5;
  v55 = a6;
  v19 = a7;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  if (objc_msgSend(v19, "length"))
    v23 = a8;
  else
    v23 = 0;
  if (v21)
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithContentsOfURL:", v21);
  else
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", v20);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v22 && v24)
  {
    objc_msgSend(MEMORY[0x1E0CEE5A0], "perspectiveCorrectedImageFromImage:normalizedImageQuad:", v24, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
LABEL_37:
      v25 = 0;
      goto LABEL_38;
    }
    objc_msgSend(v26, "size");
    if (((1 << a8) & 0xCC) != 0)
      v29 = v28;
    else
      v29 = v27;
    if (((1 << a8) & 0xCC) != 0)
      v30 = v27;
    else
      v30 = v28;
    if (a8 <= 7)
      v31 = v29;
    else
      v31 = v27;
    if (a8 <= 7)
      v32 = v30;
    else
      v32 = v28;
    if (v31 != a2 || v32 != a3)
    {
      objc_msgSend(a1, "attachment");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "managedObjectContext");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __214__ICAttachmentImageModel_PreviewGeneration__generateFullSizePreviewWithAttachmentIdentifier_existingPreviewImage_markupModelData_imageOrientation_imageFilterType_mediaDecryptedData_mediaURL_mediaSize_croppingQuad___block_invoke;
      v61[3] = &unk_1E5C1EC58;
      v61[4] = a1;
      *(double *)&v61[5] = v31;
      *(double *)&v61[6] = v32;
      objc_msgSend(v35, "performBlockAndWait:", v61);

    }
    v25 = v26;
  }
  else if (!v24)
  {
LABEL_38:
    v36 = v23 != 0;
    v37 = v25;
    goto LABEL_39;
  }
  v36 = v23 != 0;
  if (!(_DWORD)a9 && !v23)
    goto LABEL_38;
  objc_msgSend(MEMORY[0x1E0CEE5A0], "filteredImage:orientation:imageFilterType:", v25, 0, a9);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
    goto LABEL_37;
  if (objc_msgSend(v19, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEE5A0], "imageWithRGBColorspaceFromImage:", v37);
    v38 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v38;
  }
  if (v37 && v23)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_orientedImageFromImage:toOrientation:", v37, v23);
    v39 = objc_claimAutoreleasedReturnValue();

    v36 = 1;
    v37 = (void *)v39;
  }
LABEL_39:
  objc_msgSend(v37, "ic_JPEGData");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "length"))
  {
    v41 = v55;
    if (v40)
    {
      objc_msgSend(MEMORY[0x1E0D63BA0], "imageDataWithMarkupModelData:sourceImageData:", v19, v40);
      v42 = objc_claimAutoreleasedReturnValue();

      v40 = (void *)v42;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D63BA0], "imageDataWithMarkupModelData:sourceImageURL:", v19, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v40)
      v45 = v36;
    else
      v45 = 0;
    if (v45)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", v40);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "ic_orientedImageFromImage:fromOrientation:", v46, v23);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "ic_JPEGData");
      v48 = objc_claimAutoreleasedReturnValue();

      v40 = (void *)v48;
    }
    v43 = v56;
    if (v40)
      goto LABEL_53;
  }
  else
  {
    v41 = v55;
    v43 = v56;
    if (v40)
    {
LABEL_53:
      v49 = CGImageSourceCreateWithData((CFDataRef)v40, 0);
      if (v49)
      {
        v50 = v49;
        if (a2 >= a3)
          a3 = a2;
        objc_msgSend(a1, "attachment");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "managedObjectContext");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __214__ICAttachmentImageModel_PreviewGeneration__generateFullSizePreviewWithAttachmentIdentifier_existingPreviewImage_markupModelData_imageOrientation_imageFilterType_mediaDecryptedData_mediaURL_mediaSize_croppingQuad___block_invoke_40;
        v57[3] = &unk_1E5C1EC80;
        v57[4] = a1;
        v59 = v50;
        v60 = a3;
        v58 = v41;
        objc_msgSend(v52, "performBlockAndWait:", v57);

        CFRelease(v50);
      }
      goto LABEL_57;
    }
  }
  v44 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    -[ICAttachmentImageModel(PreviewGeneration) generateFullSizePreviewWithAttachmentIdentifier:existingPreviewImage:markupModelData:imageOrientation:imageFilterType:mediaDecryptedData:mediaURL:mediaSize:croppingQuad:].cold.1();

LABEL_57:
  return v40;
}

- (BOOL)generatePreviewsInOperation:()PreviewGeneration
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFURL *v10;
  const __CFData *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _BOOL8 v24;
  objc_class *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id obj;
  CGImageSourceRef cf;
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  _BYTE *v37;
  _QWORD v38[13];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  _QWORD v47[17];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  double *v55;
  uint64_t v56;
  const char *v57;
  __int128 v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  _QWORD v89[5];
  id v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  uint8_t v109[128];
  _BYTE buf[24];
  uint64_t v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v103 = 0;
  v104 = &v103;
  v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__14;
  v107 = __Block_byref_object_dispose__14;
  v108 = 0;
  v97 = 0;
  v98 = &v97;
  v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__14;
  v101 = __Block_byref_object_dispose__14;
  v102 = 0;
  v91 = 0;
  v92 = &v91;
  v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__14;
  v95 = __Block_byref_object_dispose__14;
  v96 = 0;
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x3032000000;
  v89[3] = __Block_byref_object_copy__14;
  v89[4] = __Block_byref_object_dispose__14;
  v90 = 0;
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__14;
  v87 = __Block_byref_object_dispose__14;
  v88 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__14;
  v73 = __Block_byref_object_dispose__14;
  v74 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__14;
  v67 = __Block_byref_object_dispose__14;
  v68 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v54 = 0;
  v55 = (double *)&v54;
  v56 = 0x3010000000;
  v57 = "";
  v58 = *MEMORY[0x1E0C9D820];
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__14;
  v52 = __Block_byref_object_dispose__14;
  v53 = 0;
  objc_msgSend(a1, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __73__ICAttachmentImageModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v47[3] = &unk_1E5C1ECA8;
  v47[4] = a1;
  v47[5] = &v103;
  v47[6] = &v69;
  v47[7] = &v79;
  v47[8] = &v75;
  v47[9] = v89;
  v47[10] = &v97;
  v47[11] = &v91;
  v47[12] = &v83;
  v47[13] = &v63;
  v47[14] = &v59;
  v47[15] = &v54;
  v47[16] = &v48;
  objc_msgSend(v5, "performBlockAndWait:", v47);

  if ((objc_msgSend(v30, "isCancelled") & 1) != 0 || !v92[5] && !v98[5])
  {
    v6 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v104[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2112;
      v111 = v29;
      _os_log_debug_impl(&dword_1AC7A1000, v6, OS_LOG_TYPE_DEBUG, "%@ %@ %@ early return", buf, 0x20u);

    }
    goto LABEL_26;
  }
  if (*((_BYTE *)v60 + 24))
  {
    objc_msgSend(a1, "generateFullSizePreviewWithAttachmentIdentifier:existingPreviewImage:markupModelData:imageOrientation:imageFilterType:mediaDecryptedData:mediaURL:mediaSize:croppingQuad:", v104[5], v84[5], v64[5], v76[3], *((__int16 *)v80 + 12), v98[5], v55[4], v55[5], v92[5], v49[5]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v98[5];
    v98[5] = v7;

    v9 = (void *)v92[5];
    v92[5] = 0;

  }
  if ((objc_msgSend(v30, "isCancelled") & 1) != 0)
    goto LABEL_26;
  v10 = (const __CFURL *)v92[5];
  if (v10)
  {
    cf = CGImageSourceCreateWithURL(v10, 0);
    goto LABEL_14;
  }
  v11 = (const __CFData *)v98[5];
  if (!v11)
  {
LABEL_26:
    v24 = 0;
    goto LABEL_27;
  }
  cf = CGImageSourceCreateWithData(v11, 0);
LABEL_14:
  if (!cf)
    goto LABEL_26;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v111) = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  +[ICPreviewDeviceContext sharedContext](ICPreviewDeviceContext, "sharedContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceInfoScalable:", 1);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v109, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v16, "imageSize");
        v18 = v17;
        objc_msgSend(a1, "attachment");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "managedObjectContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __73__ICAttachmentImageModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_41;
        v38[3] = &unk_1E5C1ECD0;
        v38[4] = v16;
        v38[5] = a1;
        v38[9] = &v103;
        v38[10] = cf;
        v38[11] = v18;
        v38[6] = buf;
        v38[7] = &v83;
        v38[12] = a2;
        v38[8] = &v43;
        objc_msgSend(v20, "performBlockAndWait:", v38);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v109, 16);
    }
    while (v13);
  }

  objc_msgSend(a1, "attachment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "managedObjectContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __73__ICAttachmentImageModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_42;
  v34[3] = &unk_1E5C1ECF8;
  v36 = &v83;
  v34[4] = a1;
  v37 = buf;
  v23 = v30;
  v35 = v23;
  objc_msgSend(v22, "performBlockAndWait:", v34);

  CFRelease(cf);
  if ((objc_msgSend(v23, "isCancelled") & 1) == 0
    && objc_msgSend((id)v70[5], "shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:", v104[5]))
  {
    objc_msgSend((id)v70[5], "generatePreviewsInOperation:", v23);
  }
  v24 = *((_BYTE *)v44 + 24) == 0;

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(buf, 8);
LABEL_27:
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(v89, 8);
  _Block_object_dispose(&v91, 8);

  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v103, 8);

  return v24;
}

- (void)generateOCRInOperation:()PreviewGeneration
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__ICAttachmentImageModel_PreviewGeneration__generateOCRInOperation___block_invoke;
  v9[3] = &unk_1E5C1D7C0;
  v9[4] = a1;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v9);

}

- (void)classifyImageInOperation:()PreviewGeneration
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__ICAttachmentImageModel_PreviewGeneration__classifyImageInOperation___block_invoke;
  v9[3] = &unk_1E5C1D7C0;
  v9[4] = a1;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v9);

}

- (__CFString)classificationsForImage:()PreviewGeneration
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  NSObject *v20;
  __CFString *v21;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v5 = (void *)getVNSessionClass_softClass;
  v32 = getVNSessionClass_softClass;
  if (!getVNSessionClass_softClass)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getVNSessionClass_block_invoke;
    v27 = &unk_1E5C1DE18;
    v28 = &v29;
    __getVNSessionClass_block_invoke((uint64_t)&v24);
    v5 = (void *)v30[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v29, 8);
  v7 = objc_alloc_init(v6);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v8 = (void *)getVNImageRequestHandlerClass_softClass;
  v32 = getVNImageRequestHandlerClass_softClass;
  if (!getVNImageRequestHandlerClass_softClass)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getVNImageRequestHandlerClass_block_invoke;
    v27 = &unk_1E5C1DE18;
    v28 = &v29;
    __getVNImageRequestHandlerClass_block_invoke((uint64_t)&v24);
    v8 = (void *)v30[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v29, 8);
  v10 = [v9 alloc];
  v11 = objc_msgSend(v4, "ic_CGImage");
  v12 = (void *)objc_msgSend(v10, "initWithCGImage:options:session:", v11, MEMORY[0x1E0C9AA70], v7);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v13 = (void *)getVNSceneClassificationRequestClass_softClass;
  v32 = getVNSceneClassificationRequestClass_softClass;
  if (!getVNSceneClassificationRequestClass_softClass)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getVNSceneClassificationRequestClass_block_invoke;
    v27 = &unk_1E5C1DE18;
    v28 = &v29;
    __getVNSceneClassificationRequestClass_block_invoke((uint64_t)&v24);
    v13 = (void *)v30[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v29, 8);
  v15 = objc_alloc_init(v14);
  v33[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v17 = objc_msgSend(v12, "performRequests:error:", v16, &v23);
  v18 = v23;

  if (!v17)
  {
    v20 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ICAttachmentImageModel(PreviewGeneration) classificationsForImage:].cold.1();
    goto LABEL_13;
  }
  objc_msgSend(v15, "results");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "labelsForClassificationObservations:", v19);
  v20 = objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  if (-[NSObject count](v20, "count"))
  {
    -[NSObject componentsJoinedByString:](v20, "componentsJoinedByString:", CFSTR(" "));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = &stru_1E5C2F8C0;
  }
LABEL_14:

  return v21;
}

- (id)labelsForClassificationObservations:()PreviewGeneration
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  float v15;
  double v16;
  double v17;
  void (**v18)(void *, uint64_t, _OWORD *);
  void *v19;
  _OWORD v21[7];
  _QWORD aBlock[4];
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = objc_alloc_init(MEMORY[0x1E0D75250]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "nodeRefForName:", v13);

        if (v14)
        {
          objc_msgSend(v12, "confidence");
          v16 = v15;
          PFSceneTaxonomyNodeSearchThreshold();
          if (v17 < v16)
          {
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __81__ICAttachmentImageModel_PreviewGeneration__labelsForClassificationObservations___block_invoke;
            aBlock[3] = &unk_1E5C1ED20;
            v23 = v5;
            v24 = v4;
            v25 = v6;
            v18 = (void (**)(void *, uint64_t, _OWORD *))_Block_copy(aBlock);
            memset(v21, 0, sizeof(v21));
            PFSceneTaxonomyFillNodeData();
            v18[2](v18, v14, v21);
            PFSceneTaxonomyNodeVisitParents();

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  v19 = (void *)objc_msgSend(v4, "copy");
  return v19;
}

- (void)generateFullSizePreviewWithAttachmentIdentifier:()PreviewGeneration existingPreviewImage:markupModelData:imageOrientation:imageFilterType:mediaDecryptedData:mediaURL:mediaSize:croppingQuad:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "No media decrypted data for: %@", v2, v3, v4, v5, v6);
}

- (void)classificationsForImage:()PreviewGeneration .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "Error classifying image: %@", v2, v3, v4, v5, v6);
}

@end
