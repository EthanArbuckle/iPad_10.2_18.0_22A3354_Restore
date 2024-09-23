@implementation CoreDAVRequestLogger

- (CoreDAVRequestLogger)initWithProvider:(id)a3
{
  id v5;
  CoreDAVRequestLogger *v6;
  CoreDAVRequestLogger *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVRequestLogger;
  v6 = -[CoreDAVRequestLogger init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_provider, a3);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:selector:", CFSTR("self"), 1, sel_caseInsensitiveCompare_);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v8, 0);
    -[CoreDAVRequestLogger setHeaderSortDescriptors:](v7, "setHeaderSortDescriptors:", v9);

  }
  return v7;
}

- (id)_inflateRequestBody:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  z_stream v10;
  _BYTE v11[8192];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("[compression: gzip]\n"), "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendData:", v5);

  memset(&v10, 0, sizeof(v10));
  bzero(v11, 0x2000uLL);
  if (inflateInit2_(&v10, 31, "1.2.12", 112))
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_retainAutorelease(v3);
    v10.avail_in = objc_msgSend(v7, "length", objc_msgSend(v7, "bytes", *(_OWORD *)&v10.next_in, *(_OWORD *)&v10.total_in, *(_OWORD *)&v10.avail_out, *(_OWORD *)&v10.msg, *(_OWORD *)&v10.zalloc, *(_OWORD *)&v10.opaque, *(_OWORD *)&v10.adler));
    v10.total_in = v10.avail_in;
    while (1)
    {
      v10.next_out = v11;
      v10.avail_out = 0x2000;
      v8 = inflate(&v10, 0);
      if ((signed int)(0x2000 - v10.avail_out) >= 1)
        objc_msgSend(v4, "appendBytes:length:", v11);
      if (v8)
        break;
      if (!v10.avail_in)
        goto LABEL_11;
    }
    if (v8 != 1)
    {

      v4 = 0;
    }
LABEL_11:
    inflateEnd(&v10);
    v6 = v4;
    v4 = v6;
  }

  return v6;
}

