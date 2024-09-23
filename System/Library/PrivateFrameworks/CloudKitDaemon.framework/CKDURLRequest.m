@implementation CKDURLRequest

- (NSArray)requestOperations
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  NSArray *v6;
  NSArray *requestOperations;

  if (!objc_msgSend_count(self->_requestOperations, a2, v2))
  {
    objc_msgSend_generateRequestOperations(self, v4, v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    requestOperations = self->_requestOperations;
    self->_requestOperations = v6;

  }
  return self->_requestOperations;
}

- (NSInputStream)requestBodyStream
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  unint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend_requestOperations(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
  {
    objc_msgSend_container(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serverConfig(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerID(v9, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_maxBatchSize_(v12, v16, (uint64_t)v15);

    if (objc_msgSend_count(v4, v18, v19) <= v17)
    {
      objc_msgSend__tearDownStreamWriter(self, v20, v21);
      objc_msgSend__registerRequestOperationTypesForOperations_(self, v45, (uint64_t)v4);
      objc_msgSend_streamWriter(self, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setStreamedObjects_(v48, v49, (uint64_t)v4);

      objc_msgSend_streamWriter(self, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_open(v52, v53, v54);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v22 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v22;
      objc_msgSend_requestUUID(self, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v28;
      v58 = 2048;
      v59 = objc_msgSend_count(v4, v29, v30);
      v60 = 2048;
      v61 = v17;
      _os_log_impl(&dword_1BE990000, v25, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"This request has too many operations: %lu/%lu\", buf, 0x20u);

    }
    v31 = (void *)MEMORY[0x1E0C94FF8];
    v32 = *MEMORY[0x1E0C94B20];
    v33 = objc_msgSend_count(v4, v23, v24);
    objc_msgSend_errorWithDomain_code_format_(v31, v34, v32, 1020, CFSTR("Your request contains %ld items which is more than the maximum number of items in a single request (%ld)"), v33, v17);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v36, (uint64_t)v35);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v37 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
    {
      v39 = v37;
      objc_msgSend_requestUUID(self, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v42;
      _os_log_impl(&dword_1BE990000, v39, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Not returning a request body stream because there are no items to stream\", buf, 0xCu);

    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v38, *MEMORY[0x1E0C94B20], 2005, CFSTR("there is no operation associated with this request"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v43, (uint64_t)v9);
  }
  v44 = 0;
LABEL_15:

  return (NSInputStream *)v44;
}

- (CKDProtobufStreamWriter)streamWriter
{
  CKDProtobufStreamWriter *streamWriter;
  CKDProtobufStreamWriter *v4;
  const char *v5;
  uint64_t v6;
  uint64_t shouldCompressBody;
  const char *v8;
  CKDProtobufStreamWriter *v9;
  CKDProtobufStreamWriter *v10;
  const char *v11;
  _QWORD v13[4];
  id v14;
  id location;

  streamWriter = self->_streamWriter;
  if (!streamWriter)
  {
    v4 = [CKDProtobufStreamWriter alloc];
    shouldCompressBody = objc_msgSend_shouldCompressBody(self, v5, v6);
    v9 = (CKDProtobufStreamWriter *)objc_msgSend_initWithCompression_(v4, v8, shouldCompressBody);
    v10 = self->_streamWriter;
    self->_streamWriter = v9;

    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1BE9C581C;
    v13[3] = &unk_1E7830ED8;
    objc_copyWeak(&v14, &location);
    objc_msgSend_setLogRequestObjectBlock_(self->_streamWriter, v11, (uint64_t)v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    streamWriter = self->_streamWriter;
  }
  return streamWriter;
}

- (BOOL)shouldCompressBody
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_compressRequests(v3, v4, v5);

  return v6;
}

- (C2RequestOptions)requestOptions
{
  CKDURLRequest *v2;
  C2RequestOptions *requestOptions;
  C2RequestOptions *v4;
  C2RequestOptions *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  unint64_t v89;
  const char *v90;
  unint64_t v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  void *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  C2NetworkingDelegate *c2NetworkingDelegate;
  const char *v112;
  C2RequestOptions *v113;

  v2 = self;
  objc_sync_enter(v2);
  requestOptions = v2->_requestOptions;
  if (!requestOptions)
  {
    v4 = (C2RequestOptions *)objc_alloc_init(MEMORY[0x1E0D03788]);
    v5 = v2->_requestOptions;
    v2->_requestOptions = v4;

    objc_msgSend_container(v2, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerID(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_c2ContainerType(v11, v12, v13);
    objc_msgSend_setContainerType_(v2->_requestOptions, v15, v14);

    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_opt_class();
    objc_msgSend_requestUUID(v2, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v16, v21, (uint64_t)CFSTR("%@ requestUUID:%@"), v17, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIdentifier_(v2->_requestOptions, v23, (uint64_t)v22);

    v26 = objc_msgSend_qualityOfService(v2, v24, v25);
    objc_msgSend_setQualityOfService_(v2->_requestOptions, v27, v26);
    objc_msgSend_sharedURLSessionPool(CKDURLSessionPool, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = objc_msgSend_backgroundSessionConnectionPoolLimit(v30, v31, v32);

    if ((_DWORD)v22)
    {
      objc_msgSend_backgroundSessionConnectionPoolName(CKDURLSessionPool, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOutOfProcessPoolName_(v2->_requestOptions, v36, (uint64_t)v35);

    }
    v37 = objc_msgSend_allowsCellularAccess(v2, v33, v34);
    objc_msgSend_setAllowsCellularAccess_(v2->_requestOptions, v38, v37);
    v41 = objc_msgSend_allowsExpensiveNetworkAccess(v2, v39, v40);
    objc_msgSend_set_allowsExpensiveAccess_(v2->_requestOptions, v42, v41);
    v45 = objc_msgSend_allowsPowerNapScheduling(v2, v43, v44);
    objc_msgSend_set_allowsPowerNapScheduling_(v2->_requestOptions, v46, v45);
    objc_msgSend_timeoutIntervalForRequest(v2, v47, v48);
    objc_msgSend_set_timeoutIntervalForRequest_(v2->_requestOptions, v49, v50);
    objc_msgSend_timeoutIntervalForResource(v2, v51, v52);
    objc_msgSend_set_timeoutIntervalForResource_(v2->_requestOptions, v53, v54);
    objc_msgSend_applicationBundleIdentifierForNetworkAttribution(v2, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set_sourceApplicationBundleIdentifier_(v2->_requestOptions, v58, (uint64_t)v57);

    objc_msgSend_sourceApplicationSecondaryIdentifier(v2, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set_sourceApplicationSecondaryIdentifier_(v2->_requestOptions, v62, (uint64_t)v61);

    objc_msgSend_privacyProxyFailClosedOverride(v2, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPrivacyProxyFailClosedOverride_(v2->_requestOptions, v66, (uint64_t)v65);

    if ((objc_msgSend_sendRequestAnonymously(v2, v67, v68) & 1) == 0)
      objc_msgSend_set_appleIDContextSessionIdentifier_(v2->_requestOptions, v69, (uint64_t)CFSTR("com.apple.cloudkit"));
    objc_msgSend_setTlsPinning_(v2->_requestOptions, v69, 1);
    objc_msgSend_setAllowRouting_(v2->_requestOptions, v70, 1);
    objc_msgSend_container(v2, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serverConfig(v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(v2, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerID(v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend_allowExpiredDNSBehavior_(v76, v83, (uint64_t)v82);
    objc_msgSend_setAllowExpiredDNSBehavior_(v2->_requestOptions, v85, v84);

    v89 = objc_msgSend_resolvedDiscretionaryNetworkBehavior(v2, v86, v87);
    if (v89 <= 2)
      objc_msgSend_setDiscretionaryNetworkBehavior_(v2->_requestOptions, v88, v89);
    v91 = objc_msgSend_duetPreClearedMode(v2, v88, v89);
    if (v91 <= 2)
      objc_msgSend_setDuetPreClearedMode_(v2->_requestOptions, v90, v91);
    v92 = objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(v2, v90, v91);
    objc_msgSend_set_allowsRetryForBackgroundDataTasks_(v2->_requestOptions, v93, v92);
    objc_msgSend_metricOptionsForNetworkRequest_(MEMORY[0x1E0D03760], v94, (uint64_t)v2);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMetricOptions_(v2->_requestOptions, v96, (uint64_t)v95);

    objc_msgSend_container(v2, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceContext(v99, v100, v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_testServer(v102, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    if (v105 && (objc_msgSend_useLiveServer(v105, v106, v107) & 1) == 0)
    {
      objc_msgSend_networkingDelegate(v105, v108, v109);
      v110 = objc_claimAutoreleasedReturnValue();
      c2NetworkingDelegate = v2->_c2NetworkingDelegate;
      v2->_c2NetworkingDelegate = (C2NetworkingDelegate *)v110;

      objc_msgSend_setNetworkingDelegate_(v2->_requestOptions, v112, (uint64_t)v2->_c2NetworkingDelegate);
    }

    requestOptions = v2->_requestOptions;
  }
  v113 = requestOptions;
  objc_sync_exit(v2);

  return v113;
}

- (NSHTTPURLResponse)response
{
  return (NSHTTPURLResponse *)objc_getProperty(self, a2, 240, 1);
}

- (BOOL)allowsCellularAccess
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_allowsCellularAccess(v3, v4, v5);

  return v6;
}

- (double)timeoutIntervalForResource
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeoutIntervalForResource(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (BOOL)usesBackgroundSession
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_usesBackgroundSession(v3, v4, v5);

  return v6;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_allowsExpensiveNetworkAccess(v3, v4, v5);

  return v6;
}

- (unint64_t)duetPreClearedMode
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_duetPreClearedMode(v3, v4, v5);

  return v6;
}

- (double)timeoutIntervalForRequest
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeoutIntervalForRequest(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (id)defaultParserForContentType:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  CKDProtobufResponseBodyParser *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  objc_class *v41;
  void *v42;
  const char *v43;
  CKDJSONResponseBodyParser *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  CKDPlistResponseBodyParser *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  CKDPlaintextResponseBodyParser *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  void *v85;
  CKDPlaintextResponseBodyParser *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  _QWORD v96[5];
  _QWORD v97[5];
  _QWORD v98[5];
  _QWORD v99[5];
  _QWORD v100[5];

  v4 = a3;
  if (!objc_msgSend_length(v4, v5, v6))
  {
    v17 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend_rangeOfString_options_(v4, v7, *MEMORY[0x1E0C95360], 1) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_rangeOfString_options_(v4, v8, (uint64_t)CFSTR("application/x-protobuf"), 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend_rangeOfString_options_(v4, v9, (uint64_t)CFSTR("application/json"), 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend_rangeOfString_options_(v4, v10, (uint64_t)CFSTR("text/xml"), 1) == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend_rangeOfString_options_(v4, v11, (uint64_t)CFSTR("application/x-apple-plist"), 1) == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend_rangeOfString_options_(v4, v12, (uint64_t)CFSTR("application/xml"), 1) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend_rangeOfString_options_(v4, v13, (uint64_t)CFSTR("text/plain"), 1) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend_rangeOfString_options_(v4, v14, (uint64_t)CFSTR("application/x-x509-ca-cert"), 1) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v17 = 0;
            goto LABEL_19;
          }
          v86 = [CKDPlaintextResponseBodyParser alloc];
          v89 = objc_msgSend_qualityOfService(self, v87, v88);
          v17 = (void *)objc_msgSend_initWithQoS_(v86, v90, v89);
          v96[0] = MEMORY[0x1E0C809B0];
          v96[1] = 3221225472;
          v96[2] = sub_1BEA57748;
          v96[3] = &unk_1E7830E50;
          v96[4] = self;
          objc_msgSend_setObjectParsedBlock_(v17, v91, (uint64_t)v96);
          objc_msgSend_shared(CKDTrafficLogger, v92, v93);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_requestUUID(self, v94, v95);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = &unk_1E7830E90;
        }
        else
        {
          v74 = [CKDPlaintextResponseBodyParser alloc];
          v77 = objc_msgSend_qualityOfService(self, v75, v76);
          v17 = (void *)objc_msgSend_initWithQoS_(v74, v78, v77);
          v97[0] = MEMORY[0x1E0C809B0];
          v97[1] = 3221225472;
          v97[2] = sub_1BEA57698;
          v97[3] = &unk_1E7830E50;
          v97[4] = self;
          objc_msgSend_setObjectParsedBlock_(v17, v79, (uint64_t)v97);
          objc_msgSend_shared(CKDTrafficLogger, v80, v81);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_requestUUID(self, v82, v83);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = &unk_1E7830E70;
        }
        objc_msgSend_logResponseConfigurationWithRequestUUID_format_messageClass_completionHandler_(v35, v84, (uint64_t)v38, 3, 0, v85);
      }
      else
      {
        v55 = [CKDPlistResponseBodyParser alloc];
        v58 = objc_msgSend_qualityOfService(self, v56, v57);
        v17 = (void *)objc_msgSend_initWithQoS_(v55, v59, v58);
        v98[0] = MEMORY[0x1E0C809B0];
        v98[1] = 3221225472;
        v98[2] = sub_1BEA575E8;
        v98[3] = &unk_1E7830DC8;
        v98[4] = self;
        objc_msgSend_setObjectParsedBlock_(v17, v60, (uint64_t)v98);
        objc_msgSend_shared(CKDTrafficLogger, v61, v62);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_requestUUID(self, v63, v64);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_logResponseConfigurationWithRequestUUID_format_messageClass_completionHandler_(v35, v65, (uint64_t)v38, 2, 0, &unk_1E7830E28);
      }
    }
    else
    {
      v44 = [CKDJSONResponseBodyParser alloc];
      v47 = objc_msgSend_qualityOfService(self, v45, v46);
      v17 = (void *)objc_msgSend_initWithQoS_(v44, v48, v47);
      v99[0] = MEMORY[0x1E0C809B0];
      v99[1] = 3221225472;
      v99[2] = sub_1BEA57538;
      v99[3] = &unk_1E7830DC8;
      v99[4] = self;
      objc_msgSend_setObjectParsedBlock_(v17, v49, (uint64_t)v99);
      objc_msgSend_shared(CKDTrafficLogger, v50, v51);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_requestUUID(self, v52, v53);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logResponseConfigurationWithRequestUUID_format_messageClass_completionHandler_(v35, v54, (uint64_t)v38, 1, 0, &unk_1E7830E08);
    }
  }
  else
  {
    v18 = [CKDProtobufResponseBodyParser alloc];
    v21 = objc_msgSend_qualityOfService(self, v19, v20);
    v24 = objc_msgSend_expectedResponseClass(self, v22, v23);
    v27 = objc_msgSend_parsingStandaloneMessage(self, v25, v26);
    v17 = (void *)objc_msgSend_initWithQoS_messageClass_parsingStandaloneMessage_(v18, v28, v21, v24, v27);
    v100[0] = MEMORY[0x1E0C809B0];
    v100[1] = 3221225472;
    v100[2] = sub_1BE9C360C;
    v100[3] = &unk_1E7830DC8;
    v100[4] = self;
    objc_msgSend_setObjectParsedBlock_(v17, v29, (uint64_t)v100);
    if (objc_msgSend_parsingStandaloneMessage(self, v30, v31))
      v34 = 4;
    else
      v34 = 0;
    objc_msgSend_shared(CKDTrafficLogger, v32, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestUUID(self, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (objc_class *)objc_msgSend_expectedResponseClass(self, v39, v40);
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logResponseConfigurationWithRequestUUID_format_messageClass_completionHandler_(v35, v43, (uint64_t)v38, v34, v42, &unk_1E7830DE8);

  }
LABEL_19:
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(self, v15, v16);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v66, v67, (uint64_t)CFSTR("TestRepeatedParseResults"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend_BOOLValue(v68, v69, v70);
    objc_msgSend_setTestRepeatedParseResults_(v17, v72, v71);

  }
LABEL_21:

  return v17;
}

- (BOOL)parsingStandaloneMessage
{
  return 0;
}

- (Class)expectedResponseClass
{
  return (Class)objc_opt_class();
}

- (id)ckShortDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestUUID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@: %p %@>"), v5, self, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  BOOL v15;

  objc_msgSend_operation(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_useAnonymousToServerShareParticipants(v10, v11, v12))
    v15 = objc_msgSend_databaseScope(self, v13, v14) == 3;
  else
    v15 = 0;

  return v15;
}

- (BOOL)expectDelayBeforeRequestBegins
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_expectDelayBeforeRequestBegins(v3, v4, v5);

  return v6;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;

  v6 = a4;
  v7 = a3;
  v9 = objc_alloc(MEMORY[0x1E0C99E08]);
  v13 = (void *)objc_msgSend_initWithCapacity_(v9, v10, 7);
  if (v7)
  {
    objc_msgSend_requestUUID(self, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v15, (uint64_t)CFSTR("UUID"), v14);

  }
  if (v6)
  {
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v11, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isFinished(self, v17, v18))
      objc_msgSend_addObject_(v16, v19, (uint64_t)CFSTR("finished"));
    if (objc_msgSend_isCancelled(self, v19, v20))
      objc_msgSend_addObject_(v16, v21, (uint64_t)CFSTR("cancelled"));
    if (objc_msgSend_count(v16, v21, v22))
    {
      objc_msgSend_componentsJoinedByString_(v16, v23, (uint64_t)CFSTR("|"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v26, (uint64_t)CFSTR("stateFlags"), v25);

    }
    objc_msgSend_urlSessionTask(self, v23, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v27;
    if (v27)
    {
      v31 = (void *)MEMORY[0x1E0CB37E8];
      v32 = objc_msgSend_taskIdentifier(v27, v28, v29);
      objc_msgSend_numberWithUnsignedInteger_(v31, v33, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v35, (uint64_t)CFSTR("dataTaskID"), v34);

      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v36, (uint64_t)CFSTR("dataTask"), v30);
    }
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v28, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_usesBackgroundSession(self, v38, v39))
      objc_msgSend_addObject_(v37, v40, (uint64_t)CFSTR("background"));
    else
      objc_msgSend_addObject_(v37, v40, (uint64_t)CFSTR("foreground"));
    if (objc_msgSend_allowsCellularAccess(self, v41, v42))
      objc_msgSend_addObject_(v37, v43, (uint64_t)CFSTR("allows-cellular"));
    else
      objc_msgSend_addObject_(v37, v43, (uint64_t)CFSTR("deny-cellular"));
    if (objc_msgSend_allowsExpensiveNetworkAccess(self, v44, v45))
      objc_msgSend_addObject_(v37, v46, (uint64_t)CFSTR("allows-expensive"));
    else
      objc_msgSend_addObject_(v37, v46, (uint64_t)CFSTR("deny-expensive"));
    objc_msgSend_componentsJoinedByString_(v37, v47, (uint64_t)CFSTR("|"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v49, (uint64_t)CFSTR("flags"), v48);

    objc_msgSend_error(self, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v52;
    if (v52)
    {
      if (a5)
      {
        objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v52, v53, 1, 1, 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v57, (uint64_t)CFSTR("error"), v56);

      }
      else
      {
        objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v53, (uint64_t)CFSTR("error"), v52);
      }
    }
    objc_msgSend_request(self, v53, v54);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v58, (uint64_t)CFSTR("request"), v60);
    if (objc_msgSend_isErrorInducerRequest(self, v58, v59))
      objc_msgSend_addObject_(v37, v61, (uint64_t)CFSTR("errorInducer"));

  }
  return v13;
}

- (CKDProtocolTranslator)translator
{
  return self->_translator;
}

- (void)setUrlSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (void)_finishOnLifecycleQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  CKDURLRequest *v9;
  _QWORD *v10;
  os_log_t *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  CKDURLRequest *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  os_log_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  CKDURLRequest *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  const char *v77;
  void *started;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  double v88;
  double v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  _BOOL8 v109;
  os_log_t v110;
  NSObject *v111;
  const char *v112;
  uint64_t v113;
  CKDURLRequest *v114;
  const char *v115;
  uint64_t v116;
  CKDURLRequest *v117;
  const char *v118;
  const char *v119;
  os_log_t v120;
  const char *v121;
  uint64_t v122;
  NSObject *v123;
  const char *v124;
  uint64_t v125;
  CKDURLRequest *v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  NSObject *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  os_signpost_id_t v139;
  NSObject *v140;
  const char *v141;
  uint64_t v142;
  CKDURLRequest *v143;
  const char *v144;
  uint64_t v145;
  CKDURLRequest *v146;
  uint8_t buf[4];
  CKDURLRequest *v148;
  __int16 v149;
  CKDURLRequest *v150;
  __int16 v151;
  CKDURLRequest *v152;
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lifecycleQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend__wrapErrorIfNecessary_(self, v8, (uint64_t)v4);
  v9 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();

  v10 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = (os_log_t *)MEMORY[0x1E0C952E0];
  v12 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v12;
    objc_msgSend_requestUUID(self, v16, v17);
    v18 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v148 = v18;
    v149 = 2112;
    v150 = v9;
    _os_log_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Finishing with error %@\", buf, 0x16u);

  }
  objc_msgSend_serverProvidedAutoBugCaptureReason(self, v13, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend__triggerAutoBugCaptureWithErrorPayload_(self, v20, (uint64_t)v9);
  objc_msgSend_serverProvidedTapToRadarRequest(self, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v25 = (void *)v22;
    objc_msgSend_currentProcess(CKDDaemonProcess, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_processType(v26, v27, v28);

    if (!v29)
    {
      objc_msgSend_sharedManager(MEMORY[0x1E0C951D8], v23, v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_serverProvidedTapToRadarRequest(self, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_triggerTapToRadarWithRequest_(v30, v34, (uint64_t)v33);

    }
  }
  if ((objc_msgSend_markAsFinished(self, v23, v24) & 1) != 0)
  {
    if (objc_msgSend_isCancelled(self, v35, v36))
    {
      v39 = (void *)MEMORY[0x1E0C94FF8];
      v40 = *MEMORY[0x1E0C94B20];
      objc_msgSend_requestUUID(self, v37, v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v39, v42, v40, 1, CFSTR("Request %@ was cancelled"), v41);
      v43 = objc_claimAutoreleasedReturnValue();

      v9 = (CKDURLRequest *)v43;
    }
    if (*v10 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v44 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
    {
      v140 = v44;
      objc_msgSend_requestUUID(self, v141, v142);
      v143 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v144, v145);
      v146 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v148 = v143;
      v149 = 2114;
      v150 = v146;
      v151 = 2112;
      v152 = v9;
      _os_log_debug_impl(&dword_1BE990000, v140, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Will finish request %{public}@ with error %@\", buf, 0x20u);

    }
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E0DE7910], v45, (uint64_t)self, sel_performRequest, 0);
    objc_msgSend_shared(CKDTrafficLogger, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestUUID(self, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishRequestLogWithRequestUUID_completionHandler_(v48, v52, (uint64_t)v51, &unk_1E7831098);

    objc_msgSend_setError_(self, v53, (uint64_t)v9);
    v54 = self;
    objc_msgSend_operation(v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateRequestWentOut(v54, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      objc_msgSend_metrics(v54, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_metrics(v54, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateRequestWentOut(v54, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_date(MEMORY[0x1E0C99D68], v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateRequestWentOut(v54, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceDate_(v72, v76, (uint64_t)v75);
      started = (void *)objc_msgSend_newRangeWithOperationState_startDate_duration_(v66, v77, 1, v69);
      objc_msgSend_addRange_(v63, v79, (uint64_t)started);

      v11 = (os_log_t *)MEMORY[0x1E0C952E0];
    }
    objc_msgSend_date(MEMORY[0x1E0C99D68], v61, v62);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_metrics(v54, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startDate(v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceDate_(v80, v87, (uint64_t)v86);
    v89 = v88;
    objc_msgSend_metrics(v54, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDuration_(v92, v93, v94, v89);

    objc_msgSend_metrics(v54, v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timingData(v54, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_request_didFinishWithMetrics_w3cNavigationTiming_(v57, v101, (uint64_t)v54, v97, v100);

    objc_msgSend_invokeCompletionBlock(v54, v102, v103);
    objc_msgSend_setRequestProgressBlock_(v54, v104, 0);
    objc_msgSend_setResponseProgressBlock_(v54, v105, 0);
    objc_msgSend_dateRequestWentOut(v54, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (v108)
      v109 = !v54->_didFinishLoading;
    else
      v109 = 0;

    objc_msgSend_tearDownResourcesAndReleaseTheZoneLocks_(v54, v118, v109);
    objc_msgSend_setDateRequestWentOut_(v54, v119, 0);
    if (*v10 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v120 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      v123 = v120;
      objc_msgSend_requestUUID(v54, v124, v125);
      v126 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v148 = v126;
      v149 = 2112;
      v150 = v54;
      v151 = 2112;
      v152 = v9;
      _os_log_impl(&dword_1BE990000, v123, OS_LOG_TYPE_INFO, "req: %{public}@, \"Did finish request %@ with error %@\", buf, 0x20u);

    }
    objc_msgSend_signpost(v54, v121, v122);
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    if (v127)
    {
      objc_msgSend_signpost(v54, v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_log(v130, v131, v132);
      v133 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_signpost(v54, v134, v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = objc_msgSend_identifier(v136, v137, v138);

      if (v139 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v133))
      {
        *(_DWORD *)buf = 138412290;
        v148 = v9;
        _os_signpost_emit_with_name_impl(&dword_1BE990000, v133, OS_SIGNPOST_INTERVAL_END, v139, "CKDURLRequest", "Error=%{signpost.description:attribute}@ ", buf, 0xCu);
      }

    }
  }
  else
  {
    if (*v10 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v110 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      v111 = v110;
      objc_msgSend_requestUUID(self, v112, v113);
      v114 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v115, v116);
      v117 = (CKDURLRequest *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v148 = v114;
      v149 = 2114;
      v150 = v117;
      _os_log_impl(&dword_1BE990000, v111, OS_LOG_TYPE_INFO, "req: %{public}@, \"Warn: request %{public}@ was already marked as finished\", buf, 0x16u);

    }
  }

}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (CKSignpost)signpost
{
  return self->_signpost;
}

- (CKDOperationMetrics)metrics
{
  return self->_metrics;
}

- (NSDate)dateRequestWentOut
{
  return (NSDate *)objc_getProperty(self, a2, 304, 1);
}

- (CKDResponseBodyParser)responseBodyParser
{
  return self->_responseBodyParser;
}

- (id)operationRequestWithType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend_setRequest_(v4, v6, (uint64_t)v5);

  CKCreateGUID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_request(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationUUID_(v10, v11, (uint64_t)v7);

  objc_msgSend_request(v4, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setType_(v14, v15, v3);

  return v4;
}

- (void)_registerRequestOperationTypesForOperations:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  const char *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_setCountsByRequestOperationType_(self, v6, (uint64_t)v5);

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v45, v49, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v46;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v13);
        objc_msgSend_countsByRequestOperationType(self, v9, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_request(v14, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend_type(v19, v20, v21);
        objc_msgSend_numberWithInt_(v16, v23, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v15, v25, (uint64_t)v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v29 = (void *)MEMORY[0x1E0CB37E8];
          v30 = objc_msgSend_integerValue(v26, v27, v28);
          objc_msgSend_numberWithInteger_(v29, v31, v30 + 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v32 = &unk_1E78B0100;
        }
        objc_msgSend_countsByRequestOperationType(self, v27, v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_request(v14, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend_type(v37, v38, v39);
        objc_msgSend_numberWithInt_(v34, v41, v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v33, v43, (uint64_t)v32, v42);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v45, v49, 16);
    }
    while (v11);
  }

}

- (NSMutableDictionary)countsByRequestOperationType
{
  return self->_countsByRequestOperationType;
}

- (void)prepareRequestOperationsForRequest:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  NSArray *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  unint64_t v51;
  const char *v52;
  void *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  void *v97;
  const char *v98;
  void *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  void *v126;
  uint64_t v127;
  const char *v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  void *v134;
  const char *v135;
  const char *v136;
  void *v137;
  const char *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  int v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t isAppleInternalInstall;
  const char *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t HasValidatedEntitlements;
  const char *v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t RequestOptions;
  const char *v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  const char *v202;
  NSArray *requestOperations;
  void *v204;
  const char *v205;
  SEL v206;
  NSArray *v207;
  void *v208;
  id v209;
  void *v210;
  _QWORD v211[5];
  id v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  _BYTE v217[128];
  uint64_t v218;

  v218 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_requestOperations(self, v6, v7);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v20, v21, (uint64_t)CFSTR("FakeContainerIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = v22;

      v17 = v23;
    }

  }
  objc_msgSend_firstObject(v8, v18, v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v24;
  if (v24)
  {
    v209 = v5;
    objc_msgSend_header(v24, v25, v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      v30 = (void *)objc_opt_new();
      objc_msgSend_setHeader_(v27, v31, (uint64_t)v30);
    }
    objc_msgSend_applicationBundleIdentifierForContainerAccess(self, v28, v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend_setApplicationBundle_(v30, v32, (uint64_t)v34);
    }
    else
    {
      objc_msgSend_applicationBundleIdentifierForContainerAccess(v11, v32, v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setApplicationBundle_(v30, v36, (uint64_t)v35);

    }
    objc_msgSend_applicationVersion(v11, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setApplicationVersion_(v30, v40, (uint64_t)v39);

    if (objc_msgSend_includeContainerServerInfo(self, v41, v42))
    {
      objc_msgSend_setApplicationContainer_(v30, v43, (uint64_t)v17);
      objc_msgSend_containerID(v11, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_environment(v47, v48, v49) == 1)
        objc_msgSend_setApplicationContainerEnvironment_(v30, v50, 1);
      else
        objc_msgSend_setApplicationContainerEnvironment_(v30, v50, 2);

    }
    v207 = v8;
    v51 = objc_msgSend_databaseScope(self, v43, v44);
    v208 = v17;
    v206 = a2;
    v53 = v27;
    if (v51 > 4)
      objc_msgSend_setTargetDatabase_(v30, v52, 1);
    else
      objc_msgSend_setTargetDatabase_(v30, v52, dword_1BECBB530[v51]);
    CKProductType();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDeviceHardwareVersion_(v30, v55, (uint64_t)v54);

    CKProductVersion();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDeviceSoftwareVersion_(v30, v57, (uint64_t)v56);

    objc_msgSend_operation(self, v58, v59);
    v213 = 0u;
    v214 = 0u;
    v215 = 0u;
    v216 = 0u;
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceContext(v210, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_throttleManager(v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allThrottles(v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v213, v217, 16);
    if (v70)
    {
      v73 = v70;
      v74 = *(_QWORD *)v214;
      do
      {
        for (i = 0; i != v73; ++i)
        {
          if (*(_QWORD *)v214 != v74)
            objc_enumerationMutation(v68);
          v76 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * i);
          if (objc_msgSend_isServerThrottle(v76, v71, v72))
          {
            objc_msgSend_label(v76, v71, v72);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            if (v79)
            {
              objc_msgSend_label(v76, v77, v78);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addActiveThrottlingLabel_(v30, v81, (uint64_t)v80);

            }
          }
        }
        v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v71, (uint64_t)&v213, v217, 16);
      }
      while (v73);
    }

    v27 = v53;
    v8 = v207;
    if ((objc_msgSend_sendRequestAnonymously(self, v82, v83) & 1) == 0)
    {
      objc_msgSend_hardwareID(v11, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDeviceHardwareID_(v30, v87, (uint64_t)v86);

      objc_msgSend_deviceID(v11, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v90, v91, v92))
      {
        objc_msgSend_CKDPIdentifier_Device(v90, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDeviceIdentifier_(v30, v96, (uint64_t)v95);

      }
      CKDeviceUDID();
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDeviceUDID_(v30, v98, (uint64_t)v97);

      CKDeviceSerialNumber();
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDeviceSerialNumber_(v30, v100, (uint64_t)v99);

      objc_msgSend_deviceName(v11, v101, v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDeviceAssignedName_(v30, v104, (uint64_t)v103);

    }
    v105 = objc_msgSend_isolationLevel(self, v84, v85);
    objc_msgSend_setIsolationLevel_(v30, v106, v105);
    v109 = objc_msgSend_requestOriginator(self, v107, v108);
    objc_msgSend_setRequestOriginator_(v30, v110, v109);
    objc_msgSend_operationGroupName(self, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    if (v113)
    {
      objc_msgSend_operationGroupName(self, v114, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOperationGroupName_(v30, v117, (uint64_t)v116);

    }
    objc_msgSend_operationGroupQuantity(self, v114, v115);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    if (v118)
    {
      objc_msgSend_operationGroupQuantity(self, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = objc_msgSend_unsignedLongLongValue(v121, v122, v123);
      objc_msgSend_setOperationGroupQuantity_(v30, v125, v124);

    }
    v126 = (void *)MEMORY[0x1E0CB34D0];
    v127 = objc_opt_class();
    objc_msgSend_bundleForClass_(v126, v128, v127);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_infoDictionary(v129, v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v132, v133, *MEMORY[0x1E0C9AE78]);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDeviceLibraryName_(v30, v135, (uint64_t)v134);

    objc_msgSend_objectForKeyedSubscript_(v132, v136, *MEMORY[0x1E0C9AAF0]);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDeviceLibraryVersion_(v30, v138, (uint64_t)v137);

    objc_msgSend_request(v27, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend_type(v141, v142, v143);

    if (v144 > 299)
    {
      if (v144 != 800 && v144 != 300)
        goto LABEL_45;
    }
    else if (v144 != 210 && v144 != 220)
    {
      goto LABEL_45;
    }
    v147 = (void *)objc_opt_new();
    objc_msgSend_setLocale_(v30, v148, (uint64_t)v147);

    objc_msgSend_languageCode(v11, v149, v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_locale(v30, v152, v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLanguageCode_(v154, v155, (uint64_t)v151);

    objc_msgSend_regionCode(v11, v156, v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_locale(v30, v159, v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRegionCode_(v161, v162, (uint64_t)v158);

LABEL_45:
    if (!v11)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v145, v146);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v204, v205, (uint64_t)v206, self, CFSTR("CKDURLRequest.m"), 556, CFSTR("Expected non-nil container"));

    }
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v145, v146);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v163, v164, v165);
    objc_msgSend_setDeviceSoftwareIsAppleInternal_(v30, v167, isAppleInternalInstall);

    objc_msgSend_protocolVersion(CKDMMCS, v168, v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMmcsProtocolVersion_(v30, v171, (uint64_t)v170);

    objc_msgSend_operationInfo(v210, v172, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    HasValidatedEntitlements = objc_msgSend_clientHasValidatedEntitlements(v174, v175, v176);
    objc_msgSend_setEntitlementsValidated_(v30, v178, HasValidatedEntitlements);

    if (objc_msgSend_requestGETPreAuth(self, v179, v180))
    {
      v181 = (void *)objc_opt_new();
      objc_msgSend_setAssetAuthorizeGetRequestOptions_(v30, v182, (uint64_t)v181);

      RequestOptions = MMCSICloudAuthGetRequestOptions();
      objc_msgSend_assetAuthorizeGetRequestOptions(v30, v184, v185);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setContentRequestAuthorizeGetOptions_(v186, v187, RequestOptions);

      v188 = (void *)objc_opt_new();
      objc_msgSend_assetAuthorizeGetRequestOptions(v30, v189, v190);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setContentRequestHeaders_(v191, v192, (uint64_t)v188);

      objc_msgSend_protocolHeaders(CKDMMCS, v193, v194);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v211[0] = MEMORY[0x1E0C809B0];
      v211[1] = 3221225472;
      v211[2] = sub_1BE9A1E10;
      v211[3] = &unk_1E7830D00;
      v211[4] = self;
      v212 = v30;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v195, v196, (uint64_t)v211);

    }
    v17 = v208;
    v5 = v209;
  }
  objc_msgSend_lastObject(v8, v25, v26);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_request(v197, v198, v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLast_(v200, v201, 1);

  objc_msgSend__finalizeRequestOperations_request_(self, v202, (uint64_t)v8, v5);
  requestOperations = self->_requestOperations;
  self->_requestOperations = v8;

}

- (id)createAssetAuthorizeGetRequestOptionsHeaderInfoWithKey:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  const char *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend_setHeaderKey_(v7, v8, (uint64_t)v6);

  objc_msgSend_setHeaderValue_(v7, v9, (uint64_t)v5);
  return v7;
}

- (NSString)applicationBundleIdentifierForContainerAccess
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierForContainerAccess(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)operationGroupID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationGroupID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)networkServiceType
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_networkServiceType(v3, v4, v5);

  return v6;
}

- (NSString)httpMethod
{
  return (NSString *)CFSTR("POST");
}

- (BOOL)hasRequestBody
{
  return 1;
}

- (int64_t)qualityOfService
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  int64_t v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_qualityOfService(v3, v4, v5);

  return v6;
}

- (NSString)operationGroupName
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationGroupName(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)sendRequestAnonymously
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  if (objc_msgSend_allowsAnonymousAccount(self, a2, v2)
    && (objc_msgSend_preferAnonymousRequests(self, v4, v5) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend_requiresCKAnonymousUserIDs(self, v4, v5);
  }
}

- (BOOL)preferAnonymousRequests
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_preferAnonymousRequests(v3, v4, v5);

  return v6;
}

- (int64_t)databaseScope
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  int64_t v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend_databaseScope(v3, v4, v5);
  else
    v6 = 2;

  return v6;
}

- (CKDOperation)operation
{
  id WeakRetained;
  void *v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  if (!WeakRetained)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v4 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_FAULT))
    {
      v6 = v4;
      objc_msgSend_requestUUID(self, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_fault_impl(&dword_1BE990000, v6, OS_LOG_TYPE_FAULT, "req: %{public}@, \"CKDURLRequest with no owning operation\", (uint8_t *)&v10, 0xCu);

    }
  }
  return (CKDOperation *)WeakRetained;
}

- (BOOL)isFinished
{
  CKDURLRequest *v2;
  BOOL finished;

  v2 = self;
  objc_sync_enter(v2);
  finished = v2->_finished;
  objc_sync_exit(v2);

  return finished;
}

- (NSString)requestContentType
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  __CFString *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;

  objc_msgSend_url(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_port(v4, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_url(self, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_port(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v15, (uint64_t)CFSTR(":%@"), v14);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = &stru_1E7838F48;
  }

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_url(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scheme(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_url(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_host(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protobufOperationName(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v17, v33, (uint64_t)CFSTR("%@; desc=\"%@://%@%@/static/protobuf/CloudDB/CloudDBClient.desc\"; messageType=%@; delimited=true"),
    CFSTR("application/x-protobuf"),
    v23,
    v29,
    v16,
    v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v34;
}

- (NSURL)url
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_serverType(self, a2, v2) == 5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("CKDURLRequest.m"), 1286, CFSTR("If you set a server type of CKServerTypeOther, you must provide your own url"));

    return (NSURL *)0;
  }
  else
  {
    objc_msgSend_container(self, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_serverType(self, v11, v12);
    v16 = objc_msgSend_partitionType(self, v14, v15);
    objc_msgSend_baseURLForServerType_partitionType_(v10, v17, v13, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend_path(self, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLByAppendingPathComponent_(v18, v22, (uint64_t)v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v24 = (void *)*MEMORY[0x1E0C952E0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
      {
        v25 = v24;
        objc_msgSend_requestUUID(self, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend_serverType(self, v29, v30);
        v34 = objc_msgSend_partitionType(self, v32, v33);
        objc_msgSend_container(self, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138544130;
        v39 = v28;
        v40 = 2048;
        v41 = v31;
        v42 = 2048;
        v43 = v34;
        v44 = 2112;
        v45 = v37;
        _os_log_error_impl(&dword_1BE990000, v25, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Couldn't determine base URL for server type %ld partition type %ld off container %@\", (uint8_t *)&v38, 0x2Au);

      }
      v23 = 0;
    }

    return (NSURL *)v23;
  }
}

- (CKDContainer)container
{
  return self->_container;
}

- (int64_t)serverType
{
  uint64_t v2;
  CKDURLRequest *v3;
  int64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *Object;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  dispatch_once_t *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  id v51;
  unsigned int v52;
  __int128 v54;
  CKDURLRequest *v55;
  void *v56;
  void *v57;
  NSObject *log;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  CKDURLRequest *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v3 = self;
  v72 = *MEMORY[0x1E0C80C00];
  if (self->_haveCachedServerType)
    return self->_cachedServerType;
  objc_msgSend_requestOperationClasses(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v5, v6, v7);

  if (v8)
  {
    objc_msgSend_requestOperationClasses(v3, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    Object = (void *)objc_msgSend_firstObject(v11, v12, v13);
    objc_msgSend_options(Object, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)CFSTR("serverType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_requestOperationClasses(v3, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_count(v22, v23, v24);

    if (v25 >= 2)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v55 = v3;
      objc_msgSend_requestOperationClasses(v3, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v59, v71, 16);
      if (v30)
      {
        v34 = v30;
        v35 = *(_QWORD *)v60;
        v36 = (dispatch_once_t *)MEMORY[0x1E0C95300];
        *(_QWORD *)&v33 = 138544130;
        v54 = v33;
        do
        {
          v37 = 0;
          do
          {
            if (*(_QWORD *)v60 != v35)
              objc_enumerationMutation(v28);
            v38 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v37);
            objc_msgSend_options(v38, v31, v32, v54);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v39, v40, (uint64_t)CFSTR("serverType"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend_isEqualToString_(v41, v42, (uint64_t)v19) & 1) == 0)
            {
              if (*v36 != -1)
                dispatch_once(v36, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v43 = (void *)*MEMORY[0x1E0C952E0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
              {
                log = v43;
                objc_msgSend_requestUUID(v55, v44, v45);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_requestOperationClasses(v55, v46, v47);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = (void *)objc_msgSend_firstObject(v57, v48, v49);
                *(_DWORD *)buf = v54;
                v64 = v56;
                v65 = 2112;
                v66 = v55;
                v67 = 2114;
                v68 = v50;
                v69 = 2114;
                v70 = v38;
                v51 = v50;
                _os_log_error_impl(&dword_1BE990000, log, OS_LOG_TYPE_ERROR, "req: %{public}@, \"%@ attempted to send request %{public}@ along with %{public}@, but they hit different servers\", buf, 0x2Au);

                v36 = (dispatch_once_t *)MEMORY[0x1E0C95300];
              }
            }

            ++v37;
          }
          while (v34 != v37);
          v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v59, v71, 16);
        }
        while (v34);
      }

      v3 = v55;
    }
    v4 = 5;
    if (objc_msgSend_length(v19, v26, v27))
    {
      v52 = sub_1BE9C750C(v19);
      if (v52 >= 4)
        v4 = 5;
      else
        v4 = v52;
    }

  }
  else
  {
    v4 = 5;
  }
  v3->_cachedServerType = v4;
  v3->_haveCachedServerType = 1;
  return v4;
}

- (NSString)path
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *Object;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  __CFString *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend_requestOperationClasses(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (!v7)
    return (NSString *)0;
  objc_msgSend_requestOperationClasses(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  Object = (void *)objc_msgSend_firstObject(v10, v11, v12);
  objc_msgSend_options(Object, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)CFSTR("endpoint"));
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_requestOperationClasses(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v21, v22, v23);

  if (v24 >= 2)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend_requestOperationClasses(self, v25, v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v40, v44, 16);
    if (v29)
    {
      v32 = v29;
      v33 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v41 != v33)
            objc_enumerationMutation(v27);
          objc_msgSend_options(*(void **)(*((_QWORD *)&v40 + 1) + 8 * i), v30, v31);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)CFSTR("endpoint"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend_isEqualToString_(v37, v38, (uint64_t)v18) & 1) == 0)
          {

            v18 = CFSTR("/api/client/batch");
            goto LABEL_14;
          }

        }
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v40, v44, 16);
        if (v32)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return (NSString *)v18;
}

- (int64_t)partitionType
{
  uint64_t v2;
  CKDURLRequest *v3;
  int64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *Object;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  dispatch_once_t *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  id v51;
  int v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v57;
  CKDURLRequest *v58;
  void *v59;
  void *v60;
  NSObject *log;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  CKDURLRequest *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v3 = self;
  v75 = *MEMORY[0x1E0C80C00];
  if (!self->_haveCachedPartitionType)
  {
    objc_msgSend_requestOperationClasses(self, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend_count(v5, v6, v7);

    if (!v8)
    {
      v4 = 3;
LABEL_30:
      v3->_cachedPartitionType = v4;
      v3->_haveCachedPartitionType = 1;
      return v4;
    }
    objc_msgSend_requestOperationClasses(v3, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    Object = (void *)objc_msgSend_firstObject(v11, v12, v13);
    objc_msgSend_options(Object, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)CFSTR("partitionType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_requestOperationClasses(v3, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_count(v22, v23, v24);

    if (v25 >= 2)
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v58 = v3;
      objc_msgSend_requestOperationClasses(v3, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v62, v74, 16);
      if (v30)
      {
        v34 = v30;
        v35 = *(_QWORD *)v63;
        v36 = (dispatch_once_t *)MEMORY[0x1E0C95300];
        *(_QWORD *)&v33 = 138544130;
        v57 = v33;
        do
        {
          v37 = 0;
          do
          {
            if (*(_QWORD *)v63 != v35)
              objc_enumerationMutation(v28);
            v38 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v37);
            objc_msgSend_options(v38, v31, v32, v57);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v39, v40, (uint64_t)CFSTR("partitionType"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend_isEqualToString_(v41, v42, (uint64_t)v19) & 1) == 0)
            {
              if (*v36 != -1)
                dispatch_once(v36, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v43 = (void *)*MEMORY[0x1E0C952E0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
              {
                log = v43;
                objc_msgSend_requestUUID(v58, v44, v45);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_requestOperationClasses(v58, v46, v47);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = (void *)objc_msgSend_firstObject(v60, v48, v49);
                *(_DWORD *)buf = v57;
                v67 = v59;
                v68 = 2112;
                v69 = v58;
                v70 = 2114;
                v71 = v50;
                v72 = 2114;
                v73 = v38;
                v51 = v50;
                _os_log_error_impl(&dword_1BE990000, log, OS_LOG_TYPE_ERROR, "req: %{public}@, \"%@ attempted to send request %{public}@ along with %{public}@, but they hit different partitions\", buf, 0x2Au);

                v36 = (dispatch_once_t *)MEMORY[0x1E0C95300];
              }
            }

            ++v37;
          }
          while (v34 != v37);
          v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v62, v74, 16);
        }
        while (v34);
      }

      v3 = v58;
    }
    if (!objc_msgSend_length(v19, v26, v27))
      goto LABEL_24;
    v52 = sub_1BE994328(v19);
    v55 = objc_msgSend_databaseScope(v3, v53, v54);
    switch(v52)
    {
      case 0:
        v4 = 1;
        break;
      case 2:
        if (v55 == 1)
          v4 = 2;
        else
          v4 = 1;
        break;
      case 1:
        v4 = 2;
        break;
      default:
LABEL_24:
        v4 = 3;
        break;
    }

    goto LABEL_30;
  }
  return self->_cachedPartitionType;
}

- (BOOL)performOnLifecycleQueueIfNotFinished:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  id v16;
  id location;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_initWeak(&location, self);
  objc_msgSend_lifecycleQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  objc_msgSend_lifecycleQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE9AE874;
  v13[3] = &unk_1E7831100;
  objc_copyWeak(&v16, &location);
  v14 = v4;
  v15 = &v18;
  v11 = v4;
  dispatch_sync(v10, v13);

  LOBYTE(v10) = *((_BYTE *)v19 + 24);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);
  return (char)v10;
}

- (void)performASyncOnLifecycleQueueIfNotFinished:(id)a3 fallbackBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend_lifecycleQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE9AEA24;
  v13[3] = &unk_1E7831128;
  objc_copyWeak(&v16, &location);
  v14 = v7;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)lifecycleQueue
{
  CKDURLRequest *v2;
  const char *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  dispatch_qos_class_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *lifecycleQueue;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_lifecycleQueue)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v3, (uint64_t)CFSTR("%s.%p"), "com.apple.cloudkit.urlrequestlifecycle", v2);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend_UTF8String(v4, v5, v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_qualityOfService(v2, v9, v10);
    v11 = CKQoSClassFromNSQualityOfService();
    dispatch_queue_attr_make_with_qos_class(v8, v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v7, v12);
    lifecycleQueue = v2->_lifecycleQueue;
    v2->_lifecycleQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_set_specific((dispatch_queue_t)v2->_lifecycleQueue, v2->_lifecycleQueue, (void *)1, 0);
  }
  objc_sync_exit(v2);

  return v2->_lifecycleQueue;
}

- (void)tearDownResources
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  CKDResponseBodyParser *responseBodyParser;
  NSArray *requestOperations;
  const char *v14;
  const char *v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
  {
    v17 = v3;
    objc_msgSend_requestUUID(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v20;
    _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"tearDownResources\", (uint8_t *)&v21, 0xCu);

  }
  objc_msgSend_urlSessionTask(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v6, v7, v8);

  objc_msgSend_setUrlSessionTask_(self, v9, 0);
  objc_msgSend__tearDownStreamWriter(self, v10, v11);
  responseBodyParser = self->_responseBodyParser;
  self->_responseBodyParser = 0;

  requestOperations = self->_requestOperations;
  self->_requestOperations = 0;

  objc_msgSend_setResponse_(self, v14, 0);
  objc_msgSend_setRequest_(self, v15, 0);
  objc_msgSend_setRequestOptions_(self, v16, 0);
}

- (NSURLSessionDataTask)urlSessionTask
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 216, 1);
}

- (void)setUrlSessionTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (void)setRequestOptions:(id)a3
{
  C2RequestOptions *v4;
  C2RequestOptions *requestOptions;
  CKDURLRequest *obj;

  v4 = (C2RequestOptions *)a3;
  obj = self;
  objc_sync_enter(obj);
  requestOptions = obj->_requestOptions;
  obj->_requestOptions = v4;

  objc_sync_exit(obj);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (void)_tearDownStreamWriter
{
  CKDURLRequest *v2;
  CKDProtobufStreamWriter *streamWriter;
  const char *v4;
  uint64_t v5;
  CKDProtobufStreamWriter *v6;

  v2 = self;
  objc_sync_enter(v2);
  v6 = v2->_streamWriter;
  if (v6)
  {
    streamWriter = v2->_streamWriter;
    v2->_streamWriter = 0;

    objc_sync_exit(v2);
    objc_msgSend_tearDown(v6, v4, v5);
  }
  else
  {
    objc_sync_exit(v2);

  }
}

- (NSMutableSet)responseObjectUUIDs
{
  return self->_responseObjectUUIDs;
}

- (int64_t)_handleServerProtobufResult:(id)a3 rawData:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  int64_t v47;
  char v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  int v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  int hasType;
  void *v73;
  const char *v74;
  uint64_t v75;
  int v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  void *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  int v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  unsigned int v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  NSObject *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  int hasAuxiliaryError;
  void *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  NSObject *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  const char *v135;
  void *v136;
  const char *v137;
  void *v138;
  NSObject *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  NSObject *v144;
  uint32_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  int v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  NSObject *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  _QWORD *v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  const char *v182;
  void *v183;
  const char *v184;
  void *v185;
  void *v187;
  const char *v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  void *v194;
  const char *v195;
  NSObject *v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  int v205;
  const char *v206;
  uint64_t v207;
  NSObject *v208;
  const char *v209;
  uint64_t v210;
  void *v211;
  NSObject *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  NSObject *v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  uint64_t v222;
  CKDURLRequest *v223;
  uint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  id v228;
  void *v229;
  void *v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  uint8_t buf[4];
  void *v236;
  __int16 v237;
  _QWORD v238[2];
  _BYTE v239[128];
  uint64_t v240;

  v240 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_operation(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v5;
    objc_msgSend_header(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_throttleConfigs(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v18, v19, v20))
    {
      v223 = self;
      v228 = v12;
      v23 = v8;
      objc_msgSend_deviceContext(v8, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_throttleManager(v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v233 = 0u;
      v234 = 0u;
      v231 = 0u;
      v232 = 0u;
      v28 = v18;
      v29 = v18;
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v231, v239, 16);
      if (v31)
      {
        v33 = v31;
        v34 = *(_QWORD *)v232;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v232 != v34)
              objc_enumerationMutation(v29);
            objc_msgSend_throttleFromPThrottlingConfig_(CKDThrottleManager, v32, *(_QWORD *)(*((_QWORD *)&v231 + 1) + 8 * i));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37)
              objc_msgSend_addThrottle_(v27, v36, (uint64_t)v37);

          }
          v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v231, v239, 16);
        }
        while (v33);
      }

      v8 = v23;
      v12 = v228;
      v18 = v28;
      self = v223;
    }
    sub_1BEA55110(self, v21, v22);
    objc_msgSend_response(v12, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_hasOperationUUID(v40, v41, v42) & 1) != 0)
    {

    }
    else
    {
      v48 = objc_msgSend_requiresCKAnonymousUserIDs(self, v43, v44);

      if ((v48 & 1) == 0)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v88 = (void *)*MEMORY[0x1E0C952E0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_FAULT))
        {
          v125 = v88;
          objc_msgSend_requestUUID(self, v126, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v236 = v128;
          v237 = 2112;
          v238[0] = v12;
          _os_log_fault_impl(&dword_1BE990000, v125, OS_LOG_TYPE_FAULT, "req: %{public}@, \"Parsed a response object with no operationUUID.  Result %@\", buf, 0x16u);

        }
        v91 = (void *)MEMORY[0x1E0CB35C8];
        v92 = *MEMORY[0x1E0C94B20];
        objc_msgSend_result(v12, v89, v90);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1BEB10290(self, v51);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v91, v94, v92, 1005, v93);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_finishWithError_(self, v96, (uint64_t)v95);

        goto LABEL_34;
      }
    }
    if (!objc_msgSend_hasResult(v12, v45, v46))
      goto LABEL_28;
    objc_msgSend_result(v12, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_hasCode(v51, v52, v53))
    {
LABEL_45:
      v47 = 0;
      goto LABEL_91;
    }
    objc_msgSend_result(v12, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend_code(v56, v57, v58);

    if (v59 != 3)
    {
LABEL_28:
      v47 = 0;
LABEL_92:

      goto LABEL_93;
    }
    objc_msgSend_result(v12, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v62, v63, v64);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_hasClientError(v51, v65, v66))
    {
      objc_msgSend_clientError(v51, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      hasType = objc_msgSend_hasType(v69, v70, v71);

      if (hasType)
      {
        objc_msgSend_clientError(v51, v67, v68);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend_type(v73, v74, v75);

        switch(v76)
        {
          case 2:
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v79 = (void *)*MEMORY[0x1E0C952E0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
            {
              v82 = v79;
              objc_msgSend_requestUUID(self, v83, v84);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v236 = v85;
              _os_log_impl(&dword_1BE990000, v82, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Expired app config\", buf, 0xCu);

            }
            objc_msgSend_sharedManager(CKDServerConfigurationManager, v80, v81);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_expireConfigurationForContainer_(v86, v87, (uint64_t)v11);
            goto LABEL_76;
          case 3:
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v155 = (void *)*MEMORY[0x1E0C952E0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
            {
              v158 = v155;
              objc_msgSend_requestUUID(self, v159, v160);
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v236 = v161;
              _os_log_impl(&dword_1BE990000, v158, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Expired global config\", buf, 0xCu);

            }
            objc_msgSend_sharedManager(CKDServerConfigurationManager, v156, v157);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_expireGlobalConfiguration(v86, v162, v163);
LABEL_76:

            objc_msgSend_fetchConfigurationForOperation_withCompletionHandler_(v11, v164, (uint64_t)v8, 0);
            goto LABEL_90;
          case 4:
            v165 = (_QWORD *)MEMORY[0x1E0C95300];
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v166 = (void *)*MEMORY[0x1E0C952E0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
            {
              v212 = v166;
              objc_msgSend_requestUUID(self, v213, v214);
              v215 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v236 = v215;
              _os_log_error_impl(&dword_1BE990000, v212, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Syntax error in request\", buf, 0xCu);

            }
            objc_msgSend_errorDescription(v51, v167, v168);
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lowercaseString(v169, v170, v171);
            v172 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend_hasPrefix_(v172, v173, (uint64_t)CFSTR("no operations present")))
            {
              if (*v165 != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v230 = v172;
              v174 = (void *)*MEMORY[0x1E0C952E0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
              {
                v218 = v174;
                objc_msgSend_requestUUID(self, v219, v220);
                v221 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v236 = v221;
                _os_log_error_impl(&dword_1BE990000, v218, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Server could not find any request operations in this request. Giving up.\", buf, 0xCu);

              }
              v225 = (void *)MEMORY[0x1E0CB35C8];
              objc_msgSend_result(v12, v175, v176, *MEMORY[0x1E0C94B20]);
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              v177 = sub_1BEB10D5C(v227);
              objc_msgSend_result(v12, v178, v179);
              v180 = (void *)objc_claimAutoreleasedReturnValue();
              sub_1BEB10290(self, v180);
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_userInfo_(v225, v182, v222, v177, v181);
              v183 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_finishWithError_(self, v184, (uint64_t)v183);

              v47 = 2;
              v172 = v230;
            }
            else
            {
              v47 = 1;
            }

            goto LABEL_91;
          case 5:
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v185 = (void *)*MEMORY[0x1E0C952E0];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
              goto LABEL_90;
            v115 = v185;
            objc_msgSend_requestUUID(self, v216, v217);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v236 = v118;
            v119 = "req: %{public}@, \"Forbidden resource in request\";
            goto LABEL_56;
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
            goto LABEL_67;
          case 11:
            goto LABEL_95;
          case 12:
            objc_msgSend_containerScopedUserID(v11, v77, v78);
            v187 = (void *)objc_claimAutoreleasedReturnValue();

            if (v187)
            {
LABEL_95:
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v189 = (void *)*MEMORY[0x1E0C952E0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
              {
                v208 = v189;
                objc_msgSend_requestUUID(self, v209, v210);
                v211 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v236 = v211;
                _os_log_error_impl(&dword_1BE990000, v208, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Our auth token is bad and we should feel bad.\", buf, 0xCu);

              }
              objc_msgSend__handleAuthFailure(self, v190, v191);
            }
            else
            {
              objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v188, *MEMORY[0x1E0C94B20], 2011, CFSTR("Authentication required"));
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_possiblyWrappedAuthTokenErrorGivenError_(v11, v193, (uint64_t)v192);
              v194 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_finishWithError_(self, v195, (uint64_t)v194);
            }
            goto LABEL_34;
          default:
            if (v76 == 89)
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v138 = (void *)*MEMORY[0x1E0C952E0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
              {
                v139 = v138;
                objc_msgSend_requestUUID(self, v140, v141);
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v236 = v142;
                v143 = "req: %{public}@, \"Server could not verify the anonymous-to-server signatures supplied. Giving up.\";
                v144 = v139;
                v145 = 12;
                goto LABEL_104;
              }
              goto LABEL_61;
            }
LABEL_67:
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v146 = (void *)*MEMORY[0x1E0C952E0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
            {
              v115 = v146;
              objc_msgSend_requestUUID(self, v147, v148);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_clientError(v51, v149, v150);
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              v154 = objc_msgSend_type(v151, v152, v153);
              *(_DWORD *)buf = 138543874;
              v236 = v118;
              v237 = 1024;
              LODWORD(v238[0]) = v154;
              WORD2(v238[0]) = 2112;
              *(_QWORD *)((char *)v238 + 6) = v51;
              _os_log_error_impl(&dword_1BE990000, v115, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Received error %d from the server: %@\", buf, 0x1Cu);

              goto LABEL_57;
            }
            break;
        }
        goto LABEL_90;
      }
    }
    if (objc_msgSend_hasServerError(v51, v67, v68))
    {
      objc_msgSend_serverError(v51, v97, v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend_hasType(v99, v100, v101);

      if (v102)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v103 = (void *)*MEMORY[0x1E0C952E0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
        {
          v196 = v103;
          objc_msgSend_requestUUID(self, v197, v198);
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_serverError(v51, v200, v201);
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          v205 = objc_msgSend_type(v202, v203, v204);
          *(_DWORD *)buf = 138543874;
          v236 = v199;
          v237 = 1024;
          LODWORD(v238[0]) = v205;
          WORD2(v238[0]) = 2112;
          *(_QWORD *)((char *)v238 + 6) = v51;
          _os_log_error_impl(&dword_1BE990000, v196, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Received error %d from the server: %@\", buf, 0x1Cu);

        }
        objc_msgSend_serverError(v51, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = objc_msgSend_type(v106, v107, v108);

        if (v109 > 9)
        {
LABEL_44:
          if (v109 - 200001 >= 5)
            goto LABEL_45;
          goto LABEL_61;
        }
        if (((1 << v109) & 0x3D6) == 0)
        {
          if (v109 != 3)
            goto LABEL_44;
LABEL_90:
          v47 = 1;
          goto LABEL_91;
        }
LABEL_61:
        v226 = (void *)MEMORY[0x1E0CB35C8];
        v224 = *MEMORY[0x1E0C94B20];
        objc_msgSend_result(v12, v110, v111);
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = sub_1BEB10D5C(v229);
        objc_msgSend_result(v12, v131, v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1BEB10290(self, v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v226, v135, v224, v130, v134);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_finishWithError_(self, v137, (uint64_t)v136);

LABEL_34:
        v47 = 2;
LABEL_91:

        goto LABEL_92;
      }
    }
    if (objc_msgSend_hasExtensionError(v51, v97, v98))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v114 = (void *)*MEMORY[0x1E0C952E0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
        goto LABEL_90;
      v115 = v114;
      objc_msgSend_requestUUID(self, v116, v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v236 = v118;
      v119 = "req: %{public}@, \"Plugin error in request\";
    }
    else
    {
      hasAuxiliaryError = objc_msgSend_hasAuxiliaryError(v51, v112, v113);
      v121 = (void *)*MEMORY[0x1E0C952F8];
      if (!hasAuxiliaryError)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v121);
        v129 = (void *)*MEMORY[0x1E0C952E0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
        {
          v139 = v129;
          objc_msgSend_requestUUID(self, v206, v207);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v236 = v142;
          v237 = 2112;
          v238[0] = v51;
          v143 = "req: %{public}@, \"Received unknown error from the server: %@\";
          v144 = v139;
          v145 = 22;
LABEL_104:
          _os_log_error_impl(&dword_1BE990000, v144, OS_LOG_TYPE_ERROR, v143, buf, v145);

        }
        goto LABEL_61;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v121);
      v122 = (void *)*MEMORY[0x1E0C952E0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
        goto LABEL_90;
      v115 = v122;
      objc_msgSend_requestUUID(self, v123, v124);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v236 = v118;
      v119 = "req: %{public}@, \"Auxiliary error in request\";
    }
LABEL_56:
    _os_log_error_impl(&dword_1BE990000, v115, OS_LOG_TYPE_ERROR, v119, buf, 0xCu);
LABEL_57:

    goto LABEL_90;
  }
  v47 = 0;
LABEL_93:

  return v47;
}

- (id)zoneIDsToLock
{
  return 0;
}

- (void)validateAnonymousUserIDPropagation
{
  uint64_t v2;
  char v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  const char *v12;
  id v13;

  v5 = objc_msgSend_handlesAnonymousCKUserIDPropagation(self, a2, v2);
  if (objc_msgSend_requiresCKAnonymousUserIDs(self, v6, v7))
  {
    if ((v5 & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v12, (uint64_t)a2, self, CFSTR("CKDURLRequest.m"), 1435, CFSTR("%@ must propagate anonymous userIDs, then override this and return YES"), v11);

    }
  }
}

- (BOOL)validate:(id *)a3
{
  return 1;
}

- (BOOL)usesiCloudAuthToken
{
  return 0;
}

- (BOOL)usesCloudKitAuthToken
{
  return 1;
}

- (NSDictionary)timingData
{
  return self->_timingData;
}

- (void)tearDownResourcesAndReleaseTheZoneLocks:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
  {
    v15 = v5;
    objc_msgSend_requestUUID(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v18;
    _os_log_debug_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"tearDownResourcesAndReleaseTheZoneLocks\", (uint8_t *)&v19, 0xCu);

  }
  objc_msgSend_container(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_gatekeeper(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relinquishLocksForWaiter_deferRelinquish_(v11, v12, (uint64_t)self, v3);

  objc_msgSend_tearDownResources(self, v13, v14);
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sourceApplicationSecondaryIdentifier(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setTranslator:(id)a3
{
  objc_storeStrong((id *)&self->_translator, a3);
}

- (void)setTimingData:(id)a3
{
  objc_storeStrong((id *)&self->_timingData, a3);
}

- (void)setResponseProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setResponseBodyParser:(id)a3
{
  objc_storeStrong((id *)&self->_responseBodyParser, a3);
}

- (void)setRequestProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setLastRetryAuthError:(id)a3
{
  objc_storeStrong((id *)&self->_lastRetryAuthError, a3);
}

- (void)setIsHandlingAuthRetry:(BOOL)a3
{
  self->_isHandlingAuthRetry = a3;
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (void)setDidReceiveResponseBodyData:(BOOL)a3
{
  self->_didReceiveResponseBodyData = a3;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setDateRequestWentOut:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (void)setCountsByRequestOperationType:(id)a3
{
  objc_storeStrong((id *)&self->_countsByRequestOperationType, a3);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setCloudKitAuthToken:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitAuthToken, a3);
}

- (void)setClientProvidedAdditionalHeaderValues:(id)a3
{
  objc_storeStrong((id *)&self->_clientProvidedAdditionalHeaderValues, a3);
}

- (CKTapToRadarRequest)serverProvidedTapToRadarRequest
{
  return self->_serverProvidedTapToRadarRequest;
}

- (NSString)serverProvidedAutoBugCaptureReason
{
  return self->_serverProvidedAutoBugCaptureReason;
}

- (int64_t)responseStatusCode
{
  return self->_responseStatusCode;
}

- (id)responseProgressBlock
{
  return self->_responseProgressBlock;
}

- (unint64_t)resolvedDiscretionaryNetworkBehavior
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_resolvedDiscretionaryNetworkBehavior(v3, v4, v5);

  return v6;
}

- (BOOL)resolvedAutomaticallyRetryNetworkFailures
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(v3, v4, v5);

  return v6;
}

- (BOOL)requiresUserPartitionURL
{
  uint64_t v2;

  return objc_msgSend_partitionType(self, a2, v2) == 1;
}

- (BOOL)requiresTokenRegistration
{
  uint64_t v2;

  return objc_msgSend_partitionType(self, a2, v2) != 3;
}

- (BOOL)requiresDeviceID
{
  return 1;
}

- (BOOL)requiresConfiguration
{
  return 1;
}

- (BOOL)requiresAppPartitionURL
{
  uint64_t v2;

  return objc_msgSend_partitionType(self, a2, v2) == 2;
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 232, 1);
}

- (id)requestProgressBlock
{
  return self->_requestProgressBlock;
}

- (int)requestOriginator
{
  return self->_requestOriginator;
}

- (id)requestOperationCountsByOperationType
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_countsByRequestOperationType(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_copy(v3, v4, v5);

  return v6;
}

- (Class)requestMessageClass
{
  return (Class)objc_opt_class();
}

- (BOOL)requestGETPreAuth
{
  return 0;
}

- (void)requestDidParseProtobufObject:(id)a3 completionHandler:(id)a4
{
  const char *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a4;
  objc_msgSend_requestDidParseProtobufObject_(self, v6, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v8[2](v8, v7);

}

- (NSString)protobufOperationName
{
  return (NSString *)CFSTR("RequestOperation");
}

- (void)prepareRequestWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)performRequest
{
  NSObject *v3;
  OS_os_activity *osActivity;
  _QWORD block[5];

  v3 = _os_activity_create(&dword_1BE990000, "url-request", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE9C56BC;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  os_activity_apply(v3, block);
  osActivity = self->_osActivity;
  self->_osActivity = (OS_os_activity *)v3;

}

- (void)performASyncOnLifecycleQueueIfNotFinished:(id)a3
{
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_fallbackBlock_(self, a2, (uint64_t)a3, &unk_1E7831148);
}

- (int)operationType
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend_operation(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    v8 = objc_msgSend_operationType(v4, v5, v6);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      v11 = v9;
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      _os_log_fault_impl(&dword_1BE990000, v11, OS_LOG_TYPE_FAULT, "%{public}@ called on %{public}@ but no operation is set", (uint8_t *)&v15, 0x16u);

    }
    v8 = 0;
  }

  return v8;
}

- (NSString)operationID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)operationIDForProtobuf
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topmostParentOperation(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSNumber)operationGroupQuantity
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationGroupQuantityNumber(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v6;
}

- (BOOL)needsAuthRetry
{
  return self->_needsAuthRetry;
}

- (BOOL)markAsFinished
{
  void *v3;
  CKDURLRequest *v4;
  BOOL v5;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
  {
    v7 = v3;
    objc_msgSend_requestUUID(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_debug_impl(&dword_1BE990000, v7, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Marking as finished\", (uint8_t *)&v11, 0xCu);

  }
  v4 = self;
  objc_sync_enter(v4);
  v5 = !v4->_finished;
  v4->_finished = 1;
  objc_sync_exit(v4);

  return v5;
}

- (int)isolationLevel
{
  return 1;
}

- (BOOL)isHandlingAuthRetry
{
  return self->_isHandlingAuthRetry;
}

- (BOOL)isErrorInducerRequest
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  char hasPrefix;

  if (!*MEMORY[0x1E0C95280])
    return 0;
  objc_msgSend_container(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  hasPrefix = objc_msgSend_hasPrefix_(v6, v7, (uint64_t)CFSTR("__error_inducer__"));

  return hasPrefix;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (CKDURLRequest)initWithOperation:(id)a3
{
  id v4;
  CKDURLRequest *v5;
  CKDURLRequest *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CKDContainer *container;
  uint64_t v11;
  NSString *requestUUID;
  uint64_t v13;
  CKDOperationMetrics *metrics;
  NSMutableSet *v15;
  NSMutableSet *responseObjectUUIDs;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  const char *v25;
  uint64_t v26;
  CKSignpost *signpost;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  NSData *fakeResponseData;
  void *v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  CKDURLRequest *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)CKDURLRequest;
  v5 = -[CKDURLRequest init](&v44, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_operation, v4);
    objc_msgSend_container(v4, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    container = v6->_container;
    v6->_container = (CKDContainer *)v9;

    v6->_responseStatusCode = -1;
    v6->_allowAutomaticRedirects = 1;
    CKCreateGUID();
    v11 = objc_claimAutoreleasedReturnValue();
    requestUUID = v6->_requestUUID;
    v6->_requestUUID = (NSString *)v11;

    v13 = objc_opt_new();
    metrics = v6->_metrics;
    v6->_metrics = (CKDOperationMetrics *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    responseObjectUUIDs = v6->_responseObjectUUIDs;
    v6->_responseObjectUUIDs = v15;

    objc_msgSend_operationInfo(v4, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_requestOriginator(v19, v20, v21);
    if ((unint64_t)(v22 - 1) >= 5)
      v23 = 1;
    else
      v23 = v22 + 1;
    v6->_requestOriginator = v23;

    v24 = objc_alloc(MEMORY[0x1E0C95140]);
    v26 = objc_msgSend_initWithLog_(v24, v25, *MEMORY[0x1E0C952E0]);
    signpost = v6->_signpost;
    v6->_signpost = (CKSignpost *)v26;

    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(v4, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v30, v31, (uint64_t)CFSTR("HTTPResponseBodyOverride"));
      v32 = objc_claimAutoreleasedReturnValue();
      fakeResponseData = v6->_fakeResponseData;
      v6->_fakeResponseData = (NSData *)v32;

    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v34 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v35 = v34;
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v6, v38, 1, 0, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKPropertiesStyleString(v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v37;
      v47 = 2048;
      v48 = v6;
      v49 = 2114;
      v50 = v42;
      _os_log_impl(&dword_1BE990000, v35, OS_LOG_TYPE_INFO, "<%{public}@: %p; %{public}@> Request Initializing",
        buf,
        0x20u);

    }
  }

  return v6;
}

- (BOOL)includeContainerServerInfo
{
  return 1;
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 0;
}

- (void)finishWithError:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;

  v9 = a3;
  if (objc_msgSend__onLifecycleQueue(self, v4, v5))
  {
    objc_msgSend__finishOnLifecycleQueueWithError_(self, v6, (uint64_t)v9);
  }
  else
  {
    objc_msgSend_lifecycleQueue(self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEA596D8;
    block[3] = &unk_1E782EE20;
    block[4] = self;
    v11 = v9;
    dispatch_sync(v8, block);

  }
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 200, 1);
}

- (BOOL)didReceiveResponseBodyData
{
  return self->_didReceiveResponseBodyData;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDURLRequest *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (void)dealloc
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  const char *v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1C3B83E24]();
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
  {
    v15 = v5;
    objc_msgSend_requestUUID(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    _os_log_debug_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"dealloc\", buf, 0xCu);

  }
  objc_msgSend__tearDownStreamWriter(self, v6, v7);
  if ((objc_msgSend_isFinished(self, v8, v9) & 1) == 0 && self->_didSendRequest)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v29, (uint64_t)a2, self, CFSTR("CKDURLRequest.m"), 309, CFSTR("<%@ %p>: Requests must be finished before deallocation"), v28, self);

  }
  objc_msgSend_urlSessionTask(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_urlSessionTask(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v25, (uint64_t)a2, self, CFSTR("CKDURLRequest.m"), 310, CFSTR("<%@ %p>: The URL session data task should be nil: %p"), v21, self, v24);

  }
  objc_autoreleasePoolPop(v4);
  v30.receiver = self;
  v30.super_class = (Class)CKDURLRequest;
  -[CKDURLRequest dealloc](&v30, sel_dealloc);
}

- (NSString)cloudKitAuthToken
{
  return self->_cloudKitAuthToken;
}

- (NSDictionary)clientProvidedAdditionalHeaderValues
{
  return self->_clientProvidedAdditionalHeaderValues;
}

- (NSString)applicationBundleIdentifierForNetworkAttribution
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierForNetworkAttribution(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)allowsPowerNapScheduling
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_allowsPowerNapScheduling(v3, v4, v5);

  return v6;
}

- (BOOL)allowsAuthedAccount
{
  return 1;
}

- (NSDictionary)additionalHeaderValues
{
  return 0;
}

- (NSString)acceptContentType
{
  return (NSString *)CFSTR("application/x-protobuf");
}

- (id)_wrapErrorIfNecessary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    objc_msgSend_domain(v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v8, v9, *MEMORY[0x1E0CB2FE0]))
    {
      if (objc_msgSend_code(v5, v10, v11) == 100)
      {

LABEL_8:
        v17 = (void *)MEMORY[0x1E0C94FF8];
        v18 = *MEMORY[0x1E0C94B20];
        v31 = *MEMORY[0x1E0C94808];
        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v14, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend_defaultRetryAfter(v20, v21, v22);
        objc_msgSend_numberWithInt_(v19, v24, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v25;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v26, (uint64_t)v32, &v31, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_format_(v17, v28, v18, 1013, v27, CFSTR("Received a networking protocol error. Please try again"));
        v29 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v29;
        goto LABEL_9;
      }
      v16 = objc_msgSend_code(v5, v12, v13);

      if (v16 == 6)
        goto LABEL_8;
    }
    else
    {

    }
  }
  else
  {
    v5 = 0;
  }
LABEL_9:

  return v5;
}

- (void)_validateAccountAccess
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BE9C46BC;
  v2[3] = &unk_1E782EA40;
  v2[4] = self;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_setupPublicDatabaseURL
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BE997270;
  v2[3] = &unk_1E7830130;
  v2[4] = self;
  v2[5] = a2;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_setupPrivateDatabaseURL
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BE9C4434;
  v2[3] = &unk_1E7830130;
  v2[4] = self;
  v2[5] = a2;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_setupConfiguration
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BE996ADC;
  v2[3] = &unk_1E7830130;
  v2[4] = self;
  v2[5] = a2;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_registerPushTokens
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BE9C4E9C;
  v2[3] = &unk_1E7830130;
  v2[4] = self;
  v2[5] = a2;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (id)_protobufObjectParsedBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE9B8BFC;
  v4[3] = &unk_1E7830DA0;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)_prepareCloudKitAuthToken
{
  uint64_t v2;
  int v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  char v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  _QWORD block[5];
  id v22;
  _QWORD v23[5];
  NSObject *v24;
  _QWORD *v25;
  id v26;
  id location;
  _QWORD v28[5];
  id v29;

  v5 = objc_msgSend_usesiCloudAuthToken(self, a2, v2);
  if (v5 == objc_msgSend_usesCloudKitAuthToken(self, v6, v7))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, CFSTR("CKDURLRequest.m"), 1897, CFSTR("You can't set both usesiCloudAuthToken and usesCloudKitAuthToken to the same value"));

  }
  v10 = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_1BE9BAF98;
  v28[4] = sub_1BE9BAD80;
  v29 = 0;
  objc_initWeak(&location, self);
  v13 = objc_msgSend_sendRequestAnonymously(self, v11, v12);
  v16 = MEMORY[0x1E0C809B0];
  if ((v13 & 1) == 0)
  {
    dispatch_group_enter(v10);
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = sub_1BE9C42E8;
    v23[3] = &unk_1E7831008;
    v23[4] = self;
    objc_copyWeak(&v26, &location);
    v25 = v28;
    v24 = v10;
    objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, v17, (uint64_t)v23);

    objc_destroyWeak(&v26);
  }
  objc_msgSend_lifecycleQueue(self, v14, v15);
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = v16;
  block[1] = 3221225472;
  block[2] = sub_1BEA59158;
  block[3] = &unk_1E7831030;
  objc_copyWeak(&v22, &location);
  block[4] = v28;
  dispatch_group_notify(v10, v18, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(v28, 8);

}

- (void)_prepareAuthTokens
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BE9C5570;
  v2[3] = &unk_1E782EA40;
  v2[4] = self;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_performRequest
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BE9AA84C;
  v2[3] = &unk_1E782EA40;
  v2[4] = self;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (BOOL)_onLifecycleQueue
{
  uint64_t v2;
  void *v3;
  BOOL v4;

  objc_msgSend_lifecycleQueue(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_get_specific(v3) != 0;

  return v4;
}

- (void)_loadRequest:(id)a3
{
  id v5;
  id v6;
  const char *v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BE99F430;
  v8[3] = &unk_1E7830158;
  v9 = v5;
  v10 = a2;
  v8[4] = self;
  v6 = v5;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, v7, (uint64_t)v8);

}

- (void)_finalizeRequestOperations:(id)a3 request:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  void *v51;
  const char *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id obj;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;
  void *v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v65 = a4;
  if (objc_msgSend_requiresCKAnonymousUserIDs(self, v7, v8)
    && objc_msgSend_requiresCKAnonymousSignature(self, v9, v10))
  {
    objc_msgSend_uncompressedDataForStreamedObjects_(CKDProtobufStreamWriter, v11, (uint64_t)v6);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)objc_opt_new();
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    obj = v6;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v72, v83, 16);
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v73;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v73 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
          v71 = 0;
          objc_msgSend_returnVerificationKeyAndSignatureForRequestOperation_dataToBeSigned_error_(self, v14, v18, v63, &v71);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v71;
          if (v20)
            v23 = 1;
          else
            v23 = v19 == 0;
          if (v23)
          {
            v50 = v20;
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v51 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              v59 = v51;
              objc_msgSend_requestUUID(self, v60, v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v80 = v62;
              v81 = 2114;
              v82 = v50;
              _os_log_error_impl(&dword_1BE990000, v59, OS_LOG_TYPE_ERROR, "Failed to generate signature for A2A request %{public}@: %{public}@", buf, 0x16u);

            }
            v53 = (void *)MEMORY[0x1E0CB35C8];
            v54 = *MEMORY[0x1E0C94B20];
            if (v50)
            {
              v77 = *MEMORY[0x1E0CB3388];
              v78 = v50;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v52, (uint64_t)&v78, &v77, 1);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_userInfo_(v53, v56, v54, 5002, v55);
            }
            else
            {
              v55 = 0;
              objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v52, v54, 5002, 0);
            }
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_finishWithError_(self, v58, (uint64_t)v57);

            if (v50)
            goto LABEL_34;
          }
          objc_msgSend_v1(v19, v21, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_v2(v19, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v64, v28, (uint64_t)v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v29)
            objc_msgSend_setObject_forKeyedSubscript_(v64, v30, (uint64_t)v27, v24);

        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v72, v83, 16);
        if (v15)
          continue;
        break;
      }
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v64;
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v67, v76, 16);
    if (v32)
    {
      v34 = v32;
      v35 = 0;
      v36 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v68 != v36)
            objc_enumerationMutation(obj);
          v38 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          objc_msgSend_objectForKeyedSubscript_(obj, v33, (uint64_t)v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend_base64EncodedStringWithOptions_(v38, v41, 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_base64EncodedStringWithOptions_(v39, v43, 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v40, v45, (uint64_t)CFSTR("key=\"%@\",signature=\"%@\"), v42, v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v47, (uint64_t)CFSTR("X-CloudKit-A2A-Share-Auth%lu"), v35 + j);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setValue_forHTTPHeaderField_(v65, v49, (uint64_t)v46, v48);

        }
        v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v67, v76, 16);
        v35 += j;
      }
      while (v34);
    }
LABEL_34:

  }
}

- (void)_fetchDeviceID
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BE996CF0;
  v2[3] = &unk_1E7830130;
  v2[4] = self;
  v2[5] = a2;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_fetchContainerScopedUserID
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BE9C3A0C;
  v2[3] = &unk_1E7830130;
  v2[4] = self;
  v2[5] = a2;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_authTokenWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  const char *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_INFO))
  {
    v9 = v6;
    objc_msgSend_requestUUID(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543362;
    v30 = v12;
    _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "req: %{public}@, \"Fetching auth token\", (uint8_t *)&v29, 0xCu);

  }
  v13 = objc_msgSend_usesiCloudAuthToken(self, v7, v8);
  if (v13 == objc_msgSend_usesCloudKitAuthToken(self, v14, v15))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, self, CFSTR("CKDURLRequest.m"), 645, CFSTR("You can't set both usesiCloudAuthToken and usesCloudKitAuthToken to the same value"));

  }
  objc_msgSend_container(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_usesCloudKitAuthToken(self, v19, v20);
  objc_msgSend_account(v18, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24;
  if (v21)
    objc_msgSend_cloudKitAuthTokenWithContainer_completionHandler_(v24, v25, (uint64_t)v18, v5);
  else
    objc_msgSend_iCloudAuthTokenWithContainer_completionHandler_(v24, v25, (uint64_t)v18, v5);

}

- (void)_acquireZoneGates
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BE99DA80;
  v2[3] = &unk_1E782EA40;
  v2[4] = self;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (id)_CFNetworkTaskIdentifierString
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_urlSessionTask(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v11;
  id v12;
  const char *v13;
  _QWORD v14[5];
  id v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;

  v11 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BE998C78;
  v14[3] = &unk_1E7831200;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v14[4] = self;
  v15 = v11;
  v12 = v11;
  objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, v13, (uint64_t)v14);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1BE9A02BC;
  v12[3] = &unk_1E782E418;
  v12[4] = self;
  v13 = v8;
  v14 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, v11, (uint64_t)v12);

}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BE9C0B68;
  v18[3] = &unk_1E782F678;
  v18[4] = self;
  v10 = v8;
  v19 = v10;
  v11 = v9;
  v20 = v11;
  if ((objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, v12, (uint64_t)v18) & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend_requestUUID(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v17;
      _os_log_impl(&dword_1BE990000, v14, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Cancelling request on established connection due to cancelled CKDURLRequest\", buf, 0xCu);

    }
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  CKDURLRequest *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  CKDURLRequest *v23;
  id v24;
  id v25;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1BE99BCEC;
  v21[3] = &unk_1E78303B0;
  v22 = v10;
  v23 = self;
  v24 = v9;
  v25 = v11;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = sub_1BEA5A704;
  v17[3] = &unk_1E782F678;
  v18 = v22;
  v19 = self;
  v20 = v25;
  v13 = v25;
  v14 = v22;
  v15 = v9;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_fallbackBlock_(self, v16, (uint64_t)v21, v17);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BE99C4B0;
  v16[3] = &unk_1E78303B0;
  v16[4] = self;
  v17 = v10;
  v18 = v9;
  v19 = v11;
  v12 = v11;
  v13 = v9;
  v14 = v10;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_fallbackBlock_(self, v15, (uint64_t)v16, v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpost, 0);
  objc_storeStrong((id *)&self->_countsByRequestOperationType, 0);
  objc_storeStrong((id *)&self->_serverProvidedTapToRadarRequest, 0);
  objc_storeStrong((id *)&self->_serverProvidedAutoBugCaptureReason, 0);
  objc_storeStrong((id *)&self->_iCloudAuthToken, 0);
  objc_storeStrong((id *)&self->_cloudKitAuthToken, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_dateRequestWentOut, 0);
  objc_storeStrong((id *)&self->_lastRetryAuthError, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_responseObjectUUIDs, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_c2NetworkingDelegate, 0);
  objc_storeStrong((id *)&self->_urlSessionTask, 0);
  objc_storeStrong((id *)&self->_lifecycleQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fakeResponseOperationResultByItemID, 0);
  objc_storeStrong((id *)&self->_clientProvidedAdditionalHeaderValues, 0);
  objc_storeStrong((id *)&self->_unitTestOverrides, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_testRequestProperties, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_requestOperations, 0);
  objc_storeStrong((id *)&self->_transmissionActivity, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_storeStrong((id *)&self->_streamWriter, 0);
  objc_storeStrong((id *)&self->_fakeResponseData, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_responseProgressBlock, 0);
  objc_storeStrong(&self->_requestProgressBlock, 0);
  objc_storeStrong((id *)&self->_responseBodyParser, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (id)generateRequestOperations
{
  uint64_t v2;
  void *v5;
  const char *v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, CFSTR("CKDURLRequest.m"), 427, CFSTR("To be overridden by subclass"));

  return 0;
}

- (id)returnVerificationKeyAndSignatureForRequestOperation:(id)a3 dataToBeSigned:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)expectsResponseBody
{
  return 1;
}

- (void)_renewAuthTokenWithCompletionHandler:(id)a3
{
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  int v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  id v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t, void *);
  void *v63;
  id v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  CKDURLRequest *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_setIsWaitingOnAuthRenew_(self, v6, 1);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v7;
    objc_msgSend_requestUUID(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v16, 1, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v21, 0, 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v67 = v13;
    v68 = 2114;
    v69 = v15;
    v70 = 2048;
    v71 = self;
    v72 = 2114;
    v73 = v20;
    v74 = 2112;
    v75 = v25;
    _os_log_impl(&dword_1BE990000, v10, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Preparing auth token for request \" \"<%{public}@: %p; %{public}@, %@>\",
      buf,
      0x34u);

  }
  v26 = objc_msgSend_usesiCloudAuthToken(self, v8, v9);
  if (v26 == objc_msgSend_usesCloudKitAuthToken(self, v27, v28))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v29, v30);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v58, v59, (uint64_t)a2, self, CFSTR("CKDURLRequest.m"), 660, CFSTR("You can't set both usesiCloudAuthToken and usesCloudKitAuthToken to the same value"));

  }
  objc_initWeak((id *)buf, self);
  v60 = MEMORY[0x1E0C809B0];
  v61 = 3221225472;
  v62 = sub_1BEA556A4;
  v63 = &unk_1E7830D28;
  objc_copyWeak(&v65, (id *)buf);
  v31 = v5;
  v64 = v31;
  v32 = _Block_copy(&v60);
  objc_msgSend_container(self, v33, v34, v60, v61, v62, v63);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_usesCloudKitAuthToken(self, v36, v37))
  {
    objc_msgSend_account(v35, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_authPromptReason(self, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cloudKitAuthToken(self, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_renewCloudKitAuthTokenWithReason_shouldForce_container_failedToken_completionHandler_(v40, v47, (uint64_t)v43, 0, v35, v46, v32);

  }
  if (objc_msgSend_usesiCloudAuthToken(self, v38, v39))
  {
    objc_msgSend_account(v35, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_authPromptReason(self, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_iCloudAuthToken(self, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_renewiCloudAuthTokenWithReason_shouldForce_container_failedToken_completionHandler_(v50, v57, (uint64_t)v53, 0, v35, v56, v32);

  }
  objc_destroyWeak(&v65);
  objc_destroyWeak((id *)buf);

}

- (void)_handleAuthFailure
{
  _QWORD *v3;
  os_log_t *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  os_log_t v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  os_log_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  CKDURLRequest *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = (os_log_t *)MEMORY[0x1E0C952E0];
  v5 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v5;
    objc_msgSend_requestUUID(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v11;
    _os_log_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Handling authentication failure\", buf, 0xCu);

  }
  objc_msgSend_invalidateCachedAccountInfo(MEMORY[0x1E0C94B88], v6, v7);
  if (objc_msgSend_isCancelled(self, v12, v13))
  {
    if (*v3 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v16 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v16;
      objc_msgSend_requestUUID(self, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v21;
      _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Auth failed but this request is already finished\", buf, 0xCu);

    }
    objc_msgSend_finishWithError_(self, v17, 0);
  }
  else if ((objc_msgSend_didRetryAuth(self, v14, v15) & 1) != 0)
  {
    if (*v3 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      v36 = v23;
      objc_msgSend_requestUUID(self, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v39;
      v44 = 2112;
      v45 = self;
      _os_log_error_impl(&dword_1BE990000, v36, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Our token auth is bad and we've already retried it. Giving up on request %@\", buf, 0x16u);

    }
    objc_msgSend_lastRetryAuthError(self, v24, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v26, *MEMORY[0x1E0C94B20], 2011, CFSTR("Couldn't get an authentication token"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_container(self, v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_possiblyWrappedAuthTokenErrorGivenError_(v29, v30, (uint64_t)v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_finishWithError_(self, v32, (uint64_t)v31);
  }
  else
  {
    objc_msgSend_setDidRetryAuth_(self, v22, 1);
    objc_msgSend_setIsHandlingAuthRetry_(self, v33, 1);
    objc_msgSend_tearDownResourcesAndReleaseTheZoneLocks_(self, v34, 0);
    objc_initWeak((id *)buf, self);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = sub_1BEA55AA0;
    v40[3] = &unk_1E7830D50;
    objc_copyWeak(&v41, (id *)buf);
    objc_msgSend__renewAuthTokenWithCompletionHandler_(self, v35, (uint64_t)v40);
    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);
  }
}

- (void)retryRequest
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_container(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v5, v4, (uint64_t)self);

}

- (void)_handleServerJSONResult:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("throttleConfigs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend_operation(self, v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceContext(v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_throttleManager(v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v54 = v9;
      v17 = v9;
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v55, v65, 16);
      if (v19)
      {
        v21 = v19;
        v22 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v56 != v22)
              objc_enumerationMutation(v17);
            objc_msgSend_throttleFromServerJSONDictionary_(CKDThrottleManager, v20, *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
              objc_msgSend_addThrottle_(v16, v24, (uint64_t)v25);

          }
          v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v55, v65, 16);
        }
        while (v21);
      }

      v9 = v54;
    }
    sub_1BEA55110(self, v7, v8);
    objc_msgSend_response(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_statusCode(v28, v29, v30);

    if ((unint64_t)(v31 - 200) >= 0x64)
    {
      objc_msgSend__parseErrorDictionaryForJson_(self, v32, (uint64_t)v5);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v43 = (void *)*MEMORY[0x1E0C952E0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
      {
        v46 = v43;
        objc_msgSend_requestUUID(self, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v60 = v49;
        v61 = 2048;
        v62 = v31;
        v63 = 2112;
        v64 = v42;
        _os_log_impl(&dword_1BE990000, v46, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Warn: request failed with http status %ld: %@\", buf, 0x20u);

      }
      if (v31 == 401)
        objc_msgSend__handleAuthFailure(self, v44, v45);
      else
        objc_msgSend_finishWithError_(self, v44, (uint64_t)v42);

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v33 = (void *)*MEMORY[0x1E0C952E0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
      {
        v50 = v33;
        objc_msgSend_requestUUID(self, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v53;
        _os_log_debug_impl(&dword_1BE990000, v50, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Successfully parsed JSON object\", buf, 0xCu);

      }
      objc_msgSend_requestDidParseJSONObject_(self, v34, (uint64_t)v5);
    }

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v35 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
    {
      v37 = v35;
      objc_msgSend_requestUUID(self, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v40;
      v61 = 2112;
      v62 = (uint64_t)v4;
      _os_log_impl(&dword_1BE990000, v37, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Warn: Cannot handle JSON response: %@\", buf, 0x16u);

    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v36, *MEMORY[0x1E0C94B20], 1005, CFSTR("Cannot handle JSON response: %@"), v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v41, (uint64_t)v5);
  }

}

- (id)_parseErrorDictionaryForJson:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  void *v48;
  const char *v49;
  int isEqualToString;
  void *v51;
  const char *v52;
  int v53;
  const char *v54;
  int v55;
  id v56;
  const char *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  int v63;
  const char *v64;
  uint64_t v65;
  int v66;
  id v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  const char *v104;
  const char *v105;
  const char *v106;
  const char *v107;
  const char *v108;
  const char *v109;
  const char *v110;
  const char *v111;
  const char *v112;
  const char *v113;
  const char *v114;
  const char *v115;
  const char *v116;
  const char *v117;
  const char *v118;
  const char *v119;
  const char *v120;
  const char *v121;
  const char *v122;
  const char *v123;
  const char *v124;
  const char *v125;
  const char *v126;
  const char *v127;
  const char *v128;
  const char *v129;
  const char *v130;
  const char *v131;
  const char *v132;
  const char *v133;
  const char *v134;
  const char *v135;
  const char *v136;
  const char *v137;
  const char *v138;
  const char *v139;
  const char *v140;
  const char *v141;
  const char *v142;
  const char *v143;
  const char *v144;
  const char *v145;
  const char *v146;
  const char *v147;
  const char *v148;
  const char *v149;
  const char *v150;
  const char *v151;
  const char *v152;
  const char *v153;
  const char *v154;
  const char *v155;
  const char *v156;
  const char *v157;
  const char *v158;
  const char *v159;
  const char *v160;
  const char *v161;
  const char *v162;
  const char *v163;
  const char *v164;
  const char *v165;
  const char *v166;
  uint64_t v167;
  const char *v168;
  void *v169;
  const char *v170;
  void *v171;

  v4 = a3;
  objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v7, (uint64_t)CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend_requestUUID(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_requestUUID(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v9, v16, (uint64_t)v15, *MEMORY[0x1E0C94A48]);

  }
  objc_msgSend_operation(self, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topmostParentOperation(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    objc_msgSend_setObject_forKeyedSubscript_(v9, v24, (uint64_t)v23, *MEMORY[0x1E0C947F8]);
  objc_msgSend_container(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_containerIdentifier(v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v9, v33, (uint64_t)v32, *MEMORY[0x1E0C946F8]);

  }
  if (objc_msgSend_length(v6, v30, v31)
    && objc_msgSend_hasPrefix_(v6, v34, (uint64_t)CFSTR("/errors/ck/")))
  {
    v36 = objc_msgSend_length(CFSTR("/errors/ck/"), v34, v35);
    objc_msgSend_substringFromIndex_(v6, v37, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_componentsSeparatedByString_(v38, v39, (uint64_t)CFSTR("/"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v40, v41, v42) == 2)
    {
      objc_msgSend_objectAtIndexedSubscript_(v40, v43, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v44, v45, (uint64_t)CFSTR("client")))
      {

        goto LABEL_14;
      }
      objc_msgSend_objectAtIndexedSubscript_(v40, v46, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v48, v49, (uint64_t)CFSTR("server"));

      if (isEqualToString)
      {
LABEL_14:
        objc_msgSend_objectAtIndexedSubscript_(v40, v47, 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend_isEqualToString_(v51, v52, (uint64_t)CFSTR("client"));

        if (v53)
        {
          v55 = 1;
          objc_msgSend_objectAtIndexedSubscript_(v40, v54, 1);
          v56 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToString_(v56, v57, (uint64_t)CFSTR("unknown")) & 1) == 0)
          {
            if ((objc_msgSend_isEqualToString_(v56, v58, (uint64_t)CFSTR("expiredAppConfig")) & 1) != 0)
            {
              v55 = 2;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v59, (uint64_t)CFSTR("expiredGlobalConfig")) & 1) != 0)
            {
              v55 = 3;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v71, (uint64_t)CFSTR("badSyntax")) & 1) != 0)
            {
              v55 = 4;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v73, (uint64_t)CFSTR("forbidden")) & 1) != 0)
            {
              v55 = 5;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v75, (uint64_t)CFSTR("throttled")) & 1) != 0)
            {
              v55 = 6;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v77, (uint64_t)CFSTR("refused")) & 1) != 0)
            {
              v55 = 7;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v79, (uint64_t)CFSTR("notSupported")) & 1) != 0)
            {
              v55 = 8;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v81, (uint64_t)CFSTR("exists")) & 1) != 0)
            {
              v55 = 9;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v83, (uint64_t)CFSTR("requestAlreadyProcessed")) & 1) != 0)
            {
              v55 = 10;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v86, (uint64_t)CFSTR("badAuthToken")) & 1) != 0)
            {
              v55 = 11;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v87, (uint64_t)CFSTR("needsAuthentication")) & 1) != 0)
            {
              v55 = 12;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v89, (uint64_t)CFSTR("mescalSignatureMissing")) & 1) != 0)
            {
              v55 = 13;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v91, (uint64_t)CFSTR("invalidMescalSignature")) & 1) != 0)
            {
              v55 = 14;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v93, (uint64_t)CFSTR("opLockFailure")) & 1) != 0)
            {
              v55 = 15;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v94, (uint64_t)CFSTR("atomicFailure")) & 1) != 0)
            {
              v55 = 16;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v95, (uint64_t)CFSTR("resetNeeded")) & 1) != 0)
            {
              v55 = 17;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v96, (uint64_t)CFSTR("fieldsPerTypeLimitExceeded")) & 1) != 0)
            {
              v55 = 18;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v97, (uint64_t)CFSTR("typeBusy")) & 1) != 0)
            {
              v55 = 19;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v98, (uint64_t)CFSTR("numRecordTypesLimitExceeded")) & 1) != 0)
            {
              v55 = 20;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v99, (uint64_t)CFSTR("invalidContainer")) & 1) != 0)
            {
              v55 = 21;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v100, (uint64_t)CFSTR("invalidRecordTypeName")) & 1) != 0)
            {
              v55 = 22;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v101, (uint64_t)CFSTR("invalidFieldName")) & 1) != 0)
            {
              v55 = 23;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v102, (uint64_t)CFSTR("invalidFieldValue")) & 1) != 0)
            {
              v55 = 24;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v103, (uint64_t)CFSTR("invalidIdentifier")) & 1) != 0)
            {
              v55 = 25;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v104, (uint64_t)CFSTR("fieldNotQueryable")) & 1) != 0)
            {
              v55 = 26;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v105, (uint64_t)CFSTR("fieldNotSortable")) & 1) != 0)
            {
              v55 = 27;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v106, (uint64_t)CFSTR("queryFilterLimitExceeded")) & 1) != 0)
            {
              v55 = 28;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v107, (uint64_t)CFSTR("queryFilterValuesLimitExceeded")) & 1) != 0)
            {
              v55 = 29;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v108, (uint64_t)CFSTR("membershipQueryLimitExceeded")) & 1) != 0)
            {
              v55 = 30;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v109, (uint64_t)CFSTR("notificationAdditionalFieldLimitExceeded")) & 1) != 0)
            {
              v55 = 31;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v110, (uint64_t)CFSTR("notificationAdditionalFieldInvalidType")) & 1) != 0)
            {
              v55 = 32;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v111, (uint64_t)CFSTR("subscriptionLimitExceeded")) & 1) != 0)
            {
              v55 = 33;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v112, (uint64_t)CFSTR("uniqueTriggerLimitExceeded")) & 1) != 0)
            {
              v55 = 34;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v113, (uint64_t)CFSTR("triggerSubscriptionBindingTypeMismatch")) & 1) != 0)
            {
              v55 = 35;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v114, (uint64_t)CFSTR("zoneSizeLimitExceeded")) & 1) != 0)
            {
              v55 = 36;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v115, (uint64_t)CFSTR("zoneCountLimitExceeded")) & 1) != 0)
            {
              v55 = 37;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v116, (uint64_t)CFSTR("uniqueFieldFailure")) & 1) != 0)
            {
              v55 = 38;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v117, (uint64_t)CFSTR("validatingReferenceError")) & 1) != 0)
            {
              v55 = 39;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v118, (uint64_t)CFSTR("fullResetNeeded")) & 1) != 0)
            {
              v55 = 40;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v119, (uint64_t)CFSTR("alreadyShared")) & 1) != 0)
            {
              v55 = 41;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v120, (uint64_t)CFSTR("emailOutOfNetwork")) & 1) != 0)
            {
              v55 = 42;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v121, (uint64_t)CFSTR("duplicateSubscription")) & 1) != 0)
            {
              v55 = 43;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v122, (uint64_t)CFSTR("expiredPutReceipt")) & 1) != 0)
            {
              v55 = 46;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v123, (uint64_t)CFSTR("quotaExceeded")) & 1) != 0)
            {
              v55 = 47;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v124, (uint64_t)CFSTR("zoneNotFound")) & 1) != 0)
            {
              v55 = 48;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v125, (uint64_t)CFSTR("invalidBundleId")) & 1) != 0)
            {
              v55 = 49;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v126, (uint64_t)CFSTR("unsupportedDevice")) & 1) != 0)
            {
              v55 = 50;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v127, (uint64_t)CFSTR("blocklisted")) & 1) != 0)
            {
              v55 = 51;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v128, (uint64_t)CFSTR("recordProtectionInfoTagMismatch")) & 1) != 0)
            {
              v55 = 52;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v129, (uint64_t)CFSTR("zoneProtectionInfoTagMismatch")) & 1) != 0)
            {
              v55 = 53;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v130, (uint64_t)CFSTR("assetSizeLimitExceeded")) & 1) != 0)
            {
              v55 = 54;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v131, (uint64_t)CFSTR("batchOperationLimitExceeded")) & 1) != 0)
            {
              v55 = 55;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v132, (uint64_t)CFSTR("requestSizeLimitExceeded")) & 1) != 0)
            {
              v55 = 56;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v133, (uint64_t)CFSTR("recordSizeLimitExceeded")) & 1) != 0)
            {
              v55 = 57;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v134, (uint64_t)CFSTR("databaseCommitSizeExceeded")) & 1) != 0)
            {
              v55 = 58;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v135, (uint64_t)CFSTR("userDeletedDataForZone")) & 1) != 0)
            {
              v55 = 59;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v136, (uint64_t)CFSTR("staleRecordUpdate")) & 1) != 0)
            {
              v55 = 60;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v137, (uint64_t)CFSTR("shareParticipantLimitExceeded")) & 1) != 0)
            {
              v55 = 61;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v138, (uint64_t)CFSTR("shareParticipantError")) & 1) != 0)
            {
              v55 = 62;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v139, (uint64_t)CFSTR("pcsChainingError")) & 1) != 0)
            {
              v55 = 64;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v140, (uint64_t)CFSTR("hierarchyAlreadyHasShare")) & 1) != 0)
            {
              v55 = 65;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v141, (uint64_t)CFSTR("u13Restricted")) & 1) != 0)
            {
              v55 = 66;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v142, (uint64_t)CFSTR("managedAppleIdRestricted")) & 1) != 0)
            {
              v55 = 67;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v143, (uint64_t)CFSTR("shareParticipantContactError")) & 1) != 0)
            {
              v55 = 68;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v144, (uint64_t)CFSTR("recordArchived")) & 1) != 0)
            {
              v55 = 69;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v145, (uint64_t)CFSTR("databaseAccessDenied")) & 1) != 0)
            {
              v55 = 70;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v146, (uint64_t)CFSTR("parentHierarchyDepthLimitExceeded")) & 1) != 0)
            {
              v55 = 71;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v147, (uint64_t)CFSTR("zonePcsUserIdentityUnknown")) & 1) != 0)
            {
              v55 = 72;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v148, (uint64_t)CFSTR("managedAppleIdBackupBlocked")) & 1) != 0)
            {
              v55 = 73;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v149, (uint64_t)CFSTR("outOfNetworkUsersUnsupported")) & 1) != 0)
            {
              v55 = 75;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v150, (uint64_t)CFSTR("gameAssignmentNotFound")) & 1) != 0)
            {
              v55 = 76;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v151, (uint64_t)CFSTR("queryBeginsWithValueLengthLimitExceeded")) & 1) != 0)
            {
              v55 = 77;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v152, (uint64_t)CFSTR("userResetEncryptedData")) & 1) != 0)
            {
              v55 = 78;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v153, (uint64_t)CFSTR("mergeableValueNotFound")) & 1) != 0)
            {
              v55 = 79;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v154, (uint64_t)CFSTR("invalidPublicKey")) & 1) != 0)
            {
              v55 = 80;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v155, (uint64_t)CFSTR("mergeableDeltaSizeLimitExceeded")) & 1) != 0)
            {
              v55 = 81;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v156, (uint64_t)CFSTR("mergeableDeltaNotFound")) & 1) != 0)
            {
              v55 = 82;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v157, (uint64_t)CFSTR("mergeableDeltaInvalid")) & 1) != 0)
            {
              v55 = 83;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v158, (uint64_t)CFSTR("mergeableValueCompactionRequired")) & 1) != 0)
            {
              v55 = 84;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v159, (uint64_t)CFSTR("unprovisionedICloudAccount")) & 1) != 0)
            {
              v55 = 85;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v160, (uint64_t)CFSTR("purgedICloudAccount")) & 1) != 0)
            {
              v55 = 86;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v161, (uint64_t)CFSTR("invalidDsidForICloudAccount")) & 1) != 0)
            {
              v55 = 87;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v162, (uint64_t)CFSTR("shareRegionUnsupported")) & 1) != 0)
            {
              v55 = 88;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v163, (uint64_t)CFSTR("a2aSignatureValidationError")) & 1) != 0)
            {
              v55 = 89;
            }
            else if ((objc_msgSend_isEqualToString_(v56, v164, (uint64_t)CFSTR("participantIdMismatch")) & 1) != 0)
            {
              v55 = 90;
            }
            else if (objc_msgSend_isEqualToString_(v56, v165, (uint64_t)CFSTR("groupKitSignatureValidationError")))
            {
              v55 = 94;
            }
            else
            {
              v55 = 1;
            }
          }

          v92 = sub_1BEB10B5C(v55);
        }
        else
        {
          objc_msgSend_objectAtIndexedSubscript_(v40, v54, 0);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend_isEqualToString_(v61, v62, (uint64_t)CFSTR("server"));

          if (!v63)
          {
            v60 = 1000;
LABEL_220:
            if (objc_msgSend_length(v8, v64, v65))
            {
              objc_msgSend_setObject_forKeyedSubscript_(v9, v166, (uint64_t)v8, *MEMORY[0x1E0CB2D50]);
              objc_msgSend_setObject_forKeyedSubscript_(v9, v168, (uint64_t)v8, *MEMORY[0x1E0C94810]);
            }
            objc_msgSend_response(self, v166, v167);
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            CKAddResponseHeaderValuesToUserInfoDictionary();

            goto LABEL_223;
          }
          v66 = 1;
          objc_msgSend_objectAtIndexedSubscript_(v40, v64, 1);
          v67 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToString_(v67, v68, (uint64_t)CFSTR("unknown")) & 1) == 0)
          {
            if ((objc_msgSend_isEqualToString_(v67, v69, (uint64_t)CFSTR("overloaded")) & 1) != 0)
            {
              v66 = 2;
            }
            else if ((objc_msgSend_isEqualToString_(v67, v70, (uint64_t)CFSTR("notFound")) & 1) != 0)
            {
              v66 = 3;
            }
            else if ((objc_msgSend_isEqualToString_(v67, v72, (uint64_t)CFSTR("containerUnavailable")) & 1) != 0)
            {
              v66 = 4;
            }
            else if ((objc_msgSend_isEqualToString_(v67, v74, (uint64_t)CFSTR("mescalSignatureParseError")) & 1) != 0)
            {
              v66 = 6;
            }
            else if ((objc_msgSend_isEqualToString_(v67, v76, (uint64_t)CFSTR("zoneBusy")) & 1) != 0)
            {
              v66 = 7;
            }
            else if ((objc_msgSend_isEqualToString_(v67, v78, (uint64_t)CFSTR("zoneUnavailable")) & 1) != 0)
            {
              v66 = 8;
            }
            else if ((objc_msgSend_isEqualToString_(v67, v80, (uint64_t)CFSTR("transactionTimeout")) & 1) != 0)
            {
              v66 = 9;
            }
            else
            {
              v66 = 200001;
              if ((objc_msgSend_isEqualToString_(v67, v82, (uint64_t)CFSTR("partitionLookupFailed")) & 1) == 0)
              {
                if ((objc_msgSend_isEqualToString_(v67, v84, (uint64_t)CFSTR("timeoutOnInternalBackends")) & 1) != 0)
                {
                  v66 = 200002;
                }
                else if ((objc_msgSend_isEqualToString_(v67, v85, (uint64_t)CFSTR("solrError")) & 1) != 0)
                {
                  v66 = 200003;
                }
                else if ((objc_msgSend_isEqualToString_(v67, v88, (uint64_t)CFSTR("userAssignmentLocked")) & 1) != 0)
                {
                  v66 = 200004;
                }
                else if (objc_msgSend_isEqualToString_(v67, v90, (uint64_t)CFSTR("quotaServiceUnavailable")))
                {
                  v66 = 200005;
                }
                else
                {
                  v66 = 1;
                }
              }
            }
          }

          v92 = sub_1BEB10AC0(v66);
        }
        v60 = v92;
        goto LABEL_220;
      }
    }
    v60 = 1000;
