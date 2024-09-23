@implementation IKUpdateServiceRequest

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
  IKUpdateServiceRequest *v13;
  _QWORD *v14;
  id v15;
  id location;
  _QWORD v17[5];
  id v18;

  -[IKServiceRequest serviceContext](self, "serviceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "element");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__27;
  v17[4] = __Block_byref_object_dispose__27;
  -[IKServiceRequest serviceContext](self, "serviceContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextDictionary");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[IKServiceRequest appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__IKUpdateServiceRequest_onSend__block_invoke;
  v10[3] = &unk_1E9F4F460;
  objc_copyWeak(&v15, &location);
  v8 = v5;
  v11 = v8;
  v9 = v4;
  v13 = self;
  v14 = v17;
  v12 = v9;
  objc_msgSend(v7, "evaluate:completionBlock:", v10, 0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(v17, 8);

}

void __32__IKUpdateServiceRequest_onSend__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "retrieveJSElementForViewElement:jsContext:", *(_QWORD *)(a1 + 40), v18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (v5)
      {
        v6 = (void *)objc_msgSend(v5, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v6;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("target"));
      v8 = objc_msgSend(v7, "copy");
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    objc_msgSend(*(id *)(a1 + 32), "jsDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "appContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "jsViewModelService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "openLinkForType:document:extraInfo:", CFSTR("update"), v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeWeak(WeakRetained + 5, v14);
    objc_msgSend(v14, "setDelegate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v14, "document");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v14, "document");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 != v11)
        objc_msgSend(WeakRetained, "documentDidChangeForViewModelLink:", v14);
    }

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
  v4[2] = __34__IKUpdateServiceRequest_onCancel__block_invoke;
  v4[3] = &unk_1E9F4BE58;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "evaluate:completionBlock:", v4, 0);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __34__IKUpdateServiceRequest_onCancel__block_invoke(uint64_t a1)
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

- (void)documentDidChangeForViewModelLink:(id)a3
{
  IKJSViewModelLink **p_link;
  id WeakRetained;
  void *v6;
  IKAppDocument *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  IKAppDocument *v13;
  void *v14;
  IKAppDocument *v15;
  _QWORD v16[5];
  IKAppDocument *v17;

  p_link = &self->_link;
  WeakRetained = objc_loadWeakRetained((id *)&self->_link);
  objc_msgSend(WeakRetained, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [IKAppDocument alloc];
    -[IKServiceRequest appContext](self, "appContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)p_link);
    objc_msgSend(v9, "document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKServiceRequest appContext](self, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "jsViewModelService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[IKAppDocument initWithAppContext:document:owner:](v7, "initWithAppContext:document:owner:", v8, v10, v12);

  }
  else
  {
    v13 = 0;
  }

  -[IKServiceRequest appContext](self, "appContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__IKUpdateServiceRequest_documentDidChangeForViewModelLink___block_invoke;
  v16[3] = &unk_1E9F4BA30;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "evaluateDelegateBlockSync:", v16);

}

void __60__IKUpdateServiceRequest_documentDidChangeForViewModelLink___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateServiceRequest:documentDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

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
  v9[2] = __68__IKUpdateServiceRequest_didCloseViewModelLink_withErrorDictionary___block_invoke;
  v9[3] = &unk_1E9F4BA30;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "evaluateDelegateBlockSync:", v9);

}

uint64_t __68__IKUpdateServiceRequest_didCloseViewModelLink_withErrorDictionary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedWithStatus:errorDictionary:", *(_QWORD *)(a1 + 40) != 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_link);
}

@end
