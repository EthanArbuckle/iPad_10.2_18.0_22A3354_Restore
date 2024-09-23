@implementation WFiCloudFileDownloadOperation

- (WFiCloudFileDownloadOperation)initWithFileURL:(id)a3 retrieveFolderContents:(BOOL)a4 progress:(id)a5
{
  id v10;
  id v11;
  WFiCloudFileDownloadOperation *v12;
  WFiCloudFileDownloadOperation *v13;
  uint64_t v14;
  NSFileCoordinator *fileCoordinator;
  WFiCloudFileDownloadOperation *v16;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFiCloudFileDownloadOperation.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

  }
  v19.receiver = self;
  v19.super_class = (Class)WFiCloudFileDownloadOperation;
  v12 = -[WFiCloudFileDownloadOperation init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fileURL, a3);
    v14 = objc_opt_new();
    fileCoordinator = v13->_fileCoordinator;
    v13->_fileCoordinator = (NSFileCoordinator *)v14;

    objc_storeStrong((id *)&v13->_progress, a5);
    v13->_retrieveFolderContents = a4;
    v16 = v13;
  }

  return v13;
}

- (void)start
{
  void *v3;
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  __int16 v17;

  -[WFiCloudFileDownloadOperation setExecuting:](self, "setExecuting:", 1);
  v17 = 0;
  -[WFiCloudFileDownloadOperation fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v15 = 0;
  -[WFiCloudFileDownloadOperation getFileInfoForURL:fileIsUbiquitous:fileIsDirectory:fileSize:error:](self, "getFileInfoForURL:fileIsUbiquitous:fileIsDirectory:fileSize:error:", v3, (char *)&v17 + 1, &v17, &v16, &v15);
  v4 = v16;
  v5 = v15;

  if (!v5)
  {
    v6 = v17;
    if (HIBYTE(v17) && (_BYTE)v17)
    {
      if (-[WFiCloudFileDownloadOperation retrieveFolderContents](self, "retrieveFolderContents"))
      {
        -[WFiCloudFileDownloadOperation fileURL](self, "fileURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __38__WFiCloudFileDownloadOperation_start__block_invoke;
        v14[3] = &unk_24C4E2330;
        v14[4] = self;
        -[WFiCloudFileDownloadOperation downloadDirectoryAtURL:completionHandler:](self, "downloadDirectoryAtURL:completionHandler:", v7, v14);
        goto LABEL_12;
      }
      v6 = v17;
    }
    if (v6 && -[WFiCloudFileDownloadOperation retrieveFolderContents](self, "retrieveFolderContents"))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFiCloudFileDownloadOperation fileURL](self, "fileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, MEMORY[0x24BDBD1A8], 0, &v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v13;
      objc_msgSend(v10, "if_compactMap:", &__block_literal_global_4087);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFiCloudFileDownloadOperation finishRunningWithFiles:error:](self, "finishRunningWithFiles:error:", v11, v5);
      goto LABEL_13;
    }
    -[WFiCloudFileDownloadOperation fileURL](self, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __38__WFiCloudFileDownloadOperation_start__block_invoke_3;
    v12[3] = &unk_24C4DCBB8;
    v12[4] = self;
    -[WFiCloudFileDownloadOperation downloadItemAtFileURL:ofSize:fileIsUbiquitous:completionHandler:](self, "downloadItemAtFileURL:ofSize:fileIsUbiquitous:completionHandler:", v7, v4, HIBYTE(v17), v12);
LABEL_12:

    v5 = 0;
    goto LABEL_13;
  }
  -[WFiCloudFileDownloadOperation finishRunningWithFiles:error:](self, "finishRunningWithFiles:error:", 0, v5);
LABEL_13:

}

- (void)getFileInfoForURL:(id)a3 fileIsUbiquitous:(BOOL *)a4 fileIsDirectory:(BOOL *)a5 fileSize:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  _QWORD v14[8];

  v12 = a3;
  -[WFiCloudFileDownloadOperation fileCoordinator](self, "fileCoordinator");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __99__WFiCloudFileDownloadOperation_getFileInfoForURL_fileIsUbiquitous_fileIsDirectory_fileSize_error___block_invoke;
  v14[3] = &__block_descriptor_64_e15_v16__0__NSURL_8l;
  v14[4] = a7;
  v14[5] = a4;
  v14[6] = a5;
  v14[7] = a6;
  objc_msgSend(v13, "coordinateReadingItemAtURL:options:error:byAccessor:", v12, 4, a7, v14);

}

- (void)downloadItemAtFileURL:(id)a3 ofSize:(id)a4 fileIsUbiquitous:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  WFiCloudFileDownloadOperation *v22;
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a6;
  v11 = a3;
  -[WFiCloudFileDownloadOperation progress](self, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTotalUnitCount:", objc_msgSend(v12, "totalUnitCount") + objc_msgSend(v9, "longLongValue"));

  objc_msgSend(MEMORY[0x24BDD1568], "readingIntentWithURL:options:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFiCloudFileDownloadOperation fileCoordinator](self, "fileCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __97__WFiCloudFileDownloadOperation_downloadItemAtFileURL_ofSize_fileIsUbiquitous_completionHandler___block_invoke;
  v20[3] = &unk_24C4DCC00;
  v21 = v13;
  v22 = self;
  v23 = v9;
  v24 = v10;
  v17 = v9;
  v18 = v10;
  v19 = v13;
  objc_msgSend(v14, "coordinateAccessWithIntents:queue:byAccessor:", v15, v16, v20);

}

- (void)downloadDirectoryAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "wf_fileSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke;
  v10[3] = &unk_24C4E1E38;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[WFiCloudFileDownloadOperation downloadItemAtFileURL:ofSize:fileIsUbiquitous:completionHandler:](self, "downloadItemAtFileURL:ofSize:fileIsUbiquitous:completionHandler:", v7, v8, 1, v10);

}

