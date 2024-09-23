@implementation IAMWebMessageController

- (IAMWebMessageController)init
{
  IAMWebMessageController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IAMWebMessageController;
  result = -[IAMWebMessageController init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_isGlobalJSOAvailable = 0;
  return result;
}

- (IAMWebView)webView
{
  IAMWebView *webView;
  IAMWebView *v4;
  void *v5;
  IAMWebView *v6;
  IAMWebView *v7;
  _WKRemoteObjectInterface *v8;
  _WKRemoteObjectInterface *remoteObjectInterface;
  void *v10;

  webView = self->_webView;
  if (!webView)
  {
    v4 = [IAMWebView alloc];
    objc_msgSend(MEMORY[0x24BDFA920], "sharedMessagesConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[IAMWebView initWithFrame:configuration:](v4, "initWithFrame:configuration:", v5, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v7 = self->_webView;
    self->_webView = v6;

    -[IAMWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
    objc_msgSend(MEMORY[0x24BDFA9B0], "remoteObjectInterfaceWithProtocol:", &unk_254A00198);
    v8 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
    remoteObjectInterface = self->_remoteObjectInterface;
    self->_remoteObjectInterface = v8;

    -[IAMWebView _remoteObjectRegistry](self->_webView, "_remoteObjectRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerExportedObject:interface:", self, self->_remoteObjectInterface);

    webView = self->_webView;
  }
  return webView;
}

- (void)setContentPages:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_contentPages != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contentPages, a3);
    v5 = v6;
    if (self->_isGlobalJSOAvailable && !self->_hasSentContentPages)
    {
      -[IAMWebProcessProxy setWebProcessJSOContentPages:](self->_webProcessProxy, "setWebProcessJSOContentPages:", v6);
      v5 = v6;
      self->_hasSentContentPages = 1;
    }
  }

}

- (void)loadMessageFromMessageEntry:(id)a3 withWebArchiveURL:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[IAMWebMessageController webView](self, "webView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMWebMessageController setLoadCompletion:](self, "setLoadCompletion:", v11);

  objc_storeStrong((id *)&self->_messageEntry, a3);
  if (!v10)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = 1;
LABEL_10:
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("IAMWebMessageErrorDomain"), v20, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IAMWebMessageController _callLoadCompletionWithError:](self, "_callLoadCompletionWithError:", v16);
    goto LABEL_11;
  }
  if ((objc_msgSend(v10, "isFileURL") & 1) == 0)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = 2;
    goto LABEL_10;
  }
  objc_msgSend(v10, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("webarchive"));

  if ((v14 & 1) == 0)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = 3;
    goto LABEL_10;
  }
  -[ICInAppMessageEntry applicationMessage](self->_messageEntry, "applicationMessage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentPages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __91__IAMWebMessageController_loadMessageFromMessageEntry_withWebArchiveURL_completionHandler___block_invoke;
    v21[3] = &unk_24C871678;
    v21[4] = self;
    -[IAMWebMessageController _createJSOContentPages:fromMessageEntry:withBlock:](self, "_createJSOContentPages:fromMessageEntry:withBlock:", v16, v9, v21);
  }
  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v12, "loadFileURL:allowingReadAccessToURL:", v10, v17);

LABEL_11:
}

uint64_t __91__IAMWebMessageController_loadMessageFromMessageEntry_withWebArchiveURL_completionHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setContentPages:", a2);
  return result;
}

- (void)unregisterExportedObjectInterface
{
  id v3;

  -[IAMWebView _remoteObjectRegistry](self->_webView, "_remoteObjectRegistry");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterExportedObject:interface:", self, self->_remoteObjectInterface);

}

- (void)_callLoadCompletionWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[IAMWebMessageController loadCompletion](self, "loadCompletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IAMWebMessageController loadCompletion](self, "loadCompletion");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

    -[IAMWebMessageController setLoadCompletion:](self, "setLoadCompletion:", 0);
  }

}

- (void)_createJSOContentPages:(id)a3 fromMessageEntry:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__IAMWebMessageController__createJSOContentPages_fromMessageEntry_withBlock___block_invoke;
  block[3] = &unk_24C871250;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, block);

}

