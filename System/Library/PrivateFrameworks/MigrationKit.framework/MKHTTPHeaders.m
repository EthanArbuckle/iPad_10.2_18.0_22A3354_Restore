@implementation MKHTTPHeaders

- (MKHTTPHeaders)init
{
  MKHTTPHeaders *v2;
  MKHTTPHeaders *v3;
  MKHTTPServerTiming *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKHTTPHeaders;
  v2 = -[MKHTTPHeaders init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MKHTTPHeaders setVersion:](v2, "setVersion:", CFSTR("HTTP/1.1"));
    -[MKHTTPHeaders setStatusCode:](v3, "setStatusCode:", 200);
    -[MKHTTPHeaders setContentType:](v3, "setContentType:", CFSTR("Content-Type: application/octet-stream"));
    -[MKHTTPHeaders setConnection:](v3, "setConnection:", CFSTR("close"));
    v4 = objc_alloc_init(MKHTTPServerTiming);
    -[MKHTTPHeaders setServerTiming:](v3, "setServerTiming:", v4);

  }
  return v3;
}

- (MKHTTPHeaders)initWithMultipartHeaderArray:(id)a3
{
  id v4;
  MKHTTPHeaders *v5;

  v4 = a3;
  objc_msgSend(v4, "insertObject:atIndex:", &stru_24E35A3B8, 0);
  v5 = -[MKHTTPHeaders initWithArray:](self, "initWithArray:", v4);

  return v5;
}

