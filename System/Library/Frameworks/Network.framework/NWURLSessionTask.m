@implementation NWURLSessionTask

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (void)dealloc
{
  objc_super v3;

  -[NWURLSessionTask setSecTrust:](self, "setSecTrust:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NWURLSessionTask;
  -[NWURLSessionTask dealloc](&v3, sel_dealloc);
}

- (void)resume
{
  void *v3;
  void *v4;
  NSObject *v5;
  NWURLSessionTaskConfiguration *v6;
  id *p_isa;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NWURLSessionTaskConfiguration *configuration;
  double v12;
  uint64_t v13;
  qos_class_t v14;
  NSObject *queue;
  _QWORD v16[5];
  int v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  qos_class_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  __int128 *v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v35 = 0uLL;
  -[NWURLSessionTask _nw_activity](self, "_nw_activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    nw_activity_activate(v3);
    nw_activity_get_token(v4, &v35);
  }
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v5 = (id)gurlLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    if (self)
    {
      v6 = self->_configuration;
      p_isa = (id *)&v6->super.isa;
      v8 = 0;
      v9 = 0;
      if (v6)
      {
        if (-[NSURLRequest _explicitlySetTimeoutInterval](v6->_request, "_explicitlySetTimeoutInterval"))
          objc_msgSend(p_isa[4], "timeoutInterval");
        else
          objc_msgSend(p_isa[2], "timeoutIntervalForRequest");
        v9 = v10;
      }
      configuration = self->_configuration;
      if (configuration)
      {
        -[NWURLSessionTask _timeoutIntervalForResource](configuration->_task, "_timeoutIntervalForResource");
        if (v12 == 0.0)
          -[NSURLSessionConfiguration timeoutIntervalForResource](configuration->_configuration, "timeoutIntervalForResource");
        else
          -[NWURLSessionTask _timeoutIntervalForResource](configuration->_task, "_timeoutIntervalForResource");
        v8 = v13;
      }
    }
    else
    {
      p_isa = 0;
      v9 = 0;
      v8 = 0;
    }
    v14 = qos_class_self();
    *(_DWORD *)buf = 68290562;
    v20 = 16;
    v21 = 2098;
    v22 = &v18;
    v23 = 1024;
    v24 = v17;
    v25 = 2048;
    v26 = v9;
    v27 = 2048;
    v28 = v8;
    v29 = 1024;
    v30 = v14;
    v31 = 1042;
    v32 = 16;
    v33 = 2098;
    v34 = &v35;
    _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> resuming, timeouts(%.1f, %.1f), qos(0x%x), activity(%{public,uuid_t}.16P)", buf, 0x42u);

  }
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __26__NWURLSessionTask_resume__block_invoke;
  v16[3] = &unk_1E14ACFD0;
  v16[4] = self;
  dispatch_async(queue, v16);

}

- (void)suspend
{
  NSObject *v3;
  NSObject *queue;
  _QWORD v5[5];
  int v6;
  char v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v3 = (id)gurlLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    *(_DWORD *)buf = 68289282;
    v9 = 16;
    v10 = 2098;
    v11 = &v7;
    v12 = 1024;
    v13 = v6;
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> suspending", buf, 0x18u);
  }

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__NWURLSessionTask_suspend__block_invoke;
  v5[3] = &unk_1E14ACFD0;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)cancel
{
  NSObject *v3;
  NSObject *queue;
  _QWORD v5[5];
  int v6;
  char v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v3 = (id)gurlLogObj;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    *(_DWORD *)buf = 68289282;
    v9 = 16;
    v10 = 2098;
    v11 = &v7;
    v12 = 1024;
    v13 = v6;
    _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> cancelling", buf, 0x18u);
  }

  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__NWURLSessionTask_cancel__block_invoke;
  v5[3] = &unk_1E14ACFD0;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (unint64_t)taskIdentifier
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NWURLSessionTask logDescription](self, "logDescription");
  return v3;
}

- (NSURLResponse)response
{
  if (self)
    self = (NWURLSessionTask *)self->_responseConsumer;
  return -[NWURLSessionTask response](self, "response");
}

- (NSURLSessionTaskDelegate)delegate
{
  NWURLSessionDelegateWrapper *publicDelegateWrapper;

  if (self && (publicDelegateWrapper = self->_publicDelegateWrapper) != 0)
    return (NSURLSessionTaskDelegate *)objc_getProperty(publicDelegateWrapper, a2, 16, 1);
  else
    return 0;
}

- (void)setDelegate:(id)a3
{
  NWURLSessionDelegateWrapper *publicDelegateWrapper;

  if (self)
  {
    publicDelegateWrapper = self->_publicDelegateWrapper;
    if (publicDelegateWrapper)
      objc_setProperty_atomic(publicDelegateWrapper, a2, a3, 16);
  }
}

- (NSURLSessionTaskDelegate)_internalDelegate
{
  NWURLSessionDelegateWrapper *internalDelegateWrapper;

  if (self && (internalDelegateWrapper = self->_internalDelegateWrapper) != 0)
    return (NSURLSessionTaskDelegate *)objc_getProperty(internalDelegateWrapper, a2, 16, 1);
  else
    return 0;
}

- (void)set_internalDelegate:(id)a3
{
  char *v4;
  NWURLSessionDelegateWrapper *internalDelegateWrapper;
  NWURLSessionDelegateWrapper *v6;
  NWURLSessionDelegateWrapper *publicDelegateWrapper;
  NWURLSessionDelegateWrapper *v8;
  id *v9;
  id *v10;
  NWURLSessionDelegateWrapper *v11;
  id newValue;

  newValue = a3;
  if (newValue)
  {
    if (self)
    {
      internalDelegateWrapper = self->_internalDelegateWrapper;
      if (internalDelegateWrapper)
      {
LABEL_7:
        objc_setProperty_atomic(internalDelegateWrapper, v4, newValue, 16);
LABEL_10:
        v4 = (char *)newValue;
        goto LABEL_11;
      }
      v6 = [NWURLSessionDelegateWrapper alloc];
      publicDelegateWrapper = self->_publicDelegateWrapper;
    }
    else
    {
      v6 = [NWURLSessionDelegateWrapper alloc];
      publicDelegateWrapper = 0;
    }
    v8 = publicDelegateWrapper;
    v9 = -[NWURLSessionDelegateWrapper initWithFallbackDelegateWrapper:]((id *)&v6->super.isa, v8);
    v10 = v9;
    if (!self)
    {

      goto LABEL_10;
    }
    objc_storeStrong((id *)&self->_internalDelegateWrapper, v9);

    internalDelegateWrapper = self->_internalDelegateWrapper;
    v4 = (char *)newValue;
    if (internalDelegateWrapper)
      goto LABEL_7;
  }
  else
  {
    v4 = 0;
    if (self)
    {
      v11 = self->_internalDelegateWrapper;
      self->_internalDelegateWrapper = 0;

      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)setSecTrust:(__SecTrust *)a3
{
  __SecTrust *secTrust;

  if (a3)
    CFRetain(a3);
  secTrust = self->_secTrust;
  if (secTrust)
    CFRelease(secTrust);
  self->_secTrust = a3;
}

- (int64_t)state
{
  int64_t internalState;

  if (self)
  {
    internalState = self->_internalState;
    if (internalState == 2)
      return 3;
    if (internalState == 1)
      return self->_suspended;
  }
  return 1;
}

- (void)startNextLoad:(BOOL)a3
{
  _BOOL4 v3;
  NWURLSessionTaskConfiguration *configuration;
  id *v6;
  void *v7;
  id v8;
  NWURLSessionTaskConfiguration *v9;
  id *p_isa;
  double v11;
  NWURLSessionTaskConfiguration *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NWURLSessionRequestBodyInfo *v21;
  NWURLSessionRequestBodyInfo *v22;
  uint64_t knownSize;
  void *v24;
  NWURLSessionRequestBodyInfo *v25;
  void *v26;
  NWURLSessionTaskConfiguration *v27;
  OS_dispatch_queue *queue;
  uint64_t v29;
  id v30;
  NWURLSessionTaskConfiguration *v31;
  NWURLSessionTask *v32;
  id v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  OS_dispatch_queue *v37;
  id *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  int v46;
  NWURLSessionRequestBodyInfo *v47;
  id *v48;
  NWURLSessionTaskConfiguration *v49;
  void *v50;
  int v51;
  NWURLSessionTask *v52;
  _QWORD *v53;
  NWURLSessionTaskConfiguration *v54;
  id *v55;
  NWURLLoaderData *v56;
  void *v57;
  id *v58;
  NWURLLoaderAbout *v59;
  NWURLSessionTaskConfiguration *v60;
  void *v61;
  _QWORD *v62;
  _QWORD *v63;
  id v64;
  NWURLSessionRequestBodyInfo *v65;
  void *v66;
  OS_dispatch_queue *v67;
  _QWORD v68[2];
  void (*v69)(uint64_t, void *);
  void *v70;
  NWURLSessionTask *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _QWORD v81[4];
  id *v82;
  id v83;
  NWURLSessionTask *v84;
  id v85;
  NWURLSessionTaskConfiguration *v86;
  OS_dispatch_queue *v87;
  _QWORD *v88;
  uint64_t v89;

  v3 = a3;
  v89 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    nw_context_assert_queue(self->_sessionContext);
    configuration = self->_configuration;
  }
  else
  {
    nw_context_assert_queue(0);
    configuration = 0;
  }
  v6 = configuration;
  -[NWURLSessionTask currentRequest](self, "currentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_storeStrong(v6 + 4, v7);

  if (self)
  {
    v9 = self->_configuration;
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      if (-[NSURLRequest _explicitlySetTimeoutInterval](v9->_request, "_explicitlySetTimeoutInterval"))
        objc_msgSend(p_isa[4], "timeoutInterval");
      else
        objc_msgSend(p_isa[2], "timeoutIntervalForRequest");
    }
    else
    {
      v11 = 0.0;
    }
    self->_timeoutIntervalForRequest = v11;

    if (!v3)
      goto LABEL_12;
  }
  else
  {

    if (!v3)
      goto LABEL_12;
  }
  -[NWURLSessionTask startStartTimer]((uint64_t)self);
  -[NWURLSessionTask startResourceTimer](self);
LABEL_12:
  if (self && (v12 = self->_configuration) != 0)
  {
    -[NSURLSessionConfiguration protocolClasses](v12->_configuration, "protocolClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v73 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        if ((objc_msgSend(v20, "isSubclassOfClass:", NSClassFromString((NSString *)CFSTR("_NSCFURLProtocol"))) & 1) == 0)
          objc_msgSend(v14, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    }
    while (v17);
  }

  if (self)
  {
    v21 = self->_requestBody;
    v22 = v21;
    if (v21)
      knownSize = v21->_knownSize;
    else
      knownSize = 0;
    -[NWURLSessionTask setCountOfBytesExpectedToSend:](self, knownSize);
  }
  else
  {
    v22 = 0;
  }

  -[NWURLSessionTask currentRequest](self, "currentRequest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v25 = self->_requestBody;
    if (v25)
      v26 = (void *)v25->_knownSize;
    else
      v26 = 0;
    v65 = v25;
    v27 = self->_configuration;
    queue = self->_queue;
  }
  else
  {
    v26 = 0;
    v65 = 0;
    v27 = 0;
    queue = 0;
  }
  v29 = MEMORY[0x1E0C809B0];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v69 = __34__NWURLSessionTask_startNextLoad___block_invoke;
  v70 = &unk_1E14A2CF8;
  v71 = self;
  v30 = v24;
  v31 = v27;
  v67 = queue;
  v32 = self;
  v33 = v14;
  v34 = v68;
  objc_opt_self();
  objc_msgSend(v30, "URL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "scheme");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = v36;
  if (!v36)
  {
    v69((uint64_t)v34, 0);
    v47 = v65;
    v37 = v67;
    goto LABEL_54;
  }
  if (!objc_msgSend(v36, "caseInsensitiveCompare:", CFSTR("http"))
    || !objc_msgSend(v36, "caseInsensitiveCompare:", CFSTR("https")))
  {
    v37 = v67;
    v38 = -[NWURLLoaderHTTP initWithRequest:bodyKnownSize:configuration:queue:client:]((id *)[NWURLLoaderHTTP alloc], v30, v26, v31, v67, v32);
    goto LABEL_36;
  }
  v63 = v34;
  v49 = v31;
  objc_msgSend(v30, "URL");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "isFileURL");

  v37 = v67;
  if (!v51)
  {
    if (objc_msgSend(v66, "caseInsensitiveCompare:", CFSTR("data")))
    {
      if (objc_msgSend(v66, "caseInsensitiveCompare:", CFSTR("about")))
      {
        v38 = 0;
        goto LABEL_65;
      }
      v59 = [NWURLLoaderAbout alloc];
      objc_msgSend(v30, "URL");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = -[NWURLLoaderAbout initWithURL:]((id *)&v59->super.isa, v57);
    }
    else
    {
      v56 = [NWURLLoaderData alloc];
      objc_msgSend(v30, "URL");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = -[NWURLLoaderData initWithURL:]((id *)&v56->super.isa, v57);
    }
    v38 = v58;

    goto LABEL_65;
  }
  v38 = -[NWURLLoaderFile initWithRequest:queue:]((id *)[NWURLLoaderFile alloc], v30, v67);
LABEL_65:
  v31 = v49;
  v34 = v63;
LABEL_36:
  if (isWebKitNetworking_onceToken != -1)
    dispatch_once(&isWebKitNetworking_onceToken, &__block_literal_global_174);
  if (isWebKitNetworking_result == 1)
  {
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v64 = v33;
    v39 = v33;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    if (v40)
    {
      v41 = v40;
      v61 = v30;
      v62 = v34;
      v60 = v31;
      v42 = *(_QWORD *)v77;
      while (2)
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v77 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
          -[NWURLSessionTask loaderTask](v32, "loaderTask", v60, v61);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v44, "canInitWithTask:", v45);

          if (v46)
          {
            v31 = v60;
            v30 = v61;
            v37 = v67;
            v48 = -[NWURLLoader initWithRequest:configuration:queue:client:protocolClass:]((id *)[NWURLLoader alloc], v61, v60, v67, v32, v44);

            v38 = v48;
            goto LABEL_52;
          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
        if (v41)
          continue;
        break;
      }
      v31 = v60;
      v30 = v61;
      v37 = v67;
LABEL_52:
      v34 = v62;
    }

    v69((uint64_t)v34, v38);
    v33 = v64;
    v47 = v65;
  }
  else
  {
    if (objc_msgSend(v33, "count"))
    {
      v81[0] = v29;
      v81[1] = 3221225472;
      v81[2] = __111__NWURLLoader_makeLoaderForRequest_bodyKnownSize_configuration_queue_client_protocolClasses_completionHandler___block_invoke;
      v81[3] = &unk_1E14AAB18;
      v82 = v38;
      v83 = v33;
      v52 = v32;
      v84 = v52;
      v85 = v30;
      v86 = v31;
      v87 = v37;
      v88 = v34;
      v53 = v34;
      v54 = v31;
      v55 = v38;
      -[NWURLSessionTask loaderRunDelegateBlock:](v52, "loaderRunDelegateBlock:", v81);

      v31 = v54;
      v34 = v53;
    }
    else
    {
      v69((uint64_t)v34, v38);

    }
    v47 = v65;
  }
LABEL_54:

}

- (void)completeTaskWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  NWURLSessionResponseConsumer *responseConsumer;
  id newValue;

  v4 = a3;
  if (!self)
  {
    nw_context_assert_queue(0);
LABEL_5:
    -[NWURLSessionTask errorWithResumeData:](self, "errorWithResumeData:", v4);
    newValue = (id)objc_claimAutoreleasedReturnValue();

    -[NWURLSessionTask error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (!self)
        goto LABEL_13;
    }
    else
    {
      if (!self)
      {
LABEL_13:
        responseConsumer = 0;
        goto LABEL_11;
      }
      objc_setProperty_atomic_copy(self, v7, newValue, 136);
    }
    responseConsumer = self->_responseConsumer;
LABEL_11:
    -[NWURLSessionResponseConsumer task:deliverData:complete:error:completionHandler:](responseConsumer, "task:deliverData:complete:error:completionHandler:", self, 0, 1, newValue, &__block_literal_global_45370);
    -[NWURLSessionTask complete]((uint64_t)self);
    v5 = newValue;
    goto LABEL_12;
  }
  nw_context_assert_queue(self->_sessionContext);
  if (self->_internalState != 2)
    goto LABEL_5;
  v5 = v4;
LABEL_12:

}

- (NSString)description
{
  NWURLSession *session;
  NWURLSession *v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  BOOL v9;
  void *v10;
  unsigned int v12;
  unsigned __int8 uu[20];
  _WORD v14[24];
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14[23] = 0;
  v15 = unk_183BA8F40;
  v16 = xmmword_183BA8F50;
  strcpy((char *)v14, "Task <00000000-0000-0000-0000-000000000000>.<");
  if (self)
    session = self->_session;
  else
    session = 0;
  v4 = session;
  -[NWURLSessionTask logDescription](self, "logDescription");
  uuid_unparse(uu, (char *)&v14[3]);
  LOBYTE(v14[21]) = 62;
  -[NWURLSessionTask logDescription](self, "logDescription");
  v5 = 0;
  v6 = v12;
  v7 = v12;
  do
  {
    v8 = v5++;
    v9 = v7 > 9;
    v7 /= 0xAu;
  }
  while (v9);
  do
  {
    *((_BYTE *)&v14[22] + v5--) = (v6 % 0xA) | 0x30;
    v6 /= 0xAu;
  }
  while (v5 > 0);
  *((_BYTE *)v14 + (v8 + 46)) = 62;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)errorWithResumeData:(id)a3
{
  return a3;
}

- (NSURLSessionDataTask)loaderDataTask
{
  return 0;
}

- (OS_nw_protocol_metadata)clientMetadata
{
  if (self)
    self = (NWURLSessionTask *)self->_clientMetadataForMetrics;
  return (OS_nw_protocol_metadata *)self;
}

- (void)joiningContext
{
  if (self)
    return (void *)*((_QWORD *)self + 49);
  return self;
}

- (OS_nw_context)networkContext
{
  if (self)
    self = (NWURLSessionTask *)self->_sessionContext;
  return (OS_nw_context *)self;
}

- (void)loaderRunDelegateBlock:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  if (!self)
    goto LABEL_7;
  v4 = 240;
  if (!self->_internalDelegateWrapper)
    v4 = 232;
  v5 = *(id *)((char *)&self->super.isa + v4);
  if (v5)
  {
    v6 = v5;
    -[NWURLSessionDelegateQueue runDelegateBlock:](*((_QWORD **)v5 + 6), a3);
  }
  else
  {
LABEL_7:
    v6 = 0;
  }

}

