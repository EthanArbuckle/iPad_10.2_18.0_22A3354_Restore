@implementation AMSRatingsProviderTask

- (id)initForAllMediaWithStoreFront:(id)a3 clientIdentifier:(id)a4 useCase:(unint64_t)a5 bag:(id)a6
{
  id v11;
  id v12;
  id v13;
  AMSRatingsProviderTask *v14;
  AMSRatingsProviderTask *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AMSRatingsProviderTask;
  v14 = -[AMSTask init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_mediaType = 5;
    objc_storeStrong((id *)&v14->_storeFront, a3);
    objc_storeStrong((id *)&v15->_clientIdentifier, a4);
    v15->_useCase = a5;
    objc_storeStrong((id *)&v15->_bag, a6);
  }

  return v15;
}

- (id)initForAllMediaWithUnratedRatingsForStoreFront:(id)a3 clientIdentifier:(id)a4 useCase:(unint64_t)a5 bag:(id)a6
{
  id v11;
  id v12;
  id v13;
  AMSRatingsProviderTask *v14;
  AMSRatingsProviderTask *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AMSRatingsProviderTask;
  v14 = -[AMSTask init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_mediaType = 6;
    objc_storeStrong((id *)&v14->_storeFront, a3);
    objc_storeStrong((id *)&v15->_clientIdentifier, a4);
    v15->_useCase = a5;
    objc_storeStrong((id *)&v15->_bag, a6);
  }

  return v15;
}

- (id)initForAllMediaWithClientIdentifier:(id)a3 useCase:(unint64_t)a4 bag:(id)a5
{
  return -[AMSRatingsProviderTask initForAllMediaWithStoreFront:clientIdentifier:useCase:bag:](self, "initForAllMediaWithStoreFront:clientIdentifier:useCase:bag:", 0, a3, a4, a5);
}

- (AMSRatingsProviderTask)initWithMediaType:(unint64_t)a3 clientIdentifier:(id)a4 bag:(id)a5
{
  return -[AMSRatingsProviderTask initWithMediaType:storeFront:clientIdentifier:bag:](self, "initWithMediaType:storeFront:clientIdentifier:bag:", a3, 0, a4, a5);
}

- (AMSRatingsProviderTask)initWithMediaType:(unint64_t)a3 storeFront:(id)a4 clientIdentifier:(id)a5 bag:(id)a6
{
  id v11;
  id v12;
  id v13;
  AMSRatingsProviderTask *v14;
  AMSRatingsProviderTask *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AMSRatingsProviderTask;
  v14 = -[AMSTask init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_storeFront, a4);
    v15->_mediaType = a3;
    objc_storeStrong((id *)&v15->_clientIdentifier, a5);
    objc_storeStrong((id *)&v15->_bag, a6);
  }

  return v15;
}

