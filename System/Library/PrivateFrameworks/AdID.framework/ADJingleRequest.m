@implementation ADJingleRequest

+ (id)incrementToken
{
  id v2;

  v2 = a1;
  objc_sync_enter(v2);
  ++token;
  objc_sync_exit(v2);

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", token);
}

- (id)init:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  ADJingleRequest *v9;
  ADJingleRequest *v10;
  uint64_t v11;
  NSNumber *token;
  uint64_t v13;
  id completionHandler;
  uint64_t v15;
  NSMutableDictionary *requestHeaders;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ADJingleRequest;
  v9 = -[ADJingleRequest init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DSID, a3);
    +[ADJingleRequest incrementToken](ADJingleRequest, "incrementToken");
    v11 = objc_claimAutoreleasedReturnValue();
    token = v10->_token;
    v10->_token = (NSNumber *)v11;

    v13 = MEMORY[0x219A082AC](v8);
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = (id)v13;

    if (init_withCompletion__onceToken != -1)
      dispatch_once(&init_withCompletion__onceToken, &__block_literal_global_0);
    v15 = objc_msgSend((id)init_withCompletion__defaultHeaders, "mutableCopy");
    requestHeaders = v10->_requestHeaders;
    v10->_requestHeaders = (NSMutableDictionary *)v15;

  }
  return v10;
}

void __39__ADJingleRequest_init_withCompletion___block_invoke()
{
  void *v0;

  v0 = (void *)init_withCompletion__defaultHeaders;
  init_withCompletion__defaultHeaders = (uint64_t)&unk_24D718EC0;

}

- (void)send
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  ADJingleRequest *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  ADJingleRequest *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void (**v47)(_QWORD, _QWORD);
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[5];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  +[ADAMSBagManager sharedInstance](ADAMSBagManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADJingleRequest bagKey](self, "bagKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "retrieveJingleRequestURLFromAMSBagWithPartialityKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v28 = objc_alloc(MEMORY[0x24BDD1540]);
    v29 = (void *)MEMORY[0x24BDD17C8];
    v30 = objc_opt_class();
    -[ADJingleRequest bagKey](self, "bagKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("[%@]: Invalid value for bag key %@: %@ (class: %@)"), v30, v31, v32, objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v28, "initWithAdCode:andDescription:", 14, v33);

    objc_msgSend(v25, "AD_Log:", CFSTR("iAdIDLogging"));
    -[ADJingleRequest setError:](self, "setError:", v25);
    -[ADJingleRequest completionHandler](self, "completionHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
LABEL_20:

      goto LABEL_21;
    }
    -[ADJingleRequest completionHandler](self, "completionHandler");
    v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, ADJingleRequest *))v26)[2](v26, self);
LABEL_19:

    goto LABEL_20;
  }
  v49 = v5;
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iTunesAccountDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeDSIDRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "DSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqualToString:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = objc_alloc_init(MEMORY[0x24BE083F8]);
    objc_msgSend(v12, "setRequestEncoding:", 3);
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "iTunesStoreAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccount:", v14);

    v48 = v12;
    objc_msgSend(v12, "setUrlKnownToBeTrusted:", 1);
    v50 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v15 = self;
    -[ADJingleRequest requestHeaders](self, "requestHeaders");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v54 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[ADJingleRequest requestHeaders](v15, "requestHeaders");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKey:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v50, "setValue:forKey:", v23, v21);
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Non-string value in additional headers: %@"), v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              _ADLog();

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Non-string key in additional headers: %@"), v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            _ADLog();
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v18);
    }

    v25 = v12;
    v5 = v49;
    v26 = (void (**)(_QWORD, _QWORD))v50;
    objc_msgSend(v48, "requestWithMethod:URL:parameters:", 4, v49, v50);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __23__ADJingleRequest_send__block_invoke;
    v51[3] = &unk_24D7107D0;
    v51[4] = v15;
    v52 = v49;
    objc_msgSend(v27, "addFinishBlock:", v51);

    goto LABEL_19;
  }
  v35 = objc_alloc(MEMORY[0x24BDD1540]);
  v36 = (void *)MEMORY[0x24BDD17C8];
  v37 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "iTunesAccountDSID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "activeDSIDRecord");
  v41 = self;
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "DSID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("[%@]: iTunes DSID mismatch. Active DSID: %@. Record DSID: %@. Cannot request Segments."), v37, v39, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v35, "initWithAdCode:andDescription:", 3, v44);

  objc_msgSend(v45, "AD_Log:", CFSTR("iAdIDLogging"));
  -[ADJingleRequest setError:](v41, "setError:", v45);
  -[ADJingleRequest completionHandler](v41, "completionHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[ADJingleRequest completionHandler](v41, "completionHandler");
    v47 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, ADJingleRequest *))v47)[2](v47, v41);

  }
LABEL_21:

}

void __23__ADJingleRequest_send__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "requestBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHTTPBody:", v5);

  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jingleTimeoutInterval");
  objc_msgSend(v4, "setTimeoutInterval:");

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestHeaders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("headers"));

  v9 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(*(id *)(a1 + 32), "requestBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "JSONObjectWithData:options:error:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("body"));

  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "AD_jsonString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("POSTing to Jingle (%@): %@"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  v16 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __23__ADJingleRequest_send__block_invoke_2;
  v17[3] = &unk_24D7107A8;
  v17[4] = v16;
  objc_msgSend(v16, "sendJingleRequest:withCompletion:", v4, v17);

}

