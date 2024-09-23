@implementation WFImgurSessionManager

- (WFImgurSessionManager)initWithClientID:(id)a3
{
  return -[WFImgurSessionManager initWithClientID:configuration:](self, "initWithClientID:configuration:", a3, 0);
}

- (WFImgurSessionManager)initWithClientID:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  WFImgurSessionManager *v8;
  uint64_t v9;
  NSString *clientID;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURLSession *session;
  uint64_t v15;
  NSURL *baseURL;
  uint64_t v17;
  NSMapTable *progressTable;
  WFImgurSessionManager *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFImgurSessionManager;
  v8 = -[WFImgurSessionManager init](&v21, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    clientID = v8->_clientID;
    v8->_clientID = (NSString *)v9;

    v11 = (void *)MEMORY[0x24BDB74B0];
    v12 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDB74B8], "wf_defaultSessionConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "sessionWithConfiguration:delegate:delegateQueue:", v12, v8, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    session = v8->_session;
    v8->_session = (NSURLSession *)v13;

    if (!v7)
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.imgur.com/3/"));
    v15 = objc_claimAutoreleasedReturnValue();
    baseURL = v8->_baseURL;
    v8->_baseURL = (NSURL *)v15;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    progressTable = v8->_progressTable;
    v8->_progressTable = (NSMapTable *)v17;

    v19 = v8;
  }

  return v8;
}

- (void)uploadImage:(id)a3 title:(id)a4 description:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v45[4];
  id v46;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setValue:forKey:", v14, CFSTR("title"));

  objc_msgSend(v16, "setValue:forKey:", v13, CFSTR("description"));
  v17 = (void *)MEMORY[0x24BDD17C8];
  v18 = arc4random();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("Boundary+%08X%08X"), v18, arc4random());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("--%@\r\n"), v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dataUsingEncoding:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendData:", v22);

  v23 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v15, "filename");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("Content-Disposition: form-data; name=\"image\"; filename=\"%@\"\r\n"),
    v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dataUsingEncoding:", 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendData:", v26);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Content-Type: application/octet-stream\r\n\r\n"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dataUsingEncoding:", 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendData:", v28);

  objc_msgSend(v15, "mappedData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "appendData:", v29);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\r\n"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dataUsingEncoding:", 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendData:", v31);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("--%@--\r\n"), v19);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dataUsingEncoding:", 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendData:", v33);

  v34 = (void *)MEMORY[0x24BDD1808];
  -[WFImgurSessionManager baseURL](self, "baseURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "URLByAppendingPathComponent:", CFSTR("image"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "componentsWithURL:resolvingAgainstBaseURL:", v36, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "dc_queryStringWithQueryDictionary:", v16);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setPercentEncodedQuery:", v38);

  v39 = (void *)MEMORY[0x24BDB7458];
  objc_msgSend(v37, "URL");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "requestWithURL:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "_setNonAppInitiated:", 1);
  objc_msgSend(v41, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v41, "setHTTPBody:", v20);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("multipart/form-data; boundary=%@"), v19);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setValue:forHTTPHeaderField:", v42, CFSTR("Content-Type"));

  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __82__WFImgurSessionManager_uploadImage_title_description_progress_completionHandler___block_invoke;
  v45[3] = &unk_24F8BAE00;
  v46 = v11;
  v43 = v11;
  -[WFImgurSessionManager sendRequest:progress:completionHandler:](self, "sendRequest:progress:completionHandler:", v41, v12, v45);

}

- (void)createAlbumWithIDs:(id)a3 title:(id)a4 description:(id)a5 layout:(id)a6 privacy:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setValue:forKey:", v18, CFSTR("title"));

  objc_msgSend(v20, "setValue:forKey:", v17, CFSTR("description"));
  objc_msgSend(v20, "setValue:forKey:", v16, CFSTR("layout"));

  objc_msgSend(v20, "setValue:forKey:", v15, CFSTR("privacy"));
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setValue:forKey:", v21, CFSTR("ids"));
  v22 = (void *)MEMORY[0x24BDD1808];
  -[WFImgurSessionManager baseURL](self, "baseURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URLByAppendingPathComponent:", CFSTR("album"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsWithURL:resolvingAgainstBaseURL:", v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "dc_queryStringWithQueryDictionary:", v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPercentEncodedQuery:", v26);

  v27 = (void *)MEMORY[0x24BDB7458];
  objc_msgSend(v25, "URL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "requestWithURL:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "_setNonAppInitiated:", 1);
  objc_msgSend(v29, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x24BDBCF48], "dc_queryStringWithQueryDictionary:", v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dataUsingEncoding:", 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHTTPBody:", v31);

  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __95__WFImgurSessionManager_createAlbumWithIDs_title_description_layout_privacy_completionHandler___block_invoke;
  v33[3] = &unk_24F8B6D00;
  v33[4] = self;
  v34 = v14;
  v32 = v14;
  -[WFImgurSessionManager sendRequest:progress:completionHandler:](self, "sendRequest:progress:completionHandler:", v29, 0, v33);

}

