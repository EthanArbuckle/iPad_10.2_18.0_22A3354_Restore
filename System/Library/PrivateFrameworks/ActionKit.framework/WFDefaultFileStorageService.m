@implementation WFDefaultFileStorageService

+ (id)containerName
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC3D28], "documentsDirectoryWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x24BDBCCF8];
  v3 = v8[0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceValuesForKeys:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)directoryTraversalError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Invalid file path"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("The provided file path must be contained within the directory."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEC4270];
  v6 = *MEMORY[0x24BDD0FC8];
  v10[0] = *MEMORY[0x24BDD0FD8];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)serviceName
{
  return WFLocalizedString(CFSTR("iCloud Drive"));
}

+ (Class)resultItemClass
{
  return (Class)objc_opt_class();
}

- (id)fileURLFromDirectory:(id)a3 path:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "hasPrefix:", CFSTR("/")) & 1) != 0)
  {
    objc_msgSend(v6, "substringFromIndex:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v5;
  }
  v10 = v9;
  objc_msgSend(v9, "URLByStandardizingPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)retrieveFileAtPath:(id)a3 fromDirectory:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, void *);
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;

  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a6;
  v12 = a3;
  objc_msgSend(v10, "fileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDefaultFileStorageService fileURLFromDirectory:path:](self, "fileURLFromDirectory:path:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19688]), "initWithFileURL:retrieveFolderContents:progress:", v14, (a5 >> 4) & 1, 0);
  objc_msgSend(v15, "start");
  objc_msgSend(v15, "waitUntilFinished");
  objc_msgSend(v15, "downloadError");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    goto LABEL_8;
  if (objc_msgSend(v16, "code") == 4)
  {

    if ((a5 & 1) != 0)
      goto LABEL_9;
    goto LABEL_7;
  }
  v18 = objc_msgSend(v16, "code");

  if ((a5 & 1) == 0 && v18 == 260)
  {
LABEL_7:
    v17 = v16;
    v16 = 0;
LABEL_8:

  }
LABEL_9:
  objc_msgSend(v10, "fileURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v14, "wf_proposedFileIsContainedByDirectoryAtURL:", v19);

  if ((v20 & 1) != 0)
  {
    objc_msgSend(v15, "downloadedFiles");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v11[2](v11, 0, v16);
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BEC3D28], "documentsDirectoryWithError:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLByAppendingPathComponent:", *MEMORY[0x24BEC47D0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "downloadedFiles");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __90__WFDefaultFileStorageService_retrieveFileAtPath_fromDirectory_options_completionHandler___block_invoke;
    v27[3] = &unk_24F8B6FA0;
    v28 = v23;
    v25 = v23;
    objc_msgSend(v24, "if_compactMap:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *, void *))v11)[2](v11, v26, v16);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "directoryTraversalError");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v22);
  }

LABEL_15:
}

- (void)retrieveFilesAtPath:(id)a3 options:(unint64_t)a4 progress:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  v22 = 0;
  objc_msgSend(MEMORY[0x24BEC3D28], "documentsDirectoryWithError:", &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v22;
  if (v13)
  {
    -[WFDefaultFileStorageService fileURLFromDirectory:path:](self, "fileURLFromDirectory:path:", v13, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "wf_proposedFileIsContainedByDirectoryAtURL:", v13) & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "directoryTraversalError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v16);
LABEL_16:

      goto LABEL_17;
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19688]), "initWithFileURL:retrieveFolderContents:progress:", v15, (a4 >> 4) & 1, v11);
    objc_msgSend(v16, "start");
    objc_msgSend(v16, "waitUntilFinished");
    objc_msgSend(v16, "downloadError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v17, "code") == 4)
      {

        if ((a4 & 1) != 0)
        {
LABEL_13:
          v14 = v17;
          objc_msgSend(v16, "downloadedFiles");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v16, "downloadedFiles");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "if_mapAsynchronously:completionHandler:", &__block_literal_global_35540, v12);

          }
          else
          {
            v12[2](v12, 0, v17);
          }
          goto LABEL_16;
        }
      }
      else
      {
        v19 = objc_msgSend(v17, "code");

        if ((a4 & 1) != 0 || v19 != 260)
          goto LABEL_13;
      }
      v18 = v17;
      v17 = 0;
    }

    goto LABEL_13;
  }
  v12[2](v12, 0, v14);
LABEL_17:

}

- (id)saveFiles:(id)a3 withManagedLevel:(unint64_t)a4 toDirectory:(id)a5 subpath:(id)a6 options:(unint64_t)a7 progress:(id)a8 completionHandler:(id)a9
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;

  v13 = a3;
  v14 = a5;
  v15 = a8;
  v16 = (void (**)(id, _QWORD, void *))a9;
  v17 = a6;
  objc_msgSend(v13, "if_map:", &__block_literal_global_128);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19438], "collectionWithItems:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDefaultFileStorageService fileURLFromDirectory:path:](self, "fileURLFromDirectory:path:", v14, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "pathComponents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "length"))
    v23 = (objc_msgSend(v22, "hasSuffix:", CFSTR("/")) & 1) != 0 || (unint64_t)objc_msgSend(v13, "count") > 1;
  else
    v23 = 0;
  if ((objc_msgSend(v20, "wf_proposedFileIsContainedByDirectoryAtURL:", v14) & 1) != 0)
  {
    -[WFDefaultFileStorageService _saveFiles:toURL:isDestinationKnownDirectory:options:progress:completionHandler:](self, "_saveFiles:toURL:isDestinationKnownDirectory:options:progress:completionHandler:", v19, v20, v23, a7, v15, v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "directoryTraversalError");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v25);

    v24 = 0;
  }

  return v24;
}