- (id)resultWithCachedData:(id)a3
{
  id v4;
  AMSRatingsProviderResult *v5;
  unint64_t v6;
  void *v7;
  AMSRatingsProviderResult *v8;

  if (a3)
  {
    v4 = a3;
    v5 = [AMSRatingsProviderResult alloc];
    v6 = -[AMSRatingsProviderTask mediaType](self, "mediaType");
    -[AMSRatingsProviderTask storeFront](self, "storeFront");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AMSRatingsProviderResult initWithData:mediaType:andStoreFront:](v5, "initWithData:mediaType:andStoreFront:", v4, v6, v7);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)performTask
{
  objc_super v3;
  _QWORD v4[5];

  v4[1] = 3221225472;
  v4[2] = __37__AMSRatingsProviderTask_performTask__block_invoke;
  v4[3] = &unk_1E25454D0;
  v4[4] = self;
  v3.receiver = self;
  v3.super_class = (Class)AMSRatingsProviderTask;
  v4[0] = MEMORY[0x1E0C809B0];
  -[AMSTask performTaskWithBlock:](&v3, sel_performTaskWithBlock_, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

AMSRatingsProviderResult *__37__AMSRatingsProviderTask_performTask__block_invoke(uint64_t a1, _QWORD *a2)
{
  AMSRatingsCache *v4;
  uint64_t v5;
  void *v6;
  AMSRatingsCache *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  AMSMediaRequestEncoder *v19;
  void *v20;
  void *v21;
  AMSMediaRequestEncoder *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  AMSRatingsProviderResult *v37;
  void *v38;
  AMSRatingsProviderResult *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  BOOL v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  _QWORD *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = [AMSRatingsCache alloc];
  v5 = objc_msgSend(*(id *)(a1 + 32), "mediaType");
  objc_msgSend(*(id *)(a1 + 32), "storeFront");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSRatingsCache initWithMediaType:storeFront:](v4, "initWithMediaType:storeFront:", v5, v6);

  -[AMSRatingsCache getCacheData](v7, "getCacheData");
  v8 = objc_claimAutoreleasedReturnValue();
  -[AMSRatingsCache clearCacheIfNeeded](v7, "clearCacheIfNeeded");
  AMSLogKey();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v57 = 0;
  objc_msgSend(v9, "_urlForMediaType:error:", objc_msgSend(v9, "mediaType"), &v57);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v57;
  v12 = v11;
  v53 = (void *)v8;
  if (!v10 || v11)
  {
    AMSError(7, CFSTR("Ratings URL not found"), CFSTR("Could not load a ratings URL for this media type."), v11);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    v18 = 0;
LABEL_20:
    AMSError(3, CFSTR("Failed to create media request from ratings URL"), CFSTR("An error occurred when attempting to encode the media request."), v28);
    v32 = objc_claimAutoreleasedReturnValue();
LABEL_21:

    v36 = v53;
LABEL_22:
    objc_msgSend(*(id *)(a1 + 32), "resultWithCachedData:", v36);
    v37 = (AMSRatingsProviderResult *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)v32;
    goto LABEL_23;
  }
  +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_opt_class();
    objc_msgSend(v10, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v59 = v15;
    v60 = 2114;
    v61 = v54;
    v62 = 2112;
    v63 = (uint64_t)v16;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] URL for Ratings: %@.", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMediaSharedProperties propertiesForRatingsTask:](AMSMediaSharedProperties, "propertiesForRatingsTask:", *(_QWORD *)(a1 + 32));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [AMSMediaRequestEncoder alloc];
  objc_msgSend(v18, "tokenService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[AMSMediaRequestEncoder initWithTokenService:bag:](v19, "initWithTokenService:bag:", v20, v21);

  -[AMSMediaRequestEncoder setLogKey:](v22, "setLogKey:", v54);
  -[AMSMediaRequestEncoder requestByEncodingRequest:parameters:](v22, "requestByEncodingRequest:parameters:", v17, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v24, "OSLogObject");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v59 = v26;
    v60 = 2114;
    v61 = v54;
    v62 = 2112;
    v63 = (uint64_t)v17;
    _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request generated: %@.", buf, 0x20u);
  }

  v56 = 0;
  objc_msgSend(v23, "resultWithTimeout:error:", &v56, 60.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v56;

  if (!v27 || v28)
    goto LABEL_20;
  objc_msgSend(v18, "session");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dataTaskPromiseWithRequest:", v27);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  v55 = 0;
  objc_msgSend(v28, "resultWithTimeout:error:", &v55, 60.0);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v55;
  v52 = (void *)v30;
  if (v31)
  {
    v32 = (uint64_t)v31;
    +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v33, "OSLogObject");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v59 = v35;
      v60 = 2114;
      v61 = v54;
      v62 = 2112;
      v63 = v32;
      _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Request completed with error: %@.", buf, 0x20u);
    }

    goto LABEL_21;
  }
  v51 = a2;
  v40 = [AMSRatingsProviderResult alloc];
  v41 = objc_msgSend(*(id *)(a1 + 32), "mediaType");
  objc_msgSend(*(id *)(a1 + 32), "storeFront");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[AMSRatingsProviderResult initWithURLResult:mediaType:andStoreFront:](v40, "initWithURLResult:mediaType:andStoreFront:", v30, v41, v42);

  +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v43)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v43, "OSLogObject");
  v44 = objc_claimAutoreleasedReturnValue();
  a2 = v51;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v59 = v45;
    v60 = 2114;
    v61 = v54;
    v62 = 2112;
    v63 = (uint64_t)v52;
    _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request completed: %@.", buf, 0x20u);
  }

  objc_msgSend(v52, "data");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[AMSRatingsCache addCacheData:](v7, "addCacheData:", v46);

  if (!v47)
  {
    +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v48)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v48, "OSLogObject");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v50 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v59 = v50;
      v60 = 2114;
      v61 = v54;
      _os_log_impl(&dword_18C849000, v49, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cache data", buf, 0x16u);
    }

  }
  v32 = 0;
  v38 = 0;
  v36 = v53;
  if (!v37)
    goto LABEL_22;
LABEL_23:
  if (a2)
    *a2 = objc_retainAutorelease(v38);

  return v37;
}

