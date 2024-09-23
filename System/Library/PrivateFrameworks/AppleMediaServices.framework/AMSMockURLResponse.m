@implementation AMSMockURLResponse

- (AMSMockURLResponse)init
{
  AMSMockURLResponse *v2;
  NSMutableArray *v3;
  NSMutableArray *responseHandlerBlocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSMockURLResponse;
  v2 = -[AMSMockURLResponse init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    responseHandlerBlocks = v2->_responseHandlerBlocks;
    v2->_responseHandlerBlocks = v3;

  }
  return v2;
}

+ (id)responseFromActualResponse
{
  AMSMockURLResponse *v2;

  v2 = objc_alloc_init(AMSMockURLResponse);
  -[AMSMockURLResponse setPerformActualRequest:](v2, "setPerformActualRequest:", 1);
  return v2;
}

+ (AMSMockURLResponse)responseWithError:(id)a3
{
  id v3;
  AMSMockURLResponse *v4;

  v3 = a3;
  v4 = objc_alloc_init(AMSMockURLResponse);
  -[AMSMockURLResponse setError:](v4, "setError:", v3);

  return v4;
}

+ (AMSMockURLResponse)responseWithStatus:(unint64_t)a3 headers:(id)a4 body:(id)a5
{
  id v7;
  id v8;
  AMSMockURLResponse *v9;

  v7 = a5;
  v8 = a4;
  v9 = objc_alloc_init(AMSMockURLResponse);
  -[AMSMockURLResponse setStatusCode:](v9, "setStatusCode:", a3);
  -[AMSMockURLResponse setHeaders:](v9, "setHeaders:", v8);

  -[AMSMockURLResponse setBody:](v9, "setBody:", v7);
  return v9;
}

+ (AMSMockURLResponse)responseWithHARFile:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  AMSMockURLResponse *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  AMSMockURLResponse *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  const __CFString *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  int v47;
  void *v48;
  void *v50;
  void *v51;
  id v52;
  id v53;
  AMSMockURLResponse *v54;
  uint64_t v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("log"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("entries"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("response"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_14;
  }
  v9 = v8;

  if (!v9)
  {
LABEL_14:
    v14 = 0;
    v15 = 0;
    goto LABEL_48;
  }
  v10 = objc_alloc_init(AMSMockURLResponse);
  -[AMSMockURLResponse setStatusCode:](v10, "setStatusCode:", 500);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AMSMockURLResponse setStatusCode:](v10, "setStatusCode:", objc_msgSend(v11, "integerValue"));
  v54 = v10;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("headers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v52 = v7;
  v53 = v5;
  v50 = v11;
  v51 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  v16 = (void *)objc_opt_new();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v13;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  v18 = 0x1E0CB3000uLL;
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v58;
    v21 = CFSTR("name");
    v22 = CFSTR("value");
    do
    {
      v23 = 0;
      v55 = v19;
      do
      {
        if (*(_QWORD *)v58 != v20)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v23);
        objc_msgSend(v24, "objectForKeyedSubscript:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v25;
        else
          v26 = 0;

        objc_msgSend(v26, "lowercaseString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "objectForKeyedSubscript:", v22);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v28;
        if (v27 && v28)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", v27);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "stringByAppendingFormat:", CFSTR(", %@"), v29, v50);
            v32 = v20;
            v33 = v22;
            v34 = v21;
            v35 = v18;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v36, v27);

            v18 = v35;
            v21 = v34;
            v22 = v33;
            v20 = v32;
            v19 = v55;

          }
          else
          {
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v29, v27);
          }
        }

        ++v23;
      }
      while (v19 != v23);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v19);
  }

  if (v16)
    -[AMSMockURLResponse setHeaders:](v54, "setHeaders:", v16);
  v14 = v51;
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("content"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v38 = v37;
  else
    v38 = 0;

  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("text"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v53;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v40 = v39;
  else
    v40 = 0;

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v40, 0);
  if (v41)
  {
    v42 = objc_msgSend(objc_alloc(*(Class *)(v18 + 2368)), "initWithData:encoding:", v41, 4);

    v40 = (id)v42;
  }
  if (v40)
  {
    objc_msgSend(v40, "dataUsingEncoding:", 4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }
  -[AMSMockURLResponse setBody:](v54, "setBody:", v43);
  objc_msgSend(v16, "ams_objectForCaseInsensitiveKey:", CFSTR("content-encoding"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMockURLResponse body](v54, "body");
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;
    v47 = objc_msgSend(v44, "containsString:", CFSTR("gzip"));

    if (v47)
    {
      +[AMSData compressedGzippedDataWithData:](AMSData, "compressedGzippedDataWithData:", v43);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMockURLResponse setBody:](v54, "setBody:", v48);

    }
  }

  v7 = v52;
  v15 = v54;
LABEL_48:

  return v15;
}

