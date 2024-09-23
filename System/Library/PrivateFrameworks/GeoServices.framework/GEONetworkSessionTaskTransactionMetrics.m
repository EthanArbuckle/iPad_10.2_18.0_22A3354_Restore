@implementation GEONetworkSessionTaskTransactionMetrics

- (double)fetchStart
{
  return self->_fetchStart;
}

- (void)setFetchStart:(double)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_fetchStart = a3;
}

- (void)setHasFetchStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasFetchStart
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (double)domainLookupStart
{
  return self->_domainLookupStart;
}

- (void)setDomainLookupStart:(double)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_domainLookupStart = a3;
}

- (void)setHasDomainLookupStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasDomainLookupStart
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (double)domainLookupEnd
{
  return self->_domainLookupEnd;
}

- (void)setDomainLookupEnd:(double)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_domainLookupEnd = a3;
}

- (void)setHasDomainLookupEnd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasDomainLookupEnd
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (double)connectStart
{
  return self->_connectStart;
}

- (void)setConnectStart:(double)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_connectStart = a3;
}

- (void)setHasConnectStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasConnectStart
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (double)secureConnectStart
{
  return self->_secureConnectStart;
}

- (void)setSecureConnectStart:(double)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_secureConnectStart = a3;
}

- (void)setHasSecureConnectStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v3;
}

- (BOOL)hasSecureConnectStart
{
  return (*(_WORD *)&self->_flags >> 10) & 1;
}

- (double)secureConnectEnd
{
  return self->_secureConnectEnd;
}

- (void)setSecureConnectEnd:(double)a3
{
  *(_WORD *)&self->_flags |= 0x200u;
  self->_secureConnectEnd = a3;
}

- (void)setHasSecureConnectEnd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasSecureConnectEnd
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (double)connectEnd
{
  return self->_connectEnd;
}

- (void)setConnectEnd:(double)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_connectEnd = a3;
}

- (void)setHasConnectEnd:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasConnectEnd
{
  return *(_WORD *)&self->_flags & 1;
}

- (double)requestStart
{
  return self->_requestStart;
}

- (void)setRequestStart:(double)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_requestStart = a3;
}

- (void)setHasRequestStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasRequestStart
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (double)requestEnd
{
  return self->_requestEnd;
}

- (void)setRequestEnd:(double)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_requestEnd = a3;
}

- (void)setHasRequestEnd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasRequestEnd
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (double)responseStart
{
  return self->_responseStart;
}

- (void)setResponseStart:(double)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_responseStart = a3;
}

- (void)setHasResponseStart:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasResponseStart
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (double)responseEnd
{
  return self->_responseEnd;
}

- (void)setResponseEnd:(double)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_responseEnd = a3;
}

- (void)setHasResponseEnd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasResponseEnd
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (int)protocolName
{
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
    return self->_protocolName;
  else
    return 0;
}

- (void)setProtocolName:(int)a3
{
  *(_WORD *)&self->_flags |= 0x800u;
  self->_protocolName = a3;
}

- (void)setHasProtocolName:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v3;
}

- (BOOL)hasProtocolName
{
  return (*(_WORD *)&self->_flags >> 11) & 1;
}

- (id)protocolNameAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C23578[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsProtocolName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROTOCOL_TYPE_OTHER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROTOCOL_TYPE_HTTP_1_1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROTOCOL_TYPE_HTTP_2_TLS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROTOCOL_TYPE_HTTP_2_TCP")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROTOCOL_TYPE_SPDY_1")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROTOCOL_TYPE_SPDY_2")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PROTOCOL_TYPE_SPDY_3")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)proxyConnection
{
  return self->_proxyConnection;
}

- (void)setProxyConnection:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_proxyConnection = a3;
}

- (void)setHasProxyConnection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xDFFF | v3;
}

- (BOOL)hasProxyConnection
{
  return (*(_WORD *)&self->_flags >> 13) & 1;
}

- (BOOL)reusedConnection
{
  return self->_reusedConnection;
}

- (void)setReusedConnection:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x4000u;
  self->_reusedConnection = a3;
}