- (void)loaderNeedsBodyProviderFromOffset:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  NWURLSessionRequestBodyInfo *requestBody;
  OS_dispatch_data *v8;
  uint64_t v9;
  NWURLSessionRequestBodyInfo *v10;
  id *v11;
  void *v12;
  dispatch_source_t *requestTimeoutTimer;
  uint64_t v14;
  id *v15;
  NWURLSessionTask *v16;
  _QWORD *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  NWURLSessionDelegateDeallocBomb *v24;
  id v25;
  id v26;
  _QWORD *v27;
  id v28;
  NWURLSessionDelegateDeallocBomb *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  NWURLSessionDelegateDeallocBomb *v34;
  id v35;
  id v36;
  _QWORD *v37;
  id v38;
  NWURLSessionDelegateDeallocBomb *v39;
  id v40;
  _QWORD *v41;
  _QWORD v42[2];
  void (*v43)(_QWORD *, void *);
  void *v44;
  NWURLSessionTask *v45;
  void (**v46)(id, void *);
  unint64_t v47;
  objc_super v48;
  void (*v49)(uint64_t);
  void *v50;
  id v51;
  id v52;
  NWURLSessionTask *v53;
  NWURLSessionDelegateDeallocBomb *v54;
  id v55;
  _QWORD *v56;
  unint64_t v57;

  v6 = (void (**)(id, void *))a4;
  if (!self || (requestBody = self->_requestBody) == 0)
  {
    v10 = 0;
    goto LABEL_7;
  }
  v8 = requestBody->_data;
  if (v8 || requestBody->_fileURL)
  {

LABEL_6:
    v10 = self->_requestBody;
LABEL_7:
    v11 = v10;
    -[NWURLSessionRequestBodyInfo bodyProviderFromOffset:](v11, (id)a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);

    goto LABEL_8;
  }
  if (requestBody->_stream && requestBody->_streamOffset == a3)
    goto LABEL_6;
  if (self->_timeoutIntervalForRequest > 0.0)
  {
    requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
    if (requestTimeoutTimer)
    {
      if (*requestTimeoutTimer)
      {
        dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      }
      else
      {
        requestTimeoutTimer[4] = (dispatch_source_t)-1;
        requestTimeoutTimer[5] = (dispatch_source_t)-1;
        if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49))
          nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v9);
      }
    }
  }
  v14 = 240;
  if (!self->_internalDelegateWrapper)
    v14 = 232;
  v15 = (id *)*(id *)((char *)&self->super.isa + v14);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v43 = __72__NWURLSessionTask_loaderNeedsBodyProviderFromOffset_completionHandler___block_invoke;
  v44 = &unk_1E14A2E50;
  v45 = self;
  v46 = v6;
  v47 = a3;
  v16 = self;
  v17 = v42;
  v19 = v17;
  if (v15)
  {
    v41 = v17;
    -[NWURLSessionDelegateWrapper delegateFor_needNewBodyStreamFromOffset](v15, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = v15[4];
      v23 = v15[5];
      v24 = [NWURLSessionDelegateDeallocBomb alloc];
      v25 = v21;
      if (v24)
      {
        v48.receiver = v24;
        v48.super_class = (Class)NWURLSessionDelegateDeallocBomb;
        v26 = -[NWURLSessionTask init](&v48, sel_init);
        v24 = (NWURLSessionDelegateDeallocBomb *)v26;
        if (v26)
        {
          objc_storeStrong((id *)v26 + 2, v21);
          v24->__method = sel_task_needNewBodyStreamFromOffset_completionHandler_;
        }
      }

      v48.receiver = (id)MEMORY[0x1E0C809B0];
      v48.super_class = (Class)3221225472;
      v49 = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke;
      v50 = &unk_1E14AAC08;
      v51 = v25;
      v52 = v22;
      v53 = v16;
      v54 = v24;
      v57 = a3;
      v55 = v23;
      v19 = v41;
      v56 = v41;
      v27 = v15[6];
      v28 = v23;
      v29 = v24;
      v30 = v22;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v27, &v48);

    }
    else if (a3)
    {
      v43(v41, 0);
      v19 = v41;
    }
    else
    {
      -[NWURLSessionDelegateWrapper delegateFor_needNewBodyStream](v15, v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = v15[4];
        v33 = v15[5];
        v34 = [NWURLSessionDelegateDeallocBomb alloc];
        v35 = v31;
        if (v34)
        {
          v48.receiver = v34;
          v48.super_class = (Class)NWURLSessionDelegateDeallocBomb;
          v36 = -[NWURLSessionTask init](&v48, sel_init);
          v34 = (NWURLSessionDelegateDeallocBomb *)v36;
          if (v36)
          {
            objc_storeStrong((id *)v36 + 2, v31);
            v34->__method = sel_task_needNewBodyStreamFromOffset_completionHandler_;
          }
        }

        v48.receiver = (id)MEMORY[0x1E0C809B0];
        v48.super_class = (Class)3221225472;
        v49 = __82__NWURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke_4;
        v50 = &unk_1E14AABB8;
        v51 = v35;
        v52 = v32;
        v53 = v16;
        v54 = v34;
        v55 = v33;
        v19 = v41;
        v56 = v41;
        v37 = v15[6];
        v38 = v33;
        v39 = v34;
        v40 = v32;
        -[NWURLSessionDelegateQueue runDelegateBlock:](v37, &v48);

      }
      else
      {
        v43(v41, 0);
        v19 = v41;
      }

    }
  }

LABEL_8:
}

- (void)loaderPreparingConnection
{
  double timeoutIntervalForRequest;
  dispatch_source_t *requestTimeoutTimer;
  dispatch_time_t v4;

  if (self)
  {
    timeoutIntervalForRequest = self->_timeoutIntervalForRequest;
    if (timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        v4 = dispatch_time(0x8000000000000000, (uint64_t)(timeoutIntervalForRequest * 1000000000.0));
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)v4;
          requestTimeoutTimer[5] = (dispatch_source_t)-1;
          if (*((_BYTE *)requestTimeoutTimer + 48))
          {
            if (*((_BYTE *)requestTimeoutTimer + 49))
              nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v4);
          }
        }
      }
      else
      {
        self->_requestTimeoutTimer = (void *)-[NWURLSessionTask createTimerWithTimeout:]((uint64_t)self, timeoutIntervalForRequest);
      }
    }
  }
}

- (void)loaderWaitingForConnectivity
{
  dispatch_source_t *requestTimeoutTimer;
  uint64_t v4;
  const char *v5;
  NWURLSessionTask *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  id v10;
  id *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  NWURLSessionTask *v15;

  if (self)
  {
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1;
          requestTimeoutTimer[5] = (dispatch_source_t)-1;
          if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49))
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, (uint64_t)a2);
        }
      }
    }
    v4 = 240;
    if (!self->_internalDelegateWrapper)
      v4 = 232;
    v11 = (id *)*(id *)((char *)&self->super.isa + v4);
    v6 = self;
    if (v11)
    {
      -[NWURLSessionDelegateWrapper delegateFor_isWaitingForConnectivity](v11, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = v11[4];
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __60__NWURLSessionDelegateWrapper_taskIsWaitingForConnectivity___block_invoke;
        v12[3] = &unk_1E14AAAA0;
        v13 = v7;
        v14 = v8;
        v15 = v6;
        v9 = v11[6];
        v10 = v8;
        -[NWURLSessionDelegateQueue runDelegateBlock:](v9, v12);

      }
    }

  }
  else
  {

  }
}

- (void)loaderConnectedWithHTTPConnectionMetadata:(id)a3 CNAMEChain:(id)a4 unlistedTracker:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *startTimeoutTimer;
  void *v14;
  double v15;
  double v16;
  const char *v17;
  const char *v18;
  _NWHTTPConnectionInfo *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  SEL v26;
  void (**Property)(id, _NWHTTPConnectionInfo *);
  NSData *backtrace;
  NSData *v29;
  id v30;
  NWURLSessionTaskConfiguration *configuration;
  NWURLSessionResponseConsumer *responseConsumer;
  _QWORD v33[5];
  objc_super v34;

  v9 = a3;
  v10 = a4;
  v12 = a5;
  if (self)
  {
    startTimeoutTimer = self->_startTimeoutTimer;
    if (startTimeoutTimer)
    {
      self->_startTimeoutTimer = 0;
      nw_queue_cancel_source((uint64_t)startTimeoutTimer, v11);
    }
    -[NWURLSessionTask currentRequest](self, "currentRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_payloadTransmissionTimeout");
    v16 = v15;

    if (v16 > 0.0 && !self->_payloadTimeoutTimer)
      self->_payloadTimeoutTimer = (void *)-[NWURLSessionTask createTimerWithTimeout:]((uint64_t)self, v16);
    if (objc_getProperty(self, v17, 296, 1))
    {
      v19 = [_NWHTTPConnectionInfo alloc];
      v20 = 240;
      if (!self->_internalDelegateWrapper)
        v20 = 232;
      v21 = *(Class *)((char *)&self->super.isa + v20);
      v22 = v21;
      v23 = v9;
      v24 = v22;
      if (v19)
      {
        v34.receiver = v19;
        v34.super_class = (Class)_NWHTTPConnectionInfo;
        v25 = -[NWURLSessionTask init](&v34, sel_init);
        v19 = (_NWHTTPConnectionInfo *)v25;
        if (v25)
        {
          objc_storeStrong((id *)v25 + 1, a3);
          objc_storeStrong((id *)&v19->_delegateWrapper, v21);
        }
      }

      Property = (void (**)(id, _NWHTTPConnectionInfo *))objc_getProperty(self, v26, 296, 1);
      Property[2](Property, v19);

    }
    objc_setProperty_atomic(self, v18, v10, 184);
    if (v12)
    {
      backtrace = self->_backtrace;
      if (backtrace)
      {
        v29 = backtrace;
        v30 = v12;
        objc_msgSend(v30, "UTF8String");
        -[NSData bytes](v29, "bytes");
        -[NSData length](v29, "length");
        ne_tracker_create_xcode_issue();

      }
    }
    configuration = self->_configuration;
    if (configuration && -[NWURLSessionTask _preconnect](configuration->_task, "_preconnect"))
    {
      responseConsumer = self->_responseConsumer;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __89__NWURLSessionTask_loaderConnectedWithHTTPConnectionMetadata_CNAMEChain_unlistedTracker___block_invoke;
      v33[3] = &unk_1E14A3330;
      v33[4] = self;
      -[NWURLSessionResponseConsumer task:deliverData:complete:error:completionHandler:](responseConsumer, "task:deliverData:complete:error:completionHandler:", self, 0, 1, 0, v33);
    }
  }

}

- (void)loaderFailedToConnect:(id)a3
{
  NWURLSessionTaskConfiguration *configuration;
  id v5;

  v5 = a3;
  if (self)
  {
    configuration = self->_configuration;
    if (configuration)
    {
      if (-[NWURLSessionTask _preconnect](configuration->_task, "_preconnect"))
        -[NWURLSessionTask completeTaskWithError:](self, "completeTaskWithError:", v5);
    }
  }

}

- (void)loaderWillPerformHSTSUpgrade:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NWURLLoader *v12;
  NWURLLoader *loader;
  uint64_t v14;
  dispatch_source_t *requestTimeoutTimer;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  NWURLSessionTask *v19;
  id v20;
  const char *v21;
  _QWORD *v22;
  void *v23;
  id v24;
  id v25;
  NWURLSessionDelegateDeallocBomb *v26;
  id v27;
  id v28;
  _QWORD *v29;
  id v30;
  NWURLSessionDelegateDeallocBomb *v31;
  id v32;
  NWURLSessionTask *v33;
  NWURLLoader *v34;
  _QWORD v35[2];
  void (*v36)(uint64_t, void *);
  void *v37;
  NWURLSessionTask *v38;
  int v39;
  char v40;
  uint8_t buf[8];
  __int128 v42;
  void *v43;
  id v44;
  id v45;
  NWURLSessionTask *v46;
  id v47;
  NWURLSessionDelegateDeallocBomb *v48;
  id v49;
  _QWORD *v50;
  uint64_t v51;

  v3 = a3;
  v51 = *MEMORY[0x1E0C80C00];
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v5 = (id)gurlLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&buf[4] = 16;
    LOWORD(v42) = 2098;
    *(_QWORD *)((char *)&v42 + 2) = &v40;
    WORD5(v42) = 1024;
    HIDWORD(v42) = v39;
    LOWORD(v43) = 1024;
    *(_DWORD *)((char *)&v43 + 2) = v3;
    _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> scheme upgraded to https by HSTS {preload=%{BOOL}d}", buf, 0x1Eu);
  }

  -[NWURLSessionTask currentRequest](self, "currentRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = (void *)MEMORY[0x1E0CB3998];
  objc_msgSend(v7, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsWithURL:resolvingAgainstBaseURL:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setScheme:", CFSTR("https"));
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setURL:", v11);

  objc_msgSend(v7, "_setSchemeWasUpgradedDueToDynamicHSTS:", !v3);
  if (self)
  {
    v12 = self->_loader;
    loader = self->_loader;
    self->_loader = 0;

    v34 = v12;
    -[NWURLLoader stop](v12, "stop");
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1;
          requestTimeoutTimer[5] = (dispatch_source_t)-1;
          if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49))
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v14);
        }
      }
    }
    v16 = 240;
    if (!self->_internalDelegateWrapper)
      v16 = 232;
    v17 = (id *)*(id *)((char *)&self->super.isa + v16);
  }
  else
  {
    objc_msgSend(0, "stop");
    v34 = 0;
    v17 = 0;
  }
  v18 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __49__NWURLSessionTask_loaderWillPerformHSTSUpgrade___block_invoke;
  v37 = &unk_1E14A2E78;
  v38 = self;
  v19 = self;
  v20 = v7;
  v22 = v35;
  if (v17)
  {
    -[NWURLSessionDelegateWrapper delegateFor__schemeUpgraded](v17, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v33 = v19;
      v24 = v17[4];
      v25 = v17[5];
      v26 = [NWURLSessionDelegateDeallocBomb alloc];
      v27 = v23;
      if (v26)
      {
        *(_QWORD *)buf = v26;
        *(_QWORD *)&v42 = NWURLSessionDelegateDeallocBomb;
        v28 = -[uint8_t init]((objc_super *)buf, sel_init);
        v26 = (NWURLSessionDelegateDeallocBomb *)v28;
        if (v28)
        {
          objc_storeStrong((id *)v28 + 2, v23);
          v26->__method = sel_task__schemeUpgraded_completionHandler_;
        }
      }

      *(_QWORD *)buf = v18;
      *(_QWORD *)&v42 = 3221225472;
      *((_QWORD *)&v42 + 1) = __70__NWURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke;
      v43 = &unk_1E14AAB18;
      v44 = v27;
      v45 = v24;
      v19 = v33;
      v46 = v33;
      v47 = v20;
      v48 = v26;
      v49 = v25;
      v50 = v22;
      v29 = v17[6];
      v30 = v25;
      v31 = v26;
      v32 = v24;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v29, buf);

    }
    else
    {
      v36((uint64_t)v22, v20);
    }

  }
}

- (void)loaderWillPerformHTTPRedirection:(id)a3 newRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  unint64_t redirectCount;
  uint64_t v11;
  unint64_t v12;
  NWURLError *v13;
  NWURLLoader *v14;
  NWURLSessionTask *v15;
  uint64_t v16;
  uint8_t *v17;
  dispatch_source_t *requestTimeoutTimer;
  uint64_t v19;
  id v20;
  _QWORD v21[5];
  int v22;
  char v23;
  uint8_t buf[8];
  _BYTE v25[10];
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v8 = (id)gurlLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    v9 = (unsigned __int16)objc_msgSend(v6, "statusCode");
    if (self)
      redirectCount = self->_redirectCount;
    else
      redirectCount = 0;
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 16;
    *(_WORD *)v25 = 2098;
    *(_QWORD *)&v25[2] = &v23;
    v26 = 1024;
    v27 = v22;
    v28 = 1024;
    v29 = v9;
    v30 = 2048;
    v31 = redirectCount;
    _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> will perform redirect {status=%hu, previous_redirects=%zu}", buf, 0x28u);
  }

  if (!self)
  {
    v20 = 0;
LABEL_20:
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__NWURLSessionTask_loaderWillPerformHTTPRedirection_newRequest___block_invoke;
    v21[3] = &unk_1E14A2E78;
    v21[4] = self;
    -[NWURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:]((uint64_t)v20, self, v6, v7, v21);

    goto LABEL_21;
  }
  v12 = self->_redirectCount + 1;
  self->_redirectCount = v12;
  if (v12 < 0x15)
  {
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1;
          requestTimeoutTimer[5] = (dispatch_source_t)-1;
          if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49))
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v11);
        }
      }
    }
    v19 = 240;
    if (!self->_internalDelegateWrapper)
      v19 = 232;
    v20 = *(id *)((char *)&self->super.isa + v19);
    goto LABEL_20;
  }
  v13 = [NWURLError alloc];
  v14 = self->_loader;
  v15 = self;
  if (v13)
  {
    v16 = *MEMORY[0x1E0CB32E8];
    *(_QWORD *)buf = v13;
    *(_QWORD *)v25 = NWURLError;
    v17 = -[uint8_t initWithDomain:code:userInfo:]((objc_super *)buf, sel_initWithDomain_code_userInfo_, v16, -1007, 0);
    v13 = (NWURLError *)v17;
    if (v17)
      -[uint8_t fillErrorForLoader:andTask:](v17, "fillErrorForLoader:andTask:", v14, v15);
  }

  -[NWURLSessionTask completeTaskWithError:](v15, "completeTaskWithError:", v13);
LABEL_21:

}

- (void)loaderWillPerformHTTPRedirection:(id)a3 newRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  unint64_t redirectCount;
  uint64_t v14;
  unint64_t v15;
  NWURLError *v16;
  NWURLLoader *v17;
  NWURLSessionTask *v18;
  uint64_t v19;
  uint8_t *v20;
  dispatch_source_t *requestTimeoutTimer;
  uint64_t v22;
  id v23;
  _QWORD v24[5];
  id v25;
  int v26;
  char v27;
  uint8_t buf[8];
  _BYTE v29[10];
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v11 = (id)gurlLogObj;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    v12 = (unsigned __int16)objc_msgSend(v8, "statusCode");
    if (self)
      redirectCount = self->_redirectCount;
    else
      redirectCount = 0;
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&buf[4] = 16;
    *(_WORD *)v29 = 2098;
    *(_QWORD *)&v29[2] = &v27;
    v30 = 1024;
    v31 = v26;
    v32 = 1024;
    v33 = v12;
    v34 = 2048;
    v35 = redirectCount;
    _os_log_impl(&dword_182FBE000, v11, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> will perform redirect {status=%hu, previous_redirects=%zu}", buf, 0x28u);
  }

  if (!self)
  {
    v23 = 0;
LABEL_20:
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __82__NWURLSessionTask_loaderWillPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
    v24[3] = &unk_1E14A9A28;
    v24[4] = self;
    v25 = v10;
    -[NWURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:]((uint64_t)v23, self, v8, v9, v24);

    goto LABEL_21;
  }
  v15 = self->_redirectCount + 1;
  self->_redirectCount = v15;
  if (v15 < 0x15)
  {
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1;
          requestTimeoutTimer[5] = (dispatch_source_t)-1;
          if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49))
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v14);
        }
      }
    }
    v22 = 240;
    if (!self->_internalDelegateWrapper)
      v22 = 232;
    v23 = *(id *)((char *)&self->super.isa + v22);
    goto LABEL_20;
  }
  v16 = [NWURLError alloc];
  v17 = self->_loader;
  v18 = self;
  if (v16)
  {
    v19 = *MEMORY[0x1E0CB32E8];
    *(_QWORD *)buf = v16;
    *(_QWORD *)v29 = NWURLError;
    v20 = -[uint8_t initWithDomain:code:userInfo:]((objc_super *)buf, sel_initWithDomain_code_userInfo_, v19, -1007, 0);
    v16 = (NWURLError *)v20;
    if (v20)
      -[uint8_t fillErrorForLoader:andTask:](v20, "fillErrorForLoader:andTask:", v17, v18);
  }

  -[NWURLSessionTask completeTaskWithError:](v18, "completeTaskWithError:", v16);
  (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
LABEL_21:

}

- (void)loaderDidReceiveInformationalResponse:(id)a3
{
  uint64_t v5;
  id v6;

  if (self)
  {
    v5 = 240;
    if (!self->_internalDelegateWrapper)
      v5 = 232;
    v6 = *(id *)((char *)&self->super.isa + v5);
    -[NWURLSessionDelegateWrapper task:didReceiveInformationalResponse:]((uint64_t)v6, self, a3);
  }
  else
  {
    -[NWURLSessionDelegateWrapper task:didReceiveInformationalResponse:](0, 0, a3);
    v6 = 0;
  }

}

