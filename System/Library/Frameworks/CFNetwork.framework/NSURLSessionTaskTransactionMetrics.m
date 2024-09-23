@implementation NSURLSessionTaskTransactionMetrics

- (id)description
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  const char *v18;
  const char *v19;
  void *v20;
  int64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  void *v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSURLSessionTaskTransactionMetrics request](self, "request");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics response](self, "response");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics fetchStartDate](self, "fetchStartDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics domainLookupStartDate](self, "domainLookupStartDate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics domainLookupEndDate](self, "domainLookupEndDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics connectStartDate](self, "connectStartDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics secureConnectionStartDate](self, "secureConnectionStartDate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics secureConnectionEndDate](self, "secureConnectionEndDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics connectEndDate](self, "connectEndDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics requestStartDate](self, "requestStartDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics requestEndDate](self, "requestEndDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics responseStartDate](self, "responseStartDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics responseEndDate](self, "responseEndDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics networkProtocolName](self, "networkProtocolName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSURLSessionTaskTransactionMetrics isProxyConnection](self, "isProxyConnection"))
    v4 = "YES";
  else
    v4 = "NO";
  if (-[NSURLSessionTaskTransactionMetrics isReusedConnection](self, "isReusedConnection"))
    v5 = "YES";
  else
    v5 = "NO";
  if (-[NSURLSessionTaskTransactionMetrics resourceFetchType](self, "resourceFetchType") == NSURLSessionTaskMetricsResourceFetchTypeNetworkLoad)
  {
    v6 = "Network Load";
  }
  else if (-[NSURLSessionTaskTransactionMetrics resourceFetchType](self, "resourceFetchType") == NSURLSessionTaskMetricsResourceFetchTypeLocalCache)
  {
    v6 = "Local Cache";
  }
  else if (-[NSURLSessionTaskTransactionMetrics resourceFetchType](self, "resourceFetchType") == NSURLSessionTaskMetricsResourceFetchTypeServerPush)
  {
    v6 = "Server Push";
  }
  else
  {
    v6 = "Unknown";
  }
  v7 = -[NSURLSessionTaskTransactionMetrics countOfRequestHeaderBytesSent](self, "countOfRequestHeaderBytesSent");
  v8 = -[NSURLSessionTaskTransactionMetrics countOfRequestBodyBytesSent](self, "countOfRequestBodyBytesSent");
  v9 = -[NSURLSessionTaskTransactionMetrics countOfRequestBodyBytesBeforeEncoding](self, "countOfRequestBodyBytesBeforeEncoding");
  v29 = -[NSURLSessionTaskTransactionMetrics countOfResponseHeaderBytesReceived](self, "countOfResponseHeaderBytesReceived");
  v28 = -[NSURLSessionTaskTransactionMetrics countOfResponseBodyBytesReceived](self, "countOfResponseBodyBytesReceived");
  v27 = -[NSURLSessionTaskTransactionMetrics countOfResponseBodyBytesAfterDecoding](self, "countOfResponseBodyBytesAfterDecoding");
  -[NSURLSessionTaskTransactionMetrics localAddress](self, "localAddress");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics localPort](self, "localPort");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics remoteAddress](self, "remoteAddress");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics remotePort](self, "remotePort");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLSessionTaskTransactionMetrics negotiatedTLSProtocolVersion](self, "negotiatedTLSProtocolVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  v23 = v6;
  v24 = v5;
  v25 = v4;
  v26 = v3;
  v11 = objc_msgSend(v10, "unsignedShortValue");
  -[NSURLSessionTaskTransactionMetrics negotiatedTLSCipherSuite](self, "negotiatedTLSCipherSuite");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedShortValue");
  if (-[NSURLSessionTaskTransactionMetrics isCellular](self, "isCellular"))
    v14 = "YES";
  else
    v14 = "NO";
  if (-[NSURLSessionTaskTransactionMetrics isExpensive](self, "isExpensive"))
    v15 = "YES";
  else
    v15 = "NO";
  v16 = -[NSURLSessionTaskTransactionMetrics isConstrained](self, "isConstrained");
  v17 = -[NSURLSessionTaskTransactionMetrics isMultipath](self, "isMultipath");
  v18 = "NO";
  if (v16)
    v19 = "YES";
  else
    v19 = "NO";
  if (v17)
    v18 = "YES";
  objc_msgSend(v26, "stringWithFormat:", CFSTR("(Request) %@\n(Response) %@\n(Fetch Start) %@\n(Domain Lookup Start) %@\n(Domain Lookup End) %@\n(Connect Start) %@\n(Secure Connection Start) %@\n(Secure Connection End) %@\n(Connect End) %@\n(Request Start) %@\n(Request End) %@\n(Response Start) %@\n(Response End) %@\n(Protocol Name) %@\n(Proxy Connection) %s\n(Reused Connection) %s\n(Fetch Type) %s\n(Request Header Bytes) %lld\n(Request Body Transfer Bytes) %lld\n(Request Body Bytes) %lld\n(Response Header Bytes) %lld\n(Response Body Transfer Bytes) %lld\n(Response Body Bytes) %lld\n(Local Address) %@\n(Local Port) %@\n(Remote Address) %@\n(Remote Port) %@\n(TLS Protocol Version) 0x%04hX\n(TLS Cipher Suite) 0x%04hX\n(Cellular) %s\n(Expensive) %s\n(Constrained) %s\n(Multipath) %s\n"), v47, v46, v45, v44, v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v25, v24,
    v23,
    v22,
    v8,
    v9,
    v29,
    v28,
    v27,
    v33,
    v32,
    v31,
    v30,
    v11,
    v13,
    v14,
    v15,
    v19,
    v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSURLSessionTaskMetricsResourceFetchType)resourceFetchType
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 3;
  metrics = self->__metrics;
  if (!metrics || !metrics->_scheduledOriginLoad)
    return 0;
  if (metrics->_pushed)
    return 2;
  return 1;
}

