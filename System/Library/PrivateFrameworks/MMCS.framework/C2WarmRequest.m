@implementation C2WarmRequest

- (C2WarmRequest)initWithData:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  C2WarmRequest *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id callback;
  int v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  C2WarmRequest *v35;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)C2WarmRequest;
  v8 = -[C2WarmRequest init](&v38, sel_init);
  if (!v8)
    goto LABEL_43;
  if (!v6)
  {
    v15 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3C3F000, v15, OS_LOG_TYPE_ERROR, "Missing data, cannot init C2WarmRequest", buf, 2u);
    }
    goto LABEL_42;
  }
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v37);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v37;
  v11 = v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    v13 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v11;
      v14 = "Error deserializing request options with error %@";
LABEL_20:
      _os_log_impl(&dword_1D3C3F000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  objc_msgSend(v9, "invokedURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("C2WarmRequest requestUUID:%@"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v9, "setIdentifier:", v19);
        v20 = (void *)MEMORY[0x1E0CB3998];
        objc_msgSend(v9, "invokedURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsWithURL:resolvingAgainstBaseURL:", v21, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v22, "setQueryItems:", MEMORY[0x1E0C9AA60]);
          objc_msgSend(v22, "setPath:", CFSTR("/asset/init"));
          objc_msgSend(v22, "URL");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v23);
            v25 = v24;
            if (v24)
            {
              objc_msgSend(v24, "setValue:forHTTPHeaderField:", v18, CFSTR("x-apple-request-uuid"));
              objc_storeStrong((id *)&v8->_warmRequest, v25);
              v26 = MEMORY[0x1D8253850](v7);
              callback = v8->_callback;
              v8->_callback = (id)v26;

              objc_storeStrong((id *)&v8->_warmOptions, v9);
              v28 = 0;
            }
            else
            {
              v34 = mmcs_logging_logger_default();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v40 = v23;
                _os_log_impl(&dword_1D3C3F000, v34, OS_LOG_TYPE_ERROR, "Error initializing urlRequest with warmURL %@", buf, 0xCu);
              }
              v28 = 1;
            }

          }
          else
          {
            v33 = mmcs_logging_logger_default();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v40 = v22;
              _os_log_impl(&dword_1D3C3F000, v33, OS_LOG_TYPE_ERROR, "Error initializing warmURL with urlComponents %@", buf, 0xCu);
            }
            v28 = 1;
          }

        }
        else
        {
          v31 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v9, "invokedURL");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v40 = v32;
            _os_log_impl(&dword_1D3C3F000, v31, OS_LOG_TYPE_ERROR, "Error initializing urlComponents with url %@", buf, 0xCu);

          }
          v28 = 1;
        }

      }
      else
      {
        v30 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D3C3F000, v30, OS_LOG_TYPE_ERROR, "Error initializing requestIdentifier", buf, 2u);
        }
        v28 = 1;
      }

    }
    else
    {
      v29 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3C3F000, v29, OS_LOG_TYPE_ERROR, "Error initializing requestUUID", buf, 2u);
      }
      v28 = 1;
    }

    if (v28)
      goto LABEL_42;
LABEL_43:
    v35 = v8;
    goto LABEL_44;
  }
  v13 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v9;
    v14 = "Request options missing invokedURL %@ required for warming.";
    goto LABEL_20;
  }
LABEL_21:

LABEL_42:
  v35 = 0;
LABEL_44:

  return v35;
}

- (void)send
{
  void *v4;
  NSURLSessionTask *v5;
  NSURLSessionTask *warmTask;
  NSURLSessionTask *v7;
  CFErrorRef error;
  void (**callback)(id, CFErrorRef);
  void *v10;
  void *v11;

  if (!self->_warmRequest)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("mmcs_http_warm.m"), 79, CFSTR("warmRequest must not be nil."));

  }
  if (!self->_warmOptions)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("mmcs_http_warm.m"), 80, CFSTR("warmOptions must not be nil."));

  }
  objc_msgSend(MEMORY[0x1E0D03780], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDataTaskWithRequest:options:delegate:sessionHandle:", self->_warmRequest, self->_warmOptions, self, 0);
  v5 = (NSURLSessionTask *)objc_claimAutoreleasedReturnValue();
  warmTask = self->_warmTask;
  self->_warmTask = v5;

  v7 = self->_warmTask;
  if (v7)
  {
    -[NSURLSessionTask resume](v7, "resume");
  }
  else
  {
    error = mmcs_cferror_create_error(CFSTR("com.apple.mmcs"), 1, CFSTR("Error generating dataTask for C2WarmRequest."));
    callback = (void (**)(id, CFErrorRef))self->_callback;
    if (callback)
      callback[2](callback, error);
    if (error)
      CFRelease(error);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, id))a6 + 2))(a6, a5);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CFErrorRef error_with_underlying_error;
  void (**callback)(id, CFErrorRef);
  char v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v14 = v9;
    error_with_underlying_error = mmcs_cferror_create_error_with_underlying_error(CFSTR("com.apple.mmcs"), 38, v9, CFSTR("Encountered Network Error on Warm Request"), v10, v11, v12, v13, v17);

  }
  else
  {
    error_with_underlying_error = 0;
  }
  callback = (void (**)(id, CFErrorRef))self->_callback;
  if (callback)
    callback[2](callback, error_with_underlying_error);

}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("mmcs_http_warm.m"), 130, CFSTR("Unexpected callback."));

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  (*((void (**)(id, id))a7 + 2))(a7, a6);
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableURLRequest)warmRequest
{
  return self->_warmRequest;
}

- (void)setWarmRequest:(id)a3
{
  objc_storeStrong((id *)&self->_warmRequest, a3);
}

- (C2RequestOptions)warmOptions
{
  return self->_warmOptions;
}

- (void)setWarmOptions:(id)a3
{
  objc_storeStrong((id *)&self->_warmOptions, a3);
}

- (NSURLSessionTask)warmTask
{
  return self->_warmTask;
}

- (void)setWarmTask:(id)a3
{
  objc_storeStrong((id *)&self->_warmTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warmTask, 0);
  objc_storeStrong((id *)&self->_warmOptions, 0);
  objc_storeStrong((id *)&self->_warmRequest, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end
