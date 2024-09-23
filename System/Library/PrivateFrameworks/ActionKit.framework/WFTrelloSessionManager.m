@implementation WFTrelloSessionManager

- (WFTrelloSessionManager)init
{
  return -[WFTrelloSessionManager initWithConfiguration:token:](self, "initWithConfiguration:token:", 0, 0);
}

- (WFTrelloSessionManager)initWithConfiguration:(id)a3 token:(id)a4
{
  id v6;
  id v7;
  WFTrelloSessionManager *v8;
  uint64_t v9;
  NSString *token;
  uint64_t v11;
  NSURL *baseURL;
  void *v13;
  void *v14;
  uint64_t v15;
  NSURLSession *session;
  WFTrelloSessionManager *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFTrelloSessionManager;
  v8 = -[WFTrelloSessionManager init](&v19, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    token = v8->_token;
    v8->_token = (NSString *)v9;

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.trello.com/1/"));
    v11 = objc_claimAutoreleasedReturnValue();
    baseURL = v8->_baseURL;
    v8->_baseURL = (NSURL *)v11;

    v13 = (void *)MEMORY[0x24BDB74B0];
    v14 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDB74B8], "wf_defaultSessionConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "sessionWithConfiguration:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    session = v8->_session;
    v8->_session = (NSURLSession *)v15;

    if (!v6)
    v17 = v8;
  }

  return v8;
}

- (NSDateFormatter)dateFormatter
{
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;
  void *v7;
  NSDateFormatter *v8;
  void *v9;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    v6 = self->_dateFormatter;
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v6, "setLocale:", v7);

    -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"));
    v8 = self->_dateFormatter;
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v8, "setTimeZone:", v9);

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (void)getOpenBoardsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__WFTrelloSessionManager_getOpenBoardsWithCompletionHandler___block_invoke;
  v6[3] = &unk_24F8B5E18;
  v7 = v4;
  v5 = v4;
  -[WFTrelloSessionManager requestPath:parameters:completionHandler:](self, "requestPath:parameters:completionHandler:", CFSTR("members/me/boards"), 0, v6);

}

- (void)getListsForBoard:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTrelloSessionManager.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("board.identifier.length"));

  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("boards/%@/lists"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __61__WFTrelloSessionManager_getListsForBoard_completionHandler___block_invoke;
  v16[3] = &unk_24F8B5E18;
  v17 = v8;
  v14 = v8;
  -[WFTrelloSessionManager requestPath:parameters:completionHandler:](self, "requestPath:parameters:completionHandler:", v13, 0, v16);

}

- (void)getCardsForList:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTrelloSessionManager.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("list.identifier.length"));

  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("lists/%@/cards"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__WFTrelloSessionManager_getCardsForList_completionHandler___block_invoke;
  v16[3] = &unk_24F8B5E18;
  v17 = v8;
  v14 = v8;
  -[WFTrelloSessionManager requestPath:parameters:completionHandler:](self, "requestPath:parameters:completionHandler:", v13, 0, v16);

}

- (void)getUserWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[WFTrelloSessionManager token](self, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("tokens/%@/member"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__WFTrelloSessionManager_getUserWithCompletionHandler___block_invoke;
  v9[3] = &unk_24F8B5E18;
  v10 = v4;
  v8 = v4;
  -[WFTrelloSessionManager requestPath:parameters:completionHandler:](self, "requestPath:parameters:completionHandler:", v7, 0, v9);

}

- (void)createBoardWithName:(id)a3 boardDescription:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("name"));

  if (objc_msgSend(v8, "length"))
    objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("desc"));
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __81__WFTrelloSessionManager_createBoardWithName_boardDescription_completionHandler___block_invoke;
  v13[3] = &unk_24F8B5E18;
  v14 = v9;
  v12 = v9;
  -[WFTrelloSessionManager requestPath:parameters:completionHandler:](self, "requestPath:parameters:completionHandler:", CFSTR("boards"), v11, v13);

}

- (void)createListWithName:(id)a3 onBoardWithIdentifier:(id)a4 position:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("name"));

  objc_msgSend(v14, "setObject:forKey:", v12, CFSTR("idBoard"));
  objc_msgSend(v11, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("pos"));
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __94__WFTrelloSessionManager_createListWithName_onBoardWithIdentifier_position_completionHandler___block_invoke;
  v17[3] = &unk_24F8B5E18;
  v18 = v10;
  v16 = v10;
  -[WFTrelloSessionManager requestPath:parameters:completionHandler:](self, "requestPath:parameters:completionHandler:", CFSTR("lists"), v14, v17);

}