- (void)setHasReusedConnection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xBFFF | v3;
}

- (BOOL)hasReusedConnection
{
  return (*(_WORD *)&self->_flags >> 14) & 1;
}

- (int)resourceFetchType
{
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
    return self->_resourceFetchType;
  else
    return 0;
}

- (void)setResourceFetchType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1000u;
  self->_resourceFetchType = a3;
}

- (void)setHasResourceFetchType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xEFFF | v3;
}

- (BOOL)hasResourceFetchType
{
  return (*(_WORD *)&self->_flags >> 12) & 1;
}

- (id)resourceFetchTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C235B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResourceFetchType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FETCH_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FETCH_TYPE_NETWORK_LOAD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FETCH_TYPE_SERVER_PUSH")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOURCE_FETCH_TYPE_LOCAL_CACHE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEONetworkSessionTaskTransactionMetrics;
  -[GEONetworkSessionTaskTransactionMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONetworkSessionTaskTransactionMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONetworkSessionTaskTransactionMetrics _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  __CFString *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  __CFString *v36;
  const __CFString *v37;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("fetchStart");
    else
      v7 = CFSTR("fetch_start");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_WORD *)(a1 + 108);
  }
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("domainLookupStart");
    else
      v9 = CFSTR("domain_lookup_start");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v5 = *(_WORD *)(a1 + 108);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0)
        goto LABEL_10;
      goto LABEL_30;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("domainLookupEnd");
  else
    v11 = CFSTR("domain_lookup_end");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_34;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("connectStart");
  else
    v13 = CFSTR("connect_start");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x400) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 88));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("secureConnectStart");
  else
    v15 = CFSTR("secure_connect_start");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v17 = CFSTR("secureConnectEnd");
  else
    v17 = CFSTR("secure_connect_end");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 1) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("connectEnd");
  else
    v19 = CFSTR("connect_end");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x40) == 0)
  {
LABEL_14:
    if ((v5 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("requestStart");
  else
    v21 = CFSTR("request_start");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x20) == 0)
  {
LABEL_15:
    if ((v5 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_54;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("requestEnd");
  else
    v23 = CFSTR("request_end");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x100) == 0)
  {
LABEL_16:
    if ((v5 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_58;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v25 = CFSTR("responseStart");
  else
    v25 = CFSTR("response_start");
  objc_msgSend(v4, "setObject:forKey:", v24, v25);

  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x80) == 0)
  {
LABEL_17:
    if ((v5 & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_62;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v27 = CFSTR("responseEnd");
  else
    v27 = CFSTR("response_end");
  objc_msgSend(v4, "setObject:forKey:", v26, v27);

  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x800) == 0)
  {
LABEL_18:
    if ((v5 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_69;
  }
LABEL_62:
  v28 = *(int *)(a1 + 96);
  if (v28 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 96));
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = off_1E1C23578[v28];
  }
  if (a2)
    v30 = CFSTR("protocolName");
  else
    v30 = CFSTR("protocol_name");
  objc_msgSend(v4, "setObject:forKey:", v29, v30);

  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x2000) == 0)
  {
LABEL_19:
    if ((v5 & 0x4000) == 0)
      goto LABEL_20;
    goto LABEL_73;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 104));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v32 = CFSTR("proxyConnection");
  else
    v32 = CFSTR("proxy_connection");
  objc_msgSend(v4, "setObject:forKey:", v31, v32);

  v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x4000) == 0)
  {
LABEL_20:
    if ((v5 & 0x1000) == 0)
      return v4;
    goto LABEL_77;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 105));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v34 = CFSTR("reusedConnection");
  else
    v34 = CFSTR("reused_connection");
  objc_msgSend(v4, "setObject:forKey:", v33, v34);

  if ((*(_WORD *)(a1 + 108) & 0x1000) != 0)
  {
LABEL_77:
    v35 = *(int *)(a1 + 100);
    if (v35 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 100));
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_1E1C235B0[v35];
    }
    if (a2)
      v37 = CFSTR("resourceFetchType");
    else
      v37 = CFSTR("resource_fetch_type");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONetworkSessionTaskTransactionMetrics _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONetworkSessionTaskTransactionMetrics)initWithDictionary:(id)a3
{
  return (GEONetworkSessionTaskTransactionMetrics *)-[GEONetworkSessionTaskTransactionMetrics _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  uint64_t v39;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("fetchStart");
      else
        v6 = CFSTR("fetch_start");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setFetchStart:");
      }

      if (a3)
        v8 = CFSTR("domainLookupStart");
      else
        v8 = CFSTR("domain_lookup_start");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setDomainLookupStart:");
      }

      if (a3)
        v10 = CFSTR("domainLookupEnd");
      else
        v10 = CFSTR("domain_lookup_end");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(a1, "setDomainLookupEnd:");
      }

      if (a3)
        v12 = CFSTR("connectStart");
      else
        v12 = CFSTR("connect_start");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(a1, "setConnectStart:");
      }

      if (a3)
        v14 = CFSTR("secureConnectStart");
      else
        v14 = CFSTR("secure_connect_start");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "doubleValue");
        objc_msgSend(a1, "setSecureConnectStart:");
      }

      if (a3)
        v16 = CFSTR("secureConnectEnd");
      else
        v16 = CFSTR("secure_connect_end");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v17, "doubleValue");
        objc_msgSend(a1, "setSecureConnectEnd:");
      }

      if (a3)
        v18 = CFSTR("connectEnd");
      else
        v18 = CFSTR("connect_end");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v19, "doubleValue");
        objc_msgSend(a1, "setConnectEnd:");
      }

      if (a3)
        v20 = CFSTR("requestStart");
      else
        v20 = CFSTR("request_start");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v21, "doubleValue");
        objc_msgSend(a1, "setRequestStart:");
      }

      if (a3)
        v22 = CFSTR("requestEnd");
      else
        v22 = CFSTR("request_end");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "doubleValue");
        objc_msgSend(a1, "setRequestEnd:");
      }

      if (a3)
        v24 = CFSTR("responseStart");
      else
        v24 = CFSTR("response_start");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v25, "doubleValue");
        objc_msgSend(a1, "setResponseStart:");
      }

      if (a3)
        v26 = CFSTR("responseEnd");
      else
        v26 = CFSTR("response_end");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v27, "doubleValue");
        objc_msgSend(a1, "setResponseEnd:");
      }

      if (a3)
        v28 = CFSTR("protocolName");
      else
        v28 = CFSTR("protocol_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = v29;
        if ((objc_msgSend(v30, "isEqualToString:", CFSTR("PROTOCOL_TYPE_OTHER")) & 1) != 0)
        {
          v31 = 0;
        }
        else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("PROTOCOL_TYPE_HTTP_1_1")) & 1) != 0)
        {
          v31 = 1;
        }
        else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("PROTOCOL_TYPE_HTTP_2_TLS")) & 1) != 0)
        {
          v31 = 2;
        }
        else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("PROTOCOL_TYPE_HTTP_2_TCP")) & 1) != 0)
        {
          v31 = 3;
        }
        else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("PROTOCOL_TYPE_SPDY_1")) & 1) != 0)
        {
          v31 = 4;
        }
        else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("PROTOCOL_TYPE_SPDY_2")) & 1) != 0)
        {
          v31 = 5;
        }
        else if (objc_msgSend(v30, "isEqualToString:", CFSTR("PROTOCOL_TYPE_SPDY_3")))
        {
          v31 = 6;
        }
        else
        {
          v31 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_81;
        v31 = objc_msgSend(v29, "intValue");
      }
      objc_msgSend(a1, "setProtocolName:", v31);
