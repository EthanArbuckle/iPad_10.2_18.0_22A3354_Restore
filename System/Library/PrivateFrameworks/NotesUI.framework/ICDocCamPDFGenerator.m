@implementation ICDocCamPDFGenerator

+ (OS_dispatch_queue)syncGeneratorQueue
{
  if (syncGeneratorQueue_onceToken != -1)
    dispatch_once(&syncGeneratorQueue_onceToken, &__block_literal_global_13);
  return (OS_dispatch_queue *)(id)syncGeneratorQueue_sSyncGeneratorQueue;
}

void __42__ICDocCamPDFGenerator_syncGeneratorQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("PDF Sync Generator Queue", v2);
  v1 = (void *)syncGeneratorQueue_sSyncGeneratorQueue;
  syncGeneratorQueue_sSyncGeneratorQueue = (uint64_t)v0;

}

+ (OS_dispatch_queue)fileQueue
{
  if (fileQueue_onceToken != -1)
    dispatch_once(&fileQueue_onceToken, &__block_literal_global_11);
  return (OS_dispatch_queue *)(id)fileQueue_sFileQueue;
}

void __33__ICDocCamPDFGenerator_fileQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("PDF File Queue", v2);
  v1 = (void *)fileQueue_sFileQueue;
  fileQueue_sFileQueue = (uint64_t)v0;

}

+ (NSFileManager)fileManager
{
  return (NSFileManager *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
}

+ (id)rootPDFFolderPath
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;

  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICDocCamPDFGenerator rootPDFFolderPath]", 1, 0, CFSTR("ICDocCamPDFGenerator: Failed get caches directory with error (falling back to NSTemporaryDirectory): %@"), v4);
    NSTemporaryDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("galleryTempPDFFolder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)rootPDFFolderPathForPWAttachments
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "rootPDFFolderPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("P"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)folderPathForAttachmentIdentifier:(id)a3 passwordProtected:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (a4)
    objc_msgSend(a1, "rootPDFFolderPathForPWAttachments");
  else
    objc_msgSend(a1, "rootPDFFolderPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)folderPathForAttachment:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__ICDocCamPDFGenerator_folderPathForAttachment___block_invoke;
  v9[3] = &unk_1E5C1DA20;
  v11 = &v17;
  v6 = v4;
  v10 = v6;
  v12 = &v13;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  objc_msgSend(a1, "folderPathForAttachmentIdentifier:passwordProtected:", v18[5], *((unsigned __int8 *)v14 + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __48__ICDocCamPDFGenerator_folderPathForAttachment___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

+ (id)versionFolderPathForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "folderPathForAttachment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "docCamPDFVersion");

  objc_msgSend(v6, "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)versionPDFPathForAttachment:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  v24 = 0;
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __52__ICDocCamPDFGenerator_versionPDFPathForAttachment___block_invoke;
  v16 = &unk_1E5C1D9D0;
  v18 = &v19;
  v6 = v4;
  v17 = v6;
  objc_msgSend(v5, "performBlockAndWait:", &v13);

  objc_msgSend((id)v20[5], "ic_sanitizedFilenameString", v13, v14, v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "defaultTitle");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  objc_msgSend(a1, "versionFolderPathForAttachment:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("pdf"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __52__ICDocCamPDFGenerator_versionPDFPathForAttachment___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (void)createEmptyPDFFileAtURLIFNecessaryForAttachment:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  objc_msgSend(a1, "versionPDFPathForAttachment:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__ICDocCamPDFGenerator_createEmptyPDFFileAtURLIFNecessaryForAttachment___block_invoke;
  block[3] = &unk_1E5C1E560;
  v9 = v4;
  v10 = a1;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __72__ICDocCamPDFGenerator_createEmptyPDFFileAtURLIFNecessaryForAttachment___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "fileManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByDeletingLastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeToURL:atomically:", *(_QWORD *)(a1 + 32), 1);

  }
}

+ (void)deletePDFFolderIfExistsForAttachment:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "fileManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "folderPathForAttachment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "fileExistsAtPath:", v5))
    objc_msgSend(v6, "removeItemAtPath:error:", v5, 0);

}

+ (void)deleteAllDocCamPDFs
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Deleting All Doc Cam PDFs", a5, a6, a7, a8, 0);
}

