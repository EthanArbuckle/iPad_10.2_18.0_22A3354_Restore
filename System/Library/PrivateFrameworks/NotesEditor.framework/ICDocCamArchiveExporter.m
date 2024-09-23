@implementation ICDocCamArchiveExporter

+ (BOOL)archiveExportingEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D643C8]);

  return v3;
}

+ (id)exportAsArchiveActivityWithBarButtonItem:(id)a3 presentingVC:(id)a4 fromNote:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(a1, "archiveExportingEnabled"))
  {
    v11 = objc_alloc(MEMORY[0x1E0D64B70]);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90__ICDocCamArchiveExporter_exportAsArchiveActivityWithBarButtonItem_presentingVC_fromNote___block_invoke;
    v14[3] = &unk_1EA7DF6F8;
    v18 = a1;
    v15 = v10;
    v16 = v8;
    v17 = v9;
    v12 = (void *)objc_msgSend(v11, "initWithTitle:image:block:", CFSTR("Archive All Doc Cam Scans In Note"), 0, v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __90__ICDocCamArchiveExporter_exportAsArchiveActivityWithBarButtonItem_presentingVC_fromNote___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 56), "createZipArchiveOfImagesFromNote:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "showActivityVCWithBarButtonItem:presentingVC:url:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v2);

}

+ (id)exportAsArchiveActivityWithBarButtonItem:(id)a3 presentingVC:(id)a4 fromGalleryAttachment:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(a1, "archiveExportingEnabled"))
  {
    v11 = objc_alloc(MEMORY[0x1E0D64B70]);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __103__ICDocCamArchiveExporter_exportAsArchiveActivityWithBarButtonItem_presentingVC_fromGalleryAttachment___block_invoke;
    v14[3] = &unk_1EA7DF6F8;
    v18 = a1;
    v15 = v10;
    v16 = v8;
    v17 = v9;
    v12 = (void *)objc_msgSend(v11, "initWithTitle:image:block:", CFSTR("Create Zip Archive"), 0, v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __103__ICDocCamArchiveExporter_exportAsArchiveActivityWithBarButtonItem_presentingVC_fromGalleryAttachment___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 56), "createZipArchiveOfImagesFromGalleryAttachment:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "showActivityVCWithBarButtonItem:presentingVC:url:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v2);

}

+ (void)showActivityVCWithBarButtonItem:(id)a3 presentingVC:(id)a4 url:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  os_log_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "ic_isReachable"))
  {
    v10 = objc_alloc(MEMORY[0x1E0D96D28]);
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (os_log_t)objc_msgSend(v10, "initWithActivityItems:applicationActivities:", v11, 0);

    v13 = *MEMORY[0x1E0D96E28];
    v17[0] = *MEMORY[0x1E0D63EF0];
    v17[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setExcludedActivityTypes:](v12, "setExcludedActivityTypes:", v14);

    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v15 = -2;
    else
      v15 = 7;
    objc_msgSend(v8, "setModalPresentationStyle:", v15);
    objc_msgSend(v8, "presentViewController:animated:completion:", v12, 1, 0);
    -[NSObject popoverPresentationController](v12, "popoverPresentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBarButtonItem:", v7);
    objc_msgSend(v16, "setPermittedArrowDirections:", 3);

  }
  else
  {
    v12 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ICDocCamArchiveExporter showActivityVCWithBarButtonItem:presentingVC:url:].cold.1(v12);
  }

}

+ (void)showExportArchiveFromNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  +[ICDocCamArchiveExporter createZipArchiveOfImagesFromNote:](ICDocCamArchiveExporter, "createZipArchiveOfImagesFromNote:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "showActivityVCWithBarButtonItem:presentingVC:url:", v8, v9, v10);

}

