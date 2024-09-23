@implementation HLPRemoteDataController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelSessionItem:", self->_URLSessionItem);

  v4.receiver = self;
  v4.super_class = (Class)HLPRemoteDataController;
  -[HLPRemoteDataController dealloc](&v4, sel_dealloc);
}

- (HLPRemoteDataController)initWithURL:(id)a3
{
  id v4;
  HLPRemoteDataController *v5;
  HLPRemoteDataController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HLPRemoteDataController;
  v5 = -[HLPRemoteDataController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HLPRemoteDataController setURL:](v5, "setURL:", v4);

  return v6;
}

- (void)fetchDataWithDataType:(int64_t)a3 identifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __objc2_class **v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  HLPURLSessionItem **p_URLSessionItem;
  HLPURLSessionItem *URLSessionItem;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *, uint64_t, uint64_t, void *);
  void *v27;
  HLPRemoteDataController *v28;
  id v29;
  id v30;
  id location;
  _QWORD block[5];
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (!-[HLPRemoteDataController loading](self, "loading"))
  {
    -[HLPRemoteDataController setLoading:](self, "setLoading:", 1);
    -[HLPRemoteDataController URL](self, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isFileURL");

    if (v11)
    {
      dispatch_get_global_queue(0, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke;
      block[3] = &unk_24D32E770;
      block[4] = self;
      v33 = v9;
      dispatch_async(v12, block);

      goto LABEL_17;
    }
    -[HLPRemoteDataController URL](self, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[HLPRemoteDataController setLoading:](self, "setLoading:", 0);
      goto LABEL_17;
    }
    objc_initWeak(&location, self);
    v14 = (void *)MEMORY[0x24BDD16B0];
    -[HLPRemoteDataController URL](self, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestWithURL:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_headerFields)
    {
      objc_msgSend(v16, "setCachePolicy:", 1);
      objc_msgSend(v16, "setAllHTTPHeaderFields:", self->_headerFields);
    }
    +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 1)
    {
      v18 = off_24D32DD08;
    }
    else
    {
      if (a3 != 2)
      {
LABEL_16:

        objc_destroyWeak(&location);
        goto LABEL_17;
      }
      v18 = off_24D32DC88;
    }
    -[__objc2_class sharedInstance](*v18, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      HLPLogForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v16;
        _os_log_impl(&dword_2153AA000, v20, OS_LOG_TYPE_DEFAULT, "Fetching: %@", buf, 0xCu);
      }

      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_7;
      v27 = &unk_24D32E7E8;
      objc_copyWeak(&v30, &location);
      v28 = self;
      v29 = v9;
      objc_msgSend(v19, "formattedDataForRequest:identifier:completionHandler:", v16, v8, &v24);
      v21 = objc_claimAutoreleasedReturnValue();
      URLSessionItem = self->_URLSessionItem;
      p_URLSessionItem = &self->_URLSessionItem;
      *p_URLSessionItem = (HLPURLSessionItem *)v21;

      objc_msgSend(v17, "resumeSessionItem:", *p_URLSessionItem, v24, v25, v26, v27);
      objc_destroyWeak(&v30);

    }
    goto LABEL_16;
  }
LABEL_17:

}

void __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_2;
  v2[3] = &unk_24D32E748;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "processFileURLWithCompletionHandler:", v2);

}

void __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "setLoading:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasLoaded:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;

  v9 = a2;
  v10 = a3;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "URLSessionItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sessionTask");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "response");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || v11)
  {
    objc_msgSend(WeakRetained, "setLoading:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(WeakRetained, "setURLSessionItem:", 0);
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_2_8;
    v20[3] = &unk_24D32E7C0;
    v20[4] = WeakRetained;
    v21 = v10;
    v17 = v9;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    v22 = v17;
    v23 = v18;
    v25 = v19;
    v24 = v15;
    dispatch_async(v16, v20);

  }
}

void __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_2_8(uint64_t a1)
{
  _QWORD block[5];
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "processData:formattedData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_3;
  block[3] = &unk_24D32E798;
  block[4] = *(_QWORD *)(a1 + 56);
  v4 = *(id *)(a1 + 72);
  v3 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __78__HLPRemoteDataController_fetchDataWithDataType_identifier_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLoading:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasLoaded:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setURLSessionItem:", 0);
}

- (void)processFileURLWithCompletionHandler:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HLPRemoteDataController_processFileURLWithCompletionHandler___block_invoke;
  block[3] = &unk_24D32E810;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __63__HLPRemoteDataController_processFileURLWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Not implemented"), 1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v1 + 16))(v1, 0, v2, 0);

}

- (void)cancel
{
  HLPURLSessionItem *URLSessionItem;

  -[HLPRemoteDataController setLoading:](self, "setLoading:", 0);
  -[HLPURLSessionItem cancel](self->_URLSessionItem, "cancel");
  URLSessionItem = self->_URLSessionItem;
  self->_URLSessionItem = 0;

}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void)setHasLoaded:(BOOL)a3
{
  self->_hasLoaded = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)headerFields
{
  return self->_headerFields;
}

- (void)setHeaderFields:(id)a3
{
  objc_storeStrong((id *)&self->_headerFields, a3);
}

- (HLPURLSessionItem)URLSessionItem
{
  return self->_URLSessionItem;
}

- (void)setURLSessionItem:(id)a3
{
  objc_storeStrong((id *)&self->_URLSessionItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLSessionItem, 0);
  objc_storeStrong((id *)&self->_headerFields, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
