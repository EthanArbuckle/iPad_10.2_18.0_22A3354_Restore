@implementation QLPreviewExtensionServiceContext_iOS

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_15);
  return (id)_extensionAuxiliaryVendorProtocol___interface_0;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_211);
  return (id)_extensionAuxiliaryHostProtocol___interface_0;
}

- (id)protocolHost
{
  void *v2;
  void *v3;

  -[QLPreviewExtensionServiceContext_iOS _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_212);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)previewControllerWantsFullScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewExtensionServiceContext_iOS protocolHost](self, "protocolHost");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewControllerWantsFullScreen:", v3);

}

- (void)previewControllerDidUpdateTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewExtensionServiceContext_iOS protocolHost](self, "protocolHost");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewControllerDidUpdateTitle:", v4);

}

- (void)previewControllerDidUpdatePreferredContentSize:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewExtensionServiceContext_iOS protocolHost](self, "protocolHost");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewControllerDidUpdatePreferredContentSize:", v4);

}

- (void)previewWillAppear:(BOOL)a3
{
  void *v3;
  char v4;

  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
    QLRunInMainThread();
}

- (void)previewDidAppear:(BOOL)a3
{
  void *v3;
  char v4;

  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
    QLRunInMainThread();
}

- (void)previewWillDisappear:(BOOL)a3
{
  void *v3;
  char v4;

  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
    QLRunInMainThread();
}

- (void)previewDidDisappear:(BOOL)a3
{
  void *v3;
  char v4;

  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
    QLRunInMainThread();
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v5 = a3;
  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = v5;
    QLRunInMainThread();

  }
}

- (void)getPrinterProxyWithCompletionHandler:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "printer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v7);

  }
  else
  {
    v8[2](v8, 0);
  }

}

- (void)getARQLInlineProxyWithCompletionHandler:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_254A11E88);

  if (v5)
  {
    -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)getARQLInlineProxy2WithCompletionHandler:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_254A1ACE0);

  if (v5)
  {
    -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)getARQLInlineProxy3WithCompletionHandler:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_254A1B058);

  if (v5)
  {
    -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6);

  }
  else
  {
    v7[2](v7, 0);
  }

}

- (void)setHostViewControllerProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v4 = a3;
  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = v4;
      QLRunInMainThread();

    }
  }
  else
  {

  }
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  id v23;
  void *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "canBeShared");
    if ((_DWORD)v14 != objc_msgSend(v13, "isShareEnabled"))
      objc_msgSend(v13, "setIsShareEnabled:", v14);
    objc_msgSend(v9, "clientPreviewOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v13, "previewOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqual:", v15);

      if ((v17 & 1) == 0)
        objc_msgSend(v13, "setPreviewOptions:", v15);
    }

  }
  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientPreviewItemDisplayState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v18, "previewItemDisplayState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqual:", v19);

    if ((v21 & 1) == 0)
      objc_msgSend(v18, "setPreviewItemDisplayState:", v19);
  }
  v24 = v8;
  v22 = v10;
  v23 = v8;
  QLRunInMainThread();

}

- (void)generatePreviewForURL:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  char isKindOfClass;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  void (**v20)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[QLPreviewExtensionServiceContext_iOS previewProvider](self, "previewProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  -[QLPreviewExtensionServiceContext_iOS previewProvider](self, "previewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLRemoteItemViewController"), 3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v16);

    goto LABEL_6;
  }
  v11 = objc_alloc(MEMORY[0x24BE7BED8]);
  objc_msgSend(v6, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithURL:", v12);

  -[QLPreviewExtensionServiceContext_iOS previewProvider](self, "previewProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__QLPreviewExtensionServiceContext_iOS_generatePreviewForURL_completion___block_invoke;
  v17[3] = &unk_24C726DD8;
  v20 = v7;
  v18 = v13;
  v19 = v6;
  v15 = v13;
  objc_msgSend(v14, "providePreviewForFileRequest:completionHandler:", v15, v17);

LABEL_6:
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[QLPreviewExtensionServiceContext_iOS inputItems](self, "inputItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__QLPreviewExtensionServiceContext_iOS_invalidateServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C725600;
  v8 = v4;
  v6 = v4;
  -[QLPreviewExtensionServiceContext_iOS completeRequestReturningItems:completionHandler:](self, "completeRequestReturningItems:completionHandler:", v5, v7);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  if (a6 == &QLRemoteItemViewControllerContext)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("title")))
    {
      objc_msgSend(v11, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewExtensionServiceContext_iOS previewControllerDidUpdateTitle:](self, "previewControllerDidUpdateTitle:", v12);
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("preferredContentSize")))
        goto LABEL_8;
      v13 = (void *)MEMORY[0x24BDD1968];
      objc_msgSend(v11, "preferredContentSize");
      objc_msgSend(v13, "valueWithCGSize:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewExtensionServiceContext_iOS previewControllerDidUpdatePreferredContentSize:](self, "previewControllerDidUpdatePreferredContentSize:", v12);
    }

    goto LABEL_8;
  }
  v14.receiver = self;
  v14.super_class = (Class)QLPreviewExtensionServiceContext_iOS;
  -[QLPreviewExtensionServiceContext_iOS observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, a5, a6);
LABEL_8:

}

- (void)_startObservingPreviewControllerAttributeChanges
{
  void *v3;
  void *v4;

  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("title"), 0, &QLRemoteItemViewControllerContext);

  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("preferredContentSize"), 0, &QLRemoteItemViewControllerContext);

  self->_isObservingPreviewController = 1;
}

- (void)_stopObservingPreviewControllerAttributeChanges
{
  void *v3;
  void *v4;

  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("title"), &QLRemoteItemViewControllerContext);

  -[QLPreviewExtensionServiceContext_iOS previewViewController](self, "previewViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("preferredContentSize"), &QLRemoteItemViewControllerContext);

  self->_isObservingPreviewController = 0;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_isObservingPreviewController)
    -[QLPreviewExtensionServiceContext_iOS _stopObservingPreviewControllerAttributeChanges](self, "_stopObservingPreviewControllerAttributeChanges");
  v3.receiver = self;
  v3.super_class = (Class)QLPreviewExtensionServiceContext_iOS;
  -[QLPreviewExtensionServiceContext_iOS dealloc](&v3, sel_dealloc);
}

- (QLPreviewingController)previewProvider
{
  return self->_previewProvider;
}

- (void)setPreviewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_previewProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewProvider, 0);
  objc_storeStrong(&self->_contents, 0);
}

@end