LABEL_223:

    v6 = v38;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v170, *MEMORY[0x1E0C94B20], v60, v9);
    goto LABEL_224;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v34, *MEMORY[0x1E0C94B20], 1000, v9);
LABEL_224:
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  return v171;
}

- (void)_handlePlistResult:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = (void *)*MEMORY[0x1E0C952F8];
  if ((isKindOfClass & 1) != 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v6);
    v7 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
    {
      v14 = v7;
      objc_msgSend_requestUUID(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_debug_impl(&dword_1BE990000, v14, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Successfully parsed plist object\", (uint8_t *)&v18, 0xCu);

    }
    objc_msgSend_requestDidParsePlistObject_(self, v8, (uint64_t)v4);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v6);
    v9 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend_requestUUID(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v13;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_1BE990000, v10, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Warn: Failed to handle plist response: %@\", (uint8_t *)&v18, 0x16u);

    }
  }

}

- (id)traceHeaderValues
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  char v8;
  const char *v9;
  void *v10;
  const char *v11;
  int isEqualToString;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  int isAppleInternalInstall;

  v2 = (void *)objc_opt_new();
  objc_msgSend_sharedMonitor(CKDSystemAvailabilityMonitor, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_availabilityState(v5, v6, v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v2, v9, (uint64_t)CFSTR("true"), 0x1E7840F48);
    CKDeviceClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("AudioAccessory"));

    if (isEqualToString)
      objc_msgSend_setObject_forKeyedSubscript_(v2, v13, (uint64_t)CFSTR("true"), 0x1E7840F68);
  }
  if ((CKIsBundleIDForeground(CFSTR("com.apple.HDSViewService")) & 1) != 0
    || (objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v14, v15),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v16, v17, v18),
        v16,
        isAppleInternalInstall)
    && (int)CKPIDForProcessNamed() >= 1)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v2, v14, (uint64_t)CFSTR("true"), 0x1E7840F68);
  }
  return v2;
}