- (void)createCardWithName:(id)a3 listIdentifier:(id)a4 dueDate:(id)a5 cardPosition:(id)a6 cardDescription:(id)a7 completionHandler:(id)a8
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
  id v24;
  _QWORD v25[4];
  id v26;

  v14 = a5;
  v15 = a7;
  v16 = a8;
  v17 = a6;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("name"));

  objc_msgSend(v20, "setObject:forKey:", v18, CFSTR("idList"));
  objc_msgSend(v17, "lowercaseString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("pos"));
  if (v14)
  {
    -[WFTrelloSessionManager dateFormatter](self, "dateFormatter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringFromDate:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v23, CFSTR("due"));

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("due"));
  }

  if (objc_msgSend(v15, "length"))
    objc_msgSend(v20, "setObject:forKey:", v15, CFSTR("desc"));
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __115__WFTrelloSessionManager_createCardWithName_listIdentifier_dueDate_cardPosition_cardDescription_completionHandler___block_invoke;
  v25[3] = &unk_24F8B5E18;
  v26 = v16;
  v24 = v16;
  -[WFTrelloSessionManager requestPath:parameters:completionHandler:](self, "requestPath:parameters:completionHandler:", CFSTR("cards"), v20, v25);

}

- (void)uploadFile:(id)a3 onCard:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  WFTrelloSessionManager *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[3];

  v52[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    v48 = self;
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = arc4random();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Boundary+%08X%08X"), v13, arc4random());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("--%@\r\n"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataUsingEncoding:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendData:", v17);

    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "filename");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Content-Disposition: form-data; name=\"file\"; filename=\"%@\"\r\n"),
      v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dataUsingEncoding:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendData:", v21);

    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "wfType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "MIMEType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Content-Type: %@\r\n\r\n"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dataUsingEncoding:", 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendData:", v26);

    objc_msgSend(v8, "mappedData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendData:", v27);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\r\n--%@--\r\n"), v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dataUsingEncoding:", 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendData:", v29);

    v30 = (void *)MEMORY[0x24BDD1808];
    -[WFTrelloSessionManager baseURL](v48, "baseURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("cards/%@/attachments"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "URLByAppendingPathComponent:", v34);
    v49 = v9;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "componentsWithURL:resolvingAgainstBaseURL:", v35, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("key"), CFSTR("fda7ea0c0060d17c5407a4464de9cb1b"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v37;
    v38 = (void *)MEMORY[0x24BDD1838];
    -[WFTrelloSessionManager token](v48, "token");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "queryItemWithName:value:", CFSTR("token"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setQueryItems:", v41);

    v42 = (void *)MEMORY[0x24BDB7458];
    objc_msgSend(v36, "URL");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "requestWithURL:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "_setNonAppInitiated:", 1);
    objc_msgSend(v44, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v44, "setHTTPBody:", v15);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("multipart/form-data; boundary=%@"), v14);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setValue:forHTTPHeaderField:", v45, CFSTR("Content-Type"));

    -[WFTrelloSessionManager session](v48, "session");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __62__WFTrelloSessionManager_uploadFile_onCard_completionHandler___block_invoke;
    v50[3] = &unk_24F8BB3E0;
    v51 = v11;
    objc_msgSend(v46, "dataTaskWithRequest:completionHandler:", v44, v50);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "resume");

    v9 = v49;
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (void)getAttachmentsOnCard:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("cards/%@/attachments"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __65__WFTrelloSessionManager_getAttachmentsOnCard_completionHandler___block_invoke;
    v12[3] = &unk_24F8B5E18;
    v13 = v7;
    -[WFTrelloSessionManager requestPath:parameters:completionHandler:](self, "requestPath:parameters:completionHandler:", v11, 0, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)lookupCardWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  objc_msgSend(a3, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("cards"), "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__WFTrelloSessionManager_lookupCardWithURL_completionHandler___block_invoke;
  v10[3] = &unk_24F8B5E18;
  v11 = v6;
  v9 = v6;
  -[WFTrelloSessionManager requestPath:parameters:completionHandler:](self, "requestPath:parameters:completionHandler:", v8, 0, v10);

}

- (void)requestPath:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  WFTrelloSessionManager *v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v42 = a5;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTrelloSessionManager.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path.length"));

  }
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_opt_new();
  v14 = v13;

  -[WFTrelloSessionManager token](self, "token");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("token"));

  objc_msgSend(v14, "setValue:forKey:", CFSTR("fda7ea0c0060d17c5407a4464de9cb1b"), CFSTR("key"));
  -[WFTrelloSessionManager baseURL](self, "baseURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    v38 = v17;
    v39 = self;
    v40 = v10;
    v41 = v9;
    v19 = (void *)objc_opt_new();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v20 = v14;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v47 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          v26 = (void *)MEMORY[0x24BDD1838];
          objc_msgSend(v20, "objectForKeyedSubscript:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "queryItemWithName:value:", v25, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v28);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v22);
    }

    objc_msgSend(v18, "setQueryItems:", v19);
    v10 = v40;
    v9 = v41;
    v17 = v38;
    self = v39;
  }
  v29 = (void *)MEMORY[0x24BDB7458];
  objc_msgSend(v18, "URL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "requestWithURL:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "_setNonAppInitiated:", 1);
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v31, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v31, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    v45 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v14, 0, &v45);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v45;
    objc_msgSend(v31, "setHTTPBody:", v32);

  }
  else
  {
    v33 = 0;
  }
  -[WFTrelloSessionManager session](self, "session");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __67__WFTrelloSessionManager_requestPath_parameters_completionHandler___block_invoke;
  v43[3] = &unk_24F8BB3E0;
  v44 = v42;
  v35 = v42;
  objc_msgSend(v34, "dataTaskWithRequest:completionHandler:", v31, v43);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "resume");

}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

