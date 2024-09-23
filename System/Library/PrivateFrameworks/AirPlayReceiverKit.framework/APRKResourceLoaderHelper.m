@implementation APRKResourceLoaderHelper

- (APRKResourceLoaderHelper)init
{
  APRKResourceLoaderHelper *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *activeResourceLoadingRequests;
  dispatch_queue_t v5;
  OS_dispatch_queue *resourceLoaderQueue;
  void *v7;
  uint64_t v8;
  NSDictionary *headersDictionary;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)APRKResourceLoaderHelper;
  v2 = -[APRKResourceLoaderHelper init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    activeResourceLoadingRequests = v2->_activeResourceLoadingRequests;
    v2->_activeResourceLoadingRequests = v3;

    v5 = dispatch_queue_create("com.apple.APRKMediaPlayer.resourceLoaderQueue", 0);
    resourceLoaderQueue = v2->_resourceLoaderQueue;
    v2->_resourceLoaderQueue = (OS_dispatch_queue *)v5;

    v12[0] = CFSTR("Accept-Encoding");
    v12[1] = CFSTR("User-Agent");
    v13[0] = CFSTR("gzip");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AppleCoreMedia/1.0.0.%.*s (Apple TV; U; CPU OS 12_0 like Mac OS X; en_us)"),
      APSVersionUtilsGetShortVersionLength(),
      "800.74.1.2");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    headersDictionary = v2->_headersDictionary;
    v2->_headersDictionary = (NSDictionary *)v8;

    v2->_requestIDCnt = 0;
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return v2;
}

- (void)registerAVURLAsset:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  APRKResourceLoaderHelper *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = v4;
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (v6 = _LogCategory_Initialize(), v5 = v10, v6))
      {
        v8 = v5;
        v9 = self;
        LogPrintF();
        v5 = v10;
      }
    }
    objc_msgSend(v5, "resourceLoader", v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:queue:", self, self->_resourceLoaderQueue);

    v5 = v10;
  }

}

- (void)unregisterAVURLAsset:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  APRKResourceLoaderHelper *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = v4;
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (v6 = _LogCategory_Initialize(), v5 = v10, v6))
      {
        v8 = v5;
        v9 = self;
        LogPrintF();
        v5 = v10;
      }
    }
    objc_msgSend(v5, "resourceLoader", v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:queue:", 0, self->_resourceLoaderQueue);

    v5 = v10;
  }

}