- (void)finishRunningWithFiles:(id)a3 error:(id)a4
{
  NSArray *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSError *downloadError;
  id v13;
  NSArray *downloadedFiles;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = (NSArray *)a3;
  v7 = (uint64_t)a4;
  if (!((unint64_t)v6 | v7))
  {
    -[WFiCloudFileDownloadOperation fileURL](self, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = *MEMORY[0x24BDBCD08];
    v9 = v15[0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resourceValuesForKeys:error:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v9);
    v7 = objc_claimAutoreleasedReturnValue();

  }
  downloadError = self->_downloadError;
  self->_downloadError = (NSError *)v7;
  v13 = (id)v7;

  downloadedFiles = self->_downloadedFiles;
  self->_downloadedFiles = v6;

  -[WFiCloudFileDownloadOperation setExecuting:](self, "setExecuting:", 0);
  -[WFiCloudFileDownloadOperation setFinished:](self, "setFinished:", 1);
}

- (void)setExecuting:(BOOL)a3
{
  -[WFiCloudFileDownloadOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_executing = a3;
  -[WFiCloudFileDownloadOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (void)setFinished:(BOOL)a3
{
  -[WFiCloudFileDownloadOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  self->_finished = a3;
  -[WFiCloudFileDownloadOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSArray)downloadedFiles
{
  return self->_downloadedFiles;
}

- (NSError)downloadError
{
  return self->_downloadError;
}

- (BOOL)retrieveFolderContents
{
  return self->_retrieveFolderContents;
}

- (NSFileCoordinator)fileCoordinator
{
  return self->_fileCoordinator;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
  objc_storeStrong((id *)&self->_downloadedFiles, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

void __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  uint64_t v13;
  id v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDBCC48];
  v15[0] = *MEMORY[0x24BDBCD20];
  v15[1] = v4;
  v15[2] = *MEMORY[0x24BDBCC60];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, v5, 0, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_17_4074);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_18;
  v12[3] = &unk_24C4DCC68;
  v9 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_3;
  v10[3] = &unk_24C4E1E88;
  v10[4] = v13;
  v11 = v9;
  objc_msgSend(v8, "if_enumerateAsynchronously:completionHandler:", v12, v10);

}

void __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_18(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v17[0] = *MEMORY[0x24BDBCC48];
  v7 = v17[0];
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a2;
  objc_msgSend(v8, "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resourceValuesForKeys:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_2_19;
  v15[3] = &unk_24C4E2ED8;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v13, "downloadItemAtFileURL:ofSize:fileIsUbiquitous:completionHandler:", v9, v12, 1, v15);

}

void __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, MEMORY[0x24BDBD1A8], 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_compactMap:", &__block_literal_global_21_4076);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", a2, 0);
}

uint64_t __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_2_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__WFiCloudFileDownloadOperation_downloadDirectoryAtURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v23[0] = *MEMORY[0x24BDBCD20];
  v3 = v23[0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v2, "resourceValuesForKeys:error:", v4, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  objc_msgSend(v5, "objectForKey:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v18 = *MEMORY[0x24BDBCC60];
    v8 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v6;
    objc_msgSend(v2, "resourceValuesForKeys:error:", v9, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;

    objc_msgSend(v10, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v12, "BOOLValue");

    v13 = (v8 | objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDBCD10])) ^ 1;
    v6 = v11;
  }
  else
  {
    getWFFilesLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[WFiCloudFileDownloadOperation downloadDirectoryAtURL:completionHandler:]_block_invoke_2";
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_20BBAD000, v14, OS_LOG_TYPE_ERROR, "%s Could not get download status with error: %@", buf, 0x16u);
    }

    v13 = 1;
  }

  return v13;
}

void __97__WFiCloudFileDownloadOperation_downloadItemAtFileURL_ofSize_fileIsUbiquitous_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v7 || !v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "progress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompletedUnitCount:", objc_msgSend(v5, "completedUnitCount") + objc_msgSend(*(id *)(a1 + 48), "longLongValue"));

    +[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __99__WFiCloudFileDownloadOperation_getFileInfoForURL_fileIsUbiquitous_fileIsDirectory_fileSize_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v5 = *MEMORY[0x24BDBCC60];
  v17[0] = *MEMORY[0x24BDBCCA8];
  v4 = v17[0];
  v17[1] = v5;
  v6 = *MEMORY[0x24BDBCC80];
  v17[2] = *MEMORY[0x24BDBCC80];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "promisedItemResourceValuesForKeys:error:", v7, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  **(_BYTE **)(a1 + 40) = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v8, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "BOOLValue"))
  {
    objc_msgSend(v8, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue") ^ 1;

  }
  else
  {
    v12 = 0;
  }

  **(_BYTE **)(a1 + 48) = v12;
  if (v8 && (v12 & 1) == 0)
  {
    v16 = *MEMORY[0x24BDBCC48];
    v13 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "promisedItemResourceValuesForKeys:error:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v13);
    **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();

  }
}

uint64_t __38__WFiCloudFileDownloadOperation_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithFiles:error:", a2, a3);
}

void __38__WFiCloudFileDownloadOperation_start__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v9 = a2;
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = a3;
    v7 = a2;
    objc_msgSend(v5, "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishRunningWithFiles:error:", v8, v6, v9, v10);

  }
  else
  {
    v7 = a3;
    objc_msgSend(v3, "finishRunningWithFiles:error:", 0, v7);
    v8 = 0;
  }

}

id __38__WFiCloudFileDownloadOperation_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", a2, 0);
}

@end