void __67__WFTrelloSessionManager_requestPath_parameters_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v7 = a2;
  v8 = a4;
  if (objc_msgSend(a3, "statusCode") == 401)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFTrelloErrorDomain"), 100, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v9;
  }
  if (!objc_msgSend(v7, "length") || v8)
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v8);
  }
  else
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 4, &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v10, v8);

  }
}

void __62__WFTrelloSessionManager_lookupCardWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v10 = v6;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v5, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;

    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v9);
    v6 = v9;
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
  }

}

void __65__WFTrelloSessionManager_getAttachmentsOnCard_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  if (!v8 || a3)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, a3, v5, v6, v7);
  }
  else
  {
    v9 = objc_opt_class();
    v10 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "if_mapAsynchronously:completionHandler:", &__block_literal_global_29866, *(_QWORD *)(a1 + 32));

    }
    else
    {
      getWFGeneralLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v16 = 136315906;
        v17 = "WFEnforceClass";
        v18 = 2114;
        v19 = v10;
        v20 = 2114;
        v21 = (id)objc_opt_class();
        v22 = 2114;
        v23 = v9;
        v12 = v21;
        _os_log_impl(&dword_22D353000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v16, 0x2Au);

      }
      (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, v13, v14, v15);
    }
  }

}

void __65__WFTrelloSessionManager_getAttachmentsOnCard_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *, uint64_t);
  void *v18;
  id v19;
  id v20;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDBCF48];
  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB74B0], "wf_sharedSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __65__WFTrelloSessionManager_getAttachmentsOnCard_completionHandler___block_invoke_3;
  v18 = &unk_24F8B5E88;
  v19 = v10;
  v20 = v5;
  v12 = v10;
  v13 = v5;
  objc_msgSend(v11, "downloadTaskWithURL:completionHandler:", v9, &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resume", v15, v16, v17, v18);

}

void __65__WFTrelloSessionManager_getAttachmentsOnCard_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  if (!v14 || a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BEC14A0];
    objc_msgSend(a3, "MIMEType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "typeFromMIMEType:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "typeDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFilename:", *(_QWORD *)(a1 + 32));
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
    }
    objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:ofType:proposedFilename:", v14, 3, v9, *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __62__WFTrelloSessionManager_uploadFile_onCard_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  id v13;

  v13 = a3;
  v7 = a4;
  v8 = objc_msgSend(a2, "length");
  if (v7 || !v8)
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 200, 100);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containsIndex:", objc_msgSend(v13, "statusCode"));

    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_7:
      v11();
    }
  }

}

void __115__WFTrelloSessionManager_createCardWithName_listIdentifier_dueDate_cardPosition_cardDescription_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    if (v6)
    {
      (*(void (**)(_QWORD, _QWORD, id))(v8 + 16))(*(_QWORD *)(a1 + 32), 0, v6);
    }
    else
    {
      v10 = 0;
      objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v5, &v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v7);

    }
  }

}

void __94__WFTrelloSessionManager_createListWithName_onBoardWithIdentifier_position_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    if (v6)
    {
      (*(void (**)(_QWORD, _QWORD, id))(v8 + 16))(*(_QWORD *)(a1 + 32), 0, v6);
    }
    else
    {
      v10 = 0;
      objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v5, &v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v7);

    }
  }

}

void __81__WFTrelloSessionManager_createBoardWithName_boardDescription_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    if (v6)
    {
      (*(void (**)(_QWORD, _QWORD, id))(v8 + 16))(*(_QWORD *)(a1 + 32), 0, v6);
    }
    else
    {
      v10 = 0;
      objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v5, &v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v7);

    }
  }

}

void __55__WFTrelloSessionManager_getUserWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v10 = v6;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelOfClass:fromJSONDictionary:error:", objc_opt_class(), v5, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;

    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v9);
    v6 = v9;
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
  }

}

void __60__WFTrelloSessionManager_getCardsForList_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v10 = v6;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelsOfClass:fromJSONArray:error:", objc_opt_class(), v5, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;

    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v9);
    v6 = v9;
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
  }

}

void __61__WFTrelloSessionManager_getListsForBoard_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v10 = v6;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelsOfClass:fromJSONArray:error:", objc_opt_class(), v5, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;

    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v9);
    v6 = v9;
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
  }

}

void __61__WFTrelloSessionManager_getOpenBoardsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v12 = v6;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelsOfClass:fromJSONArray:error:", objc_opt_class(), v5, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;

    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(closed = NO)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v11, v8);

    v6 = v8;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