- (BOOL)expectsSingleObject
{
  return 0;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  void *v5;
  const char *v6;
  const char *v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, CFSTR("CKDURLRequest.m"), 1180, CFSTR("To be overridden by subclass"));

  return (id)objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v7, *MEMORY[0x1E0C947D8], 12, CFSTR("To be overridden by subclass"));
}

- (void)requestDidParseJSONObject:(id)a3
{
  const char *v4;
  id v5;

  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], a2, *MEMORY[0x1E0C94B20], 1005, CFSTR("Received a json payload that we weren't expecting: %@"), a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishWithError_(self, v4, (uint64_t)v5);

}

- (void)requestDidParsePlistObject:(id)a3
{
  const char *v5;
  id v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, CFSTR("CKDURLRequest.m"), 1197, CFSTR("To be overridden by subclass"));

}

- (void)requestDidParsePlaintextObject:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  id v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0C94FF8];
  v5 = *MEMORY[0x1E0C94B20];
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a3;
  v8 = [v6 alloc];
  v13 = (id)objc_msgSend_initWithData_encoding_(v8, v9, (uint64_t)v7, 4);

  objc_msgSend_errorWithDomain_code_format_(v4, v10, v5, 1005, CFSTR("Received a plaintext response that we weren't expecting: %@"), v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__finishOnLifecycleQueueWithError_(self, v12, (uint64_t)v11);

}