LABEL_81:

      if (a3)
        v32 = CFSTR("proxyConnection");
      else
        v32 = CFSTR("proxy_connection");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setProxyConnection:", objc_msgSend(v33, "BOOLValue"));

      if (a3)
        v34 = CFSTR("reusedConnection");
      else
        v34 = CFSTR("reused_connection");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setReusedConnection:", objc_msgSend(v35, "BOOLValue"));

      if (a3)
        v36 = CFSTR("resourceFetchType");
      else
        v36 = CFSTR("resource_fetch_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = v37;
        if ((objc_msgSend(v38, "isEqualToString:", CFSTR("RESOURCE_FETCH_TYPE_UNKNOWN")) & 1) != 0)
        {
          v39 = 0;
        }
        else if ((objc_msgSend(v38, "isEqualToString:", CFSTR("RESOURCE_FETCH_TYPE_NETWORK_LOAD")) & 1) != 0)
        {
          v39 = 1;
        }
        else if ((objc_msgSend(v38, "isEqualToString:", CFSTR("RESOURCE_FETCH_TYPE_SERVER_PUSH")) & 1) != 0)
        {
          v39 = 2;
        }
        else if (objc_msgSend(v38, "isEqualToString:", CFSTR("RESOURCE_FETCH_TYPE_LOCAL_CACHE")))
        {
          v39 = 3;
        }
        else
        {
          v39 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_108:

          goto LABEL_109;
        }
        v39 = objc_msgSend(v37, "intValue");
      }
      objc_msgSend(a1, "setResourceFetchType:", v39);
      goto LABEL_108;
    }
  }