- (MKHTTPHeaders)initWithArray:(id)a3
{
  id v4;
  MKHTTPHeaders *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  MKHTTPContentRange *v39;
  void *v40;
  MKHTTPContentRange *v41;
  MKHTTPContentDisposition *v42;
  void *v43;
  MKHTTPContentDisposition *v44;
  MKHTTPProxyAuthorization *v45;
  void *v46;
  MKHTTPProxyAuthorization *v47;
  MKHTTPContentPayload *v48;
  void *v49;
  MKHTTPContentPayload *v50;
  MKHTTPContentDate *v51;
  void *v52;
  MKHTTPContentDate *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)MKHTTPHeaders;
  v5 = -[MKHTTPHeaders init](&v65, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count") == 3)
    {
      v60 = v4;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKHTTPHeaders setMethod:](v5, "setMethod:", v8);

      v9 = objc_alloc(MEMORY[0x24BDD1808]);
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithString:", v10);

      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKHTTPHeaders setPath:](v5, "setPath:", v12);

      if (!-[NSString length](v5->_path, "length"))
        -[MKHTTPHeaders setPath:](v5, "setPath:", CFSTR("/"));
      -[NSString stringByReplacingOccurrencesOfString:withString:](v5->_path, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByRemovingPercentEncoding");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKHTTPHeaders setPath:](v5, "setPath:", v14);

      v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      objc_msgSend(v11, "queryItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v62 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            objc_msgSend(v21, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "value");
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23)
              v24 = (__CFString *)v23;
            else
              v24 = &stru_24E35A3B8;
            objc_msgSend(v15, "setObject:forKey:", v24, v22);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
        }
        while (v18);
      }

      -[MKHTTPHeaders setQuery:](v5, "setQuery:", v15);
      objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKHTTPHeaders setVersion:](v5, "setVersion:", v25);

      v4 = v60;
    }
    -[MKHTTPHeaders pairsFromArray:byKey:atIndex:](v5, "pairsFromArray:byKey:atIndex:", v4, CFSTR(": "), 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", CFSTR("content-length"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPHeaders setContentLength:](v5, "setContentLength:", objc_msgSend(v27, "longLongValue"));

    objc_msgSend(v26, "objectForKey:", CFSTR("content-type"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "hasPrefix:", CFSTR("multipart/")) & 1) != 0)
    {
      objc_msgSend(v28, "componentsSeparatedByString:", CFSTR("; "));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v29, "count") >= 2)
      {
        objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKHTTPHeaders setContentType:](v5, "setContentType:", v30);

        -[MKHTTPHeaders pairsFromArray:byKey:atIndex:](v5, "pairsFromArray:byKey:atIndex:", v29, CFSTR("="), 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", CFSTR("boundary"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKHTTPHeaders setBoundary:](v5, "setBoundary:", v32);

      }
    }
    else
    {
      -[MKHTTPHeaders setContentType:](v5, "setContentType:", v28);
    }
    objc_msgSend(v26, "objectForKey:", CFSTR("host"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPHeaders setHost:](v5, "setHost:", v33);

    objc_msgSend(v26, "objectForKey:", CFSTR("accept"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPHeaders setAccept:](v5, "setAccept:", v34);

    objc_msgSend(v26, "objectForKey:", CFSTR("userAgent"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPHeaders setUserAgent:](v5, "setUserAgent:", v35);

    objc_msgSend(v26, "objectForKey:", CFSTR("authorization"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPHeaders setAuthorization:](v5, "setAuthorization:", v36);

    objc_msgSend(v26, "objectForKey:", CFSTR("connection"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPHeaders setConnection:](v5, "setConnection:", v37);

    -[NSString lowercaseString](v5->_connection, "lowercaseString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKHTTPHeaders setIsClosed:](v5, "setIsClosed:", objc_msgSend(v38, "isEqualToString:", CFSTR("keep-alive")) ^ 1);

    v39 = [MKHTTPContentRange alloc];
    objc_msgSend(v26, "objectForKey:", CFSTR("content-range"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[MKHTTPContentRange initWithHeaderValue:](v39, "initWithHeaderValue:", v40);
    -[MKHTTPHeaders setContentRange:](v5, "setContentRange:", v41);

    v42 = [MKHTTPContentDisposition alloc];
    objc_msgSend(v26, "objectForKey:", CFSTR("content-disposition"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[MKHTTPContentDisposition initWithHeaderValue:](v42, "initWithHeaderValue:", v43);
    -[MKHTTPHeaders setContentDisposition:](v5, "setContentDisposition:", v44);

    v45 = [MKHTTPProxyAuthorization alloc];
    objc_msgSend(v26, "objectForKey:", CFSTR("proxy-authorization"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[MKHTTPProxyAuthorization initWithHeaderValue:](v45, "initWithHeaderValue:", v46);
    -[MKHTTPHeaders setProxyAuthorization:](v5, "setProxyAuthorization:", v47);

    v48 = [MKHTTPContentPayload alloc];
    objc_msgSend(v26, "objectForKey:", CFSTR("migrationkit-content-payload"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[MKHTTPContentPayload initWithHeaderValue:](v48, "initWithHeaderValue:", v49);
    -[MKHTTPHeaders setContentPayload:](v5, "setContentPayload:", v50);

    v51 = [MKHTTPContentDate alloc];
    objc_msgSend(v26, "objectForKey:", CFSTR("migrationkit-content-date"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[MKHTTPContentDate initWithHeaderValue:](v51, "initWithHeaderValue:", v52);
    -[MKHTTPHeaders setContentDate:](v5, "setContentDate:", v53);

    objc_msgSend(v26, "objectForKey:", CFSTR("transfer-encoding"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "lowercaseString");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKHTTPHeaders setTransferEncoding:](v5, "setTransferEncoding:", 0);
    if (objc_msgSend(v55, "containsString:", CFSTR("chunked")))
      -[MKHTTPHeaders setTransferEncoding:](v5, "setTransferEncoding:", -[MKHTTPHeaders transferEncoding](v5, "transferEncoding") | 1);
    if (!v5->_path)
    {
      objc_msgSend(v26, "objectForKey:", CFSTR("migrationkit-path"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKHTTPHeaders setPath:](v5, "setPath:", v56);

      -[NSString stringByReplacingOccurrencesOfString:withString:](v5->_path, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "stringByRemovingPercentEncoding");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKHTTPHeaders setPath:](v5, "setPath:", v58);

    }
  }

  return v5;
}

- (id)pairsFromArray:(id)a3 byKey:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  id v8;
  id i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  for (i = objc_alloc_init(MEMORY[0x24BDBCED8]); a5 < (unint64_t)objc_msgSend(v7, "count"); ++a5)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByString:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") == 2)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lowercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(i, "setObject:forKey:", v13, v14);
    }

  }
  return i;
}

- (void)setStatusCode:(unint64_t)a3
{
  id v4;

  self->_statusCode = a3;
  +[MKHTTPStatusText statusText:](MKHTTPStatusText, "statusText:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MKHTTPHeaders setStatusText:](self, "setStatusText:", v4);

}

- (id)responseHeadersData
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSString *contentType;
  void *v8;
  void *v9;
  NSString *version;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_contentLength);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("Content-Length"));

  contentType = self->_contentType;
  if (contentType)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", contentType, CFSTR("Content-Type"));
  -[MKHTTPHeaders connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("Connection"));

  -[MKHTTPServerTiming value](self->_serverTiming, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("Server-Timing"));
  v21 = v9;
  version = self->_version;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_statusCode);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ %@ %@%@"), version, v11, self->_statusText, CFSTR("\r\n"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@%@"), v17, v18, CFSTR("\r\n"));

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\r\n"));
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)close:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("close");
  else
    v3 = CFSTR("keep-alive");
  -[MKHTTPHeaders setConnection:](self, "setConnection:", v3);
}

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (void)setIsClosed:(BOOL)a3
{
  self->_isClosed = a3;
}

- (unint64_t)statusCode
{
  return self->_statusCode;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)transferEncoding
{
  return self->_transferEncoding;
}

- (void)setTransferEncoding:(unint64_t)a3
{
  self->_transferEncoding = a3;
}

- (unsigned)contentLength
{
  return self->_contentLength;
}

- (void)setContentLength:(unsigned int)a3
{
  self->_contentLength = a3;
}

- (NSString)accept
{
  return self->_accept;
}

- (void)setAccept:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)boundary
{
  return self->_boundary;
}

- (void)setBoundary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDictionary)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (MKHTTPContentRange)contentRange
{
  return self->_contentRange;
}

- (void)setContentRange:(id)a3
{
  objc_storeStrong((id *)&self->_contentRange, a3);
}

- (MKHTTPContentDisposition)contentDisposition
{
  return self->_contentDisposition;
}

- (void)setContentDisposition:(id)a3
{
  objc_storeStrong((id *)&self->_contentDisposition, a3);
}

- (MKHTTPProxyAuthorization)proxyAuthorization
{
  return self->_proxyAuthorization;
}

- (void)setProxyAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->_proxyAuthorization, a3);
}

- (MKHTTPContentPayload)contentPayload
{
  return self->_contentPayload;
}

- (void)setContentPayload:(id)a3
{
  objc_storeStrong((id *)&self->_contentPayload, a3);
}

- (MKHTTPContentDate)contentDate
{
  return self->_contentDate;
}

- (void)setContentDate:(id)a3
{
  objc_storeStrong((id *)&self->_contentDate, a3);
}

- (MKHTTPServerTiming)serverTiming
{
  return self->_serverTiming;
}

- (void)setServerTiming:(id)a3
{
  objc_storeStrong((id *)&self->_serverTiming, a3);
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_serverTiming, 0);
  objc_storeStrong((id *)&self->_contentDate, 0);
  objc_storeStrong((id *)&self->_contentPayload, 0);
  objc_storeStrong((id *)&self->_proxyAuthorization, 0);
  objc_storeStrong((id *)&self->_contentDisposition, 0);
  objc_storeStrong((id *)&self->_contentRange, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_boundary, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_accept, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