void __43__ICDocCamPDFGenerator_deleteAllDocCamPDFs__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "fileManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rootPDFFolderPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v2, 0);

}

+ (void)deleteAllDocCamPasswordProtectedPDFs
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Deleting All Doc Cam Password Protected PDFs", a5, a6, a7, a8, 0);
}

void __60__ICDocCamPDFGenerator_deleteAllDocCamPasswordProtectedPDFs__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "fileManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rootPDFFolderPathForPWAttachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v2, 0);

}

+ (id)pdfURLForAttachment:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7;
  v17 = __Block_byref_object_dispose__7;
  v18 = 0;
  objc_msgSend(a1, "fileQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ICDocCamPDFGenerator_pdfURLForAttachment___block_invoke;
  block[3] = &unk_1E5C1E5A8;
  v11 = &v13;
  v12 = a1;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __44__ICDocCamPDFGenerator_pdfURLForAttachment___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 48), "versionPDFPathForAttachment:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "ic_fileSize") >= 11
    && objc_msgSend(v2, "checkResourceIsReachableAndReturnError:", 0))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }

}

+ (void)generatePDFsIfNecessaryForGalleryAttachments:(id)a3 displayWindow:(id)a4 presentingViewController:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  ICLongRunningTaskController *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  ICLongRunningTaskController *v47;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id obj;
  _QWORD v57[4];
  id v58;
  _QWORD *v59;
  char v60;
  _QWORD v61[4];
  id v62;
  id v63;
  ICLongRunningTaskController *v64;
  id v65;
  id v66;
  uint64_t *v67;
  _QWORD *v68;
  _QWORD *v69;
  id v70;
  _QWORD v71[6];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[6];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD v85[3];
  char v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[3];
  char v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v49 = a5;
  v50 = a6;
  if (!v10)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((displayWindow) != nil)", "+[ICDocCamPDFGenerator generatePDFsIfNecessaryForGalleryAttachments:displayWindow:presentingViewController:completionHandler:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "displayWindow");
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x2020000000;
  v92 = 0;
  v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v88 != v12)
          objc_enumerationMutation(obj);
        objc_opt_class();
        ICDynamicCast();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        objc_msgSend(v14, "attachmentModel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          +[ICDocCamPDFGenerator pdfURLForAttachment:](ICDocCamPDFGenerator, "pdfURLForAttachment:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (v18)
            objc_msgSend(v52, "addObject:", v16);
        }
        objc_opt_class();
        objc_msgSend(v14, "attachmentModel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20 && (objc_msgSend(v20, "tooLargeForPreviewGeneration") & 1) == 0)
        {
          v21 = objc_msgSend(v14, "hasFallbackPDF");
          if (objc_msgSend(v14, "isPasswordProtected")
            && objc_msgSend(v14, "attachmentType") == 15)
          {
            +[ICDocCamPDFGenerator pdfURLForAttachment:](ICDocCamPDFGenerator, "pdfURLForAttachment:", v14);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22 == 0;

            if (!v21)
              goto LABEL_19;
          }
          else
          {
            v23 = 0;
            if (!v21)
              goto LABEL_19;
          }
          if (v23)
LABEL_19:
            objc_msgSend(v51, "addObject:", v20);
        }
        objc_opt_class();
        objc_msgSend(v14, "attachmentModel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25 && objc_msgSend(v25, "needToGeneratePreviews"))
          objc_msgSend(v55, "addObject:", v25);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    }
    while (v11);
  }

  v26 = objc_msgSend(v52, "count");
  v27 = objc_msgSend(v51, "count");
  if (v27 + v26 + objc_msgSend(v55, "count"))
  {
    v84 = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x2020000000;
    v86 = 0;
    v81 = 0;
    v82 = &v81;
    v83 = 0x2020000000;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v54 = v52;
    v28 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
    v29 = MEMORY[0x1E0C809B0];
    if (v28)
    {
      v30 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v78 != v30)
            objc_enumerationMutation(v54);
          v32 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
          objc_msgSend(v32, "attachment");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "managedObjectContext");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v76[0] = v29;
          v76[1] = 3221225472;
          v76[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke;
          v76[3] = &unk_1E5C1D9D0;
          v76[4] = v32;
          v76[5] = &v81;
          objc_msgSend(v34, "performBlockAndWait:", v76);

        }
        v28 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
      }
      while (v28);
    }

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v53 = v51;
    v35 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v73;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v73 != v36)
            objc_enumerationMutation(v53);
          v38 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
          objc_msgSend(v38, "attachment");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "managedObjectContext");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v71[0] = v29;
          v71[1] = 3221225472;
          v71[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_2;
          v71[3] = &unk_1E5C1D9D0;
          v71[4] = v38;
          v71[5] = &v81;
          objc_msgSend(v40, "performBlockAndWait:", v71);

        }
        v35 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
      }
      while (v35);
    }

    v41 = objc_msgSend(v55, "count");
    v82[3] += v41;
    v42 = -[ICLongRunningTaskController initWithWindow:intervalBeforeOpeningProgressDialog:]([ICLongRunningTaskController alloc], "initWithWindow:intervalBeforeOpeningProgressDialog:", v10, 0.5);
    -[ICLongRunningTaskController setAllowSingleUnitProgress:](v42, "setAllowSingleUnitProgress:", 1);
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Preparing…"), CFSTR("Preparing…"), 0, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLongRunningTaskController setProgressString:](v42, "setProgressString:", v43);
    -[ICLongRunningTaskController setShouldShowCancelButton:](v42, "setShouldShowCancelButton:", 1);
    -[ICLongRunningTaskController setShouldShowCircularProgress:](v42, "setShouldShowCircularProgress:", 1);
    -[ICLongRunningTaskController setViewControllerToPresentFrom:](v42, "setViewControllerToPresentFrom:", v49);
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "workerManagedObjectContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v61[0] = v29;
    v61[1] = 3221225472;
    v61[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_3;
    v61[3] = &unk_1E5C1E5F8;
    v67 = &v81;
    v62 = v54;
    v46 = v45;
    v63 = v46;
    v47 = v42;
    v64 = v47;
    v65 = v53;
    v70 = a1;
    v66 = v55;
    v68 = v85;
    v69 = v91;
    v57[0] = v29;
    v57[1] = 3221225472;
    v57[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_2_42;
    v57[3] = &unk_1E5C1E620;
    v60 = 0;
    v59 = v85;
    v58 = v50;
    -[ICLongRunningTaskController startTask:completionBlock:](v47, "startTask:completionBlock:", v61, v57);

    _Block_object_dispose(&v81, 8);
    _Block_object_dispose(v85, 8);
  }
  else if (v50)
  {
    (*((void (**)(id, uint64_t))v50 + 2))(v50, 1);
  }

  _Block_object_dispose(v91, 8);
}

