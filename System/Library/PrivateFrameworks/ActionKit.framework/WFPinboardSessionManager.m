@implementation WFPinboardSessionManager

- (WFPinboardSessionManager)init
{
  return -[WFPinboardSessionManager initWithSessionConfiguration:](self, "initWithSessionConfiguration:", 0);
}

- (WFPinboardSessionManager)initWithSessionConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  WFPinboardSessionManager *v7;

  v4 = (void *)MEMORY[0x24BDB74B0];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDB74B0], "sessionWithConfiguration:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB74B8], "wf_defaultSessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionWithConfiguration:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = -[WFPinboardSessionManager initWithSession:](self, "initWithSession:", v5);

  return v7;
}

- (WFPinboardSessionManager)initWithSession:(id)a3
{
  id v6;
  WFPinboardSessionManager *v7;
  WFPinboardSessionManager *v8;
  uint64_t v9;
  NSURL *baseURL;
  NSDateFormatter *v11;
  NSDateFormatter *dateTimeFormatter;
  NSDateFormatter *v13;
  void *v14;
  NSDateFormatter *v15;
  void *v16;
  WFPinboardSessionManager *v17;
  void *v19;
  objc_super v20;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFPinboardSessionManager.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

  }
  v20.receiver = self;
  v20.super_class = (Class)WFPinboardSessionManager;
  v7 = -[WFPinboardSessionManager init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_session, a3);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.pinboard.in/v1/"));
    v9 = objc_claimAutoreleasedReturnValue();
    baseURL = v8->_baseURL;
    v8->_baseURL = (NSURL *)v9;

    v11 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    dateTimeFormatter = v8->_dateTimeFormatter;
    v8->_dateTimeFormatter = v11;

    v13 = v8->_dateTimeFormatter;
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithAbbreviation:", CFSTR("UTC"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v13, "setTimeZone:", v14);

    v15 = v8->_dateTimeFormatter;
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v15, "setLocale:", v16);

    -[NSDateFormatter setDateFormat:](v8->_dateTimeFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
    v17 = v8;
  }

  return v8;
}

- (void)addBookmark:(id)a3 withTitle:(id)a4 parameters:(id)a5 completion:(id)a6
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v13, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("url"));
  objc_msgSend(v14, "setValue:forKey:", v12, CFSTR("description"));

  objc_msgSend(v10, "objectForKey:", CFSTR("extended"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v16, CFSTR("extended"));

  objc_msgSend(v10, "objectForKey:", CFSTR("tags"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v18, CFSTR("tags"));

  -[WFPinboardSessionManager dateTimeFormatter](self, "dateTimeFormatter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("dt"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromDate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v21, CFSTR("dt"));

  objc_msgSend(v10, "objectForKey:", CFSTR("replace"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("replace"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "BOOLValue"))
      v24 = CFSTR("yes");
    else
      v24 = CFSTR("no");
    objc_msgSend(v14, "setObject:forKey:", v24, CFSTR("replace"));

  }
  objc_msgSend(v10, "objectForKey:", CFSTR("shared"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("shared"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "BOOLValue"))
      v27 = CFSTR("yes");
    else
      v27 = CFSTR("no");
    objc_msgSend(v14, "setObject:forKey:", v27, CFSTR("shared"));

  }
  objc_msgSend(v10, "objectForKey:", CFSTR("toread"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("toread"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "BOOLValue"))
      v30 = CFSTR("yes");
    else
      v30 = CFSTR("no");
    objc_msgSend(v14, "setObject:forKey:", v30, CFSTR("toread"));

  }
  -[WFPinboardSessionManager baseURL](self, "baseURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "URLByAppendingPathComponent:", CFSTR("posts/add"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v32, 0);
  objc_msgSend(MEMORY[0x24BDBCF48], "dc_queryStringWithQueryDictionary:", v14);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPercentEncodedQuery:", v34);

  objc_msgSend(v33, "URL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __72__WFPinboardSessionManager_addBookmark_withTitle_parameters_completion___block_invoke;
  v38[3] = &unk_24F8BAE00;
  v39 = v11;
  v36 = v11;
  -[WFPinboardSessionManager authenticatedTaskWithURL:completionHandler:](self, "authenticatedTaskWithURL:completionHandler:", v35, v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "resume");
}

- (void)getBookmarksWithTags:(id)a3 limit:(unint64_t)a4 completion:(id)a5
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
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("tag"));
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v12, CFSTR("results"));

  }
  -[WFPinboardSessionManager baseURL](self, "baseURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("posts/all"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v14, 0);
  objc_msgSend(MEMORY[0x24BDBCF48], "dc_queryStringWithQueryDictionary:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPercentEncodedQuery:", v16);

  objc_msgSend(v15, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __66__WFPinboardSessionManager_getBookmarksWithTags_limit_completion___block_invoke;
  v20[3] = &unk_24F8BAE00;
  v21 = v8;
  v18 = v8;
  -[WFPinboardSessionManager authenticatedTaskWithURL:completionHandler:](self, "authenticatedTaskWithURL:completionHandler:", v17, v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "resume");
}

- (void)getModifiedDateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  WFPinboardSessionManager *v13;
  id v14;

  v4 = a3;
  -[WFPinboardSessionManager baseURL](self, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("posts/update"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __58__WFPinboardSessionManager_getModifiedDateWithCompletion___block_invoke;
  v12 = &unk_24F8B6D00;
  v13 = self;
  v14 = v4;
  v7 = v4;
  -[WFPinboardSessionManager authenticatedTaskWithURL:completionHandler:](self, "authenticatedTaskWithURL:completionHandler:", v6, &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume", v9, v10, v11, v12, v13);

}

- (id)authenticatedTaskWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDD1808];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithURL:resolvingAgainstBaseURL:", v8, 0);

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setObject:forKey:", CFSTR("json"), CFSTR("format"));
  -[WFPinboardSessionManager apiToken](self, "apiToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[WFPinboardSessionManager apiToken](self, "apiToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v13, CFSTR("auth_token"));

  }
  objc_msgSend(v9, "percentEncodedQuery");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(v9, "percentEncodedQuery");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingString:", CFSTR("&"));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = &stru_24F8BBA48;
  }

  objc_msgSend(MEMORY[0x24BDBCF48], "dc_queryStringWithQueryDictionary:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPercentEncodedQuery:", v18);

  v19 = objc_alloc(MEMORY[0x24BDB7458]);
  objc_msgSend(v9, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithURL:", v20);

  objc_msgSend(v21, "_setNonAppInitiated:", 1);
  -[WFPinboardSessionManager apiToken](self, "apiToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "length"))
    goto LABEL_7;
  -[WFPinboardSessionManager username](self, "username");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v27, "length"))
  {

LABEL_7:
    goto LABEL_8;
  }
  -[WFPinboardSessionManager password](self, "password");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "length");

  if (v29)
  {
    -[WFPinboardSessionManager username](self, "username");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v36;
    -[WFPinboardSessionManager password](self, "password");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "componentsJoinedByString:", CFSTR(":"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dataUsingEncoding:", 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "base64EncodedStringWithOptions:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("Basic "), "stringByAppendingString:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setValue:forHTTPHeaderField:", v34, CFSTR("Authorization"));

  }
