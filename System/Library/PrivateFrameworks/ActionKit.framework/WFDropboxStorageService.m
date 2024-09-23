@implementation WFDropboxStorageService

+ (id)serviceName
{
  return WFLocalizedString(CFSTR("Dropbox"));
}

+ (Class)resultItemClass
{
  return (Class)objc_opt_class();
}

- (void)retrieveFilesAtPath:(id)a3 options:(unint64_t)a4 progress:(id)a5 completionHandler:(id)a6
{
  char v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  WFDropboxSessionManager *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  WFDropboxStorageService *v17;
  WFDropboxSessionManager *v18;
  id v19;
  char v20;

  v7 = a4;
  v9 = a3;
  v10 = a6;
  +[WFAccount accounts](WFDropboxAccount, "accounts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(WFDropboxSessionManager);
  objc_msgSend(v12, "credential");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDropboxSessionManager setCredential:](v13, "setCredential:", v14);

  if (objc_msgSend(v9, "isEqualToString:", CFSTR("/")))
  {
    -[WFDropboxStorageService finishRetrievalWithContentsOfFolderAtPath:sessionManager:retrievalHandler:](self, "finishRetrievalWithContentsOfFolderAtPath:sessionManager:retrievalHandler:", &stru_24F8BBA48, v13, v10);
  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __82__WFDropboxStorageService_retrieveFilesAtPath_options_progress_completionHandler___block_invoke;
    v15[3] = &unk_24F8B2DE8;
    v20 = v7 & 1;
    v19 = v10;
    v16 = v9;
    v17 = self;
    v18 = v13;
    -[WFDropboxSessionManager getItemAtPath:completionHandler:](v18, "getItemAtPath:completionHandler:", v16, v15);

  }
}

- (void)finishRetrievalWithContentsOfFolderAtPath:(id)a3 sessionManager:(id)a4 retrievalHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __101__WFDropboxStorageService_finishRetrievalWithContentsOfFolderAtPath_sessionManager_retrievalHandler___block_invoke;
  v9[3] = &unk_24F8B9110;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a4, "getContentsOfFolderAtPath:completionHandler:", a3, v9);

}

- (id)saveFiles:(id)a3 withManagedLevel:(unint64_t)a4 toPath:(id)a5 options:(unint64_t)a6 progress:(id)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  WFStorageServiceCancellableOperation *v17;
  uint64_t v18;
  id v19;
  WFStorageServiceCancellableOperation *v20;
  void *v21;
  void *v22;
  void *v23;
  WFDropboxSessionManager *v24;
  void *v25;
  WFStorageServiceCancellableOperation *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  WFDropboxSessionManager *v31;
  WFDropboxSessionManager *v32;
  WFStorageServiceCancellableOperation *v33;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  id v39;
  _QWORD v41[4];
  WFStorageServiceCancellableOperation *v42;
  id v43;
  WFDropboxStorageService *v44;
  id v45;
  id v46;
  WFDropboxSessionManager *v47;
  id v48;
  _QWORD *v49;
  unint64_t v50;
  _QWORD v51[4];
  id v52;
  _QWORD *v53;
  _QWORD v54[5];
  id v55;

  v13 = a3;
  v39 = a5;
  v14 = a7;
  v15 = a8;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDropboxStorageService.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileRepresentations"));

  }
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__14136;
  v54[4] = __Block_byref_object_dispose__14137;
  v55 = (id)objc_opt_new();
  v16 = (void *)objc_opt_new();
  v17 = [WFStorageServiceCancellableOperation alloc];
  v18 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke;
  v51[3] = &unk_24F8BB688;
  v19 = v16;
  v52 = v19;
  v53 = v54;
  v20 = -[WFStorageServiceCancellableOperation initWithCancelBlock:](v17, "initWithCancelBlock:", v51);
  v38 = a6;
  objc_msgSend(v13, "if_map:", &__block_literal_global_138_14141);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19438], "collectionWithItems:", v37);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFAccount accounts](WFDropboxAccount, "accounts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v13;

  v24 = objc_alloc_init(WFDropboxSessionManager);
  objc_msgSend(v23, "credential");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDropboxSessionManager setCredential:](v24, "setCredential:", v25);

  v41[0] = v18;
  v41[1] = 3221225472;
  v41[2] = __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_3;
  v41[3] = &unk_24F8B2F28;
  v26 = v20;
  v42 = v26;
  v27 = v15;
  v48 = v27;
  v28 = v39;
  v50 = v38;
  v43 = v28;
  v44 = self;
  v29 = v14;
  v45 = v29;
  v30 = v19;
  v46 = v30;
  v49 = v54;
  v31 = v24;
  v47 = v31;
  objc_msgSend(v21, "getFileRepresentations:forType:", v41, 0);
  v32 = v47;
  v33 = v26;

  _Block_object_dispose(v54, 8);
  return v33;
}

