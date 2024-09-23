@implementation NWURLSessionDownloadTask

- (id)initWithLoader:(int)a3 identifier:(void *)a4 session:
{
  id v8;
  id *v9;
  id *v10;

  v8 = a2;
  if (a1)
  {
    v9 = -[NWURLSessionTask initWithRequest:identifier:session:](a1, 0, a3, a4);
    v10 = v9;
    if (v9)
      objc_storeStrong(v9 + 32, a2);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionDownloadTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (id)errorWithResumeData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  v6 = v4;
  if (!self)
    goto LABEL_6;
  v6 = v4;
  if (!v4)
    goto LABEL_6;
  v6 = v4;
  if (objc_msgSend(v4, "code") == -999)
    goto LABEL_6;
  objc_msgSend(v5, "downloadTaskResumeData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[NWURLSessionDownloadTask createResumeData](self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDownloadTaskResumeData:", v6);
LABEL_6:

  }
  return v5;
}

- (void)cancelByProducingResumeData:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__NWURLSessionDownloadTask_cancelByProducingResumeData___block_invoke;
  v7[3] = &unk_1E14ACE18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __56__NWURLSessionDownloadTask_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NWURLError *v3;
  id v4;
  id v5;
  uint64_t v6;
  NWURLError *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD **v14;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  objc_super v26;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (*(_QWORD *)(v2 + 280) == 2)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      return;
    }
    v3 = [NWURLError alloc];
    v4 = *(id *)(v2 + 256);
    v5 = (id)v2;
    if (v3)
    {
      v6 = *MEMORY[0x1E0CB32E8];
      v26.receiver = v3;
      v26.super_class = (Class)NWURLError;
      v7 = (NWURLError *)objc_msgSendSuper2(&v26, sel_initWithDomain_code_userInfo_, v6, -999, 0);
      v3 = v7;
      if (v7)
        -[NWURLError fillErrorForLoader:andTask:](v7, "fillErrorForLoader:andTask:", v4, v5);
    }

    v8 = *(void **)(a1 + 32);
  }
  else
  {
    v8 = 0;
    v3 = 0;
  }
  -[NWURLSessionDownloadTask createResumeData](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLError setDownloadTaskResumeData:](v3, "setDownloadTaskResumeData:", v9);
  v11 = *(void **)(a1 + 32);
  if (v11 && (objc_setProperty_atomic_copy(v11, v10, v3, 136), (v12 = *(_QWORD *)(a1 + 32)) != 0))
  {
    v13 = 240;
    if (!*(_QWORD *)(v12 + 240))
      v13 = 232;
    v14 = (_QWORD **)*(id *)(v12 + v13);
  }
  else
  {
    v14 = 0;
  }
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __56__NWURLSessionDownloadTask_cancelByProducingResumeData___block_invoke_2;
  v23 = &unk_1E14ACE18;
  v25 = *(id *)(a1 + 40);
  v15 = v9;
  v24 = v15;
  if (v14)
    -[NWURLSessionDelegateQueue runDelegateBlock:](v14[6], &v20);

  v16 = *(_QWORD **)(a1 + 32);
  if (v16)
    v17 = (void *)v16[52];
  else
    v17 = 0;
  v18 = v17;
  objc_msgSend(v16, "error", v20, v21, v22, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "task:deliverData:complete:error:completionHandler:", v16, 0, 1, v19, &__block_literal_global_453);

  -[NWURLSessionTask complete](*(_QWORD *)(a1 + 32));
}

- (id)createResumeData
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint8_t v27[16];
  uint8_t v28[2];
  uint8_t v29[16];
  __int16 v30;
  uint8_t buf[2];
  __int16 v32;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "currentRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v4;
    if (objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("http")))
    {
      v6 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("https"));

      if (v6)
      {
        if (__nwlog_url_log::onceToken != -1)
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
        v7 = (id)gurlLogObj;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v32 = 0;
          v8 = "Cannot create download resume data for non-HTTP(S) request";
          v9 = (uint8_t *)&v32;
LABEL_14:
          _os_log_impl(&dword_182FBE000, v7, OS_LOG_TYPE_DEBUG, v8, v9, 2u);
          v1 = 0;
LABEL_44:

          return v1;
        }
        goto LABEL_15;
      }
    }
    else
    {

    }
    objc_msgSend(v2, "HTTPMethod");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("GET"));

    if (v11)
    {
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v7 = (id)gurlLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v8 = "Cannot create download resume data for non-GET request";
        v9 = buf;
        goto LABEL_14;
      }