- (void)logCoreDAVRequest:(id)a3 withTaskIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  CFAbsoluteTime Current;
  const __CFDate *v28;
  CFStringRef StringWithDate;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CoreDAVAccountInfoProvider *provider;
  void *v39;
  id v40;
  uint64_t v41;
  const void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  const __CFAllocator *allocator;
  id v66;
  void *v67;
  void *v68;
  CoreDAVRequestLogger *v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  id v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v71 = a4;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegatesToLogTransmittedDataForAccountInfoProvider:", self->_provider);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v6, "HTTPBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allHTTPHeaderFields");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CDVObjectForKeyCaseInsensitive:", CFSTR("Content-Encoding"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("gzip"));

    if (v13)
    {
      -[CoreDAVRequestLogger _inflateRequestBody:](self, "_inflateRequestBody:", v10);
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v64 = v8;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v80;
      allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v69 = self;
      v70 = v6;
      v67 = v10;
      v68 = v9;
      v66 = v15;
      v72 = *(_QWORD *)v80;
      do
      {
        v19 = 0;
        v73 = v17;
        do
        {
          if (*(_QWORD *)v80 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v19);
          if (objc_msgSend(v9, "containsObject:", objc_opt_class()))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v74 = v19;
              objc_msgSend(v20, "logHandle");
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v22 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543618;
                v85 = v22;
                v86 = 2112;
                v87 = v20;
                v23 = v22;
                _os_log_error_impl(&dword_209602000, v21, OS_LOG_TYPE_ERROR, "A delegate of similar class [%{public}@] has already logged this message. Skipping this delegate %@", buf, 0x16u);

                v18 = v72;
              }
              goto LABEL_51;
            }
            if ((objc_opt_respondsToSelector() & 1) == 0)
              goto LABEL_52;
            v74 = v19;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("A delegate of similar class [%@] has already logged this message. Skipping this delegate %@"), objc_opt_class(), v20);
          }
          else
          {
            objc_msgSend(v9, "addObject:", objc_opt_class());
            if (!objc_msgSend(v20, "shouldLogTransmittedData"))
              goto LABEL_52;
            v74 = v19;
            objc_msgSend(v6, "URL");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\nTask %@\n"), v71);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "dataUsingEncoding:", 4);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "coreDAVLogTransmittedDataPartial:", v26);

              Current = CFAbsoluteTimeGetCurrent();
              v28 = CFDateCreate(0, Current);
              if (_logFormater_logPred != -1)
                dispatch_once(&_logFormater_logPred, &__block_literal_global_87);
              if (_logFormater___logFormatter)
                StringWithDate = CFDateFormatterCreateStringWithDate(allocator, (CFDateFormatterRef)_logFormater___logFormatter, v28);
              else
                StringWithDate = 0;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n>>>>> %@\n"), StringWithDate);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "dataUsingEncoding:", 4);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "coreDAVLogTransmittedDataPartial:", v31);

              if (StringWithDate)
                CFRelease(StringWithDate);
              if (v28)
                CFRelease(v28);
              v32 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v6, "HTTPMethod");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "URL");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "stringWithFormat:", CFSTR("%@ %@\n"), v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "dataUsingEncoding:", 4);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "coreDAVLogTransmittedDataPartial:", v36);

              objc_msgSend(v6, "allHTTPHeaderFields");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                provider = self->_provider;
                objc_msgSend(v6, "URL");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(provider) = -[CoreDAVAccountInfoProvider shouldHandleHTTPCookiesForURL:](provider, "shouldHandleHTTPCookiesForURL:", v39);

                if ((_DWORD)provider)
                {
                  v40 = objc_retainAutorelease(v6);
                  objc_msgSend(v40, "_CFURLRequest");
                  v41 = CFURLRequestCopyHTTPCookieStorage();
                  if (v41)
                  {
                    v42 = (const void *)v41;
                    objc_msgSend(v40, "URL");
                    v43 = (void *)_CFHTTPCookieStorageCopyRequestHeaderFieldsForURL();
                    CFRelease(v42);
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x24BDB7448], "sharedHTTPCookieStorage");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "URL");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "cookiesForURL:", v45);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x24BDB7440], "requestHeaderFieldsWithCookies:", v46);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  if (objc_msgSend(v43, "count"))
                  {
                    v47 = (void *)objc_msgSend(v37, "mutableCopy");
                    objc_msgSend(v47, "addEntriesFromDictionary:", v43);

                    v37 = v47;
                  }

                }
              }
              objc_msgSend((id)objc_opt_class(), "_redactedHeadersFromHeaders:", v37);
              v21 = objc_claimAutoreleasedReturnValue();

              v77 = 0u;
              v78 = 0u;
              v75 = 0u;
              v76 = 0u;
              -[NSObject allKeys](v21, "allKeys");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVRequestLogger headerSortDescriptors](self, "headerSortDescriptors");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "sortedArrayUsingDescriptors:", v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
              if (v51)
              {
                v52 = v51;
                v53 = *(_QWORD *)v76;
                do
                {
                  for (i = 0; i != v52; ++i)
                  {
                    if (*(_QWORD *)v76 != v53)
                      objc_enumerationMutation(v50);
                    v55 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
                    v56 = (void *)MEMORY[0x24BDD17C8];
                    -[NSObject objectForKey:](v21, "objectForKey:", v55);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "stringWithFormat:", CFSTR("%@: %@\n"), v55, v57);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "dataUsingEncoding:", 4);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "coreDAVLogTransmittedDataPartial:", v59);

                  }
                  v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
                }
                while (v52);
              }

              objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "coreDAVLogTransmittedDataPartial:", v60);

              v10 = v67;
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v20, "coreDAVLogRequestBody:", v67);
              else
                objc_msgSend(v20, "coreDAVLogTransmittedDataPartial:", v67);
              self = v69;
              v6 = v70;
              v9 = v68;
              v17 = v73;
              v18 = v72;
              objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "coreDAVLogTransmittedDataPartial:", v61);

              objc_msgSend(CFSTR(">>>>>\n"), "dataUsingEncoding:", 4);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "coreDAVLogTransmittedDataPartial:", v62);

              objc_msgSend(v20, "coreDAVTransmittedDataFinished");
              v15 = v66;
              goto LABEL_51;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v20, "logHandle");
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v85 = v6;
                _os_log_error_impl(&dword_209602000, v21, OS_LOG_TYPE_ERROR, "ERROR: Nil URL for Request %@. Skipping rest of Log", buf, 0xCu);
              }
              goto LABEL_51;
            }
            v19 = v74;
            if ((objc_opt_respondsToSelector() & 1) == 0)
              goto LABEL_52;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Nil URL for Request %@. Skipping rest of Log"), v6, v63);
          }
          v21 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "coreDAVLogDiagnosticMessage:atLevel:", v21, 3);
LABEL_51:

          v19 = v74;
LABEL_52:
          ++v19;
        }
        while (v19 != v17);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
      }
      while (v17);
    }

    v8 = v64;
  }

}

+ (id)_redactedHeadersFromHeaders:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (_redactedHeadersFromHeaders__onceToken != -1)
    dispatch_once(&_redactedHeadersFromHeaders__onceToken, &__block_literal_global_2);
  v4 = v3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    v10 = v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend((id)_redactedHeadersFromHeaders__headersToRedact, "containsObject:", v12))
        {
          if (!v8)
          {
            v8 = (id)objc_msgSend(v4, "mutableCopy");

            v10 = v8;
          }
          objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("<Redacted>"), v12);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v10 = v4;
  }

  return v10;
}

void __52__CoreDAVRequestLogger__redactedHeadersFromHeaders___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24C1EF128);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_redactedHeadersFromHeaders__headersToRedact;
  _redactedHeadersFromHeaders__headersToRedact = v0;

}