+ (id)ratingWithValue:(id)a3 mediaType:(unint64_t)a4 storeFront:(id)a5 clientIdentifier:(id)a6 bag:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  AMSRatingsProviderTask *v15;
  void *v16;
  AMSMutablePromise *v17;
  AMSMutablePromise *v18;
  id v19;
  AMSMutablePromise *v20;
  AMSMutablePromise *v21;
  _QWORD v23[4];
  id v24;
  AMSMutablePromise *v25;

  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = -[AMSRatingsProviderTask initWithMediaType:storeFront:clientIdentifier:bag:]([AMSRatingsProviderTask alloc], "initWithMediaType:storeFront:clientIdentifier:bag:", a4, v14, v13, v12);

  -[AMSRatingsProviderTask performTask](v15, "performTask");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(AMSMutablePromise);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__AMSRatingsProviderTask_ratingWithValue_mediaType_storeFront_clientIdentifier_bag___block_invoke;
  v23[3] = &unk_1E25454F8;
  v24 = v11;
  v18 = v17;
  v25 = v18;
  v19 = v11;
  objc_msgSend(v16, "addFinishBlock:", v23);
  v20 = v25;
  v21 = v18;

  return v21;
}

void __84__AMSRatingsProviderTask_ratingWithValue_mediaType_storeFront_clientIdentifier_bag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
    goto LABEL_39;
  }
  v33 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v5, "ratingsStoreFronts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (!v36)
    goto LABEL_37;
  v35 = *(_QWORD *)v55;
  v40 = v5;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v55 != v35)
      {
        v9 = v8;
        objc_enumerationMutation(obj);
        v8 = v9;
      }
      v37 = v8;
      v10 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v8);
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      objc_msgSend(v10, "ratingSystems");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      if (v42)
      {
        v41 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v51 != v41)
              objc_enumerationMutation(v39);
            v43 = i;
            v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            objc_msgSend(v12, "contentRatings");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            if (!v14)
            {
              v16 = v13;
              goto LABEL_32;
            }
            v15 = v14;
            v16 = 0;
            v17 = *(_QWORD *)v47;
            v44 = *(_QWORD *)v47;
            do
            {
              v18 = 0;
              v45 = v15;
              do
              {
                if (*(_QWORD *)v47 != v17)
                  objc_enumerationMutation(v13);
                v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v18);
                if (*(_QWORD *)(a1 + 32)
                  && (objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v18), "value"),
                      v20 = (void *)objc_claimAutoreleasedReturnValue(),
                      v21 = objc_msgSend(v20, "isEqualToNumber:", *(_QWORD *)(a1 + 32)),
                      v20,
                      v21))
                {
                  v22 = v19;

                  v16 = v22;
                }
                else if (v16)
                {
                  objc_msgSend(v19, "value");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "intValue");
                  if (v24 >= (int)objc_msgSend(*(id *)(a1 + 32), "intValue"))
                  {

                  }
                  else
                  {
                    v25 = v13;
                    objc_msgSend(v19, "value");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v26, "intValue");
                    objc_msgSend(v16, "value");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = objc_msgSend(v28, "intValue");

                    if (v27 > v29)
                    {
                      v30 = v19;

                      v16 = v30;
                    }
                    v13 = v25;
                    v17 = v44;
                    v15 = v45;
                  }
                }
                else
                {
                  v16 = v19;
                }
                ++v18;
              }
              while (v15 != v18);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            }
            while (v15);

            v5 = v40;
            i = v43;
            if (v16)
            {
              objc_msgSend(v38, "addObject:", v16);
LABEL_32:

              continue;
            }
          }
          v42 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        }
        while (v42);
      }

      v8 = v37 + 1;
    }
    while (v37 + 1 != v36);
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  }
  while (v36);
LABEL_37:

  v31 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v38);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "finishWithResult:", v32);

  v7 = v33;
LABEL_39:

}