LABEL_15:
      v1 = 0;
      goto LABEL_44;
    }
    objc_msgSend(v1, "originalRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForHTTPHeaderField:", CFSTR("Range"));
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7
      && (-[NSObject componentsSeparatedByString:](v7, "componentsSeparatedByString:", CFSTR("-")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "count"),
          v13,
          v14 >= 3))
    {
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v15 = (id)gurlLogObj;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        goto LABEL_40;
      v30 = 0;
      v16 = "Cannot create download resume data because original request has multiple ranges";
      v17 = (uint8_t *)&v30;
    }
    else
    {
      objc_msgSend(v1, "response");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        if (__nwlog_url_log::onceToken != -1)
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
        v24 = (id)gurlLogObj;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_182FBE000, v24, OS_LOG_TYPE_DEBUG, "Creating download resume data with nil response", v29, 2u);
        }

        +[NWURLSessionDownloadResumeInfo infoWithTask:]((uint64_t)NWURLSessionDownloadResumeInfo, v1);
        v15 = objc_claimAutoreleasedReturnValue();
        -[NWURLSessionDownloadResumeInfo serialize]((uint64_t)v15);
        v1 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      objc_msgSend(v1, "response");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v1, "response");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject valueForHTTPHeaderField:](v15, "valueForHTTPHeaderField:", CFSTR("ETag"));
        v21 = objc_claimAutoreleasedReturnValue();
        -[NSObject valueForHTTPHeaderField:](v15, "valueForHTTPHeaderField:", CFSTR("Last-Modified"));
        v22 = objc_claimAutoreleasedReturnValue();
        if (v21 | v22)
        {
          +[NWURLSessionDownloadResumeInfo infoWithTask:]((uint64_t)NWURLSessionDownloadResumeInfo, v1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NWURLSessionDownloadResumeInfo serialize]((uint64_t)v25);
          v1 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (__nwlog_url_log::onceToken != -1)
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
          v23 = (id)gurlLogObj;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v27 = 0;
            _os_log_impl(&dword_182FBE000, v23, OS_LOG_TYPE_DEBUG, "Cannot create download resume data without ETag or Last-Modified", v27, 2u);
          }

          v1 = 0;
        }

        goto LABEL_43;
      }
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v15 = (id)gurlLogObj;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
LABEL_40:
        v1 = 0;
LABEL_43:

        goto LABEL_44;
      }
      *(_WORD *)v28 = 0;
      v16 = "Cannot create download resume data with non-HTTP response";
      v17 = v28;
    }
    _os_log_impl(&dword_182FBE000, v15, OS_LOG_TYPE_DEBUG, v16, v17, 2u);
    goto LABEL_40;
  }
  return v1;
}