- (NSURLRequest)request
{
  __CFN_TransactionMetrics *metrics;
  __CFN_TransactionMetrics *v3;
  NSURLRequest *v4;
  NSURLRequest *v6;
  NSURLRequest *v7;
  __CFN_TransactionMetrics *v8;
  NSURLRequest *v9;

  metrics = self->__metrics;
  if (!self->__forCache)
  {
    if (metrics && (v6 = metrics->_transferredRequest) != 0)
    {
      v7 = v6;
      v3 = (__CFN_TransactionMetrics *)v7;
    }
    else
    {
      v8 = self->__metrics;
      if (v8)
        v8 = (__CFN_TransactionMetrics *)v8->_request;
      v3 = v8;
      v7 = 0;
    }

    if (v3)
      goto LABEL_5;
LABEL_13:
    v4 = objc_alloc_init(NSURLRequest);
    goto LABEL_14;
  }
  if (metrics)
    metrics = (__CFN_TransactionMetrics *)metrics->_request;
  v3 = metrics;
  if (!v3)
    goto LABEL_13;
LABEL_5:
  v4 = v3;
LABEL_14:
  v9 = v4;

  return v9;
}

- (NSURLResponse)response
{
  __CFN_TransactionMetrics *metrics;
  uint64_t v3;

  metrics = self->__metrics;
  if (!metrics)
    return (NSURLResponse *)0;
  v3 = 72;
  if (!self->__forCache)
    v3 = 80;
  return (NSURLResponse *)*(id *)((char *)&metrics->super.isa + v3);
}