- ($EE648C3457B938FDC2AD0F1796E4A2FD)handleReceivedRequest:(SEL)a3
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  AMSMockURLResponse *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  $EE648C3457B938FDC2AD0F1796E4A2FD *result;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  NSObject *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  id *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[AMSMockURLResponse error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    retstr->var2 = 0;
    retstr->var0 = 0;
    retstr->var1 = 0;
    -[AMSMockURLResponse error](self, "error");
    retstr->var2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = 0;
    v62 = (id *)&v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__50;
    v65 = __Block_byref_object_dispose__50;
    v66 = 0;
    v55 = 0;
    v56 = (id *)&v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__50;
    v59 = __Block_byref_object_dispose__50;
    v60 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__50;
    v53 = __Block_byref_object_dispose__50;
    v54 = 0;
    if (-[AMSMockURLResponse performActualRequest](self, "performActualRequest"))
    {
      objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = dispatch_semaphore_create(0);
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __44__AMSMockURLResponse_handleReceivedRequest___block_invoke;
      v44[3] = &unk_1E2544178;
      v46 = &v61;
      v47 = &v55;
      v48 = &v49;
      v11 = v10;
      v45 = v11;
      objc_msgSend(v9, "dataTaskWithRequest:completionHandler:", v6, v44);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMockURLResponse setRunningTask:](self, "setRunningTask:", v12);

      -[AMSMockURLResponse runningTask](self, "runningTask");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resume");

      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(v9, "finishTasksAndInvalidate");
      v14 = -[AMSMockURLResponse statusCode](self, "statusCode");
      v15 = self;
      if (!v14)
        v15 = (AMSMockURLResponse *)v62[5];
      v16 = -[AMSMockURLResponse statusCode](v15, "statusCode");
      -[AMSMockURLResponse headers](self, "headers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;
      }
      else
      {
        objc_msgSend(v62[5], "allHeaderFields");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      v27 = v19;

      -[AMSMockURLResponse body](self, "body");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (!v28)
        v29 = v56[5];
      objc_storeStrong(v56 + 5, v29);

      v30 = objc_alloc(MEMORY[0x1E0C92C18]);
      objc_msgSend(v62[5], "URL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "initWithURL:statusCode:HTTPVersion:headerFields:", v31, v16, CFSTR("1.1"), v27);
      v33 = v62[5];
      v62[5] = (id)v32;

    }
    else
    {
      v20 = objc_alloc(MEMORY[0x1E0C92C18]);
      objc_msgSend(v6, "URL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[AMSMockURLResponse statusCode](self, "statusCode");
      -[AMSMockURLResponse headers](self, "headers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v20, "initWithURL:statusCode:HTTPVersion:headerFields:", v21, v22, CFSTR("1.1"), v23);
      v25 = v62[5];
      v62[5] = (id)v24;

      -[AMSMockURLResponse body](self, "body");
      v26 = objc_claimAutoreleasedReturnValue();
      v8 = v56[5];
      v56[5] = (id)v26;
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[AMSMockURLResponse responseHandlerBlocks](self, "responseHandlerBlocks", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v67, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v41 != v36)
            objc_enumerationMutation(v34);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i) + 16))();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            objc_storeStrong(v62 + 5, v38);

        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v67, 16);
      }
      while (v35);
    }

    retstr->var0 = v56[5];
    retstr->var1 = v62[5];
    retstr->var2 = (id)v50[5];
    _Block_object_dispose(&v49, 8);

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v61, 8);

  }
  return result;
}

void __44__AMSMockURLResponse_handleReceivedRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v19 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v19;
  else
    v10 = 0;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v7;
  v15 = v7;

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v9;
  v18 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addResponseHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AMSMockURLResponse responseHandlerBlocks](self, "responseHandlerBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v6, "addObject:", v5);
}

- (void)stopRunningTasks
{
  id v2;

  -[AMSMockURLResponse runningTask](self, "runningTask");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unint64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(unint64_t)a3
{
  self->_statusCode = a3;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (BOOL)performActualRequest
{
  return self->_performActualRequest;
}

- (void)setPerformActualRequest:(BOOL)a3
{
  self->_performActualRequest = a3;
}

- (NSURLRequest)originalRequest
{
  return self->_originalRequest;
}

- (NSMutableArray)responseHandlerBlocks
{
  return self->_responseHandlerBlocks;
}

- (void)setResponseHandlerBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_responseHandlerBlocks, a3);
}

- (NSURLSessionTask)runningTask
{
  return self->_runningTask;
}

- (void)setRunningTask:(id)a3
{
  objc_storeStrong((id *)&self->_runningTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningTask, 0);
  objc_storeStrong((id *)&self->_responseHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