- (void)requestDidParse509CertObject:(id)a3
{
  const char *v4;
  id v5;

  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], a2, *MEMORY[0x1E0C94B20], 1005, CFSTR("Received a 509 cert response that we weren't expecting: %@"), a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__finishOnLifecycleQueueWithError_(self, v4, (uint64_t)v5);

}

- (void)requestDidParseNodeFailure:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  int hasTypeCode;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  id v42;

  v42 = a3;
  objc_msgSend_result(v42, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasExtensionError(v9, v10, v11) & 1) == 0)
  {

    v26 = v42;
    goto LABEL_5;
  }
  objc_msgSend_result(v42, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extensionError(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  hasTypeCode = objc_msgSend_hasTypeCode(v20, v21, v22);

  v26 = v42;
  if (!hasTypeCode)
  {
LABEL_5:
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0C94B20];
    objc_msgSend_result(v26, v24, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = sub_1BEB10D5C(v29);
    objc_msgSend_result(v42, v37, v38);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(self, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v34, v39, v35, v36, v32);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__finishOnLifecycleQueueWithError_(self, v41, (uint64_t)v40);

    goto LABEL_6;
  }
  v27 = (void *)MEMORY[0x1E0C94FF8];
  v28 = *MEMORY[0x1E0C94B20];
  objc_msgSend_result(v42, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1BEB10290(self, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_format_(v27, v31, v28, 6000, v30, CFSTR("Plugin-Specific Error"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__finishOnLifecycleQueueWithError_(self, v33, (uint64_t)v32);
LABEL_6:

}

- (NSArray)requestOperationClasses
{
  uint64_t v2;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  const char *v9;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v9, (uint64_t)a2, self, CFSTR("CKDURLRequest.m"), 1320, CFSTR("%@ should be overwritten by the subclass (%@)"), v6, v8);

  return 0;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C950D8]);
  objc_msgSend_fillOutEquivalencyPropertiesBuilder_(self, v4, (uint64_t)v3);
  objc_msgSend_properties(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v7;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v7, (uint64_t)v6, CFSTR("super.className"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend_databaseScope(self, v9, v10);
  objc_msgSend_numberWithInteger_(v8, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, CFSTR("super.databaseScope"));

  objc_msgSend_container(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerScopedUserID(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v21, (uint64_t)v20, CFSTR("super.csuid"));

  objc_msgSend_container(self, v22, v23);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v28, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v27, (uint64_t)v26, CFSTR("super.containerID"));

}

- (void)fillOutRequestProperties:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v8 = a3;
  v6 = objc_msgSend_databaseScope(self, v4, v5);
  objc_msgSend_setDatabaseScope_(v8, v7, v6);

}

- (id)privacyProxyFailClosedOverride
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privacyProxyFailClosedOverride(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)authPromptReason
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_operation(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_authPromptReason(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)requiresCKAnonymousSignature
{
  return 0;
}

- (BOOL)allowsAnonymousAccount
{
  return 0;
}

- (CKTestRequestProperties)testRequestProperties
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  CKTestRequestProperties *v10;
  const char *v11;
  CKTestRequestProperties *testRequestProperties;

  objc_msgSend_lifecycleQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (*MEMORY[0x1E0C95280] && !self->_testRequestProperties)
  {
    objc_msgSend_equivalencyProperties(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(NSClassFromString(CFSTR("CKTestRequestProperties")));
    v10 = (CKTestRequestProperties *)objc_msgSend_initWithEquivalencyProperties_(v8, v9, (uint64_t)v7);
    objc_msgSend_fillOutRequestProperties_(self, v11, (uint64_t)v10);
    testRequestProperties = self->_testRequestProperties;
    self->_testRequestProperties = v10;

  }
  return self->_testRequestProperties;
}

- (BOOL)wantsProtocolTranslator
{
  uint64_t v2;

  return (unint64_t)objc_msgSend_serverType(self, a2, v2) < 4;
}

- (void)_fetchServerCertificatesIfNeeded
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BEA58288;
  v2[3] = &unk_1E782EA40;
  v2[4] = self;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)_performWillSendTestCallback
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BEA588D8;
  v2[3] = &unk_1E782EA40;
  v2[4] = self;
  objc_msgSend_performASyncOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v2);
}

- (void)cancel
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend_lifecycleQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA594F8;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)invokeCompletionBlock
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void (**v8)(void);
  const char *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend_completionBlock(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v5 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
    {
      v10 = v5;
      objc_msgSend_requestUUID(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_debug_impl(&dword_1BE990000, v10, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Calling completion block\", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend_completionBlock(self, v6, v7);
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

    objc_msgSend_setCompletionBlock_(self, v9, 0);
  }
}

- (void)_triggerAutoBugCaptureWithErrorPayload:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  char v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_serverProvidedAutoBugCaptureReason(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v17);
  if (qword_1EF577A00 && (objc_msgSend_timeIntervalSinceNow((void *)qword_1EF577A00, v18, v19), v20 > -10.0))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = (id)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_container(self, v22, v23);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_processName(v66, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v71 = v16;
      v72 = 2114;
      v73 = v69;
      v74 = 2114;
      v75 = v13;
      v76 = 2114;
      v77 = v4;
      _os_log_error_impl(&dword_1BE990000, v21, OS_LOG_TYPE_ERROR, "Too many server triggered ABCs. Logging locally: %{public}@. proc: %{public}@. containerID: %{public}@. error: %{public}@.", buf, 0x2Au);

    }
    objc_sync_exit(v17);
  }
  else
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v18, v19);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)qword_1EF577A00;
    qword_1EF577A00 = v24;

    objc_sync_exit(v17);
    if (objc_msgSend_length(v13, v26, v27))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v28, (uint64_t)CFSTR("%@: %@"), v13, v16);
      v30 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v30;
    }
    if ((unint64_t)objc_msgSend_length(v16, v28, v29) >= 0x65)
    {
      v33 = (void *)MEMORY[0x1E0CB3940];
      v34 = objc_msgSend_hash(v16, v31, v32);
      objc_msgSend_stringWithFormat_(v33, v35, (uint64_t)CFSTR(":0x%lx"), v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_length(v36, v37, v38);
      objc_msgSend_substringToIndex_(v16, v40, 100 - v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingString_(v41, v42, (uint64_t)v36);
      v43 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v43;
    }
    v17 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
    objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processName(v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signatureWithDomain_type_subType_detectedProcess_triggerThresholdValues_(v17, v50, (uint64_t)CFSTR("CloudKit"), CFSTR("Functional"), CFSTR("ServerTriggered"), v49, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setObject_forKeyedSubscript_(v51, v52, (uint64_t)v16, *MEMORY[0x1E0DB00F0]);
    objc_msgSend_container(self, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processName(v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v51, v59, (uint64_t)v58, *MEMORY[0x1E0DB00D0]);

    objc_msgSend_setObject_forKeyedSubscript_(v51, v60, (uint64_t)v13, CFSTR("ckContainerID"));
    v62 = objc_msgSend_snapshotWithSignature_duration_event_payload_reply_(v17, v61, (uint64_t)v51, 0, 0, &unk_1E78310D8, 15.0);
    v63 = (void *)*MEMORY[0x1E0C952F8];
    if ((v62 & 1) != 0)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v63);
      v64 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v71 = v16;
        _os_log_debug_impl(&dword_1BE990000, v64, OS_LOG_TYPE_DEBUG, "Diagnostic Reporter took a snapshot for signature %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v63);
      v65 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v71 = v16;
        _os_log_error_impl(&dword_1BE990000, v65, OS_LOG_TYPE_ERROR, "Diagnostic Reporter failed to take snapshot for signature %{public}@", buf, 0xCu);
      }
    }

  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  os_signpost_id_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  const char *v34;
  _QWORD v35[4];
  id v36;
  CKDURLRequest *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[16];

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend_signpost(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_signpost(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_log(v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_signpost(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_identifier(v26, v27, v28);

    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE990000, v23, OS_SIGNPOST_EVENT, v29, "CKDURLRequest", "Performing HTTP redirection", buf, 2u);
    }

  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_1BEA59F54;
  v35[3] = &unk_1E7831170;
  v36 = v11;
  v37 = self;
  v30 = v14;
  v40 = v30;
  v38 = v12;
  v31 = v13;
  v39 = v31;
  v32 = v12;
  v33 = v11;
  if ((objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, v34, (uint64_t)v35) & 1) == 0)
    (*((void (**)(id, id))v30 + 2))(v30, v31);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;
  dispatch_time_t v27;
  _QWORD v28[4];
  NSObject *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend_requestUUID(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v15;
    v32 = 2048;
    v33 = objc_msgSend_length(v10, v16, v17);
    _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"URLSession:dataTask:didReceiveData: %ld bytes\", buf, 0x16u);

  }
  v18 = dispatch_group_create();
  dispatch_group_enter(v18);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1BEA5AA20;
  v28[3] = &unk_1E782EA40;
  v29 = v18;
  v19 = v18;
  objc_msgSend_URLSession_dataTask__didReceiveData_completionHandler_(self, v20, (uint64_t)v8, v9, v10, v28);
  objc_msgSend_timeoutIntervalForResource(self, v21, v22);
  v24 = v23 * 1000000000.0;
  v25 = v23 <= 0.0;
  v26 = 1.84467441e19;
  if (!v25)
    v26 = v24;
  v27 = dispatch_time(0, (uint64_t)v26);
  dispatch_group_wait(v19, v27);

}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEA5ABBC;
  v17[3] = &unk_1E782F678;
  v17[4] = self;
  v9 = v7;
  v18 = v9;
  v10 = v8;
  v19 = v10;
  if ((objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, v11, (uint64_t)v17) & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend_requestUUID(self, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEFAULT, "req: %{public}@, \"Asked for a new body stream while already cancelled.  Soldiering on without a request body\", buf, 0xCu);

    }
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)URLSession:(id)a3 _taskIsWaitingForConnection:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BEA5AFFC;
  v4[3] = &unk_1E782EA40;
  v4[4] = self;
  objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v4, a4);
}

- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BEA5B1F0;
  v5[3] = &unk_1E7830650;
  v6 = a5;
  v5[4] = self;
  objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, a2, (uint64_t)v5, a4);
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEA5B4B0;
  v9[3] = &unk_1E782EE20;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  objc_msgSend_performOnLifecycleQueueIfNotFinished_(self, v8, (uint64_t)v9);

}

