@implementation TKCloudKitFetch

- (TKCloudKitFetch)init
{
  TKCloudKitFetch *v3;
  objc_super v4;
  SEL v5;
  TKCloudKitFetch *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)TKCloudKitFetch;
  v6 = -[TKCloudKitFetch init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  TKCloudKitFetch *v4;

  v4 = self;
  v3 = a2;
  -[TKCloudKitFetch cancel](self, "cancel");
  v2.receiver = v4;
  v2.super_class = (Class)TKCloudKitFetch;
  -[TKCloudKitFetch dealloc](&v2, sel_dealloc);
}

- (void)tmlDispose
{
  objc_super v2;
  SEL v3;
  TKCloudKitFetch *v4;

  v4 = self;
  v3 = a2;
  -[TKCloudKitFetch cancel](self, "cancel");
  v2.receiver = v4;
  v2.super_class = (Class)TKCloudKitFetch;
  -[TKCloudKitFetch tmlDispose](&v2, sel_tmlDispose);
}

- (void)setResponse:(id)a3
{
  id location[2];
  TKCloudKitFetch *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_response, location[0]);
  objc_storeStrong(location, 0);
}

- (void)send
{
  TKNetworkTask *v2;
  TKNetworkTask *queryTask;
  id v4;
  NSMutableURLRequest *urlRequest;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *, void *, void *, void *);
  void *v10;
  id v11[3];
  id location[2];
  TKCloudKitFetch *v13;

  v13 = self;
  location[1] = (id)a2;
  if (!self->_active)
  {
    if (v13->_urlRequest)
    {
      v13->_active = 1;
      objc_storeStrong((id *)&v13->_response, 0);
      v13->_cancelled = 0;
      objc_initWeak(location, v13);
      v4 = +[TKNetwork shared](TKNetwork, "shared");
      urlRequest = v13->_urlRequest;
      v6 = MEMORY[0x24BDAC760];
      v7 = -1073741824;
      v8 = 0;
      v9 = __23__TKCloudKitFetch_send__block_invoke;
      v10 = &unk_24E099C78;
      objc_copyWeak(v11, location);
      v2 = (TKNetworkTask *)(id)objc_msgSend(v4, "loadRequest:priority:completion:", urlRequest, 1, &v6);
      queryTask = v13->_queryTask;
      v13->_queryTask = v2;

      objc_destroyWeak(v11);
      objc_destroyWeak(location);
    }
  }
}

void __23__TKCloudKitFetch_send__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id WeakRetained;
  id v8;
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "handleResponse:data:responseError:", location[0], v9, v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)cancel
{
  if (self->_queryTask)
  {
    -[TKNetworkTask cancel](self->_queryTask, "cancel");
    objc_storeStrong((id *)&self->_queryTask, 0);
  }
  self->_cancelled = 1;
  self->_active = 0;
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_downloadURL, 0);
}

- (void)handleResponse:(id)a3 data:(id)a4 responseError:(id)a5
{
  NSURL *v5;
  NSURL *downloadURL;
  NSObject *queue;
  id v8;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  id v22;
  id v23;
  id location[2];
  TKCloudKitFetch *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  if (v25->_cancelled)
  {
    v21 = 1;
    goto LABEL_14;
  }
  if (!v23)
  {
    objc_initWeak(&v17, v25);
    queue = MEMORY[0x24BDAC9B8];
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __53__TKCloudKitFetch_handleResponse_data_responseError___block_invoke;
    v15 = &unk_24E099C50;
    objc_copyWeak(&v16, &v17);
    dispatch_async(queue, &v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v17);
LABEL_10:
    if (v25->_downloadURL)
      -[TKCloudKitFetch downloadAssetFromCloudKit](v25, "downloadAssetFromCloudKit");
    else
      v25->_active = 0;
    v21 = 0;
    goto LABEL_14;
  }
  v20 = 0;
  v18 = 0;
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v23, 1, &v18);
  objc_storeStrong(&v20, v18);
  v19 = v8;
  if (v8)
  {
    v5 = (NSURL *)+[TKCloudKitWSRecord downloadURLFromCloudKitRecordResponse:](TKCloudKitWSRecord, "downloadURLFromCloudKitRecordResponse:", v19);
    downloadURL = v25->_downloadURL;
    v25->_downloadURL = v5;

    v21 = 0;
  }
  else
  {
    -[TKCloudKitFetch emitTMLSignal:withArguments:](v25, "emitTMLSignal:withArguments:", CFSTR("error"), &unk_24E0A4CD8);
    v21 = 1;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  if (!v21)
    goto LABEL_10;
LABEL_14:
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __53__TKCloudKitFetch_handleResponse_data_responseError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "emitTMLSignal:withArguments:", CFSTR("error"), &unk_24E0A4CF0);

}

