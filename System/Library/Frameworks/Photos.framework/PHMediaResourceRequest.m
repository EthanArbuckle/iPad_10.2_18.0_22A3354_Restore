@implementation PHMediaResourceRequest

- (PHMediaResourceRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 assetResource:(id)a8 networkAccessAllowed:(BOOL)a9 downloadIntent:(int64_t)a10 downloadPriority:(int64_t)a11 wantsURLOnly:(BOOL)a12 synchronous:(BOOL)a13 delegate:(id)a14
{
  uint64_t v18;
  id v21;
  PHAssetResource *v22;
  id v23;
  PHMediaResourceRequest *v24;
  PHMediaResourceRequest *v25;
  PHMediaResourceResult *v26;
  PHMediaResourceResult *dataResult;
  void *v29;
  void *v30;
  objc_super v31;

  v18 = *(_QWORD *)&a3;
  v21 = a7;
  v22 = (PHAssetResource *)a8;
  v23 = a14;
  if (v21)
  {
    if (v22)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaResourceRequest.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v22)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaResourceRequest.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetResource"));

LABEL_3:
  v31.receiver = self;
  v31.super_class = (Class)PHMediaResourceRequest;
  v24 = -[PHMediaRequest initWithRequestID:requestIndex:contextType:managerID:asset:delegate:](&v31, sel_initWithRequestID_requestIndex_contextType_managerID_asset_delegate_, v18, a4, a5, a6, v21, v23);
  v25 = v24;
  if (v24)
  {
    v24->_resource = v22;
    v24->_networkAccessAllowed = a9;
    v24->_downloadIntent = a10;
    v24->_downloadPriority = a11;
    v24->_synchronous = a13;
    v24->_wantsURLOnly = a12;
    v26 = -[PHMediaResourceResult initWithRequestID:assetResource:]([PHMediaResourceResult alloc], "initWithRequestID:assetResource:", v18, v22);
    dataResult = v25->_dataResult;
    v25->_dataResult = v26;

  }
  return v25;
}

- (int64_t)resourceType
{
  return -[PHAssetResource type](self->_resource, "type");
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)startRequest
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  PHAssetResourceRequestOptions *v8;
  uint64_t v9;
  PHAssetResourceRequest *v10;
  PHAssetResource *resource;
  uint64_t v12;
  unint64_t v13;
  PHAssetResourceRequest *v14;
  PHAssetResourceRequest *internalRequest;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PHMediaRequest identifierString](self, "identifierString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _PHAssetResourceTypeDescription(-[PHMediaResourceRequest resourceType](self, "resourceType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v4;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEFAULT, "[RM] %@ Starting media resource request for resource type %@", buf, 0x16u);

  }
  if (self->_networkAccessAllowed && self->_synchronous)
  {
    PLImageManagerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[PHMediaRequest identifierString](self, "identifierString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEBUG, "[RM] %@ resource request starting with both synchronous and network access allowed - warning, result may block for a long time", buf, 0xCu);

    }
  }
  v8 = objc_alloc_init(PHAssetResourceRequestOptions);
  -[PHAssetResourceRequestOptions setNetworkAccessAllowed:](v8, "setNetworkAccessAllowed:", self->_networkAccessAllowed);
  -[PHAssetResourceRequestOptions setDownloadIntent:](v8, "setDownloadIntent:", self->_downloadIntent);
  -[PHAssetResourceRequestOptions setDownloadPriority:](v8, "setDownloadPriority:", self->_downloadPriority);
  objc_initWeak((id *)buf, self);
  v9 = MEMORY[0x1E0C809B0];
  if (self->_progressHandler)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __38__PHMediaResourceRequest_startRequest__block_invoke;
    v23[3] = &unk_1E35DFB70;
    objc_copyWeak(&v24, (id *)buf);
    -[PHAssetResourceRequestOptions setProgressHandler:](v8, "setProgressHandler:", v23);
    objc_destroyWeak(&v24);
  }
  v10 = [PHAssetResourceRequest alloc];
  resource = self->_resource;
  v12 = -[PHMediaRequest requestID](self, "requestID");
  v13 = -[PHMediaRequest managerID](self, "managerID");
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __38__PHMediaResourceRequest_startRequest__block_invoke_2;
  v21[3] = &unk_1E35DFB98;
  objc_copyWeak(&v22, (id *)buf);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __38__PHMediaResourceRequest_startRequest__block_invoke_3;
  v19[3] = &unk_1E35DFBC0;
  objc_copyWeak(&v20, (id *)buf);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __38__PHMediaResourceRequest_startRequest__block_invoke_4;
  v17[3] = &unk_1E35DFBE8;
  objc_copyWeak(&v18, (id *)buf);
  v14 = -[PHAssetResourceRequest initWithAssetResource:options:requestID:managerID:delegate:urlReceivedHandler:dataReceivedHandler:completionHandler:](v10, "initWithAssetResource:options:requestID:managerID:delegate:urlReceivedHandler:dataReceivedHandler:completionHandler:", resource, v8, v12, v13, self, v21, v19, v17);
  internalRequest = self->_internalRequest;
  self->_internalRequest = v14;

  -[PHMediaRequest identifierString](self, "identifierString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAssetResourceRequest setTaskIdentifier:](self->_internalRequest, "setTaskIdentifier:", v16);

  -[PHAssetResourceRequest setLoadURLOnly:](self->_internalRequest, "setLoadURLOnly:", self->_wantsURLOnly);
  -[PHAssetResourceRequest setSynchronous:](self->_internalRequest, "setSynchronous:", self->_synchronous);
  -[PHAssetResourceRequest startRequest](self->_internalRequest, "startRequest");
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHMediaResourceRequest;
  -[PHMediaRequest cancel](&v3, sel_cancel);
  -[PHAssetResourceRequest cancel](self->_internalRequest, "cancel");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _PHAssetResourceTypeDescription(-[PHAssetResource type](self->_resource, "type"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("Y");
  if (self->_networkAccessAllowed)
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  if (!self->_wantsURLOnly)
    v8 = CFSTR("N");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> - type: %@, net: %@, url-only: %@"), v5, self, v6, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)_reportProgress:(double)a3
{
  (*((void (**)(double))self->_progressHandler + 2))(a3);
}

- (void)_handleDidFindFileURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLImageManagerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[PHMediaRequest identifierString](self, "identifierString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "[RM] %@ Media resource request determined resource url: %@", (uint8_t *)&v7, 0x16u);

  }
  -[PHMediaResourceResult setAssetResourceFileURL:](self->_dataResult, "setAssetResourceFileURL:", v4);

}

- (void)_receiveAssetResourceDataPart:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableData *compositeData;
  NSMutableData *v8;
  NSMutableData *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLImageManagerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[PHMediaRequest identifierString](self, "identifierString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v6;
    v12 = 2048;
    v13 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "[RM] %@ Media resource request receiving data with length: %ld", (uint8_t *)&v10, 0x16u);

  }
  compositeData = self->_compositeData;
  if (!compositeData)
  {
    v8 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v9 = self->_compositeData;
    self->_compositeData = v8;

    compositeData = self->_compositeData;
  }
  -[NSMutableData appendData:](compositeData, "appendData:", v4);

}