- (void)getSharingURLsForFiles:(id)a3 usePublicURLs:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__WFDropboxStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke;
  v9[3] = &unk_24F8B7C28;
  v10 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend(v8, "getObjectRepresentations:forClass:", v9, objc_opt_class());

}

- (void)deleteFiles:(id)a3 deleteImmediately:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke;
  v9[3] = &unk_24F8B7C28;
  v10 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend(v8, "getObjectRepresentations:forClass:", v9, objc_opt_class());

}

- (void)createFolderAtPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WFDropboxSessionManager *v10;
  void *v11;
  WFDropboxSessionManager *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  WFDropboxSessionManager *v17;
  WFDropboxStorageService *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  +[WFAccount accounts](WFDropboxAccount, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(WFDropboxSessionManager);
  objc_msgSend(v9, "credential");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDropboxSessionManager setCredential:](v10, "setCredential:", v11);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__WFDropboxStorageService_createFolderAtPath_completionHandler___block_invoke;
  v15[3] = &unk_24F8B2FF0;
  v16 = v6;
  v17 = v10;
  v18 = self;
  v19 = v7;
  v12 = v10;
  v13 = v7;
  v14 = v6;
  -[WFDropboxSessionManager createFolderAtPath:completionHandler:](v12, "createFolderAtPath:completionHandler:", v14, v15);

}

- (void)appendText:(id)a3 toPath:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  WFDropboxSessionManager *v15;
  void *v16;
  uint64_t v17;
  WFDropboxSessionManager *v18;
  id v19;
  WFDropboxSessionManager *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  WFDropboxStorageService *v27;
  id v28;
  WFDropboxSessionManager *v29;
  id v30;
  id v31;
  unint64_t v32;
  _QWORD aBlock[4];
  WFDropboxSessionManager *v34;
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  +[WFAccount accounts](WFDropboxAccount, "accounts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(WFDropboxSessionManager);
  objc_msgSend(v14, "credential");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDropboxSessionManager setCredential:](v15, "setCredential:", v16);

  v17 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke;
  aBlock[3] = &unk_24F8B3018;
  v18 = v15;
  v34 = v18;
  v19 = v12;
  v35 = v19;
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke_3;
  v25[3] = &unk_24F8B3068;
  v26 = v11;
  v27 = self;
  v30 = v19;
  v31 = _Block_copy(aBlock);
  v28 = v10;
  v29 = v18;
  v32 = a5;
  v20 = v18;
  v21 = v31;
  v22 = v10;
  v23 = v19;
  v24 = v11;
  -[WFDropboxSessionManager getItemAtPath:completionHandler:](v20, "getItemAtPath:completionHandler:", v24, v25);

}

