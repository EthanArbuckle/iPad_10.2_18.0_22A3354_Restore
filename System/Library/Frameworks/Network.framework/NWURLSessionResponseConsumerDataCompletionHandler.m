@implementation NWURLSessionResponseConsumerDataCompletionHandler

- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5
{
  id v8;
  const char *v9;
  OS_dispatch_data *data;
  uint64_t v11;
  OS_dispatch_data *v12;
  id v13;
  uint64_t v14;
  void (**v15)(id, uint64_t, _QWORD);

  v15 = (void (**)(id, uint64_t, _QWORD))a5;
  v8 = a4;
  data = (OS_dispatch_data *)a3;
  if (self)
  {
    objc_setProperty_atomic(self, v9, v8, 16);
    v11 = countOfBytesExpectedToReceive(v8);

    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](data, v11);
    v12 = (OS_dispatch_data *)MEMORY[0x1E0C80D00];
    v13 = MEMORY[0x1E0C80D00];
    data = self->_data;
    self->_data = v12;
  }
  else
  {
    v14 = countOfBytesExpectedToReceive(v8);

    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](data, v14);
  }

  v15[2](v15, 1, 0);
}

- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  char *v12;
  NSObject *v13;
  id v14;
  void (**v15)(id, _QWORD);
  OS_dispatch_data *data;
  NSObject *v17;
  dispatch_data_t concat;
  id v19;
  OS_dispatch_data *v20;
  SEL v21;
  id Property;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  OS_dispatch_data *v27;
  id *v28;
  const char *v29;
  id *v30;
  int v31;
  id v32;
  void *v33;
  id *v34;
  id *v35;
  void *v36;
  id v37;
  OS_dispatch_data *v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  OS_dispatch_data *v43;
  id v44;
  id v45;

  v9 = a5;
  v12 = (char *)a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  if (v13)
  {
    if (self)
      data = self->_data;
    else
      data = 0;
    v17 = data;
    concat = dispatch_data_create_concat(v17, v13);
    if (self)
      objc_storeStrong((id *)&self->_data, concat);

    -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v12, -[NWURLSessionResponseConsumerDataCompletionHandler countOfBytesReceived](self, "countOfBytesReceived"));
  }
  if (v9)
  {
    -[NWURLSessionTask finishProgressReporting]((uint64_t)v12);
    if (self)
    {
      v19 = self->_completionHandler;
      v20 = self->_data;
      Property = objc_getProperty(self, v21, 16, 1);
    }
    else
    {
      v20 = 0;
      v19 = 0;
      Property = 0;
    }
    v23 = Property;
    if (v12)
    {
      v24 = 240;
      if (!*((_QWORD *)v12 + 30))
        v24 = 232;
      v25 = *(id *)&v12[v24];
    }
    else
    {
      v25 = 0;
    }
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __103__NWURLSessionResponseConsumerDataCompletionHandler_task_deliverData_complete_error_completionHandler___block_invoke;
    v41[3] = &unk_1E14AAE78;
    v42 = v14;
    v43 = v20;
    v44 = v23;
    v45 = v19;
    v26 = v23;
    v27 = v20;
    v39 = v26;
    v40 = v14;
    v37 = v19;
    v38 = v27;
    if (v12)
    {
      v28 = (id *)*((id *)v12 + 50);
      v30 = v28;
      if (v28)
        v31 = objc_msgSend(v28[3], "_callCompletionHandlerInline", v37, v27, v26);
      else
        v31 = 0;
      v32 = objc_getProperty(v12, v29, 432, 1);
      objc_msgSend(*((id *)v12 + 32), "takeCachedResponse");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (id *)*((id *)v12 + 50);
      v35 = v34;
      if (v34)
      {
        objc_msgSend(v34[2], "URLCache");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = 0;
      }
    }
    else
    {
      v35 = 0;
      v32 = 0;
      v30 = 0;
      v31 = 0;
      v33 = 0;
      v36 = 0;
    }
    -[NWURLSessionDelegateWrapper runCompletionHandler:noAsync:task:metrics:cachedResponse:cache:]((uint64_t)v25, v41, v31, v12, v32, v33, v36);

    v14 = v40;
  }
  v15[2](v15, 0);

}

- (NSURLResponse)response
{
  if (self)
    self = (NWURLSessionResponseConsumerDataCompletionHandler *)objc_getProperty(self, a2, 16, 1);
  return (NSURLResponse *)self;
}

- (int64_t)countOfBytesReceived
{
  OS_dispatch_data *v3;
  OS_dispatch_data *v4;
  size_t size;

  if (!self)
    return 0;
  v3 = self->_data;
  if (!v3)
    return 0;
  v4 = v3;
  size = dispatch_data_get_size((dispatch_data_t)self->_data);

  return size;
}

- (id)createResumeInfo
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_currentResponse, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __103__NWURLSessionResponseConsumerDataCompletionHandler_task_deliverData_complete_error_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[4];
  v3 = a1[7];
  if (v2)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, a1[6]);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[5], a1[6]);
}

- (id)initWithCompletionHandler:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NWURLSessionResponseConsumerDataCompletionHandler;
    a1 = (id *)objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = _Block_copy(v3);
      v5 = a1[1];
      a1[1] = v4;

      objc_storeStrong(a1 + 3, MEMORY[0x1E0C80D00]);
    }
  }

  return a1;
}

@end