+ (id)createZipArchiveOfImagesFromNote:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v42;
  uint64_t v43;
  __CFString *v44;
  void *v45;
  void *v46;
  id v47;
  id obj;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "visibleAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsPassingTest:", &__block_literal_global_18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_21);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attachmentModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = v3;
    objc_msgSend(v3, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ic_sanitizedFilenameString");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v14 = -[__CFString length](v13, "length");
    v15 = CFSTR("ScanArchive");
    if (v14)
      v15 = v13;
    v16 = v15;

    v45 = v11;
    objc_msgSend(v11, "generateTemporaryURLWithExtension:", CFSTR("awks"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByDeletingLastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v16, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v9;
    objc_msgSend(v9, "removeItemAtURL:error:", v19, 0);
    objc_msgSend(v19, "URLByDeletingLastPathComponent");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URLByDeletingLastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v16;
    objc_msgSend(v21, "URLByAppendingPathComponent:isDirectory:", v16, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "URLByAppendingPathExtension:", CFSTR("zip"));
    v43 = objc_claimAutoreleasedReturnValue();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v46 = v6;
    obj = v6;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          v27 = v8;
          if (*(_QWORD *)v53 != v25)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v28, "title");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "ic_sanitizedFilenameString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v30)
          {
            v32 = v30;
          }
          else
          {
            objc_msgSend(v28, "defaultTitle");
            v32 = (id)objc_claimAutoreleasedReturnValue();
          }
          v33 = v32;

          objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", v33, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "ic_uniquedURL");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v35, 1, 0, 0);
          objc_msgSend(a1, "archiveGalleryImagesFromGallery:toURL:", v28, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v27;
          objc_msgSend(v27, "ic_addObjectsFromNonNilArray:", v36);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v24);
    }

    v37 = (void *)v43;
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64198]), "initWithDestinationURL:baseURL:", v43, v42);
    objc_msgSend(v38, "setUsesCompression:", 0);
    if (v8)
    {
      v51 = 0;
      objc_msgSend(v38, "writeURLs:error:", v8, &v51);
      v39 = v51;
    }
    else
    {
      v39 = 0;
    }
    v50 = v39;
    objc_msgSend(v38, "finish:", &v50);
    v40 = v50;

    v6 = v46;
    v3 = v47;
    v9 = v20;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

BOOL __60__ICDocCamArchiveExporter_createZipArchiveOfImagesFromNote___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attachmentType") == 11;
}

uint64_t __60__ICDocCamArchiveExporter_createZipArchiveOfImagesFromNote___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "rangeInNote"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "rangeInNote");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

+ (id)createZipArchiveOfImagesFromGalleryAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "attachmentModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "generateTemporaryURLWithExtension:", CFSTR("awks"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByDeletingLastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_sanitizedFilenameString");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v11 = -[__CFString length](v10, "length");
    v12 = CFSTR("ScanArchive");
    if (v11)
      v12 = v10;
    v13 = v12;

    -[__CFString stringByAppendingPathExtension:](v13, "stringByAppendingPathExtension:", CFSTR("zip"));
    v14 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)v14;
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __73__ICDocCamArchiveExporter_createZipArchiveOfImagesFromGalleryAttachment___block_invoke;
    v48[3] = &unk_1EA7E0770;
    v53 = a1;
    v49 = v6;
    v18 = v8;
    v50 = v18;
    v19 = v17;
    v51 = v19;
    v20 = v16;
    v52 = v20;
    objc_msgSend(v49, "enumerateSubAttachmentsWithBlock:", v48);
    v21 = objc_alloc(MEMORY[0x1E0D64198]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("not used but not nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithDestinationURL:baseURL:", v15, v22);

    objc_msgSend(v23, "setUsesCompression:", 0);
    objc_msgSend(v23, "setFlatten:", 1);
    objc_msgSend(v4, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFlattenFolderName:", v24);

    v47 = 0;
    objc_msgSend(v23, "writeURLs:error:", v20, &v47);
    v25 = v47;
    if (v25)
    {
      v26 = os_log_create("com.apple.notes", "Export");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        +[ICDocCamArchiveExporter createZipArchiveOfImagesFromGalleryAttachment:].cold.2((uint64_t)v25, v26, v27, v28, v29, v30, v31, v32);

    }
    v46 = 0;
    objc_msgSend(v23, "finish:", &v46);
    v33 = v46;
    if (v33)
    {
      v34 = os_log_create("com.apple.notes", "Export");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        +[ICDocCamArchiveExporter createZipArchiveOfImagesFromGalleryAttachment:].cold.1((uint64_t)v33, v34, v35, v36, v37, v38, v39, v40);

    }
    else if (!v25)
    {
      v43 = os_log_create("com.apple.notes", "Export");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(0, "lastPathComponent");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v44;
        _os_log_impl(&dword_1DD7B0000, v43, OS_LOG_TYPE_INFO, "Succesfully wrote doc cam archive to path: %@", buf, 0xCu);

      }
      v41 = v15;
      goto LABEL_15;
    }
    v41 = 0;
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((galleryModel) != nil)", "+[ICDocCamArchiveExporter createZipArchiveOfImagesFromGalleryAttachment:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "galleryModel");
  v41 = 0;
LABEL_16:

  return v41;
}

