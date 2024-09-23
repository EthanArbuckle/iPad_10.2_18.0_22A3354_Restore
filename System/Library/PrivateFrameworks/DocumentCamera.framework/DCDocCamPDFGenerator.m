@implementation DCDocCamPDFGenerator

+ (void)initialize
{
  void *v3;
  id v4;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(a1, "rootPDFFolderPath");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fileManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

  }
}

+ (OS_dispatch_queue)syncGeneratorQueue
{
  if (syncGeneratorQueue_onceToken != -1)
    dispatch_once(&syncGeneratorQueue_onceToken, &__block_literal_global_3);
  return (OS_dispatch_queue *)(id)syncGeneratorQueue_sSyncGeneratorQueue;
}

void __42__DCDocCamPDFGenerator_syncGeneratorQueue__block_invoke()
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
    dispatch_once(&fileQueue_onceToken, &__block_literal_global_5);
  return (OS_dispatch_queue *)(id)fileQueue_sFileQueue;
}

void __33__DCDocCamPDFGenerator_fileQueue__block_invoke()
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
  return (NSFileManager *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
}

+ (id)rootPDFFolderPath
{
  if (rootPDFFolderPath_onceToken != -1)
    dispatch_once(&rootPDFFolderPath_onceToken, &__block_literal_global_8);
  return (id)rootPDFFolderPath_path;
}

void __41__DCDocCamPDFGenerator_rootPDFFolderPath__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  NSTemporaryDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("docCamTempPDFFolder"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rootPDFFolderPath_path;
  rootPDFFolderPath_path = v0;

}

+ (id)folderPathForDocumentInfoCollectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "rootPDFFolderPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)folderPathForDocumentInfoCollection:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "folderPathForDocumentInfoCollectionIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)versionfolderPathForDocumentInfoCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "folderPathForDocumentInfoCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = objc_msgSend(v4, "docCamPDFVersion");

  objc_msgSend(v6, "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)versionPDFPathForDocumentInfoCollection:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dc_sanitizedFilenameString");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v6, "length"))
  {

    v6 = CFSTR("Scanned Documents");
  }
  objc_msgSend(a1, "versionfolderPathForDocumentInfoCollection:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("pdf"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)createEmptyPDFFileAtURLIFNecessaryForDocumentInfoCollection:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  objc_msgSend(a1, "versionPDFPathForDocumentInfoCollection:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__DCDocCamPDFGenerator_createEmptyPDFFileAtURLIFNecessaryForDocumentInfoCollection___block_invoke;
  block[3] = &unk_24C5B7B28;
  v9 = v4;
  v10 = a1;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __84__DCDocCamPDFGenerator_createEmptyPDFFileAtURLIFNecessaryForDocumentInfoCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByDeletingLastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createTmpDirectory:", v4);

    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeToURL:atomically:", *(_QWORD *)(a1 + 32), 1);

  }
}

+ (void)createTmpDirectory:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__DCDocCamPDFGenerator_createTmpDirectory___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v4 = createTmpDirectory__once;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&createTmpDirectory__once, block);
  objc_msgSend(a1, "fileManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

}

void __43__DCDocCamPDFGenerator_createTmpDirectory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *MEMORY[0x24BDF75E0];
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_applicationWillTerminate_, v3, v4);

}

+ (void)deletePDFFolderIfExistsForDocumentInfoCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "fileManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "folderPathForDocumentInfoCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "fileExistsAtPath:", v5))
    objc_msgSend(v6, "removeItemAtPath:error:", v5, 0);

}

+ (void)deleteAllDocCamPDFs
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20CE8E000, log, OS_LOG_TYPE_DEBUG, "Deleting All Doc Cam PDFs", v1, 2u);
}

void __43__DCDocCamPDFGenerator_deleteAllDocCamPDFs__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "fileManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rootPDFFolderPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v2, 0);

}

+ (id)pdfURLForDocumentInfoCollection:(id)a3
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
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  objc_msgSend(a1, "fileQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__DCDocCamPDFGenerator_pdfURLForDocumentInfoCollection___block_invoke;
  block[3] = &unk_24C5B8128;
  v11 = &v13;
  v12 = a1;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __56__DCDocCamPDFGenerator_pdfURLForDocumentInfoCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 48), "versionPDFPathForDocumentInfoCollection:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFileURL"))
  {
    v4 = 0;
    if (objc_msgSend(v3, "getResourceValue:forKey:error:", &v4, *MEMORY[0x24BDBCC48], 0))
    {
      if (objc_msgSend(v4, "integerValue") >= 11
        && objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
      }
    }
  }

}

