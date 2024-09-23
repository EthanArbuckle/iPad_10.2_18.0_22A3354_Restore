@implementation _SFDownloadDispatcher

- (_SFDownloadDispatcher)init
{
  _SFDownloadDispatcher *v2;
  uint64_t v3;
  NSMapTable *pendingDownloadMap;
  NSMapTable *v5;
  NSMapTable *activeDownloadMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFDownloadDispatcher;
  v2 = -[_SFDownloadDispatcher init](&v8, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v3 = objc_claimAutoreleasedReturnValue();
  pendingDownloadMap = v2->_pendingDownloadMap;
  v2->_pendingDownloadMap = (NSMapTable *)v3;

  v5 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E0CB3748]);
  activeDownloadMap = v2->_activeDownloadMap;
  v2->_activeDownloadMap = v5;

  return v2;
}

+ (id)sharedDownloadDispatcher
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___SFDownloadDispatcher_sharedDownloadDispatcher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDownloadDispatcher_onceToken != -1)
    dispatch_once(&sharedDownloadDispatcher_onceToken, block);
  return (id)sharedDownloadDispatcher_instance;
}

- (id)prepareForDownloadFromWebView:(id)a3 request:(id)a4 MIMEType:(id)a5 uti:(id)a6 userInitiatedAction:(id)a7
{
  id v12;
  void *v13;

  v12 = a3;
  +[_SFDownload provisionalDownloadWithMIMEType:request:response:filename:uti:userInitiatedAction:](_SFDownload, "provisionalDownloadWithMIMEType:request:response:filename:uti:userInitiatedAction:", a5, a4, 0, 0, a6, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDownloadDispatcher setPendingDownload:forWebView:](self, "setPendingDownload:forWebView:", v13, v12);

  return v13;
}

- (void)setPendingDownload:(id)a3 forWebView:(id)a4
{
  -[NSMapTable setObject:forKey:](self->_pendingDownloadMap, "setObject:forKey:", a3, a4);
}

- (id)startDownloadFromWebView:(id)a3 URL:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  CFStringRef PreferredIdentifierForTag;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "pathExtension");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v8, "length"))
    PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], v8, 0);
  else
    PreferredIdentifierForTag = (CFStringRef)(id)*MEMORY[0x1E0CA5B20];
  v10 = (__CFString *)PreferredIdentifierForTag;
  objc_msgSend(MEMORY[0x1E0C92C80], "safari_nonAppInitiatedRequestWithURL:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFDownloadDispatcher prepareForDownloadFromWebView:request:MIMEType:uti:userInitiatedAction:](self, "prepareForDownloadFromWebView:request:MIMEType:uti:userInitiatedAction:", v6, v11, 0, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "processPool");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "websiteDataStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v14, "_downloadURLRequest:websiteDataStore:originatingWebView:", v11, v15, v6);

  }
  return v12;
}

- (id)startDownloadForCurrentURLFromWebView:(id)a3
{
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
  id v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C92C80];
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_nonAppInitiatedRequestWithURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_MIMEType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sf_suggestedFilename");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFDownload provisionalDownloadWithMIMEType:request:response:filename:uti:userInitiatedAction:](_SFDownload, "provisionalDownloadWithMIMEType:request:response:filename:uti:userInitiatedAction:", v8, v7, 0, v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFDownloadDispatcher setPendingDownload:forWebView:](self, "setPendingDownload:forWebView:", v10, v4);
  objc_msgSend(v4, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processPool");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "websiteDataStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "_downloadURLRequest:websiteDataStore:originatingWebView:", v7, v13, v4);

  return v10;
}

- (id)downloadFromWKDownload:(id)a3 userInitiatedAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFDownload provisionalDownloadWithMIMEType:request:response:filename:uti:userInitiatedAction:](_SFDownload, "provisionalDownloadWithMIMEType:request:response:filename:uti:userInitiatedAction:", 0, v6, 0, 0, 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)registerResumedDownload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "wkDownload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](self->_activeDownloadMap, "setObject:forKey:", v4, v5);

}

