@implementation DMCHTTPLog

+ (void)logHTTPDetailsForIdentifier:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (+[DMCFeatureOverrides useHTTPLogging](DMCFeatureOverrides, "useHTTPLogging"))
  {
    objc_msgSend(a1, "_logDirectoryForIdentifier:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(a1, "_writeRequestLogToURL:request:response:responseData:responseError:", v16, v12, v13, v14, v15);

  }
}

+ (void)logHTTPDetailsForIdentifier:(id)a3 request:(id)a4 response:(id)a5 responseURL:(id)a6 responseError:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (+[DMCFeatureOverrides useHTTPLogging](DMCFeatureOverrides, "useHTTPLogging"))
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Downloaded data to file: %@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "dataUsingEncoding:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "logHTTPDetailsForIdentifier:request:response:responseData:responseError:", v20, v12, v13, v19, v15);

  }
}

+ (void)_writeRequestLogToURL:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  char v49;
  id v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  NSObject *v68;
  char v69;
  id v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v79 = a5;
  v78 = a6;
  v80 = a7;
  v13 = (void *)MEMORY[0x1E0CB36A8];
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromDate:timeZone:formatOptions:", v14, v15, 3955);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB3940];
  v18 = v12;
  objc_msgSend(v12, "HTTPMethod");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@-%@.txt"), v16, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = v11;
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; ; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "fileExistsAtPath:", v24);

    if (!v25 || (unint64_t)(i - 1) > 0x63)
      break;
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v18, "HTTPMethod");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@-%@-%lu.txt"), v16, v27, i);
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v28, 0);
    v29 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v29;
    v20 = (void *)v28;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "createFileAtPath:contents:attributes:", v31, 0, 0);

  if ((v32 & 1) != 0)
  {
    v90 = 0;
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", v21, &v90);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v90;
    if (v33)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", CFSTR("<<<<< Request"));
      v75 = v34;
      v36 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v18, "HTTPMethod");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URL");
      v77 = v33;
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v38, "path");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", CFSTR("%@ %@ HTTP/1.1"), v37, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v40);

      objc_msgSend(v18, "allHTTPHeaderFields");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __80__DMCHTTPLog__writeRequestLogToURL_request_response_responseData_responseError___block_invoke;
      v88[3] = &unk_1E4D375A8;
      v42 = v35;
      v89 = v42;
      objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", v88);

      objc_msgSend(v42, "addObject:", CFSTR("\n"));
      objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "dataUsingEncoding:", 4);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = 0;
      LOBYTE(v38) = objc_msgSend(v77, "writeData:error:", v44, &v87);
      v45 = v87;

      if ((v38 & 1) == 0)
      {
        v46 = *DMCLogObjects();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v92 = v21;
          v93 = 2112;
          v94 = v45;
          _os_log_impl(&dword_1A4951000, v46, OS_LOG_TYPE_ERROR, "Could not write HTTP request headers to file %@: %@", buf, 0x16u);
        }
      }
      objc_msgSend(v18, "HTTPBody");
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = v79;
      v76 = (void *)v47;
      if (v47)
      {
        v86 = 0;
        v49 = objc_msgSend(v77, "writeData:error:", v47, &v86);
        v50 = v86;
        v51 = v45;
        v45 = v50;

        if ((v49 & 1) == 0)
        {
          v52 = *DMCLogObjects();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v92 = v21;
            v93 = 2112;
            v94 = v45;
            _os_log_impl(&dword_1A4951000, v52, OS_LOG_TYPE_ERROR, "Could not write HTTP request body to file %@: %@", buf, 0x16u);
          }
        }
      }
      v73 = v45;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v53, "addObject:", CFSTR("\n>>>>> Response"));
      if (v79)
      {
        v54 = (void *)MEMORY[0x1E0CB3940];
        v55 = objc_msgSend(v79, "statusCode");
        objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", objc_msgSend(v79, "statusCode"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stringWithFormat:", CFSTR("HTTP/1.1 %ld %@"), v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addObject:", v57);

        objc_msgSend(v79, "allHeaderFields");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __80__DMCHTTPLog__writeRequestLogToURL_request_response_responseData_responseError___block_invoke_28;
        v84[3] = &unk_1E4D375A8;
        v59 = v53;
        v85 = v59;
        objc_msgSend(v58, "enumerateKeysAndObjectsUsingBlock:", v84);

        objc_msgSend(v59, "addObject:", CFSTR("\n"));
      }
      else if (v80)
      {
        objc_msgSend(v53, "addObject:", CFSTR("--- Error ---"));
        objc_msgSend(v80, "description");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addObject:", v64);

      }
      else
      {
        objc_msgSend(v53, "addObject:", CFSTR("--- Unknown Error ---"));
      }
      objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "dataUsingEncoding:", 4);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = 0;
      v67 = objc_msgSend(v77, "writeData:error:", v66, &v83);
      v34 = v83;

      if ((v67 & 1) == 0)
      {
        v68 = *DMCLogObjects();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v92 = v21;
          v93 = 2112;
          v94 = v34;
          _os_log_impl(&dword_1A4951000, v68, OS_LOG_TYPE_ERROR, "Could not write HTTP response headers to file %@: %@", buf, 0x16u);
        }
      }
      v62 = v78;
      if (v78)
      {
        v74 = v53;
        v82 = 0;
        v33 = v77;
        v69 = objc_msgSend(v77, "writeData:error:", v78, &v82);
        v70 = v82;

        if ((v69 & 1) != 0 || (v71 = *DMCLogObjects(), !os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)))
        {
          v34 = v70;
        }
        else
        {
          *(_DWORD *)buf = 138412546;
          v92 = v21;
          v93 = 2112;
          v94 = v70;
          v72 = v71;
          v34 = v70;
          _os_log_impl(&dword_1A4951000, v72, OS_LOG_TYPE_ERROR, "Could not write HTTP response body to file %@: %@", buf, 0x16u);
        }
        v53 = v74;
      }
      else
      {
        v33 = v77;
      }
      objc_msgSend(v33, "closeFile");

    }
    else
    {
      v63 = *DMCLogObjects();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v92 = v21;
        v93 = 2112;
        v94 = v34;
        _os_log_impl(&dword_1A4951000, v63, OS_LOG_TYPE_ERROR, "Could not open HTTP request log file %@: %@", buf, 0x16u);
      }
      v62 = v78;
      v48 = v79;
    }
    v61 = v80;

  }
  else
  {
    v60 = *DMCLogObjects();
    v61 = v80;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v92 = v21;
      _os_log_impl(&dword_1A4951000, v60, OS_LOG_TYPE_ERROR, "Could not create HTTP request log file %@", buf, 0xCu);
    }
    v34 = 0;
    v62 = v78;
    v48 = v79;
  }

}

void __80__DMCHTTPLog__writeRequestLogToURL_request_response_responseData_responseError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __80__DMCHTTPLog__writeRequestLogToURL_request_response_responseData_responseError___block_invoke_28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

+ (id)_logDirectoryForIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a3;
  objc_msgSend(v3, "fileURLWithPath:", CFSTR("/tmp/DMCHTTPLogs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v13);
  v9 = v13;

  if (v8)
  {
    v10 = v6;
  }
  else
  {
    v11 = *DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1A4951000, v11, OS_LOG_TYPE_ERROR, "Could not create HTTP logs directory %@: %@", buf, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

@end