- (void)loaderDidReceiveServerTrustChallenge:(id)a3 secProtocolMetadata:(id)a4 completionHandler:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  __SecTrust *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NWURLSessionTaskConfiguration *configuration;
  NSData *v16;
  uint64_t v17;
  void *v18;
  const void *SSL;
  NWURLSessionTaskConfiguration *v20;
  void *v21;
  NWURLSessionTaskConfiguration *v22;
  NSObject *queue;
  void (**v24)(id, _QWORD);
  void *v25;
  void *v26;
  void *v27;
  NSMutableArray *serverTrustCallbackQueue;
  NSMutableArray *v29;
  NSMutableArray *v30;
  NSMutableArray *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  NWURLSessionTask *v37;
  id v38;
  NSObject *v39;
  __CFString *v40;
  id v41;
  _QWORD result[4];
  id v43;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sec_trust_copy_ref(v8);
  -[NWURLSessionTask currentRequest](self, "currentRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "host");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!self || (configuration = self->_configuration) == 0)
  {
    v16 = 0;
    goto LABEL_8;
  }
  v16 = configuration->_atsState;
  if (!v16
    || (objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v16, 0, 0, 0),
        (v17 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_8:
    SSL = SecPolicyCreateSSL(1u, v14);
    if (!SSL)
      goto LABEL_10;
    goto LABEL_9;
  }
  v18 = (void *)v17;
  SSL = (const void *)SecPolicyCreateSSLWithATSPinning();

  if (SSL)
  {
LABEL_9:
    SecTrustSetPolicies(v11, SSL);
    CFRelease(SSL);
  }
LABEL_10:
  if (self)
  {
    v20 = self->_configuration;
    if (v20)
    {
      -[NSURLSessionConfiguration _tlsTrustPinningPolicyName](v20->_configuration, "_tlsTrustPinningPolicyName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        SecTrustSetPinningPolicyName();
    }
    else
    {
      v21 = 0;
    }
    -[NWURLSessionTask setSecTrust:](self, "setSecTrust:", v11);
    v22 = self->_configuration;
    if (v22
      && -[NSURLSessionConfiguration _alwaysPerformDefaultTrustEvaluation](v22->_configuration, "_alwaysPerformDefaultTrustEvaluation"))
    {
      queue = self->_queue;
      result[0] = MEMORY[0x1E0C809B0];
      result[1] = 3221225472;
      result[2] = __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke;
      result[3] = &unk_1E14A2EA0;
      v24 = (void (**)(id, _QWORD))v10;
      v43 = v24;
      if (SecTrustEvaluateAsyncWithError(v11, queue, result))
        v24[2](v24, 0);
      v25 = v43;
      goto LABEL_27;
    }
  }
  else
  {
    objc_msgSend(0, "setSecTrust:", v11);
    v21 = 0;
  }
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke_2;
  v36 = &unk_1E14A3D40;
  v37 = self;
  v41 = v10;
  v38 = v9;
  v39 = v8;
  v40 = v14;
  v26 = _Block_copy(&v33);
  v27 = v26;
  if (self && self->_performingServerTrustCallback)
  {
    serverTrustCallbackQueue = self->_serverTrustCallbackQueue;
    if (!serverTrustCallbackQueue)
    {
      v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v30 = self->_serverTrustCallbackQueue;
      self->_serverTrustCallbackQueue = v29;

      serverTrustCallbackQueue = self->_serverTrustCallbackQueue;
    }
    v31 = serverTrustCallbackQueue;
    v32 = _Block_copy(v27);
    -[NSMutableArray addObject:](v31, "addObject:", v32, v33, v34, v35, v36, v37, v38, v39);

  }
  else
  {
    (*((void (**)(void *))v26 + 2))(v26);
  }

  v25 = v41;
LABEL_27:

  CFRelease(v11);
}

- (void)loaderDidReceiveClientCertificateChallenge:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  dispatch_source_t *requestTimeoutTimer;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  int v26;
  char v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v8 = (id)gurlLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    *(_DWORD *)buf = 68289282;
    v29 = 16;
    v30 = 2098;
    v31 = &v27;
    v32 = 1024;
    v33 = v26;
    _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> received client cert challenge", buf, 0x18u);
  }

  -[NWURLSessionTask currentRequest](self, "currentRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NWURLSessionTask currentRequest](self, "currentRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "port");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0C92C70]);
  if (v14)
    v16 = objc_msgSend(v14, "integerValue");
  else
    v16 = 443;
  v17 = (void *)objc_msgSend(v15, "initWithHost:port:protocol:realm:authenticationMethod:", v11, v16, *MEMORY[0x1E0C92BA0], 0, *MEMORY[0x1E0C92B30]);
  objc_msgSend(v17, "_setDistinguishedNames:", v7);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C48]), "initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:", v17, 0, 0, 0, 0, 0);
  if (self)
  {
    if (self->_timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)-1;
          requestTimeoutTimer[5] = (dispatch_source_t)-1;
          if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49))
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v18);
        }
      }
    }
    v21 = 240;
    if (!self->_internalDelegateWrapper)
      v21 = 232;
    v22 = *(id *)((char *)&self->super.isa + v21);
  }
  else
  {
    v22 = 0;
  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81__NWURLSessionTask_loaderDidReceiveClientCertificateChallenge_completionHandler___block_invoke;
  v24[3] = &unk_1E14A2F18;
  v24[4] = self;
  v25 = v6;
  v23 = v6;
  -[NWURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:]((uint64_t)v22, self, v19, v24);

}

- (void)loaderDidReceiveChallenge:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  dispatch_source_t *requestTimeoutTimer;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  int v27;
  char v28;
  int v29;
  char v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  _BOOL4 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v8 = (id)gurlLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    v9 = v29;
    objc_msgSend(v6, "protectionSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "authenticationMethod");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "proposedCredential");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 68289794;
    v32 = 16;
    v33 = 2098;
    v34 = &v30;
    v35 = 1024;
    v36 = v9;
    v37 = 2114;
    v38 = v11;
    v39 = 1024;
    v40 = v12 != 0;
    _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> received auth challenge {method=\"%{public}@\", proposed=%{BOOL}d}", buf, 0x28u);

  }
  objc_msgSend(v6, "protectionSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isProxy") & 1) != 0)
    goto LABEL_6;
  v15 = objc_msgSend(v6, "previousFailureCount");

  if (v15)
    goto LABEL_8;
  -[NWURLSessionTask currentRequest](self, "currentRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "user");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "password");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v20 || !v21)
  {

LABEL_6:
LABEL_8:
    if (self)
    {
      if (self->_timeoutIntervalForRequest > 0.0)
      {
        requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
        if (requestTimeoutTimer)
        {
          if (*requestTimeoutTimer)
          {
            dispatch_source_set_timer(*requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
          }
          else
          {
            requestTimeoutTimer[4] = (dispatch_source_t)-1;
            requestTimeoutTimer[5] = (dispatch_source_t)-1;
            if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49))
              nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v14);
          }
        }
      }
      v17 = 240;
      if (!self->_internalDelegateWrapper)
        v17 = 232;
      v18 = *(id *)((char *)&self->super.isa + v17);
    }
    else
    {
      v18 = 0;
    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __64__NWURLSessionTask_loaderDidReceiveChallenge_completionHandler___block_invoke;
    v25[3] = &unk_1E14A2F18;
    v25[4] = self;
    v26 = v7;
    -[NWURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:]((uint64_t)v18, self, v6, v25);

    goto LABEL_17;
  }
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v23 = (id)gurlLogObj;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[NWURLSessionTask logDescription](self, "logDescription");
    -[NWURLSessionTask logDescription](self, "logDescription");
    *(_DWORD *)buf = 68289282;
    v32 = 16;
    v33 = 2098;
    v34 = &v28;
    v35 = 1024;
    v36 = v27;
    _os_log_impl(&dword_182FBE000, v23, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> responding to auth challenge using URL credential", buf, 0x18u);
  }

  objc_msgSend(MEMORY[0x1E0C92C60], "credentialWithUser:password:persistence:", v20, v22, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v24);

LABEL_17:
}

- (void)loaderDidSendBodyData:(int64_t)a3 totalBytesSent:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  double timeoutIntervalForRequest;
  dispatch_source_t *requestTimeoutTimer;
  dispatch_time_t v13;
  void *v14;
  void *v15;
  NSProgress *uploadProgress;
  NSProgress *v17;
  uint64_t v18;
  int64_t v19;
  NSProgress *v20;
  uint64_t v21;
  id *v22;
  id v23;
  NWURLSessionTask *v24;
  const char *v25;
  _QWORD *v26;
  void *v27;
  int64_t v28;
  int64_t v29;
  id v30;
  id v31;
  NWURLSessionTask *v32;
  _QWORD *v33;
  id v34;
  id v35;
  _QWORD v36[2];
  void (*v37)(uint64_t, const char *);
  void *v38;
  NWURLSessionTask *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  NWURLSessionTask *v44;
  id v45;
  _QWORD *v46;
  int64_t v47;
  int64_t v48;
  int64_t v49;

  v10 = a6;
  if (self)
  {
    -[NWURLSessionTask willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("countOfBytesSent"));
    self->_countOfBytesSent = a4;
    -[NWURLSessionTask didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("countOfBytesSent"));
    if (self->_progress && !self->_progressReportingFinished)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLSessionTask progress](self, "progress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setByteCompletedCount:", v14);

      uploadProgress = self->_uploadProgress;
      if (self->_defaultUploadProgressState)
      {
        v17 = uploadProgress;
        v18 = -[NSProgress completedUnitCount](v17, "completedUnitCount");
        v19 = -[NSProgress totalUnitCount](self->_uploadProgress, "totalUnitCount") - 1;

        if (v18 < v19)
        {
          v20 = self->_uploadProgress;
          -[NSProgress setCompletedUnitCount:](v20, "setCompletedUnitCount:", -[NSProgress completedUnitCount](v20, "completedUnitCount") + 1);

        }
      }
      else
      {
        -[NSProgress setCompletedUnitCount:](uploadProgress, "setCompletedUnitCount:", a4);
      }
    }
    -[NWURLSessionTask setCountOfBytesExpectedToSend:](self, a5);
    timeoutIntervalForRequest = self->_timeoutIntervalForRequest;
    if (timeoutIntervalForRequest > 0.0)
    {
      requestTimeoutTimer = (dispatch_source_t *)self->_requestTimeoutTimer;
      if (requestTimeoutTimer)
      {
        v13 = dispatch_time(0x8000000000000000, (uint64_t)(timeoutIntervalForRequest * 1000000000.0));
        if (*requestTimeoutTimer)
        {
          dispatch_source_set_timer(*requestTimeoutTimer, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          requestTimeoutTimer[4] = (dispatch_source_t)v13;
          requestTimeoutTimer[5] = (dispatch_source_t)-1;
          if (*((_BYTE *)requestTimeoutTimer + 48) && *((_BYTE *)requestTimeoutTimer + 49))
            nw_queue_source_run_timer((uint64_t)requestTimeoutTimer, v13);
        }
      }
      else
      {
        self->_requestTimeoutTimer = (void *)-[NWURLSessionTask createTimerWithTimeout:]((uint64_t)self, timeoutIntervalForRequest);
      }
    }
    v21 = 240;
    if (!self->_internalDelegateWrapper)
      v21 = 232;
    v22 = (id *)*(id *)((char *)&self->super.isa + v21);
  }
  else
  {
    -[NWURLSessionTask setCountOfBytesExpectedToSend:](0, a5);
    v22 = 0;
  }
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v37 = __100__NWURLSessionTask_loaderDidSendBodyData_totalBytesSent_totalBytesExpectedToSend_completionHandler___block_invoke;
  v38 = &unk_1E14ACE18;
  v39 = self;
  v40 = v10;
  v23 = v10;
  v24 = self;
  v26 = v36;
  if (v22)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didSendBodyData](v22, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = a5;
      v29 = a3;
      v30 = v22[4];
      v31 = v22[5];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __110__NWURLSessionDelegateWrapper_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend_completionHandler___block_invoke;
      v41[3] = &unk_1E14AAC30;
      v42 = v27;
      v43 = v30;
      v32 = v24;
      v47 = v29;
      v48 = a4;
      v49 = v28;
      v44 = v32;
      v45 = v31;
      v46 = v26;
      v33 = v22[6];
      v34 = v31;
      v35 = v30;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v33, v41);

    }
    else
    {
      ((void (*)(_QWORD *))v37)(v26);
    }

  }
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  if (a3 >= 0.0 && a3 <= 1.0 && self->_priority != a3)
    self->_priority = a3;
}

- (BOOL)prefersIncrementalDelivery
{
  return self->_prefersIncrementalDelivery;
}

- (void)setPrefersIncrementalDelivery:(BOOL)a3
{
  if (self->_prefersIncrementalDelivery != a3)
    self->_prefersIncrementalDelivery = a3;
}

- (NSProgress)progress
{
  NWURLSessionTask *v2;
  uint64_t v3;
  NSProgress *progress;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSProgress *uploadProgress;
  NSProgress *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSProgress *downloadProgress;
  NSProgress *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSProgress *v19;
  NSProgress *v20;
  NSProgress *v21;
  NSProgress *v22;
  NSProgress *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_progress)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
  v3 = objc_claimAutoreleasedReturnValue();
  progress = v2->_progress;
  v2->_progress = (NSProgress *)v3;

  if (-[NWURLSessionTask countOfBytesExpectedToSend](v2, "countOfBytesExpectedToSend") <= 0)
  {
    v6 = 0;
    v2->_defaultUploadProgressState = 1;
    v5 = 100;
  }
  else
  {
    v5 = -[NWURLSessionTask countOfBytesExpectedToSend](v2, "countOfBytesExpectedToSend");
    v6 = -[NWURLSessionTask countOfBytesSent](v2, "countOfBytesSent");
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  uploadProgress = v2->_uploadProgress;
  v2->_uploadProgress = (NSProgress *)v7;

  v9 = v2->_uploadProgress;
  -[NSProgress setCompletedUnitCount:](v9, "setCompletedUnitCount:", v6);

  if (-[NWURLSessionTask countOfBytesExpectedToReceive](v2, "countOfBytesExpectedToReceive") <= 0)
  {
    v11 = 0;
    v2->_defaultDownloadProgressState = 1;
    v10 = 100;
  }
  else
  {
    v10 = -[NWURLSessionTask countOfBytesExpectedToReceive](v2, "countOfBytesExpectedToReceive");
    v11 = -[NWURLSessionTask countOfBytesReceived](v2, "countOfBytesReceived");
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  downloadProgress = v2->_downloadProgress;
  v2->_downloadProgress = (NSProgress *)v12;

  v14 = v2->_downloadProgress;
  -[NSProgress setCompletedUnitCount:](v14, "setCompletedUnitCount:", v11);

  -[NWURLSessionTask originalRequest](v2, "originalRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v15, "HTTPBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 || (objc_msgSend(v15, "HTTPBodyStream"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v15, "HTTPMethod");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "caseInsensitiveCompare:", CFSTR("POST")))
      {
        objc_msgSend(v15, "HTTPMethod");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "caseInsensitiveCompare:", CFSTR("PUT")))
        {
          objc_msgSend(v15, "HTTPMethod");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "caseInsensitiveCompare:", CFSTR("PATCH"));

          if (v30)
          {
            v17 = 95;
            v18 = 5;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      else
      {

      }
    }
  }
  v17 = 5;
  v18 = 95;
LABEL_13:
  v19 = v2->_progress;
  v20 = v2->_uploadProgress;
  -[NSProgress addChild:withPendingUnitCount:](v19, "addChild:withPendingUnitCount:", v20, v18);

  v21 = v2->_progress;
  v22 = v2->_downloadProgress;
  -[NSProgress addChild:withPendingUnitCount:](v21, "addChild:withPendingUnitCount:", v22, v17);

  -[NSProgress setKind:](v2->_progress, "setKind:", *MEMORY[0x1E0CB30F8]);
  -[NSProgress setFileTotalCount:](v2->_progress, "setFileTotalCount:", &unk_1E14E08C8);
  if (-[NWURLSessionTask countOfBytesReceived](v2, "countOfBytesReceived") < 1)
  {
    v24 = (_QWORD *)MEMORY[0x1E0CB30E0];
  }
  else
  {
    v23 = v2->_uploadProgress;
    -[NSProgress setCompletedUnitCount:](v2->_uploadProgress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](v23, "totalUnitCount"));

    v24 = (_QWORD *)MEMORY[0x1E0CB30B8];
  }
  -[NSProgress setFileOperationKind:](v2->_progress, "setFileOperationKind:", *v24);
  objc_initWeak(&location, v2);
  v25 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __28__NWURLSessionTask_progress__block_invoke;
  v35[3] = &unk_1E14A49C0;
  objc_copyWeak(&v36, &location);
  -[NSProgress setCancellationHandler:](v2->_progress, "setCancellationHandler:", v35);
  v33[0] = v25;
  v33[1] = 3221225472;
  v33[2] = __28__NWURLSessionTask_progress__block_invoke_2;
  v33[3] = &unk_1E14A49C0;
  objc_copyWeak(&v34, &location);
  -[NSProgress setPausingHandler:](v2->_progress, "setPausingHandler:", v33);
  v31[0] = v25;
  v31[1] = 3221225472;
  v31[2] = __28__NWURLSessionTask_progress__block_invoke_3;
  v31[3] = &unk_1E14A49C0;
  objc_copyWeak(&v32, &location);
  -[NSProgress setResumingHandler:](v2->_progress, "setResumingHandler:", v31);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

LABEL_17:
  objc_sync_exit(v2);

  return v2->_progress;
}

- (void)getUnderlyingHTTPConnectionInfoWithCompletionHandler:(id)a3
{
  if (self)
    objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (NSURLSessionTaskMetrics)_incompleteTaskMetrics
{
  if (self)
    self = (NWURLSessionTask *)objc_getProperty(self, a2, 432, 1);
  return (NSURLSessionTaskMetrics *)self;
}

- (NSURLSessionTaskTransactionMetrics)_incompleteCurrentTaskTransactionMetrics
{
  id *Property;
  id *v3;
  id v4;

  if (self)
  {
    Property = (id *)objc_getProperty(self, a2, 432, 1);
    v3 = Property;
    if (Property)
    {
      v4 = nw_http_client_metadata_copy_current_transaction_metadata(Property[2]);
      v3 = -[NWURLSessionTaskTransactionMetrics initWithTransactionMetadata:clientMetadata:]((id *)[NWURLSessionTaskTransactionMetrics alloc], v4, v3[2]);

    }
  }
  else
  {
    v3 = 0;
  }
  return (NSURLSessionTaskTransactionMetrics *)v3;
}

- (id)_timingData
{
  return 0;
}

- (void)_setExplicitCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  NWConcrete_nw_http_cookie_storage *v4;
  NSHTTPCookieStorage *v5;
  OS_nw_http_cookie_storage *cookieStorage;
  NSHTTPCookieStorage *v7;

  if (self)
  {
    self->_explicitlySetCookieStorage = 1;
    if (!a3)
    {
      cookieStorage = self->_cookieStorage;
      self->_cookieStorage = 0;
LABEL_7:

      return;
    }
LABEL_3:
    v7 = (NSHTTPCookieStorage *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C08]), "_initWithCFHTTPCookieStorage:", a3);
    v4 = objc_alloc_init(NWConcrete_nw_http_cookie_storage);
    v5 = v4->cookieStorage;
    v4->cookieStorage = v7;

    if (self)
      objc_storeStrong((id *)&self->_cookieStorage, v4);

    cookieStorage = (OS_nw_http_cookie_storage *)v7;
    goto LABEL_7;
  }
  if (a3)
    goto LABEL_3;
}

- (void)_adoptEffectiveConfiguration:(id)a3
{
  void *v4;

  objc_msgSend(a3, "URLCredentialStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    if (!v4)
      self->_disabledCredentialStorage = 1;
  }
}

- (int64_t)_countOfBytesReceivedEncoded
{
  void *v2;
  int64_t v3;

  -[NWURLSessionTask _incompleteCurrentTaskTransactionMetrics](self, "_incompleteCurrentTaskTransactionMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfResponseBodyBytesReceived");

  return v3;
}

- ($1C4110BDDF6CE1A35BD1F09FD54CA4C3)logDescription
{
  *($045A7E745A1AC4122900FE6B13FDCB23 *)retstr = ($045A7E745A1AC4122900FE6B13FDCB23)self[22];
  return self;
}

- (NSURLRequest)originalRequest
{
  return self->_originalRequest;
}

- (NSURLRequest)currentRequest
{
  return self->_currentRequest;
}

- (NSDate)earliestBeginDate
{
  return self->_earliestBeginDate;
}

