@implementation SUUIStoreAssetResourceLoaderDelegate

+ (id)storeAssetResourceLoaderDelegateForPlayableAsset:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  SUUIStoreAssetResourceLoaderDelegate *v7;
  SUUIStoreAssetResourceLoaderDelegate *v8;
  NSURL *clientContext;
  uint64_t v10;
  NSURL *v11;
  SUUIStoreAssetResourceLoaderDelegate *v12;
  NSURL *keyCertificateURL;
  NSURL *v14;
  NSURL *keyServerURL;
  SUUIClientContext *v16;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "shouldUseITunesStoreSecureKeyDelivery"))
  {
    objc_msgSend(v5, "keyCertificateURL");
    clientContext = (NSURL *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyServerURL");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (NSURL *)v10;
    if (!clientContext || !v10 || (v12 = objc_alloc_init(SUUIStoreAssetResourceLoaderDelegate)) == 0)
    {

      v8 = 0;
      goto LABEL_10;
    }
    v8 = v12;
    keyCertificateURL = v12->_keyCertificateURL;
    v12->_keyCertificateURL = clientContext;
    v14 = clientContext;

    keyServerURL = v8->_keyServerURL;
    v8->_keyServerURL = v11;

    v8->_isITunesStream = objc_msgSend(v5, "isITunesStream");
LABEL_8:
    v16 = (SUUIClientContext *)v6;
    clientContext = (NSURL *)v8->_clientContext;
    v8->_clientContext = v16;
LABEL_10:

    goto LABEL_11;
  }
  v7 = objc_alloc_init(SUUIStoreAssetResourceLoaderDelegate);
  v8 = v7;
  if (v7)
  {
    v7->_shouldUseITunesStoreSecureKeyDelivery = 1;
    goto LABEL_8;
  }
LABEL_11:

  return v8;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSOperationQueue *v9;
  NSOperationQueue *operationQueue;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD aBlock[4];
  id v24;
  SUUIStoreAssetResourceLoaderDelegate *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v6 = a3;
  v7 = a4;
  v8 = SSVAssetResourceLoadingRequestContainsSecureKeyDeliveryRequest();
  if (v8)
  {
    if (!self->_operationQueue)
    {
      v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
      operationQueue = self->_operationQueue;
      self->_operationQueue = v9;

      -[NSOperationQueue setName:](self->_operationQueue, "setName:", CFSTR("com.apple.iTunesStoreUI.SUUIStoreAssetResourceLoaderDelegate.operationQueue"));
      -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 3);
    }
    v39 = 0;
    v40 = (id *)&v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__7;
    v43 = __Block_byref_object_dispose__7;
    v44 = 0;
    v33 = 0;
    v34 = (id *)&v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__7;
    v37 = __Block_byref_object_dispose__7;
    v38 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v11 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__SUUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
    aBlock[3] = &unk_2511F5540;
    v26 = &v39;
    v27 = &v33;
    v28 = &v29;
    v24 = v7;
    v25 = self;
    v12 = _Block_copy(aBlock);
    if (self->_shouldUseITunesStoreSecureKeyDelivery)
    {
      *((_BYTE *)v30 + 24) = 1;
      -[SUUIClientContext URLBag](self->_clientContext, "URLBag");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        v16 = (void *)MEMORY[0x24BEB1FF0];
        objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "URLBagForContext:", v17);
        v15 = (id)objc_claimAutoreleasedReturnValue();

      }
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __95__SUUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3;
      v19[3] = &unk_2511F5568;
      v21 = &v33;
      v22 = &v39;
      v20 = v12;
      objc_msgSend(v15, "loadWithCompletionBlock:", v19);

    }
    else
    {
      objc_storeStrong(v40 + 5, self->_keyCertificateURL);
      objc_storeStrong(v34 + 5, self->_keyServerURL);
      *((_BYTE *)v30 + 24) = self->_isITunesStream;
      (*((void (**)(void *, _QWORD))v12 + 2))(v12, 0);
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&v39, 8);
  }

  return v8;
}

void __95__SUUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishLoadingWithError:", v3);
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
      && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v4 = objc_alloc_init(MEMORY[0x24BEB2070]);
      objc_msgSend(v4, "setITunesStoreRequest:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      objc_msgSend(v4, "setCertificateURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v4, "setKeyServerURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      objc_msgSend(v4, "setResourceLoadingRequest:", *(_QWORD *)(a1 + 32));
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __95__SUUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2;
      v6[3] = &unk_2511F5518;
      v7 = *(id *)(a1 + 32);
      objc_msgSend(v4, "setResponseBlock:", v6);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addOperation:", v4);

    }
    else
    {
      v5 = *(void **)(a1 + 32);
      SSError();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "finishLoadingWithError:", v4);
    }

  }
}

uint64_t __95__SUUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishLoadingWithError:", a2);
  else
    return objc_msgSend(v2, "finishLoading");
}

void __95__SUUIStoreAssetResourceLoaderDelegate_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  if (!v14)
  {
    v5 = (objc_class *)MEMORY[0x24BEB2098];
    v6 = a2;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithURLBagDictionary:", v6);

    objc_msgSend(v7, "pastisKeyServerURL");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[5] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(v7, "pastisCertificateURL");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  (*(void (**)(void))(a1[4] + 16))();

}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
}

@end