- (NSDate)responseStartDate
{
  __CFN_TransactionMetrics *metrics;
  double responseBeginTime;

  metrics = self->__metrics;
  if (!self->__forCache)
  {
    if (metrics)
    {
      responseBeginTime = metrics->_responseBeginTime;
      goto LABEL_6;
    }
LABEL_7:
    responseBeginTime = 0.0;
    goto LABEL_6;
  }
  if (!metrics)
    goto LABEL_7;
  responseBeginTime = metrics->_cacheLookupEndTime;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", responseBeginTime);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)requestStartDate
{
  __CFN_TransactionMetrics *metrics;
  double requestBeginTime;

  metrics = self->__metrics;
  if (!self->__forCache)
  {
    if (metrics)
    {
      requestBeginTime = metrics->_requestBeginTime;
      goto LABEL_6;
    }
LABEL_7:
    requestBeginTime = 0.0;
    goto LABEL_6;
  }
  if (!metrics)
    goto LABEL_7;
  requestBeginTime = metrics->_cacheLookupBeginTime;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", requestBeginTime);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)responseEndDate
{
  __CFN_TransactionMetrics *metrics;
  double responseEndTime;

  metrics = self->__metrics;
  if (!self->__forCache)
  {
    if (metrics)
    {
      responseEndTime = metrics->_responseEndTime;
      goto LABEL_6;
    }
LABEL_7:
    responseEndTime = 0.0;
    goto LABEL_6;
  }
  if (!metrics)
    goto LABEL_7;
  responseEndTime = metrics->_cacheLookupEndTime;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", responseEndTime);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)fetchStartDate
{
  __CFN_TransactionMetrics *metrics;
  double beginTime;

  metrics = self->__metrics;
  if (metrics)
    beginTime = metrics->_beginTime;
  else
    beginTime = 0.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", beginTime);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)networkProtocolName
{
  __CFN_TransactionMetrics *metrics;
  id v3;
  id Property;
  const char *v6;
  void *v7;

  if (self->__forCache)
    goto LABEL_4;
  metrics = self->__metrics;
  if (!metrics)
  {
    v7 = 0;
    Property = 0;
LABEL_8:
    v3 = Property;

    return (NSString *)v3;
  }
  if (!metrics->_pushed)
  {
    Property = objc_getProperty(metrics, a2, 88, 1);
    v7 = Property;
    if (Property)
      Property = objc_getProperty(Property, v6, 160, 1);
    goto LABEL_8;
  }
LABEL_4:
  v3 = 0;
  return (NSString *)v3;
}

- (BOOL)isMultipath
{
  __CFN_TransactionMetrics *metrics;
  BOOL v3;
  _BYTE *v5;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
  {
    v5 = 0;
    goto LABEL_10;
  }
  if (!metrics->_pushed)
  {
    v5 = objc_getProperty(metrics, a2, 88, 1);
    if (v5)
    {
      v3 = v5[18] != 0;
LABEL_8:

      return v3;
    }
LABEL_10:
    v3 = 0;
    goto LABEL_8;
  }
  return 0;
}

- (NSString)remoteAddress
{
  __CFN_TransactionMetrics *metrics;
  __CFString *v3;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;

  if (self->__forCache)
    goto LABEL_4;
  metrics = self->__metrics;
  if (metrics)
  {
    if (metrics->_pushed)
    {
LABEL_4:
      v3 = 0;
      return (NSString *)v3;
    }
    v5 = objc_getProperty(metrics, a2, 88, 1);
    v6 = v5;
    if (v5)
    {
      v7 = (void *)*((_QWORD *)v5 + 18);
      goto LABEL_8;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
LABEL_8:
  v8 = v7;

  if (v8 && nw_endpoint_get_type(v8) == nw_endpoint_type_address)
  {
    v9 = nw_endpoint_copy_address_string(v8);
    v3 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9, 0x600u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (int64_t)countOfResponseBodyBytesAfterDecoding
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed)
    return 0;
  else
    return metrics->_responseBodySize;
}

- (int64_t)countOfResponseHeaderBytesReceived
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed)
    return 0;
  else
    return metrics->_responseHeaderSize;
}

- (int64_t)countOfResponseBodyBytesReceived
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed)
    return 0;
  else
    return metrics->_responseBodyTransferSize;
}

- (int64_t)countOfRequestHeaderBytesSent
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed)
    return 0;
  else
    return metrics->_requestHeaderSize;
}

- (int64_t)countOfRequestBodyBytesSent
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed)
    return 0;
  else
    return metrics->_requestBodyTransferSize;
}

- (NSDate)domainLookupStartDate
{
  void *v2;

  if (self->__forCache)
  {
    v2 = 0;
  }
  else
  {
    -[NSURLSessionTaskTransactionMetrics translateConnectionTiming]((uint64_t)self, a2);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->domainLookupBeginTime);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v2;
}