- (void)setEarliestBeginDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)countOfBytesClientExpectsToSend
{
  return self->_countOfBytesClientExpectsToSend;
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3
{
  self->_countOfBytesClientExpectsToSend = a3;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  self->_countOfBytesClientExpectsToReceive = a3;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTaskDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NWURLError)error
{
  return (NWURLError *)objc_getProperty(self, a2, 136, 1);
}

- (__SecTrust)secTrust
{
  return self->_secTrust;
}

- (BOOL)_callCompletionHandlerInline
{
  return self->__callCompletionHandlerInline;
}

- (void)set_callCompletionHandlerInline:(BOOL)a3
{
  self->__callCompletionHandlerInline = a3;
}

- (BOOL)_keepDownloadTaskFile
{
  return self->__keepDownloadTaskFile;
}

- (void)set_keepDownloadTaskFile:(BOOL)a3
{
  self->__keepDownloadTaskFile = a3;
}

- (OS_nw_activity)_nw_activity
{
  return self->__nw_activity;
}

- (void)set_nw_activity:(id)a3
{
  objc_storeStrong((id *)&self->__nw_activity, a3);
}

- (NSString)_pathToDownloadTaskFile
{
  return self->__pathToDownloadTaskFile;
}

- (void)set_pathToDownloadTaskFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSURL)_siteForCookies
{
  return self->__siteForCookies;
}

- (void)set_siteForCookies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)_isTopLevelNavigation
{
  return self->__isTopLevelNavigation;
}

- (void)set_isTopLevelNavigation:(BOOL)a3
{
  self->__isTopLevelNavigation = a3;
}

- (BOOL)_preconnect
{
  return self->__preconnect;
}

- (void)set_preconnect:(BOOL)a3
{
  self->__preconnect = a3;
}

- (id)_cookieTransformCallback
{
  return self->__cookieTransformCallback;
}

- (void)set_cookieTransformCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)_resolvedCNAMEChain
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (int64_t)_bytesPerSecondLimit
{
  return self->__bytesPerSecondLimit;
}

- (void)set_bytesPerSecondLimit:(int64_t)a3
{
  self->__bytesPerSecondLimit = a3;
}

- (double)_timeoutIntervalForResource
{
  return self->__timeoutIntervalForResource;
}

- (void)set_timeoutIntervalForResource:(double)a3
{
  self->__timeoutIntervalForResource = a3;
}

- (OS_nw_endpoint)_hostOverride
{
  return self->__hostOverride;
}

- (void)set_hostOverride:(id)a3
{
  objc_storeStrong((id *)&self->__hostOverride, a3);
}

- (NSDictionary)_trailers
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_cookieStorage, 0);
  objc_storeStrong((id *)&self->_responseConsumer, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_lastSecProtocolMetadata, 0);
  objc_storeStrong((id *)&self->_serverTrustCallbackQueue, 0);
  objc_storeStrong((id *)&self->_backtrace, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_uploadProgress, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_storeStrong(&self->_HTTPConnectionInfoHandler, 0);
  objc_storeStrong(&self->_pendingUpload, 0);
  objc_storeStrong((id *)&self->_multipartParser, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_clientMetadataForMetrics, 0);
  objc_storeStrong((id *)&self->_internalDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_publicDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->__trailers, 0);
  objc_storeStrong((id *)&self->__hostOverride, 0);
  objc_storeStrong((id *)&self->__resolvedCNAMEChain, 0);
  objc_storeStrong(&self->__cookieTransformCallback, 0);
  objc_storeStrong((id *)&self->__siteForCookies, 0);
  objc_storeStrong((id *)&self->__pathToDownloadTaskFile, 0);
  objc_storeStrong((id *)&self->__nw_activity, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_taskDescription, 0);
  objc_storeStrong((id *)&self->_earliestBeginDate, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_appssoH1FallbackHeaders, 0);
  objc_storeStrong((id *)&self->_h1FallbackCache, 0);
}

void __28__NWURLSessionTask_progress__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

void __28__NWURLSessionTask_progress__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "suspend");

}

void __28__NWURLSessionTask_progress__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resume");

}

- (void)setCountOfBytesExpectedToSend:(void *)result
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (result)
  {
    v3 = result;
    objc_msgSend(result, "willChangeValueForKey:", CFSTR("countOfBytesExpectedToSend"));
    *((_QWORD *)v3 + 14) = a2;
    result = (void *)objc_msgSend(v3, "didChangeValueForKey:", CFSTR("countOfBytesExpectedToSend"));
    if (*((_QWORD *)v3 + 8))
    {
      if (!*((_BYTE *)v3 + 15))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "progress");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setByteTotalCount:", v4);

        if (a2 >= 1)
          v6 = a2;
        else
          v6 = 100;
        *((_BYTE *)v3 + 16) = a2 < 1;
        return (void *)objc_msgSend(*((id *)v3 + 44), "setTotalUnitCount:", v6);
      }
    }
  }
  return result;
}

- (BOOL)createTimerWithTimeout:(uint64_t)a1
{
  _BOOL8 source;
  void *v4;
  dispatch_time_t v5;
  uint64_t v6;
  _QWORD v8[5];

  if (a2 > 31536000.0)
    return 0;
  v4 = *(void **)(a1 + 304);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__NWURLSessionTask_createTimerWithTimeout___block_invoke;
  v8[3] = &unk_1E14ACFD0;
  v8[4] = a1;
  source = nw_queue_context_create_source(v4, 2, 3, 0, v8, 0);
  v5 = dispatch_time(0x8000000000000000, (uint64_t)(a2 * 1000000000.0));
  nw_queue_set_timer_values(source, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  nw_queue_activate_source(source, v6);
  return source;
}

void __100__NWURLSessionTask_loaderDidSendBodyData_totalBytesSent_totalBytesExpectedToSend_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  _BYTE *v3;

  v3 = *(_BYTE **)(a1 + 32);
  if (v3 && (v3[13] & 1) != 0)
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 288);
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __43__NWURLSessionTask_createTimerWithTimeout___block_invoke(uint64_t a1)
{
  id *v1;
  NWURLError *v2;
  id v3;
  id *v4;
  uint64_t v5;
  id v6;
  id v7;
  objc_super v8;

  v1 = *(id **)(a1 + 32);
  if (v1)
  {
    v2 = [NWURLError alloc];
    v3 = v1[32];
    v4 = v1;
    if (v2
      && (v5 = *MEMORY[0x1E0CB32E8],
          v8.receiver = v2,
          v8.super_class = (Class)NWURLError,
          (v6 = objc_msgSendSuper2(&v8, sel_initWithDomain_code_userInfo_, v5, -1001, 0)) != 0))
    {
      v7 = v6;
      objc_msgSend(v6, "fillErrorForLoader:andTask:", v3, v4);
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(v1, "completeTaskWithError:", v7);
  }
  else
  {
    v7 = 0;
    objc_msgSend(0, "completeTaskWithError:", 0);
  }

}

void __64__NWURLSessionTask_loaderDidReceiveChallenge_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  dispatch_time_t v16;
  int v17;
  _QWORD v18[2];
  int v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  _QWORD *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v6 = (id)gurlLogObj;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v7, "logDescription");
      v8 = *(void **)(a1 + 32);
      if (v8)
      {
        objc_msgSend(v8, "logDescription");
        v9 = v17;
LABEL_9:
        *(_DWORD *)buf = 68289794;
        v21 = 16;
        v22 = 2098;
        v23 = v18;
        v24 = 1024;
        v25 = v9;
        v26 = 2048;
        v27 = a2;
        v28 = 1024;
        v29 = v5 != 0;
        _os_log_impl(&dword_182FBE000, v6, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%u> responding to auth challenge {disposition=%ld, credential=%{BOOL}d}", buf, 0x28u);
        goto LABEL_10;
      }
    }
    else
    {
      v18[0] = 0;
      v18[1] = 0;
      v19 = 0;
    }
    v9 = 0;
    goto LABEL_9;
  }
LABEL_10:

  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
  {
    v14 = *(double *)(v13 + 320);
    if (v14 > 0.0)
    {
      v15 = *(_QWORD *)(v13 + 328);
      if (v15)
      {
        v16 = dispatch_time(0x8000000000000000, (uint64_t)(v14 * 1000000000.0));
        if (*(_QWORD *)v15)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          *(_QWORD *)(v15 + 32) = v16;
          *(_QWORD *)(v15 + 40) = -1;
          if (*(_BYTE *)(v15 + 48) && *(_BYTE *)(v15 + 49))
            nw_queue_source_run_timer(v15, v16);
        }
      }
    }
  }
  (*(void (**)(_QWORD, uint64_t, id, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, v5, v10, v11, v12);

}

void __81__NWURLSessionTask_loaderDidReceiveClientCertificateChallenge_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  dispatch_time_t v14;
  __SecIdentity *v15;
  const __CFArray *v16;
  sec_identity_t v17;
  id *v18;
  NWURLError *v19;
  id v20;
  id *v21;
  uint64_t v22;
  uint8_t *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[8];
  _BYTE v33[10];
  __int16 v34;
  int v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v6 = (id)gurlLogObj;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v7, "logDescription");
      v8 = *(void **)(a1 + 32);
      if (v8)
      {
        objc_msgSend(v8, "logDescription");
        v9 = v28;
        if (!a2)
        {
LABEL_7:
          v10 = objc_msgSend(v5, "identity", v26, v27, v28, v29, v30, v31) != 0;
LABEL_11:
          *(_DWORD *)buf = 68289538;
          *(_DWORD *)&buf[4] = 16;
          *(_WORD *)v33 = 2098;
          *(_QWORD *)&v33[2] = &v29;
          v34 = 1024;
          v35 = v9;
          v36 = 1024;
          v37 = v10;
          _os_log_impl(&dword_182FBE000, v6, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> responding to client cert challenge {credential=%{BOOL}d}", buf, 0x1Eu);
          goto LABEL_12;
        }
LABEL_10:
        v10 = 0;
        goto LABEL_11;
      }
    }
    else
    {
      v29 = 0;
      v30 = 0;
      LODWORD(v31) = 0;
    }
    v9 = 0;
    v26 = 0;
    v27 = 0;
    LODWORD(v28) = 0;
    if (!a2)
      goto LABEL_7;
    goto LABEL_10;
  }
LABEL_12:

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    v12 = *(double *)(v11 + 320);
    if (v12 > 0.0)
    {
      v13 = *(_QWORD *)(v11 + 328);
      if (v13)
      {
        v14 = dispatch_time(0x8000000000000000, (uint64_t)(v12 * 1000000000.0));
        if (*(_QWORD *)v13)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          *(_QWORD *)(v13 + 32) = v14;
          *(_QWORD *)(v13 + 40) = -1;
          if (*(_BYTE *)(v13 + 48) && *(_BYTE *)(v13 + 49))
            nw_queue_source_run_timer(v13, v14);
        }
      }
    }
  }
  switch(a2)
  {
    case 0:
      if (!objc_msgSend(v5, "identity"))
        goto LABEL_27;
      v15 = (__SecIdentity *)objc_msgSend(v5, "identity");
      objc_msgSend(v5, "certificates");
      v16 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      v17 = sec_identity_create_with_certificates(v15, v16);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      break;
    case 1:
    case 3:
      goto LABEL_27;
    case 2:
      v18 = *(id **)(a1 + 32);
      if (v18)
      {
        v19 = [NWURLError alloc];
        v20 = v18[32];
        v21 = v18;
        if (v19)
        {
          v22 = *MEMORY[0x1E0CB32E8];
          *(_QWORD *)buf = v19;
          *(_QWORD *)v33 = NWURLError;
          v23 = -[uint8_t initWithDomain:code:userInfo:]((objc_super *)buf, sel_initWithDomain_code_userInfo_, v22, -999, 0);
          v19 = (NWURLError *)v23;
          if (v23)
            -[uint8_t fillErrorForLoader:andTask:](v23, "fillErrorForLoader:andTask:", v20, v21);
        }

        v25 = *(void **)(a1 + 32);
        if (v25)
          objc_setProperty_atomic_copy(v25, v24, v19, 136);
      }
      else
      {
        v19 = 0;
      }

LABEL_27:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      break;
    default:
      break;
  }

}

uint64_t __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void (*v8)(void);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  SecTrustRef v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint8_t buf[8];
  __int128 v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  id v44;
  _QWORD *v45;
  int v46;
  char v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_31;
  if (*(_QWORD *)(v2 + 280) == 2)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_8;
  }
  v3 = *(id *)(v2 + 384);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v5 ? *(NSObject **)(v5 + 384) : 0;
    v7 = sec_protocol_metadata_peers_are_equal(v6, *(sec_protocol_metadata_t *)(a1 + 40));

    if (v7)
    {
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_8:
      v8();
      -[NWURLSessionTask performNextServerTrustChallenge](*(_QWORD *)(a1 + 32));
      return;
    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    *(_BYTE *)(v9 + 18) = 1;
    v10 = *(void **)(a1 + 32);
  }
  else
  {
LABEL_31:
    v10 = 0;
  }
  objc_msgSend(v10, "currentRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "port");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(_QWORD *)(a1 + 32);
  v15 = MEMORY[0x1E0C809B0];
  v16 = *(void **)(a1 + 48);
  v17 = *(void **)(a1 + 56);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke_3;
  v35[3] = &unk_1E14A2EF0;
  v18 = *(id *)(a1 + 64);
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(a1 + 40);
  v37 = v18;
  v35[4] = v19;
  v36 = v20;
  v21 = v16;
  v22 = v17;
  v23 = v13;
  v24 = v35;
  if (v14)
  {
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v25 = (id)gurlLogObj;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)v14, "logDescription");
      objc_msgSend((id)v14, "logDescription");
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 16;
      LOWORD(v39) = 2098;
      *(_QWORD *)((char *)&v39 + 2) = &v47;
      WORD5(v39) = 1024;
      HIDWORD(v39) = v46;
      _os_log_impl(&dword_182FBE000, v25, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> received server trust challenge", buf, 0x18u);
    }

    v26 = objc_alloc(MEMORY[0x1E0C92C70]);
    if (v23)
      v27 = objc_msgSend(v23, "integerValue");
    else
      v27 = 443;
    v28 = (void *)objc_msgSend(v26, "initWithHost:port:protocol:realm:authenticationMethod:", v22, v27, *MEMORY[0x1E0C92BA0], 0, *MEMORY[0x1E0C92B70]);
    v29 = sec_trust_copy_ref(v21);
    objc_msgSend(v28, "_setServerTrust:", v29);
    CFRelease(v29);
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C48]), "initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:", v28, 0, 0, 0, 0, 0);
    if (*(double *)(v14 + 320) > 0.0)
    {
      v32 = *(_QWORD *)(v14 + 328);
      if (v32)
      {
        if (*(_QWORD *)v32)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v32, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          *(_QWORD *)(v32 + 32) = -1;
          *(_QWORD *)(v32 + 40) = -1;
          if (*(_BYTE *)(v32 + 48) && *(_BYTE *)(v32 + 49))
            nw_queue_source_run_timer(v32, v30);
        }
      }
    }
    v33 = 240;
    if (!*(_QWORD *)(v14 + 240))
      v33 = 232;
    v34 = *(_QWORD *)(v14 + v33);
    *(_QWORD *)buf = v15;
    *(_QWORD *)&v39 = 3221225472;
    *((_QWORD *)&v39 + 1) = __80__NWURLSessionTask_challengeDelegateForServerTrust_host_port_completionHandler___block_invoke;
    v40 = &unk_1E14A2EC8;
    v41 = v14;
    v42 = v21;
    v43 = v22;
    v44 = v23;
    v45 = v24;
    -[NWURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:](v34, (void *)v14, v31, buf);

  }
}

- (void)performNextServerTrustChallenge
{
  id v2;
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  const char *v6;
  void (**v7)(_QWORD);
  char *backtrace_string;
  os_log_type_t v9;
  _BOOL4 v10;
  NSObject *v11;
  os_log_type_t v12;
  void (**v13)(_QWORD);
  char v14;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 18))
    {
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v2 = (id)gurlLogObj;
      *(_DWORD *)buf = 136446466;
      v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
      v18 = 2112;
      v19 = a1;
      v3 = (void *)_os_log_send_and_compose_impl();

      type = OS_LOG_TYPE_ERROR;
      v14 = 0;
      if (__nwlog_fault((const char *)v3, &type, &v14))
      {
        if (type == OS_LOG_TYPE_FAULT)
        {
          if (__nwlog_url_log::onceToken != -1)
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
          v4 = (id)gurlLogObj;
          v5 = type;
          if (os_log_type_enabled(v4, type))
          {
            *(_DWORD *)buf = 136446466;
            v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
            v18 = 2112;
            v19 = a1;
            v6 = "%{public}s Already performing server trust challenge %@";
LABEL_28:
            v11 = v4;
            v12 = v5;
LABEL_29:
            _os_log_impl(&dword_182FBE000, v11, v12, v6, buf, 0x16u);
            goto LABEL_30;
          }
          goto LABEL_30;
        }
        if (!v14)
        {
          if (__nwlog_url_log::onceToken != -1)
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
          v4 = (id)gurlLogObj;
          v5 = type;
          if (os_log_type_enabled(v4, type))
          {
            *(_DWORD *)buf = 136446466;
            v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
            v18 = 2112;
            v19 = a1;
            v6 = "%{public}s Already performing server trust challenge %@, backtrace limit exceeded";
            goto LABEL_28;
          }
LABEL_30:

          if (!v3)
            return;
LABEL_22:
          free(v3);
          return;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        if (__nwlog_url_log::onceToken != -1)
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
        v4 = (id)gurlLogObj;
        v9 = type;
        v10 = os_log_type_enabled(v4, type);
        if (!backtrace_string)
        {
          if (v10)
          {
            *(_DWORD *)buf = 136446466;
            v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
            v18 = 2112;
            v19 = a1;
            v6 = "%{public}s Already performing server trust challenge %@, no backtrace";
            v11 = v4;
            v12 = v9;
            goto LABEL_29;
          }
          goto LABEL_30;
        }
        if (v10)
        {
          *(_DWORD *)buf = 136446722;
          v17 = "-[NWURLSessionTask performNextServerTrustChallenge]";
          v18 = 2112;
          v19 = a1;
          v20 = 2082;
          v21 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v4, v9, "%{public}s Already performing server trust challenge %@, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(backtrace_string);
      }
      if (!v3)
        return;
      goto LABEL_22;
    }
    objc_msgSend(*(id *)(a1 + 376), "firstObject");
    v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v13 = v7;
      objc_msgSend(*(id *)(a1 + 376), "removeObjectAtIndex:", 0);
      v13[2](v13);
      v7 = v13;
    }

  }
}

void __95__NWURLSessionTask_loaderDidReceiveServerTrustChallenge_secProtocolMetadata_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4
    && (objc_storeStrong((id *)(v4 + 384), *(id *)(a1 + 40)), (v5 = *(_QWORD *)(a1 + 32)) != 0)
    && (*(_BYTE *)(v5 + 19) = a2, (v6 = *(_QWORD *)(a1 + 32)) != 0))
  {
    *(_BYTE *)(v6 + 18) = 0;
    v7 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v7 = 0;
  }
  -[NWURLSessionTask performNextServerTrustChallenge](v7);
}

void __80__NWURLSessionTask_challengeDelegateForServerTrust_host_port_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  dispatch_time_t v13;
  __SecTrust *v14;
  uint64_t v15;
  id *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  CFDataRef v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFData *v26;
  void *v27;
  id *v28;
  NWURLError *v29;
  id v30;
  id *v31;
  uint64_t v32;
  uint8_t *v33;
  const char *v34;
  void *v35;
  _QWORD result[4];
  id v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  _QWORD v41[2];
  int v42;
  uint8_t buf[8];
  _BYTE v44[10];
  __int16 v45;
  int v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  _BOOL4 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v6 = (id)gurlLogObj;
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    goto LABEL_10;
  v7 = *(void **)(a1 + 32);
  if (!v7)
  {
    v41[0] = 0;
    v41[1] = 0;
    v42 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v7, "logDescription");
  v8 = *(void **)(a1 + 32);
  if (!v8)
  {
LABEL_8:
    v9 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "logDescription");
  v9 = v40;