+ (void)generatePDFsIfNecessaryForDocumentInfoCollection:(id)a3 imageCache:(id)a4 displayWindow:(id)a5 presentingViewController:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  DCLongRunningTaskController *v28;
  uint64_t v29;
  DCLongRunningTaskController *v30;
  _QWORD v31[4];
  id v32;
  _QWORD *v33;
  char v34;
  _QWORD v35[4];
  id v36;
  id v37;
  DCLongRunningTaskController *v38;
  uint64_t *v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[3];
  char v47;
  _QWORD v48[3];
  char v49;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v13)
  {
    v16 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[DCDocCamPDFGenerator generatePDFsIfNecessaryForDocumentInfoCollection:imageCache:displayWindow:presentingViewController:completionHandler:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

  }
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v49 = 0;
  objc_msgSend(v11, "docInfos");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    v47 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    objc_msgSend(v11, "docInfos");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");
    v43[3] = v27;

    v28 = -[DCLongRunningTaskController initWithWindow:intervalBeforeOpeningProgressDialog:]([DCLongRunningTaskController alloc], "initWithWindow:intervalBeforeOpeningProgressDialog:", v13, 0.5);
    -[DCLongRunningTaskController setProgressToStringTransformer:](v28, "setProgressToStringTransformer:", &__block_literal_global_24);
    -[DCLongRunningTaskController setShouldShowCancelButton:](v28, "setShouldShowCancelButton:", 1);
    -[DCLongRunningTaskController setShouldShowCircularProgress:](v28, "setShouldShowCircularProgress:", 1);
    -[DCLongRunningTaskController setViewControllerToPresentFrom:](v28, "setViewControllerToPresentFrom:", v14);
    v29 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke_2;
    v35[3] = &unk_24C5B8170;
    v39 = &v42;
    v36 = v11;
    v37 = v12;
    v40 = v46;
    v41 = v48;
    v30 = v28;
    v38 = v30;
    v31[0] = v29;
    v31[1] = 3221225472;
    v31[2] = __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke_3;
    v31[3] = &unk_24C5B81C0;
    v34 = 0;
    v33 = v46;
    v32 = v15;
    -[DCLongRunningTaskController startTask:completionBlock:](v30, "startTask:completionBlock:", v35, v31);

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(v46, 8);
  }
  else if (v15)
  {
    (*((void (**)(id, uint64_t))v15 + 2))(v15, 1);
  }
  _Block_object_dispose(v48, 8);

}

id __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke()
{
  return +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Preparing…"), CFSTR("Preparing…"), CFSTR("Localizable"));
}

void __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setTotalUnitCount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v3 = +[DCDocCamPDFGenerator blockingGeneratepdfURLForDocumentInfoCollection:imageCache:withProgress:error:](DCDocCamPDFGenerator, "blockingGeneratepdfURLForDocumentInfoCollection:imageCache:withProgress:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "isCancelled") ^ 1;

}

void __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  if (*(_BYTE *)(a1 + 48))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke_4;
    v3[3] = &unk_24C5B8198;
    v4 = *(id *)(a1 + 32);
    v5 = a2;
    dispatch_async(MEMORY[0x24BDAC9B8], v3);

  }
}

uint64_t __141__DCDocCamPDFGenerator_generatePDFsIfNecessaryForDocumentInfoCollection_imageCache_displayWindow_presentingViewController_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) == 0);
}

+ (id)blockingGeneratepdfURLForDocumentInfoCollection:(id)a3 imageCache:(id)a4 withProgress:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  objc_msgSend(a1, "pdfURLForDocumentInfoCollection:", v9);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)v23[5];
  if (!v12)
  {
    objc_msgSend(a1, "syncGeneratorQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke;
    block[3] = &unk_24C5B8238;
    v21 = a1;
    v17 = v9;
    v18 = v10;
    v19 = v11;
    v20 = &v22;
    dispatch_sync(v13, block);

    v12 = (void *)v23[5];
  }
  v14 = v12;
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  DCPDFGenerator *v9;
  const __CFString *v10;
  DCPDFGenerator *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD block[4];
  id v29;
  id v30;
  uint64_t v31;

  objc_msgSend(*(id *)(a1 + 64), "versionPDFPathForDocumentInfoCollection:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "title");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "fileQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke_2;
  block[3] = &unk_24C5B81E8;
  v31 = *(_QWORD *)(a1 + 64);
  v29 = *(id *)(a1 + 32);
  v7 = v2;
  v30 = v7;
  dispatch_sync(v5, block);

  v8 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v9 = [DCPDFGenerator alloc];
  if (v4)
    v10 = v4;
  else
    v10 = &stru_24C5B9710;
  v11 = -[DCPDFGenerator initWithMutableData:pageRect:title:](v9, "initWithMutableData:pageRect:title:", v8, v10, *(double *)&kICPDFGeneratorDefaultPageRect, unk_25499BAD0, *(double *)&qword_25499BAD8, unk_25499BAE0);
  objc_msgSend(*(id *)(a1 + 64), "performPDFGenerationWithGenerator:docInfoCollection:imageCache:progress:", v11, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 64), "fileQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke_39;
    v23[3] = &unk_24C5B8210;
    v27 = *(_QWORD *)(a1 + 64);
    v24 = v3;
    v13 = v8;
    v14 = *(_QWORD *)(a1 + 56);
    v25 = v13;
    v26 = v14;
    dispatch_sync(v12, v23);

  }
  else
  {
    v15 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
}

void __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 48), "deletePDFForDocumentInfoCollectionIfExists:", *(_QWORD *)(a1 + 32));
  v2 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "stringByDeletingLastPathComponent");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createTmpDirectory:", v3);

}