- (id)_saveFiles:(id)a3 toURL:(id)a4 isDestinationKnownDirectory:(BOOL)a5 options:(unint64_t)a6 progress:(id)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  WFStorageServiceCancellableOperation *v17;
  uint64_t v18;
  WFStorageServiceCancellableOperation *v19;
  WFStorageServiceCancellableOperation *v20;
  void *v21;
  WFStorageServiceCancellableOperation *v22;
  _QWORD v24[4];
  id v25;
  WFStorageServiceCancellableOperation *v26;
  id v27;
  _QWORD *v28;
  unint64_t v29;
  BOOL v30;
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  if (objc_msgSend(v13, "numberOfItems"))
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__35498;
    v32[4] = __Block_byref_object_dispose__35499;
    v33 = 0;
    v17 = [WFStorageServiceCancellableOperation alloc];
    v18 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke;
    v31[3] = &unk_24F8BB430;
    v31[4] = v32;
    v19 = -[WFStorageServiceCancellableOperation initWithCancelBlock:](v17, "initWithCancelBlock:", v31);
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_2;
    v24[3] = &unk_24F8B70C8;
    v25 = v14;
    v28 = v32;
    v29 = a6;
    v30 = a5;
    v20 = v19;
    v26 = v20;
    v27 = v16;
    objc_msgSend(v13, "getFileRepresentations:forType:", v24, 0);
    v21 = v27;
    v22 = v20;

    _Block_object_dispose(v32, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
    v22 = 0;
  }

  return v22;
}

- (void)getSharingURLsForFiles:(id)a3 usePublicURLs:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__WFDefaultFileStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke;
  v8[3] = &unk_24F8B9110;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "getFileRepresentations:forType:", v8, 0);

}

- (void)deleteFiles:(id)a3 deleteImmediately:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke;
  v9[3] = &unk_24F8B78B8;
  v11 = a4;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a3, "getFileRepresentations:forType:", v9, 0);

}

- (void)createFolderAtPath:(id)a3 inDirectory:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD *);
  void *v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__35498;
  v37 = __Block_byref_object_dispose__35499;
  v38 = 0;
  objc_msgSend(v9, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDefaultFileStorageService fileURLFromDirectory:path:](self, "fileURLFromDirectory:path:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "fileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "wf_proposedFileIsContainedByDirectoryAtURL:", v13);

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_opt_new();
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v28 = 0;
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __80__WFDefaultFileStorageService_createFolderAtPath_inDirectory_completionHandler___block_invoke;
    v24 = &unk_24F8B7050;
    v26 = &v29;
    v16 = v12;
    v25 = v16;
    v27 = &v33;
    objc_msgSend(v15, "coordinateWritingItemAtURL:options:error:byAccessor:", v16, 0, &v28, &v21);
    v17 = v28;
    v18 = v17;
    if (*((_BYTE *)v30 + 24))
    {
      objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:", v16, 24, v21, v22, v23, v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v19, v34[5]);

    }
    else
    {
      if (v34[5])
        v20 = v34[5];
      else
        v20 = (uint64_t)v17;
      v10[2](v10, 0, v20);
    }

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v10[2](v10, 0, 0);
  }

  _Block_object_dispose(&v33, 8);
}

- (void)retrieveFilesForAppendingAtPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  WFDefaultFileStorageService *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__WFDefaultFileStorageService_retrieveFilesForAppendingAtPath_completionHandler___block_invoke;
  v10[3] = &unk_24F8BAD90;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[WFDefaultFileStorageService retrieveFilesAtPath:options:progress:completionHandler:](self, "retrieveFilesAtPath:options:progress:completionHandler:", v9, 1, 0, v10);

}

- (void)moveFile:(id)a3 destination:(id)a4 withManagedLevel:(unint64_t)a5 progress:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  objc_msgSend(a3, "fileURL");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[WFDefaultFileStorageService _moveFile:replaceExisting:withManagedLevel:toDestination:progress:completionHandler:](self, "_moveFile:replaceExisting:withManagedLevel:toDestination:progress:completionHandler:", v15, 0, a5, v14, v13, v12);

}

- (void)moveFile:(id)a3 replaceExisting:(BOOL)a4 withManagedLevel:(unint64_t)a5 toDirectory:(id)a6 progress:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v11 = a4;
  v14 = a8;
  v15 = a7;
  v16 = a3;
  objc_msgSend(a6, "fileURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fileURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLByAppendingPathComponent:", v19);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "fileURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFDefaultFileStorageService _moveFile:replaceExisting:withManagedLevel:toDestination:progress:completionHandler:](self, "_moveFile:replaceExisting:withManagedLevel:toDestination:progress:completionHandler:", v20, v11, a5, v21, v15, v14);
}