uint64_t __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "subAttachmentCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

unint64_t __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_2(uint64_t a1)
{
  unint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "paperPageCount");
  if (result <= 1)
    v3 = 1;
  else
    v3 = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v3;
  return result;
}

void __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setTotalUnitCount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v51;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v8)
        objc_enumerationMutation(v4);
      v10 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v9);
      v11 = *(void **)(a1 + 40);
      v46[0] = v6;
      v46[1] = 3221225472;
      v46[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_4;
      v46[3] = &unk_1E5C1D7C0;
      v12 = v11;
      v47 = v12;
      v48 = v10;
      v49 = v3;
      objc_msgSend(v12, "performBlockAndWait:", v46);
      LOBYTE(v12) = objc_msgSend(*(id *)(a1 + 48), "isCancelled");

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v13 = *(id *)(a1 + 56);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v43;
LABEL_11:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v16)
        objc_enumerationMutation(v13);
      v18 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v17);
      v19 = *(void **)(a1 + 40);
      v37[0] = v6;
      v37[1] = 3221225472;
      v37[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_5;
      v37[3] = &unk_1E5C1E5D0;
      v20 = v19;
      v38 = v20;
      v39 = v18;
      v41 = *(_QWORD *)(a1 + 96);
      v40 = v3;
      objc_msgSend(v20, "performBlockAndWait:", v37);
      LOBYTE(v20) = objc_msgSend(*(id *)(a1 + 48), "isCancelled");

      if ((v20 & 1) != 0)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
        if (v15)
          goto LABEL_11;
        break;
      }
    }
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = *(id *)(a1 + 64);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v54, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        v27 = *(void **)(a1 + 40);
        v29[0] = v6;
        v29[1] = 3221225472;
        v29[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_40;
        v29[3] = &unk_1E5C1D7C0;
        v28 = v27;
        v30 = v28;
        v31 = v26;
        v32 = v3;
        objc_msgSend(v28, "performBlockAndWait:", v29);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v54, 16);
    }
    while (v23);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "isCancelled") ^ 1;

}