- (NSDictionary)responseHeaders
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_response(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allHeaderFields(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (id)statusReportWithIndent:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;

  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = CKTabIndentAtDepth();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestUUID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v11, (uint64_t)CFSTR("%s<%@ %@ "), v5, v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v13, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isFinished(self, v15, v16))
    objc_msgSend_addObject_(v14, v17, (uint64_t)CFSTR("finished"));
  if (objc_msgSend_isCancelled(self, v17, v18))
    objc_msgSend_addObject_(v14, v19, (uint64_t)CFSTR("cancelled"));
  if (objc_msgSend_count(v14, v19, v20))
  {
    objc_msgSend_componentsJoinedByString_(v14, v21, (uint64_t)CFSTR("|"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v12, v24, (uint64_t)CFSTR("stateFlags=%@ "), v23);

  }
  if (objc_msgSend_isWaitingOnAuthRenew(self, v21, v22))
    objc_msgSend_appendString_(v12, v25, (uint64_t)CFSTR("(waiting on auth)"));
  objc_msgSend_urlSessionTask(self, v25, v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend__CFNetworkTaskIdentifierString(self, v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v12, v31, (uint64_t)CFSTR("CFNetwork task: %@ "), v30);

  }
  objc_msgSend_appendString_(v12, v27, (uint64_t)CFSTR(">\n"));

  return v12;
}

- (BOOL)allowAutomaticRedirects
{
  return self->_allowAutomaticRedirects;
}

- (void)setAllowAutomaticRedirects:(BOOL)a3
{
  self->_allowAutomaticRedirects = a3;
}

- (NSDictionary)unitTestOverrides
{
  return self->_unitTestOverrides;
}

- (void)setUnitTestOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_unitTestOverrides, a3);
}

