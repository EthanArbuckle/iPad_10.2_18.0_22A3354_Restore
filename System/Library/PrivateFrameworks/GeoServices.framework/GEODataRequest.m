@implementation GEODataRequest

uint64_t __37__GEODataRequest_Task__newURLRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- ($C4D369C9F02205611300857CFD58F739)kind
{
  return ($C4D369C9F02205611300857CFD58F739)self->_kind;
}

- (NSData)cachedData
{
  return self->_cachedData;
}

- (GEODataRequestThrottlerToken)throttleToken
{
  return self->_throttleToken;
}

- (GEORequestCounterTicket)requestCounterTicket
{
  return self->_requestCounterTicket;
}

- (NSDictionary)additionalHTTPHeaders
{
  return self->_additionalHTTPHeaders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_backgroundSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_requestCounterTicket, 0);
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_additionalHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (unint64_t)multipathServiceType
{
  return self->_multipathServiceType;
}

- (id)newURLRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  NSDictionary *additionalHTTPHeaders;
  id v10;
  _QWORD v12[4];
  id v13;

  v3 = objc_alloc(MEMORY[0x1E0CB37A8]);
  -[GEODataRequest URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithURL:", v4);

  objc_msgSend(v5, "setCachePolicy:", 1);
  objc_msgSend(v5, "setHTTPShouldHandleCookies:", 0);
  objc_msgSend(v5, "setAllowsExpensiveNetworkAccess:", -[GEODataRequest requireInexpensiveNetwork](self, "requireInexpensiveNetwork") ^ 1);
  objc_msgSend(v5, "setAllowsConstrainedNetworkAccess:", -[GEODataRequest requireUnconstrainedNetwork](self, "requireUnconstrainedNetwork") ^ 1);
  if (-[GEODataRequest useHTTPPost](self, "useHTTPPost"))
    objc_msgSend(v5, "setHTTPMethod:", CFSTR("POST"));
  -[GEODataRequest backgroundSessionIdentifier](self, "backgroundSessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    -[GEODataRequest timeoutInterval](self, "timeoutInterval");
    if (v7 > 0.0)
    {
      -[GEODataRequest timeoutInterval](self, "timeoutInterval");
      objc_msgSend(v5, "setTimeoutInterval:");
    }
  }
  -[GEODataRequest bodyData](self, "bodyData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHTTPBody:", v8);

  additionalHTTPHeaders = self->_additionalHTTPHeaders;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__GEODataRequest_Task__newURLRequest__block_invoke;
  v12[3] = &unk_1E1C07D90;
  v10 = v5;
  v13 = v10;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](additionalHTTPHeaders, "enumerateKeysAndObjectsUsingBlock:", v12);

  return v10;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (BOOL)requireInexpensiveNetwork
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (NSString)backgroundSessionIdentifier
{
  return self->_backgroundSessionIdentifier;
}

- (BOOL)useHTTPPost
{
  return self->_options & 1;
}

- (BOOL)requireUnconstrainedNetwork
{
  return (LOBYTE(self->_options) >> 6) & 1;
}

- (BOOL)requirePluggedIn
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (BOOL)needsProxy
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)disallowCellularNetwork
{
  return LOBYTE(self->_options) >> 7;
}