void __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithID:error:", v4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = +[ICDocCamPDFGenerator blockingGeneratePDFURLForAttachment:withProgress:error:](ICDocCamPDFGenerator, "blockingGeneratePDFURLForAttachment:withProgress:error:", v6, *(_QWORD *)(a1 + 48), 0);
}

void __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  id v20;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithID:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "attachmentModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "generateFallbackPDFIfNecessary");
  if (objc_msgSend(v5, "isPasswordProtected") && objc_msgSend(v5, "attachmentType") == 15)
  {
    objc_msgSend(v5, "fallbackPDFData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(*(id *)(a1 + 56), "versionPDFPathForAttachment:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fileURLWithPath:isDirectory:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeItemAtURL:error:", v11, 0);
      objc_msgSend(v11, "URLByDeletingLastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, 0);

      v20 = 0;
      v14 = objc_msgSend(v8, "writeToURL:options:error:", v11, 1, &v20);
      v15 = v20;
      if ((v14 & 1) == 0)
      {
        v16 = os_log_create("com.apple.notes", "Export");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_5_cold_1((uint64_t)v15, v16);

      }
    }

  }
  v17 = *(void **)(a1 + 48);
  v18 = objc_msgSend(v7, "paperPageCount");
  if (v18 <= 1)
    v19 = 1;
  else
    v19 = v18;
  objc_msgSend(v17, "setCompletedUnitCount:", objc_msgSend(v17, "completedUnitCount") + v19);

}

void __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_40(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithID:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "attachmentModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(v7, "synchronouslyGenerateFallbackMediaDataIfNecessaryAndReturnError:", &v9);
  v8 = v9;
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);

}

void __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_2_42(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_3_43;
    v4[3] = &unk_1E5C1D6F0;
    v6 = *(id *)(a1 + 32);
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_3_43(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "isCancelled") ^ 1);
}

+ (id)blockingGeneratePDFURLForAttachment:(id)a3 withProgress:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  v8 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  objc_msgSend(a1, "pdfURLForAttachment:", v7);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v19[5];
  if (!v9)
  {
    objc_msgSend(a1, "syncGeneratorQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke;
    v13[3] = &unk_1E5C1E670;
    v17 = a1;
    v14 = v7;
    v15 = v8;
    v16 = &v18;
    dispatch_sync(v10, v13);

    v9 = (void *)v19[5];
  }
  v11 = v9;
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  objc_msgSend(*(id *)(a1 + 56), "versionPDFPathForAttachment:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__7;
  v38 = __Block_byref_object_dispose__7;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__7;
  v32 = __Block_byref_object_dispose__7;
  v33 = 0;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke_2;
  v24[3] = &unk_1E5C1DA20;
  v26 = &v34;
  v25 = *(id *)(a1 + 32);
  v27 = &v28;
  objc_msgSend(v4, "performBlockAndWait:", v24);

  objc_msgSend(*(id *)(a1 + 56), "fileQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke_3;
  block[3] = &unk_1E5C1E648;
  v23 = *(_QWORD *)(a1 + 56);
  v21 = *(id *)(a1 + 32);
  v7 = v2;
  v22 = v7;
  dispatch_sync(v6, block);

  v8 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v9 = objc_alloc(MEMORY[0x1E0D63BF0]);
  if (v29[5])
    v10 = (const __CFString *)v29[5];
  else
    v10 = &stru_1E5C2F8C0;
  v11 = (void *)objc_msgSend(v9, "initWithMutableData:pageRect:title:", v8, v10, *MEMORY[0x1E0D63D80], *(double *)(MEMORY[0x1E0D63D80] + 8), *(double *)(MEMORY[0x1E0D63D80] + 16), *(double *)(MEMORY[0x1E0D63D80] + 24));
  objc_msgSend(*(id *)(a1 + 56), "performPDFGenerationWithGenerator:galleryModel:progress:", v11, v35[5], *(_QWORD *)(a1 + 40));
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 56), "fileQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke_4;
    v15[3] = &unk_1E5C1E670;
    v19 = *(_QWORD *)(a1 + 56);
    v16 = v3;
    v13 = v8;
    v14 = *(_QWORD *)(a1 + 48);
    v17 = v13;
    v18 = v14;
    dispatch_sync(v12, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((data) != nil)", "+[ICDocCamPDFGenerator blockingGeneratePDFURLForAttachment:withProgress:error:]_block_invoke", 1, 0, CFSTR("Expected non-nil value for '%s'"), "data");
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

}

void __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 48), "deletePDFForAttachmentIfExists:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "fileManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "stringByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, 0);

}