- (NSDictionary)fakeResponseOperationResultByItemID
{
  return self->_fakeResponseOperationResultByItemID;
}

- (void)setFakeResponseOperationResultByItemID:(id)a3
{
  objc_storeStrong((id *)&self->_fakeResponseOperationResultByItemID, a3);
}

- (void)setNeedsAuthRetry:(BOOL)a3
{
  self->_needsAuthRetry = a3;
}

- (BOOL)isWaitingOnAuthRenew
{
  return self->_isWaitingOnAuthRenew;
}

- (void)setIsWaitingOnAuthRenew:(BOOL)a3
{
  self->_isWaitingOnAuthRenew = a3;
}

- (void)setLifecycleQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lifecycleQueue, a3);
}

- (C2NetworkingDelegate)c2NetworkingDelegate
{
  return self->_c2NetworkingDelegate;
}

- (void)setC2NetworkingDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_c2NetworkingDelegate, a3);
}

- (NSURLSession)urlSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 248, 1);
}

- (void)setResponseObjectUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_responseObjectUUIDs, a3);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (unint64_t)numDownloadedElements
{
  return self->_numDownloadedElements;
}

- (void)setNumDownloadedElements:(unint64_t)a3
{
  self->_numDownloadedElements = a3;
}

- (BOOL)didRetryAuth
{
  return self->_didRetryAuth;
}

