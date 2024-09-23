@implementation NEAppProxyUDPFlow

- (NEAppProxyUDPFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4
{
  NEAppProxyUDPFlow *v4;
  NEAppProxyUDPFlow *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NEAppProxyUDPFlow;
  v4 = -[NEAppProxyFlow initWithNEFlow:queue:](&v7, sel_initWithNEFlow_queue_, a3, a4);
  v5 = v4;
  if (v4)
    -[NEAppProxyUDPFlow resetLocalEndpoint]((uint64_t)v4);
  return v5;
}

- (void)openWithLocalFlowEndpoint:(id)a3 completionHandler:(id)a4
{
  id v5;
  objc_super v6;
  _QWORD v7[4];
  NEAppProxyUDPFlow *v8;
  id v9;

  v7[1] = 3221225472;
  v7[2] = __65__NEAppProxyUDPFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke;
  v7[3] = &unk_1E3CC4748;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)NEAppProxyUDPFlow;
  v7[0] = MEMORY[0x1E0C809B0];
  v5 = v9;
  -[NEAppProxyFlow openWithLocalFlowEndpoint:completionHandler:](&v6, sel_openWithLocalFlowEndpoint_completionHandler_, a3, v7);

}

- (void)openWithLocalEndpoint:(id)a3 completionHandler:(id)a4
{
  id v5;
  objc_super v6;
  _QWORD v7[4];
  NEAppProxyUDPFlow *v8;
  id v9;

  v7[1] = 3221225472;
  v7[2] = __61__NEAppProxyUDPFlow_openWithLocalEndpoint_completionHandler___block_invoke;
  v7[3] = &unk_1E3CC4748;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)NEAppProxyUDPFlow;
  v7[0] = MEMORY[0x1E0C809B0];
  v5 = v9;
  -[NEAppProxyFlow openWithLocalEndpoint:completionHandler:](&v6, sel_openWithLocalEndpoint_completionHandler_, a3, v7);

}

- (void)readDatagramsAndFlowEndpointsWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id Property;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __72__NEAppProxyUDPFlow_readDatagramsAndFlowEndpointsWithCompletionHandler___block_invoke;
  v18 = &unk_1E3CBF4B8;
  v6 = v4;
  v19 = v6;
  v7 = NEFlowAsyncDatagramsCopyNext();
  if (v7)
  {
    v9 = v7;
    if (self)
      Property = objc_getProperty(self, v8, 40, 1);
    else
      Property = 0;
    v11 = Property;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __72__NEAppProxyUDPFlow_readDatagramsAndFlowEndpointsWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E3CC3B08;
    v13 = v6;
    v14 = v9;
    dispatch_async(v11, block);

  }
}

- (void)readDatagramsWithCompletionHandler:(void *)completionHandler
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id Property;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;

  v4 = completionHandler;
  v5 = MEMORY[0x1E0C809B0];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __56__NEAppProxyUDPFlow_readDatagramsWithCompletionHandler___block_invoke;
  v18 = &unk_1E3CBF4B8;
  v6 = v4;
  v19 = v6;
  v7 = NEFlowAsyncDatagramsCopyNext();
  if (v7)
  {
    v9 = v7;
    if (self)
      Property = objc_getProperty(self, v8, 40, 1);
    else
      Property = 0;
    v11 = Property;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __56__NEAppProxyUDPFlow_readDatagramsWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E3CC3B08;
    v13 = v6;
    v14 = v9;
    dispatch_async(v11, block);

  }
}

