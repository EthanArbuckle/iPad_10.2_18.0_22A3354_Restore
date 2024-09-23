@implementation WFDropboxSessionManager

- (WFDropboxSessionManager)init
{
  return -[WFDropboxSessionManager initWithSessionConfiguration:](self, "initWithSessionConfiguration:", 0);
}

- (WFDropboxSessionManager)initWithSessionConfiguration:(id)a3
{
  id v4;
  WFDropboxSessionManager *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURLSession *session;
  uint64_t v10;
  NSURL *baseURL;
  uint64_t v12;
  NSURL *contentBaseURL;
  uint64_t v14;
  NSMapTable *progressTable;
  WFDropboxSessionManager *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFDropboxSessionManager;
  v5 = -[WFDropboxSessionManager init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDB74B0];
    v7 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDB74B8], "wf_defaultSessionConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "sessionWithConfiguration:delegate:delegateQueue:", v7, v5, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    session = v5->_session;
    v5->_session = (NSURLSession *)v8;

    if (!v4)
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.dropboxapi.com/2"));
    v10 = objc_claimAutoreleasedReturnValue();
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v10;

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://content.dropboxapi.com/2"));
    v12 = objc_claimAutoreleasedReturnValue();
    contentBaseURL = v5->_contentBaseURL;
    v5->_contentBaseURL = (NSURL *)v12;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    progressTable = v5->_progressTable;
    v5->_progressTable = (NSMapTable *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)getItemAtPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v12 = CFSTR("path");
  WFDropboxProcessPath(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__WFDropboxSessionManager_getItemAtPath_completionHandler___block_invoke;
  v10[3] = &unk_24F8BAE00;
  v11 = v6;
  v9 = v6;
  -[WFDropboxSessionManager sendRPCRequestWithPath:parameters:completionHandler:](self, "sendRPCRequestWithPath:parameters:completionHandler:", CFSTR("files/get_metadata"), v8, v10);

}

- (void)getContentsOfFolderAtPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("path");
  v6 = a4;
  WFDropboxProcessPath(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("recursive");
  v10[0] = v7;
  v10[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDropboxSessionManager getContentsOfFolderWithParameters:previous:completionHandler:](self, "getContentsOfFolderWithParameters:previous:completionHandler:", v8, MEMORY[0x24BDBD1A8], v6);

}

- (void)getContentsOfFolderWithParameters:(id)a3 previous:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  WFDropboxSessionManager *v18;
  id v19;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cursor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("files/list_folder/continue");
  if (!v11)
    v12 = CFSTR("files/list_folder");
  v13 = v12;

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __88__WFDropboxSessionManager_getContentsOfFolderWithParameters_previous_completionHandler___block_invoke;
  v16[3] = &unk_24F8BB298;
  v18 = self;
  v19 = v9;
  v17 = v8;
  v14 = v8;
  v15 = v9;
  -[WFDropboxSessionManager sendRPCRequestWithPath:parameters:completionHandler:](self, "sendRPCRequestWithPath:parameters:completionHandler:", v13, v10, v16);

}

- (void)createFolderAtPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v12 = CFSTR("path");
  WFDropboxProcessPath(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__WFDropboxSessionManager_createFolderAtPath_completionHandler___block_invoke;
  v10[3] = &unk_24F8BAE00;
  v11 = v6;
  v9 = v6;
  -[WFDropboxSessionManager sendRPCRequestWithPath:parameters:completionHandler:](self, "sendRPCRequestWithPath:parameters:completionHandler:", CFSTR("files/create_folder"), v8, v10);

}