uint64_t __56__NWURLSessionDownloadTask_cancelByProducingResumeData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)initWithResumeInfo:(uint64_t)a3 fromOffset:(int)a4 identifier:(void *)a5 session:
{
  id *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id *v24;
  const char *v25;
  id *v26;
  id v27;
  id v28;
  double v29;
  id *v30;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  if (!a1)
  {
    v30 = 0;
    goto LABEL_29;
  }
  v11 = v9[2];
  v12 = v9[4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("ETag"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {

      if (!a3)
        goto LABEL_7;
    }
    else
    {
      objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("Last-Modified"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a3)
        goto LABEL_7;
    }
    if (v14)
    {
      v45 = a4;
      v16 = v9[3];
      v15 = (void *)objc_msgSend(v16, "mutableCopy");

      objc_msgSend(v15, "setValue:forHTTPHeaderField:", v14, CFSTR("If-Range"));
      objc_msgSend(v11, "valueForHTTPHeaderField:", CFSTR("Range"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v46, "hasPrefix:", CFSTR("bytes=")))
      {
        objc_msgSend(v46, "componentsSeparatedByString:", CFSTR("="));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v17, "count") <= 1)
        {

        }
        else
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("-"));
            v19 = objc_claimAutoreleasedReturnValue();
            if (-[NSObject count](v19, "count") != 2)
            {
              if (__nwlog_url_log::onceToken != -1)
                dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
              v32 = v18;
              v33 = (id)gurlLogObj;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v48 = v46;
                _os_log_impl(&dword_182FBE000, v33, OS_LOG_TYPE_ERROR, "Unsupported Range header value: %@", buf, 0xCu);
              }

              v30 = 0;
              goto LABEL_28;
            }
            v40 = v18;
            if (objc_msgSend(v18, "hasSuffix:", CFSTR("-")))
            {
              -[NSObject objectAtIndexedSubscript:](v19, "objectAtIndexedSubscript:", 0);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v20, "longLongValue");

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=%lld-"), v41 + a3);
              v21 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setValue:forHTTPHeaderField:", v21, CFSTR("Range"));
              v42 = (void *)v21;
              if (__nwlog_url_log::onceToken != -1)
                dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
              a4 = v45;
              v22 = (id)gurlLogObj;
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                goto LABEL_45;
              *(_DWORD *)buf = 138412290;
              v48 = v42;
            }
            else if (objc_msgSend(v18, "hasPrefix:", CFSTR("-")))
            {
              -[NSObject objectAtIndexedSubscript:](v19, "objectAtIndexedSubscript:", 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v34, "longLongValue");

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=-%lld"), v43 - a3);
              v35 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setValue:forHTTPHeaderField:", v35, CFSTR("Range"));
              a4 = v45;
              v42 = (void *)v35;
              if (__nwlog_url_log::onceToken != -1)
                dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
              v22 = (id)gurlLogObj;
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                goto LABEL_45;
              *(_DWORD *)buf = 138412290;
              v48 = v42;
            }
            else
            {
              -[NSObject objectAtIndexedSubscript:](v19, "objectAtIndexedSubscript:", 0);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v36, "longLongValue");

              -[NSObject objectAtIndexedSubscript:](v19, "objectAtIndexedSubscript:", 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v37, "longLongValue");

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=%lld-%lld"), v39 + a3, v44);
              v38 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setValue:forHTTPHeaderField:", v38, CFSTR("Range"));
              a4 = v45;
              v42 = (void *)v38;
              if (__nwlog_url_log::onceToken != -1)
                dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
              v22 = (id)gurlLogObj;
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                goto LABEL_45;
              *(_DWORD *)buf = 138412290;
              v48 = v42;
            }
            _os_log_impl(&dword_182FBE000, v22, OS_LOG_TYPE_DEBUG, "Request Range header value: %@", buf, 0xCu);
LABEL_45:

            v23 = v40;
LABEL_24:

            goto LABEL_25;
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=%lld-"), a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forHTTPHeaderField:", v23, CFSTR("Range"));
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      a4 = v45;
      v19 = (id)gurlLogObj;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v23;
        _os_log_impl(&dword_182FBE000, v19, OS_LOG_TYPE_DEBUG, "Request Range header value: %@", buf, 0xCu);
      }
      goto LABEL_24;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_7:
  v15 = (void *)objc_msgSend(v11, "mutableCopy");
LABEL_25:
  v24 = -[NWURLSessionTask initWithRequest:identifier:session:](a1, v15, a4, v10);
  v26 = v24;
  if (v24)
  {
    objc_setProperty_nonatomic_copy(v24, v25, v11, 48);
    v27 = v9[5];
    objc_msgSend(v26, "setEarliestBeginDate:", v27);

    objc_msgSend(v26, "setCountOfBytesClientExpectsToSend:", v9[6]);
    objc_msgSend(v26, "setCountOfBytesClientExpectsToReceive:", v9[7]);
    v28 = v9[8];
    objc_msgSend(v26, "setTaskDescription:", v28);

    LODWORD(v29) = *((_DWORD *)v9 + 3);
    objc_msgSend(v26, "setPriority:", v29);
    objc_msgSend(v26, "setPrefersIncrementalDelivery:", *((unsigned __int8 *)v9 + 8));
    objc_msgSend(v26, "set_keepDownloadTaskFile:", *((unsigned __int8 *)v9 + 9));
  }
  a1 = v26;
  v30 = a1;
LABEL_28:

LABEL_29:
  return v30;
}

@end
