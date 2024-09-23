@implementation HMCharacteristicBatchRequest

void __51__HMCharacteristicBatchRequest_setProgressHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
          v13 = v12;

          if (v13)
            objc_msgSend(v5, "addObject:", v13, (_QWORD)v14);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)progressHandler
{
  return -[HMBatchRequest progressHandler](self->_batchRequest, "progressHandler");
}

- (id)completionHandler
{
  return -[HMBatchRequest completionHandler](self->_batchRequest, "completionHandler");
}

- (HMBatchRequest)batchRequest
{
  return self->_batchRequest;
}

- (void)setProgressHandler:(id)a3
{
  id v4;
  HMBatchRequest *batchRequest;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HMCharacteristicBatchRequest_setProgressHandler___block_invoke;
  v7[3] = &unk_1E3AAEE10;
  v8 = v4;
  batchRequest = self->_batchRequest;
  v6 = v4;
  -[HMBatchRequest setProgressHandler:](batchRequest, "setProgressHandler:", v7);

}

- (void)setCompletionHandler:(id)a3
{
  id v4;
  HMBatchRequest *batchRequest;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HMCharacteristicBatchRequest_setCompletionHandler___block_invoke;
  v7[3] = &unk_1E3AAFEB8;
  v8 = v4;
  batchRequest = self->_batchRequest;
  v6 = v4;
  -[HMBatchRequest setCompletionHandler:](batchRequest, "setCompletionHandler:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchRequest, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

+ (id)characteristicBatchRequestWithReadRequests:(id)a3
{
  void *v3;
  HMCharacteristicBatchRequest *v4;

  +[HMBatchRequest batchRequestWithReadRequests:](HMBatchRequest, "batchRequestWithReadRequests:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMCharacteristicBatchRequest initWithBatchRequest:]([HMCharacteristicBatchRequest alloc], "initWithBatchRequest:", v3);

  return v4;
}

- (HMCharacteristicBatchRequest)initWithBatchRequest:(id)a3
{
  id v5;
  HMCharacteristicBatchRequest *v6;
  HMCharacteristicBatchRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMCharacteristicBatchRequest;
  v6 = -[HMCharacteristicBatchRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_batchRequest, a3);

  return v7;
}

uint64_t __53__HMCharacteristicBatchRequest_setCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)requests
{
  HMBatchRequest *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = self->_batchRequest;
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[HMBatchRequest requests](v2, "requests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMBatchRequest requests](v2, "requests", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (void)setBatchRequest:(id)a3
{
  objc_storeStrong((id *)&self->_batchRequest, a3);
}

+ (id)characteristicBatchRequestWithWriteRequests:(id)a3
{
  void *v3;
  HMCharacteristicBatchRequest *v4;

  +[HMBatchRequest batchRequestWithWriteRequests:](HMBatchRequest, "batchRequestWithWriteRequests:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMCharacteristicBatchRequest initWithBatchRequest:]([HMCharacteristicBatchRequest alloc], "initWithBatchRequest:", v3);

  return v4;
}

@end