- (void)logCoreDAVResponseHeaders:(id)a3 andStatusCode:(int64_t)a4 withTaskIdentifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  CFAbsoluteTime Current;
  const __CFDate *v18;
  CFStringRef StringWithDate;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFAllocator *allocator;
  uint64_t v43;
  CoreDAVRequestLogger *v44;
  id v46;
  uint64_t v47;
  id obj;
  void *v49;
  __CFString *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v46 = a5;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = self;
  objc_msgSend(v8, "delegatesToLogTransmittedDataForAccountInfoProvider:", self->_provider);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v41 = v9;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v57;
      allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v43 = *(_QWORD *)v57;
      do
      {
        v13 = 0;
        v47 = v11;
        do
        {
          if (*(_QWORD *)v57 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v13);
          if (objc_msgSend(v14, "shouldLogTransmittedData"))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\nTask %@\n"), v46);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "dataUsingEncoding:", 4);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "coreDAVLogTransmittedDataPartial:", v16);

            Current = CFAbsoluteTimeGetCurrent();
            v18 = CFDateCreate(0, Current);
            if (_logFormater_logPred != -1)
              dispatch_once(&_logFormater_logPred, &__block_literal_global_87);
            v51 = v13;
            if (_logFormater___logFormatter)
              StringWithDate = CFDateFormatterCreateStringWithDate(allocator, (CFDateFormatterRef)_logFormater___logFormatter, v18);
            else
              StringWithDate = 0;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n<<<<< %@\n"), StringWithDate);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "dataUsingEncoding:", 4);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "coreDAVLogTransmittedDataPartial:", v21);

            if (StringWithDate)
              CFRelease(StringWithDate);
            if (v18)
              CFRelease(v18);
            CDVHTTPStatusCodeAsStatusString(a4);
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22)
            {
              v24 = -[__CFString length](v22, "length");
              v25 = CFSTR("Unrecognized Status Code");
              if (v24)
                v25 = v23;
            }
            else
            {
              v25 = CFSTR("Unrecognized Status Code");
            }
            v26 = v25;

            v50 = v26;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HTTP/1.1 %d (%@)\n\n"), a4, v26);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "dataUsingEncoding:", 4);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "coreDAVLogTransmittedDataPartial:", v27);

            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            objc_msgSend(v7, "allKeys");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[CoreDAVRequestLogger headerSortDescriptors](v44, "headerSortDescriptors");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "sortedArrayUsingDescriptors:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v53;
              do
              {
                for (i = 0; i != v32; ++i)
                {
                  if (*(_QWORD *)v53 != v33)
                    objc_enumerationMutation(v30);
                  v35 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
                  v36 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v7, "objectForKey:", v35);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "stringWithFormat:", CFSTR("%@: %@\n"), v35, v37);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "dataUsingEncoding:", 4);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "coreDAVLogTransmittedDataPartial:", v39);

                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
              }
              while (v32);
            }

            objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "coreDAVLogTransmittedDataPartial:", v40);

            v11 = v47;
            v12 = v43;
            v13 = v51;
          }
          ++v13;
        }
        while (v13 != v11);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v11);
    }

    v9 = v41;
  }

}

- (void)logCoreDAVResponseSnippet:(id)a3
{
  -[CoreDAVRequestLogger logCoreDAVResponseSnippet:withTaskIdentifier:](self, "logCoreDAVResponseSnippet:withTaskIdentifier:", a3, 0);
}

- (void)logCoreDAVResponseSnippet:(id)a3 withTaskIdentifier:(id)a4
{
  -[CoreDAVRequestLogger logCoreDAVResponseSnippet:withTaskIdentifier:isBody:](self, "logCoreDAVResponseSnippet:withTaskIdentifier:isBody:", a3, a4, 0);
}

- (void)logCoreDAVResponseSnippet:(id)a3 withTaskIdentifier:(id)a4 isBody:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v21 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  if (objc_msgSend(v7, "length"))
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegatesToLogTransmittedDataForAccountInfoProvider:", self->_provider);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      ++self->_snippetsLogged;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v20 = v11;
      v12 = v11;
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
            v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            if (objc_msgSend(v17, "shouldLogTransmittedData"))
            {
              if (v8)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\nTask %@\n"), v8);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "dataUsingEncoding:", 4);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "coreDAVLogTransmittedDataPartial:", v19);

              }
              if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v17, "coreDAVLogResponseBody:", v9);
              else
                objc_msgSend(v17, "coreDAVLogTransmittedDataPartial:", v9);
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v14);
      }

      v11 = v20;
    }

  }
}

- (void)finishCoreDAVResponse
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegatesToLogTransmittedDataForAccountInfoProvider:", self->_provider);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") && self->_snippetsLogged)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "shouldLogTransmittedData", (_QWORD)v12))
          {
            objc_msgSend(CFSTR("\n<<<<<\n"), "dataUsingEncoding:", 4);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "coreDAVLogTransmittedDataPartial:", v11);

            objc_msgSend(v10, "coreDAVTransmittedDataFinished");
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  self->_snippetsLogged = 0;

}

- (NSArray)headerSortDescriptors
{
  return self->_headerSortDescriptors;
}

- (void)setHeaderSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_headerSortDescriptors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerSortDescriptors, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