- (void)downloadAssetFromCloudKit
{
  double v2;
  TKNetworkTask *v3;
  TKNetworkTask *queryTask;
  id v5;
  id v6;
  id v7;
  NSURL *downloadURL;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(id *, void *, void *);
  void *v14;
  id v15[3];
  id v16;
  id location[2];
  TKCloudKitFetch *v18;

  v18 = self;
  location[1] = (id)a2;
  if (self->_downloadURL)
  {
    objc_initWeak(location, v18);
    v9 = objc_alloc(MEMORY[0x24BDD1840]);
    downloadURL = v18->_downloadURL;
    v7 = +[TKNetwork shared](TKNetwork, "shared");
    objc_msgSend(v7, "timeoutInterval");
    v16 = (id)objc_msgSend(v9, "initWithURL:cachePolicy:timeoutInterval:", downloadURL, 0, v2);

    v5 = +[TKNetwork shared](TKNetwork, "shared");
    v6 = v16;
    v10 = MEMORY[0x24BDAC760];
    v11 = -1073741824;
    v12 = 0;
    v13 = __44__TKCloudKitFetch_downloadAssetFromCloudKit__block_invoke;
    v14 = &unk_24E099F48;
    objc_copyWeak(v15, location);
    v3 = (TKNetworkTask *)(id)objc_msgSend(v5, "downloadRequest:priority:completion:", v6, 1, &v10);
    queryTask = v18->_queryTask;
    v18->_queryTask = v3;

    objc_destroyWeak(v15);
    objc_storeStrong(&v16, 0);
    objc_destroyWeak(location);
  }
}

void __44__TKCloudKitFetch_downloadAssetFromCloudKit__block_invoke(id *a1, void *a2, void *a3)
{
  id WeakRetained;
  id v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = 0;
  objc_storeStrong(&v6, a3);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "handleDownloadResponse:error:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)handleDownloadResponse:(id)a3 error:(id)a4
{
  TMLJSONObject *v4;
  TMLJSONObject *response;
  TMLJSONObject *v6;
  id v7;
  id v8;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(id *, char);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location[2];
  TKCloudKitFetch *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v23->_active = 0;
  if (location[0] && objc_msgSend(location[0], "length"))
  {
    v20 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", location[0]);
    v19 = 0;
    v17 = 0;
    v8 = (id)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v20, 0, &v17);
    objc_storeStrong(&v19, v17);
    v18 = v8;
    if (v8 && !v19)
    {
      v4 = (TMLJSONObject *)objc_alloc_init(MEMORY[0x24BEBA7A0]);
      response = v23->_response;
      v23->_response = v4;

      objc_initWeak(&v16, v23);
      v6 = v23->_response;
      v7 = v18;
      v10 = MEMORY[0x24BDAC760];
      v11 = -1073741824;
      v12 = 0;
      v13 = __48__TKCloudKitFetch_handleDownloadResponse_error___block_invoke;
      v14 = &unk_24E099CC8;
      objc_copyWeak(&v15, &v16);
      -[TMLJSONObject setRawJSONAsync:completion:](v6, "setRawJSONAsync:completion:", v7, &v10);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v16);
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __48__TKCloudKitFetch_handleDownloadResponse_error___block_invoke(id *a1, char a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9[2];
  char v10;
  id *v11;

  v11 = a1;
  v10 = a2 & 1;
  v9[1] = a1;
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __48__TKCloudKitFetch_handleDownloadResponse_error___block_invoke_2;
  v8 = &unk_24E099C50;
  objc_copyWeak(v9, a1 + 4);
  dispatch_async(queue, &v4);

  objc_destroyWeak(v9);
}

void __48__TKCloudKitFetch_handleDownloadResponse_error___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id WeakRetained;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (id)objc_msgSend(v4, "response");
  v6[0] = v3;
  v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  objc_msgSend(WeakRetained, "emitTMLSignal:withArguments:", CFSTR("load"));

}

- (NSMutableURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
  objc_storeStrong((id *)&self->_urlRequest, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (NSError)error
{
  return self->_error;
}

- (TMLJSONObject)response
{
  return self->_response;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (NSURL)downloadURL
{
  return self->_downloadURL;
}

- (void)setDownloadURL:(id)a3
{
  objc_storeStrong((id *)&self->_downloadURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadURL, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_queryTask, 0);
}

@end
