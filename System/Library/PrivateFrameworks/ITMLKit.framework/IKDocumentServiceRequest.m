@implementation IKDocumentServiceRequest

- (void)setDelegate:(id)a3
{
  IKDocumentServiceRequest *v3;
  id v4;
  $2FEBC5FF9AC0463EF06DF9AEFD6EB622 *p_dsrDelegateFlags;
  objc_super v6;

  v3 = self;
  v6.receiver = self;
  v6.super_class = (Class)IKDocumentServiceRequest;
  v4 = a3;
  -[IKServiceRequest setDelegate:](&v6, sel_setDelegate_, v4);
  p_dsrDelegateFlags = &v3->_dsrDelegateFlags;
  v3->_dsrDelegateFlags.hasResponseDictionaryDidChange = objc_opt_respondsToSelector() & 1;
  LOBYTE(v3) = objc_opt_respondsToSelector();

  p_dsrDelegateFlags->hasDocumentDidChange = v3 & 1;
}

- (void)onSend
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD *v13;
  id v14;
  id location;
  _QWORD v16[5];
  id v17;

  -[IKServiceRequest serviceContext](self, "serviceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "element");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1;
  v16[4] = __Block_byref_object_dispose__1;
  -[IKServiceRequest serviceContext](self, "serviceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextDictionary");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[IKServiceRequest appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__IKDocumentServiceRequest_onSend__block_invoke;
  v10[3] = &unk_1E9F4BE30;
  objc_copyWeak(&v14, &location);
  v8 = v4;
  v11 = v8;
  v9 = v5;
  v12 = v9;
  v13 = v16;
  objc_msgSend(v7, "evaluate:completionBlock:", v10, 0);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(v16, 8);

}

void __34__IKDocumentServiceRequest_onSend__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "retrieveJSElementForViewElement:jsContext:", v4, v17);
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (v7)
        {
          v8 = (void *)objc_msgSend(v7, "mutableCopy");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v9 = v8;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("source"));
        v10 = objc_msgSend(v9, "copy");
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

      }
    }
    objc_msgSend(WeakRetained, "appContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "jsViewModelService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "openLinkForType:document:extraInfo:", CFSTR("document"), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeWeak(WeakRetained + 5, v15);
    objc_msgSend(v15, "setDelegate:", WeakRetained);
    objc_msgSend(v15, "document");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(WeakRetained, "documentDidChangeForViewModelLink:", v15);

  }
}

- (void)onCancel
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[IKServiceRequest appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__IKDocumentServiceRequest_onCancel__block_invoke;
  v4[3] = &unk_1E9F4BE58;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "evaluate:completionBlock:", v4, 0);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __36__IKDocumentServiceRequest_onCancel__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 5;
    v5 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 5);
    objc_msgSend(v3, "setDelegate:", 0);

    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "cancel");

    objc_storeWeak(v2, 0);
    WeakRetained = v5;
  }

}

- (void)responseDictionaryDidChangeForViewModelLink:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *responseDictionary;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  objc_msgSend(v4, "asPrivateIKJSViewModelLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "responseDictionary");
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  responseDictionary = self->_responseDictionary;
  self->_responseDictionary = v6;

  objc_initWeak(&location, self);
  -[IKServiceRequest appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__IKDocumentServiceRequest_responseDictionaryDidChangeForViewModelLink___block_invoke;
  v9[3] = &unk_1E9F4BE80;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "evaluateDelegateBlockSync:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __72__IKDocumentServiceRequest_responseDictionaryDidChangeForViewModelLink___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[48])
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "responseDictionaryDidChangeForDocumentServiceRequest:", v3);

    WeakRetained = v3;
  }

}

- (void)documentDidChangeForViewModelLink:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *p_link;
  id WeakRetained;
  void *v10;
  IKAppDocument *v11;
  uint64_t v12;
  IKAppDocument *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v17 = a3;
  p_link = &self->_link;
  WeakRetained = objc_loadWeakRetained((id *)&self->_link);
  objc_msgSend(WeakRetained, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = [IKAppDocument alloc];
    -[IKServiceRequest appContext](self, "appContext");
    v12 = objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained((id *)&self->_link);
    objc_msgSend(v15, "document");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKServiceRequest appContext](self, "appContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jsViewModelService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKServiceRequest serviceContext](self, "serviceContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextDictionary");
    p_link = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)v12;
    v13 = -[IKAppDocument initWithAppContext:document:owner:extraInfo:](v11, "initWithAppContext:document:owner:extraInfo:", v12, v3, v5, p_link);
  }
  else
  {
    v13 = 0;
  }
  objc_storeStrong((id *)&self->_appDocument, v13);
  if (v10)
  {

  }
  objc_initWeak(&location, self);
  -[IKServiceRequest appContext](self, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__IKDocumentServiceRequest_documentDidChangeForViewModelLink___block_invoke;
  v18[3] = &unk_1E9F4BE80;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v14, "evaluateDelegateBlockSync:", v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __62__IKDocumentServiceRequest_documentDidChangeForViewModelLink___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[49])
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "documentDidChangeForDocumentServiceRequest:", v3);

    WeakRetained = v3;
  }

}

- (void)didCloseViewModelLink:(id)a3 withErrorDictionary:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_link);
  objc_msgSend(WeakRetained, "setDelegate:", 0);

  objc_storeWeak((id *)&self->_link, 0);
  -[IKServiceRequest appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__IKDocumentServiceRequest_didCloseViewModelLink_withErrorDictionary___block_invoke;
  v9[3] = &unk_1E9F4BA30;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "evaluateDelegateBlockSync:", v9);

}

uint64_t __70__IKDocumentServiceRequest_didCloseViewModelLink_withErrorDictionary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedWithStatus:errorDictionary:", *(_QWORD *)(a1 + 40) != 0);
}

- (NSDictionary)responseDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (IKAppDocument)appDocument
{
  return (IKAppDocument *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDocument, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_destroyWeak((id *)&self->_link);
}

@end
