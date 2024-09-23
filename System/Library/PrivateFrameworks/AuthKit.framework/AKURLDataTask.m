@implementation AKURLDataTask

- (void)_completeWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v4 = a3;
  -[AKURLDataTask setCanceledOrCompleted:](self, "setCanceledOrCompleted:", 1);
  if (v4)
  {
    v5 = (void *)MEMORY[0x194022E4C](self->_completionHandler);
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AKURLDataTask _completeWithError:].cold.1();

    v7 = 0;
    v8 = 0;
  }
  else
  {
    -[AKURLDataTask receivedData](self, "receivedData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURLSessionDataTask response](self->_underlyingTask, "response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x194022E4C](self->_completionHandler);
  }
  dispatch_get_global_queue(2, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __36__AKURLDataTask__completeWithError___block_invoke;
  v14[3] = &unk_1E2E5EBB8;
  v15 = v7;
  v16 = v8;
  v17 = v4;
  v18 = v5;
  v10 = v4;
  v11 = v8;
  v12 = v7;
  v13 = v5;
  dispatch_async(v9, v14);

}

uint64_t __36__AKURLDataTask__completeWithError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _underlylingTask: %@>"), v5, self, self->_underlyingTask);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (NSURLSessionDataTask)underlyingTask
{
  return self->_underlyingTask;
}

- (void)setUnderlyingTask:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingTask, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableData)receivedData
{
  return self->_receivedData;
}

- (void)setReceivedData:(id)a3
{
  objc_storeStrong((id *)&self->_receivedData, a3);
}

- (NSError)lastRetryError
{
  return self->_lastRetryError;
}

- (void)setLastRetryError:(id)a3
{
  objc_storeStrong((id *)&self->_lastRetryError, a3);
}

- (BOOL)canceledOrCompleted
{
  return self->_canceledOrCompleted;
}

- (void)setCanceledOrCompleted:(BOOL)a3
{
  self->_canceledOrCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRetryError, 0);
  objc_storeStrong((id *)&self->_receivedData, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_underlyingTask, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)_completeWithError:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_3_0(&dword_19202F000, v1, (uint64_t)v1, "%{public}@ completed with error:%@", v2);
  OUTLINED_FUNCTION_1();
}

@end
