@implementation ProxyReplayerBatchRequest

void __ProxyReplayerBatchRequest_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *nsobject_classes;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  uint64_t uint64;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCF20]);
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v5, "response", v10);
    objc_msgSend(nsobject_classes, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 || (uint64 = xpc_dictionary_get_uint64(v5, "bulkDataHandle")) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 32), "completionHandler");
        v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v14)[2](v14, nsobject_classes);

      }
      objc_msgSend(*(id *)(a1 + 40), "completed");
    }
    else
    {
      v18 = uint64;
      objc_msgSend(*(id *)(a1 + 48), "transferOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setCompressionAlgorithm:", *(_QWORD *)(a1 + 56));
      v20 = *(void **)(a1 + 48);
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __ProxyReplayerBatchRequest_block_invoke_2;
      v21[3] = &unk_24F8280B0;
      v22 = nsobject_classes;
      v23 = *(id *)(a1 + 32);
      v24 = *(id *)(a1 + 40);
      objc_msgSend(v20, "downloadData:usingTransferOptions:completionHandler:", v18, v19, v21);

    }
  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setError:", v6);
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v16)[2](v16, v10);

    }
    objc_msgSend(*(id *)(a1 + 40), "completed");
  }

}

void __ProxyReplayerBatchRequest_block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  objc_msgSend(a1[4], "setData:", a2);
  if (!a2)
    objc_msgSend(a1[4], "setError:", v7);
  objc_msgSend(a1[5], "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1[5], "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, a1[4]);

  }
  objc_msgSend(a1[6], "completed");

}

@end
