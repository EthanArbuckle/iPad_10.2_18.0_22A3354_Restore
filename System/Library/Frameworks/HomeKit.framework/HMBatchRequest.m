@implementation HMBatchRequest

- (NSArray)requests
{
  return self->_requests;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (HMReportContext)reportContext
{
  return self->_reportContext;
}

- (HMClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

+ (id)batchRequestWithReadRequests:(id)a3
{
  id v3;
  HMBatchRequest *v4;

  v3 = a3;
  v4 = -[HMBatchRequest initWithRequests:requestClass:]([HMBatchRequest alloc], "initWithRequests:requestClass:", v3, objc_opt_class());

  return v4;
}

- (HMBatchRequest)initWithRequests:(id)a3 requestClass:(Class)a4
{
  id v6;
  HMBatchRequest *v7;
  uint64_t v8;
  NSArray *requests;
  HMBatchRequest *v10;
  objc_super v12;

  v6 = a3;
  if (+[HMBatchRequest validateRequestTypes:requestClass:](HMBatchRequest, "validateRequestTypes:requestClass:", v6, a4))
  {
    v12.receiver = self;
    v12.super_class = (Class)HMBatchRequest;
    v7 = -[HMBatchRequest init](&v12, sel_init);
    if (v7)
    {
      v8 = objc_msgSend(v6, "copy");
      requests = v7->_requests;
      v7->_requests = (NSArray *)v8;

    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)validateRequestTypes:(id)a3 requestClass:(Class)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v10 = 0;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_12:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_reportContext, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

- (void)setClientContext:(id)a3
{
  HMClientContext *v4;
  HMClientContext *clientContext;

  v4 = (HMClientContext *)objc_msgSend(a3, "copy");
  clientContext = self->_clientContext;
  self->_clientContext = v4;

}

- (void)setReportContext:(id)a3
{
  HMReportContext *v4;
  HMReportContext *reportContext;

  v4 = (HMReportContext *)objc_msgSend(a3, "copy");
  reportContext = self->_reportContext;
  self->_reportContext = v4;

}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

+ (id)batchRequestWithWriteRequests:(id)a3
{
  id v3;
  HMBatchRequest *v4;

  v3 = a3;
  v4 = -[HMBatchRequest initWithRequests:requestClass:]([HMBatchRequest alloc], "initWithRequests:requestClass:", v3, objc_opt_class());

  return v4;
}

+ (id)batchRequestWithExecuteRequests:(id)a3
{
  id v3;
  HMBatchRequest *v4;

  v3 = a3;
  v4 = -[HMBatchRequest initWithRequests:requestClass:]([HMBatchRequest alloc], "initWithRequests:requestClass:", v3, objc_opt_class());

  return v4;
}

@end