- (void)_moveFile:(id)a3 replaceExisting:(BOOL)a4 withManagedLevel:(unint64_t)a5 toDestination:(id)a6 progress:(id)a7 completionHandler:(id)a8
{
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  BOOL v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v11 = a8;
  v12 = (void *)MEMORY[0x24BDD1568];
  v13 = a6;
  objc_msgSend(v12, "writingIntentWithURL:options:", a3, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1568], "writingIntentWithURL:options:", v13, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = v14;
  v27[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __115__WFDefaultFileStorageService__moveFile_replaceExisting_withManagedLevel_toDestination_progress_completionHandler___block_invoke;
  v22[3] = &unk_24F8B7180;
  v24 = v14;
  v25 = v11;
  v26 = a4;
  v23 = v15;
  v19 = v14;
  v20 = v15;
  v21 = v11;
  objc_msgSend(v17, "coordinateAccessWithIntents:queue:byAccessor:", v16, v18, v22);

}

- (void)appendText:(id)a3 toDirectory:(id)a4 subpath:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  WFDefaultFileStorageService *v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (!objc_msgSend(v15, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDefaultFileStorageService.m"), 441, CFSTR("Subpath length must be greater than zero when appending to text file."));

  }
  -[WFDefaultFileStorageService fileURLFromDirectory:path:](self, "fileURLFromDirectory:path:", v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __88__WFDefaultFileStorageService_appendText_toDirectory_subpath_options_completionHandler___block_invoke;
  v24[3] = &unk_24F8B71A8;
  v25 = v17;
  v26 = v14;
  v27 = self;
  v28 = v13;
  v29 = v15;
  v30 = v16;
  v31 = a6;
  v18 = v15;
  v19 = v13;
  v20 = v16;
  v21 = v14;
  v22 = v17;
  -[WFDefaultFileStorageService _retrieveFilesForAppendingAtURL:completionHandler:](self, "_retrieveFilesForAppendingAtURL:completionHandler:", v22, v24);

}

- (void)_retrieveFilesForAppendingAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(void *, _QWORD, void *);
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;
  WFDefaultFileStorageService *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19688]), "initWithFileURL:retrieveFolderContents:progress:", v6, 0, 0);
  objc_msgSend(v8, "start");
  objc_msgSend(v8, "waitUntilFinished");
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke;
  aBlock[3] = &unk_24F8BAD90;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  objc_msgSend(v8, "downloadedFiles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "downloadedFiles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "if_mapAsynchronously:completionHandler:", &__block_literal_global_186, v11);
  }
  else
  {
    objc_msgSend(v8, "downloadError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v13);
  }

}

- (void)searchFiles:(id)a3 inPath:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (BOOL)fileIsInProtectedList:(id)a3
{
  return 0;
}

- (void)createFolderAtPath:(id)a3 parentDirectoryItem:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "stringByStandardizingPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("/"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", &stru_24F8BBA48);

  if (v13)
  {
    objc_msgSend(v11, "subarrayWithRange:", 1, objc_msgSend(v11, "count") - 1);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __88__WFDefaultFileStorageService_createFolderAtPath_parentDirectoryItem_completionHandler___block_invoke;
  v16[3] = &unk_24F8B71F0;
  v17 = v9;
  v15 = v9;
  -[WFDefaultFileStorageService recursivelyCreateFolderAtPathWithComponents:withParentDirectoryItem:completionHandler:](self, "recursivelyCreateFolderAtPathWithComponents:withParentDirectoryItem:completionHandler:", v11, v8, v16);

}

- (void)recursivelyCreateFolderAtPathWithComponents:(id)a3 withParentDirectoryItem:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  WFDefaultFileStorageService *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length") && !objc_msgSend(v11, "isEqualToString:", CFSTR("/")))
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v12 = (void *)getFPCreateFolderOperationClass_softClass;
    v28 = getFPCreateFolderOperationClass_softClass;
    v13 = MEMORY[0x24BDAC760];
    if (!getFPCreateFolderOperationClass_softClass)
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __getFPCreateFolderOperationClass_block_invoke;
      v24[3] = &unk_24F8BB430;
      v24[4] = &v25;
      __getFPCreateFolderOperationClass_block_invoke((uint64_t)v24);
      v12 = (void *)v26[3];
    }
    v14 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v25, 8);
    v15 = (void *)objc_msgSend([v14 alloc], "initWithParentItem:folderName:", v9, v11);
    v17 = v13;
    v18 = 3221225472;
    v19 = __117__WFDefaultFileStorageService_recursivelyCreateFolderAtPathWithComponents_withParentDirectoryItem_completionHandler___block_invoke;
    v20 = &unk_24F8B7218;
    v23 = v10;
    v21 = self;
    v22 = v8;
    objc_msgSend(v15, "setCreateFolderCompletionBlock:", &v17);
    objc_msgSend(getFPItemManagerClass_35448(), "defaultManager", v17, v18, v19, v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scheduleAction:", v15);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v10 + 2))(v10, v9, 0);
  }

}

