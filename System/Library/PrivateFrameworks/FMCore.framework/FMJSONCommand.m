@implementation FMJSONCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->__requestBodyDict, 0);
  objc_storeStrong((id *)&self->__responseBodyDict, 0);
  objc_storeStrong((id *)&self->_jsonResponseParseError, 0);
}

- (void)sendRequest
{
  objc_super v3;

  -[FMJSONCommand set_hasParsedResponseBody:](self, "set_hasParsedResponseBody:", 0);
  -[FMJSONCommand set_responseBodyDict:](self, "set_responseBodyDict:", 0);
  -[FMJSONCommand setJsonResponseParseError:](self, "setJsonResponseParseError:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FMJSONCommand;
  -[FMCommandBase sendRequest](&v3, sel_sendRequest);
}

- (FMJSONCommand)init
{
  FMJSONCommand *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMJSONCommand;
  v2 = -[FMCommandBase init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.icloud.fmcore.FMJSONCommand.response", 0);
    -[FMJSONCommand setResponseQueue:](v2, "setResponseQueue:", v3);

  }
  return v2;
}

- (id)headers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMJSONCommand;
  -[FMCommandBase headers](&v9, sel_headers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMJSONCommand _requestBodyDict](self, "_requestBodyDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[FMJSONCommand set_requestBodyDict:](self, "set_requestBodyDict:", v4);
  }
  else
  {
    -[FMJSONCommand jsonBodyDictionary](self, "jsonBodyDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMJSONCommand set_requestBodyDict:](self, "set_requestBodyDict:", v5);

  }
  -[FMJSONCommand _requestBodyDict](self, "_requestBodyDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("application/json; charset=utf-8"), CFSTR("Content-Type"));
  return v3;
}

- (NSDictionary)_requestBodyDict
{
  return self->__requestBodyDict;
}

- (NSDictionary)jsonResponseDictionary
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = (id)MEMORY[0x1E0C9AA70];
  -[FMJSONCommand responseQueue](self, "responseQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__FMJSONCommand_jsonResponseDictionary__block_invoke;
  v6[3] = &unk_1E82AA888;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (id)body
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  FMJSONCommand *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMJSONCommand _requestBodyDict](self, "_requestBodyDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[FMJSONCommand jsonBodyDictionary](self, "jsonBodyDictionary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  LogCategory_NetworkingVerbose();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v15 = self;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1C9967000, v8, OS_LOG_TYPE_INFO, "[%p] request_body: %@", buf, 0x16u);
  }

  if (objc_msgSend(v7, "count"))
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, &v13);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v13;

    if (v10)
    {
      LogCategory_Networking();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[FMJSONCommand body].cold.1((uint64_t)self, (uint64_t)v10, v11);

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("[%@] JSON Creation error: %@"), self, v10);
    }

    v3 = (void *)v9;
  }

  return v3;
}

void __39__FMJSONCommand_jsonResponseDictionary__block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "_hasParsedResponseBody");
  v4 = *v2;
  if (v3)
  {
    objc_msgSend(v4, "_responseBodyDict");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    return;
  }
  objc_msgSend(v4, "valueForResponseHTTPHeader:", CFSTR("Content-Type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "responseData");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
    goto LABEL_13;
  objc_msgSend(v8, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("json"));

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(*(id *)(a1 + 32), "responseData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v12, "JSONObjectWithData:options:error:", v13, 0, &v26);
    v14 = objc_claimAutoreleasedReturnValue();
    v9 = v26;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    LogCategory_NetworkingVerbose();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(void **)(a1 + 32);
      v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 134218242;
      v28 = v18;
      v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_1C9967000, v17, OS_LOG_TYPE_INFO, "[%p] response_body: %@", buf, 0x16u);
    }

    if (v9)
    {
      objc_msgSend(*v2, "setJsonResponseParseError:", v9);
      LogCategory_ServerError();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __39__FMJSONCommand_jsonResponseDictionary__block_invoke_cold_1(v2, (uint64_t)v9, v20);

      LogCategory_ServerError();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = *v2;
        v23 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(*v2, "responseData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v23, "initWithData:encoding:", v24, 4);
        *(_DWORD *)buf = 134218242;
        v28 = v22;
        v29 = 2112;
        v30 = v25;
        _os_log_impl(&dword_1C9967000, v21, OS_LOG_TYPE_INFO, "[%p] Actual JSON that failed to parse: %@", buf, 0x16u);

      }
    }
LABEL_13:

  }
  objc_msgSend(*(id *)(a1 + 32), "set_hasParsedResponseBody:", 1);
  objc_msgSend(*(id *)(a1 + 32), "set_responseBodyDict:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (BOOL)_hasParsedResponseBody
{
  return self->__hasParsedResponseBody;
}

- (void)set_responseBodyDict:(id)a3
{
  objc_storeStrong((id *)&self->__responseBodyDict, a3);
}

- (void)set_requestBodyDict:(id)a3
{
  objc_storeStrong((id *)&self->__requestBodyDict, a3);
}

- (void)set_hasParsedResponseBody:(BOOL)a3
{
  self->__hasParsedResponseBody = a3;
}

- (void)setResponseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_responseQueue, a3);
}

- (void)setJsonResponseParseError:(id)a3
{
  objc_storeStrong((id *)&self->_jsonResponseParseError, a3);
}

- (id)jsonBodyDictionary
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
}

- (NSDictionary)_responseBodyDict
{
  return self->__responseBodyDict;
}

- (NSDictionary)serverAlertInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[FMJSONCommand jsonResponseDictionary](self, "jsonResponseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("alert"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fm_nullToNil");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSError)jsonResponseParseError
{
  return self->_jsonResponseParseError;
}

- (void)body
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_3(&dword_1C9967000, a2, a3, "[%@] JSON Creation error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void __39__FMJSONCommand_jsonResponseDictionary__block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_3(&dword_1C9967000, a2, a3, "[%p] JSON parse error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