void __77__IAMWebMessageController__createJSOContentPages_fromMessageEntry_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id obj;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:copyItems:", *(_QWORD *)(a1 + 32), 1);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v23)
  {
    v21 = v2;
    v22 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v5, "imagesCount"))
        {
          v24 = v5;
          v25 = i;
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v5, "images");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v27 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                if (objc_msgSend(v11, "hasIdentifier") && objc_msgSend(v11, "hasURL"))
                {
                  v12 = *(void **)(a1 + 40);
                  objc_msgSend(v11, "identifier");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "cachedLocationForResourceWithIdentifier:", v13);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v14)
                  {
                    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v14, 0);
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "absoluteString");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "setURL:", v16);

                  }
                }
              }
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v8);
          }

          v2 = v21;
          v5 = v24;
          i = v25;
        }
        objc_msgSend(v5, "dictionaryRepresentationWithReportableMetricsEvents");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v17);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v23);
  }

  if (*(_QWORD *)(a1 + 48) && objc_msgSend(v2, "count"))
  {
    v18 = *(_QWORD *)(a1 + 48);
    v19 = (void *)objc_msgSend(v2, "copy");
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

  }
}

- (void)_checkReadyForLoadCompletion
{
  if (self->_didMainNavigationFinish && self->_isGlobalJSOAvailable)
    -[IAMWebMessageController _callLoadCompletionWithError:](self, "_callLoadCompletionWithError:", 0);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  self->_didMainNavigationFinish = 1;
  -[IAMWebMessageController _checkReadyForLoadCompletion](self, "_checkReadyForLoadCompletion", a3, a4);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  -[IAMWebMessageController _callLoadCompletionWithError:](self, "_callLoadCompletionWithError:", a5, a4);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  -[IAMWebMessageController _callLoadCompletionWithError:](self, "_callLoadCompletionWithError:", a5, a4);
}

- (void)webProcessPlugInDidCreateBrowserContextController
{
  void *v3;
  IAMWebProcessProxy *v4;
  IAMWebProcessProxy *webProcessProxy;
  id v6;

  objc_msgSend(MEMORY[0x24BDFA9B0], "remoteObjectInterfaceWithProtocol:", &unk_254A06C88);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IAMWebView _remoteObjectRegistry](self->_webView, "_remoteObjectRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithInterface:", v6);
  v4 = (IAMWebProcessProxy *)objc_claimAutoreleasedReturnValue();
  webProcessProxy = self->_webProcessProxy;
  self->_webProcessProxy = v4;

}

- (void)webProcessPlugInWillDestroyBrowserContextController
{
  id v3;

  -[IAMWebView _remoteObjectRegistry](self->_webView, "_remoteObjectRegistry");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterExportedObject:interface:", self, self->_remoteObjectInterface);

}

- (void)webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame
{
  void *v3;
  uint64_t v4;
  IAMWebProcessProxy *webProcessProxy;
  void *v6;

  -[IAMWebMessageController contentPages](self, "contentPages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 && !self->_hasSentContentPages)
  {
    webProcessProxy = self->_webProcessProxy;
    -[IAMWebMessageController contentPages](self, "contentPages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IAMWebProcessProxy setWebProcessJSOContentPages:](webProcessProxy, "setWebProcessJSOContentPages:", v6);

    self->_hasSentContentPages = 1;
  }
  self->_isGlobalJSOAvailable = 1;
}

- (void)webProcessJSODidReportEvent:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[IAMWebMessageController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[IAMWebMessageController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "webMessageControllerWebViewDidReportEvent:event:", self, v7);

  }
}

- (void)webProcessJSODidCallPerformAction:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[IAMWebMessageController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[IAMWebMessageController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "webMessageControllerWebViewDidRequestAction:actionConfiguration:options:", self, v10, v6);

  }
}

- (void)webProcessJSODidCallOpen:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[IAMWebMessageController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[IAMWebMessageController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "webMessageControllerWebViewDidRequestOpenURL:url:options:", self, v10, v6);

  }
}

- (void)webProcessJSODidCallClose
{
  void *v3;
  char v4;
  id v5;

  -[IAMWebMessageController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[IAMWebMessageController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "webMessageControllerWebViewDidRequestClose:", self);

  }
}

- (IAMWebMessageControllerDelegate)delegate
{
  return (IAMWebMessageControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)contentPages
{
  return self->_contentPages;
}

- (id)loadCompletion
{
  return self->_loadCompletion;
}

- (void)setLoadCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadCompletion, 0);
  objc_storeStrong((id *)&self->_contentPages, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_messageEntry, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_webProcessProxy, 0);
}

@end