- (void)moveItem:(id)a3 replaceExisting:(BOOL)a4 withManagedLevel:(unint64_t)a5 toDirectory:(id)a6 progress:(id)a7 completionHandler:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = a8;
  objc_msgSend(v11, "providerDomainID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "providerDomainID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  v18 = MEMORY[0x24BDAC760];
  if ((v17 & 1) != 0)
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v19 = (void *)getFPMoveOperationClass_softClass;
    v45 = getFPMoveOperationClass_softClass;
    if (!getFPMoveOperationClass_softClass)
    {
      v37 = MEMORY[0x24BDAC760];
      v38 = 3221225472;
      v39 = __getFPMoveOperationClass_block_invoke;
      v40 = &unk_24F8BB430;
      v41 = &v42;
      __getFPMoveOperationClass_block_invoke((uint64_t)&v37);
      v19 = (void *)v43[3];
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v42, 8);
    v21 = [v20 alloc];
    v46 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithItems:destinationFolder:", v22, v12);
  }
  else
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v24 = (void *)getFPCopyOperationClass_softClass;
    v45 = getFPCopyOperationClass_softClass;
    if (!getFPCopyOperationClass_softClass)
    {
      v37 = MEMORY[0x24BDAC760];
      v38 = 3221225472;
      v39 = __getFPCopyOperationClass_block_invoke;
      v40 = &unk_24F8BB430;
      v41 = &v42;
      __getFPCopyOperationClass_block_invoke((uint64_t)&v37);
      v24 = (void *)v43[3];
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v42, 8);
    v26 = [v25 alloc];
    v47[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v26, "initWithItems:destinationFolder:", v22, v12);
  }
  v27 = (void *)v23;

  v31 = v18;
  v32 = 3221225472;
  v33 = __112__WFDefaultFileStorageService_moveItem_replaceExisting_withManagedLevel_toDirectory_progress_completionHandler___block_invoke;
  v34 = &unk_24F8B7158;
  v35 = v11;
  v36 = v14;
  v28 = v11;
  v29 = v14;
  objc_msgSend(v27, "setActionCompletionBlock:", &v31);
  objc_msgSend(getFPItemManagerClass_35448(), "defaultManager", v31, v32, v33, v34);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "scheduleAction:", v27);

}

- (void)renameItem:(id)a3 name:(id)a4 withManagedLevel:(unint64_t)a5 progress:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v14 = (void *)getFPRenameOperationClass_softClass;
  v28 = getFPRenameOperationClass_softClass;
  v15 = MEMORY[0x24BDAC760];
  if (!getFPRenameOperationClass_softClass)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __getFPRenameOperationClass_block_invoke;
    v24[3] = &unk_24F8BB430;
    v24[4] = &v25;
    __getFPRenameOperationClass_block_invoke((uint64_t)v24);
    v14 = (void *)v26[3];
  }
  v16 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v25, 8);
  v17 = (void *)objc_msgSend([v16 alloc], "initWithItem:newFileName:", v10, v11);
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __91__WFDefaultFileStorageService_renameItem_name_withManagedLevel_progress_completionHandler___block_invoke;
  v21[3] = &unk_24F8B7158;
  v22 = v10;
  v23 = v13;
  v18 = v10;
  v19 = v13;
  objc_msgSend(v17, "setActionCompletionBlock:", v21);
  objc_msgSend(getFPItemManagerClass_35448(), "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scheduleAction:", v17);

}

- (void)deleteItems:(id)a3 deleteImmediately:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v10 = (void *)getFPDeleteOperationClass_softClass;
    v28 = getFPDeleteOperationClass_softClass;
    if (!getFPDeleteOperationClass_softClass)
    {
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __getFPDeleteOperationClass_block_invoke;
      v23 = &unk_24F8BB430;
      v24 = &v25;
      __getFPDeleteOperationClass_block_invoke((uint64_t)&v20);
LABEL_6:
      v10 = (void *)v26[3];
    }
  }
  else
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v10 = (void *)getFPTrashOperationClass_softClass;
    v28 = getFPTrashOperationClass_softClass;
    if (!getFPTrashOperationClass_softClass)
    {
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __getFPTrashOperationClass_block_invoke;
      v23 = &unk_24F8BB430;
      v24 = &v25;
      __getFPTrashOperationClass_block_invoke((uint64_t)&v20);
      goto LABEL_6;
    }
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v25, 8);
  v12 = (void *)objc_msgSend([v11 alloc], "initWithItems:", v7);
  v15 = v9;
  v16 = 3221225472;
  v17 = __79__WFDefaultFileStorageService_deleteItems_deleteImmediately_completionHandler___block_invoke;
  v18 = &unk_24F8B8C28;
  v19 = v8;
  v13 = v8;
  objc_msgSend(v12, "setActionCompletionBlock:", &v15);
  objc_msgSend(getFPItemManagerClass_35448(), "defaultManager", v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scheduleAction:", v12);

}

- (id)saveFiles:(id)a3 withManagedLevel:(unint64_t)a4 toPath:(id)a5 options:(unint64_t)a6 progress:(id)a7 completionHandler:(id)a8
{
  (*((void (**)(id, _QWORD, _QWORD, unint64_t, id, unint64_t, id))a8 + 2))(a8, 0, 0, a4, a5, a6, a7);
  return 0;
}

- (void)createFolderAtPath:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)appendText:(id)a3 toPath:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD, _QWORD))a6 + 2))(a6, 0, 0);
}

- (BOOL)hasPublicURLs
{
  return 0;
}

- (Class)objectRepresentationClass
{
  return 0;
}