- (BOOL)allowTLSSessionTicketUse
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (id)publicLogDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E1C241D0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODataRequest URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GEODataRequest URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" URL: %@"), v5);

    if ((self->_options & 1) != 0)
      objc_msgSend(v3, "appendString:", CFSTR(" POST"));
    -[GEODataRequest bodyData](self, "bodyData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[GEODataRequest bodyData](self, "bodyData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR(" body (%zu bytes)"), objc_msgSend(v7, "length"));

    }
  }
  -[GEODataRequest auditToken](self, "auditToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[GEODataRequest auditToken](self, "auditToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publicLogDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" audit token: %@"), v10);

  }
  return v3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (GEODataRequest)initWithKind:(id)a3 protobufRequest:(id)a4 URL:(id)a5 additionalHTTPHeaders:(id)a6 auditToken:(id)a7 timeoutInterval:(double)Double traits:(id)a9 requestCounterTicket:(id)a10 multipathServiceType:(unint64_t)a11 multipathAlternatePort:(unint64_t)a12 throttleToken:(id)a13 options:(unint64_t)a14
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  GEODataRequest *v32;
  void *v33;
  void *v34;
  id v35;
  int BOOL;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  GEODataRequest *v40;
  unint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  unsigned int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v47 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a9;
  v24 = a10;
  v25 = a13;
  v48 = 0;
  v26 = GEOCreateBodyDataForProtocolBufferRequest(a4, a3.var0, 0, &v48);
  v27 = v48;
  if (!v26)
  {
    v32 = 0;
    v33 = v21;
    v34 = v47;
    goto LABEL_16;
  }
  v45 = v25;
  v46 = v24;
  v44 = v27;
  if (Double <= 0.000001
    && objc_msgSend(v23, "requestMode") == 1
    && +[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    +[GEOOfflineStateManager shared](GEOOfflineStateManager, "shared");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "offlineCohortId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "activeStateForCohortId:", v29);
    if (v30 < 2)
    {
LABEL_19:
      v31 = v21;

      goto LABEL_11;
    }
    if (v30 != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        v50 = v30;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
      }
      goto LABEL_19;
    }
    v31 = v21;

    Double = GEOConfigGetDouble(GeoOfflineConfig_FailoverRequestOnlineTimeout, (uint64_t)off_1EDF4EAE8);
  }
  else
  {
    v31 = v21;
  }
LABEL_11:
  v35 = v22;
  if (Double <= 0.000001)
    Double = GEODataRequestTimeout(*(_QWORD *)&a3);
  BOOL = GEOConfigGetBOOL(GeoServicesConfig_TLSSessionTicketsEnabled, (uint64_t)off_1EDF4CF88);
  v37 = 3;
  if (!BOOL)
    v37 = 1;
  v38 = v37 | a14;
  v33 = v31;
  _protobufHTTPHeaders(v31, *(_QWORD *)&a3, v23);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v45;
  v43 = v38;
  v34 = v47;
  v22 = v35;
  v24 = v46;
  v40 = -[GEODataRequest initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:](self, "initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", a3, v47, v22, v39, v44, 0, Double, 0, 0, v46, a11, a12, v45, v43);

  self = v40;
  v27 = v44;
  v32 = self;
LABEL_16:

  return v32;
}

- (GEODataRequest)initWithKind:(id)a3 URL:(id)a4 auditToken:(id)a5 timeoutInterval:(double)a6 additionalHTTPHeaders:(id)a7 bodyData:(id)a8 userAgent:(id)a9 entityTag:(id)a10 cachedData:(id)a11 requestCounterTicket:(id)a12 multipathServiceType:(unint64_t)a13 multipathAlternatePort:(unint64_t)a14 throttleToken:(id)a15 options:(unint64_t)a16
{
  return -[GEODataRequest initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:backgroundSessionIdentifier:throttleToken:options:](self, "initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:backgroundSessionIdentifier:throttleToken:options:", a3, a4, a5, a7, a8, a9, a6, a10, a11, a12, a13, a14, 0, a15, a16);
}

