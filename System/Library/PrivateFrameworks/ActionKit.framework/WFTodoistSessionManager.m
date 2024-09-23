@implementation WFTodoistSessionManager

- (WFTodoistSessionManager)init
{
  return -[WFTodoistSessionManager initWithSessionConfiguration:](self, "initWithSessionConfiguration:", 0);
}

- (WFTodoistSessionManager)initWithSessionConfiguration:(id)a3
{
  id v4;
  WFTodoistSessionManager *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURLSession *session;
  uint64_t v10;
  NSURL *baseURL;
  NSString *syncToken;
  WFTodoistSessionManager *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFTodoistSessionManager;
  v5 = -[WFTodoistSessionManager init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDB74B0];
    v7 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDB74B8], "wf_defaultSessionConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "sessionWithConfiguration:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    session = v5->_session;
    v5->_session = (NSURLSession *)v8;

    if (!v4)
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://todoist.com/API/v8"));
    v10 = objc_claimAutoreleasedReturnValue();
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v10;

    syncToken = v5->_syncToken;
    v5->_syncToken = (NSString *)CFSTR("*");

    v13 = v5;
  }

  return v5;
}

- (void)getProjectsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9[0] = CFSTR("projects");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__WFTodoistSessionManager_getProjectsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F8BAE00;
  v8 = v4;
  v6 = v4;
  -[WFTodoistSessionManager requestWithCommands:resourceTypes:completionHandler:](self, "requestWithCommands:resourceTypes:completionHandler:", 0, v5, v7);

}

- (void)createFileOnItemWithId:(int64_t)a3 withFile:(id)a4 completionHandler:(id)a5
{
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  id v40;
  void *v41;
  id v42;
  _QWORD v44[5];
  id v45;
  int64_t v46;

  v42 = a5;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a4;
  v9 = arc4random();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Boundary+%08X%08X"), v9, arc4random());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("--%@\r\n"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendData:", v13);

  objc_msgSend(CFSTR("Content-Disposition: form-data; name=\"token\"\r\n\r\n"), "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendData:", v14);

  v15 = (void *)MEMORY[0x24BDD17C8];
  -[WFTodoistSessionManager credential](self, "credential");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@\r\n"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dataUsingEncoding:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendData:", v19);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("--%@\r\n"), v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dataUsingEncoding:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendData:", v21);

  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "filename");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("Content-Disposition: form-data; name=\"file\"; filename=\"%@\"\r\n"),
    v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dataUsingEncoding:", 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendData:", v25);

  v26 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "wfType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "MIMEType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("Content-Type: %@\r\n\r\n"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dataUsingEncoding:", 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendData:", v30);

  objc_msgSend(v8, "mappedData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "appendData:", v31);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\r\n--%@--\r\n"), v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dataUsingEncoding:", 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendData:", v33);

  v34 = (void *)MEMORY[0x24BDB7458];
  -[WFTodoistSessionManager baseURL](self, "baseURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "URLByAppendingPathComponent:", CFSTR("upload_file"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "requestWithURL:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "_setNonAppInitiated:", 1);
  objc_msgSend(v37, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v37, "setHTTPBody:", v11);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("multipart/form-data; boundary=%@"), v10);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setValue:forHTTPHeaderField:", v38, CFSTR("Content-Type"));

  -[WFTodoistSessionManager session](self, "session");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __77__WFTodoistSessionManager_createFileOnItemWithId_withFile_completionHandler___block_invoke;
  v44[3] = &unk_24F8B6DC0;
  v45 = v42;
  v46 = a3;
  v44[4] = self;
  v40 = v42;
  objc_msgSend(v39, "dataTaskWithRequest:completionHandler:", v37, v44);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "resume");

}