- (id)saveFile:(id)a3 toPath:(id)a4 overwrite:(BOOL)a5 progress:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  WFStorageServiceCancellableOperation *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  WFStorageServiceCancellableOperation *v41;
  id v42;
  WFDropboxSessionManager *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  WFDropboxSessionManager *v50;
  id v51;
  id v52;
  id v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  _QWORD aBlock[4];
  id v61;
  _QWORD *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  void *(*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD *v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[5];
  id v76;
  _QWORD v77[4];
  _QWORD v78[6];

  v9 = a5;
  v78[4] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v44 = a4;
  v13 = a6;
  v14 = a7;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = __Block_byref_object_copy__47478;
  v75[4] = __Block_byref_object_dispose__47479;
  v15 = v12;
  v76 = v15;
  objc_msgSend(v15, "modificationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v43 = self;
  if (v16)
  {
    v45 = v16;
  }
  else
  {
    objc_msgSend(v15, "creationDate");
    v45 = (id)objc_claimAutoreleasedReturnValue();
  }

  v77[0] = CFSTR("path");
  WFDropboxProcessPath(v44);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = CFSTR("add");
  if (v9)
    v20 = CFSTR("overwrite");
  v78[0] = v18;
  v78[1] = v20;
  v77[1] = CFSTR("mode");
  v77[2] = CFSTR("autorename");
  v21 = MEMORY[0x24BDBD1C8];
  if (v9)
    v21 = MEMORY[0x24BDBD1C0];
  v78[2] = v21;
  v77[3] = CFSTR("client_modified");
  +[WFDropboxMetadata clientModifiedDateJSONTransformer](WFDropboxMetadata, "clientModifiedDateJSONTransformer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reverseTransformedValue:", v45);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v15, "fileSize");
  objc_msgSend(v13, "setTotalUnitCount:", v25);
  objc_msgSend(v13, "setCompletedUnitCount:", 0);
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = __Block_byref_object_copy__47478;
  v73[4] = __Block_byref_object_dispose__47479;
  v74 = 0;
  v26 = (void *)objc_opt_new();
  v27 = [WFStorageServiceCancellableOperation alloc];
  v28 = MEMORY[0x24BDAC760];
  v70[0] = MEMORY[0x24BDAC760];
  v70[1] = 3221225472;
  v70[2] = __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke;
  v70[3] = &unk_24F8BB688;
  v29 = v26;
  v71 = v29;
  v72 = v73;
  v41 = -[WFStorageServiceCancellableOperation initWithCancelBlock:](v27, "initWithCancelBlock:", v70);
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__159;
  v68 = __Block_byref_object_dispose__160;
  v69 = 0;
  aBlock[0] = v28;
  aBlock[1] = 3221225472;
  aBlock[2] = __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_161;
  aBlock[3] = &unk_24F8BAE28;
  v30 = v14;
  v61 = v30;
  v62 = v75;
  v63 = &v64;
  v31 = _Block_copy(aBlock);
  v46[0] = v28;
  v46[1] = 3221225472;
  v46[2] = __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_2;
  v46[3] = &unk_24F8BAEA0;
  v57 = 157286400;
  v58 = v25;
  v32 = v13;
  v47 = v32;
  v42 = v15;
  v48 = v42;
  v59 = (v25 + 157286399) / 0x9600000uLL;
  v33 = v29;
  v54 = v73;
  v49 = v33;
  v50 = v43;
  v34 = v24;
  v51 = v34;
  v35 = v31;
  v52 = v35;
  v36 = v30;
  v53 = v36;
  v55 = v75;
  v56 = &v64;
  v37 = _Block_copy(v46);
  v38 = _Block_copy(v37);
  v39 = (void *)v65[5];
  v65[5] = (uint64_t)v38;

  (*((void (**)(void *, _QWORD, _QWORD))v37 + 2))(v37, 0, 0);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);

  return v41;
}

- (void)deleteItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v12 = CFSTR("path");
  objc_msgSend(a3, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__WFDropboxSessionManager_deleteItem_completionHandler___block_invoke;
  v10[3] = &unk_24F8BAE00;
  v11 = v6;
  v9 = v6;
  -[WFDropboxSessionManager sendRPCRequestWithPath:parameters:completionHandler:](self, "sendRPCRequestWithPath:parameters:completionHandler:", CFSTR("files/delete"), v8, v10);

}

- (void)getSharedLinkForFile:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15[0] = CFSTR("path");
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("settings");
  v16[0] = v8;
  v16[1] = &unk_24F93C6A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__WFDropboxSessionManager_getSharedLinkForFile_completionHandler___block_invoke;
  v12[3] = &unk_24F8BB298;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[WFDropboxSessionManager sendRPCRequestWithPath:parameters:completionHandler:](self, "sendRPCRequestWithPath:parameters:completionHandler:", CFSTR("sharing/create_shared_link_with_settings"), v9, v12);

}