- (void)writeDatagrams:(id)a3 sentByFlowEndpoints:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  unint64_t v23;
  void *v24;
  NSObject *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  const char *v38;
  id Property;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  id v43;
  NSObject *v44;
  __int128 v45;
  void *v46;
  void *v47;
  _QWORD block[4];
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count");
  v46 = v9;
  v47 = v8;
  if (v11 == objc_msgSend(v9, "count"))
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v65;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v65 != v15)
            objc_enumerationMutation(v12);
          if ((isa_nsdata(*(void **)(*((_QWORD *)&v64 + 1) + 8 * i)) & 1) == 0)
          {
            ne_log_obj();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByFlowEndpoints:completionHandler:]";
              _os_log_error_impl(&dword_19BD16000, v37, OS_LOG_TYPE_ERROR, "%s: Datagrams array contains a non-NSData object", buf, 0xCu);
            }

            if (self)
              Property = objc_getProperty(self, v38, 40, 1);
            else
              Property = 0;
            v40 = Property;
            v62[0] = MEMORY[0x1E0C809B0];
            v62[1] = 3221225472;
            v62[2] = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_10;
            v62[3] = &unk_1E3CC4720;
            v63 = v10;
            dispatch_async(v40, v62);

            goto LABEL_48;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
        if (v14)
          continue;
        break;
      }
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v17 = v9;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v59;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v59 != v20)
            objc_enumerationMutation(v17);
          if (nw_endpoint_get_type(*(nw_endpoint_t *)(*((_QWORD *)&v58 + 1) + 8 * j)) != nw_endpoint_type_address)
          {
            ne_log_obj();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByFlowEndpoints:completionHandler:]";
              _os_log_error_impl(&dword_19BD16000, v41, OS_LOG_TYPE_ERROR, "%s: Remote endpoints array contains a non-NWEndpoint object", buf, 0xCu);
            }

            if (self)
              v43 = objc_getProperty(self, v42, 40, 1);
            else
              v43 = 0;
            v44 = v43;
            v56[0] = MEMORY[0x1E0C809B0];
            v56[1] = 3221225472;
            v56[2] = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_11;
            v56[3] = &unk_1E3CC4720;
            v57 = v10;
            dispatch_async(v44, v56);

            v12 = v17;
            goto LABEL_48;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        if (v19)
          continue;
        break;
      }
    }

    if (objc_msgSend(v12, "count"))
    {
      v23 = 0;
      *(_QWORD *)&v22 = 136315138;
      v45 = v22;
      do
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v23, v45);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v23);
        v25 = objc_claimAutoreleasedReturnValue();
        nw_endpoint_get_address(v25);
        v26 = objc_msgSend(v12, "count") - 1;
        if (v23 >= v26)
        {
          v51 = MEMORY[0x1E0C809B0];
          v52 = 3221225472;
          v53 = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_2;
          v54 = &unk_1E3CBF4E0;
          v55 = v10;
        }
        v27 = NEFlowWrite();
        if (v27)
        {
          v28 = v27;
          ne_log_obj();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v45;
            v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByFlowEndpoints:completionHandler:]";
            _os_log_error_impl(&dword_19BD16000, v29, OS_LOG_TYPE_ERROR, "%s: Failed to write flow Data", buf, 0xCu);
          }

          if (self)
            v31 = objc_getProperty(self, v30, 40, 1);
          else
            v31 = 0;
          v32 = v31;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_13;
          block[3] = &unk_1E3CC3B08;
          v49 = v10;
          v50 = v28;
          dispatch_async(v32, block);

        }
        if (v23 >= v26)

        ++v23;
      }
      while (v23 < objc_msgSend(v12, "count"));
    }
  }
  else
  {
    ne_log_obj();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByFlowEndpoints:completionHandler:]";
      v74 = 2048;
      v75 = objc_msgSend(v8, "count");
      v76 = 2048;
      v77 = objc_msgSend(v9, "count");
      _os_log_error_impl(&dword_19BD16000, v33, OS_LOG_TYPE_ERROR, "%s: Size of datagrams array (%lu) does not match size of remoteEndpoints array (%lu)", buf, 0x20u);
    }

    if (self)
      v35 = objc_getProperty(self, v34, 40, 1);
    else
      v35 = 0;
    v36 = v35;
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke;
    v68[3] = &unk_1E3CC4720;
    v69 = v10;
    dispatch_async(v36, v68);

    v12 = v69;
LABEL_48:

  }
}

- (void)writeDatagrams:(NSArray *)datagrams sentByEndpoints:(NSArray *)remoteEndpoints completionHandler:(void *)completionHandler
{
  NSArray *v8;
  NSArray *v9;
  void *v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  const char *v38;
  id Property;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  id v43;
  NSObject *v44;
  __int128 v45;
  NSArray *v46;
  NSArray *v47;
  _QWORD block[4];
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  NSArray *v69;
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v8 = datagrams;
  v9 = remoteEndpoints;
  v10 = completionHandler;
  v11 = -[NSArray count](v8, "count");
  v46 = v9;
  v47 = v8;
  if (v11 == -[NSArray count](v9, "count"))
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v12 = v8;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v65;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v65 != v15)
            objc_enumerationMutation(v12);
          if ((isa_nsdata(*(void **)(*((_QWORD *)&v64 + 1) + 8 * i)) & 1) == 0)
          {
            ne_log_obj();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByEndpoints:completionHandler:]";
              _os_log_error_impl(&dword_19BD16000, v37, OS_LOG_TYPE_ERROR, "%s: Datagrams array contains a non-NSData object", buf, 0xCu);
            }

            if (self)
              Property = objc_getProperty(self, v38, 40, 1);
            else
              Property = 0;
            v40 = Property;
            v62[0] = MEMORY[0x1E0C809B0];
            v62[1] = 3221225472;
            v62[2] = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_14;
            v62[3] = &unk_1E3CC4720;
            v63 = v10;
            dispatch_async(v40, v62);

            goto LABEL_48;
          }
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
        if (v14)
          continue;
        break;
      }
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v17 = v9;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v59;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v59 != v20)
            objc_enumerationMutation(v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            ne_log_obj();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByEndpoints:completionHandler:]";
              _os_log_error_impl(&dword_19BD16000, v41, OS_LOG_TYPE_ERROR, "%s: Remote endpoints array contains a non-NWEndpoint object", buf, 0xCu);
            }

            if (self)
              v43 = objc_getProperty(self, v42, 40, 1);
            else
              v43 = 0;
            v44 = v43;
            v56[0] = MEMORY[0x1E0C809B0];
            v56[1] = 3221225472;
            v56[2] = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_15;
            v56[3] = &unk_1E3CC4720;
            v57 = v10;
            dispatch_async(v44, v56);

            v12 = v17;
            goto LABEL_48;
          }
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        if (v19)
          continue;
        break;
      }
    }

    if (-[NSArray count](v12, "count"))
    {
      v23 = 0;
      *(_QWORD *)&v22 = 136315138;
      v45 = v22;
      do
      {
        -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v23, v45);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "address");
        v26 = -[NSArray count](v12, "count") - 1;
        if (v23 >= v26)
        {
          v51 = MEMORY[0x1E0C809B0];
          v52 = 3221225472;
          v53 = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_2;
          v54 = &unk_1E3CBF4E0;
          v55 = v10;
        }
        v27 = NEFlowWrite();
        if (v27)
        {
          v28 = v27;
          ne_log_obj();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v45;
            v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByEndpoints:completionHandler:]";
            _os_log_error_impl(&dword_19BD16000, v29, OS_LOG_TYPE_ERROR, "%s: Failed to write flow Data", buf, 0xCu);
          }

          if (self)
            v31 = objc_getProperty(self, v30, 40, 1);
          else
            v31 = 0;
          v32 = v31;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_16;
          block[3] = &unk_1E3CC3B08;
          v49 = v10;
          v50 = v28;
          dispatch_async(v32, block);

        }
        if (v23 >= v26)

        ++v23;
      }
      while (v23 < -[NSArray count](v12, "count"));
    }
  }
  else
  {
    ne_log_obj();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByEndpoints:completionHandler:]";
      v74 = 2048;
      v75 = -[NSArray count](v8, "count");
      v76 = 2048;
      v77 = -[NSArray count](v9, "count");
      _os_log_error_impl(&dword_19BD16000, v33, OS_LOG_TYPE_ERROR, "%s: Size of datagrams array (%lu) does not match size of remoteEndpoints array (%lu)", buf, 0x20u);
    }

    if (self)
      v35 = objc_getProperty(self, v34, 40, 1);
    else
      v35 = 0;
    v36 = v35;
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke;
    v68[3] = &unk_1E3CC4720;
    v69 = v10;
    dispatch_async(v36, v68);

    v12 = v69;