void __73__ICDocCamArchiveExporter_createZipArchiveOfImagesFromGalleryAttachment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 64), "archivableImageForSubAttachent:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "titleForSubAttachment:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ic_sanitizedFilenameString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image-%lu"), a4 + 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    objc_msgSend(*(id *)(a1 + 40), "URLByAppendingPathComponent:isDirectory:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathExtension:", CFSTR("png"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "URLByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "ic_isReachable");

    if ((v13 & 1) == 0)
    {
      v14 = *(void **)(a1 + 48);
      objc_msgSend(v11, "URLByDeletingLastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, 0);

    }
    objc_msgSend(v6, "ic_PNGDataWithOrientation:", objc_msgSend(v6, "ic_imageOrientation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "writeToURL:atomically:", v11, 1);

    objc_msgSend(*(id *)(a1 + 56), "ic_addNonNilObject:", v11);
  }

}

+ (id)archiveGalleryImagesFromGallery:(id)a3 toURL:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_opt_class();
  objc_msgSend(v8, "attachmentModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((galleryModel) != nil)", "+[ICDocCamArchiveExporter archiveGalleryImagesFromGallery:toURL:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "galleryModel");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__ICDocCamArchiveExporter_archiveGalleryImagesFromGallery_toURL___block_invoke;
  v18[3] = &unk_1EA7E0798;
  v22 = a1;
  v19 = v11;
  v20 = v6;
  v12 = v9;
  v21 = v12;
  v13 = v6;
  v14 = v11;
  objc_msgSend(v14, "enumerateSubAttachmentsWithBlock:", v18);
  v15 = v21;
  v16 = v12;

  return v16;
}

void __65__ICDocCamArchiveExporter_archiveGalleryImagesFromGallery_toURL___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(a1[7], "archivableImageForSubAttachent:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1[4], "titleForSubAttachment:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ic_sanitizedFilenameString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image-%lu"), a4 + 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    objc_msgSend(a1[5], "URLByAppendingPathComponent:isDirectory:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathExtension:", CFSTR("png"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "ic_uniquedURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "ic_PNGDataWithOrientation:", objc_msgSend(v6, "ic_imageOrientation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "writeToURL:atomically:", v12, 1);

    objc_msgSend(a1[6], "addObject:", v12);
  }

}

+ (id)archivableImageForSubAttachent:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "sizeWidth");
  v5 = v4;
  objc_msgSend(v3, "sizeHeight");
  v7 = v6;
  objc_msgSend(v3, "attachmentPreviewImageWithMinSize:scale:", v5, v6, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orientedImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || ((objc_msgSend(v9, "size"), v5 == v12) ? (v13 = v7 == v11) : (v13 = 0), !v13))
  {
    v14 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[ICDocCamArchiveExporter archivableImageForSubAttachent:].cold.1(v3, v14);

    objc_msgSend(MEMORY[0x1E0D64BF0], "imageForSubAttachment:rotateForMacImageGallery:allowCached:", v3, 0, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v15;
  }

  return v10;
}

+ (void)showActivityVCWithBarButtonItem:(os_log_t)log presentingVC:url:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "Tried to create zip archive for gallery but the archive URL is nil", v1, 2u);
}

+ (void)createZipArchiveOfImagesFromGalleryAttachment:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, a2, a3, "Error finalizing doc cam archive.  %@", a5, a6, a7, a8, 2u);
}

+ (void)createZipArchiveOfImagesFromGalleryAttachment:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, a2, a3, "Error writing doc cam archive.  %@", a5, a6, a7, a8, 2u);
}

+ (void)archivableImageForSubAttachent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_DEBUG, "Either No image, or incorrect size image for OCR, falling back to creating a fresh image for attachment: %@", (uint8_t *)&v4, 0xCu);

}

@end