void __23__ADJingleRequest_send__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v5 = a2;
  v6 = a3;
  if (v5 | v6)
  {
    objc_msgSend((id)v5, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setResponseBody:", v8);

    objc_msgSend((id)v5, "responseHeaders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setResponseHeaders:", v10);

    v11 = (void *)objc_msgSend((id)v6, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setError:", v11);

    objc_msgSend(*(id *)(a1 + 32), "setStatusCode:", objc_msgSend((id)v5, "responseStatusCode"));
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithAdCode:andDescription:", 12, CFSTR("Jingle response is nil."));
    objc_msgSend(*(id *)(a1 + 32), "setError:", v12);

  }
  objc_msgSend(MEMORY[0x24BE02228], "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __23__ADJingleRequest_send__block_invoke_3;
  v14[3] = &unk_24D710270;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v13, "addOperationWithBlock:", v14);

}

uint64_t __23__ADJingleRequest_send__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleJingleResponse");
}

- (void)handleJingleResponse
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  int64_t v29;
  void *v30;
  char v31;
  void (**v32)(id, ADJingleRequest *);
  _QWORD v33[5];

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (self->_error)
  {
    v4 = objc_opt_class();
    -[ADJingleRequest error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "code");
    -[ADJingleRequest token](self, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADJingleRequest error](self, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]: Error %ld in Jingle response for %@: %@"), v4, v6, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

LABEL_3:
    goto LABEL_4;
  }
  -[ADJingleRequest token](self, "token");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Jingle response for %@ received with status %ld"), v12, -[ADJingleRequest statusCode](self, "statusCode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (-[ADJingleRequest statusCode](self, "statusCode") != 200)
  {
    if (-[ADJingleRequest statusCode](self, "statusCode") == 401)
    {
      +[ADJingleRequestManager sharedInstance](ADJingleRequestManager, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __39__ADJingleRequest_handleJingleResponse__block_invoke;
      v33[3] = &unk_24D7107F8;
      v33[4] = self;
      objc_msgSend(v27, "authenticateUser:", v33);

      return;
    }
    v28 = objc_alloc(MEMORY[0x24BDD1540]);
    v29 = -[ADJingleRequest statusCode](self, "statusCode");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown HTTP response code: %ld"), -[ADJingleRequest statusCode](self, "statusCode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v28, "initWithAdCode:andDescription:", v29, v5);
    -[ADJingleRequest setError:](self, "setError:", v7);
    goto LABEL_3;
  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  v15 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[ADJingleRequest responseBody](self, "responseBody");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithData:encoding:", v16, 4);
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Jingle response body:\n %@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog();

  if (MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "BOOLForKey:", CFSTR("ForceU13SegmentResponse")) & 1) != 0)
    {
LABEL_11:

LABEL_12:
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", self->_responseBody, 1, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLForKey:", CFSTR("ForceU13SegmentResponse"));

      if (v22)
        objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("u13flag"));
      objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "BOOLForKey:", CFSTR("ForceT13SegmentResponse"));

      if (v24)
        objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("t13flag"));
      objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "BOOLForKey:", CFSTR("ForceU18SegmentResponse"));

      if (v26)
        objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("u18flag"));
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ADJingleRequest setResponseBody:](self, "setResponseBody:", v7);
      goto LABEL_3;
    }
    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "BOOLForKey:", CFSTR("ForceT13SegmentResponse")))
    {

      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "BOOLForKey:", CFSTR("ForceU18SegmentResponse"));

    if ((v31 & 1) != 0)
      goto LABEL_12;
  }
LABEL_4:
  -[ADJingleRequest completionHandler](self, "completionHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ADJingleRequest completionHandler](self, "completionHandler");
    v32 = (void (**)(id, ADJingleRequest *))objc_claimAutoreleasedReturnValue();
    v32[2](v32, self);

  }
}

void __39__ADJingleRequest_handleJingleResponse__block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "send");
  }
  else
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithAdCode:andDescription:", 8, CFSTR("Jingle authentication error."));
    objc_msgSend(*(id *)(a1 + 32), "setError:", v3);

  }
}

- (void)sendJingleRequest:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD1858];
  v7 = a3;
  objc_msgSend(v6, "defaultSessionConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08410]), "initWithConfiguration:delegate:delegateQueue:", v8, 0, 0);
  v10 = objc_alloc_init(MEMORY[0x24BE08340]);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __52__ADJingleRequest_sendJingleRequest_withCompletion___block_invoke;
  v17 = &unk_24D710848;
  v18 = v10;
  v19 = v5;
  v11 = v5;
  v12 = v10;
  objc_msgSend(v9, "dataTaskWithRequest:completionHandler:", v7, &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "resume", v14, v15, v16, v17);
  objc_msgSend(v9, "finishTasksAndInvalidate");

}

void __52__ADJingleRequest_sendJingleRequest_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__ADJingleRequest_sendJingleRequest_withCompletion___block_invoke_2;
  v5[3] = &unk_24D710820;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "addFinishBlock:", v5);

}

uint64_t __52__ADJingleRequest_sendJingleRequest_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSNumber)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSData)responseBody
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResponseBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)responseHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResponseHeaders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
  objc_storeStrong((id *)&self->_bagKey, a3);
}

- (NSData)requestBody
{
  return self->_requestBody;
}

- (void)setRequestBody:(id)a3
{
  objc_storeStrong((id *)&self->_requestBody, a3);
}

- (NSMutableDictionary)requestHeaders
{
  return self->_requestHeaders;
}

- (void)setRequestHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_requestHeaders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHeaders, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_storeStrong((id *)&self->_bagKey, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