void __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke_39(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 56), "fileManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  objc_msgSend(*(id *)(a1 + 40), "writeToURL:atomically:", *(_QWORD *)(a1 + 32), 1);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
}

+ (void)performPDFGenerationWithGenerator:(id)a3 docInfoCollection:(id)a4 imageCache:(id)a5 progress:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, _BYTE *);
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  objc_msgSend(v9, "startGenerating");
  objc_msgSend(v10, "docInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __96__DCDocCamPDFGenerator_performPDFGenerationWithGenerator_docInfoCollection_imageCache_progress___block_invoke;
  v20 = &unk_24C5B8288;
  v14 = v12;
  v21 = v14;
  v15 = v11;
  v22 = v15;
  v24 = v25;
  v16 = v9;
  v23 = v16;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v17);

  objc_msgSend(v16, "finishGenerating", v17, v18, v19, v20);
  _Block_object_dispose(v25, 8);

}

void __96__DCDocCamPDFGenerator_performPDFGenerationWithGenerator_docInfoCollection_imageCache_progress___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  if (v7 && objc_msgSend(v7, "isCancelled"))
  {
    *a4 = 1;
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v6, "croppedAndFilteredImageUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getImage:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v11 = *(void **)(a1 + 48);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __96__DCDocCamPDFGenerator_performPDFGenerationWithGenerator_docInfoCollection_imageCache_progress___block_invoke_2;
      v12[3] = &unk_24C5B8260;
      v13 = v10;
      objc_msgSend(v11, "addPageWithRenderBlock:", v12);

    }
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);

  }
}

void __96__DCDocCamPDFGenerator_performPDFGenerationWithGenerator_docInfoCollection_imageCache_progress___block_invoke_2(uint64_t a1, CGContext *a2, double a3, double a4, double a5, double a6)
{
  double x;
  double y;
  double width;
  double height;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  const __CFData *v29;
  CGDataProvider *v30;
  CGImage *v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v35 = CGRectInset(*(CGRect *)&a3, 32.0, 32.0);
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  objc_msgSend(*(id *)(a1 + 32), "size");
  memset(&v34, 0, sizeof(v34));
  DCTransformFromImageOrientation(objc_msgSend(*(id *)(a1 + 32), "imageOrientation"), (uint64_t)&v34, v12, v13);
  v14 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(*(id *)(a1 + 32), "size");
  objc_msgSend(v14, "dc_aspectFitImageFrameForViewWithFrame:imageSize:", x, y, width, height, v15, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v32 = v34;
  CGAffineTransformInvert(&v33, &v32);
  v36.origin.x = v18;
  v36.origin.y = v20;
  v36.size.width = v22;
  v36.size.height = v24;
  v37 = CGRectApplyAffineTransform(v36, &v33);
  v25 = v37.origin.x;
  v26 = v37.origin.y;
  v27 = v37.size.width;
  v28 = v37.size.height;
  CGContextSaveGState(a2);
  v32 = v34;
  CGContextConcatCTM(a2, &v32);
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 0.6);
  v29 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v30 = CGDataProviderCreateWithCFData(v29);
  v31 = CGImageCreateWithJPEGDataProvider(v30, 0, 1, kCGRenderingIntentDefault);
  v38.origin.x = v25;
  v38.origin.y = v26;
  v38.size.width = v27;
  v38.size.height = v28;
  CGContextDrawImage(a2, v38, v31);
  CGContextRestoreGState(a2);
  CGDataProviderRelease(v30);
  CGImageRelease(v31);

}

+ (void)generatePDFsIfNecessaryForDocumentInfoCollection:(uint64_t)a3 imageCache:(uint64_t)a4 displayWindow:(uint64_t)a5 presentingViewController:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a1, a3, "invalid nil value for '%s'", a5, a6, a7, a8, 2u);
}

void __102__DCDocCamPDFGenerator_blockingGeneratepdfURLForDocumentInfoCollection_imageCache_withProgress_error___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a1, a3, "invalid nil value for '%s'", a5, a6, a7, a8, 2u);
}

@end