- (void)_finishWithError:(id)a3
{
  id v4;
  void (**progressHandler)(id, uint64_t, id, double);
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  progressHandler = (void (**)(id, uint64_t, id, double))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 1, v4, 1.0);
  PLImageManagerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[PHMediaRequest identifierString](self, "identifierString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_DEBUG, "[RM] %@ Media resource request finished with error: %@", (uint8_t *)&v8, 0x16u);

  }
  -[PHCompositeMediaResult setError:](self->_dataResult, "setError:", v4);

}

- (void)assetResourceRequest:(id)a3 didFinishWithError:(id)a4
{
  PHMediaResourceResult *dataResult;
  void *v6;
  id v7;

  -[PHMediaResourceResult setAssetResourceData:](self->_dataResult, "setAssetResourceData:", self->_compositeData, a4);
  dataResult = self->_dataResult;
  -[PHAssetResourceRequest info](self->_internalRequest, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCompositeMediaResult addInfoFromDictionary:](dataResult, "addInfoFromDictionary:", v6);

  -[PHMediaRequest delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaRequest:didFinishWithResult:", self, self->_dataResult);

}

- (BOOL)retryAssetResourceRequest:(id)a3 afterFailureWithError:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[PHMediaRequest delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "retryMediaRequest:afterFailureWithError:", self, v5);

  return (char)self;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (PHAssetResource)resource
{
  return self->_resource;
}

- (BOOL)wantsURLOnly
{
  return self->_wantsURLOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dataResult, 0);
  objc_storeStrong((id *)&self->_compositeData, 0);
  objc_storeStrong((id *)&self->_internalRequest, 0);
}

void __38__PHMediaResourceRequest_startRequest__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportProgress:", a2);

}

void __38__PHMediaResourceRequest_startRequest__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleDidFindFileURL:", v3);

}

void __38__PHMediaResourceRequest_startRequest__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_receiveAssetResourceDataPart:", v3);

}

void __38__PHMediaResourceRequest_startRequest__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_finishWithError:", v3);

}

@end