- (GEODataRequest)initWithKind:(id)a3 URL:(id)a4 auditToken:(id)a5 timeoutInterval:(double)a6 additionalHTTPHeaders:(id)a7 bodyData:(id)a8 userAgent:(id)a9 entityTag:(id)a10 cachedData:(id)a11 requestCounterTicket:(id)a12 multipathServiceType:(unint64_t)a13 multipathAlternatePort:(unint64_t)a14 backgroundSessionIdentifier:(id)a15 throttleToken:(id)a16 options:(unint64_t)a17
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  GEODataRequest *v29;
  GEODataRequest *v30;
  uint64_t v31;
  NSData *bodyData;
  id v33;
  uint64_t v34;
  NSString *backgroundSessionIdentifier;
  uint64_t v36;
  NSDictionary *v37;
  NSDictionary *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  NSDictionary *additionalHTTPHeaders;
  void *v47;
  void *v48;
  id obj;
  id v51;
  id v52;
  id v53;
  id v54;
  id v56;
  objc_super v57;

  v54 = a4;
  obj = a5;
  v53 = a5;
  v23 = a7;
  v56 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v28 = a15;
  v52 = a16;
  v57.receiver = self;
  v57.super_class = (Class)GEODataRequest;
  v29 = -[GEODataRequest init](&v57, sel_init);
  v30 = v29;
  if (v29)
  {
    v51 = v26;
    objc_storeStrong((id *)&v29->_URL, a4);
    objc_storeStrong((id *)&v30->_auditToken, obj);
    v31 = objc_msgSend(v56, "copy");
    bodyData = v30->_bodyData;
    v30->_bodyData = (NSData *)v31;

    if (a6 <= 0.0)
      a6 = GEODataRequestTimeout(*(_QWORD *)&a3);
    v30->_timeoutInterval = a6;
    v30->_kind = ($7466BF22B2A7275A1F5DB80FF4552E0B)a3;
    -[GEODataRequest setCachedData:](v30, "setCachedData:", v26, v24, v27);
    objc_storeStrong((id *)&v30->_requestCounterTicket, a12);
    v30->_multipathServiceType = a13;
    v30->_multipathAlternatePort = a14;
    v33 = v28;
    v34 = objc_msgSend(v28, "copy");
    backgroundSessionIdentifier = v30->_backgroundSessionIdentifier;
    v30->_backgroundSessionIdentifier = (NSString *)v34;

    objc_storeStrong((id *)&v30->_throttleToken, a16);
    v30->_options = a17;
    v36 = objc_msgSend(v25, "length");
    v37 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v23);
    v38 = v37;
    v24 = v47;
    v27 = v48;
    if (v47 || v36)
    {
      if (v36)
        -[NSDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v25, CFSTR("If-None-Match"));
      if (a3.var0 == 256)
      {
        +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "buildVersion");
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = (void *)v40;
        v42 = CFSTR("unknownBuildVer");
        if (v40)
          v42 = (__CFString *)v40;
        v43 = v42;

        -[NSDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v43, CFSTR("User-Agent"));
      }
      else
      {
        -[NSDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v47, CFSTR("User-Agent"));
      }
    }
    if ((a17 & 8) != 0)
    {
      +[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addProxyAuthHeaderOrReAuth:authProxyURL:", v38, 0);

    }
    additionalHTTPHeaders = v30->_additionalHTTPHeaders;
    v30->_additionalHTTPHeaders = v38;

    v26 = v51;
    v28 = v33;
  }

  return v30;
}

- (void)setCachedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (GEODataRequest)init
{
  GEODataRequest *result;

  result = (GEODataRequest *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODataRequest URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GEODataRequest URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" URL: %@"), v5);

    if ((self->_options & 1) != 0)
      objc_msgSend(v3, "appendString:", CFSTR(" POST"));
    -[GEODataRequest bodyData](self, "bodyData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[GEODataRequest bodyData](self, "bodyData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR(" body (%zu bytes)"), objc_msgSend(v7, "length"));

    }
  }
  -[GEODataRequest auditToken](self, "auditToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[GEODataRequest auditToken](self, "auditToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" audit token: %p"), v9);

  }
  if (-[GEODataRequest multipathServiceType](self, "multipathServiceType"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" multipath: %llu"), -[GEODataRequest multipathServiceType](self, "multipathServiceType"));
    if (-[GEODataRequest multipathAlternatePort](self, "multipathAlternatePort"))
      objc_msgSend(v3, "appendFormat:", CFSTR(" alt_port: %llu"), -[GEODataRequest multipathAlternatePort](self, "multipathAlternatePort"));
  }
  -[GEODataRequest backgroundSessionIdentifier](self, "backgroundSessionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[GEODataRequest backgroundSessionIdentifier](self, "backgroundSessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" background session: %@"), v11);

  }
  return v3;
}

