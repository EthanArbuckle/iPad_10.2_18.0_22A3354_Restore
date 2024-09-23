@implementation MADComputeService(Photos)

- (id)performRequests:()Photos assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t i;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v44;
  uint64_t v45;
  void (**v46)(id, void *, void *);
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void (**v59)(id, void *, void *);
  id v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  __CFString *v65;
  id v66;
  void *v67;
  id v68;
  void (**v69)(id, void *, void *);
  _QWORD v70[4];
  const __CFString *v71;
  void *v72;
  id v73;
  void (**v74)(id, void *, void *);
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint8_t v87[128];
  uint8_t buf[4];
  const __CFString *v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v60 = a3;
  v14 = a4;
  v55 = a5;
  v58 = a7;
  v57 = a8;
  v59 = a9;
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "hash"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("OnDemand-%@"), v19);
  v20 = objc_claimAutoreleasedReturnValue();

  v62 = (void *)v20;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Request: %@ %@ with assets %@"), v20, v60, v14);
  v21 = objc_claimAutoreleasedReturnValue();
  v61 = a1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v89 = CFSTR("[MADComputeService+Photos]");
    v90 = 2112;
    v91 = v21;
    _os_log_impl(&dword_241256000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);
  }
  v56 = (void *)v21;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v23 = v14;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v78;
    v26 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v78 != v25)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        objc_msgSend(v28, "localIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29 == 0;

        if (v30)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v89 = CFSTR("[MADComputeService+Photos]");
            v90 = 2112;
            v91 = (uint64_t)v28;
            _os_log_error_impl(&dword_241256000, v26, OS_LOG_TYPE_ERROR, "%@ Asset (%@) without localIdentifier; skip",
              buf,
              0x16u);
          }
        }
        else
        {
          objc_msgSend(v28, "localIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v31);

        }
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
    }
    while (v24);
  }

  v75 = 0;
  v76 = 0;
  objc_msgSend(a1, "extensionDataForResultDirectoryURL:error:", &v76, &v75);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v76;
  v34 = v75;
  if (!v33)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MADComputeService(Photos) performRequests:assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:].cold.1();
    v36 = (void *)objc_msgSend(v34, "copy");
    v59[2](v59, v62, v36);
    goto LABEL_26;
  }
  v35 = objc_msgSend(a1, "registerProgressHandler:requestID:", v58, v62);
  if ((_DWORD)v35)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ Failed to register progressHandler (%d)"), CFSTR("[MADComputeService+Photos]"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MADComputeService(Photos) performRequests:assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:].cold.2();
    objc_msgSend(a1, "deregisterProgressHandlerForRequestID:", v62);
    objc_msgSend(a1, "deregisterResultsHandlerForRequestID:", v62);
    v85 = *MEMORY[0x24BDD0FC8];
    v86 = v36;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], (int)v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2](v59, 0, v38);

LABEL_26:
    v42 = 0;
    goto LABEL_27;
  }
  v39 = objc_msgSend(a1, "registerResultsHandler:requestID:", v57, v62);
  if ((_DWORD)v39)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ Failed to register resultsHandler (%d)"), CFSTR("[MADComputeService+Photos]"), v39);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MADComputeService(Photos) performRequests:assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:].cold.2();
    objc_msgSend(a1, "deregisterProgressHandlerForRequestID:", v62);
    objc_msgSend(a1, "deregisterResultsHandlerForRequestID:", v62);
    v83 = *MEMORY[0x24BDD0FC8];
    v84 = v36;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], (int)v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2](v59, 0, v41);

    goto LABEL_26;
  }
  objc_msgSend(a1, "connection");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = MEMORY[0x24BDAC760];
  v70[0] = MEMORY[0x24BDAC760];
  v70[1] = 3221225472;
  v70[2] = __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke;
  v70[3] = &unk_251156360;
  v71 = CFSTR("[MADComputeService+Photos]");
  v72 = a1;
  v42 = v62;
  v73 = v42;
  v46 = v59;
  v74 = v46;
  objc_msgSend(v44, "remoteObjectProxyWithErrorHandler:", v70);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend(v22, "allKeys");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "photoLibraryURL");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v45;
    v64[1] = 3221225472;
    v64[2] = __122__MADComputeService_Photos__performRequests_assets_photoLibrary_options_progressHandler_resultsHandler_completionHandler___block_invoke_143;
    v64[3] = &unk_251156388;
    v65 = CFSTR("[MADComputeService+Photos]");
    v66 = v56;
    v67 = a1;
    v48 = v42;
    v68 = v48;
    v69 = v46;
    objc_msgSend(v63, "requestProcessing:localIdentifiers:photoLibraryURL:resultDirectoryURL:resultExtensionData:requestID:reply:", v60, v54, v47, v33, v32, v48, v64);

    v49 = v48;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ Failed to connect to compute service"), CFSTR("[MADComputeService+Photos]"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MADComputeService(Photos) performRequests:assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:].cold.2();
    v81 = *MEMORY[0x24BDD0FC8];
    v82 = v50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "deregisterProgressHandlerForRequestID:", v42);
    objc_msgSend(v61, "deregisterResultsHandlerForRequestID:", v42);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -18, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2](v46, v42, v52);

    v53 = v42;
  }

  v36 = (void *)v71;