- (void)createItemInProject:(id)a3 content:(id)a4 dueDateString:(id)a5 reminderDateString:(id)a6 reminderService:(int64_t)a7 priority:(int64_t)a8 note:(id)a9 completionHandler:(id)a10
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
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
  const __CFString *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  void *v61;
  id v62;
  void *v64;
  void *v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  const __CFString *v74;
  id v75;
  const __CFString *v76;
  _QWORD v77[3];

  v77[1] = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v67 = a6;
  v66 = a9;
  v62 = a10;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setValue:forKey:", v15, CFSTR("content"));

  v18 = (void *)MEMORY[0x24BDD16E0];
  v19 = objc_msgSend(v16, "projectId");

  objc_msgSend(v18, "numberWithInteger:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v20, CFSTR("project_id"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v21, CFSTR("priority"));

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BDBCB20];
  objc_msgSend(v22, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v24, CFSTR("date_lang"));

  if (v14)
  {
    v76 = CFSTR("string");
    v77[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forKey:", v25, CFSTR("due"));

  }
  v64 = v14;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "UUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lowercaseString");
  v28 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "UUIDString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "lowercaseString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", CFSTR("item_add"), CFSTR("type"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setValue:forKey:", v31, CFSTR("temp_id"));
  v61 = (void *)v28;
  objc_msgSend(v32, "setValue:forKey:", v28, CFSTR("uuid"));
  objc_msgSend(v32, "setValue:forKey:", v17, CFSTR("args"));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "UUIDString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "lowercaseString");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v67, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "UUIDString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "lowercaseString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)objc_opt_new();
    objc_msgSend(v38, "setValue:forKey:", v31, CFSTR("item_id"));
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKey:", v23);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setValue:forKey:", v40, CFSTR("date_lang"));

    v41 = CFSTR("email");
    if (a7 == 2)
      v41 = CFSTR("mobile");
    if (a7 == 1)
      v42 = CFSTR("push");
    else
      v42 = v41;
    objc_msgSend(v38, "setValue:forKey:", v42, CFSTR("service"));
    objc_msgSend(v38, "setValue:forKey:", CFSTR("absolute"), CFSTR("type"));
    objc_msgSend(v38, "setValue:forKey:", v37, CFSTR("id"));
    if (v67)
    {
      v74 = CFSTR("string");
      v75 = v67;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setValue:forKey:", v43, CFSTR("due"));

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", CFSTR("reminder_add"), CFSTR("type"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setValue:forKey:", v37, CFSTR("temp_id"));
    objc_msgSend(v44, "setValue:forKey:", v65, CFSTR("uuid"));
    objc_msgSend(v44, "setValue:forKey:", v38, CFSTR("args"));

  }
  else
  {
    v44 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "UUIDString");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "lowercaseString");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v66, "length"))
  {
    v48 = (void *)objc_opt_new();
    objc_msgSend(v48, "setValue:forKey:", v31, CFSTR("item_id"));
    objc_msgSend(v48, "setValue:forKey:", v66, CFSTR("content"));
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "UUIDString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "lowercaseString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", CFSTR("note_add"), CFSTR("type"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setValue:forKey:", v51, CFSTR("temp_id"));
    objc_msgSend(v52, "setValue:forKey:", v47, CFSTR("uuid"));
    objc_msgSend(v52, "setValue:forKey:", v48, CFSTR("args"));

  }
  else
  {
    v52 = 0;
  }
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v32, 0);
  v54 = v53;
  if (v52)
    objc_msgSend(v53, "addObject:", v52);
  if (v44)
    objc_msgSend(v54, "addObject:", v44);
  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 3221225472;
  v68[2] = __136__WFTodoistSessionManager_createItemInProject_content_dueDateString_reminderDateString_reminderService_priority_note_completionHandler___block_invoke;
  v68[3] = &unk_24F8B6DE8;
  v69 = v61;
  v70 = v65;
  v72 = v31;
  v73 = v62;
  v71 = v47;
  v55 = v31;
  v56 = v62;
  v57 = v47;
  v58 = v65;
  v59 = v61;
  -[WFTodoistSessionManager requestWithCommands:resourceTypes:completionHandler:](self, "requestWithCommands:resourceTypes:completionHandler:", v54, 0, v68);

}

- (void)requestWithCommands:(id)a3 resourceTypes:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
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
  id v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  void *v43;
  _QWORD v44[5];
  void (**v45)(_QWORD, _QWORD, _QWORD);
  id v46;
  id v47;

  v8 = a3;
  v9 = a4;
  v41 = a5;
  v10 = (void *)objc_opt_new();
  v11 = (void *)MEMORY[0x24BDD1838];
  -[WFTodoistSessionManager syncToken](self, "syncToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queryItemWithName:value:", CFSTR("sync_token"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  -[WFTodoistSessionManager credential](self, "credential");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDD1838];
    -[WFTodoistSessionManager credential](self, "credential");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessToken");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "queryItemWithName:value:", CFSTR("token"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v19);

  }
  v43 = v8;
  if (objc_msgSend(v9, "count", v41))
  {
    v20 = (void *)MEMORY[0x24BDD1838];
    v21 = objc_alloc(MEMORY[0x24BDD17C8]);
    v47 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v9, 0, &v47);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v47;
    v24 = (void *)objc_msgSend(v21, "initWithData:encoding:", v22, 4);
    objc_msgSend(v20, "queryItemWithName:value:", CFSTR("resource_types"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v25);

    v8 = v43;
  }
  else
  {
    v23 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    v26 = (void *)MEMORY[0x24BDD1838];
    v27 = objc_alloc(MEMORY[0x24BDD17C8]);
    v46 = v23;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v8, 0, &v46);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v46;

    v30 = (void *)objc_msgSend(v27, "initWithData:encoding:", v28, 4);
    objc_msgSend(v26, "queryItemWithName:value:", CFSTR("commands"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v31);

    v23 = v29;
  }
  v32 = (void *)objc_opt_new();
  objc_msgSend(v32, "setQueryItems:", v10);
  v33 = (void *)MEMORY[0x24BDB7458];
  -[WFTodoistSessionManager baseURL](self, "baseURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "URLByAppendingPathComponent:", CFSTR("sync"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "requestWithURL:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "_setNonAppInitiated:", 1);
  objc_msgSend(v32, "percentEncodedQuery");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "dataUsingEncoding:", 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setHTTPBody:", v38);

  objc_msgSend(v36, "setHTTPMethod:", CFSTR("POST"));
  if (v23)
  {
    if (v42)
      ((void (**)(_QWORD, _QWORD, id))v42)[2](v42, 0, v23);
  }
  else
  {
    -[WFTodoistSessionManager session](self, "session");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __79__WFTodoistSessionManager_requestWithCommands_resourceTypes_completionHandler___block_invoke;
    v44[3] = &unk_24F8B6E10;
    v44[4] = self;
    v45 = v42;
    objc_msgSend(v39, "dataTaskWithRequest:completionHandler:", v36, v44);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "resume");

  }
}