- (void)searchFiles:(id)a3 inPath:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  WFDropboxSessionManager *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[WFAccount accounts](WFDropboxAccount, "accounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(WFDropboxSessionManager);
  objc_msgSend(v11, "credential");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDropboxSessionManager setCredential:](v12, "setCredential:", v13);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__WFDropboxStorageService_searchFiles_inPath_completionHandler___block_invoke;
  v15[3] = &unk_24F8B9110;
  v16 = v7;
  v14 = v7;
  -[WFDropboxSessionManager searchFiles:inPath:completionHandler:](v12, "searchFiles:inPath:completionHandler:", v9, v8, v15);

}

- (BOOL)hasPublicURLs
{
  return 1;
}

- (Class)objectRepresentationClass
{
  return (Class)objc_opt_class();
}

- (Class)accessResourceClass
{
  return (Class)objc_opt_class();
}

- (NSString)storageLocationPrefix
{
  return 0;
}

- (BOOL)supportsJumpingToSubdirectoryInUI
{
  return 1;
}

- (id)associatedAppBundleIdentifier
{
  return CFSTR("com.getdropbox.Dropbox");
}

- (INAppDescriptor)associatedAppDescriptor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9BD0]), "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", 0, CFSTR("com.getdropbox.Dropbox"), 0, 0, CFSTR("G7HH3F8CAK"), 0, 0, 0);
  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedAppMatchingDescriptor:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isInstalled"))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19390], "platformFileManagerLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appDescriptor");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (INAppDescriptor *)v5;
}

void __64__WFDropboxStorageService_searchFiles_inPath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = objc_msgSend(v8, "count");
  if (v5 || !v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v8, "if_map:", &__block_literal_global_177);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

WFFileStorageServiceResult *__64__WFDropboxStorageService_searchFiles_inPath_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFFileStorageServiceResult resultWithMetadata:](WFFileStorageServiceResult, "resultWithMetadata:", a2);
}

void __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke_2;
  v9[3] = &unk_24F8B2E90;
  v7 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v8 = (id)objc_msgSend(v7, "saveFile:toPath:overwrite:progress:completionHandler:", a2, a3, a4, 0, v9);

}