LABEL_9:
  *(_DWORD *)buf = 68289794;
  *(_DWORD *)&buf[4] = 16;
  *(_WORD *)v44 = 2098;
  *(_QWORD *)&v44[2] = v41;
  v45 = 1024;
  v46 = v9;
  v47 = 2048;
  v48 = a2;
  v49 = 1024;
  v50 = v5 != 0;
  _os_log_impl(&dword_182FBE000, v6, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> responding to server trust challenge {disposition=%ld, credential=%{BOOL}d}", buf, 0x28u);
LABEL_10:

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    v11 = *(double *)(v10 + 320);
    if (v11 > 0.0)
    {
      v12 = *(_QWORD *)(v10 + 328);
      if (v12)
      {
        v13 = dispatch_time(0x8000000000000000, (uint64_t)(v11 * 1000000000.0));
        if (*(_QWORD *)v12)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          *(_QWORD *)(v12 + 32) = v13;
          *(_QWORD *)(v12 + 40) = -1;
          if (*(_BYTE *)(v12 + 48) && *(_BYTE *)(v12 + 49))
            nw_queue_source_run_timer(v12, v13);
        }
      }
    }
  }
  switch(a2)
  {
    case 0:
      if (!v5)
        goto LABEL_16;
      v14 = sec_trust_copy_ref(*(sec_trust_t *)(a1 + 40));
      v20 = SecTrustCopyExceptions(v14);
      v16 = (id *)v20;
      if (v20)
      {
        v21 = *(_QWORD *)(a1 + 32);
        if (v21)
        {
          v22 = *(_QWORD *)(v21 + 392);
          if (v22)
          {
            v24 = *(_QWORD *)(a1 + 48);
            v23 = *(_QWORD *)(a1 + 56);
            v25 = (void *)MEMORY[0x1E0CB3940];
            v26 = v20;
            objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ %@"), v24, v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v22 + 112), "setObject:forKeyedSubscript:", v26, v27);

          }
        }
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      goto LABEL_31;
    case 1:
    case 3:
LABEL_16:
      v14 = sec_trust_copy_ref(*(sec_trust_t *)(a1 + 40));
      v15 = *(_QWORD *)(a1 + 32);
      if (v15)
      {
        v16 = *(id **)(v15 + 392);
        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16[14], "objectForKeyedSubscript:", v17);
          v16 = (id *)objc_claimAutoreleasedReturnValue();

          if (v16)
            SecTrustSetExceptions(v14, (CFDataRef)v16);
        }
        v18 = *(_QWORD *)(a1 + 32);
        if (v18)
          goto LABEL_21;
      }
      else
      {
        v16 = 0;
        v18 = *(_QWORD *)(a1 + 32);
        if (v18)
        {
LABEL_21:
          v19 = *(NSObject **)(v18 + 224);
          goto LABEL_22;
        }
      }
      v19 = 0;
LABEL_22:
      result[0] = MEMORY[0x1E0C809B0];
      result[1] = 3221225472;
      result[2] = __80__NWURLSessionTask_challengeDelegateForServerTrust_host_port_completionHandler___block_invoke_36;
      result[3] = &unk_1E14A2EA0;
      v37 = *(id *)(a1 + 64);
      if (SecTrustEvaluateAsyncWithError(v14, v19, result))
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

LABEL_31:
      CFRelease(v14);

LABEL_39:
      return;
    case 2:
      v28 = *(id **)(a1 + 32);
      if (v28)
      {
        v29 = [NWURLError alloc];
        v30 = v28[32];
        v31 = v28;
        if (v29)
        {
          v32 = *MEMORY[0x1E0CB32E8];
          *(_QWORD *)buf = v29;
          *(_QWORD *)v44 = NWURLError;
          v33 = -[uint8_t initWithDomain:code:userInfo:]((objc_super *)buf, sel_initWithDomain_code_userInfo_, v32, -999, 0);
          v29 = (NWURLError *)v33;
          if (v33)
            -[uint8_t fillErrorForLoader:andTask:](v33, "fillErrorForLoader:andTask:", v30, v31);
        }

        v35 = *(void **)(a1 + 32);
        if (v35)
          objc_setProperty_atomic_copy(v35, v34, v29, 136);
      }
      else
      {
        v29 = 0;
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      goto LABEL_39;
    default:
      goto LABEL_39;
  }
}

uint64_t __80__NWURLSessionTask_challengeDelegateForServerTrust_host_port_completionHandler___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__NWURLSessionTask_loaderWillPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  dispatch_time_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  uint64_t *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  _BOOL4 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v4 = (id)gurlLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v5, "logDescription");
      v6 = *(void **)(a1 + 32);
      if (v6)
      {
        objc_msgSend(v6, "logDescription");
        v7 = v36;
LABEL_9:
        *(_DWORD *)buf = 68289538;
        v41 = 16;
        v42 = 2098;
        v43 = &v37;
        v44 = 1024;
        v45 = v7;
        v46 = 1024;
        v47 = v3 != 0;
        _os_log_impl(&dword_182FBE000, v4, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> performing redirect {take=%{BOOL}d}", buf, 0x1Eu);
        goto LABEL_10;
      }
    }
    else
    {
      v37 = 0;
      v38 = 0;
      LODWORD(v39) = 0;
    }
    v7 = 0;
    v34 = 0;
    v35 = 0;
    LODWORD(v36) = 0;
    goto LABEL_9;
  }
LABEL_10:

  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    if (*(_QWORD *)(v12 + 280) == 2)
    {
LABEL_29:
      (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v8, v9, v10, v11);
      goto LABEL_30;
    }
    v13 = *(double *)(v12 + 320);
    if (v13 > 0.0)
    {
      v14 = *(_QWORD *)(v12 + 328);
      if (v14)
      {
        v15 = dispatch_time(0x8000000000000000, (uint64_t)(v13 * 1000000000.0));
        if (*(_QWORD *)v14)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          *(_QWORD *)(v14 + 32) = v15;
          *(_QWORD *)(v14 + 40) = -1;
          if (*(_BYTE *)(v14 + 48) && *(_BYTE *)(v14 + 49))
            nw_queue_source_run_timer(v14, v15);
        }
      }
    }
  }
  if (!v3)
    goto LABEL_29;
  v16 = *(_QWORD **)(a1 + 32);
  if (v16)
    v16 = (_QWORD *)v16[32];
  v21 = v16;
  v22 = *(_QWORD *)(a1 + 32);
  if (v22)
  {
    v23 = *(void **)(v22 + 256);
    *(_QWORD *)(v22 + 256) = 0;

  }
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v17, v18, v19, v20);
  objc_msgSend(v21, "stop");
  v25 = *(void **)(a1 + 32);
  if (v25)
    objc_setProperty_nonatomic_copy(v25, v24, v3, 56);
  objc_msgSend(v3, "HTTPMethod", v34, v35, v36, v37, v38, v39);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("GET"));

  if (!v27
    || (objc_msgSend(v3, "HTTPMethod"),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v33 = objc_msgSend(v32, "caseInsensitiveCompare:", CFSTR("HEAD")),
        v32,
        !v33))
  {
    v28 = *(_QWORD *)(a1 + 32);
    if (!v28)
    {
LABEL_36:
      v31 = 0;
      goto LABEL_28;
    }
    v29 = *(void **)(v28 + 408);
    *(_QWORD *)(v28 + 408) = 0;

  }
  v30 = *(_QWORD *)(a1 + 32);
  if (!v30)
    goto LABEL_36;
  v31 = *(void **)(v30 + 248);
LABEL_28:
  nw_http_client_metadata_create_next_transaction(v31, 1);
  objc_msgSend(*(id *)(a1 + 32), "startNextLoad:", 0);

LABEL_30:
}

void __64__NWURLSessionTask_loaderWillPerformHTTPRedirection_newRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  dispatch_time_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  uint64_t *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (__nwlog_url_log::onceToken != -1)
    dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
  v4 = (id)gurlLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v5, "logDescription");
      v6 = *(void **)(a1 + 32);
      if (v6)
      {
        objc_msgSend(v6, "logDescription");
        v7 = v26;
LABEL_9:
        *(_DWORD *)buf = 68289538;
        v31 = 16;
        v32 = 2098;
        v33 = &v27;
        v34 = 1024;
        v35 = v7;
        v36 = 1024;
        v37 = v3 != 0;
        _os_log_impl(&dword_182FBE000, v4, OS_LOG_TYPE_INFO, "Task <%{public,uuid_t}.16P>.<%u> performing redirect {take=%{BOOL}d}", buf, 0x1Eu);
        goto LABEL_10;
      }
    }
    else
    {
      v27 = 0;
      v28 = 0;
      LODWORD(v29) = 0;
    }
    v7 = 0;
    v24 = 0;
    v25 = 0;
    LODWORD(v26) = 0;
    goto LABEL_9;
  }
LABEL_10:

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    if (*(_QWORD *)(v8 + 280) == 2)
      goto LABEL_28;
    v9 = *(double *)(v8 + 320);
    if (v9 > 0.0)
    {
      v10 = *(_QWORD *)(v8 + 328);
      if (v10)
      {
        v11 = dispatch_time(0x8000000000000000, (uint64_t)(v9 * 1000000000.0));
        if (*(_QWORD *)v10)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
        else
        {
          *(_QWORD *)(v10 + 32) = v11;
          *(_QWORD *)(v10 + 40) = -1;
          if (*(_BYTE *)(v10 + 48) && *(_BYTE *)(v10 + 49))
            nw_queue_source_run_timer(v10, v11);
        }
      }
    }
  }
  if (v3)
  {
    v12 = *(_QWORD **)(a1 + 32);
    if (v12)
      v12 = (_QWORD *)v12[32];
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
    {
      v15 = *(void **)(v14 + 256);
      *(_QWORD *)(v14 + 256) = 0;

    }
    objc_msgSend(v13, "stop", v24, v25, v26, v27, v28, v29);
    v17 = *(void **)(a1 + 32);
    if (v17)
      objc_setProperty_nonatomic_copy(v17, v16, v3, 56);
    objc_msgSend(v3, "HTTPMethod");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "caseInsensitiveCompare:", CFSTR("GET"));

    if (v19)
    {
      objc_msgSend(v3, "HTTPMethod");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "caseInsensitiveCompare:", CFSTR("HEAD"));

      v20 = *(_QWORD **)(a1 + 32);
      if (v23)
      {
LABEL_27:
        objc_msgSend(v20, "startNextLoad:", 0);

        goto LABEL_28;
      }
    }
    else
    {
      v20 = *(_QWORD **)(a1 + 32);
    }
    if (v20)
    {
      v21 = (void *)v20[51];
      v20[51] = 0;

      v20 = *(_QWORD **)(a1 + 32);
    }
    goto LABEL_27;
  }
LABEL_28:

}

void __49__NWURLSessionTask_loaderWillPerformHSTSUpgrade___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  id *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NWURLError *v15;
  id v16;
  id *v17;
  uint64_t v18;
  NWURLError *v19;
  id newValue;
  objc_super v21;

  v3 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  newValue = v3;
  if (!v5)
  {
    v8 = 0;
    if (v3)
    {
LABEL_9:
      if (v8)
      {
        objc_setProperty_nonatomic_copy(v8, v4, newValue, 56);
        v3 = newValue;
      }
      objc_msgSend(v3, "HTTPMethod");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("GET"));

      if (v10)
      {
        objc_msgSend(newValue, "HTTPMethod");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("HEAD"));

        v11 = *(_QWORD **)(a1 + 32);
        if (v14)
        {
LABEL_15:
          objc_msgSend(v11, "startNextLoad:", 0);
LABEL_28:
          v3 = newValue;
          goto LABEL_29;
        }
      }
      else
      {
        v11 = *(_QWORD **)(a1 + 32);
      }
      if (v11)
      {
        v12 = (void *)v11[51];
        v11[51] = 0;

        v11 = *(_QWORD **)(a1 + 32);
      }
      goto LABEL_15;
    }
LABEL_22:
    if (v8)
    {
      v15 = [NWURLError alloc];
      v16 = v8[32];
      v17 = v8;
      if (v15)
      {
        v18 = *MEMORY[0x1E0CB32E8];
        v21.receiver = v15;
        v21.super_class = (Class)NWURLError;
        v19 = (NWURLError *)objc_msgSendSuper2(&v21, sel_initWithDomain_code_userInfo_, v18, -999, 0);
        v15 = v19;
        if (v19)
          -[NWURLError fillErrorForLoader:andTask:](v19, "fillErrorForLoader:andTask:", v16, v17);
      }

    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v8, "completeTaskWithError:", v15);

    goto LABEL_28;
  }
  if (*(_QWORD *)(v5 + 280) != 2)
  {
    v6 = *(double *)(v5 + 320);
    if (v6 > 0.0)
    {
      v7 = *(_QWORD *)(v5 + 328);
      if (v7)
      {
        v4 = (const char *)dispatch_time(0x8000000000000000, (uint64_t)(v6 * 1000000000.0));
        if (*(_QWORD *)v7)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v7, (dispatch_time_t)v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
LABEL_7:
          v3 = newValue;
          goto LABEL_8;
        }
        *(_QWORD *)(v7 + 32) = v4;
        *(_QWORD *)(v7 + 40) = -1;
        v3 = newValue;
        if (*(_BYTE *)(v7 + 48) && *(_BYTE *)(v7 + 49))
        {
          nw_queue_source_run_timer(v7, (uint64_t)v4);
          goto LABEL_7;
        }
      }
    }
LABEL_8:
    v8 = *(id **)(a1 + 32);
    if (v3)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_29:

}

void __89__NWURLSessionTask_loaderConnectedWithHTTPConnectionMetadata_CNAMEChain_unlistedTracker___block_invoke(uint64_t a1)
{
  -[NWURLSessionTask complete](*(_QWORD *)(a1 + 32));
}

- (void)complete
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  os_log_type_t v9;
  uint64_t v10;
  unsigned int v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  uint32_t v26;
  id *Property;
  id v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  BOOL is_equal;
  uint64_t isa;
  size_t v35;
  char *v36;
  uint64_t start_time;
  unsigned int v38;
  uint64_t v39;
  uint64_t end_time;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  id v49;
  os_unfair_lock_s **v50;
  void *v51;
  os_unfair_lock_s **v52;
  xpc_object_t v53;
  unsigned int label;
  unsigned int domain;
  uint64_t investigation_identifier;
  unsigned int v57;
  const char *v58;
  xpc_object_t empty;
  unint64_t v60;
  BOOL *v61;
  xpc_object_t v62;
  unint64_t v63;
  const char *v64;
  unint64_t v65;
  const char *v66;
  unint64_t v67;
  const char *v68;
  unsigned int v69;
  const char *v70;
  unint64_t v71;
  const char *v72;
  void *v73;
  int v74;
  _BOOL4 is_valid;
  _BOOL4 v76;
  NSObject *v77;
  const char *v78;
  NSObject *v79;
  uint32_t v80;
  void *v81;
  SEL v82;
  void *v83;
  char *v84;
  NSObject *v85;
  os_log_type_t v86;
  NSObject *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  os_log_type_t v92;
  char *v93;
  os_log_type_t v94;
  _BOOL4 v95;
  char *backtrace_string;
  os_log_type_t v97;
  _BOOL4 v98;
  os_log_type_t v99;
  os_log_type_t v100;
  char *v101;
  uint64_t v102;
  void *v103;
  id *xdict;
  uint64_t v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  os_unfair_lock_s **self;
  void *v111;
  _QWORD v112[4];
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  char v122;
  int v123;
  char v124;
  int v125;
  char v126;
  _BYTE buf[24];
  _BYTE v128[24];
  uint64_t *v129;
  uint64_t *v130;
  char *v131;
  unint64_t v132;
  os_log_type_t string[48];
  uuid_string_t out;
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 304));
    v3 = *(_QWORD *)(a1 + 328);
    if (v3)
    {
      *(_QWORD *)(a1 + 328) = 0;
      nw_queue_cancel_source(v3, v2);
    }
    v4 = *(_QWORD *)(a1 + 312);
    if (v4)
    {
      *(_QWORD *)(a1 + 312) = 0;
      nw_queue_cancel_source(v4, v2);
    }
    v5 = *(_QWORD *)(a1 + 344);
    if (v5)
    {
      *(_QWORD *)(a1 + 344) = 0;
      nw_queue_cancel_source(v5, v2);
    }
    v6 = *(_QWORD *)(a1 + 336);
    if (v6)
    {
      *(_QWORD *)(a1 + 336) = 0;
      nw_queue_cancel_source(v6, v2);
    }
    -[NWURLSessionTask finishProgressReporting](a1);
    *(_QWORD *)(a1 + 280) = 2;
    objc_msgSend(*(id *)(a1 + 256), "stop");
    v7 = *(void **)(a1 + 256);
    *(_QWORD *)(a1 + 256) = 0;

    objc_msgSend((id)a1, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v8;
    if (v8)
    {
      v9 = 16 * (objc_msgSend(v8, "code") != -999);
      v10 = *(_QWORD *)(a1 + 400);
      if (v10)
        v11 = objc_msgSend(*(id *)(v10 + 16), "_loggingPrivacyLevel");
      else
        v11 = 0;
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v12 = (id)gurlLogObj;
      v13 = os_log_type_enabled(v12, v9);
      if (v11 > 2)
      {
        if (v13)
        {
          objc_msgSend((id)a1, "logDescription");
          objc_msgSend((id)a1, "logDescription");
          v19 = objc_msgSend(v109, "code");
          *(_DWORD *)buf = 68289795;
          *(_DWORD *)&buf[4] = 16;
          *(_WORD *)&buf[8] = 2098;
          *(_QWORD *)&buf[10] = &v122;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v121;
          *(_WORD *)v128 = 2048;
          *(_QWORD *)&v128[2] = v19;
          *(_WORD *)&v128[10] = 2117;
          *(_QWORD *)&v128[12] = v109;
          v15 = "Task <%{public,uuid_t}.16P>.<%u> finished with error [%ld] %{sensitive}@";
          goto LABEL_24;
        }
      }
      else if (v13)
      {
        objc_msgSend((id)a1, "logDescription");
        objc_msgSend((id)a1, "logDescription");
        v14 = objc_msgSend(v109, "code");
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)&buf[4] = 16;
        *(_WORD *)&buf[8] = 2098;
        *(_QWORD *)&buf[10] = &v124;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v123;
        *(_WORD *)v128 = 2048;
        *(_QWORD *)&v128[2] = v14;
        *(_WORD *)&v128[10] = 2112;
        *(_QWORD *)&v128[12] = v109;
        v15 = "Task <%{public,uuid_t}.16P>.<%u> finished with error [%ld] %@";
LABEL_24:
        v16 = v12;
        v17 = v9;
        v18 = 44;
        goto LABEL_25;
      }
    }
    else
    {
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v12 = (id)gurlLogObj;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)a1, "logDescription");
        objc_msgSend((id)a1, "logDescription");
        *(_DWORD *)buf = 68289282;
        *(_DWORD *)&buf[4] = 16;
        *(_WORD *)&buf[8] = 2098;
        *(_QWORD *)&buf[10] = &v126;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v125;
        v15 = "Task <%{public,uuid_t}.16P>.<%u> finished successfully";
        v16 = v12;
        v17 = OS_LOG_TYPE_DEFAULT;
        v18 = 24;