LABEL_27:

  return v42;
}

- (id)scheduleRequests:()Photos assets:photoLibrary:options:error:
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t i;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v39;
  void *v40;
  id v42;
  id v44;
  _QWORD v45[4];
  const __CFString *v46;
  id v47;
  uint64_t *v48;
  _QWORD *v49;
  _QWORD v50[4];
  __CFString *v51;
  uint64_t *v52;
  _QWORD *v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  void *v67;
  uint8_t v68[128];
  uint8_t buf[4];
  const __CFString *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v42 = a4;
  v39 = a5;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy_;
  v64 = __Block_byref_object_dispose_;
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "hash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Offline-%@"), v13);
  v65 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Schedule: %@ %@ on assets %@"), v61[5], v44, v42);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v70 = CFSTR("[MADComputeService+Photos]");
    v71 = 2112;
    v72 = v14;
    _os_log_impl(&dword_241256000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%@[Start] %@", buf, 0x16u);
  }
  v40 = (void *)v14;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v16 = v42;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v57;
    v19 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v57 != v18)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v21, "localIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22 == 0;

        if (v23)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v70 = CFSTR("[MADComputeService+Photos]");
            v71 = 2112;
            v72 = (uint64_t)v21;
            _os_log_error_impl(&dword_241256000, v19, OS_LOG_TYPE_ERROR, "%@ Asset (%@) without localIdentifier; skip",
              buf,
              0x16u);
          }
        }
        else
        {
          objc_msgSend(v21, "localIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v24);

        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    }
    while (v17);
  }

  v54 = 0;
  v55 = 0;
  objc_msgSend(a1, "extensionDataForResultDirectoryURL:error:", &v55, &v54);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v55;
  v27 = v54;
  if (v26)
  {
    objc_msgSend(a1, "connection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x24BDAC760];
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __80__MADComputeService_Photos__scheduleRequests_assets_photoLibrary_options_error___block_invoke;
    v50[3] = &unk_2511563B0;
    v51 = CFSTR("[MADComputeService+Photos]");
    v52 = &v60;
    v53 = a7;
    objc_msgSend(v28, "synchronousRemoteObjectProxyWithErrorHandler:", v50);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v15, "allKeys");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "photoLibraryURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v61[5];
      v45[0] = v29;
      v45[1] = 3221225472;
      v45[2] = __80__MADComputeService_Photos__scheduleRequests_assets_photoLibrary_options_error___block_invoke_150;
      v45[3] = &unk_2511563D8;
      v46 = CFSTR("[MADComputeService+Photos]");
      v47 = v40;
      v48 = &v60;
      v49 = a7;
      objc_msgSend(v30, "scheduleProcessing:localIdentifiers:photoLibraryURL:resultDirectoryURL:resultExtensionData:requestID:reply:", v44, v31, v32, v26, v25, v33, v45);

      v34 = (void *)v46;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ Failed to connect to compute service"), CFSTR("[MADComputeService+Photos]"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[MADComputeService(Photos) performRequests:assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:].cold.2();
      if (a7)
      {
        v66 = *MEMORY[0x24BDD0FC8];
        v67 = v34;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -18, v36);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v37 = (void *)v61[5];
      v61[5] = 0;

    }
    v35 = (id)v61[5];

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[MADComputeService(Photos) performRequests:assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:].cold.1();
    v35 = 0;
    if (a7)
      *a7 = (id)objc_msgSend(v27, "copy");
  }

  _Block_object_dispose(&v60, 8);
  return v35;
}

- (void)performRequests:()Photos assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_241256000, MEMORY[0x24BDACB70], v0, "%@ Failed to get security-scoped resultDirectoryURL - %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)performRequests:()Photos assets:photoLibrary:options:progressHandler:resultsHandler:completionHandler:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_241256000, MEMORY[0x24BDACB70], v0, "%@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