- (Class)accessResourceClass
{
  return (Class)objc_opt_class();
}

- (NSString)storageLocationPrefix
{
  return (NSString *)CFSTR("/Shortcuts/");
}

- (BOOL)supportsJumpingToSubdirectoryInUI
{
  return 0;
}

- (INAppDescriptor)associatedAppDescriptor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE19390], "platformFileManagerLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (INAppDescriptor *)v3;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_loadWeakRetained((id *)&self->_progress);
}

- (void)setProgress:(id)a3
{
  objc_storeWeak((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progress);
}

uint64_t __79__WFDefaultFileStorageService_deleteItems_deleteImmediately_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__WFDefaultFileStorageService_renameItem_name_withManagedLevel_progress_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(getFPItemManagerClass_35448(), "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "itemID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __91__WFDefaultFileStorageService_renameItem_name_withManagedLevel_progress_completionHandler___block_invoke_2;
    v5[3] = &unk_24F8B71F0;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "fetchItemForItemID:completionHandler:", v4, v5);

  }
}

void __91__WFDefaultFileStorageService_renameItem_name_withManagedLevel_progress_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE194F8];
  v6 = a3;
  objc_msgSend(a2, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileWithURL:options:", v7, 8);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __112__WFDefaultFileStorageService_moveItem_replaceExisting_withManagedLevel_toDirectory_progress_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(getFPItemManagerClass_35448(), "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "itemID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __112__WFDefaultFileStorageService_moveItem_replaceExisting_withManagedLevel_toDirectory_progress_completionHandler___block_invoke_2;
    v5[3] = &unk_24F8B71F0;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "fetchItemForItemID:completionHandler:", v4, v5);

  }
}

void __112__WFDefaultFileStorageService_moveItem_replaceExisting_withManagedLevel_toDirectory_progress_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE194F8];
  v6 = a3;
  objc_msgSend(a2, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileWithURL:options:", v7, 8);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __117__WFDefaultFileStorageService_recursivelyCreateFolderAtPathWithComponents_withParentDirectoryItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
LABEL_2:
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 40), "count") - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recursivelyCreateFolderAtPathWithComponents:withParentDirectoryItem:completionHandler:", v9, v5, *(_QWORD *)(a1 + 48));

LABEL_15:
    return;
  }
  objc_msgSend(v6, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = (uint64_t)&v24;
  v26 = 0x2020000000;
  v11 = (id *)getNSFileProviderErrorDomainSymbolLoc_ptr;
  v27 = (void *)getNSFileProviderErrorDomainSymbolLoc_ptr;
  if (!getNSFileProviderErrorDomainSymbolLoc_ptr)
  {
    v12 = FileProviderLibrary_35451();
    v11 = (id *)dlsym(v12, "NSFileProviderErrorDomain");
    *(_QWORD *)(v25 + 24) = v11;
    getNSFileProviderErrorDomainSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v24, 8);
  if (v11)
  {
    v13 = *v11;
    if (objc_msgSend(v10, "isEqualToString:", v13) && objc_msgSend(v7, "code") == -1001)
    {
      objc_msgSend(v7, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      getNSFileProviderErrorItemKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v30 = &v29;
      v31 = 0x2050000000;
      v17 = (void *)getFPItemClass_softClass;
      v32 = getFPItemClass_softClass;
      if (!getFPItemClass_softClass)
      {
        v24 = MEMORY[0x24BDAC760];
        v25 = 3221225472;
        v26 = (uint64_t)__getFPItemClass_block_invoke;
        v27 = &unk_24F8BB430;
        v28 = &v29;
        __getFPItemClass_block_invoke((uint64_t)&v24);
        v17 = (void *)v30[3];
      }
      v18 = objc_retainAutorelease(v17);
      _Block_object_dispose(&v29, 8);
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v7, "userInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        getNSFileProviderErrorItemKey();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v21);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        if (v5)
          goto LABEL_2;
      }
    }
    else
    {

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSErrorDomain getNSFileProviderErrorDomain(void)");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("WFDefaultFileStorageService.m"), 45, CFSTR("%s"), dlerror(), v24);

  __break(1u);
}

void __88__WFDefaultFileStorageService_createFolderAtPath_parentDirectoryItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    v6 = (void *)MEMORY[0x24BE194F8];
    objc_msgSend(a2, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileWithURL:options:", v7, 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    getWFFilesLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[WFDefaultFileStorageService createFolderAtPath:parentDirectoryItem:completionHandler:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_22D353000, v9, OS_LOG_TYPE_ERROR, "%s No item returned when creating folder recursively with error: %@", (uint8_t *)&v10, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
    goto LABEL_8;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    goto LABEL_7;
  if (objc_msgSend(v6, "code") == 4)
  {

    goto LABEL_6;
  }
  v8 = objc_msgSend(v6, "code");

  if (v8 == 260)
  {
LABEL_6:
    v9 = (void *)MEMORY[0x24BEC14A0];
    objc_msgSend(*(id *)(a1 + 32), "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "typeFromFilename:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *MEMORY[0x24BDF8510];
    if ((objc_msgSend(v7, "conformsToUTType:", *MEMORY[0x24BDF8510]) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingPathExtension:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke_2;
      v18[3] = &unk_24F8B9110;
      v17 = *(void **)(a1 + 40);
      v19 = *(id *)(a1 + 48);
      objc_msgSend(v17, "retrieveFilesAtPath:options:progress:completionHandler:", v16, 1, 0, v18);

      goto LABEL_9;
    }
LABEL_7:

  }
LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_9:

}

void __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a4;
  objc_msgSend(v5, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEC47D0]);

  if (v8)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    objc_msgSend(v5, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke_4;
    v10[3] = &unk_24F8BB130;
    v11 = v6;
    +[WFFileStorageServiceResult getResultWithFileURL:consumingBundleID:resultBlock:](WFFileStorageServiceResult, "getResultWithFileURL:consumingBundleID:resultBlock:", v9, 0, v10);

  }
}

uint64_t __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__WFDefaultFileStorageService__retrieveFilesForAppendingAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__WFDefaultFileStorageService_appendText_toDirectory_subpath_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "wf_proposedFileIsContainedByDirectoryAtURL:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v13 = *(_QWORD *)(a1 + 72);
    objc_msgSend((id)objc_opt_class(), "directoryTraversalError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

    goto LABEL_6;
  }
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v6, "code") == 4)
      {

LABEL_12:
        v17 = (void *)MEMORY[0x24BE194F8];
        objc_msgSend(*(id *)(a1 + 56), "dataUsingEncoding:", 4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fileWithData:ofType:proposedFilename:", v18, 0, v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x24BE19438];
        objc_msgSend(MEMORY[0x24BE19450], "itemWithFile:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v21;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "collectionWithItems:", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = *(void **)(a1 + 48);
        v24 = *(_QWORD *)(a1 + 32);
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __88__WFDefaultFileStorageService_appendText_toDirectory_subpath_options_completionHandler___block_invoke_2;
        v26[3] = &unk_24F8B9110;
        v27 = *(id *)(a1 + 72);
        v25 = (id)objc_msgSend(v23, "_saveFiles:toURL:isDestinationKnownDirectory:options:progress:completionHandler:", v11, v24, 0, 0, 0, v26);

        goto LABEL_4;
      }
      v16 = objc_msgSend(v6, "code");

      if (v16 == 260)
        goto LABEL_12;
    }
    else
    {

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_6;
  }
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wrappedURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BE194F8];
  objc_msgSend(v8, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileWithURL:options:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFAppendUtilities fileByAppendingText:toFile:options:](WFAppendUtilities, "fileByAppendingText:toFile:options:", *(_QWORD *)(a1 + 56), v11, *(_QWORD *)(a1 + 80));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

