@implementation GEOProtobufSession

- (id)taskWithRequest:(id)a3 requestTypeCode:(unsigned int)a4 responseClass:(Class)a5 delegate:(id)a6 delegateQueue:(id)a7
{
  id v11;
  id v12;
  id v13;
  GEOProtobufSessionTask *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  GEOProtobufSession *v18;
  id v19;
  id v20;
  id v21;
  GEOProtobufSession *v22;
  NSObject *v23;
  GEODataURLSession *dataSession;
  void *v25;
  id v29;
  objc_super v30;
  uint64_t v31;
  uint8_t buf[4];
  GEOProtobufSessionTask *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  v12 = a6;
  v13 = a3;
  v14 = [GEOProtobufSessionTask alloc];
  v15 = objc_msgSend(v13, "kind");
  objc_msgSend(v13, "auditToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "throttleToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v15;
  v18 = self;
  v19 = v12;
  v20 = v11;
  v29 = v16;
  v21 = v17;
  if (v14)
  {
    v30.receiver = v14;
    v30.super_class = (Class)GEOProtobufSessionTask;
    v22 = -[GEOProtobufSession init](&v30, sel_init);
    v14 = (GEOProtobufSessionTask *)v22;
    if (v22)
    {
      objc_storeWeak((id *)&v22[1]._dataSession, v18);
      objc_storeWeak((id *)&v14->_delegate, v19);
      v14->_responseClass = a5;
      objc_storeStrong((id *)&v14->_delegateQueue, a7);
      v14->_requestKind = ($7466BF22B2A7275A1F5DB80FF4552E0B)v15;
      v14->_requestTypeCode = a4;
      objc_storeStrong((id *)&v14->_auditToken, v16);
      objc_storeStrong((id *)&v14->_throttleToken, v17);
      GEOGetDataSessionProtobufLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v33 = v14;
        v34 = 2048;
        v35 = v19;
        v36 = 1040;
        v37 = 8;
        v38 = 2098;
        v39 = &v31;
        _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_DEBUG, "Protobuf task %@ init (delegate %p, kind %{public, geo:DataRequestKind}.*P)", buf, 0x26u);
      }

    }
  }

  if (v18)
    dataSession = v18->_dataSession;
  else
    dataSession = 0;
  -[GEODataURLSession taskWithRequest:delegate:delegateQueue:](dataSession, "taskWithRequest:delegate:delegateQueue:", v13, v14, v20, a5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_storeStrong((id *)&v14->_dataTask, v25);

  return v14;
}

+ (id)sharedProtobufSession
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__GEOProtobufSession_sharedProtobufSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_255 != -1)
    dispatch_once(&_MergedGlobals_255, block);
  return (id)qword_1ECDBC1F8;
}

+ (OS_dispatch_queue)sharedDelegateQueue
{
  if (qword_1ECDBC200 != -1)
    dispatch_once(&qword_1ECDBC200, &__block_literal_global_113);
  return (OS_dispatch_queue *)(id)qword_1ECDBC208;
}

void __43__GEOProtobufSession_sharedProtobufSession__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  +[GEODataURLSession sharedDataURLSession](GEODataURLSession, "sharedDataURLSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithDataURLSession:", v4);
  v3 = (void *)qword_1ECDBC1F8;
  qword_1ECDBC1F8 = v2;

}

- (GEOProtobufSession)init
{

  return 0;
}

void __41__GEOProtobufSession_sharedDelegateQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = geo_dispatch_queue_create();
  v1 = (void *)qword_1ECDBC208;
  qword_1ECDBC208 = v0;

}

- (GEOProtobufSession)initWithDataURLSession:(id)a3
{
  id v5;
  GEOProtobufSession *v6;
  GEOProtobufSession *v7;
  objc_super v9;

  v5 = a3;
  if (initWithDataURLSession__onceToken != -1)
    dispatch_once(&initWithDataURLSession__onceToken, &__block_literal_global_3_3);
  v9.receiver = self;
  v9.super_class = (Class)GEOProtobufSession;
  v6 = -[GEOProtobufSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSession, a3);

  return v7;
}

uint64_t __45__GEOProtobufSession_initWithDataURLSession___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "setUserInfoValueProviderForDomain:provider:", CFSTR("GEOProtobufSession"), &__block_literal_global_178);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSession, 0);
}

- (id)taskWithRequestKind:(id)a3 protobufRequest:(id)a4 URL:(id)a5 additionalHTTPHeaders:(id)a6 auditToken:(id)a7 traits:(id)a8 delegate:(id)a9 delegateQueue:(id)a10 requestCounterTicket:(id)a11 multipathServiceType:(unint64_t)a12 multipathAlternatePort:(unint64_t)a13 throttleToken:(id)a14 options:(unint64_t)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  GEODataRequest *v26;
  void *v27;
  id v29;
  void *context;
  id v31;
  id v32;

  v19 = a4;
  v32 = a5;
  v31 = a6;
  v29 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a14;
  context = (void *)MEMORY[0x18D764E2C]();
  v25 = v20;
  v26 = -[GEODataRequest initWithKind:protobufRequest:URL:additionalHTTPHeaders:auditToken:timeoutInterval:traits:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:]([GEODataRequest alloc], "initWithKind:protobufRequest:URL:additionalHTTPHeaders:auditToken:timeoutInterval:traits:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", a3, v19, v32, v31, v29, v20, GEODataRequestTimeout(*(_QWORD *)&a3), v23, a12, a13, v24, a15);
  -[GEOProtobufSession taskWithRequest:requestTypeCode:responseClass:delegate:delegateQueue:](self, "taskWithRequest:requestTypeCode:responseClass:delegate:delegateQueue:", v26, objc_msgSend(v19, "requestTypeCode"), objc_msgSend(v19, "responseClass"), v21, v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v27;
}

@end
