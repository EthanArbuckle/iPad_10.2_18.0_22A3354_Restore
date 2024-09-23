@implementation FCNetworkEvent

- (int)type
{
  return self->_type;
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (unint64_t)HTTPStatusCode
{
  return self->_HTTPStatusCode;
}

- (unint64_t)responseSize
{
  return self->_responseSize;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  +[FCDescription descriptionWithObject:](FCDescription, "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCStringFromNetworkEventType(-[FCNetworkEvent type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("type"), v4);

  -[FCNetworkEvent URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FCNetworkEvent URL](self, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addField:object:", CFSTR("URL"), v6);

  }
  -[FCNetworkEvent requestUUID](self, "requestUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("requestUUID"), v7);

  -[FCNetworkEvent operationID](self, "operationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("operationID"), v8);

  -[FCNetworkEvent containerName](self, "containerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[FCNetworkEvent containerName](self, "containerName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addField:value:", CFSTR("containerName"), v10);

  }
  -[FCNetworkEvent error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[FCNetworkEvent connectDuration](self, "connectDuration");
    v13 = v12;
    -[FCNetworkEvent totalDuration](self, "totalDuration");
    v15 = fmax(v14, 0.0) * 1000.0;
    v16 = (unint64_t)v15;
    if (v13 == 0.0)
    {
      objc_msgSend(v3, "addField:format:", CFSTR("timing"), CFSTR("total=%llums"), (unint64_t)v15, v32, v33, v34);
    }
    else
    {
      -[FCNetworkEvent dnsDuration](self, "dnsDuration");
      v18 = (unint64_t)(fmax(v17, 0.0) * 1000.0);
      -[FCNetworkEvent connectDuration](self, "connectDuration");
      v20 = (unint64_t)(fmax(v19, 0.0) * 1000.0);
      -[FCNetworkEvent requestDuration](self, "requestDuration");
      v22 = v21;
      -[FCNetworkEvent responseDuration](self, "responseDuration");
      objc_msgSend(v3, "addField:format:", CFSTR("timing"), CFSTR("total=%llums, dns=%llums, connect=%llums, remainder=%llums"), v16, v18, v20, (unint64_t)(fmax(v22 + v23, 0.0) * 1000.0));
    }
    if (-[FCNetworkEvent HTTPStatusCode](self, "HTTPStatusCode") != 200)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCNetworkEvent HTTPStatusCode](self, "HTTPStatusCode"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addField:object:", CFSTR("httpStatusCode"), v24);

    }
  }
  -[FCNetworkEvent HTTPResponseHeaders](self, "HTTPResponseHeaders");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("X-Apple-Cache"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    if (objc_msgSend(v26, "BOOLValue"))
      v27 = CFSTR("YES");
    else
      v27 = CFSTR("NO");
    objc_msgSend(v3, "addField:object:", CFSTR("cached"), v27);
  }
  -[FCNetworkEvent error](self, "error");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[FCNetworkEvent error](self, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addField:object:", CFSTR("error"), v29);

  }
  objc_msgSend(v3, "descriptionString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (NSURL)URL
{
  return self->_URL;
}

- (double)connectDuration
{
  return self->_connectDuration;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (NSDictionary)HTTPResponseHeaders
{
  return self->_HTTPResponseHeaders;
}

- (double)totalDuration
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[FCNetworkEvent dnsDuration](self, "dnsDuration");
  v4 = v3;
  -[FCNetworkEvent connectDuration](self, "connectDuration");
  v6 = v4 + v5;
  -[FCNetworkEvent requestDuration](self, "requestDuration");
  v8 = v6 + v7;
  -[FCNetworkEvent responseDuration](self, "responseDuration");
  return v8 + v9;
}

- (double)responseDuration
{
  return self->_responseDuration;
}

- (double)requestDuration
{
  return self->_requestDuration;
}

- (double)dnsDuration
{
  return self->_dnsDuration;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (FCNetworkEvent)initWithType:(int)a3 URLRequest:(id)a4 operationID:(id)a5 requestUUID:(id)a6 startTime:(double)a7 HTTPResponse:(id)a8 metrics:(id)a9 containerName:(id)a10 error:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  FCNetworkEvent *v53;

  v49 = a11;
  v48 = a10;
  v17 = a9;
  v18 = a8;
  v50 = a6;
  v19 = a5;
  v20 = a4;
  objc_msgSend(v20, "URL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "MIMEType");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v18, "statusCode");
  objc_msgSend(v20, "HTTPMethod");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "allHeaderFields");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(v17, "isProxyConnection");
  objc_msgSend(v17, "domainLookupEndDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "domainLookupStartDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "timeIntervalSinceDate:", v45);
  v22 = v21;
  objc_msgSend(v17, "connectEndDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "connectStartDate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "timeIntervalSinceDate:", v41);
  v24 = v23;
  objc_msgSend(v17, "responseStartDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "requestStartDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "timeIntervalSinceDate:", v25);
  v27 = v26;
  objc_msgSend(v17, "responseEndDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "responseStartDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "timeIntervalSinceDate:", v29);
  v31 = v30;
  v32 = objc_msgSend(v17, "countOfRequestHeaderBytesSent");
  v33 = (double)(objc_msgSend(v17, "countOfRequestBodyBytesSent") + v32);
  v34 = objc_msgSend(v17, "countOfResponseHeaderBytesReceived");
  v35 = objc_msgSend(v17, "countOfResponseBodyBytesReceived");

  LOBYTE(v37) = (_BYTE)a5;
  v53 = -[FCNetworkEvent initWithType:URL:operationID:requestUUID:responseMIMEType:HTTPStatusCode:HTTPMethod:HTTPResponseHeaders:containerName:isProxyConnection:error:startTime:dnsDuration:connectDuration:requestDuration:responseDuration:requestSize:responseSize:](self, "initWithType:URL:operationID:requestUUID:responseMIMEType:HTTPStatusCode:HTTPMethod:HTTPResponseHeaders:containerName:isProxyConnection:error:startTime:dnsDuration:connectDuration:requestDuration:responseDuration:requestSize:responseSize:", a3, v46, v19, v50, v44, v43, a7, v22, v24, v27, v31, v33, (double)(v35 + v34), v40, v38,
          v48,
          v37,
          v49);

  return v53;
}

- (FCNetworkEvent)initWithType:(int)a3 URL:(id)a4 operationID:(id)a5 requestUUID:(id)a6 responseMIMEType:(id)a7 HTTPStatusCode:(unint64_t)a8 HTTPMethod:(id)a9 HTTPResponseHeaders:(id)a10 containerName:(id)a11 isProxyConnection:(BOOL)a12 error:(id)a13 startTime:(double)a14 dnsDuration:(double)a15 connectDuration:(double)a16 requestDuration:(double)a17 responseDuration:(double)a18 requestSize:(double)a19 responseSize:(double)a20
{
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  FCNetworkEvent *v38;
  FCNetworkEvent *v39;
  uint64_t v40;
  NSURL *URL;
  uint64_t v42;
  NSString *operationID;
  uint64_t v44;
  NSString *requestUUID;
  uint64_t v46;
  NSString *responseMIMEType;
  uint64_t v48;
  NSString *HTTPMethod;
  uint64_t v50;
  NSDictionary *HTTPResponseHeaders;
  uint64_t v52;
  NSString *containerName;
  uint64_t v54;
  NSError *error;
  id v58;
  objc_super v59;

  v58 = a4;
  v31 = a5;
  v32 = a6;
  v33 = a7;
  v34 = a9;
  v35 = a10;
  v36 = a11;
  v37 = a13;
  v59.receiver = self;
  v59.super_class = (Class)FCNetworkEvent;
  v38 = -[FCNetworkEvent init](&v59, sel_init);
  v39 = v38;
  if (v38)
  {
    v38->_type = a3;
    v40 = objc_msgSend(v58, "copy");
    URL = v39->_URL;
    v39->_URL = (NSURL *)v40;

    v42 = objc_msgSend(v31, "copy");
    operationID = v39->_operationID;
    v39->_operationID = (NSString *)v42;

    v44 = objc_msgSend(v32, "copy");
    requestUUID = v39->_requestUUID;
    v39->_requestUUID = (NSString *)v44;

    v46 = objc_msgSend(v33, "copy");
    responseMIMEType = v39->_responseMIMEType;
    v39->_responseMIMEType = (NSString *)v46;

    v39->_HTTPStatusCode = a8;
    v48 = objc_msgSend(v34, "copy");
    HTTPMethod = v39->_HTTPMethod;
    v39->_HTTPMethod = (NSString *)v48;

    v50 = objc_msgSend(v35, "copy");
    HTTPResponseHeaders = v39->_HTTPResponseHeaders;
    v39->_HTTPResponseHeaders = (NSDictionary *)v50;

    v52 = objc_msgSend(v36, "copy");
    containerName = v39->_containerName;
    v39->_containerName = (NSString *)v52;

    v39->_isProxyConnection = a12;
    v54 = objc_msgSend(v37, "copy");
    error = v39->_error;
    v39->_error = (NSError *)v54;

    v39->_startTime = a14;
    v39->_connectDuration = a16;
    v39->_requestDuration = a17;
    v39->_responseDuration = a18;
    v39->_requestSize = (unint64_t)a19;
    v39->_responseSize = (unint64_t)a20;
  }

  return v39;
}

- (NSError)error
{
  return self->_error;
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)isProxyConnection
{
  return self->_isProxyConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_HTTPResponseHeaders, 0);
  objc_storeStrong((id *)&self->_HTTPMethod, 0);
  objc_storeStrong((id *)&self->_responseMIMEType, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (FCNetworkEvent)initWithType:(int)a3 rcNetworkEvent:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  FCNetworkEvent *v16;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;
  objc_msgSend(v6, "response");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[FCNetworkEvent initWithType:URLRequest:operationID:requestUUID:startTime:HTTPResponse:metrics:containerName:error:](self, "initWithType:URLRequest:operationID:requestUUID:startTime:HTTPResponse:metrics:containerName:error:", v4, v7, v8, v9, v13, v14, v12, 0, v15);
  return v16;
}

- (FCNetworkEvent)initWithType:(int)a3 ckRequestInfo:(id)a4 operationID:(id)a5 startTime:(double)a6 containerName:(id)a7 error:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  FCNetworkEvent *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  v12 = a4;
  v13 = a8;
  v14 = a7;
  v52 = a5;
  objc_msgSend(v12, "requestUUID");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "responseHTTPHeaders");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("Content-Type"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v13;
  if (v13)
  {
    objc_msgSend(v13, "userInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0C94880]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v38, "unsignedIntegerValue");
  }
  else
  {
    v47 = 200;
  }
  objc_msgSend(v12, "responseHTTPHeaders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "w3cNavigationTiming");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataDomainLookupEnd"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "doubleValue");
  v17 = v16;
  objc_msgSend(v12, "w3cNavigationTiming");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataDomainLookupStart"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "doubleValue");
  v19 = v17 - v18;
  objc_msgSend(v12, "w3cNavigationTiming");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectEnd"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "doubleValue");
  v21 = v20;
  objc_msgSend(v12, "w3cNavigationTiming");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataConnectStart"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "doubleValue");
  v23 = v21 - v22;
  objc_msgSend(v12, "w3cNavigationTiming");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataResponseStart"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "doubleValue");
  v25 = v24;
  objc_msgSend(v12, "w3cNavigationTiming");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataRequestStart"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  v28 = v25 - v27;
  objc_msgSend(v12, "w3cNavigationTiming");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataResponseEnd"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v32 = v31;
  objc_msgSend(v12, "w3cNavigationTiming");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("_kCFNTimingDataResponseStart"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "doubleValue");
  LOBYTE(v37) = 0;
  v55 = -[FCNetworkEvent initWithType:URL:operationID:requestUUID:responseMIMEType:HTTPStatusCode:HTTPMethod:HTTPResponseHeaders:containerName:isProxyConnection:error:startTime:dnsDuration:connectDuration:requestDuration:responseDuration:requestSize:responseSize:](self, "initWithType:URL:operationID:requestUUID:responseMIMEType:HTTPStatusCode:HTTPMethod:HTTPResponseHeaders:containerName:isProxyConnection:error:startTime:dnsDuration:connectDuration:requestDuration:responseDuration:requestSize:responseSize:", a3, 0, v52, v59, v58, v47, a6, v19, v23, v28, v32 - v35, 0.0, 0.0, CFSTR("POST"), v15,
          v14,
          v37,
          v56);

  if (v56)
  {

  }
  return v55;
}

- (NSDateInterval)dateInterval
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  v4 = (void *)MEMORY[0x1E0C99D68];
  -[FCNetworkEvent startTime](self, "startTime");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCNetworkEvent totalDuration](self, "totalDuration");
  v7 = (void *)objc_msgSend(v3, "initWithStartDate:duration:", v5, fmax(v6, 0.0));

  return (NSDateInterval *)v7;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  unint64_t v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  +[FCDescription descriptionWithObject:](FCDescription, "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCStringFromNetworkEventType(-[FCNetworkEvent type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("type"), v4);

  -[FCNetworkEvent URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FCNetworkEvent URL](self, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addField:object:", CFSTR("URL"), v6);

  }
  -[FCNetworkEvent HTTPMethod](self, "HTTPMethod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("httpMethod"), v7);

  -[FCNetworkEvent requestUUID](self, "requestUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("requestUUID"), v8);

  -[FCNetworkEvent operationID](self, "operationID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("operationID"), v9);

  -[FCNetworkEvent containerName](self, "containerName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FCNetworkEvent containerName](self, "containerName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addField:value:", CFSTR("containerName"), v11);

  }
  v12 = (void *)MEMORY[0x1E0C99D68];
  -[FCNetworkEvent startTime](self, "startTime");
  objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("startDate"), v13);

  -[FCNetworkEvent error](self, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[FCNetworkEvent connectDuration](self, "connectDuration");
    v16 = v15;
    -[FCNetworkEvent totalDuration](self, "totalDuration");
    v18 = fmax(v17, 0.0) * 1000.0;
    v19 = (unint64_t)v18;
    if (v16 == 0.0)
    {
      objc_msgSend(v3, "addField:format:", CFSTR("timing"), CFSTR("total=%llums"), (unint64_t)v18, v41, v42, v43);
    }
    else
    {
      -[FCNetworkEvent dnsDuration](self, "dnsDuration");
      v21 = (unint64_t)(fmax(v20, 0.0) * 1000.0);
      -[FCNetworkEvent connectDuration](self, "connectDuration");
      v23 = (unint64_t)(fmax(v22, 0.0) * 1000.0);
      -[FCNetworkEvent requestDuration](self, "requestDuration");
      v25 = v24;
      -[FCNetworkEvent responseDuration](self, "responseDuration");
      objc_msgSend(v3, "addField:format:", CFSTR("timing"), CFSTR("total=%llums, dns=%llums, connect=%llums, remainder=%llums"), v19, v21, v23, (unint64_t)(fmax(v25 + v26, 0.0) * 1000.0));
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCNetworkEvent HTTPStatusCode](self, "HTTPStatusCode"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("httpStatusCode"), v27);

  -[FCNetworkEvent HTTPResponseHeaders](self, "HTTPResponseHeaders");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("X-Apple-Cache"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    if (objc_msgSend(v29, "BOOLValue"))
      v30 = CFSTR("YES");
    else
      v30 = CFSTR("NO");
    objc_msgSend(v3, "addField:object:", CFSTR("cached"), v30);
  }
  -[FCNetworkEvent responseMIMEType](self, "responseMIMEType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[FCNetworkEvent responseMIMEType](self, "responseMIMEType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addField:object:", CFSTR("responseMIMEType"), v32);

  }
  if (-[FCNetworkEvent requestSize](self, "requestSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[FCNetworkEvent requestSize](self, "requestSize"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addField:object:", CFSTR("requestSize"), v33);

  }
  if (-[FCNetworkEvent responseSize](self, "responseSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[FCNetworkEvent responseSize](self, "responseSize"), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addField:object:", CFSTR("responseSize"), v34);

  }
  -[FCNetworkEvent error](self, "error");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[FCNetworkEvent error](self, "error");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addField:object:", CFSTR("error"), v36);

  }
  -[FCNetworkEvent HTTPResponseHeaders](self, "HTTPResponseHeaders");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[FCNetworkEvent HTTPResponseHeaders](self, "HTTPResponseHeaders");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addField:object:", CFSTR("httpResponseHeaders"), v38);

  }
  objc_msgSend(v3, "descriptionString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (NSString)responseMIMEType
{
  return self->_responseMIMEType;
}

- (NSString)HTTPMethod
{
  return self->_HTTPMethod;
}

- (unint64_t)requestSize
{
  return self->_requestSize;
}

@end