LABEL_25:
        _os_log_impl(&dword_182FBE000, v16, v17, v15, buf, v18);
      }
    }

    -[NWURLSessionTaskConfiguration activity](*(_QWORD *)(a1 + 400));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 400);
    if (v22)
    {
      -[NWURLSessionTaskConfiguration activity](*(_QWORD *)(a1 + 400));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v22 + 24), "_nw_activity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23 == v24;

      if (!v25)
      {
        if (v109)
        {
          if (objc_msgSend(v109, "code") == -999)
            v26 = 4;
          else
            v26 = 3;
        }
        else
        {
          v26 = 2;
        }
        nw_activity_complete_with_reason_and_underlying_error(v21, v26, 1, objc_msgSend(v109, "code"));
      }
    }
    Property = (id *)objc_getProperty((id)a1, v20, 432, 1);
    self = (os_unfair_lock_s **)(id)a1;
    v28 = v21;
    v29 = v28;
    if (!Property || !nw_activity_is_selected_for_reporting(v28))
      goto LABEL_105;
    v30 = Property[2];
    v31 = v30;
    xdict = Property;
    v108 = v29;
    if (v30)
    {
      v32 = nw_protocol_metadata_copy_definition(v30);
      if (nw_protocol_copy_http_client_definition_onceToken != -1)
        dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_52_74156);
      is_equal = nw_protocol_definition_is_equal(v32, (nw_protocol_definition_t)nw_protocol_copy_http_client_definition_definition);

      if (is_equal)
      {
        *(_QWORD *)out = 0;
        *(_QWORD *)&out[8] = out;
        *(_QWORD *)&out[16] = 0x2020000000;
        *(_QWORD *)&out[24] = 0;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __nw_http_client_metadata_get_transaction_count_block_invoke;
        *(_QWORD *)v128 = &unk_1E14A9D68;
        *(_QWORD *)&v128[8] = out;
        isa = (uint64_t)v31[4].isa;
        if (isa)
        {
          __nw_http_client_metadata_get_transaction_count_block_invoke((uint64_t)buf, isa);
          v105 = *(_QWORD *)(*(_QWORD *)&out[8] + 24);
        }
        else
        {
          v105 = 0;
        }
        _Block_object_dispose(out, 8);

        v35 = 120 * v105 + 104;
        if (120 * v105 == -104)
        {
          __nwlog_obj();
          v87 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v87, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "strict_calloc";
          LODWORD(v102) = 12;
          v101 = buf;
          v88 = (void *)_os_log_send_and_compose_impl();

          if (__nwlog_abort((uint64_t)v88))
            goto LABEL_148;
          free(v88);
          v35 = 0;
        }
LABEL_44:
        v36 = (char *)malloc_type_calloc(1uLL, v35, 0xEAFB8F1AuLL);
        if (v36)
          goto LABEL_45;
        __nwlog_obj();
        v89 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v89, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "strict_calloc";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = 1;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)v128 = v35;
        LODWORD(v102) = 32;
        v101 = buf;
        v90 = (void *)_os_log_send_and_compose_impl();

        if (!__nwlog_abort((uint64_t)v90))
        {
          free(v90);
LABEL_45:
          start_time = nw_http_client_metadata_get_start_time(Property[2]);
          v38 = dword_1ECD84D64;
          if (!dword_1ECD84D64)
          {
            mach_timebase_info((mach_timebase_info_t)&time_base);
            v38 = dword_1ECD84D64;
          }
          v39 = time_base;
          *(_QWORD *)v36 = 0;
          end_time = nw_http_client_metadata_get_end_time(Property[2]);
          v41 = (start_time * v39 / (unint64_t)v38 * (unsigned __int128)0x431BDE82D7B634DBuLL) >> 64;
          if (!end_time)
          {
            v42 = mach_continuous_time();
            if (v42 <= 1)
              end_time = 1;
            else
              end_time = v42;
          }
          v43 = v41 >> 18;
          v44 = dword_1ECD84D64;
          if (!dword_1ECD84D64)
          {
            mach_timebase_info((mach_timebase_info_t)&time_base);
            v44 = dword_1ECD84D64;
          }
          *((_QWORD *)v36 + 1) = end_time * (unint64_t)time_base / v44 / 0xF4240 - v43;
          objc_msgSend(self, "error", v101, v102);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *((_QWORD *)v36 + 3) = objc_msgSend(v45, "code");
          objc_msgSend(v45, "userInfo");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          *((_QWORD *)v36 + 4) = objc_msgSend(v107, "code");
          nw_activity_get_token(v108, (_OWORD *)v36 + 4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v47 = v45;
            v48 = 3;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v47 = v45;
              v48 = 2;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v47 = v45;
                v48 = 4;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v47 = v45;
                  v48 = 5;
                }
                else
                {
                  objc_opt_class();
                  v47 = v45;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v48 = 6;
                  else
                    v48 = 1;
                }
              }
            }
          }
          *((_DWORD *)v36 + 24) = v48;
          *((_WORD *)v36 + 50) = 256;
          v36[102] = 0;
          v117 = 0;
          v118 = &v117;
          v119 = 0x2020000000;
          v120 = 0;
          v113 = 0;
          v114 = &v113;
          v115 = 0x2020000000;
          v116 = 0;
          v112[0] = 0;
          v112[1] = v112;
          v112[2] = 0x2020000000;
          v112[3] = 0;
          v49 = xdict[2];
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __53__NWURLSessionTaskMetrics_reportToSymptoms_activity___block_invoke;
          *(_QWORD *)v128 = &unk_1E149EE28;
          *(_QWORD *)&v128[16] = v112;
          v129 = &v117;
          v130 = &v113;
          v131 = v36;
          v132 = v43;
          v50 = self;
          *(_QWORD *)&v128[8] = v50;
          nw_http_client_metadata_enumerate_transactions(v49, buf);

          v51 = v47;
          *((_QWORD *)v36 + 2) = v114[3];
          *((_QWORD *)v36 + 6) = v118[3];
          *((_QWORD *)v36 + 7) = v105;
          if (reportToSymptoms_activity__onceToken != -1)
            dispatch_once(&reportToSymptoms_activity__onceToken, &__block_literal_global_28270);
          symptom_new();
          symptom_set_qualifier();
          symptom_set_additional_qualifier();
          if (!os_variant_has_internal_diagnostics()
            || !networkd_settings_get_BOOL((const char *)nw_setting_activity_write_metric_stream_to_log))
          {
            symptom_send();
LABEL_104:
            free(v36);

            _Block_object_dispose(v112, 8);
            _Block_object_dispose(&v113, 8);
            _Block_object_dispose(&v117, 8);

            v29 = v108;
LABEL_105:

            v81 = *(void **)(a1 + 400);
            *(_QWORD *)(a1 + 400) = 0;

            objc_msgSend(self, "setSecTrust:", 0);
            objc_setProperty_atomic_copy(self, v82, 0, 296);
            -[NWURLSession taskCompleted:](self[49], self);

            return;
          }
          v111 = 0;
          v52 = v50;
          v106 = v108;
          v53 = xpc_dictionary_create(0, 0, 0);
          memset(out, 0, sizeof(out));
          uuid_unparse((const unsigned __int8 *)v36 + 64, out);
          xpc_dictionary_set_string(v53, "activityUUID", out);
          label = nw_activity_get_label(v106);
          xpc_dictionary_set_uint64(v53, "activityLabel", label);
          domain = nw_activity_get_domain(v106);
          xpc_dictionary_set_uint64(v53, "activityDomain", domain);
          investigation_identifier = nw_activity_get_investigation_identifier(v106);
          xpc_dictionary_set_uint64(v53, "identifier", investigation_identifier);
          objc_msgSend(v52, "description");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          xpc_dictionary_set_string(v53, "taskUUID", (const char *)objc_msgSend(v103, "UTF8String"));
          xpc_dictionary_set_uint64(v53, "didCompleteWithError", *((_QWORD *)v36 + 1));
          xpc_dictionary_set_uint64(v53, "numberOfRetries", *((_QWORD *)v36 + 2));
          xpc_dictionary_set_uint64(v53, "numberOfRedirects", *((_QWORD *)v36 + 6));
          xpc_dictionary_set_int64(v53, "error", *((_QWORD *)v36 + 3));
          xpc_dictionary_set_int64(v53, "underlyingError", *((_QWORD *)v36 + 4));
          xpc_dictionary_set_int64(v53, "underlyingErrorDomain", *((_QWORD *)v36 + 5));
          v57 = *((_DWORD *)v36 + 24) - 1;
          if (v57 > 5)
            v58 = "UNKNOWN";
          else
            v58 = off_1E149EE68[v57];
          xpc_dictionary_set_string(v53, "taskType", v58);
          xpc_dictionary_set_BOOL(v53, "isBackground", v36[100]);
          xpc_dictionary_set_BOOL(v53, "usedUnifiedStack", 1);
          xpc_dictionary_set_BOOL(v53, "apSleepWakeMonitored", v36[102]);
          empty = xpc_array_create_empty();
          if (*((_QWORD *)v36 + 7))
          {
            v60 = 0;
            v61 = (BOOL *)(v36 + 216);
            do
            {
              v62 = xpc_dictionary_create(0, 0, 0);
              xpc_dictionary_set_uint64(v62, "requestStart", *((_QWORD *)v61 - 14));
              xpc_dictionary_set_uint64(v62, "requestEnd", *((_QWORD *)v61 - 13));
              xpc_dictionary_set_uint64(v62, "responseStart", *((_QWORD *)v61 - 12));
              xpc_dictionary_set_uint64(v62, "responseEnd", *((_QWORD *)v61 - 11));
              xpc_dictionary_set_uint64(v62, "totalBytesWritten", *((_QWORD *)v61 - 10));
              xpc_dictionary_set_uint64(v62, "totalBytesRead", *((_QWORD *)v61 - 9));
              memset(string, 0, 37);
              uuid_unparse((const unsigned __int8 *)v61 - 64, (char *)string);
              xpc_dictionary_set_string(v62, "connectionUUID", (const char *)string);
              v63 = *((_QWORD *)v61 - 6) - 1;
              v64 = "UNKNOWN";
              if (v63 <= 2)
                v64 = off_1E149EE98[v63];
              xpc_dictionary_set_string(v62, "networkLoadType", v64);
              v65 = *((_QWORD *)v61 - 5) - 1;
              v66 = "UNKNOWN";
              if (v65 <= 4)
                v66 = off_1E149EEB0[v65];
              xpc_dictionary_set_string(v62, "schedulingTier", v66);
              v67 = *((_QWORD *)v61 - 4) - 1;
              v68 = "UNKNOWN";
              if (v67 <= 4)
                v68 = off_1E149EED8[v67];
              xpc_dictionary_set_string(v62, "http3Status", v68);
              v69 = *((_DWORD *)v61 - 6) - 1;
              v70 = "UNKNOWN";
              if (v69 <= 4)
                v70 = off_1E149EF00[v69];
              xpc_dictionary_set_string(v62, "networkProtocolName", v70);
              xpc_dictionary_set_BOOL(v62, "reusedConnection", *(v61 - 20));
              xpc_dictionary_set_BOOL(v62, "isRedirected", *(v61 - 19));
              xpc_dictionary_set_BOOL(v62, "proxied", *(v61 - 18));
              v71 = *((_QWORD *)v61 - 2) - 1;
              v72 = "UNKNOWN";
              if (v71 <= 0xC)
                v72 = off_1E149EF28[v71];
              xpc_dictionary_set_string(v62, "httpServerType", v72);
              objc_msgSend(v52, "response");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v74 = objc_msgSend(v73, "statusCode");
              else
                v74 = 0;
              xpc_dictionary_set_int64(v62, "statusCode", v74);

              xpc_dictionary_set_uint64(v62, "reusedAfterTime", *((_QWORD *)v61 - 1));
              xpc_dictionary_set_BOOL(v62, "reusedAfterSleepWake", *v61);
              xpc_array_append_value(empty, v62);

              ++v60;
              v61 += 120;
            }
            while (v60 < *((_QWORD *)v36 + 7));
          }
          xpc_dictionary_set_value(v53, "transactionMetrics", empty);

          is_valid = nw_activity_metric_object_is_valid(v53, 0, (const char **)&v111);
          if (v111)
            v76 = is_valid;
          else
            v76 = 0;
          if (v76)
          {
            if (__nwlog_metricstream_log::onceToken != -1)
              dispatch_once(&__nwlog_metricstream_log::onceToken, &__block_literal_global_51_44220);
            v77 = (id)gmetricstreamLogObj;
            if (!os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
              goto LABEL_101;
            *(_DWORD *)out = 136446210;
            *(_QWORD *)&out[4] = v111;
            v78 = "%{public}s";
            v79 = v77;
            v80 = 12;
          }
          else
          {
            if (__nwlog_url_log::onceToken != -1)
              dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
            v77 = (id)gurlLogObj;
            if (!os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
              goto LABEL_101;
            *(_WORD *)out = 0;
            v78 = "There was an issue with either validating the dictionary or the description being null";
            v79 = v77;
            v80 = 2;
          }
          _os_log_impl(&dword_182FBE000, v79, OS_LOG_TYPE_DEFAULT, v78, (uint8_t *)out, v80);
LABEL_101:

          if (v111)
          {
            free(v111);
            v111 = 0;
          }

          goto LABEL_104;
        }
LABEL_148:
        __break(1u);
        return;
      }
      __nwlog_obj();
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)out = 136446210;
      *(_QWORD *)&out[4] = "nw_http_client_metadata_get_transaction_count";
      LODWORD(v102) = 12;
      v101 = out;
      v84 = (char *)_os_log_send_and_compose_impl();

      string[0] = OS_LOG_TYPE_ERROR;
      LOBYTE(v117) = 0;
      if (__nwlog_fault(v84, string, &v117))
      {
        if (string[0] == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v85 = objc_claimAutoreleasedReturnValue();
          v92 = string[0];
          if (os_log_type_enabled(v85, string[0]))
          {
            *(_DWORD *)out = 136446210;
            *(_QWORD *)&out[4] = "nw_http_client_metadata_get_transaction_count";
            _os_log_impl(&dword_182FBE000, v85, v92, "%{public}s metadata must be http_client", (uint8_t *)out, 0xCu);
          }
        }
        else if ((_BYTE)v117)
        {
          backtrace_string = (char *)__nw_create_backtrace_string();
          __nwlog_obj();
          v85 = objc_claimAutoreleasedReturnValue();
          v97 = string[0];
          v98 = os_log_type_enabled(v85, string[0]);
          if (backtrace_string)
          {
            if (v98)
            {
              *(_DWORD *)out = 136446466;
              *(_QWORD *)&out[4] = "nw_http_client_metadata_get_transaction_count";
              *(_WORD *)&out[12] = 2082;
              *(_QWORD *)&out[14] = backtrace_string;
              _os_log_impl(&dword_182FBE000, v85, v97, "%{public}s metadata must be http_client, dumping backtrace:%{public}s", (uint8_t *)out, 0x16u);
            }

            free(backtrace_string);
            if (!v84)
              goto LABEL_146;
            goto LABEL_145;
          }
          if (v98)
          {
            *(_DWORD *)out = 136446210;
            *(_QWORD *)&out[4] = "nw_http_client_metadata_get_transaction_count";
            _os_log_impl(&dword_182FBE000, v85, v97, "%{public}s metadata must be http_client, no backtrace", (uint8_t *)out, 0xCu);
          }
        }
        else
        {
          __nwlog_obj();
          v85 = objc_claimAutoreleasedReturnValue();
          v100 = string[0];
          if (os_log_type_enabled(v85, string[0]))
          {
            *(_DWORD *)out = 136446210;
            *(_QWORD *)&out[4] = "nw_http_client_metadata_get_transaction_count";
            _os_log_impl(&dword_182FBE000, v85, v100, "%{public}s metadata must be http_client, backtrace limit exceeded", (uint8_t *)out, 0xCu);
          }
        }
        goto LABEL_143;
      }
LABEL_144:
      if (!v84)
      {
LABEL_146:

        v105 = 0;
        v35 = 104;
        goto LABEL_44;
      }
LABEL_145:
      free(v84);
      goto LABEL_146;
    }
    __nwlog_obj();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)out = 136446210;
    *(_QWORD *)&out[4] = "nw_http_client_metadata_get_transaction_count";
    LODWORD(v102) = 12;
    v101 = out;
    v84 = (char *)_os_log_send_and_compose_impl();

    string[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v117) = 0;
    if (!__nwlog_fault(v84, string, &v117))
      goto LABEL_144;
    if (string[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v85 = objc_claimAutoreleasedReturnValue();
      v86 = string[0];
      if (os_log_type_enabled(v85, string[0]))
      {
        *(_DWORD *)out = 136446210;
        *(_QWORD *)&out[4] = "nw_http_client_metadata_get_transaction_count";
        _os_log_impl(&dword_182FBE000, v85, v86, "%{public}s called with null metadata", (uint8_t *)out, 0xCu);
      }
    }
    else if ((_BYTE)v117)
    {
      v93 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v85 = objc_claimAutoreleasedReturnValue();
      v94 = string[0];
      v95 = os_log_type_enabled(v85, string[0]);
      if (v93)
      {
        if (v95)
        {
          *(_DWORD *)out = 136446466;
          *(_QWORD *)&out[4] = "nw_http_client_metadata_get_transaction_count";
          *(_WORD *)&out[12] = 2082;
          *(_QWORD *)&out[14] = v93;
          _os_log_impl(&dword_182FBE000, v85, v94, "%{public}s called with null metadata, dumping backtrace:%{public}s", (uint8_t *)out, 0x16u);
        }

        free(v93);
        goto LABEL_144;
      }
      if (v95)
      {
        *(_DWORD *)out = 136446210;
        *(_QWORD *)&out[4] = "nw_http_client_metadata_get_transaction_count";
        _os_log_impl(&dword_182FBE000, v85, v94, "%{public}s called with null metadata, no backtrace", (uint8_t *)out, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v85 = objc_claimAutoreleasedReturnValue();
      v99 = string[0];
      if (os_log_type_enabled(v85, string[0]))
      {
        *(_DWORD *)out = 136446210;
        *(_QWORD *)&out[4] = "nw_http_client_metadata_get_transaction_count";
        _os_log_impl(&dword_182FBE000, v85, v99, "%{public}s called with null metadata, backtrace limit exceeded", (uint8_t *)out, 0xCu);
      }
    }
LABEL_143:

    goto LABEL_144;
  }
}

- (void)finishProgressReporting
{
  void *v2;
  id v3;
  id v4;
  id *obj;

  if (a1 && !*(_BYTE *)(a1 + 15))
  {
    *(_BYTE *)(a1 + 15) = 1;
    objc_msgSend((id)a1, "error");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      v3 = *(id *)(a1 + 352);
      objc_msgSend(*(id *)(a1 + 352), "setCompletedUnitCount:", objc_msgSend(v3, "totalUnitCount"));

      v4 = *(id *)(a1 + 360);
      objc_msgSend(*(id *)(a1 + 360), "setCompletedUnitCount:", objc_msgSend(v4, "totalUnitCount"));

    }
    obj = (id *)(id)a1;
    objc_sync_enter(obj);
    objc_msgSend(obj[8], "setCancellationHandler:", 0);
    objc_msgSend(obj[8], "setPausingHandler:", 0);
    objc_msgSend(obj[8], "setResumingHandler:", 0);
    objc_sync_exit(obj);

  }
}

void __72__NWURLSessionTask_loaderNeedsBodyProviderFromOffset_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  dispatch_time_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  id v18;

  v4 = a2;
  v5 = a1[4];
  v18 = v4;
  if (v5)
  {
    v6 = *(double *)(v5 + 320);
    if (v6 > 0.0)
    {
      v7 = *(_QWORD *)(v5 + 328);
      if (v7)
      {
        v8 = dispatch_time(0x8000000000000000, (uint64_t)(v6 * 1000000000.0));
        if (*(_QWORD *)v7)
        {
          dispatch_source_set_timer(*(dispatch_source_t *)v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
LABEL_6:
          v4 = v18;
          goto LABEL_7;
        }
        *(_QWORD *)(v7 + 32) = v8;
        *(_QWORD *)(v7 + 40) = -1;
        v4 = v18;
        if (*(_BYTE *)(v7 + 48) && *(_BYTE *)(v7 + 49))
        {
          nw_queue_source_run_timer(v7, v8);
          goto LABEL_6;
        }
      }
    }
  }
LABEL_7:
  if (v4)
  {
    v9 = a1[4];
    if (v9)
    {
      v10 = *(_QWORD *)(v9 + 408);
      v11 = v4;
      if (v10)
      {
        objc_storeStrong((id *)(v10 + 32), a2);
        *(_QWORD *)(v10 + 48) = 0;
      }
    }
    else
    {
      v17 = v4;
    }

    v12 = (_QWORD *)a1[4];
    v13 = a1[5];
    if (v12)
      v12 = (_QWORD *)v12[51];
    v14 = (void *)a1[6];
    v15 = v12;
    -[NWURLSessionRequestBodyInfo bodyProviderFromOffset:](v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v16);

  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }

}

- (void)startStartTimer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NWURLError *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  objc_super v14;

  if (a1)
  {
    objc_msgSend((id)a1, "currentRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_startTimeoutDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend((id)a1, "currentRequest");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_startTimeoutDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceNow");
      v7 = v6;

      if (v7 <= 0.0)
      {
        v8 = [NWURLError alloc];
        v9 = *(id *)(a1 + 256);
        v10 = (id)a1;
        if (v8
          && (v11 = *MEMORY[0x1E0CB32E8],
              v14.receiver = v8,
              v14.super_class = (Class)NWURLError,
              (v12 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v11, -1001, 0)) != 0))
        {
          v13 = v12;
          objc_msgSend(v12, "fillErrorForLoader:andTask:", v9, v10);
        }
        else
        {
          v13 = 0;
        }

        objc_msgSend(v10, "completeTaskWithError:", v13);
      }
      else if (!*(_QWORD *)(a1 + 336))
      {
        *(_QWORD *)(a1 + 336) = -[NWURLSessionTask createTimerWithTimeout:](a1, v7);
      }
    }
  }
}