LABEL_8:
  -[WFPinboardSessionManager session](self, "session");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __71__WFPinboardSessionManager_authenticatedTaskWithURL_completionHandler___block_invoke;
  v37[3] = &unk_24F8BB3E0;
  v38 = v6;
  v24 = v6;
  objc_msgSend(v23, "dataTaskWithRequest:completionHandler:", v21, v37);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)apiToken
{
  return self->_apiToken;
}

- (void)setApiToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSDateFormatter)dateTimeFormatter
{
  return self->_dateTimeFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateTimeFormatter, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_apiToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __71__WFPinboardSessionManager_authenticatedTaskWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void (*v19)(void);
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v9);
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "statusCode") != 401)
  {
    v20 = v9;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;

    v18 = *(_QWORD *)(a1 + 32);
    if (v17)
    {
      v19 = *(void (**)(void))(v18 + 16);
    }
    else
    {
      if (!v18)
      {
LABEL_13:

        goto LABEL_14;
      }
      v19 = *(void (**)(void))(v18 + 16);
    }
    v19();
    goto LABEL_13;
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Your username and password or API token are incorrect."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("WFPinboardErrorDomain"), 1000, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v14);

  }
LABEL_7:
  v16 = v9;
LABEL_14:

}

void __58__WFPinboardSessionManager_getModifiedDateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "dateTimeFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("update_time"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFromString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v8, v5);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v5);
  }

}

void __66__WFPinboardSessionManager_getBookmarksWithTags_limit_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_6:
      v7();
    }
  }
  else if (v6)
  {
    v7 = *(void (**)(void))(v6 + 16);
    goto LABEL_6;
  }

}

void __72__WFPinboardSessionManager_addBookmark_withTitle_parameters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("result_code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("done"));
      if (!v6 && (v9 & 1) == 0)
      {
        v10 = (void *)MEMORY[0x24BDD1540];
        v14 = *MEMORY[0x24BDD0FC8];
        v15[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WFPinboardErrorDomain"), 1001, v11);
        v6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, BOOL, id))(v12 + 16))(v12, v6 == 0, v6);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v6);
  }

}

@end
