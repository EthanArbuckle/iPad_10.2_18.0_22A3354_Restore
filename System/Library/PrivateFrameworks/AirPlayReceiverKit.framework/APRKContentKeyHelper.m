@implementation APRKContentKeyHelper

- (APRKContentKeyHelper)init
{
  APRKContentKeyHelper *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *contentKeySessionQueue;
  void *v5;
  uint64_t v6;
  AVContentKeySession *contentKeySession;
  NSMutableDictionary *v8;
  NSMutableDictionary *activeContentKeyRequests;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)APRKContentKeyHelper;
  v2 = -[APRKContentKeyHelper init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.APRKMediaPlayer.contentKeySessionQueue", 0);
    contentKeySessionQueue = v2->_contentKeySessionQueue;
    v2->_contentKeySessionQueue = (OS_dispatch_queue *)v3;

    +[APRKUtilities secureStopURL](APRKUtilities, "secureStopURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      v11 = v5;
      LogPrintF();
    }
    objc_msgSend(MEMORY[0x24BDB2538], "contentKeySessionWithKeySystem:storageDirectoryAtURL:", *MEMORY[0x24BDB1BB8], v5, v11);
    v6 = objc_claimAutoreleasedReturnValue();
    contentKeySession = v2->_contentKeySession;
    v2->_contentKeySession = (AVContentKeySession *)v6;

    -[AVContentKeySession setDelegate:queue:](v2->_contentKeySession, "setDelegate:queue:", v2, v2->_contentKeySessionQueue);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    activeContentKeyRequests = v2->_activeContentKeyRequests;
    v2->_activeContentKeyRequests = v8;

    v2->_forwardsFPSSecureStopData = 0;
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  return v2;
}

- (BOOL)isHandlingContentKeyRequestWithURLString:(id)a3
{
  NSMutableDictionary *activeContentKeyRequests;
  id v4;
  void *v5;
  char v6;

  activeContentKeyRequests = self->_activeContentKeyRequests;
  v4 = a3;
  -[NSMutableDictionary allKeys](activeContentKeyRequests, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)registerAVURLAsset:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  APRKContentKeyHelper *v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (v6 = _LogCategory_Initialize(), v5 = v9, v6))
      {
        v7 = v5;
        v8 = self;
        LogPrintF();
      }
    }
    -[AVContentKeySession addContentKeyRecipient:](self->_contentKeySession, "addContentKeyRecipient:", v9, v7, v8);
    v5 = v9;
  }

}

- (void)unregisterAVURLAsset:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  APRKContentKeyHelper *v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (v6 = _LogCategory_Initialize(), v5 = v9, v6))
      {
        v7 = v5;
        v8 = self;
        LogPrintF();
      }
    }
    -[AVContentKeySession removeContentKeyRecipient:](self->_contentKeySession, "removeContentKeyRecipient:", v9, v7, v8);
    v5 = v9;
  }

}

- (void)forgetAllActiveContentKeyRequests
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[NSMutableDictionary removeAllObjects](self->_activeContentKeyRequests, "removeAllObjects");
}

- (void)processUnhandledURLResponseWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (v13 || !a4)
  {
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDC0E00]);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDC0DC8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_activeContentKeyRequests, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v8, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDC0DD0], v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDB2530], "contentKeyResponseWithFairPlayStreamingKeyResponseData:renewalDate:", v10, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "processContentKeyResponse:", v11);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_activeContentKeyRequests, "removeObjectForKey:", v6);

  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = objc_alloc(MEMORY[0x24BDD1540]);
    v6 = objc_retainAutorelease((id)objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6705, 0));
    *a4 = v6;
  }

}