void __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 56), "fileManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  objc_msgSend(*(id *)(a1 + 40), "writeToURL:atomically:", *(_QWORD *)(a1 + 32), 1);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
}

+ (id)blockingGeneratePDFDataForAttachment:(id)a3 withProgress:(id)a4 queue:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  uint64_t *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__7;
  v43 = __Block_byref_object_dispose__7;
  v44 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__7;
  v37[4] = __Block_byref_object_dispose__7;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__7;
  v35[4] = __Block_byref_object_dispose__7;
  v36 = 0;
  objc_msgSend(v9, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __86__ICDocCamPDFGenerator_blockingGeneratePDFDataForAttachment_withProgress_queue_error___block_invoke;
  v31[3] = &unk_1E5C1DA20;
  v33 = v37;
  v14 = v9;
  v32 = v14;
  v34 = v35;
  objc_msgSend(v12, "performBlockAndWait:", v31);

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "workerManagedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __86__ICDocCamPDFGenerator_blockingGeneratePDFDataForAttachment_withProgress_queue_error___block_invoke_52;
  v23[3] = &unk_1E5C1E698;
  v17 = v16;
  v24 = v17;
  v18 = v14;
  v25 = v18;
  v28 = v35;
  v19 = v11;
  v26 = v19;
  v30 = a1;
  v20 = v10;
  v27 = v20;
  v29 = &v39;
  objc_msgSend(v17, "performBlockAndWait:", v23);
  v21 = (id)v40[5];

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(&v39, 8);
  return v21;
}

void __86__ICDocCamPDFGenerator_blockingGeneratePDFDataForAttachment_withProgress_queue_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = os_log_create("com.apple.notes", "Export");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 32), "docCamPDFVersion");
    v12 = 138412546;
    v13 = v10;
    v14 = 2048;
    v15 = v11;
    _os_log_impl(&dword_1AC7A1000, v9, OS_LOG_TYPE_INFO, "Generating PDF: %@:%ld", (uint8_t *)&v12, 0x16u);

  }
}

void __86__ICDocCamPDFGenerator_blockingGeneratePDFDataForAttachment_withProgress_queue_error___block_invoke_52(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithID:error:", v3, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v14, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v7 = objc_alloc(MEMORY[0x1E0D63BF0]);
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0D639F0], "defaultTitleForAttachmentType:", 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)objc_msgSend(v7, "initWithMutableData:pageRect:title:", v6, v9, *MEMORY[0x1E0D63D80], *(double *)(MEMORY[0x1E0D63D80] + 8), *(double *)(MEMORY[0x1E0D63D80] + 16), *(double *)(MEMORY[0x1E0D63D80] + 24));
  if (!v8)

  v11 = *(NSObject **)(a1 + 48);
  if (v11)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__ICDocCamPDFGenerator_blockingGeneratePDFDataForAttachment_withProgress_queue_error___block_invoke_2;
    block[3] = &unk_1E5C1E5D0;
    v19 = *(_QWORD *)(a1 + 80);
    v16 = v10;
    v17 = v5;
    v18 = *(id *)(a1 + 56);
    dispatch_sync(v11, block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 80), "performPDFGenerationWithGenerator:galleryModel:progress:", v10, v5, *(_QWORD *)(a1 + 56));
  }
  v12 = objc_msgSend(v6, "length");
  if (v12)
    v13 = (void *)objc_msgSend(v6, "copy");
  else
    v13 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v13);
  if (v12)

}