LABEL_4:
LABEL_6:

}

void __88__WFDefaultFileStorageService_appendText_toDirectory_subpath_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __115__WFDefaultFileStorageService__moveFile_replaceExisting_withManagedLevel_toDestination_progress_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v4 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v8 = (id *)&v15;
    objc_msgSend(v5, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v6, v7, 0, 1, 0, &v15);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v8 = (id *)&v14;
    objc_msgSend(v5, "moveItemAtURL:toURL:error:", v6, v7, &v14);
  }
  v9 = *v8;

  if (v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v10 = (void *)MEMORY[0x24BE194F8];
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileWithURL:options:", v11, 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = v12;
    else
      v13 = 0;
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v13, 0);

  }
}

void __81__WFDefaultFileStorageService_retrieveFilesForAppendingAtPath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
    goto LABEL_8;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    goto LABEL_7;
  if (objc_msgSend(v6, "code") == 4)
  {

    goto LABEL_6;
  }
  v8 = objc_msgSend(v6, "code");

  if (v8 == 260)
  {
LABEL_6:
    v9 = (void *)MEMORY[0x24BEC14A0];
    objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "typeFromFilename:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *MEMORY[0x24BDF8510];
    if ((objc_msgSend(v7, "conformsToUTType:", *MEMORY[0x24BDF8510]) & 1) == 0)
    {
      v12 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fileExtension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingPathExtension:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __81__WFDefaultFileStorageService_retrieveFilesForAppendingAtPath_completionHandler___block_invoke_2;
      v19[3] = &unk_24F8BABC0;
      v16 = *(void **)(a1 + 40);
      v17 = *(id *)(a1 + 48);
      v20 = v15;
      v21 = v17;
      v18 = v15;
      objc_msgSend(v16, "retrieveFilesAtPath:options:progress:completionHandler:", v18, 1, 0, v19);

      goto LABEL_9;
    }
LABEL_7:

  }
LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_9:

}

uint64_t __81__WFDefaultFileStorageService_retrieveFilesForAppendingAtPath_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

void __80__WFDefaultFileStorageService_createFolderAtPath_inDirectory_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;

}

void __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_3;
  v3[3] = &unk_24F8B78B8;
  v5 = *(_BYTE *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "if_mapAsynchronously:completionHandler:", &__block_literal_global_174, v3);

}