- (void)setDidRetryAuth:(BOOL)a3
{
  self->_didRetryAuth = a3;
}

- (NSError)lastRetryAuthError
{
  return self->_lastRetryAuthError;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)haveCachedServerType
{
  return self->_haveCachedServerType;
}

- (void)setHaveCachedServerType:(BOOL)a3
{
  self->_haveCachedServerType = a3;
}

- (BOOL)haveCachedPartitionType
{
  return self->_haveCachedPartitionType;
}

- (void)setHaveCachedPartitionType:(BOOL)a3
{
  self->_haveCachedPartitionType = a3;
}

- (int64_t)cachedServerType
{
  return self->_cachedServerType;
}

- (void)setCachedServerType:(int64_t)a3
{
  self->_cachedServerType = a3;
}

- (int64_t)cachedPartitionType
{
  return self->_cachedPartitionType;
}

- (void)setCachedPartitionType:(int64_t)a3
{
  self->_cachedPartitionType = a3;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (OS_voucher)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_voucher, a3);
}

- (NSString)iCloudAuthToken
{
  return self->_iCloudAuthToken;
}

- (void)setICloudAuthToken:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudAuthToken, a3);
}

- (void)setServerProvidedAutoBugCaptureReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (void)setServerProvidedTapToRadarRequest:(id)a3
{
  objc_storeStrong((id *)&self->_serverProvidedTapToRadarRequest, a3);
}

- (BOOL)didFetchNilAuthToken
{
  return self->_didFetchNilAuthToken;
}

- (void)setDidFetchNilAuthToken:(BOOL)a3
{
  self->_didFetchNilAuthToken = a3;
}

@end
