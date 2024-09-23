@implementation TabDocumentForPageTest

- (id)createTabDocumentView
{
  return objc_alloc_init(TabDocumentViewForPageTest);
}

- (void)setFixedWebViewSize:(CGSize)a3 completionHandler:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[TabDocument view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFixedWebViewSize:completionHandler:", v7, width, height);

}

- (void)setMetadataHandler:(id)a3
{
  void *v5;
  id metadataHandler;
  TabDocumentForPageTest *v7;
  id v8;

  v5 = _Block_copy(a3);
  metadataHandler = self->_metadataHandler;
  self->_metadataHandler = v5;

  if (a3)
    v7 = self;
  else
    v7 = 0;
  -[TabDocument autoFillController](self, "autoFillController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTestController:", v7);

}

- (void)_webViewWebProcessDidCrash:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)TabDocumentForPageTest;
  -[TabDocument _webViewWebProcessDidCrash:](&v9, sel__webViewWebProcessDidCrash_, a3);
  -[TabDocument autoFillController](self, "autoFillController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0D8B1B8];
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = CFSTR("WebContent process crashed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabDocumentForPageTest autoFillController:didFailFormMetadataForTesting:](self, "autoFillController:didFailFormMetadataForTesting:", v4, v8);

}

- (BOOL)autoFillControllerShouldCollectFormMetadataForTesting:(id)a3
{
  return self->_metadataHandler != 0;
}

- (void)autoFillController:(id)a3 didCollectFormMetadataForTesting:(id)a4 forURL:(id)a5
{
  void (**metadataHandler)(id, id, _QWORD);
  id v7;

  metadataHandler = (void (**)(id, id, _QWORD))self->_metadataHandler;
  if (metadataHandler)
  {
    metadataHandler[2](metadataHandler, a4, 0);
    v7 = self->_metadataHandler;
    self->_metadataHandler = 0;

  }
}

- (void)autoFillController:(id)a3 didFailFormMetadataForTesting:(id)a4
{
  void (**metadataHandler)(id, _QWORD, id);
  id v6;

  metadataHandler = (void (**)(id, _QWORD, id))self->_metadataHandler;
  if (metadataHandler)
  {
    metadataHandler[2](metadataHandler, 0, a4);
    v6 = self->_metadataHandler;
    self->_metadataHandler = 0;

  }
}

- (id)metadataHandler
{
  return self->_metadataHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_metadataHandler, 0);
}

@end