void __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 40))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v6;
    objc_msgSend(MEMORY[0x24BEC3D28], "documentsDirectoryWithError:", &v34);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v34;

    if (v9)
    {
      v26 = v10;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v11 = v5;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v31 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(MEMORY[0x24BDD1568], "writingIntentWithURL:options:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), 1, v26);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        }
        while (v13);
      }

      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_4;
      v27[3] = &unk_24F8B7158;
      v29 = *(id *)(a1 + 32);
      v28 = v8;
      objc_msgSend(v7, "coordinateAccessWithIntents:queue:byAccessor:", v28, v17, v27);

      v10 = v26;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

    v6 = v10;
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v18 = v5;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      while (2)
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0;
          objc_msgSend(v24, "trashItemAtURL:resultingItemURL:error:", v23, 0, &v35);
          v25 = v35;

          if (v25)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

            goto LABEL_23;
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v20)
          continue;
        break;
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
LABEL_23:

}

void __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;

  v6 = a4;
  objc_msgSend(a2, "originalURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a4)[2](v6, v7, 0);

}

void __79__WFDefaultFileStorageService_deleteFiles_deleteImmediately_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v14 = v3;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v10;
        objc_msgSend(v12, "removeItemAtURL:error:", v13, &v15);
        v7 = v15;

        if (v7)
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __86__WFDefaultFileStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__35498;
  v9[4] = __Block_byref_object_dispose__35499;
  v10 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__WFDefaultFileStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke_2;
  v8[3] = &unk_24F8B70F0;
  v8[4] = v9;
  objc_msgSend(v5, "if_compactMap:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  _Block_object_dispose(v9, 8);
}