- (void)startResourceTimer
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;

  if (a1)
  {
    objc_msgSend(a1, "currentRequest");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_startTimeoutDate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(a1, "currentRequest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_payloadTransmissionTimeout");
      v7 = v6;

      if (v7 != 0.0)
        return;
    }
    else
    {

    }
    v8 = a1[50];
    if (v8)
    {
      objc_msgSend(*(id *)(v8 + 24), "_timeoutIntervalForResource");
      if (v9 == 0.0)
      {
        objc_msgSend(*(id *)(v8 + 16), "timeoutIntervalForResource");
        if (v10 <= 0.0)
          return;
      }
      else
      {
        objc_msgSend(*(id *)(v8 + 24), "_timeoutIntervalForResource");
        if (v10 <= 0.0)
          return;
      }
      if (!a1[39])
        a1[39] = -[NWURLSessionTask createTimerWithTimeout:]((uint64_t)a1, v10);
    }
  }
}

void __34__NWURLSessionTask_startNextLoad___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  v4 = a2;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  if (!v6)
  {
    v8 = 0;
    v7 = 0;
    if (v4)
      goto LABEL_5;
    goto LABEL_8;
  }
  if (*(_QWORD *)(v6 + 280) != 2)
  {
    if (v4)
    {
      objc_storeStrong((id *)(v6 + 256), a2);
      v7 = *(_QWORD *)(a1 + 32);
LABEL_5:
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __34__NWURLSessionTask_startNextLoad___block_invoke_2;
      v9[3] = &unk_1E14ACFD0;
      v9[4] = v7;
      objc_msgSend(v5, "start:", v9);
      goto LABEL_6;
    }
    -[NWURLSessionTask errorForErrorCode:](*(id **)(a1 + 32), -1002);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    objc_msgSend((id)v6, "completeTaskWithError:", v8);

  }
LABEL_6:

}

- (id)errorForErrorCode:(id *)a1
{
  NWURLError *v4;
  id v5;
  id *v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_super v11;

  if (!a1)
    return 0;
  v4 = [NWURLError alloc];
  v5 = a1[32];
  v6 = a1;
  if (v4)
  {
    v7 = *MEMORY[0x1E0CB32E8];
    v11.receiver = v4;
    v11.super_class = (Class)NWURLError;
    v8 = objc_msgSendSuper2(&v11, sel_initWithDomain_code_userInfo_, v7, a2, 0);
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "fillErrorForLoader:andTask:", v5, v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __34__NWURLSessionTask_startNextLoad___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 400);
    if (!v2 || (objc_msgSend(*(id *)(v2 + 24), "_preconnect") & 1) == 0 && (v1 = *(_QWORD *)(a1 + 32)) != 0)
    {
      nw_context_assert_queue(*(void **)(v1 + 304));
      v4 = *(id *)(v1 + 256);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __32__NWURLSessionTask_readResponse__block_invoke;
      v6[3] = &unk_1E14A2D48;
      v6[4] = v1;
      v7 = v4;
      v5 = v4;
      objc_msgSend(v5, "readResponse:", v6);

    }
  }
}

void __32__NWURLSessionTask_readResponse__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  dispatch_time_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  if (v7)
  {
    if (v7[32] != *(_QWORD *)(a1 + 40) || v7[35] == 2)
      goto LABEL_18;
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    goto LABEL_18;
  }
  if (v6)
  {
    objc_msgSend(v7, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD **)(a1 + 32);
    if (!v8)
    {
      if (v7)
      {
        objc_setProperty_atomic_copy(v7, v9, v6, 136);
        v7 = *(_QWORD **)(a1 + 32);
      }
    }
  }
  objc_msgSend(v7, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "completeTaskWithError:", v17);

  }
  else
  {
    if (v11)
    {
      v12 = *(double *)(v11 + 320);
      if (v12 > 0.0)
      {
        v13 = *(_QWORD *)(v11 + 328);
        if (v13)
        {
          v14 = dispatch_time(0x8000000000000000, (uint64_t)(v12 * 1000000000.0));
          if (*(_QWORD *)v13)
          {
            dispatch_source_set_timer(*(dispatch_source_t *)v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
          }
          else
          {
            *(_QWORD *)(v13 + 32) = v14;
            *(_QWORD *)(v13 + 40) = -1;
            if (*(_BYTE *)(v13 + 48) && *(_BYTE *)(v13 + 49))
              nw_queue_source_run_timer(v13, v14);
          }
        }
        else
        {
          *(_QWORD *)(v11 + 328) = -[NWURLSessionTask createTimerWithTimeout:](*(_QWORD *)(a1 + 32), v12);
        }
      }
    }
    -[NWURLSessionTask updateResponse:](*(_QWORD *)(a1 + 32), v5);
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
      v16 = *(void **)(v15 + 416);
    else
      v16 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __32__NWURLSessionTask_readResponse__block_invoke_2;
    v18[3] = &unk_1E14A2D20;
    v18[4] = v15;
    v19 = v5;
    objc_msgSend(v16, "task:deliverResponse:completionHandler:", v15, v19, v18);

  }
LABEL_18:

}

- (void)updateResponse:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  SecTrustRef v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 256), "peerTrust");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v8 = *MEMORY[0x1E0C93268];
      v6 = sec_trust_copy_ref(v4);
      v9[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_setSSLCertificateContext:", v7);

    }
  }

}

void __32__NWURLSessionTask_readResponse__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v5;
  void *v6;
  NWURLSessionMultipartParser *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NWURLSessionMultipartParser *v14;
  id *p_boundary;
  NSMutableDictionary *v16;
  NSMutableDictionary *headers;
  NSMutableArray *v18;
  NSMutableArray *parts;
  void *v20;
  NWURLSessionMultipartBoundaryRecognizer *v21;
  id v22;
  id *v23;
  NWURLSessionMultipartBoundaryRecognizer *v24;
  uint64_t v25;
  size_t v26;
  char *v27;
  NWURLSessionMultipartBoundaryRecognizer *boundaryRecognizer;
  NWURLSessionMultipartPartBoundarySuffixRecognizer *v29;
  NWURLSessionMultipartPartBoundarySuffixRecognizer *boundarySuffixRecognizer;
  NWURLSessionMultipartHeaderRecognizer *v31;
  NWURLSessionMultipartHeaderRecognizer *headerRecognizer;
  void *v33;
  void *v34;
  NWURLSessionStreamTask *v35;
  id v36;
  id *v37;
  const char *v38;
  void *v39;
  void *v40;
  const char *v41;
  void *v42;
  SEL v43;
  id Property;
  const char *v45;
  void *v46;
  SEL v47;
  void *v48;
  id *v49;
  NWURLSessionDownloadTask *v50;
  id v51;
  id *v52;
  const char *v53;
  void *v54;
  void *v55;
  const char *v56;
  void *v57;
  SEL v58;
  id v59;
  const char *v60;
  NWURLSessionResponseConsumerDownload *v61;
  id v62;
  id v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  id *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  id v73;
  objc_super v74;
  void (*v75)(uint64_t, int, id);
  void *v76;
  objc_super *v77;
  _BYTE v78[24];
  void *v79;
  uint64_t v80;
  id *v81;
  objc_super *v82;
  objc_super v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  int v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completeTaskWithError:");
    return;
  }
  v5 = *(id *)(a1 + 40);
  if (!v3)
    goto LABEL_20;
  nw_context_assert_queue(*(void **)(v3 + 304));
  if (*(_QWORD *)(v3 + 280) == 2)
    goto LABEL_20;
  if (a2 != 1)
  {
    switch(a2)
    {
      case 3:
        v35 = [NWURLSessionStreamTask alloc];
        v36 = *(id *)(v3 + 256);
        objc_msgSend((id)v3, "logDescription");
        v37 = -[NWURLSessionStreamTask initWithLoader:identifier:session:]((id *)&v35->super.super.isa, v36, v84, *(void **)(v3 + 392));

        -[NWURLSessionTask setConfiguration:]((uint64_t)v37, *(void **)(v3 + 400));
        objc_msgSend((id)v3, "originalRequest");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          objc_setProperty_nonatomic_copy(v37, v38, v39, 48);

        objc_msgSend((id)v3, "currentRequest");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v40;
        if (v37)
        {
          objc_setProperty_nonatomic_copy(v37, v41, v40, 56);

          objc_storeStrong(v37 + 29, *(id *)(v3 + 232));
          objc_storeStrong(v37 + 30, *(id *)(v3 + 240));
        }
        else
        {

        }
        objc_msgSend((id)v3, "priority");
        objc_msgSend(v37, "setPriority:");
        objc_msgSend(v37, "setPrefersIncrementalDelivery:", objc_msgSend((id)v3, "prefersIncrementalDelivery"));
        -[NWURLSessionTask setClientMetadataForMetrics:]((uint64_t)v37, *(void **)(v3 + 248));
        Property = objc_getProperty((id)v3, v43, 432, 1);
        if (v37)
        {
          objc_setProperty_atomic(v37, v45, Property, 432);
          *((_BYTE *)v37 + 13) = 0;
          v37[35] = (id)1;
          objc_msgSend((id)v3, "response");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_nonatomic_copy(v37, v47, v46, 464);
        }
        else
        {
          objc_msgSend((id)v3, "response");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(*(id *)(v3 + 256), "updateClient:", v37);
        -[NWURLSessionTask setLoader:](v3);
        -[NWURLSessionTask delegateWrapper]((_QWORD *)v3);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v78 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v78[8] = 3221225472;
        *(_QWORD *)&v78[16] = __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke_3;
        v79 = &unk_1E14ACE68;
        v80 = v3;
        v81 = v37;
        v49 = v37;
        -[NWURLSessionDelegateWrapper dataTask:didBecomeStreamTask:completionHandler:]((uint64_t)v48, (void *)v3, v49, v78);

        break;
      case 2:
        v50 = [NWURLSessionDownloadTask alloc];
        v51 = *(id *)(v3 + 256);
        objc_msgSend((id)v3, "logDescription");
        v52 = -[NWURLSessionDownloadTask initWithLoader:identifier:session:]((id *)&v50->super.super.isa, v51, v88, *(void **)(v3 + 392));

        -[NWURLSessionTask setConfiguration:]((uint64_t)v52, *(void **)(v3 + 400));
        objc_msgSend((id)v3, "originalRequest");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52)
          objc_setProperty_nonatomic_copy(v52, v53, v54, 48);

        objc_msgSend((id)v3, "currentRequest");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v55;
        if (v52)
        {
          objc_setProperty_nonatomic_copy(v52, v56, v55, 56);

          objc_storeStrong(v52 + 29, *(id *)(v3 + 232));
          objc_storeStrong(v52 + 30, *(id *)(v3 + 240));
        }
        else
        {

        }
        objc_msgSend((id)v3, "priority");
        objc_msgSend(v52, "setPriority:");
        objc_msgSend(v52, "setPrefersIncrementalDelivery:", 0);
        -[NWURLSessionTask setClientMetadataForMetrics:]((uint64_t)v52, *(void **)(v3 + 248));
        v59 = objc_getProperty((id)v3, v58, 432, 1);
        if (v52)
        {
          objc_setProperty_atomic(v52, v60, v59, 432);
          v61 = objc_alloc_init(NWURLSessionResponseConsumerDownload);
          objc_storeStrong(v52 + 52, v61);
        }
        else
        {
          v61 = objc_alloc_init(NWURLSessionResponseConsumerDownload);
        }

        v83.receiver = 0;
        v83.super_class = (Class)&v83;
        v84 = 0x3032000000;
        v85 = __Block_byref_object_copy__45381;
        v86 = __Block_byref_object_dispose__45382;
        v87 = 0;
        if (v52)
          v62 = v52[52];
        else
          v62 = 0;
        v63 = v62;
        objc_msgSend((id)v3, "response");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = MEMORY[0x1E0C809B0];
        v74.receiver = (id)MEMORY[0x1E0C809B0];
        v74.super_class = (Class)3221225472;
        v75 = __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke;
        v76 = &unk_1E14A2D70;
        v77 = &v83;
        objc_msgSend(v63, "task:deliverResponse:completionHandler:", v52, v64, &v74);

        if (v52)
        {
          *((_BYTE *)v52 + 13) = 0;
          v52[35] = (id)1;
        }
        v66 = *(id *)(v3 + 256);
        objc_msgSend(v66, "updateClient:", v52);

        -[NWURLSessionTask setLoader:](v3);
        -[NWURLSessionTask delegateWrapper]((_QWORD *)v3);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v78 = v65;
        *(_QWORD *)&v78[8] = 3221225472;
        *(_QWORD *)&v78[16] = __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke_2;
        v79 = &unk_1E14A2D98;
        v80 = v3;
        v68 = v52;
        v81 = v68;
        v82 = &v83;
        -[NWURLSessionDelegateWrapper dataTask:didBecomeDownloadTask:completionHandler:]((uint64_t)v67, (void *)v3, v68, v78);

        _Block_object_dispose(&v83, 8);
        break;
      case 0:
        -[NWURLSessionTask errorForErrorCode:]((id *)v3, -999);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v3, "completeTaskWithError:", v34);

        break;
    }
    goto LABEL_20;
  }
  objc_msgSend(*(id *)(v3 + 256), "multipartMixedReplaceBoundary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_19:
    -[NWURLSessionTask readResponseBody](v3);

LABEL_20:
    return;
  }
  v7 = [NWURLSessionMultipartParser alloc];
  v8 = *(void **)(v3 + 416);
  v9 = *(void **)(v3 + 224);
  v10 = v9;
  v11 = v8;
  v73 = v6;
  v12 = v11;
  v13 = v10;
  if (!v7
    || (v74.receiver = v7,
        v74.super_class = (Class)NWURLSessionMultipartParser,
        v14 = (NWURLSessionMultipartParser *)objc_msgSendSuper2(&v74, sel_init),
        (v7 = v14) == 0))
  {
LABEL_18:

    v33 = *(void **)(v3 + 264);
    *(_QWORD *)(v3 + 264) = v7;

    goto LABEL_19;
  }
  v14->_parserState = 0;
  v14->_dispositionState = 0;
  objc_storeStrong((id *)&v14->_responseConsumer, v8);
  p_boundary = (id *)&v7->_boundary;
  objc_storeStrong((id *)&v7->_boundary, v6);
  objc_storeStrong((id *)&v7->_data, MEMORY[0x1E0C80D00]);
  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  headers = v7->_headers;
  v7->_headers = v16;

  v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  parts = v7->_parts;
  v7->_parts = v18;

  objc_storeStrong((id *)&v7->_queue, v9);
  v20 = (void *)-[NSString mutableCopy](v7->_boundary, "mutableCopy");
  if (-[NSString length](v7->_boundary, "length") < 3
    || objc_msgSend(*p_boundary, "characterAtIndex:", 0) != 45
    || objc_msgSend(*p_boundary, "characterAtIndex:", 1) != 45)
  {
    objc_msgSend(v20, "insertString:atIndex:", CFSTR("--"), 0);
  }
  v7->_boundaryPatternSize = objc_msgSend(v20, "lengthOfBytesUsingEncoding:", 5);
  v21 = [NWURLSessionMultipartBoundaryRecognizer alloc];
  v22 = v20;
  if (!v21)
  {
    v24 = 0;
    goto LABEL_17;
  }
  v83.receiver = v21;
  v83.super_class = (Class)NWURLSessionMultipartBoundaryRecognizer;
  v23 = (id *)objc_msgSendSuper2(&v83, sel_init);
  v24 = (NWURLSessionMultipartBoundaryRecognizer *)v23;
  if (!v23)
  {
LABEL_17:

    boundaryRecognizer = v7->_boundaryRecognizer;
    v7->_boundaryRecognizer = v24;

    v29 = objc_alloc_init(NWURLSessionMultipartPartBoundarySuffixRecognizer);
    boundarySuffixRecognizer = v7->_boundarySuffixRecognizer;
    v7->_boundarySuffixRecognizer = v29;

    v31 = objc_alloc_init(NWURLSessionMultipartHeaderRecognizer);
    headerRecognizer = v7->_headerRecognizer;
    v7->_headerRecognizer = v31;

    *(_WORD *)&v7->_isFirstBoundary = 1;
    goto LABEL_18;
  }
  objc_storeStrong(v23 + 1, v20);
  v25 = objc_msgSend(v22, "lengthOfBytesUsingEncoding:", 1);
  v26 = v25 + 1;
  v24->_rollbackBufferCapacity = v25 + 1;
  if (v25 != -1)
    goto LABEL_15;
  __nwlog_obj();
  v71 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);
  *(_DWORD *)v78 = 136446210;
  *(_QWORD *)&v78[4] = "strict_malloc";
  v69 = (void *)_os_log_send_and_compose_impl();

  if (!__nwlog_abort((uint64_t)v69))
  {
    free(v69);
LABEL_15:
    v27 = (char *)malloc_type_malloc(v26, 0xF2B69DE5uLL);
    if (v27)
    {
LABEL_16:
      v24->_rollbackBuffer = v27;
      goto LABEL_17;
    }
    __nwlog_obj();
    v72 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v72, OS_LOG_TYPE_ERROR);
    *(_DWORD *)v78 = 136446466;
    *(_QWORD *)&v78[4] = "strict_malloc";
    *(_WORD *)&v78[12] = 2048;
    *(_QWORD *)&v78[14] = v26;
    v70 = (void *)_os_log_send_and_compose_impl();

    if (!__nwlog_abort((uint64_t)v70))
    {
      free(v70);
      goto LABEL_16;
    }
  }
  __break(1u);
}

- (void)readResponseBody
{
  id v2;
  id v3;
  _QWORD v4[5];
  id v5;

  if (a1)
  {
    nw_context_assert_queue(*(void **)(a1 + 304));
    if (*(_QWORD *)(a1 + 280) != 2)
    {
      if ((*(_BYTE *)(a1 + 13) & 1) != 0)
      {
        *(_BYTE *)(a1 + 14) = 1;
      }
      else
      {
        v2 = *(id *)(a1 + 256);
        v4[0] = MEMORY[0x1E0C809B0];
        v4[1] = 3221225472;
        v4[2] = __36__NWURLSessionTask_readResponseBody__block_invoke;
        v4[3] = &unk_1E14A9BE8;
        v4[4] = a1;
        v5 = v2;
        v3 = v2;
        objc_msgSend(v3, "readDataOfMinimumIncompleteLength:maximumLength:completionHandler:", 1, 0x100000, v4);

      }
    }
  }
}

- (void)setConfiguration:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 400), a2);
}

- (void)setClientMetadataForMetrics:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 248), a2);
}

void __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (void)setLoader:(uint64_t)a1
{
  objc_storeStrong((id *)(a1 + 256), 0);
}

- (_QWORD)delegateWrapper
{
  uint64_t v1;

  if (a1)
  {
    v1 = 30;
    if (!a1[30])
      v1 = 29;
    a1 = (id)a1[v1];
  }
  return a1;
}

void __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  _QWORD *v5;
  os_unfair_lock_s *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (*(_QWORD *)(v2 + 280) = 2, (v3 = *(_QWORD *)(a1 + 32)) != 0))
    v4 = *(os_unfair_lock_s **)(v3 + 392);
  else
    v4 = 0;
  -[NWURLSession taskStarted:](v4, *(void **)(a1 + 40));
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v6 = (os_unfair_lock_s *)v5[49];
  else
    v6 = 0;
  -[NWURLSession taskCompleted:](v6, v5);
  v7 = *(void **)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(v7, "completeTaskWithError:");
  else
    -[NWURLSessionTask readResponseBody]((uint64_t)v7);
}

void __55__NWURLSessionTask_handleResponseDisposition_response___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  _QWORD *v5;
  os_unfair_lock_s *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (*(_QWORD *)(v2 + 280) = 2, (v3 = *(_QWORD *)(a1 + 32)) != 0))
    v4 = *(os_unfair_lock_s **)(v3 + 392);
  else
    v4 = 0;
  -[NWURLSession taskStarted:](v4, *(void **)(a1 + 40));
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v6 = (os_unfair_lock_s *)v5[49];
  else
    v6 = 0;
  -[NWURLSession taskCompleted:](v6, v5);
}