uint64_t __86__ICDocCamPDFGenerator_blockingGeneratePDFDataForAttachment_withProgress_queue_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 56), "performPDFGenerationWithGenerator:galleryModel:progress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (void)performPDFGenerationWithGenerator:(id)a3 galleryModel:(id)a4 progress:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  objc_msgSend(v7, "startGenerating");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__ICDocCamPDFGenerator_performPDFGenerationWithGenerator_galleryModel_progress___block_invoke;
  v21[3] = &unk_1E5C1E6E8;
  v11 = v9;
  v22 = v11;
  v24 = v25;
  v12 = v7;
  v23 = v12;
  objc_msgSend(v8, "enumerateSubAttachmentsWithBlock:", v21);
  objc_msgSend(v8, "attachment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = os_log_create("com.apple.notes", "Export");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v10);
    v18 = v17;
    objc_msgSend(v8, "attachment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "docCamPDFVersion");
    *(_DWORD *)buf = 134218498;
    v27 = v18;
    v28 = 2112;
    v29 = v14;
    v30 = 2048;
    v31 = v20;
    _os_log_impl(&dword_1AC7A1000, v15, OS_LOG_TYPE_INFO, "PDF Generation time: %f. ID: %@:%ld", buf, 0x20u);

  }
  objc_msgSend(v12, "finishGenerating");

  _Block_object_dispose(v25, 8);
}

void __80__ICDocCamPDFGenerator_performPDFGenerationWithGenerator_galleryModel_progress___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, _BYTE *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a2;
  v9 = a3;
  v10 = *(void **)(a1 + 32);
  if (v10 && objc_msgSend(v10, "isCancelled"))
  {
    *a5 = 1;
  }
  else
  {
    objc_msgSend(v8, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v13 = *(void **)(a1 + 40);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __80__ICDocCamPDFGenerator_performPDFGenerationWithGenerator_galleryModel_progress___block_invoke_2;
      v14[3] = &unk_1E5C1E6C0;
      v15 = v11;
      objc_msgSend(v13, "addPageWithRenderBlock:", v14);

    }
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);

  }
}

void __80__ICDocCamPDFGenerator_performPDFGenerationWithGenerator_galleryModel_progress___block_invoke_2(uint64_t a1, CGContext *a2, double a3, double a4, double a5, double a6)
{
  double x;
  double y;
  double width;
  double height;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  const __CFData *v27;
  CGDataProvider *v28;
  CGImage *v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v33 = CGRectInset(*(CGRect *)&a3, 32.0, 32.0);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  objc_msgSend(*(id *)(a1 + 32), "size");
  memset(&v32, 0, sizeof(v32));
  objc_msgSend(*(id *)(a1 + 32), "ic_imageOrientation");
  ICTransformFromImageOrientation();
  v12 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(*(id *)(a1 + 32), "size");
  objc_msgSend(v12, "ic_aspectFitImageFrameForViewWithFrame:imageSize:", x, y, width, height, v13, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  memset(&v30, 0, sizeof(v30));
  CGAffineTransformInvert(&v31, &v30);
  v34.origin.x = v16;
  v34.origin.y = v18;
  v34.size.width = v20;
  v34.size.height = v22;
  v35 = CGRectApplyAffineTransform(v34, &v31);
  v23 = v35.origin.x;
  v24 = v35.origin.y;
  v25 = v35.size.width;
  v26 = v35.size.height;
  CGContextSaveGState(a2);
  v30 = v32;
  CGContextConcatCTM(a2, &v30);
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 0.6);
  v27 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v28 = CGDataProviderCreateWithCFData(v27);
  v29 = CGImageCreateWithJPEGDataProvider(v28, 0, 1, kCGRenderingIntentDefault);
  v36.origin.x = v23;
  v36.origin.y = v24;
  v36.size.width = v25;
  v36.size.height = v26;
  CGContextDrawImage(a2, v36, v29);
  CGContextRestoreGState(a2);
  CGDataProviderRelease(v28);
  CGImageRelease(v29);

}

void __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Failed to copy fallback PDF data: %@", (uint8_t *)&v2, 0xCu);
}

@end
