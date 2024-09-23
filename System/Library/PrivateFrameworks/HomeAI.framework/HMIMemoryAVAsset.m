@implementation HMIMemoryAVAsset

- (HMIMemoryAVAsset)initWithData:(id)a3
{
  id v5;
  void *v6;
  HMIMemoryAVAsset *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("hmi://in-memory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)HMIMemoryAVAsset;
  v7 = -[HMIMemoryAVAsset initWithURL:options:](&v12, sel_initWithURL_options_, v6, 0);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_data, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("HMIMemoryAVAsset", v8);

    -[HMIMemoryAVAsset resourceLoader](v7, "resourceLoader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:queue:", v7, v9);

  }
  return v7;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMIMemoryAVAsset *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  HMIMemoryAVAsset *v23;
  NSObject *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "contentInformationRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setContentType:", *MEMORY[0x24BDB1C30]);
    objc_msgSend(v9, "setContentLength:", -[NSData length](self->_data, "length"));
    v10 = (void *)MEMORY[0x220735570](objc_msgSend(v9, "setByteRangeAccessSupported:", 1));
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v13;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Fullfilled content request: %@", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  objc_msgSend(v7, "dataRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    goto LABEL_13;
  if ((objc_msgSend(v14, "requestedOffset") & 0x8000000000000000) == 0
    && (objc_msgSend(v15, "requestedLength") & 0x8000000000000000) == 0)
  {
    v16 = objc_msgSend(v15, "requestedOffset");
    v17 = objc_msgSend(v15, "requestedLength") + v16;
    if (v17 <= -[NSData length](self->_data, "length"))
    {
      v19 = -[NSData bytes](self->_data, "bytes");
      v20 = &v19[objc_msgSend(v15, "requestedOffset")];
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v20, objc_msgSend(v15, "requestedLength"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "respondWithData:", v21);

      v22 = (void *)MEMORY[0x220735570]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v25;
        v29 = 2112;
        v30 = v15;
        _os_log_impl(&dword_219D45000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Fullfilled data request: %@", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
LABEL_13:
      objc_msgSend(v7, "finishLoading");
      v18 = 1;
      goto LABEL_14;
    }
  }
  v18 = 0;
LABEL_14:

  return v18;
}

- (BOOL)loadValuesSynchronously
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  intptr_t v6;
  void *v7;
  HMIMemoryAVAsset *v8;
  NSObject *v9;
  void *v10;
  _QWORD v12[4];
  NSObject *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __43__HMIMemoryAVAsset_loadValuesSynchronously__block_invoke;
  v12[3] = &unk_24DBE9C90;
  v4 = v3;
  v13 = v4;
  -[HMIMemoryAVAsset loadValuesAsynchronouslyForKeys:completionHandler:](self, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24DC150F8, v12);
  v5 = dispatch_time(0, 2000000000);
  v6 = dispatch_semaphore_wait(v4, v5);
  if (v6)
  {
    v7 = (void *)MEMORY[0x220735570]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to loadValuesAsynchronouslyForKeys, due to timeout.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v6 == 0;
}

intptr_t __43__HMIMemoryAVAsset_loadValuesSynchronously__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
