@implementation IKJSViewModelLink

- (id)asPrivateIKJSViewModelLink
{
  IKJSViewModelLink *v3;

  if (-[IKJSViewModelLink conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01F7AA8))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (IKJSViewModelLink)init
{
  void *v3;
  IKJSViewModelLink *v4;
  objc_super v6;

  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)IKJSViewModelLink;
  v4 = -[IKJSObject initWithAppContext:](&v6, sel_initWithAppContext_, v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_isClosed)
    -[IKJSViewModelLink _unhandled](self, "_unhandled");
  v3.receiver = self;
  v3.super_class = (Class)IKJSViewModelLink;
  -[IKJSViewModelLink dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  IKJSViewModelLinkDelegate **p_delegate;
  id v5;
  char v6;
  $FF3A6415E39647FA839877B2353031C5 *p_delegateFlags;
  id WeakRetained;
  id v9;

  p_delegate = &self->_delegate;
  v9 = a3;
  v5 = objc_storeWeak((id *)p_delegate, v9);
  v6 = objc_opt_respondsToSelector();

  p_delegateFlags = &self->_delegateFlags;
  self->_delegateFlags.hasDocumentDidChange = v6 & 1;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  p_delegateFlags->hasResponseDictionaryDidChange = objc_opt_respondsToSelector() & 1;

}

- (void)cancel
{
  self->_isClosed = 1;
  -[IKJSEventListenerObject invokeListeners:extraInfo:](self, "invokeListeners:extraInfo:", CFSTR("cancel"), 0);
}

- (void)setResponseDictionary:(id)a3
{
  NSDictionary *v4;
  NSDictionary *responseDictionary;
  id v6;

  if (!self->_isClosed)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    responseDictionary = self->_responseDictionary;
    self->_responseDictionary = v4;

    if (self->_delegateFlags.hasResponseDictionaryDidChange)
    {
      -[IKJSViewModelLink delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "responseDictionaryDidChangeForViewModelLink:", self);

    }
  }
}

- (void)setDocument:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  IKDOMDocument **p_document;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  if (!self->_isClosed)
  {
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0CBE0F0], "currentContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    p_document = &self->_document;
    if (self->_document)
    {
      objc_msgSend(v6, "virtualMachine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeManagedReference:withOwner:", *p_document, self);

    }
    objc_storeStrong((id *)&self->_document, a3);
    if (*p_document)
    {
      objc_msgSend(v7, "virtualMachine");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addManagedReference:withOwner:", *p_document, self);

    }
    if (self->_delegateFlags.hasDocumentDidChange)
    {
      -[IKJSViewModelLink delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "documentDidChangeForViewModelLink:", self);

    }
    v5 = v12;
  }

}

- (void)close:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (!self->_isClosed)
  {
    self->_isClosed = 1;
    -[IKJSObject appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27__IKJSViewModelLink_close___block_invoke;
    v6[3] = &unk_1E9F4C2F0;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "addPostEvaluateBlock:", v6);

  }
}

void __27__IKJSViewModelLink_close___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didCloseViewModelLink:withErrorDictionary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_unhandled
{
  id v3;

  -[IKJSViewModelLink delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didCloseViewModelLink:withErrorDictionary:", self, &unk_1E9F8C980);

}

- (IKDOMDocument)document
{
  return self->_document;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (IKJSViewModelLinkDelegate)delegate
{
  return (IKJSViewModelLinkDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end