- (id)initWithRequest:(int)a3 identifier:(void *)a4 session:
{
  id v8;
  char *v9;
  char *v10;
  _OWORD *v11;
  void *v12;
  NWURLSessionTaskConfiguration *v13;
  id *p_isa;
  id v15;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  NWURLSessionDelegateWrapper *v20;
  void *v21;
  id v22;
  id *v23;
  id v24;
  id *singleton;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  NWURLSessionTaskMetrics *v33;
  id v34;
  id v35;
  NWURLSessionTaskMetrics *v36;
  id v37;
  id v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  objc_super v48;
  objc_super location;

  v8 = a2;
  v9 = a4;
  if (!a1)
    goto LABEL_31;
  v48.receiver = a1;
  v48.super_class = (Class)NWURLSessionTask;
  v10 = (char *)objc_msgSendSuper2(&v48, sel_init);
  a1 = (id *)v10;
  if (!v10)
    goto LABEL_31;
  v11 = v9 + 8;
  if (!v9)
    v11 = 0;
  *(_OWORD *)(v10 + 440) = *v11;
  *((_DWORD *)v10 + 114) = a3;
  objc_storeStrong((id *)v10 + 6, a2);
  objc_storeStrong(a1 + 7, a2);
  v12 = (void *)*MEMORY[0x1E0C92BE0];
  a1[10] = (id)*MEMORY[0x1E0C92BE0];
  a1[11] = v12;
  a1[14] = v12;
  a1[15] = v12;
  objc_storeStrong(a1 + 49, a4);
  v13 = [NWURLSessionTaskConfiguration alloc];
  p_isa = (id *)&v13->super.isa;
  if (v9)
  {
    v15 = *((id *)v9 + 11);
    v16 = -[NWURLSessionTaskConfiguration initWithConfiguration:task:request:](p_isa, v15, a1, v8);
    v17 = a1[50];
    a1[50] = v16;

    v18 = (void *)*((_QWORD *)v9 + 15);
  }
  else
  {
    v44 = -[NWURLSessionTaskConfiguration initWithConfiguration:task:request:]((id *)&v13->super.isa, 0, a1, v8);
    v45 = a1[50];
    a1[50] = v44;

    v18 = 0;
  }
  objc_storeStrong(a1 + 28, v18);
  if (v9)
    v19 = (void *)*((_QWORD *)v9 + 17);
  else
    v19 = 0;
  objc_storeStrong(a1 + 38, v19);
  *((_DWORD *)a1 + 6) = *MEMORY[0x1E0C92BC8];
  *((_BYTE *)a1 + 8) = 1;
  if (v8)
  {
    v20 = [NWURLSessionDelegateWrapper alloc];
    if (v9)
      v21 = (void *)*((_QWORD *)v9 + 16);
    else
      v21 = 0;
    v22 = v21;
    v23 = -[NWURLSessionDelegateWrapper initWithFallbackDelegateWrapper:]((id *)&v20->super.isa, v22);
    v24 = a1[29];
    a1[29] = v23;

    if (nw_protocol_copy_http_client_definition_onceToken != -1)
      dispatch_once(&nw_protocol_copy_http_client_definition_onceToken, &__block_literal_global_52_74156);
    singleton = nw_protocol_metadata_create_singleton((void *)nw_protocol_copy_http_client_definition_definition);
    v26 = a1[31];
    a1[31] = singleton;

    nw_http_client_metadata_create_next_transaction(a1[31], 0);
    objc_msgSend(v8, "URL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      objc_msgSend(v27, "scheme");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "length") - 2;
      if (v30 >= 4)
      {

      }
      else
      {
        v31 = objc_msgSend(v29, "caseInsensitiveCompare:", off_1E149C2F8[v30]);

        if (v31)
          goto LABEL_20;
        v28 = (void *)_nw_http_request_create_from_url_request(v8);
        nw_http_client_metadata_set_initial_request(a1[31], v28);
        objc_initWeak(&location.receiver, a1);
        v32 = a1[31];
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __55__NWURLSessionTask_initWithRequest_identifier_session___block_invoke;
        v46[3] = &unk_1E14A49C0;
        objc_copyWeak(&v47, &location.receiver);
        nw_http_client_metadata_set_prevent_timeout_callback(v32, v46);
        objc_destroyWeak(&v47);
        objc_destroyWeak(&location.receiver);
      }
    }

LABEL_20:
    v33 = [NWURLSessionTaskMetrics alloc];
    v34 = a1[31];
    v35 = v34;
    if (v33)
    {
      location.receiver = v33;
      location.super_class = (Class)NWURLSessionTaskMetrics;
      v36 = (NWURLSessionTaskMetrics *)objc_msgSendSuper2(&location, sel_init);
      v33 = v36;
      if (v36)
        objc_storeStrong((id *)&v36->_clientMetadata, v34);
    }

    v37 = a1[54];
    a1[54] = v33;

  }
  if (ne_tracker_should_save_stacktrace())
  {
    if (v9)
      v38 = *((id *)v9 + 11);
    else
      v38 = 0;
    v39 = objc_msgSend(v38, "_skipsStackTraceCapture");

    if ((v39 & 1) == 0)
    {
      location.receiver = 0;
      v40 = ne_tracker_copy_current_stacktrace();
      if (v40)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v40, location.receiver);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = a1[46];
        a1[46] = (id)v41;

      }
    }
  }
  *((_BYTE *)a1 + 13) = 1;
  a1[35] = 0;
LABEL_31:

  return a1;
}

void __55__NWURLSessionTask_initWithRequest_identifier_session___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  uint64_t v3;
  dispatch_time_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *((double *)WeakRetained + 40);
    if (v2 > 0.0)
    {
      v3 = *((_QWORD *)WeakRetained + 41);
      v5 = WeakRetained;
      if (!v3)
      {
        *((_QWORD *)WeakRetained + 41) = -[NWURLSessionTask createTimerWithTimeout:]((uint64_t)WeakRetained, v2);
        goto LABEL_10;
      }
      v4 = dispatch_time(0x8000000000000000, (uint64_t)(v2 * 1000000000.0));
      if (*(_QWORD *)v3)
      {
        dispatch_source_set_timer(*(dispatch_source_t *)v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
LABEL_10:
        WeakRetained = v5;
        goto LABEL_11;
      }
      *(_QWORD *)(v3 + 32) = v4;
      *(_QWORD *)(v3 + 40) = -1;
      WeakRetained = v5;
      if (*(_BYTE *)(v3 + 48) && *(_BYTE *)(v3 + 49))
      {
        nw_queue_source_run_timer(v3, v4);
        goto LABEL_10;
      }
    }
  }
LABEL_11:

}

void __36__NWURLSessionTask_readResponseBody__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t count;
  void *v16;
  id v17;
  id v18;
  _QWORD *v19;
  const char *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  double v29;
  uint64_t v30;
  dispatch_time_t v31;
  _QWORD *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  BOOL v42;
  char v43;
  _QWORD v44[5];
  id v45;
  BOOL v46;
  char v47;
  _QWORD v48[4];
  id v49;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    v10 = *(void **)(v9 + 256);
    v11 = (id *)(a1 + 40);
    if (v10 == *(void **)(a1 + 40) && *(_QWORD *)(v9 + 280) != 2)
    {
      if (!a3)
        goto LABEL_15;
LABEL_5:
      objc_msgSend(v10, "trailerFields");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = objc_alloc(MEMORY[0x1E0C99E08]);
        v14 = v12;
        count = _nw_http_fields_get_count();

        v16 = (void *)objc_msgSend(v13, "initWithCapacity:", count);
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_2;
        v48[3] = &unk_1E14A2DC0;
        v17 = v16;
        v49 = v17;
        v18 = v14;
        v19 = v48;
        _nw_http_fields_enumerate((uint64_t)v18, v19);

        v21 = (void *)objc_msgSend(v17, "copy");
        v22 = *(void **)(a1 + 32);
        if (v22)
          objc_setProperty_atomic(v22, v20, v21, 216);

      }
      if ((objc_msgSend(*v11, "requestComplete") & 1) != 0)
      {
        v23 = 1;
        v24 = *(_QWORD *)(a1 + 32);
        if (!v8)
          goto LABEL_11;
        goto LABEL_16;
      }
LABEL_15:
      v23 = v8 != 0;
      v24 = *(_QWORD *)(a1 + 32);
      if (!v8)
      {
LABEL_11:
        v25 = 0;
        if (!v24)
        {
LABEL_36:
          v32 = 0;
          goto LABEL_37;
        }
LABEL_21:
        v29 = *(double *)(v24 + 320);
        if (v29 > 0.0)
        {
          v30 = *(_QWORD *)(v24 + 328);
          if (v30)
          {
            v31 = dispatch_time(0x8000000000000000, (uint64_t)(v29 * 1000000000.0));
            if (*(_QWORD *)v30)
            {
              dispatch_source_set_timer(*(dispatch_source_t *)v30, v31, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
            }
            else
            {
              *(_QWORD *)(v30 + 32) = v31;
              *(_QWORD *)(v30 + 40) = -1;
              if (*(_BYTE *)(v30 + 48) && *(_BYTE *)(v30 + 49))
                nw_queue_source_run_timer(v30, v31);
            }
          }
          else
          {
            *(_QWORD *)(v24 + 328) = -[NWURLSessionTask createTimerWithTimeout:](v24, v29);
          }
        }
        v32 = *(_QWORD **)(a1 + 32);
        if (v32)
        {
          v33 = (void *)v32[33];
          if (v33)
          {
            v34 = v33;
            objc_msgSend(v32, "error");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v44[0] = MEMORY[0x1E0C809B0];
            v44[1] = 3221225472;
            v44[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_3;
            v44[3] = &unk_1E14A2DE8;
            v36 = *(void **)(a1 + 40);
            v44[4] = *(_QWORD *)(a1 + 32);
            v46 = v23;
            v47 = a3;
            v37 = &v45;
            v45 = v36;
            -[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]((uint64_t)v34, v32, v7, v23, v35, v44);
LABEL_31:

            v8 = v25;
            goto LABEL_32;
          }
          v38 = (void *)v32[52];
LABEL_30:
          v34 = v38;
          objc_msgSend(v32, "error");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_6;
          v40[3] = &unk_1E14A2DE8;
          v39 = *(void **)(a1 + 40);
          v40[4] = *(_QWORD *)(a1 + 32);
          v42 = v23;
          v43 = a3;
          v37 = &v41;
          v41 = v39;
          objc_msgSend(v34, "task:deliverData:complete:error:completionHandler:", v32, v7, v23, v35, v40);
          goto LABEL_31;
        }
LABEL_37:
        v38 = 0;
        goto LABEL_30;
      }
LABEL_16:
      objc_msgSend((id)v24, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = *(_QWORD *)(a1 + 32);
      if (v26)
      {
        v25 = v8;
        if (!v24)
          goto LABEL_36;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "errorWithResumeData:", v8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = *(void **)(a1 + 32);
        if (!v28)
          goto LABEL_36;
        objc_setProperty_atomic_copy(v28, v27, v25, 136);
        v24 = *(_QWORD *)(a1 + 32);
        if (!v24)
          goto LABEL_36;
      }
      goto LABEL_21;
    }
  }
  else
  {
    v11 = (id *)(a1 + 40);
    if (!*(_QWORD *)(a1 + 40))
    {
      v10 = 0;
      if (!a3)
        goto LABEL_15;
      goto LABEL_5;
    }
  }
LABEL_32:

}

uint64_t __36__NWURLSessionTask_readResponseBody__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %s"), v7, a4);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);

  return 1;
}

void __36__NWURLSessionTask_readResponseBody__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  const char *v7;
  _QWORD v8[5];

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (!v4 || v4[35] != 2)
  {
    if (v3)
    {
      objc_msgSend(v4, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = *(_QWORD **)(a1 + 32);
      if (!v6 && v4)
      {
        objc_setProperty_atomic_copy(v4, v7, v3, 136);
        v4 = *(_QWORD **)(a1 + 32);
      }
      if (!*(_BYTE *)(a1 + 48))
      {
        objc_msgSend(v4, "completeTaskWithError:", v3);
        goto LABEL_9;
      }
      goto LABEL_5;
    }
    if (*(_BYTE *)(a1 + 48))
    {
LABEL_5:
      -[NWURLSessionTask complete]((uint64_t)v4);
      goto LABEL_9;
    }
    if (*(_BYTE *)(a1 + 49))
    {
      v5 = *(void **)(a1 + 40);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_4;
      v8[3] = &unk_1E14ACFD0;
      v8[4] = v4;
      objc_msgSend(v5, "notifyRequestCompletion:", v8);
    }
    else
    {
      -[NWURLSessionTask readResponseBody]();
    }
  }
LABEL_9:

}

void __36__NWURLSessionTask_readResponseBody__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  const char *v7;
  _QWORD v8[5];

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (!v4 || v4[35] != 2)
  {
    if (v3)
    {
      objc_msgSend(v4, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = *(_QWORD **)(a1 + 32);
      if (!v6 && v4)
      {
        objc_setProperty_atomic_copy(v4, v7, v3, 136);
        v4 = *(_QWORD **)(a1 + 32);
      }
      if (!*(_BYTE *)(a1 + 48))
      {
        objc_msgSend(v4, "completeTaskWithError:", v3);
        goto LABEL_9;
      }
      goto LABEL_5;
    }
    if (*(_BYTE *)(a1 + 48))
    {
LABEL_5:
      -[NWURLSessionTask complete]((uint64_t)v4);
      goto LABEL_9;
    }
    if (*(_BYTE *)(a1 + 49))
    {
      v5 = *(void **)(a1 + 40);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_7;
      v8[3] = &unk_1E14ACFD0;
      v8[4] = v4;
      objc_msgSend(v5, "notifyRequestCompletion:", v8);
    }
    else
    {
      -[NWURLSessionTask readResponseBody]();
    }
  }
LABEL_9:

}

uint64_t __36__NWURLSessionTask_readResponseBody__block_invoke_7(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 280) == 2)
      return result;
    v2 = *(void **)(v1 + 416);
  }
  else
  {
    v2 = 0;
  }
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __36__NWURLSessionTask_readResponseBody__block_invoke_8;
  v6 = &unk_1E14A3330;
  v7 = v1;
  return objc_msgSend(v2, "task:deliverData:complete:error:completionHandler:");
}

void __36__NWURLSessionTask_readResponseBody__block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  const char *v4;
  void *v5;
  id newValue;

  newValue = a2;
  if (newValue)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v5 = *(void **)(a1 + 32);
      if (v5)
        objc_setProperty_atomic_copy(v5, v4, newValue, 136);
    }
  }
  -[NWURLSessionTask complete](*(_QWORD *)(a1 + 32));

}

void __36__NWURLSessionTask_readResponseBody__block_invoke_4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD v3[5];

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
  {
    if (v1[35] == 2)
      return;
    v2 = v1[33];
  }
  else
  {
    v2 = 0;
  }
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__NWURLSessionTask_readResponseBody__block_invoke_5;
  v3[3] = &unk_1E14A3330;
  v3[4] = v1;
  -[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:](v2, v1, 0, 1, 0, v3);
}

void __36__NWURLSessionTask_readResponseBody__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  const char *v4;
  void *v5;
  id newValue;

  newValue = a2;
  if (newValue)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v5 = *(void **)(a1 + 32);
      if (v5)
        objc_setProperty_atomic_copy(v5, v4, newValue, 136);
    }
  }
  -[NWURLSessionTask complete](*(_QWORD *)(a1 + 32));

}

void __26__NWURLSessionTask_cancel__block_invoke(uint64_t a1)
{
  id *v1;
  NWURLError *v2;
  id v3;
  id *v4;
  uint64_t v5;
  id v6;
  id v7;
  objc_super v8;

  v1 = *(id **)(a1 + 32);
  if (v1)
  {
    v2 = [NWURLError alloc];
    v3 = v1[32];
    v4 = v1;
    if (v2
      && (v5 = *MEMORY[0x1E0CB32E8],
          v8.receiver = v2,
          v8.super_class = (Class)NWURLError,
          (v6 = objc_msgSendSuper2(&v8, sel_initWithDomain_code_userInfo_, v5, -999, 0)) != 0))
    {
      v7 = v6;
      objc_msgSend(v6, "fillErrorForLoader:andTask:", v3, v4);
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(v1, "completeTaskWithError:", v7);
  }
  else
  {
    v7 = 0;
    objc_msgSend(0, "completeTaskWithError:", 0);
  }

}

uint64_t __27__NWURLSessionTask_suspend__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    *(_BYTE *)(v1 + 13) = 1;
  return result;
}

void __26__NWURLSessionTask_resume__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  const char *v5;
  void *v6;
  _QWORD *v7;
  os_unfair_lock_s *v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (!v1 || (*(_BYTE *)(v1 + 13) & 1) == 0)
    return;
  *(_BYTE *)(v1 + 13) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
  {
    v7 = 0;
LABEL_13:
    v8 = (os_unfair_lock_s *)(id)v3;
    -[NWURLSession taskStarted:](v8, v7);
    objc_msgSend(*(id *)(a1 + 32), "startNextLoad:", 1);
LABEL_14:

    return;
  }
  if (!*(_QWORD *)(v3 + 280))
  {
    *(_QWORD *)(v3 + 280) = 1;
    v7 = *(_QWORD **)(a1 + 32);
    if (v7)
      v3 = v7[49];
    else
      v3 = 0;
    goto LABEL_13;
  }
  if (!*(_BYTE *)(v3 + 14)
    || (*(_BYTE *)(v3 + 14) = 0,
        -[NWURLSessionTask readResponseBody](*(_QWORD *)(a1 + 32)),
        (v3 = *(_QWORD *)(a1 + 32)) != 0))
  {
    v4 = (os_unfair_lock_s *)*(id *)(v3 + 288);
    if (v4)
    {
      v8 = v4;
      v6 = *(void **)(a1 + 32);
      if (v6)
        objc_setProperty_nonatomic_copy(v6, v5, 0, 288);
      (*(void (**)(void))&v8[4]._os_unfair_lock_opaque)();
      goto LABEL_14;
    }
  }
}

- (void)setCountOfBytesExpectedToReceive:(void *)result
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (result)
  {
    v3 = result;
    objc_msgSend(result, "willChangeValueForKey:", CFSTR("countOfBytesExpectedToReceive"));
    *((_QWORD *)v3 + 15) = a2;
    result = (void *)objc_msgSend(v3, "didChangeValueForKey:", CFSTR("countOfBytesExpectedToReceive"));
    if (*((_QWORD *)v3 + 8))
    {
      if (!*((_BYTE *)v3 + 15))
      {
        v4 = *((id *)v3 + 44);
        objc_msgSend(*((id *)v3 + 44), "setCompletedUnitCount:", objc_msgSend(v4, "totalUnitCount"));

        v5 = *MEMORY[0x1E0CB30B8];
        objc_msgSend(v3, "progress");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setFileOperationKind:", v5);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "countOfBytesReceived"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "progress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setByteCompletedCount:", v7);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "progress");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setByteTotalCount:", v9);

        if (a2 >= 1)
          v11 = a2;
        else
          v11 = 100;
        *((_BYTE *)v3 + 17) = a2 < 1;
        return (void *)objc_msgSend(*((id *)v3 + 45), "setTotalUnitCount:", v11);
      }
    }
  }
  return result;
}

- (void)setCountOfBytesReceived:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a1)
  {
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("countOfBytesReceived"));
    *(_QWORD *)(a1 + 104) = a2;
    objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("countOfBytesReceived"));
    if (*(_QWORD *)(a1 + 64))
    {
      if (!*(_BYTE *)(a1 + 15))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "progress");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setByteCompletedCount:", v4);

        v6 = *(void **)(a1 + 360);
        if (*(_BYTE *)(a1 + 17))
        {
          v7 = v6;
          v8 = objc_msgSend(v7, "completedUnitCount");
          v9 = objc_msgSend(*(id *)(a1 + 360), "totalUnitCount") - 1;

          if (v8 < v9)
          {
            v10 = *(id *)(a1 + 360);
            objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);

          }
        }
        else
        {
          objc_msgSend(v6, "setCompletedUnitCount:", a2);
        }
      }
    }
  }
}

@end