LABEL_109:

  return a1;
}

- (GEONetworkSessionTaskTransactionMetrics)initWithJSON:(id)a3
{
  return (GEONetworkSessionTaskTransactionMetrics *)-[GEONetworkSessionTaskTransactionMetrics _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONetworkSessionTaskTransactionMetricsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONetworkSessionTaskTransactionMetricsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  __int16 flags;
  id v5;

  v5 = a3;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_6:
    if ((flags & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_11:
    if ((flags & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x2000) == 0)
  {
LABEL_14:
    if ((flags & 0x4000) == 0)
      goto LABEL_15;
LABEL_31:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 0x4000) != 0)
    goto LABEL_31;
LABEL_15:
  if ((flags & 0x1000) != 0)
LABEL_16:
    PBDataWriterWriteInt32Field();
LABEL_17:

}

- (void)copyTo:(id)a3
{
  __int16 flags;
  _QWORD *v5;

  v5 = a3;
  -[GEONetworkSessionTaskTransactionMetrics readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v5[5] = *(_QWORD *)&self->_fetchStart;
    *((_WORD *)v5 + 54) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = *(_QWORD *)&self->_domainLookupStart;
  *((_WORD *)v5 + 54) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  v5[3] = *(_QWORD *)&self->_domainLookupEnd;
  *((_WORD *)v5 + 54) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  v5[2] = *(_QWORD *)&self->_connectStart;
  *((_WORD *)v5 + 54) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_6:
    if ((flags & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  v5[11] = *(_QWORD *)&self->_secureConnectStart;
  *((_WORD *)v5 + 54) |= 0x400u;
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  v5[10] = *(_QWORD *)&self->_secureConnectEnd;
  *((_WORD *)v5 + 54) |= 0x200u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  v5[1] = *(_QWORD *)&self->_connectEnd;
  *((_WORD *)v5 + 54) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  v5[7] = *(_QWORD *)&self->_requestStart;
  *((_WORD *)v5 + 54) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  v5[6] = *(_QWORD *)&self->_requestEnd;
  *((_WORD *)v5 + 54) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_11:
    if ((flags & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  v5[9] = *(_QWORD *)&self->_responseStart;
  *((_WORD *)v5 + 54) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  v5[8] = *(_QWORD *)&self->_responseEnd;
  *((_WORD *)v5 + 54) |= 0x80u;
  flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v5 + 24) = self->_protocolName;
  *((_WORD *)v5 + 54) |= 0x800u;
  flags = (__int16)self->_flags;
  if ((flags & 0x2000) == 0)
  {
LABEL_14:
    if ((flags & 0x4000) == 0)
      goto LABEL_15;
LABEL_31:
    *((_BYTE *)v5 + 105) = self->_reusedConnection;
    *((_WORD *)v5 + 54) |= 0x4000u;
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_30:
  *((_BYTE *)v5 + 104) = self->_proxyConnection;
  *((_WORD *)v5 + 54) |= 0x2000u;
  flags = (__int16)self->_flags;
  if ((flags & 0x4000) != 0)
    goto LABEL_31;
LABEL_15:
  if ((flags & 0x1000) != 0)
  {
LABEL_16:
    *((_DWORD *)v5 + 25) = self->_resourceFetchType;
    *((_WORD *)v5 + 54) |= 0x1000u;
  }
LABEL_17:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_QWORD *)result + 5) = *(_QWORD *)&self->_fetchStart;
    *((_WORD *)result + 54) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_domainLookupStart;
  *((_WORD *)result + 54) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_domainLookupEnd;
  *((_WORD *)result + 54) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_connectStart;
  *((_WORD *)result + 54) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_6:
    if ((flags & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 11) = *(_QWORD *)&self->_secureConnectStart;
  *((_WORD *)result + 54) |= 0x400u;
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)result + 10) = *(_QWORD *)&self->_secureConnectEnd;
  *((_WORD *)result + 54) |= 0x200u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_connectEnd;
  *((_WORD *)result + 54) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_requestStart;
  *((_WORD *)result + 54) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_requestEnd;
  *((_WORD *)result + 54) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_11:
    if ((flags & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)result + 9) = *(_QWORD *)&self->_responseStart;
  *((_WORD *)result + 54) |= 0x100u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_responseEnd;
  *((_WORD *)result + 54) |= 0x80u;
  flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 24) = self->_protocolName;
  *((_WORD *)result + 54) |= 0x800u;
  flags = (__int16)self->_flags;
  if ((flags & 0x2000) == 0)
  {
LABEL_14:
    if ((flags & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  *((_BYTE *)result + 104) = self->_proxyConnection;
  *((_WORD *)result + 54) |= 0x2000u;
  flags = (__int16)self->_flags;
  if ((flags & 0x4000) == 0)
  {
LABEL_15:
    if ((flags & 0x1000) == 0)
      return result;
    goto LABEL_16;
  }
LABEL_31:
  *((_BYTE *)result + 105) = self->_reusedConnection;
  *((_WORD *)result + 54) |= 0x4000u;
  if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    return result;
LABEL_16:
  *((_DWORD *)result + 25) = self->_resourceFetchType;
  *((_WORD *)result + 54) |= 0x1000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_83;
  -[GEONetworkSessionTaskTransactionMetrics readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 54);
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_fetchStart != *((double *)v4 + 5))
      goto LABEL_83;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_83;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_domainLookupStart != *((double *)v4 + 4))
      goto LABEL_83;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_83;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_domainLookupEnd != *((double *)v4 + 3))
      goto LABEL_83;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_83;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_connectStart != *((double *)v4 + 2))
      goto LABEL_83;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x400) == 0 || self->_secureConnectStart != *((double *)v4 + 11))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 54) & 0x400) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x200) == 0 || self->_secureConnectEnd != *((double *)v4 + 10))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 54) & 0x200) != 0)
  {
    goto LABEL_83;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_connectEnd != *((double *)v4 + 1))
      goto LABEL_83;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_83;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_requestStart != *((double *)v4 + 7))
      goto LABEL_83;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_83;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_requestEnd != *((double *)v4 + 6))
      goto LABEL_83;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x100) == 0 || self->_responseStart != *((double *)v4 + 9))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 54) & 0x100) != 0)
  {
    goto LABEL_83;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_responseEnd != *((double *)v4 + 8))
      goto LABEL_83;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x800) == 0 || self->_protocolName != *((_DWORD *)v4 + 24))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 54) & 0x800) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x2000) == 0)
      goto LABEL_83;
    if (self->_proxyConnection)
    {
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_83;
    }
    else if (*((_BYTE *)v4 + 104))
    {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x2000) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_flags & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x4000) != 0)
    {
      if (self->_reusedConnection)
      {
        if (!*((_BYTE *)v4 + 105))
          goto LABEL_83;
        goto LABEL_78;
      }
      if (!*((_BYTE *)v4 + 105))
        goto LABEL_78;
    }