- (void)getExistingSharedLinkForFile:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v12 = CFSTR("path");
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__WFDropboxSessionManager_getExistingSharedLinkForFile_completionHandler___block_invoke;
  v10[3] = &unk_24F8BAE00;
  v11 = v6;
  v9 = v6;
  -[WFDropboxSessionManager sendRPCRequestWithPath:parameters:completionHandler:](self, "sendRPCRequestWithPath:parameters:completionHandler:", CFSTR("sharing/list_shared_links"), v8, v10);

}

- (void)downloadFile:(id)a3 ofType:(id)a4 proposedFilename:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v11;
  if (!v11)
  {
    v15 = (void *)MEMORY[0x24BEC14A0];
    objc_msgSend(v10, "name");
    a6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "typeFromFilename:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v12;
  if (!v12)
  {
    objc_msgSend(v10, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = CFSTR("path");
  objc_msgSend(v10, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __82__WFDropboxSessionManager_downloadFile_ofType_proposedFilename_completionHandler___block_invoke;
  v20[3] = &unk_24F8BAF08;
  v19 = v13;
  v21 = v19;
  -[WFDropboxSessionManager sendContentDownloadRequestWithPath:ofType:proposedFilename:parameters:progress:completionHandler:](self, "sendContentDownloadRequestWithPath:ofType:proposedFilename:parameters:progress:completionHandler:", CFSTR("files/download"), v14, v16, v18, 0, v20);

  if (!v12)
  {

    if (v11)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v11)
    goto LABEL_9;
LABEL_7:

}

- (void)searchFiles:(id)a3 inPath:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x24BDBCED8];
  v11 = a3;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithDictionary:", &unk_24F93C6D0);
  if (v8)
  {
    WFDropboxProcessPath(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("path"));

  }
  v18[0] = CFSTR("query");
  v18[1] = CFSTR("options");
  v19[0] = v11;
  v19[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __64__WFDropboxSessionManager_searchFiles_inPath_completionHandler___block_invoke;
  v16[3] = &unk_24F8BAE00;
  v17 = v9;
  v15 = v9;
  -[WFDropboxSessionManager sendRPCRequestWithPath:parameters:completionHandler:](self, "sendRPCRequestWithPath:parameters:completionHandler:", CFSTR("files/search_v2"), v14, v16);

}

- (void)sendContentDownloadRequestWithPath:(id)a3 ofType:(id)a4 proposedFilename:(id)a5 parameters:(id)a6 progress:(id)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;

  v13 = a4;
  v14 = a5;
  v15 = a8;
  v16 = (objc_class *)MEMORY[0x24BDB7458];
  v17 = a6;
  v18 = a3;
  v19 = [v16 alloc];
  -[WFDropboxSessionManager contentBaseURL](self, "contentBaseURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "URLByAppendingPathComponent:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(v19, "initWithURL:", v21);
  objc_msgSend(v22, "_setNonAppInitiated:", 1);
  v23 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v17, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(v23, "initWithData:encoding:", v24, 4);
  objc_msgSend(v22, "setValue:forHTTPHeaderField:", v25, CFSTR("Dropbox-API-Arg"));

  -[WFDropboxSessionManager credential](self, "credential");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "wfo_setAuthorizationWithCredential:", v26);

  -[WFDropboxSessionManager session](self, "session");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __124__WFDropboxSessionManager_sendContentDownloadRequestWithPath_ofType_proposedFilename_parameters_progress_completionHandler___block_invoke;
  v32[3] = &unk_24F8BAF30;
  v33 = v13;
  v34 = v14;
  v35 = v15;
  v28 = v15;
  v29 = v14;
  v30 = v13;
  objc_msgSend(v27, "downloadTaskWithRequest:completionHandler:", v22, v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "resume");
}

- (id)sendContentUploadRequestWithPath:(id)a3 parameters:(id)a4 data:(id)a5 inputStream:(id)a6 progress:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  unint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  void *v39;
  id v40;
  _QWORD aBlock[5];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v14 = a3;
  v15 = a4;
  v40 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)MEMORY[0x24BDB7458];
  -[WFDropboxSessionManager contentBaseURL](self, "contentBaseURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v14;
  objc_msgSend(v20, "URLByAppendingPathComponent:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "requestWithURL:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v15;
  objc_msgSend(v22, "_setNonAppInitiated:", 1);
  objc_msgSend(v22, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v22, "setValue:forHTTPHeaderField:", CFSTR("application/octet-stream"), CFSTR("Content-Type"));
  -[WFDropboxSessionManager credential](self, "credential");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "wfo_setAuthorizationWithCredential:", v24);

  if (v15)
  {
    v37 = v18;
    v38 = v15;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v15, 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v25, 4);
    v27 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (objc_msgSend(v26, "length"))
    {
      v28 = 0;
      do
      {
        objc_msgSend(v26, "substringWithRange:", v28, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "canBeConvertedToEncoding:", 1))
          objc_msgSend(v27, "appendString:", v29);
        else
          objc_msgSend(v27, "appendFormat:", CFSTR("\\u%04x"), objc_msgSend(v26, "characterAtIndex:", v28));

        ++v28;
      }
      while (v28 < objc_msgSend(v26, "length"));
    }
    objc_msgSend(v27, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\/"), CFSTR("/"), 2, 0, objc_msgSend(v27, "length"));

    objc_msgSend(v22, "setValue:forHTTPHeaderField:", v27, CFSTR("Dropbox-API-Arg"));
    v18 = v37;
    v23 = v38;
  }
  v44 = 0;
  v45 = (id *)&v44;
  v46 = 0x3042000000;
  v47 = __Block_byref_object_copy__240;
  v48 = __Block_byref_object_dispose__241;
  v49 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __115__WFDropboxSessionManager_sendContentUploadRequestWithPath_parameters_data_inputStream_progress_completionHandler___block_invoke;
  aBlock[3] = &unk_24F8BAF58;
  aBlock[4] = self;
  v43 = &v44;
  v30 = v18;
  v42 = v30;
  v31 = _Block_copy(aBlock);
  if (v16)
  {
    objc_msgSend(v22, "setHTTPBodyStream:", v16);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v16, "length"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setValue:forHTTPHeaderField:", v32, CFSTR("Content-Length"));

    -[WFDropboxSessionManager session](self, "session");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dataTaskWithRequest:completionHandler:", v22, v31);
  }
  else
  {
    -[WFDropboxSessionManager session](self, "session");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "uploadTaskWithRequest:fromData:completionHandler:", v22, v40, v31);
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeWeak(v45 + 5, v34);
  if (v17)
  {
    -[WFDropboxSessionManager progressTable](self, "progressTable");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKey:", v17, v34);

  }
  objc_msgSend(v34, "resume");

  _Block_object_dispose(&v44, 8);
  objc_destroyWeak(&v49);

  return v34;
}