- (NSURLSession)session
{
  return self->_session;
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

- (NSString)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncToken, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __79__WFTodoistSessionManager_requestWithCommands_resourceTypes_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v18 = v7;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;

    v10 = objc_opt_class();
    WFEnforceClass(v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sync_token"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_class();
      WFEnforceClass(v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(*(id *)(a1 + 32), "setSyncToken:", v14);
      v15 = *(_QWORD *)(a1 + 40);
      if (v15)
      {
        WFTodoistErrorFromResponseObject(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v11, v16);

      }
      goto LABEL_11;
    }
  }
  else
  {
    v9 = v7;
  }
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, _QWORD, id))(v17 + 16))(v17, 0, v9);
LABEL_11:

}

void __136__WFTodoistSessionManager_createItemInProject_content_dueDateString_reminderDateString_reminderService_priority_note_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v20 = a3;
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sync_status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("temp_id_mapping"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  WFEnforceClass(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v20;
  if (!v20)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", a1[4]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WFTodoistErrorFromResponseObject(v13);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v12 = v21;
    if (!v21)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", a1[5]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      WFTodoistErrorFromResponseObject(v14);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      v12 = v22;
      if (!v22)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", a1[6]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        WFTodoistErrorFromResponseObject(v15);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        v12 = v23;
      }
    }
  }
  v24 = v12;
  v16 = a1[8];
  if (v16)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", a1[7]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    WFEnforceClass(v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, objc_msgSend(v19, "integerValue"), v24);

  }
}

void __77__WFTodoistSessionManager_createFileOnItemWithId_withFile_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v32 = v7;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v32);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v32;

    v10 = objc_opt_class();
    WFEnforceClass(v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v9;
    if (v9 || (WFTodoistErrorFromResponseObject(v11), (v7 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = *(_QWORD *)(a1 + 40);
      if (v12)
        (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v7);
    }
    else
    {
      v14 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("item_id"));

      objc_msgSend(v14, "setValue:forKey:", &stru_24F8BBA48, CFSTR("content"));
      objc_msgSend(v14, "setValue:forKey:", v11, CFSTR("file_attachment"));
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lowercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lowercaseString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", CFSTR("note_add"), CFSTR("type"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setValue:forKey:", v21, CFSTR("temp_id"));
      objc_msgSend(v22, "setValue:forKey:", v18, CFSTR("uuid"));
      objc_msgSend(v22, "setValue:forKey:", v14, CFSTR("args"));
      v23 = *(void **)(a1 + 32);
      v33[0] = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __77__WFTodoistSessionManager_createFileOnItemWithId_withFile_completionHandler___block_invoke_2;
      v28[3] = &unk_24F8BB298;
      v29 = v18;
      v25 = *(id *)(a1 + 40);
      v30 = v21;
      v31 = v25;
      v26 = v21;
      v27 = v18;
      objc_msgSend(v23, "requestWithCommands:resourceTypes:completionHandler:", v24, 0, v28);

      v7 = 0;
    }

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v7);
  }

}

void __77__WFTodoistSessionManager_createFileOnItemWithId_withFile_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sync_status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("temp_id_mapping"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  WFEnforceClass(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", a1[4]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WFTodoistErrorFromResponseObject(v12);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  v13 = a1[6];
  if (v13)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", a1[5]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    WFEnforceClass(v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, objc_msgSend(v16, "integerValue"), v17);

  }
}

void __60__WFTodoistSessionManager_getProjectsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("projects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9 = 0;
  }
  else
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelsOfClass:fromJSONArray:error:", objc_opt_class(), v8, &v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
