@implementation HMCameraClipDownloadAssetDataTask

- (HMCameraClipDownloadAssetDataTask)initWithURL:(id)a3 httpHeaderFields:(id)a4
{
  id v6;
  id v7;
  HMCameraClipDownloadAssetDataTaskHandler *v8;
  HMCameraClipDownloadAssetDataTask *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMCameraClipDownloadAssetDataTaskHandler);
  v9 = -[HMCameraClipDownloadAssetDataTask initWithURL:httpHeaderFields:handler:](self, "initWithURL:httpHeaderFields:handler:", v7, v6, v8);

  return v9;
}

- (HMCameraClipDownloadAssetDataTask)initWithURL:(id)a3 httpHeaderFields:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMCameraClipDownloadAssetDataTask *v11;
  uint64_t v12;
  NSMutableURLRequest *urlRequest;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMCameraClipDownloadAssetDataTask;
  v11 = -[HMCameraClipDownloadAssetDataTask init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v8);
    urlRequest = v11->_urlRequest;
    v11->_urlRequest = (NSMutableURLRequest *)v12;

    -[NSMutableURLRequest setAllHTTPHeaderFields:](v11->_urlRequest, "setAllHTTPHeaderFields:", v9);
    objc_storeStrong((id *)&v11->_handler, a5);
  }

  return v11;
}

- (id)downloadDataForByteRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  HMCameraClipDownloadAssetDataTask *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  id v22;
  NSUInteger v23;
  NSUInteger v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;
  NSRange v32;

  length = a3.length;
  location = a3.location;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32.location = location;
    v32.length = length;
    NSStringFromRange(v32);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraClipDownloadAssetDataTask urlRequest](v7, "urlRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Downloading data with byte range %@ for URL request %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v12 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=%lu-%lu"), location, length + location - 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipDownloadAssetDataTask urlRequest](v7, "urlRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", v13, CFSTR("Range"));

  -[HMCameraClipDownloadAssetDataTask handler](v7, "handler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipDownloadAssetDataTask urlRequest](v7, "urlRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__HMCameraClipDownloadAssetDataTask_downloadDataForByteRange___block_invoke;
  v21[3] = &unk_1E3AAFF98;
  v21[4] = v7;
  v17 = v12;
  v22 = v17;
  v23 = location;
  v24 = length;
  objc_msgSend(v15, "resumeDataTaskWithRequest:completionHandler:", v16, v21);

  v18 = v22;
  v19 = v17;

  return v19;
}

- (NSMutableURLRequest)urlRequest
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 8, 1);
}

- (HMCameraClipDownloadAssetDataTaskHandling)handler
{
  return (HMCameraClipDownloadAssetDataTaskHandling *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
}

void __62__HMCameraClipDownloadAssetDataTask_downloadDataForByteRange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    v10 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      if (objc_msgSend(v12, "statusCode") == 200 || objc_msgSend(v12, "statusCode") == 206)
      {
        v13 = (void *)MEMORY[0x1A1AC1AAC]();
        v14 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromRange(*(NSRange *)(a1 + 48));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138543618;
          v33 = v16;
          v34 = 2112;
          v35 = v17;
          _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully downloaded asset data with byte range %@", (uint8_t *)&v32, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
        objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v7);
        goto LABEL_21;
      }
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v27 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v29;
        v34 = 2048;
        v35 = (id)objc_msgSend(v12, "statusCode");
        _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Received bad HTTP response status code from asset data download: %lu", (uint8_t *)&v32, 0x16u);

      }
    }
    else
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543874;
        v33 = v25;
        v34 = 2112;
        v35 = (id)objc_opt_class();
        v36 = 2112;
        v37 = v10;
        v26 = v35;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Response was not of class NSHTTPURLResponse (class=%@): %@", (uint8_t *)&v32, 0x20u);

      }
    }
    objc_autoreleasePoolPop(v22);
    v30 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "finishWithError:", v31);

LABEL_21:
    goto LABEL_22;
  }
  v18 = (void *)MEMORY[0x1A1AC1AAC]();
  v19 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543618;
    v33 = v21;
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Download of asset data failed: %@", (uint8_t *)&v32, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v9);
LABEL_22:

}

@end
