@implementation SUUIClientContextPreviewContainer

- (SUUIClientContextPreviewContainer)initWithAppContext:(id)a3 clientContext:(id)a4 previewContainerViewController:(id)a5
{
  id v8;
  id v9;
  SUUIClientContextPreviewContainer *v10;
  SUUIClientContextPreviewContainer *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SUUIClientContextPreviewContainer;
  v10 = -[IKJSObject initWithAppContext:](&v13, sel_initWithAppContext_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_clientContext, v8);
    objc_storeStrong((id *)&v11->_previewContainerViewController, a5);
  }

  return v11;
}

- (void)previewDocument:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v6 && self->_previewContainerViewController)
  {
    -[IKJSObject appContext](self, "appContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BE51938], "instancesRespondToSelector:", sel_initWithAppContext_document_owner_))v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51938]), "initWithAppContext:document:owner:", v8, v6, self);
    else
      v9 = 0;
    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __54__SUUIClientContextPreviewContainer_previewDocument::__block_invoke;
    v12[3] = &unk_2511F9790;
    v12[4] = self;
    v13 = v9;
    v14 = v7;
    v11 = v9;
    objc_msgSend(v10, "evaluateDelegateBlockSync:", v12);

  }
}

void __54__SUUIClientContextPreviewContainer_previewDocument::__block_invoke(_QWORD *a1)
{
  SUUIDocumentContainerViewController *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  SUUIDocumentContainerViewController *v6;

  if (*(_QWORD *)(a1[4] + 32))
  {
    v2 = [SUUIDocumentContainerViewController alloc];
    v4 = a1[5];
    v3 = a1[6];
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
    v6 = -[SUUIDocumentContainerViewController initWithDocument:options:clientContext:](v2, "initWithDocument:options:clientContext:", v4, v3, WeakRetained);

    objc_msgSend(*(id *)(a1[4] + 32), "setChildViewController:", v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewContainerViewController, 0);
  objc_destroyWeak((id *)&self->_clientContext);
}

@end