LABEL_48:

  }
}

- (NWEndpoint)localEndpoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NEAppProxyUDPFlow localFlowEndpoint](self, "localFlowEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CCEC78];
    -[NEAppProxyUDPFlow localFlowEndpoint](self, "localFlowEndpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointWithCEndpoint:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NWEndpoint *)v6;
}

- (id)description
{
  NSObject *v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t port;
  void *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[NEAppProxyFlow metaData](self, "metaData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppProxyUDPFlow localFlowEndpoint](self, "localFlowEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NEAppProxyUDPFlow localFlowEndpoint](self, "localFlowEndpoint");
    v2 = objc_claimAutoreleasedReturnValue();
    port = nw_endpoint_get_port(v2);
  }
  else
  {
    port = 0;
  }
  -[NEAppProxyFlow networkInterface](self, "networkInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NEAppProxyFlow isBound](self, "isBound");
  v10 = &stru_1E3CC53C8;
  if (v9)
    v10 = CFSTR("(bound)");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("UDP %@ local port %u interface %@%@"), v5, port, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  return v11;
}

- (OS_nw_endpoint)localFlowEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localFlowEndpoint, 0);
}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_14(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_15(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_11(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_13(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __56__NEAppProxyUDPFlow_readDatagramsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *i;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32); a2; a2 = *(_QWORD *)(a2 + 144))
  {
    objc_msgSend(v10, "addObject:", *(_QWORD *)(a2 + 128));
    objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v8);

  }
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__NEAppProxyUDPFlow_readDatagramsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

void __72__NEAppProxyUDPFlow_readDatagramsAndFlowEndpointsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *i;
  nw_endpoint_t address;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32); a2; a2 = *(_QWORD *)(a2 + 144))
  {
    objc_msgSend(v13, "addObject:", *(_QWORD *)(a2 + 128));
    address = nw_endpoint_create_address((const sockaddr *)a2);
    objc_msgSend(i, "addObject:", address);

  }
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = (void *)objc_msgSend(v13, "copy");
  v12 = (void *)objc_msgSend(i, "copy");
  (*(void (**)(uint64_t, void *, void *, void *))(v10 + 16))(v10, v11, v12, v9);

}

void __72__NEAppProxyUDPFlow_readDatagramsAndFlowEndpointsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

void __61__NEAppProxyUDPFlow_openWithLocalEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  -[NEAppProxyUDPFlow resetLocalEndpoint](v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)resetLocalEndpoint
{
  nw_endpoint_t address;
  void *v3;
  id v4;

  if (a1)
  {
    v4 = (id)NEFlowCopyProperty();
    if (isa_nsdata(v4))
    {
      address = nw_endpoint_create_address((const sockaddr *)objc_msgSend(objc_retainAutorelease(v4), "bytes"));
      v3 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = address;

    }
  }
}

void __65__NEAppProxyUDPFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  -[NEAppProxyUDPFlow resetLocalEndpoint](v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