id __86__WFDefaultFileStorageService_getSharingURLsForFiles_usePublicURLs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "originalURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDBCC80];
  v47[0] = *MEMORY[0x24BDBCC60];
  v5 = v47[0];
  v47[1] = v6;
  v48 = *MEMORY[0x24BDBCCA8];
  v7 = v48;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 3);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "promisedItemResourceValuesForKeys:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((v8 & 1) != 0 || v12)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    if ((v12 & 1) != 0)
    {
      WFLocalizedString(CFSTR("“%@” is a bundle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v21, v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("iCloud could not get a link to this %@ because it is a bundle (a bundle is a folder that acts like a file)."));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "wfType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "typeDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringWithFormat:", v24, v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WFLocalizedString(CFSTR("“%@” is a folder"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v27, v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      WFLocalizedString(CFSTR("iCloud could not get a link to this file because it is a folder. iCloud only supports getting links to regular files."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = *MEMORY[0x24BDD0FC8];
    v45[0] = *MEMORY[0x24BDD0FD8];
    v45[1] = v29;
    v46[0] = v15;
    v46[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD1128];
    v33 = 21;
    goto LABEL_10;
  }
  if ((v14 & 1) == 0)
  {
    v34 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("“%@” is not uploaded to iCloud"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringWithFormat:", v35, v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    WFLocalizedString(CFSTR("Could not get a link to this file because it must already be uploaded to iCloud."));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x24BDD0FC8];
    v43[0] = *MEMORY[0x24BDD0FD8];
    v43[1] = v37;
    v44[0] = v15;
    v44[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD1308];
    v33 = -1002;
LABEL_10:
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, v33, v30);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v40 = *(void **)(v39 + 40);
    *(_QWORD *)(v39 + 40) = v38;

    v17 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v42 = *(id *)(v16 + 40);
  objc_msgSend(v15, "URLForPublishingUbiquitousItemAtURL:expirationDate:error:", v4, 0, &v42);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v42;
  v19 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v18;
LABEL_11:

  return v17;
}

void __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "cancel");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id *v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t *v44;
  char v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  _QWORD v55[6];
  id obj;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  id *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _QWORD v71[2];
  _QWORD v72[4];

  v72[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v65 = 0;
  v66 = (id *)&v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__35498;
  v69 = __Block_byref_object_dispose__35499;
  v70 = 0;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 64);
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v9 = objc_opt_new();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = v66;
  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = v66[5];
  v14 = MEMORY[0x24BDAC760];
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_3;
  v55[3] = &unk_24F8B7028;
  v55[4] = &v61;
  v55[5] = &v57;
  objc_msgSend(v13, "coordinateReadingItemAtURL:options:error:byAccessor:", v7, 4, &obj, v55);
  objc_storeStrong(v12 + 5, obj);
  if (!*((_BYTE *)v62 + 24))
    *((_BYTE *)v58 + 24) = *(_BYTE *)(a1 + 72);
  if (!objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
  {
    v15 = v8 & 1;
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      if (!*((_BYTE *)v58 + 24) && ((v8 & 1) == 0 || !*((_BYTE *)v62 + 24)))
      {
        v25 = (void *)MEMORY[0x24BE194F8];
        objc_msgSend(v7, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "wfType");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "proposedFilenameForFile:ofType:", v26, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "URLByDeletingLastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "URLByAppendingPathComponent:", v29);
        v31 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v31;
      }
    }
    else if (!*((_BYTE *)v58 + 24))
    {
      objc_msgSend(v7, "wf_displayPath");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("The path you tried to save to (%@) is a file, but multiple files were provided. When saving multiple files at a time, you should specify a path to a folder instead."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithFormat:", v18, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BDD1540];
      v71[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("File already exists."));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = *MEMORY[0x24BDD0FC8];
      v72[0] = v21;
      v72[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 516, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v66[5];
      v66[5] = (id)v23;

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_22:

      goto LABEL_23;
    }
    if (!*((_BYTE *)v62 + 24))
    {
      if (*((_BYTE *)v58 + 24))
      {
        v32 = v7;
      }
      else
      {
        objc_msgSend(v7, "URLByDeletingLastPathComponent");
        v32 = (id)objc_claimAutoreleasedReturnValue();
      }
      v51 = 0;
      v52 = &v51;
      v53 = 0x2020000000;
      v54 = 0;
      v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v50 = 0;
      v46[0] = v14;
      v46[1] = 3221225472;
      v46[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_4;
      v46[3] = &unk_24F8B7050;
      v48 = &v51;
      v16 = v32;
      v47 = v16;
      v49 = &v65;
      objc_msgSend(v33, "coordinateWritingItemAtURL:options:error:byAccessor:", v16, 0, &v50, v46);
      v34 = v50;
      if (!*((_BYTE *)v52 + 24))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        _Block_object_dispose(&v51, 8);
        goto LABEL_22;
      }

      _Block_object_dispose(&v51, 8);
    }
    v38[0] = v14;
    v38[1] = 3221225472;
    v38[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_5;
    v38[3] = &unk_24F8B70A0;
    v41 = &v57;
    v7 = v7;
    v45 = v15;
    v35 = *(_QWORD *)(a1 + 56);
    v39 = v7;
    v42 = v35;
    v43 = &v65;
    v44 = &v61;
    v40 = *(id *)(a1 + 40);
    objc_msgSend(v5, "if_compactMap:", v38);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
      v37 = 0;
    else
      v37 = v36;
    (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v37, v66[5]);

    v16 = v39;
    goto LABEL_22;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_23:
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v65, 8);
}

void __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_4(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;

}

id __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  id obj;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(v3, "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v5;
  }
  if (*(_BYTE *)(a1 + 80))
  {
    v8 = 1;
LABEL_6:
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v9 + 40);
    v10 = objc_msgSend(v4, "writeToFileURL:overwriting:error:", v7, v8, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    if (v10 && !objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
    {
      objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:", v7, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      getWFFilesLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 136315394;
        v34 = "-[WFDefaultFileStorageService _saveFiles:toURL:isDestinationKnownDirectory:options:progress:completionHand"
              "ler:]_block_invoke_5";
        v35 = 2112;
        v36 = v12;
        _os_log_impl(&dword_22D353000, v11, OS_LOG_TYPE_ERROR, "%s Failed to save file with error %@", buf, 0x16u);
      }

      v13 = 0;
    }
    goto LABEL_18;
  }
  v27 = v4;
  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v32 = *(id *)(v17 + 40);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_6;
  v31[3] = &unk_24F8B7078;
  v31[4] = *(_QWORD *)(a1 + 72);
  objc_msgSend(v16, "coordinateReadingItemAtURL:options:error:byAccessor:", v7, 4, &v32, v31);
  objc_storeStrong((id *)(v17 + 40), v32);
  if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) == 0)
  {
    v19 = 2;
    while (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      objc_msgSend(v15, "stringByDeletingPathExtension");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByAppendingFormat:", CFSTR("-%lu"), v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pathExtension");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingPathExtension:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLByAppendingPathComponent:", v23);
      v18 = objc_claimAutoreleasedReturnValue();

      v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v30 = *(id *)(v25 + 40);
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_7;
      v29[3] = &unk_24F8B7078;
      v29[4] = *(_QWORD *)(a1 + 72);
      objc_msgSend(v24, "coordinateReadingItemAtURL:options:error:byAccessor:", v18, 4, &v30, v29);
      objc_storeStrong((id *)(v25 + 40), v30);
      ++v19;
      v7 = (id)v18;
      if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
        goto LABEL_16;
    }

    v8 = *(_BYTE *)(a1 + 80) != 0;
    v4 = v27;
    goto LABEL_6;
  }
  v18 = (uint64_t)v7;
LABEL_16:

  v13 = 0;
  v7 = (id)v18;
  v4 = v27;
LABEL_18:

  return v13;
}

void __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "fileExistsAtPath:", v5);
}

void __111__WFDefaultFileStorageService__saveFiles_toURL_isDestinationKnownDirectory_options_progress_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "fileExistsAtPath:", v5);
}

id __113__WFDefaultFileStorageService_saveFiles_withManagedLevel_toDirectory_subpath_options_progress_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE194F8];
  objc_msgSend(a2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileWithURL:options:", v3, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE19450], "itemWithFile:attributionSet:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __86__WFDefaultFileStorageService_retrieveFilesAtPath_options_progress_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a4;
  objc_msgSend(v5, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEC47D0]);

  if (v8)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    objc_msgSend(v5, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __86__WFDefaultFileStorageService_retrieveFilesAtPath_options_progress_completionHandler___block_invoke_2;
    v10[3] = &unk_24F8BB130;
    v11 = v6;
    +[WFFileStorageServiceResult getResultWithFileURL:consumingBundleID:resultBlock:](WFFileStorageServiceResult, "getResultWithFileURL:consumingBundleID:resultBlock:", v9, 0, v10);

  }
}

uint64_t __86__WFDefaultFileStorageService_retrieveFilesAtPath_options_progress_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __90__WFDefaultFileStorageService_retrieveFileAtPath_fromDirectory_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
    v8 = 0;
  else
    v8 = v3;

  return v8;
}

@end