void __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "isDirectory"))
  {
    if (v5)
    {
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke_4;
      v28[3] = &unk_24F8B3040;
      v18 = *(void **)(a1 + 56);
      v19 = *(id *)(a1 + 48);
      v21 = *(void **)(a1 + 72);
      v20 = *(_QWORD *)(a1 + 80);
      v29 = v19;
      v31 = v20;
      v30 = v21;
      objc_msgSend(v18, "downloadFile:ofType:proposedFilename:completionHandler:", v5, 0, 0, v28);

      goto LABEL_11;
    }
    objc_msgSend(v6, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
    {
      v23 = objc_msgSend(v6, "code");

      if (v23 == 4)
      {
        v24 = (void *)MEMORY[0x24BE194F8];
        objc_msgSend(*(id *)(a1 + 48), "dataUsingEncoding:", 4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fileWithData:ofType:proposedFilename:", v25, v26, v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
        goto LABEL_3;
      }
    }
    else
    {

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_11;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("The path you tried to save to (%1$@) is an existing folder in your %2$@. When appending or prepending text to a file, you should specify a path to a file instead."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(_QWORD *)(a1 + 64);
  v13 = (void *)MEMORY[0x24BDD1540];
  v14 = *MEMORY[0x24BDD0B88];
  v32[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Folder already exists"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = *MEMORY[0x24BDD0FC8];
  v33[0] = v15;
  v33[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 516, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v17);

LABEL_3:
LABEL_11:

}

void __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke_4(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a1[4];
  v6 = a1[6];
  v7 = a3;
  +[WFAppendUtilities fileByAppendingText:toFile:options:](WFAppendUtilities, "fileByAppendingText:toFile:options:", v5, a2, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = a1[5];
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, uint64_t))(v8 + 16))(v8, v10, v9, 1);
}

void __71__WFDropboxStorageService_appendText_toPath_options_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;
  void *v7;
  void (*v8)(uint64_t, _QWORD, id);
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v5 = a3;
    +[WFFileStorageServiceResult resultWithMetadata:](WFFileStorageServiceResult, "resultWithMetadata:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v7, v5);

  }
  else
  {
    v8 = *(void (**)(uint64_t, _QWORD, id))(v3 + 16);
    v6 = a3;
    v8(v3, 0, v6);
  }

}

void __64__WFDropboxStorageService_createFolderAtPath_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (*v12)(void);
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!a2)
  {
    objc_msgSend(v5, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WFDropboxErrorDomain")) & 1) != 0)
    {
      v11 = objc_msgSend(v6, "code");

      if (v11 == 105)
      {
        if (objc_msgSend(*(id *)(a1 + 32), "length")
          && !objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("/")))
        {
          v14 = *(_QWORD *)(a1 + 32);
          v13 = *(void **)(a1 + 40);
          v17[0] = MEMORY[0x24BDAC760];
          v17[1] = 3221225472;
          v17[2] = __64__WFDropboxStorageService_createFolderAtPath_completionHandler___block_invoke_2;
          v17[3] = &unk_24F8B2FC8;
          v20 = *(id *)(a1 + 56);
          v15 = *(id *)(a1 + 32);
          v16 = *(_QWORD *)(a1 + 48);
          v18 = v15;
          v19 = v16;
          objc_msgSend(v13, "getItemAtPath:completionHandler:", v14, v17);

          goto LABEL_11;
        }
        v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
        goto LABEL_10;
      }
    }
    else
    {

    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_10:
    v12();
    goto LABEL_11;
  }
  v7 = *(_QWORD *)(a1 + 56);
  +[WFFileStorageServiceResult resultWithMetadata:](WFFileStorageServiceResult, "resultWithMetadata:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v9, v6);

LABEL_11:
}

void __64__WFDropboxStorageService_createFolderAtPath_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isDirectory"))
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      +[WFFileStorageServiceResult resultWithMetadata:](WFFileStorageServiceResult, "resultWithMetadata:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v9, v6);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("The path you tried to save to (%1$@) is an existing file in your %2$@."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "serviceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0B88];
    v20[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("File already exists"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = *MEMORY[0x24BDD0FC8];
    v21[0] = v17;
    v21[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 516, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v6 = (id)v19;
  }

}

void __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WFDropboxSessionManager *v10;
  void *v11;
  WFDropboxSessionManager *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  WFDropboxSessionManager *v16;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    +[WFAccount accounts](WFDropboxAccount, "accounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc_init(WFDropboxSessionManager);
    objc_msgSend(v9, "credential");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDropboxSessionManager setCredential:](v10, "setCredential:", v11);

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_2;
    v15[3] = &unk_24F8B2FA0;
    v16 = v10;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_4;
    v13[3] = &unk_24F8B39E0;
    v14 = *(id *)(a1 + 32);
    v12 = v10;
    objc_msgSend(v6, "if_enumerateAsynchronously:completionHandler:", v15, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_3;
  v9[3] = &unk_24F8B2E90;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "deleteItem:completionHandler:", a2, v9);

}

uint64_t __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__WFDropboxStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__WFDropboxStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WFDropboxSessionManager *v10;
  void *v11;
  uint64_t v12;
  WFDropboxSessionManager *v13;
  _QWORD v14[4];
  WFDropboxSessionManager *v15;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    +[WFAccount accounts](WFDropboxAccount, "accounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc_init(WFDropboxSessionManager);
    objc_msgSend(v9, "credential");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDropboxSessionManager setCredential:](v10, "setCredential:", v11);

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __82__WFDropboxStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke_2;
    v14[3] = &unk_24F8B2F78;
    v15 = v10;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = v10;
    objc_msgSend(v6, "if_mapAsynchronously:completionHandler:", v14, v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __82__WFDropboxStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__WFDropboxStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke_3;
  v9[3] = &unk_24F8B2F50;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "getSharedLinkForFile:completionHandler:", a2, v9);

}

uint64_t __82__WFDropboxStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6++), "cancel", (_QWORD)v10);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