- (void)sendRPCRequestWithPath:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v8 = a5;
  v9 = (void *)MEMORY[0x24BDB7458];
  v10 = a4;
  v11 = a3;
  -[WFDropboxSessionManager baseURL](self, "baseURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "requestWithURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "_setNonAppInitiated:", 1);
  objc_msgSend(v14, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v10, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setHTTPBody:", v15);
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", CFSTR("application/json; charset=utf-8"), CFSTR("Content-Type"));
  -[WFDropboxSessionManager credential](self, "credential");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "wfo_setAuthorizationWithCredential:", v16);

  -[WFDropboxSessionManager session](self, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __79__WFDropboxSessionManager_sendRPCRequestWithPath_parameters_completionHandler___block_invoke;
  v20[3] = &unk_24F8BB3E0;
  v21 = v8;
  v18 = v8;
  objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v14, v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resume");

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v9;
  void *v10;
  id v11;

  v9 = a4;
  -[WFDropboxSessionManager progressTable](self, "progressTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setCompletedUnitCount:", a6);
}

- (WFOAuth2Credential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSURL)contentBaseURL
{
  return self->_contentBaseURL;
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSMapTable)progressTable
{
  return self->_progressTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTable, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_contentBaseURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

void __79__WFDropboxSessionManager_sendRPCRequestWithPath_parameters_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v11 = v7;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;

    v7 = v9;
    if (v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = 0;
  if (!v7)
  {
LABEL_3:
    WFDropboxErrorFromResponseObject(v8, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v8, v7);

}

void __115__WFDropboxSessionManager_sendContentUploadRequestWithPath_parameters_data_inputStream_progress_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "progressTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(v8, "objectForKey:", WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "totalUnitCount"));
  objc_msgSend(*(id *)(a1 + 32), "progressTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(v11, "removeObjectForKey:", v12);

  if (objc_msgSend(v6, "length"))
  {
    v16 = v7;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 4, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;

    v7 = v14;
    if (v14)
      goto LABEL_8;
  }
  else
  {
    v13 = 0;
    if (v7)
      goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WFDropboxErrorFromResponseObject(v13, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
LABEL_8:
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, void *, id))(v15 + 16))(v15, v13, v7);

}

void __124__WFDropboxSessionManager_sendContentDownloadRequestWithPath_ofType_proposedFilename_parameters_progress_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v7 = a2;
  v8 = a4;
  objc_msgSend(a3, "allHeaderFields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("Dropbox-API-Result"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    v15 = v8;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v11, 0, &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;

    v8 = v13;
    if (v13)
      goto LABEL_6;
  }
  else
  {
    v12 = 0;
    if (v8)
      goto LABEL_6;
  }
  WFDropboxErrorFromResponseObject(v12, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:ofType:proposedFilename:", v7, 3, a1[4], a1[5]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_6:
  v14 = 0;
LABEL_7:
  (*(void (**)(void))(a1[6] + 16))();

}

void __64__WFDropboxSessionManager_searchFiles_inPath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("matches"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BEC3A08];
    v10 = objc_opt_class();
    objc_msgSend(v8, "valueForKeyPath:", CFSTR("metadata.metadata"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v5;
    objc_msgSend(v9, "modelsOfClass:fromJSONArray:error:", v10, v11, &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;

    v5 = v13;
  }
  else
  {
    v12 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __82__WFDropboxSessionManager_downloadFile_ofType_proposedFilename_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && !v9)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v8, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
  }
  objc_msgSend(v7, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientModifiedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "setResourceValue:forKey:error:", v13, *MEMORY[0x24BDBCBE0], 0);
  }
  else
  {
    objc_msgSend(v11, "serverModifiedDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setResourceValue:forKey:error:", v14, *MEMORY[0x24BDBCBE0], 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __74__WFDropboxSessionManager_getExistingSharedLinkForFile_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("links"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_compactMap:", &__block_literal_global_47457);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __74__WFDropboxSessionManager_getExistingSharedLinkForFile_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("link_permissions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("requested_visibility"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR(".tag"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  WFEnforceClass(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isEqualToString:", CFSTR("public")))
    v12 = v2;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

void __66__WFDropboxSessionManager_getSharedLinkForFile_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("WFDropboxErrorDomain")))
  {
    v7 = objc_msgSend(v5, "code");

    if (v7 == 110)
    {
      objc_msgSend(*(id *)(a1 + 32), "getExistingSharedLinkForFile:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  WFEnforceClass(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_9:
}

void __56__WFDropboxSessionManager_deleteItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (v5 && !v6)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v5, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v8, v7);

}

uint64_t __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cancel");
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

void __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_161(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = a3;
  v6 = a2;
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (!v5 && v8)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v8, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
  }
  v10 = a1[4];
  if (v10)
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v9, v5);
  v11 = *(_QWORD *)(a1[5] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

  v13 = *(_QWORD *)(a1[6] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

}

void __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  WFFileChunkInputStream *v10;
  void *v11;
  WFFileChunkInputStream *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(_QWORD *, uint64_t, uint64_t);
  void *v39;
  id v40;
  id v41;
  __int128 v42;
  uint64_t v43;
  _QWORD aBlock[4];
  id v45;
  __int128 v46;
  uint64_t v47;
  const __CFString *v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 112);
  v7 = v6 * a2;
  if (*(_QWORD *)(a1 + 120) - v6 * a2 >= v6)
    v8 = *(_QWORD *)(a1 + 112);
  else
    v8 = *(_QWORD *)(a1 + 120) - v6 * a2;
  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:");
  objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", *(_QWORD *)(a1 + 112));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resignCurrent");
  if (objc_msgSend(*(id *)(a1 + 40), "representationType"))
  {
    v10 = [WFFileChunkInputStream alloc];
    objc_msgSend(*(id *)(a1 + 40), "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFFileChunkInputStream initWithURL:offset:length:](v10, "initWithURL:offset:length:", v11, v7, v8);
    v13 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subdataWithRange:", v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
  }

  if (!a2)
  {
    if (*(_QWORD *)(a1 + 128) >= 2uLL)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_3;
      aBlock[3] = &unk_24F8BAE50;
      v45 = *(id *)(a1 + 80);
      v46 = *(_OWORD *)(a1 + 96);
      v47 = 0;
      v26 = _Block_copy(aBlock);
      objc_msgSend(*(id *)(a1 + 48), "lock");
      objc_msgSend(*(id *)(a1 + 56), "sendContentUploadRequestWithPath:parameters:data:inputStream:progress:completionHandler:", CFSTR("files/upload_session/start"), 0, v13, v12, v9, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v29 = *(void **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = v27;

      objc_msgSend(*(id *)(a1 + 48), "unlock");
      v15 = v45;
      goto LABEL_17;
    }
    v15 = 0;
    goto LABEL_14;
  }
  v52[0] = CFSTR("session_id");
  v52[1] = CFSTR("offset");
  v53[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(_QWORD *)(a1 + 128);
  v17 = v16 > 1;
  v18 = v16 - 1;
  if (!v17)
  {
LABEL_14:
    objc_msgSend(*(id *)(a1 + 48), "lock");
    objc_msgSend(*(id *)(a1 + 56), "sendContentUploadRequestWithPath:parameters:data:inputStream:progress:completionHandler:", CFSTR("files/upload"), *(_QWORD *)(a1 + 64), v13, v12, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

    objc_msgSend(*(id *)(a1 + 48), "unlock");
    goto LABEL_17;
  }
  if (v18 == a2)
  {
    v20 = *(void **)(a1 + 56);
    v19 = *(_QWORD *)(a1 + 64);
    v50[0] = CFSTR("commit");
    v50[1] = CFSTR("cursor");
    v51[0] = v19;
    v51[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v20, "sendContentUploadRequestWithPath:parameters:data:inputStream:progress:completionHandler:", CFSTR("files/upload_session/finish"), v21, v13, v12, v9, *(_QWORD *)(a1 + 72));

  }
  else
  {
    v36 = MEMORY[0x24BDAC760];
    v37 = 3221225472;
    v38 = __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_4;
    v39 = &unk_24F8BAE78;
    v41 = *(id *)(a1 + 80);
    v42 = *(_OWORD *)(a1 + 96);
    v43 = a2;
    v40 = v5;
    v30 = _Block_copy(&v36);
    objc_msgSend(*(id *)(a1 + 48), "lock", v36, v37, v38, v39);
    v31 = *(void **)(a1 + 56);
    v48 = CFSTR("cursor");
    v49 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sendContentUploadRequestWithPath:parameters:data:inputStream:progress:completionHandler:", CFSTR("files/upload_session/append_v2"), v32, v13, v12, v9, v30);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v35 = *(void **)(v34 + 40);
    *(_QWORD *)(v34 + 40) = v33;

    objc_msgSend(*(id *)(a1 + 48), "unlock");
  }
LABEL_17:

}

void __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = a3;
  v6 = a2;
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("session_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  WFEnforceClass(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 || !v10)
  {
    (*(void (**)(void))(a1[4] + 16))();
    v11 = *(_QWORD *)(a1[5] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) + 16))();
  }

}

void __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a3)
  {
    (*(void (**)(void))(a1[5] + 16))();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    v6 = *(_QWORD *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) + 16))();
  }
}

void __64__WFDropboxSessionManager_createFolderAtPath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (v5 && !v6)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v5, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v8, v7);

}

void __88__WFDropboxSessionManager_getContentsOfFolderWithParameters_previous_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("entries"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    WFEnforceClass(v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v25 = 0;
      objc_msgSend(MEMORY[0x24BEC3A08], "modelsOfClass:fromJSONArray:error:", objc_opt_class(), v10, &v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v25;
      if (!v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("has_more"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_opt_class();
        WFEnforceClass(v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "BOOLValue");

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cursor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_class();
        WFEnforceClass(v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 && v20)
        {
          v21 = *(void **)(a1 + 40);
          v26 = CFSTR("cursor");
          v27 = v20;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "getContentsOfFolderWithParameters:previous:completionHandler:", v22, v13, *(_QWORD *)(a1 + 48));
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = v23;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sortedArrayUsingDescriptors:", v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }

        v7 = 0;
        goto LABEL_13;
      }
      v7 = v12;
    }
    else
    {
      v7 = 0;
      v11 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_13:

    goto LABEL_14;
  }
  v7 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_14:

}

void __59__WFDropboxSessionManager_getItemAtPath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (v5 && !v6)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v5, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v8, v7);

}

@end