- (void)processStreamingKeyRequestWithDictionary:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSData *v9;
  NSData *appIDData;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  id v21;
  NSData *v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDC0EF0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDC0F80]);
    v9 = (NSData *)objc_claimAutoreleasedReturnValue();
    appIDData = self->_appIDData;
    self->_appIDData = v9;

    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDC0F88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDC1008]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDC0FD8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDC0E00]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && self->_appIDData)
    {
      -[NSMutableDictionary objectForKey:](self->_activeContentKeyRequests, "objectForKey:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
      {
        v25 = (void *)v15;
        objc_msgSend(v13, "allKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsObject:", CFSTR("CSKRO_RemoteContext"));

        if (v18)
        {
          v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v13, "objectForKey:", CFSTR("CSKRO_RemoteContext"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("CSKRO_RemoteContext"));

        }
        else
        {
          v19 = 0;
        }
        if (gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v22 = self->_appIDData;
        if (v19)
          v23 = v19;
        else
          v23 = v13;
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __85__APRKContentKeyHelper_processStreamingKeyRequestWithDictionary_withCompletionBlock___block_invoke;
        v26[3] = &unk_24FA1BC48;
        v27 = v7;
        v24 = v23;
        v16 = v25;
        objc_msgSend(v25, "makeStreamingContentKeyRequestDataForApp:contentIdentifier:options:completionHandler:", v22, v11, v24, v26);

      }
      else if (gLogCategory_AirPlayReceiverKit <= 30
             && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

    }
    goto LABEL_27;
  }
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v7)
  {
    v21 = objc_alloc(MEMORY[0x24BDD1540]);
    v8 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -6705, 0);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v8);
LABEL_27:

  }
}

void __85__APRKContentKeyHelper_processStreamingKeyRequestWithDictionary_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5
    && gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

- (void)_performContentKeyRequest:(id)a3 isRenewalRequest:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *activeContentKeyRequests;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  activeContentKeyRequests = self->_activeContentKeyRequests;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](activeContentKeyRequests, "setObject:forKey:", v7, v8);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKey:", v9, *MEMORY[0x24BDC0E00]);
  objc_msgSend(v12, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDC0DE0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", sMessageID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v10, *MEMORY[0x24BDC0DF0]);

  if (v4)
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDC0DE8]);
  ++sMessageID;
  -[APRKContentKeyHelper delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentKeyHelper:wantsToPerformContentKeyRequestWithDictionary:", self, v12);

}

- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4
{
  -[APRKContentKeyHelper _performContentKeyRequest:isRenewalRequest:](self, "_performContentKeyRequest:isRenewalRequest:", a4, 1);
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  -[APRKContentKeyHelper _performContentKeyRequest:isRenewalRequest:](self, "_performContentKeyRequest:isRenewalRequest:", a4, 0);
}

- (void)contentKeySessionDidGenerateExpiredSessionReport:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_appIDData)
  {
    +[APRKUtilities secureStopURL](APRKUtilities, "secureStopURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB2538], "pendingExpiredSessionReportsWithAppIdentifier:storageDirectoryAtURL:", self->_appIDData, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (self->_forwardsFPSSecureStopData && v6)
    {
      v17 = v4;
      if (gLogCategory_AirPlayReceiverKit <= 10
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v7, "debugDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
            v22 = CFSTR("record");
            v23 = v13;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1, v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[APRKContentKeyHelper delegate](self, "delegate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "contentKeyHelper:didGenerateSecureStopRecordPayload:", self, v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        }
        while (v10);
      }

      v4 = v17;
    }
    if (v7)
      objc_msgSend(MEMORY[0x24BDB2538], "removePendingExpiredSessionReports:withAppIdentifier:storageDirectoryAtURL:", v7, self->_appIDData, v5);

  }
  else if (gLogCategory_AirPlayReceiverKit <= 90
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (BOOL)forwardsFPSSecureStopData
{
  return self->_forwardsFPSSecureStopData;
}

- (void)setForwardsFPSSecureStopData:(BOOL)a3
{
  self->_forwardsFPSSecureStopData = a3;
}

- (APRKContentKeyHelperDelegate)delegate
{
  return (APRKContentKeyHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appIDData, 0);
  objc_storeStrong((id *)&self->_activeContentKeyRequests, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_contentKeySessionQueue, 0);
}

@end