- (void)getAlbumLinkFromID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDB7458];
  v8 = a3;
  -[WFImgurSessionManager baseURL](self, "baseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("album/%@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestWithURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_setNonAppInitiated:", 1);
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPBody:", v13);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__WFImgurSessionManager_getAlbumLinkFromID_completionHandler___block_invoke;
  v15[3] = &unk_24F8BAE00;
  v16 = v6;
  v14 = v6;
  -[WFImgurSessionManager sendRequest:progress:completionHandler:](self, "sendRequest:progress:completionHandler:", v12, 0, v15);

}

- (void)sendRequest:(id)a3 progress:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFImgurSessionManager credential](self, "credential");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFImgurSessionManager credential](self, "credential");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wfo_setAuthorizationWithCredential:", v12);
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    -[WFImgurSessionManager clientID](self, "clientID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Client-ID %@"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", v14, CFSTR("Authorization"));

  }
  v23 = 0;
  v24 = (id *)&v23;
  v25 = 0x3042000000;
  v26 = __Block_byref_object_copy__7752;
  v27 = __Block_byref_object_dispose__7753;
  v28 = 0;
  -[WFImgurSessionManager session](self, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "HTTPBody");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __64__WFImgurSessionManager_sendRequest_progress_completionHandler___block_invoke;
  v20[3] = &unk_24F8BAF58;
  v20[4] = self;
  v22 = &v23;
  v17 = v10;
  v21 = v17;
  objc_msgSend(v15, "uploadTaskWithRequest:fromData:completionHandler:", v8, v16, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeWeak(v24 + 5, v18);
  if (v9)
  {
    -[WFImgurSessionManager progressTable](self, "progressTable");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v9, v18);

  }
  objc_msgSend(v18, "resume");

  _Block_object_dispose(&v23, 8);
  objc_destroyWeak(&v28);

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v10;
  void *v11;
  id v12;

  v10 = a4;
  -[WFImgurSessionManager progressTable](self, "progressTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setTotalUnitCount:", a7);
  objc_msgSend(v12, "setCompletedUnitCount:", a6);

}

- (NSString)clientID
{
  return self->_clientID;
}

- (WFOAuth2Credential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)baseURL
{
  return self->_baseURL;
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
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

void __64__WFImgurSessionManager_sendRequest_progress_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
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
    v31 = v7;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v31;

    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("data"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("error"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
        v18 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v16;
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("message"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_opt_class();
          v24 = v22;
          if (v24 && (objc_opt_isKindOfClass() & 1) == 0)
          {
            getWFGeneralLogObject();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              v26 = (void *)objc_opt_class();
              *(_DWORD *)buf = 136315906;
              v35 = "WFEnforceClass";
              v36 = 2114;
              v37 = v24;
              v38 = 2114;
              v39 = v26;
              v40 = 2114;
              v41 = v23;
              v27 = v26;
              _os_log_impl(&dword_22D353000, v25, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

            }
            v17 = 0;
          }
          else
          {
            v17 = (unint64_t)v24;
          }

          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("code"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v28, "integerValue");

        }
        else
        {
          v18 = 0;
          v17 = 0;
        }
      }
      if (v17 | v18 && !v14)
      {
        if (v17)
        {
          v32 = *MEMORY[0x24BDD0FD8];
          v33 = v17;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = 0;
        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFImgurErrorDomain"), v18, v29);
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      v30 = *(_QWORD *)(a1 + 40);
      if (v30)
        (*(void (**)(uint64_t, void *, id))(v30 + 16))(v30, v13, v14);

    }
    else
    {
      v20 = *(_QWORD *)(a1 + 40);
      if (v20)
        (*(void (**)(uint64_t, _QWORD, id))(v20 + 16))(v20, 0, v14);
    }

    v7 = v14;
  }
  else
  {
    v19 = *(_QWORD *)(a1 + 40);
    if (v19)
      (*(void (**)(uint64_t, _QWORD, id))(v19 + 16))(v19, 0, v7);
  }

}

void __62__WFImgurSessionManager_getAlbumLinkFromID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v6, "objectForKey:", CFSTR("success"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v11, "BOOLValue");
    v8 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "valueForKeyPath:", CFSTR("data.link"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *, id))(v3 + 16))(v3, v7, v10, v5);

  }
}

void __95__WFImgurSessionManager_createAlbumWithIDs_title_description_layout_privacy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(a2, "valueForKeyPath:", CFSTR("data.id"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __95__WFImgurSessionManager_createAlbumWithIDs_title_description_layout_privacy_completionHandler___block_invoke_2;
    v5[3] = &unk_24F8B1838;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "getAlbumLinkFromID:completionHandler:", v4, v5);

  }
}

uint64_t __95__WFImgurSessionManager_createAlbumWithIDs_title_description_layout_privacy_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__WFImgurSessionManager_uploadImage_title_description_progress_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v6, "objectForKey:", CFSTR("success"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "BOOLValue");
    v8 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "valueForKeyPath:", CFSTR("data.link"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKeyPath:", CFSTR("data.id"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, uint64_t, void *, void *, id))(v3 + 16))(v3, v7, v10, v11, v5);
  }
}

@end