void __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  char v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  char v29;
  char v30;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count") && !objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "length"))
      v7 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("/"));
    else
      v7 = 1;
    v8 = *(_BYTE *)(a1 + 96) & 1;
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_4;
    v19 = &unk_24F8B2F00;
    v20 = *(id *)(a1 + 32);
    v27 = *(id *)(a1 + 80);
    v21 = *(id *)(a1 + 40);
    v29 = v7;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(void **)(a1 + 56);
    v22 = v9;
    v23 = v10;
    v30 = v8;
    v24 = v11;
    v12 = *(id *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 88);
    v25 = v12;
    v28 = v13;
    v26 = *(id *)(a1 + 72);
    v14 = _Block_copy(&v16);
    v15 = v14;
    if (v7)
      (*((void (**)(void *, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);
    else
      objc_msgSend(*(id *)(a1 + 72), "getItemAtPath:completionHandler:", *(_QWORD *)(a1 + 40), v14, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }

}

void __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  char v43;
  char v44;
  _QWORD v45[2];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDD0B88];
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD0B88]))
  {
    v9 = objc_msgSend(v6, "code");

    if (v9 == 4)
    {

      goto LABEL_6;
    }
  }
  else
  {

  }
  if (!v6)
  {
LABEL_6:
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      v6 = 0;
      goto LABEL_8;
    }
    v10 = *(id *)(a1 + 40);
    if ((objc_msgSend(v5, "isDirectory") & 1) != 0 || *(_BYTE *)(a1 + 104))
      v11 = 1;
    else
      v11 = objc_msgSend(*(id *)(a1 + 40), "hasSuffix:", CFSTR("/"));
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") < 2)
    {
      if ((v11 & 1) == 0)
      {
        if (v5 && *(_BYTE *)(a1 + 105))
        {
          v21 = 0;
        }
        else
        {
          v22 = (void *)MEMORY[0x24BE194F8];
          objc_msgSend(v10, "lastPathComponent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "wfType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "proposedFilenameForFile:ofType:", v23, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "stringByDeletingLastPathComponent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringByAppendingPathComponent:", v26);
          v28 = objc_claimAutoreleasedReturnValue();

          v21 = 0;
          v10 = (id)v28;
        }
        goto LABEL_25;
      }
    }
    else
    {
      if (v5)
        v12 = v11;
      else
        v12 = 1;
      if ((v12 & 1) == 0)
      {
        v13 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("The path you tried to save to (%1$@) is an existing file in your %2$@. When saving multiple files at a time, you should specify a path to a folder instead."));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 40);
        objc_msgSend((id)objc_opt_class(), "serviceName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringWithFormat:", v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x24BDD1540];
        v45[0] = *MEMORY[0x24BDD0FD8];
        WFLocalizedString(CFSTR("File already exists"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = *MEMORY[0x24BDD0FC8];
        v46[0] = v19;
        v46[1] = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", v8, 516, v20);
        v6 = (id)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
LABEL_26:

        goto LABEL_27;
      }
    }
    v21 = 1;
LABEL_25:
    objc_msgSend(*(id *)(a1 + 64), "setTotalUnitCount:", objc_msgSend(*(id *)(a1 + 48), "count"));
    objc_msgSend(*(id *)(a1 + 64), "setCompletedUnitCount:", 0);
    v29 = MEMORY[0x24BDAC760];
    v30 = *(void **)(a1 + 48);
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_5;
    v36[3] = &unk_24F8B2EB8;
    v37 = *(id *)(a1 + 32);
    v38 = *(id *)(a1 + 64);
    v43 = v21;
    v10 = v10;
    v39 = v10;
    v31 = *(id *)(a1 + 72);
    v32 = *(_QWORD *)(a1 + 96);
    v40 = v31;
    v42 = v32;
    v41 = *(id *)(a1 + 80);
    v44 = *(_BYTE *)(a1 + 105);
    v33[0] = v29;
    v33[1] = 3221225472;
    v33[2] = __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_7;
    v33[3] = &unk_24F8BABC0;
    v34 = *(id *)(a1 + 32);
    v35 = *(id *)(a1 + 88);
    objc_msgSend(v30, "if_mapAsynchronously:completionHandler:", v36, v33);

    v6 = 0;
    v17 = v37;
    goto LABEL_26;
  }
LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
LABEL_27:

}

void __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else if (objc_msgSend(v6, "representationType") == 1
         && (objc_msgSend(v6, "fileURL"),
             v8 = (void *)objc_claimAutoreleasedReturnValue(),
             v9 = objc_msgSend(v8, "wf_fileIsDirectory"),
             v8,
             v9))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("“%@” is a folder"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filename");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("“%@” could not be saved because it is a folder or package. Consider zipping this file using Make Archive before saving."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filename");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD1128];
    v20 = *MEMORY[0x24BDD0FC8];
    v33[0] = *MEMORY[0x24BDD0FD8];
    v33[1] = v20;
    v34[0] = v13;
    v34[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 21, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v22);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "becomeCurrentWithPendingUnitCount:", 1);
    objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "resignCurrent");
    v24 = *(void **)(a1 + 48);
    if (*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(v6, "filename");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingPathComponent:", v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = v24;
    }
    objc_msgSend(*(id *)(a1 + 56), "lock");
    v27 = *(void **)(a1 + 64);
    v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v29 = *(unsigned __int8 *)(a1 + 81);
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_6;
    v31[3] = &unk_24F8B2E90;
    v32 = v7;
    objc_msgSend(v27, "saveFile:toPath:overwrite:progress:completionHandler:", v6, v26, v29, v23, v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v30);

    objc_msgSend(*(id *)(a1 + 56), "unlock");
  }

}

void __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = objc_msgSend(v8, "count");
  if (v5 || !v6 || objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v8, "if_map:", &__block_literal_global_158);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

WFFileStorageServiceResult *__96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return +[WFFileStorageServiceResult resultWithMetadata:](WFFileStorageServiceResult, "resultWithMetadata:", a2);
}

uint64_t __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__WFDropboxStorageService_saveFiles_withManagedLevel_toPath_options_progress_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BE19450], "itemWithFile:", a2);
}

void __101__WFDropboxStorageService_finishRetrievalWithContentsOfFolderAtPath_sessionManager_retrievalHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "if_map:", &__block_literal_global_14159);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

WFFileStorageServiceResult *__101__WFDropboxStorageService_finishRetrievalWithContentsOfFolderAtPath_sessionManager_retrievalHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFFileStorageServiceResult resultWithMetadata:](WFFileStorageServiceResult, "resultWithMetadata:", a2);
}

void __82__WFDropboxStorageService_retrieveFilesAtPath_options_progress_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
    {
      v9 = objc_msgSend(v7, "code");

      if (v9 == 4 && !*(_BYTE *)(a1 + 64))
        goto LABEL_5;
    }
    else
    {

    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_10:
    v10();
    goto LABEL_11;
  }
LABEL_5:
  if (!v5)
  {
    v11 = *(_QWORD *)(a1 + 56);
    if (*(_BYTE *)(a1 + 64))
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BDD0B88];
      v23 = *MEMORY[0x24BDD0FC8];
      v14 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("No item was found at path: %@"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v15, *(_QWORD *)(a1 + 32));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 4, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v18);

      goto LABEL_11;
    }
    v10 = *(void (**)(void))(v11 + 16);
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isDirectory"))
  {
    objc_msgSend(*(id *)(a1 + 40), "finishRetrievalWithContentsOfFolderAtPath:sessionManager:retrievalHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v19 = *(_QWORD *)(a1 + 56);
    +[WFFileStorageServiceResult resultWithMetadata:](WFFileStorageServiceResult, "resultWithMetadata:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v19 + 16))(v19, v21, 0);

  }
LABEL_11:

}

@end