- (NSDate)domainLookupEndDate
{
  void *v2;
  unint64_t v4;

  if (self->__forCache)
  {
    v2 = 0;
  }
  else
  {
    -[NSURLSessionTaskTransactionMetrics translateConnectionTiming]((uint64_t)self, a2);
    LODWORD(v4) = self->domainLookupDuration;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->domainLookupBeginTime + (double)v4 / 1000.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v2;
}

- (NSDate)connectEndDate
{
  void *v2;
  unint64_t v4;

  if (self->__forCache)
  {
    v2 = 0;
  }
  else
  {
    -[NSURLSessionTaskTransactionMetrics translateConnectionTiming]((uint64_t)self, a2);
    LODWORD(v4) = self->connectDuration;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->connectBeginTime + (double)v4 / 1000.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v2;
}

- (void)translateConnectionTiming
{
  _BYTE *v3;
  id v4;
  __int128 v5;
  _OWORD v6[2];

  if (a1 && !*(_BYTE *)(a1 + 8))
  {
    v3 = *(_BYTE **)(a1 + 16);
    if (v3 && v3[9] && !v3[10])
    {
      v4 = objc_getProperty(v3, a2, 88, 1);
      connectionTimingFromMetrics((__CFN_ConnectionMetrics *)v6, v4);
      v5 = v6[1];
      *(_OWORD *)(a1 + 24) = v6[0];
      *(_OWORD *)(a1 + 40) = v5;

    }
    else
    {
      *(int64x2_t *)(a1 + 24) = vdupq_n_s64(0x7FF8000000000000uLL);
      *(_QWORD *)(a1 + 40) = 0;
      *(_QWORD *)(a1 + 45) = 0;
    }
    *(_BYTE *)(a1 + 8) = 1;
  }
}

- (NSDate)connectStartDate
{
  void *v2;

  if (self->__forCache)
  {
    v2 = 0;
  }
  else
  {
    -[NSURLSessionTaskTransactionMetrics translateConnectionTiming]((uint64_t)self, a2);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->connectBeginTime);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v2;
}

- (BOOL)isReusedConnection
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
    return 1;
  if (metrics->_pushed)
    return 0;
  return !metrics->_firstOnConnection;
}

- (BOOL)isProxyConnection
{
  BOOL used_proxy;
  __CFN_TransactionMetrics *metrics;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
  {
    v5 = 0;
    goto LABEL_12;
  }
  v4 = objc_getProperty(metrics, a2, 88, 1);
  v5 = v4;
  if (!v4)
  {
LABEL_12:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = (void *)*((_QWORD *)v4 + 21);
LABEL_6:
  v7 = v6;

  if (v7)
    used_proxy = nw_establishment_report_get_used_proxy(v7);
  else
    used_proxy = 0;

  return used_proxy;
}

- (BOOL)isExpensive
{
  __CFN_TransactionMetrics *metrics;
  BOOL v3;
  _BYTE *v5;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
  {
    v5 = 0;
    goto LABEL_10;
  }
  if (!metrics->_pushed)
  {
    v5 = objc_getProperty(metrics, a2, 88, 1);
    if (v5)
    {
      v3 = v5[16] != 0;
LABEL_8:

      return v3;
    }
LABEL_10:
    v3 = 0;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)isCellular
{
  __CFN_TransactionMetrics *metrics;
  BOOL v3;
  _BYTE *v5;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
  {
    v5 = 0;
    goto LABEL_10;
  }
  if (!metrics->_pushed)
  {
    v5 = objc_getProperty(metrics, a2, 88, 1);
    if (v5)
    {
      v3 = v5[15] != 0;
LABEL_8:

      return v3;
    }
LABEL_10:
    v3 = 0;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)isConstrained
{
  __CFN_TransactionMetrics *metrics;
  BOOL v3;
  _BYTE *v5;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
  {
    v5 = 0;
    goto LABEL_10;
  }
  if (!metrics->_pushed)
  {
    v5 = objc_getProperty(metrics, a2, 88, 1);
    if (v5)
    {
      v3 = v5[17] != 0;
LABEL_8:

      return v3;
    }
LABEL_10:
    v3 = 0;
    goto LABEL_8;
  }
  return 0;
}

- (NSDate)secureConnectionStartDate
{
  void *v2;

  if (self->__forCache
    || (-[NSURLSessionTaskTransactionMetrics translateConnectionTiming]((uint64_t)self, a2), !self->secure))
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->connectBeginTime + (double)(self->connectDuration - self->secureConnectionDuration) / 1000.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v2;
}

- (NSDate)secureConnectionEndDate
{
  void *v2;
  unint64_t v4;

  if (self->__forCache
    || (-[NSURLSessionTaskTransactionMetrics translateConnectionTiming]((uint64_t)self, a2), !self->secure))
  {
    v2 = 0;
  }
  else
  {
    LODWORD(v4) = self->connectDuration;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->connectBeginTime + (double)v4 / 1000.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v2;
}

- (NSDate)requestEndDate
{
  __CFN_TransactionMetrics *metrics;
  double requestEndTime;

  metrics = self->__metrics;
  if (!self->__forCache)
  {
    if (metrics)
    {
      requestEndTime = metrics->_requestEndTime;
      goto LABEL_6;
    }
LABEL_7:
    requestEndTime = 0.0;
    goto LABEL_6;
  }
  if (!metrics)
    goto LABEL_7;
  requestEndTime = metrics->_cacheLookupBeginTime;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", requestEndTime);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)remotePort
{
  __CFN_TransactionMetrics *metrics;
  void *v3;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  if (self->__forCache)
    goto LABEL_4;
  metrics = self->__metrics;
  if (metrics)
  {
    if (metrics->_pushed)
    {
LABEL_4:
      v3 = 0;
      return (NSNumber *)v3;
    }
    v5 = objc_getProperty(metrics, a2, 88, 1);
    v6 = v5;
    if (v5)
    {
      v7 = (void *)*((_QWORD *)v5 + 18);
      goto LABEL_8;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
LABEL_8:
  v8 = v7;

  if (v8 && nw_endpoint_get_type(v8) == nw_endpoint_type_address)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", nw_endpoint_get_port(v8));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSNumber)negotiatedTLSProtocolVersion
{
  __CFN_TransactionMetrics *metrics;
  void *v3;
  unsigned __int16 *v5;
  uint64_t v6;

  if (!self->__forCache
    && (metrics = self->__metrics) != 0
    && !metrics->_pushed
    && (v5 = (unsigned __int16 *)objc_getProperty(metrics, a2, 88, 1)) != 0
    && (v6 = v5[14], v5, (_DWORD)v6))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (NSNumber)negotiatedTLSCipherSuite
{
  __CFN_TransactionMetrics *metrics;
  void *v3;
  unsigned __int16 *v5;
  uint64_t v6;

  if (!self->__forCache
    && (metrics = self->__metrics) != 0
    && !metrics->_pushed
    && (v5 = (unsigned __int16 *)objc_getProperty(metrics, a2, 88, 1)) != 0
    && (v6 = v5[15], v5, (_DWORD)v6))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (NSNumber)localPort
{
  __CFN_TransactionMetrics *metrics;
  void *v3;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  if (self->__forCache)
    goto LABEL_4;
  metrics = self->__metrics;
  if (metrics)
  {
    if (metrics->_pushed)
    {
LABEL_4:
      v3 = 0;
      return (NSNumber *)v3;
    }
    v5 = objc_getProperty(metrics, a2, 88, 1);
    v6 = v5;
    if (v5)
    {
      v7 = (void *)*((_QWORD *)v5 + 17);
      goto LABEL_8;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
LABEL_8:
  v8 = v7;

  if (v8 && nw_endpoint_get_type(v8) == nw_endpoint_type_address)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", nw_endpoint_get_port(v8));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSString)localAddress
{
  __CFN_TransactionMetrics *metrics;
  __CFString *v3;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char *v9;

  if (self->__forCache)
    goto LABEL_4;
  metrics = self->__metrics;
  if (metrics)
  {
    if (metrics->_pushed)
    {
LABEL_4:
      v3 = 0;
      return (NSString *)v3;
    }
    v5 = objc_getProperty(metrics, a2, 88, 1);
    v6 = v5;
    if (v5)
    {
      v7 = (void *)*((_QWORD *)v5 + 17);
      goto LABEL_8;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
LABEL_8:
  v8 = v7;

  if (v8 && nw_endpoint_get_type(v8) == nw_endpoint_type_address)
  {
    v9 = nw_endpoint_copy_address_string(v8);
    v3 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9, 0x600u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (int64_t)countOfRequestBodyBytesBeforeEncoding
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics || metrics->_pushed)
    return 0;
  else
    return metrics->_requestBodySize;
}

- (_BYTE)initWithMetrics:(char)a3 forCache:
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)NSURLSessionTaskTransactionMetrics;
    v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 2, a2);
      a1[9] = a3;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__metrics, 0);
}

- (BOOL)_apsRelaySucceeded
{
  __CFN_TransactionMetrics *metrics;

  return !self->__forCache && (metrics = self->__metrics) != 0 && metrics->_APSRelaySucceeded;
}

- (BOOL)_apsRelayAttempted
{
  __CFN_TransactionMetrics *metrics;

  return !self->__forCache && (metrics = self->__metrics) != 0 && metrics->_APSRelayAttempted;
}

- (OS_nw_data_transfer_report)_dataTransferReport
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return (OS_nw_data_transfer_report *)0;
  metrics = self->__metrics;
  if (metrics)
    metrics = (__CFN_TransactionMetrics *)metrics->_dataTransferReport;
  return (OS_nw_data_transfer_report *)metrics;
}

- (BOOL)_usesMultipath
{
  BOOL v2;
  __CFN_TransactionMetrics *metrics;
  _BYTE *v4;

  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      v4 = objc_getProperty(metrics, a2, 88, 1);
      if (v4)
      {
        v2 = v4[18] != 0;
LABEL_6:

        return v2;
      }
    }
    else
    {
      v4 = 0;
    }
    v2 = 0;
    goto LABEL_6;
  }
  return 0;
}

- (int)_privacyStance
{
  int v2;
  __CFN_TransactionMetrics *metrics;
  _DWORD *v4;

  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      v4 = objc_getProperty(metrics, a2, 88, 1);
      if (v4)
      {
        v2 = v4[8];
LABEL_6:

        return v2;
      }
    }
    else
    {
      v4 = 0;
    }
    v2 = 0;
    goto LABEL_6;
  }
  return 0;
}

- (OS_nw_establishment_report)_establishmentReport
{
  id v2;
  __CFN_TransactionMetrics *metrics;
  id v4;
  void *v5;
  void *v6;

  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      v4 = objc_getProperty(metrics, a2, 88, 1);
      v5 = v4;
      if (v4)
      {
        v6 = (void *)*((_QWORD *)v4 + 21);
LABEL_6:
        v2 = v6;

        return (OS_nw_establishment_report *)v2;
      }
    }
    else
    {
      v5 = 0;
    }
    v6 = 0;
    goto LABEL_6;
  }
  v2 = 0;
  return (OS_nw_establishment_report *)v2;
}

- (NSURLSessionTaskTransactionMetrics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionTaskTransactionMetrics;
  return -[NSURLSessionTaskTransactionMetrics init](&v3, sel_init);
}

- (NSURLSessionTaskMetricsDomainResolutionProtocol)domainResolutionProtocol
{
  __CFN_TransactionMetrics *metrics;
  NSURLSessionTaskMetricsDomainResolutionProtocol v3;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD enumerate_block[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
  {
    v6 = 0;
LABEL_13:
    v7 = 0;
    goto LABEL_8;
  }
  if (metrics->_pushed)
    return 0;
  v5 = objc_getProperty(metrics, a2, 88, 1);
  v6 = v5;
  if (!v5)
    goto LABEL_13;
  v7 = (void *)*((_QWORD *)v5 + 21);
LABEL_8:
  v8 = v7;

  if (v8)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    enumerate_block[0] = MEMORY[0x1E0C809B0];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __62__NSURLSessionTaskTransactionMetrics_domainResolutionProtocol__block_invoke;
    enumerate_block[3] = &unk_1E14FE258;
    enumerate_block[4] = &v10;
    nw_establishment_report_enumerate_resolution_reports(v8, enumerate_block);
    v3 = (unint64_t)*((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v3 = NSURLSessionTaskMetricsDomainResolutionProtocolUnknown;
  }

  return v3;
}

- ($A7E85E0D0E93E2D4C438E55FFF3D0B23)_connectionTiming
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (void)set_connectionTiming:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->domainLookupDuration = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->domainLookupBeginTime = v3;
}

- (BOOL)_connectionTimingCached
{
  return self->__connectionTimingCached;
}

- (void)set_connectionTimingCached:(BOOL)a3
{
  self->__connectionTimingCached = a3;
}

uint64_t __62__NSURLSessionTaskTransactionMetrics_domainResolutionProtocol__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;

  v3 = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = nw_resolution_report_get_protocol(v3);

  return 0;
}

- (BOOL)_secureConnection
{
  BOOL v2;
  __CFN_TransactionMetrics *metrics;
  _BYTE *v4;

  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      v4 = objc_getProperty(metrics, a2, 88, 1);
      if (v4)
      {
        v2 = v4[14] != 0;
LABEL_6:

        return v2;
      }
    }
    else
    {
      v4 = 0;
    }
    v2 = 0;
    goto LABEL_6;
  }
  return 0;
}

- (BOOL)_localCache
{
  return self->__forCache;
}

- (BOOL)_serverPush
{
  __CFN_TransactionMetrics *metrics;

  return !self->__forCache && (metrics = self->__metrics) != 0 && metrics->_pushed;
}

- (BOOL)_connectionRace
{
  return 0;
}

- (unsigned)_redirected
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  return metrics && metrics->_endReason == 2;
}

- (NSString)_localAddressAndPort
{
  void *v2;
  __CFN_TransactionMetrics *metrics;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  if (self->__forCache)
  {
    v2 = 0;
    return (NSString *)v2;
  }
  metrics = self->__metrics;
  if (metrics)
  {
    v4 = objc_getProperty(metrics, a2, 88, 1);
    v5 = v4;
    if (v4)
    {
      v6 = (void *)*((_QWORD *)v4 + 17);
      goto LABEL_6;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = 0;
LABEL_6:
  v7 = v6;

  if (v7 && nw_endpoint_get_type(v7) == nw_endpoint_type_address)
  {
    -[NSObject description](v7, "description");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)_remoteAddressAndPort
{
  void *v2;
  __CFN_TransactionMetrics *metrics;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  if (self->__forCache)
  {
    v2 = 0;
    return (NSString *)v2;
  }
  metrics = self->__metrics;
  if (metrics)
  {
    v4 = objc_getProperty(metrics, a2, 88, 1);
    v5 = v4;
    if (v4)
    {
      v6 = (void *)*((_QWORD *)v4 + 18);
      goto LABEL_6;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = 0;
LABEL_6:
  v7 = v6;

  if (v7 && nw_endpoint_get_type(v7) == nw_endpoint_type_address)
  {
    -[NSObject description](v7, "description");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSUUID)_connectionIdentifier
{
  id v2;
  __CFN_TransactionMetrics *metrics;
  id Property;
  const char *v5;
  void *v6;

  if (self->__forCache)
  {
    v2 = 0;
  }
  else
  {
    metrics = self->__metrics;
    if (metrics)
    {
      Property = objc_getProperty(metrics, a2, 88, 1);
      v6 = Property;
      if (Property)
        Property = objc_getProperty(Property, v5, 64, 1);
    }
    else
    {
      v6 = 0;
      Property = 0;
    }
    v2 = Property;

  }
  return (NSUUID *)v2;
}

- (int64_t)_requestHeaderBytesSent
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
    return 0;
  else
    return metrics->_requestHeaderSize;
}

- (int64_t)_responseHeaderBytesReceived
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
    return 0;
  else
    return metrics->_responseHeaderSize;
}

- (int64_t)_responseBodyBytesReceived
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
    return 0;
  else
    return metrics->_responseBodyTransferSize;
}

- (int64_t)_responseBodyBytesDecoded
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
    return 0;
  else
    return metrics->_responseBodySize;
}

- (int64_t)_totalBytesSent
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
    return 0;
  else
    return metrics->_requestBodyTransferSize + metrics->_requestHeaderSize;
}

- (int64_t)_totalBytesReceived
{
  __CFN_TransactionMetrics *metrics;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (!metrics)
    return 0;
  else
    return metrics->_responseBodyTransferSize + metrics->_responseHeaderSize;
}

- (int)_negotiatedTLSProtocol
{
  int v2;
  __CFN_TransactionMetrics *metrics;
  id v4;

  if (self->__forCache)
    return 0;
  metrics = self->__metrics;
  if (metrics)
    v4 = objc_getProperty(metrics, a2, 88, 1);
  else
    v4 = 0;
  v2 = SSLProtocolFromVersionCodepoint();

  return v2;
}

- (unsigned)_negotiatedTLSCipher
{
  unsigned __int16 v2;
  __CFN_TransactionMetrics *metrics;
  _WORD *v4;

  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      v4 = objc_getProperty(metrics, a2, 88, 1);
      if (v4)
      {
        v2 = v4[15];
LABEL_6:

        return v2;
      }
    }
    else
    {
      v4 = 0;
    }
    v2 = 0;
    goto LABEL_6;
  }
  return 0;
}

- (NSDate)_firstByteReceivedDate
{
  void *v2;
  __CFN_TransactionMetrics *metrics;
  id v4;
  void *v5;

  if (!self->__forCache && (metrics = self->__metrics) != 0 && metrics->_firstOnConnection)
  {
    v4 = objc_getProperty(metrics, a2, 88, 1);
    v5 = v4;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *((double *)v4 + 13));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return (NSDate *)v2;
}

- (NSString)_interfaceName
{
  id v2;
  __CFN_TransactionMetrics *metrics;
  id v4;
  void *v5;
  void *v6;

  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      v4 = objc_getProperty(metrics, a2, 88, 1);
      v5 = v4;
      if (v4)
      {
        v6 = (void *)*((_QWORD *)v4 + 19);
LABEL_6:
        v2 = v6;

        return (NSString *)v2;
      }
    }
    else
    {
      v5 = 0;
    }
    v6 = 0;
    goto LABEL_6;
  }
  v2 = 0;
  return (NSString *)v2;
}

