@implementation NSURLSessionTaskMetrics(GEOExtras)

- (GEOClientMetrics)_geo_clientMetrics
{
  GEOClientMetrics *v2;
  GEOClientNetworkMetrics *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  GEOClientNetworkTransactionMetrics *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  GEOClientMetrics *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(GEOClientMetrics);
  v3 = objc_alloc_init(GEOClientNetworkMetrics);
  v35 = v2;
  -[GEOClientMetrics setNetworkMetrics:](v2, "setNetworkMetrics:", v3);
  objc_msgSend(a1, "_geo_remoteAddressAndPort");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOClientNetworkMetrics setServiceIpAddress:](v3, "setServiceIpAddress:", v4);

  -[GEOClientNetworkMetrics setRedirectCount:](v3, "setRedirectCount:", objc_msgSend(a1, "redirectCount"));
  objc_msgSend(a1, "taskInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  -[GEOClientNetworkMetrics setRequestStart:](v3, "setRequestStart:");

  objc_msgSend(a1, "taskInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  -[GEOClientNetworkMetrics setRequestEnd:](v3, "setRequestEnd:");

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(a1, "transactionMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v13);
        v15 = objc_alloc_init(GEOClientNetworkTransactionMetrics);
        -[GEOClientNetworkMetrics addTransactionMetrics:](v3, "addTransactionMetrics:", v15);
        objc_msgSend(v14, "response");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v14, "response");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOClientNetworkMetrics setHttpResponseCode:](v3, "setHttpResponseCode:", objc_msgSend(v18, "statusCode"));

        }
        objc_msgSend(v14, "fetchStartDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSince1970");
        -[GEOClientNetworkTransactionMetrics setFetchStart:](v15, "setFetchStart:");

        objc_msgSend(v14, "domainLookupStartDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSince1970");
        -[GEOClientNetworkTransactionMetrics setDomainLookupStart:](v15, "setDomainLookupStart:");

        objc_msgSend(v14, "domainLookupEndDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSince1970");
        -[GEOClientNetworkTransactionMetrics setDomainLookupEnd:](v15, "setDomainLookupEnd:");

        objc_msgSend(v14, "connectStartDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeIntervalSince1970");
        -[GEOClientNetworkTransactionMetrics setConnectStart:](v15, "setConnectStart:");

        objc_msgSend(v14, "connectEndDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSince1970");
        -[GEOClientNetworkTransactionMetrics setConnectEnd:](v15, "setConnectEnd:");

        objc_msgSend(v14, "secureConnectionStartDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSince1970");
        -[GEOClientNetworkTransactionMetrics setSecureConnectStart:](v15, "setSecureConnectStart:");

        objc_msgSend(v14, "secureConnectionEndDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "timeIntervalSince1970");
        -[GEOClientNetworkTransactionMetrics setSecureConnectEnd:](v15, "setSecureConnectEnd:");

        objc_msgSend(v14, "requestStartDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timeIntervalSince1970");
        -[GEOClientNetworkTransactionMetrics setRequestStart:](v15, "setRequestStart:");

        objc_msgSend(v14, "requestEndDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSince1970");
        -[GEOClientNetworkTransactionMetrics setRequestEnd:](v15, "setRequestEnd:");

        objc_msgSend(v14, "responseStartDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeIntervalSince1970");
        -[GEOClientNetworkTransactionMetrics setResponseStart:](v15, "setResponseStart:");

        objc_msgSend(v14, "responseEndDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSince1970");
        -[GEOClientNetworkTransactionMetrics setResponseEnd:](v15, "setResponseEnd:");

        -[GEOClientNetworkTransactionMetrics setProxyConnection:](v15, "setProxyConnection:", objc_msgSend(v14, "isProxyConnection"));
        -[GEOClientNetworkTransactionMetrics setReusedConnection:](v15, "setReusedConnection:", objc_msgSend(v14, "isReusedConnection"));
        objc_msgSend(v14, "networkProtocolName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lowercaseString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v31, "isEqualToString:", CFSTR("http/1.1")) & 1) != 0)
        {
          v32 = 1;
        }
        else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("h2")) & 1) != 0)
        {
          v32 = 2;
        }
        else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("h2c")) & 1) != 0)
        {
          v32 = 3;
        }
        else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("spdy/1")) & 1) != 0)
        {
          v32 = 4;
        }
        else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("spdy/2")) & 1) != 0)
        {
          v32 = 5;
        }
        else
        {
          if (!objc_msgSend(v31, "isEqualToString:", CFSTR("spdy/3")))
            goto LABEL_21;
          v32 = 6;
        }
        -[GEOClientNetworkTransactionMetrics setProtocolName:](v15, "setProtocolName:", v32);
LABEL_21:
        v33 = objc_msgSend(v14, "resourceFetchType");
        if (v33 <= 3)
          -[GEOClientNetworkTransactionMetrics setResourceFetchType:](v15, "setResourceFetchType:", v33);
        -[GEOClientNetworkTransactionMetrics setIsMultipath:](v15, "setIsMultipath:", objc_msgSend(v14, "isMultipath"));
        -[GEOClientNetworkTransactionMetrics setUsedCellular:](v15, "setUsedCellular:", objc_msgSend(v14, "isCellular"));

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v11);
  }

  return v35;
}

- (id)_geo_remoteAddressAndPort
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *i;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "transactionMetrics");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v5, "remoteAddress");
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v7 = (void *)v6;
          objc_msgSend(v5, "remoteAddress");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            v9 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v5, "remoteAddress");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "remotePort");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "stringWithFormat:", CFSTR("%@:%@"), v10, v11);
            v2 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
        }
      }
      v2 = (void *)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_12:

  return v2;
}

@end