- (unint64_t)multipathAlternatePort
{
  return self->_multipathAlternatePort;
}

- (BOOL)prefersDirectNetworking
{
  return self->_prefersDirectNetworking;
}

- (id)initForAnalyticsUploadRequest:(id)a3 toURL:(id)a4 requiresProxy:(BOOL)a5 backgroundIdentifier:(id)a6 compressRequest:(BOOL)a7 allowCellular:(BOOL)a8 allowBattery:(BOOL)a9 timeToLive:(double)a10 requestCounterTicket:(id)a11 throttleToken:(id)a12
{
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  id v18;
  id v19;
  id v20;
  _BOOL4 v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int BOOL;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  GEODataRequest *v29;
  GEODataRequest *v30;
  id v32;

  v13 = a8;
  v14 = a7;
  v15 = a5;
  v18 = a4;
  v19 = a11;
  v20 = a12;
  v32 = 0;
  v21 = GEOCreateBodyDataForProtocolBufferRequest(a3, 0xA00u, v14, &v32);
  v22 = v32;
  if (v21)
  {
    v23 = 17;
    if (v13)
      v23 = 1;
    if (a9)
      v24 = v23;
    else
      v24 = v23 | 0x20;
    BOOL = GEOConfigGetBOOL(GeoServicesConfig_TLSSessionTicketsEnabled, (uint64_t)off_1EDF4CF88);
    v26 = v24 | 2;
    if (!BOOL)
      v26 = v24;
    if (v15)
      v27 = v26 | 8;
    else
      v27 = v26;
    _protobufHTTPHeaders(0, 0xA00uLL, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[GEODataRequest initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:](self, "initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", 2560, v18, 0, v28, v22, 0, a10, 0, 0, v19, 0, 0, v20, v27);

    self = v29;
    v30 = self;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)updatedRequestWithNewBodyData:(id)a3
{
  id v4;
  $C4D369C9F02205611300857CFD58F739 v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  GEODataRequest *v15;
  GEODataRequest *v17;

  v4 = a3;
  v17 = [GEODataRequest alloc];
  v5 = -[GEODataRequest kind](self, "kind");
  -[GEODataRequest URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODataRequest auditToken](self, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODataRequest timeoutInterval](self, "timeoutInterval");
  v9 = v8;
  -[GEODataRequest additionalHTTPHeaders](self, "additionalHTTPHeaders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODataRequest requestCounterTicket](self, "requestCounterTicket");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GEODataRequest multipathServiceType](self, "multipathServiceType");
  v13 = -[GEODataRequest multipathAlternatePort](self, "multipathAlternatePort");
  -[GEODataRequest throttleToken](self, "throttleToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[GEODataRequest initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:](v17, "initWithKind:URL:auditToken:timeoutInterval:additionalHTTPHeaders:bodyData:userAgent:entityTag:cachedData:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", v5, v6, v7, v10, v4, 0, v9, 0, 0, v11, v12, v13, v14, self->_options);

  return v15;
}

- (id)updatedRequestWithNewProtobufRequest:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  GEODataRequest *v7;
  GEODataRequest *v8;
  id v10;

  v4 = a3;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_5;
  }
  v10 = 0;
  v5 = GEOCreateBodyDataForProtocolBufferRequest(v4, -[GEODataRequest kind](self, "kind"), 0, &v10);
  v6 = v10;
  if (v5)
  {
LABEL_5:
    -[GEODataRequest updatedRequestWithNewBodyData:](self, "updatedRequestWithNewBodyData:", v6);
    v7 = (GEODataRequest *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = self;
LABEL_6:
  v8 = v7;

  return v8;
}

@end