- (void)forgetAllActiveResourceLoadingRequests
{
  APRKResourceLoaderHelper *obj;

  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](obj->_activeResourceLoadingRequests, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)processUnhandledURLResponseWithDictionary:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  APRKResourceLoaderHelper *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  APRKResourceLoaderHelper *v33;
  void *v34;
  void *v35;
  id v36;
  APRKResourceLoaderHelper *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  v45 = a3;
  objc_msgSend(v45, "objectForKey:", *MEMORY[0x24BDC0DF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKey:", *MEMORY[0x24BDC0DF8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v45, "objectForKey:", *MEMORY[0x24BDC0E00]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKey:", *MEMORY[0x24BDC0DD8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKey:", *MEMORY[0x24BDC0DC8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKey:", *MEMORY[0x24BDC0DD0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v41 = v6;
    LogPrintF();
  }
  if (v6)
  {
    if (v12)
      v13 = 0;
    else
      v13 = v8 == 0;
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -1, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v14 = self;
    objc_sync_enter(v14);
    -[NSMutableDictionary objectForKey:](v14->_activeResourceLoadingRequests, "objectForKey:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v14);

    if (v15)
      goto LABEL_19;
    v16 = objc_alloc(MEMORY[0x24BDD1540]);
    v17 = *MEMORY[0x24BDD1100];
    v18 = -6727;
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x24BDD1540]);
    v17 = *MEMORY[0x24BDD1100];
    v18 = -6708;
  }
  v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, v18, 0, v41);
LABEL_15:
  v20 = v19;
  if (v19)
  {
    if (a4)
    {
      v20 = objc_retainAutorelease(v19);
      v15 = 0;
      *a4 = v20;
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_31;
  }
  v15 = 0;
LABEL_19:
  if ((unint64_t)(v8 - 301) > 4 || v8 == 304)
  {
    if (v12)
    {
      v44 = v12;
      v34 = v10;
      v35 = v11;
      v36 = objc_alloc(MEMORY[0x24BDB7450]);
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
      v37 = self;
      v38 = v9;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v36, "initWithURL:statusCode:HTTPVersion:headerFields:", v39, v8, CFSTR("HTTP/1.1"), v34);

      v9 = v38;
      self = v37;
      objc_msgSend(v15, "setResponse:", v22);
      objc_msgSend(v15, "dataRequest");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "respondWithData:", v44);

      v11 = v35;
      v10 = v34;
      v12 = v44;
      objc_msgSend(v15, "finishLoading");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], v8, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "finishLoadingWithError:", v22);
    }
  }
  else
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("Location"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)MEMORY[0x24BDB74A0];
      v43 = v12;
      v24 = v10;
      v25 = v11;
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v22);
      v42 = v9;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "requestWithURL:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = objc_alloc(MEMORY[0x24BDB7450]);
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v42);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithURL:statusCode:HTTPVersion:headerFields:", v29, v8, CFSTR("HTTP/1.1"), v24);

      objc_msgSend(v15, "setResponse:", v30);
      objc_msgSend(v15, "setRedirect:", v27);
      objc_msgSend(v15, "contentInformationRequest");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setRenewalDate:", v25);

      objc_msgSend(v15, "dataRequest");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "respondWithData:", v43);

      v11 = v25;
      v10 = v24;
      v12 = v43;
      objc_msgSend(v15, "finishLoading");

      v9 = v42;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], v8, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "finishLoadingWithError:", v27);
    }

  }
  if (v6)
  {
    v33 = self;
    objc_sync_enter(v33);
    -[NSMutableDictionary removeObjectForKey:](v33->_activeResourceLoadingRequests, "removeObjectForKey:", v6);
    objc_sync_exit(v33);

  }
  v20 = 0;
LABEL_31:

}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  APRKResourceLoaderHelper *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDictionary *headersDictionary;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "serializableRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDC0DE0];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDC0DE0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    objc_msgSend(v7, "contentInformationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentType:", *MEMORY[0x24BDB20D8]);

    objc_msgSend(v7, "finishLoading");
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    ++self->_requestIDCnt;
    objc_msgSend(v13, "numberWithLongLong:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self;
    objc_sync_enter(v15);
    -[NSMutableDictionary setObject:forKey:](v15->_activeResourceLoadingRequests, "setObject:forKey:", v7, v14);
    objc_sync_exit(v15);

    v30[0] = *MEMORY[0x24BDC0E00];
    objc_msgSend(v7, "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v18;
    v31[1] = MEMORY[0x24BDBD1C0];
    v19 = *MEMORY[0x24BDC0DF0];
    v30[1] = v9;
    v30[2] = v19;
    v30[3] = *MEMORY[0x24BDC0DD8];
    headersDictionary = v15->_headersDictionary;
    v31[2] = v14;
    v31[3] = headersDictionary;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v8, "objectForKey:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "request");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "absoluteString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v14;
      v27 = v22;
      LogPrintF();

    }
    -[APRKResourceLoaderHelper delegate](v15, "delegate", v27, v28, v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "resourceLoaderHelper:wantsToPerformUnhandledURLRequestWithDictionary:forRequestID:", v15, v21, v14);

  }
  return 1;
}

- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4
{
  id v6;
  APRKResourceLoaderHelper *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary allKeysForObject:](v7->_activeResourceLoadingRequests, "allKeysForObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectsForKeys:](v7->_activeResourceLoadingRequests, "removeObjectsForKeys:", v8);

  objc_sync_exit(v7);
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForResponseToAuthenticationChallenge:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return 0;
}

- (void)resourceLoader:(id)a3 didCancelAuthenticationChallenge:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (APRKResourceLoaderHelperDelegate)delegate
{
  return (APRKResourceLoaderHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headersDictionary, 0);
  objc_storeStrong((id *)&self->_resourceLoaderQueue, 0);
  objc_storeStrong((id *)&self->_activeResourceLoadingRequests, 0);
}

@end