- (NSString)_proxyAddress
{
  __CFString *v2;
  __CFN_TransactionMetrics *metrics;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;

  if (self->__forCache)
  {
    v2 = 0;
    return (NSString *)v2;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    v5 = 0;
    goto LABEL_16;
  }
  v4 = objc_getProperty(metrics, a2, 88, 1);
  v5 = v4;
  if (!v4)
  {
LABEL_16:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = (void *)*((_QWORD *)v4 + 21);
LABEL_6:
  v7 = v6;

  if (v7)
  {
    v8 = nw_establishment_report_copy_proxy_endpoint(v7);
    v9 = v8;
    if (v8 && nw_endpoint_get_type(v8) == nw_endpoint_type_address)
    {
      v10 = nw_endpoint_copy_address_string(v9);
      v2 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, 0x600u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSNumber)_proxyPort
{
  void *v2;
  __CFN_TransactionMetrics *metrics;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;

  if (self->__forCache)
  {
    v2 = 0;
    return (NSNumber *)v2;
  }
  metrics = self->__metrics;
  if (!metrics)
  {
    v5 = 0;
    goto LABEL_16;
  }
  v4 = objc_getProperty(metrics, a2, 88, 1);
  v5 = v4;
  if (!v4)
  {
LABEL_16:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = (void *)*((_QWORD *)v4 + 21);
LABEL_6:
  v7 = v6;

  if (v7)
  {
    v8 = nw_establishment_report_copy_proxy_endpoint(v7);
    v9 = v8;
    if (v8 && nw_endpoint_get_type(v8) == nw_endpoint_type_address)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", nw_endpoint_get_port(v9));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }

  return (NSNumber *)v2;
}

- (BOOL)_isUnlistedTracker
{
  BOOL v2;
  __CFN_TransactionMetrics *metrics;
  _BYTE *v4;

  if (!self->__forCache)
  {
    metrics = self->__metrics;
    if (metrics)
    {
      v4 = objc_getProperty(metrics, a2, 88, 1);
      if (v4)
      {
        v2 = v4[20] != 0;
LABEL_6:

        return v2;
      }
    }
    else
    {
      v4 = 0;
    }
    v2 = 0;
    goto LABEL_6;
  }
  return 0;
}

- (NSURLSessionTaskTransactionMetrics)initWithCoder:(id)a3
{
  id v4;
  NSURLSessionTaskTransactionMetrics *v5;
  uint64_t v6;
  __CFN_TransactionMetrics *metrics;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSURLSessionTaskTransactionMetrics;
  v5 = -[NSURLSessionTaskTransactionMetrics init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metrics"));
    v6 = objc_claimAutoreleasedReturnValue();
    metrics = v5->__metrics;
    v5->__metrics = (__CFN_TransactionMetrics *)v6;

    v5->__forCache = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forCache"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->__metrics, CFSTR("metrics"));
  objc_msgSend(v4, "encodeBool:forKey:", self->__forCache, CFSTR("forCache"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