- (void)_downloadDidStart:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NSMapTable objectForKey:](self->_activeDownloadMap, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v9, "originatingWebView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_pendingDownloadMap, "objectForKey:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_4:
      -[NSMapTable removeObjectForKey:](self->_pendingDownloadMap, "removeObjectForKey:", v6);
      -[NSMapTable setObject:forKey:](self->_activeDownloadMap, "setObject:forKey:", v5, v9);
      objc_msgSend(v5, "_downloadDidStart:", v9);
LABEL_11:

      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v7, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "sfWebView:didStartDownload:", v7, v9);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
          goto LABEL_4;
      }
      else
      {

      }
    }
    objc_msgSend(v9, "cancel");
    v5 = 0;
    goto LABEL_11;
  }
  v5 = v4;
  objc_msgSend(v4, "_downloadDidStart:", v9);
LABEL_12:

}

- (void)_download:(id)a3 didReceiveResponse:(id)a4
{
  NSMapTable *activeDownloadMap;
  id v6;
  id v7;
  id v8;

  activeDownloadMap = self->_activeDownloadMap;
  v6 = a4;
  v7 = a3;
  -[NSMapTable objectForKey:](activeDownloadMap, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_download:didReceiveResponse:", v7, v6);

}

- (void)_download:(id)a3 didWriteData:(unint64_t)a4 totalBytesWritten:(unint64_t)a5 totalBytesExpectedToWrite:(unint64_t)a6
{
  NSMapTable *activeDownloadMap;
  id v10;
  id v11;

  activeDownloadMap = self->_activeDownloadMap;
  v10 = a3;
  -[NSMapTable objectForKey:](activeDownloadMap, "objectForKey:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_download:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:", v10, a4, a5, a6);

}

- (void)_download:(id)a3 decideDestinationWithSuggestedFilename:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSMapTable *activeDownloadMap;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  activeDownloadMap = self->_activeDownloadMap;
  v10 = a5;
  -[NSMapTable objectForKey:](activeDownloadMap, "objectForKey:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "_download:decideDestinationWithSuggestedFilename:completionHandler:", v13, v8, v10);
  else
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);

}

- (void)_downloadDidFinish:(id)a3
{
  NSMapTable *activeDownloadMap;
  id v5;
  id v6;

  activeDownloadMap = self->_activeDownloadMap;
  v5 = a3;
  -[NSMapTable objectForKey:](activeDownloadMap, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_downloadDidFinish:", v5);
  -[NSMapTable removeObjectForKey:](self->_activeDownloadMap, "removeObjectForKey:", v5);

}

- (void)_download:(id)a3 didFailWithError:(id)a4
{
  NSMapTable *activeDownloadMap;
  id v7;
  id v8;
  id v9;

  activeDownloadMap = self->_activeDownloadMap;
  v7 = a4;
  v8 = a3;
  -[NSMapTable objectForKey:](activeDownloadMap, "objectForKey:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_download:didFailWithError:", v8, v7);

  -[NSMapTable removeObjectForKey:](self->_activeDownloadMap, "removeObjectForKey:", v8);
}

- (void)_downloadDidCancel:(id)a3
{
  NSMapTable *activeDownloadMap;
  id v5;
  id v6;

  activeDownloadMap = self->_activeDownloadMap;
  v5 = a3;
  -[NSMapTable objectForKey:](activeDownloadMap, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_downloadDidCancel:", v5);
  -[NSMapTable removeObjectForKey:](self->_activeDownloadMap, "removeObjectForKey:", v5);

}

- (void)_downloadProcessDidCrash:(id)a3
{
  NSMapTable *activeDownloadMap;
  id v5;
  id v6;

  activeDownloadMap = self->_activeDownloadMap;
  v5 = a3;
  -[NSMapTable objectForKey:](activeDownloadMap, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_downloadProcessDidCrash:", v5);
  -[NSMapTable removeObjectForKey:](self->_activeDownloadMap, "removeObjectForKey:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDownloadMap, 0);
  objc_storeStrong((id *)&self->_activeDownloadMap, 0);
}

@end
