@implementation NWURLSessionResponseConsumerDataDelegate

- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5
{
  _QWORD *v8;
  id v9;
  const char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  id v18;
  const char *v19;
  _QWORD *v20;
  void *v21;
  id v22;
  NWURLSessionDelegateDeallocBomb *v23;
  id v24;
  id v25;
  _QWORD *v26;
  id v27;
  NWURLSessionDelegateDeallocBomb *v28;
  id v29;
  id v30;
  _QWORD v31[2];
  uint64_t (*v32)(uint64_t);
  void *v33;
  id v34;
  objc_super v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  id v39;
  _QWORD *v40;
  id v41;
  NWURLSessionDelegateDeallocBomb *v42;
  id v43;
  _QWORD *v44;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  if (self)
    objc_setProperty_atomic(self, v10, v9, 8);
  v12 = countOfBytesExpectedToReceive(v9);
  -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v12);
  if (v8)
  {
    v13 = 30;
    if (!v8[30])
      v13 = 29;
    v14 = (id)v8[v13];
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v32 = __83__NWURLSessionResponseConsumerDataDelegate_task_deliverResponse_completionHandler___block_invoke;
  v33 = &unk_1E14A4780;
  v34 = v11;
  v16 = v11;
  v17 = v8;
  v18 = v9;
  v20 = v31;
  if (v14)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveResponse]((char *)v14, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v30 = *((id *)v14 + 4);
      v22 = *((id *)v14 + 5);
      v23 = [NWURLSessionDelegateDeallocBomb alloc];
      v24 = v21;
      if (v23)
      {
        v35.receiver = v23;
        v35.super_class = (Class)NWURLSessionDelegateDeallocBomb;
        v25 = -[NWURLSessionResponseConsumerDataDelegate init](&v35, sel_init);
        v23 = (NWURLSessionDelegateDeallocBomb *)v25;
        if (v25)
        {
          objc_storeStrong((id *)v25 + 2, v21);
          v23->__method = sel_dataTask_didReceiveResponse_completionHandler_;
          v15 = (void *)MEMORY[0x1E0C809B0];
        }
      }

      v35.receiver = v15;
      v35.super_class = (Class)3221225472;
      v36 = __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke;
      v37 = &unk_1E14AAB18;
      v38 = v24;
      v39 = v30;
      v40 = v17;
      v41 = v18;
      v42 = v23;
      v43 = v22;
      v44 = v20;
      v26 = (_QWORD *)*((_QWORD *)v14 + 6);
      v27 = v22;
      v28 = v23;
      v29 = v30;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v26, &v35);

    }
    else
    {
      ((void (*)(_QWORD *, uint64_t))v32)(v20, 1);
    }

  }
}

- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7
{
  char *v11;
  NSObject *v12;
  id v13;
  int64_t v14;
  uint64_t v15;
  id *v16;
  SEL v17;
  id v18;
  void *v19;
  id *v20;
  void *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD *v40;
  id v41;
  _QWORD *v42;
  const char *v43;
  void *v44;
  id Property;
  id v46;
  NSObject *v47;
  void *v48;
  id v49;
  id *v50;
  id v51;
  id v52;
  id v53;
  NSObject *v54;
  char *v55;
  _QWORD *v56;
  id v57;
  _BOOL4 v58;
  id v59;
  _QWORD v60[2];
  uint64_t (*v61)(uint64_t);
  void *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  char *v67;
  NSObject *v68;
  id v69;
  id v70;
  id *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  _QWORD *v79;
  BOOL v80;

  v58 = a5;
  v11 = (char *)a3;
  v12 = a4;
  v57 = a6;
  v13 = a7;
  if (v12)
  {
    if (self)
    {
      v14 = self->_countOfBytesReceivedInternal + dispatch_data_get_size(v12);
      self->_countOfBytesReceivedInternal = v14;
    }
    else
    {
      v14 = 0;
    }
    -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v11, v14);
    if (v11)
    {
      v15 = 240;
      if (!*((_QWORD *)v11 + 30))
        v15 = 232;
      v16 = (id *)*(id *)&v11[v15];
      v18 = objc_getProperty(v11, v17, 432, 1);
      objc_msgSend(*((id *)v11 + 32), "takeCachedResponse");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id *)*((id *)v11 + 50);
      if (v20)
      {
        v50 = v20;
        objc_msgSend(v20[2], "URLCache");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v50 = 0;
        v21 = 0;
      }
    }
    else
    {
      v50 = 0;
      v18 = 0;
      v16 = 0;
      v19 = 0;
      v21 = 0;
    }
    v22 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v61 = __94__NWURLSessionResponseConsumerDataDelegate_task_deliverData_complete_error_completionHandler___block_invoke;
    v62 = &unk_1E14AC390;
    v49 = v13;
    v63 = v13;
    v55 = v11;
    v54 = v12;
    v52 = v57;
    v23 = v18;
    v53 = v19;
    v51 = v21;
    v56 = v60;
    if (!v16)
      goto LABEL_23;
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveData_withCB](v16, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLSessionDelegateWrapper delegateFor_didReceiveData_withoutCB](v16, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLSessionDelegateWrapper delegateFor_willCacheResponse](v16, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    if (v23 && v58)
    {
      -[NWURLSessionDelegateWrapper delegateFor_didFinishCollectingMetrics](v16, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v58)
    {
      -[NWURLSessionDelegateWrapper delegateFor_didCompleteWithError](v16, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        goto LABEL_21;
    }
    else
    {
      v32 = 0;
      if (v25)
        goto LABEL_21;
    }
    if (!v27 && !v31 && !v32)
    {
      v61((uint64_t)v56);
LABEL_22:

LABEL_23:
      v13 = v49;
      goto LABEL_24;
    }
LABEL_21:
    v47 = v12;
    v33 = v16[4];
    v34 = v16[5];
    v35 = v22;
    v36 = v34;
    v64[0] = v35;
    v64[1] = 3221225472;
    v64[2] = __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke;
    v64[3] = &unk_1E14AACA8;
    v48 = v23;
    v37 = v27;
    v38 = v25;
    v65 = v25;
    v66 = v33;
    v67 = v55;
    v68 = v54;
    v69 = v36;
    v79 = v56;
    v39 = v37;
    v80 = v58;
    v70 = v39;
    v71 = v16;
    v72 = v53;
    v73 = v51;
    v74 = v30;
    v75 = v31;
    v76 = v48;
    v77 = v32;
    v78 = v52;
    v40 = v16[6];
    v59 = v36;
    v41 = v33;
    v42 = v40;
    v25 = v38;
    v27 = v37;
    v23 = v48;
    -[NWURLSessionDelegateQueue runDelegateBlock:](v42, v64);

    v12 = v47;
    goto LABEL_22;
  }
  if (v58)
  {
    -[NWURLSessionTask finishProgressReporting]((uint64_t)v11);
    -[NWURLSessionTask delegateWrapper](v11);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      Property = objc_getProperty(v11, v43, 432, 1);
    else
      Property = 0;
    v46 = Property;
    -[NWURLSessionDelegateWrapper task:didCompleteWithError:metrics:]((uint64_t)v44, v11, v57, v46);

  }
  (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
LABEL_24:

}

- (NSURLResponse)response
{
  if (self)
    self = (NWURLSessionResponseConsumerDataDelegate *)objc_getProperty(self, a2, 8, 1);
  return (NSURLResponse *)self;
}

- (int64_t)countOfBytesReceived
{
  if (self)
    return *(_QWORD *)(self + 16);
  return self;
}

- (id)createResumeInfo
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentResponse, 0);
}

uint64_t __94__NWURLSessionResponseConsumerDataDelegate_task_deliverData_complete_error_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__NWURLSessionResponseConsumerDataDelegate_task_deliverResponse_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