LABEL_83:
    v7 = 0;
    goto LABEL_84;
  }
  if ((*((_WORD *)v4 + 54) & 0x4000) != 0)
    goto LABEL_83;
LABEL_78:
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x1000) == 0 || self->_resourceFetchType != *((_DWORD *)v4 + 25))
      goto LABEL_83;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x1000) == 0;
  }
LABEL_84:

  return v7;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  double fetchStart;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double domainLookupStart;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double domainLookupEnd;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double connectStart;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double secureConnectStart;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double secureConnectEnd;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double connectEnd;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  double requestStart;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  unint64_t v45;
  double requestEnd;
  double v47;
  long double v48;
  double v49;
  unint64_t v50;
  unint64_t v51;
  double responseStart;
  double v53;
  long double v54;
  double v55;
  unint64_t v56;
  double responseEnd;
  double v58;
  long double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v66;
  unint64_t v67;

  -[GEONetworkSessionTaskTransactionMetrics readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    fetchStart = self->_fetchStart;
    v6 = -fetchStart;
    if (fetchStart >= 0.0)
      v6 = self->_fetchStart;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((flags & 8) != 0)
  {
    domainLookupStart = self->_domainLookupStart;
    v11 = -domainLookupStart;
    if (domainLookupStart >= 0.0)
      v11 = self->_domainLookupStart;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((flags & 4) != 0)
  {
    domainLookupEnd = self->_domainLookupEnd;
    v16 = -domainLookupEnd;
    if (domainLookupEnd >= 0.0)
      v16 = self->_domainLookupEnd;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((flags & 2) != 0)
  {
    connectStart = self->_connectStart;
    v21 = -connectStart;
    if (connectStart >= 0.0)
      v21 = self->_connectStart;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((flags & 0x400) != 0)
  {
    secureConnectStart = self->_secureConnectStart;
    v26 = -secureConnectStart;
    if (secureConnectStart >= 0.0)
      v26 = self->_secureConnectStart;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((flags & 0x200) != 0)
  {
    secureConnectEnd = self->_secureConnectEnd;
    v31 = -secureConnectEnd;
    if (secureConnectEnd >= 0.0)
      v31 = self->_secureConnectEnd;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((flags & 1) != 0)
  {
    connectEnd = self->_connectEnd;
    v36 = -connectEnd;
    if (connectEnd >= 0.0)
      v36 = self->_connectEnd;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  v66 = v24;
  v67 = v4;
  if ((flags & 0x40) != 0)
  {
    requestStart = self->_requestStart;
    v41 = -requestStart;
    if (requestStart >= 0.0)
      v41 = self->_requestStart;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  v44 = v9;
  if ((flags & 0x20) != 0)
  {
    requestEnd = self->_requestEnd;
    v47 = -requestEnd;
    if (requestEnd >= 0.0)
      v47 = self->_requestEnd;
    v48 = floor(v47 + 0.5);
    v49 = (v47 - v48) * 1.84467441e19;
    v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0)
        v45 += (unint64_t)v49;
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    v45 = 0;
  }
  v50 = v14;
  if ((flags & 0x100) != 0)
  {
    responseStart = self->_responseStart;
    v53 = -responseStart;
    if (responseStart >= 0.0)
      v53 = self->_responseStart;
    v54 = floor(v53 + 0.5);
    v55 = (v53 - v54) * 1.84467441e19;
    v51 = 2654435761u * (unint64_t)fmod(v54, 1.84467441e19);
    if (v55 >= 0.0)
    {
      if (v55 > 0.0)
        v51 += (unint64_t)v55;
    }
    else
    {
      v51 -= (unint64_t)fabs(v55);
    }
  }
  else
  {
    v51 = 0;
  }
  if ((flags & 0x80) != 0)
  {
    responseEnd = self->_responseEnd;
    v58 = -responseEnd;
    if (responseEnd >= 0.0)
      v58 = self->_responseEnd;
    v59 = floor(v58 + 0.5);
    v60 = (v58 - v59) * 1.84467441e19;
    v56 = 2654435761u * (unint64_t)fmod(v59, 1.84467441e19);
    if (v60 >= 0.0)
    {
      if (v60 > 0.0)
        v56 += (unint64_t)v60;
    }
    else
    {
      v56 -= (unint64_t)fabs(v60);
    }
  }
  else
  {
    v56 = 0;
  }
  if ((flags & 0x800) != 0)
  {
    v61 = 2654435761 * self->_protocolName;
    if ((flags & 0x2000) != 0)
    {
LABEL_91:
      v62 = 2654435761 * self->_proxyConnection;
      if ((flags & 0x4000) != 0)
        goto LABEL_92;
LABEL_96:
      v63 = 0;
      if ((flags & 0x1000) != 0)
        goto LABEL_93;
LABEL_97:
      v64 = 0;
      return v44 ^ v67 ^ v50 ^ v19 ^ v66 ^ v29 ^ v34 ^ v39 ^ v45 ^ v51 ^ v56 ^ v61 ^ v62 ^ v63 ^ v64;
    }
  }
  else
  {
    v61 = 0;
    if ((flags & 0x2000) != 0)
      goto LABEL_91;
  }
  v62 = 0;
  if ((flags & 0x4000) == 0)
    goto LABEL_96;
LABEL_92:
  v63 = 2654435761 * self->_reusedConnection;
  if ((flags & 0x1000) == 0)
    goto LABEL_97;
LABEL_93:
  v64 = 2654435761 * self->_resourceFetchType;
  return v44 ^ v67 ^ v50 ^ v19 ^ v66 ^ v29 ^ v34 ^ v39 ^ v45 ^ v51 ^ v56 ^ v61 ^ v62 ^ v63 ^ v64;
}

- (void)mergeFrom:(id)a3
{
  __int16 v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x10) != 0)
  {
    self->_fetchStart = *((double *)v5 + 5);
    *(_WORD *)&self->_flags |= 0x10u;
    v4 = *((_WORD *)v5 + 54);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((v4 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_domainLookupStart = *((double *)v5 + 4);
  *(_WORD *)&self->_flags |= 8u;
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  self->_domainLookupEnd = *((double *)v5 + 3);
  *(_WORD *)&self->_flags |= 4u;
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  self->_connectStart = *((double *)v5 + 2);
  *(_WORD *)&self->_flags |= 2u;
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x400) == 0)
  {
LABEL_6:
    if ((v4 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  self->_secureConnectStart = *((double *)v5 + 11);
  *(_WORD *)&self->_flags |= 0x400u;
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x200) == 0)
  {
LABEL_7:
    if ((v4 & 1) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  self->_secureConnectEnd = *((double *)v5 + 10);
  *(_WORD *)&self->_flags |= 0x200u;
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 1) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  self->_connectEnd = *((double *)v5 + 1);
  *(_WORD *)&self->_flags |= 1u;
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  self->_requestStart = *((double *)v5 + 7);
  *(_WORD *)&self->_flags |= 0x40u;
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x20) == 0)
  {
LABEL_10:
    if ((v4 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  self->_requestEnd = *((double *)v5 + 6);
  *(_WORD *)&self->_flags |= 0x20u;
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x100) == 0)
  {
LABEL_11:
    if ((v4 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  self->_responseStart = *((double *)v5 + 9);
  *(_WORD *)&self->_flags |= 0x100u;
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x80) == 0)
  {
LABEL_12:
    if ((v4 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  self->_responseEnd = *((double *)v5 + 8);
  *(_WORD *)&self->_flags |= 0x80u;
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x800) == 0)
  {
LABEL_13:
    if ((v4 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  self->_protocolName = *((_DWORD *)v5 + 24);
  *(_WORD *)&self->_flags |= 0x800u;
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x2000) == 0)
  {
LABEL_14:
    if ((v4 & 0x4000) == 0)
      goto LABEL_15;
LABEL_31:
    self->_reusedConnection = *((_BYTE *)v5 + 105);
    *(_WORD *)&self->_flags |= 0x4000u;
    if ((*((_WORD *)v5 + 54) & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_30:
  self->_proxyConnection = *((_BYTE *)v5 + 104);
  *(_WORD *)&self->_flags |= 0x2000u;
  v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x4000) != 0)
    goto LABEL_31;
LABEL_15:
  if ((v4 & 0x1000) != 0)
  {
LABEL_16:
    self->_resourceFetchType = *((_DWORD *)v5 + 25);
    *(_WORD *)&self->_flags |= 0x1000u;
  }
LABEL_17:

}

@end