- (id)_urlForMediaType:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v51;
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[AMSRatingsProviderTask _commonQueryItems](self, "_commonQueryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0uLL:
      -[AMSRatingsProviderTask storeFront](self, "storeFront");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("AMSRatingsProviderVideoURL");
      v11 = CFSTR("AMSRatingsProviderVideoAllURL");
      goto LABEL_10;
    case 1uLL:
      -[AMSRatingsProviderTask storeFront](self, "storeFront");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("AMSRatingsProviderMusicURL");
      v11 = CFSTR("AMSRatingsProviderMusicAllURL");
      goto LABEL_10;
    case 2uLL:
      -[AMSRatingsProviderTask storeFront](self, "storeFront");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("AMSRatingsProviderAppsURL");
      if (!v12)
        v13 = CFSTR("AMSRatingsProviderAppsAllURL");
      v14 = v13;

      -[AMSRatingsProviderTask _appQueryItems](self, "_appQueryItems");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 3uLL:
      -[AMSRatingsProviderTask storeFront](self, "storeFront");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("AMSRatingsProviderPodcastsURL");
      v11 = CFSTR("AMSRatingsProviderPodcastsAllURL");
      goto LABEL_10;
    case 4uLL:
      -[AMSRatingsProviderTask storeFront](self, "storeFront");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("AMSRatingsProviderBooksURL");
      v11 = CFSTR("AMSRatingsProviderBooksAllURL");
      goto LABEL_10;
    case 6uLL:
      -[AMSRatingsProviderTask storeFront](self, "storeFront");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("AMSRatingsProviderMediaURL");
      if (!v16)
        v17 = CFSTR("AMSRatingsProviderMediaAllURL");
      v14 = v17;

      -[AMSRatingsProviderTask _unratedRatingQueryItem](self, "_unratedRatingQueryItem");
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v9 = (void *)v15;
      objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v15);
      v18 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v18;
      break;
    default:
      -[AMSRatingsProviderTask storeFront](self, "storeFront");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("AMSRatingsProviderMediaURL");
      v11 = CFSTR("AMSRatingsProviderMediaAllURL");
LABEL_10:
      if (!v8)
        v10 = (__CFString *)v11;
      v14 = v10;
      break;
  }

  -[AMSRatingsProviderTask bag](self, "bag");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringForKey:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  objc_msgSend(v20, "valueWithError:", &v52);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v52;

  if (v21)
  {
    if (-[AMSRatingsProviderTask useCase](self, "useCase") == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("useCase=%@"), CFSTR("screenTime"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("useCase=%@"), v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v24;
    }
    -[AMSRatingsProviderTask storeFront](self, "storeFront");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      -[AMSRatingsProviderTask storeFront](self, "storeFront");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "length");

      if (v28)
      {
        v29 = (void *)MEMORY[0x1E0CB3940];
        v51 = v22;
        -[AMSRatingsProviderTask storeFront](self, "storeFront");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), &v51, v30);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v51;

        v21 = (void *)v31;
        v22 = v32;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)v33;
      if (!v7)
        goto LABEL_39;
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v33, 0);
      objc_msgSend(v35, "queryItems");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      v38 = (void *)MEMORY[0x1E0C9AA60];
      if (v36)
        v38 = (void *)v36;
      v39 = v38;

      objc_msgSend(v39, "arrayByAddingObjectsFromArray:", v7);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "setQueryItems:", v40);
      objc_msgSend(v35, "URL");
      v41 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v41;
    }
    else
    {
      +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v45)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v45, "OSLogObject");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = objc_opt_class();
        AMSLogKey();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v21);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v54 = v47;
        v55 = 2114;
        v56 = v48;
        v57 = 2112;
        v58 = v49;
        _os_log_impl(&dword_18C849000, v46, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error creating URL from string: %@.", buf, 0x20u);

      }
      AMSError(200, CFSTR("Ratings URL string malformed"), CFSTR("Failed to create URL from bag-provided URL string"), 0);
      v34 = 0;
      v35 = v22;
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[AMSLogConfig sharedRatingsProviderConfig](AMSLogConfig, "sharedRatingsProviderConfig");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v35, "OSLogObject");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = objc_opt_class();
      AMSLogKey();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v54 = v43;
      v55 = 2114;
      v56 = v44;
      v57 = 2112;
      v58 = v22;
      _os_log_impl(&dword_18C849000, v42, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error loading URL from bag: %@.", buf, 0x20u);

    }
    v21 = 0;
    v34 = 0;
  }

LABEL_39:
  if (a4)
    *a4 = objc_retainAutorelease(v22);

  return v34;
}

- (id)_appQueryItems
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[AMSMediaURLBuilderUtility devicePlatform](AMSMediaURLBuilderUtility, "devicePlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("platform"), v3);
    objc_msgSend(v2, "addObject:", v4);

  }
  return v2;
}

- (id)_unratedRatingQueryItem
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("with"), CFSTR("unratedRating"));
  objc_msgSend(v2, "addObject:", v3);

  return v2;
}

- (id)_commonQueryItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AMSRatingsProviderTask bag](self, "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("language-tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[AMSDevice language](AMSDevice, "language");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("l"), v9);
    objc_msgSend(v3, "addObject:", v10);

  }
  return v3;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSRatingsProvider");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)storeFront
{
  return self->_storeFront;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (unint64_t)useCase
{
  return self->_useCase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
}

@end
