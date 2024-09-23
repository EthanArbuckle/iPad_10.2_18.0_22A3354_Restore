@implementation AFSiriTaskDeliveryHandler

- (void)deliverSiriTask:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[AFSiriTaskDeliveryHandler deliverSiriTask:completionHandler:]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_19AF50000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__AFSiriTaskDeliveryHandler_deliverSiriTask_completionHandler___block_invoke;
  v18[3] = &unk_1E3A35B08;
  v19 = v7;
  v10 = v7;
  v11 = (void *)MEMORY[0x1A1AC0C3C](v18);
  queue = self->_queue;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __63__AFSiriTaskDeliveryHandler_deliverSiriTask_completionHandler___block_invoke_2;
  v15[3] = &unk_1E3A36E10;
  v16 = v6;
  v17 = v11;
  v15[4] = self;
  v13 = v6;
  v14 = v11;
  dispatch_async(queue, v15);

}

- (AFSiriTaskService)service
{
  return (AFSiriTaskService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (AFSiriTaskServiceDelegate)delegate
{
  return (AFSiriTaskServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_service);
}

uint64_t __63__AFSiriTaskDeliveryHandler_deliverSiriTask_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __63__AFSiriTaskDeliveryHandler_deliverSiriTask_completionHandler___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));

  if (WeakRetained)
  {
    v3 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v4 = a1[4];
      v5 = v3;
      v6 = objc_loadWeakRetained((id *)(v4 + 24));
      v7 = a1[5];
      *(_DWORD *)buf = 136315906;
      v13 = "-[AFSiriTaskDeliveryHandler deliverSiriTask:completionHandler:]_block_invoke_2";
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %@ asking %@ to handle task %@", buf, 0x2Au);

    }
    v8 = objc_loadWeakRetained((id *)(a1[4] + 24));
    v9 = objc_loadWeakRetained((id *)(a1[4] + 8));
    objc_msgSend(v8, "siriTaskService:handleSiriTask:", v9, a1[5]);

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v10 = a1[6];
    +[AFError errorWithCode:](AFError, "errorWithCode:", 700);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v10 + 16))(v10);

  }
}

@end
