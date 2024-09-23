@implementation FCCKDirectRequestOperation

- (id)_requestBodyData
{
  id *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;
  _WORD *v11;
  _WORD *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  char v19;
  char v20;
  _WORD *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  __CFString *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  _BYTE *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  id *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  __int16 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 384), "firstObject");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  -[FCCKPRequestOperation setHeader:]((uint64_t)v2, v3);

  -[FCCKDirectRequestOperation _bundleIDToReport]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v5 = v2[1];
  else
    v5 = 0;
  v6 = v5;
  -[FCCKPRequestOperationHeader setApplicationBundle:]((uint64_t)v6, v4);

  v7 = *(id *)(a1 + 400);
  if (v2)
    v8 = v2[1];
  else
    v8 = 0;
  v9 = v8;
  -[FCCKPRequestOperationHeader setApplicationContainer:]((uint64_t)v9, v7);

  if (*(_BYTE *)(a1 + 376))
    v10 = 1;
  else
    v10 = 2;
  if (v2)
  {
    v11 = v2[1];
    if (v11)
    {
      v11[110] |= 0x40u;
      *((_DWORD *)v11 + 18) = v10;
    }

    v12 = v2[1];
    if (v12)
    {
      v12[110] |= 0x200u;
      *((_DWORD *)v12 + 50) = 2;
    }
  }
  else
  {
    v12 = 0;
  }

  CKProductType();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v14 = v2[1];
  else
    v14 = 0;
  v15 = v14;
  -[FCCKPRequestOperationHeader setDeviceHardwareVersion:]((uint64_t)v15, v13);

  CKProductVersion();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v17 = v2[1];
  else
    v17 = 0;
  v18 = v17;
  -[FCCKPRequestOperationHeader setDeviceSoftwareVersion:]((uint64_t)v18, v16);

  v19 = NFInternalBuild();
  if (v2)
  {
    v20 = v19;
    v21 = v2[1];
    if (v21)
    {
      v21[110] |= 0x400u;
      *((_BYTE *)v21 + 216) = v20;
    }
  }
  else
  {
    v21 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "infoDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (id *)a1;
  if (v2)
    v25 = v2[1];
  else
    v25 = 0;
  v26 = v25;
  -[FCCKPRequestOperationHeader setDeviceLibraryName:]((uint64_t)v26, v24);

  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAF0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v28 = v2[1];
  else
    v28 = 0;
  v29 = v28;
  -[FCCKPRequestOperationHeader setDeviceLibraryVersion:]((uint64_t)v29, v27);

  v30 = (void *)objc_opt_new();
  v67 = v4;
  v63 = v23;
  if (v2)
    v31 = v2[1];
  else
    v31 = 0;
  v32 = v31;
  -[FCCKPRequestOperationHeader setLocale:]((uint64_t)v32, v30);

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale", v23);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v65 = v22;
  if (v2)
  {
    v36 = v2[1];
    v37 = v36;
    if (v36)
    {
      v38 = (void *)*((_QWORD *)v36 + 22);
      goto LABEL_31;
    }
  }
  else
  {
    v37 = 0;
  }
  v38 = 0;
LABEL_31:
  v39 = v38;
  -[FCCKPLocale setLanguageCode:]((uint64_t)v39, v35);

  if (!v34)
  {

  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v42 = v2[1];
    v43 = v42;
    v44 = v67;
    if (v42)
      v45 = (void *)*((_QWORD *)v42 + 22);
    else
      v45 = 0;
  }
  else
  {
    v43 = 0;
    v45 = 0;
    v44 = v67;
  }
  v46 = v45;
  -[FCCKPLocale setRegionCode:]((uint64_t)v46, v41);

  objc_msgSend(v66, "purpose");
  v47 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v47 != CFSTR("unknown"))
  {
    objc_msgSend(v66, "purpose");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v49 = v2[1];
    else
      v49 = 0;
    v50 = v49;
    -[FCCKPRequestOperationHeader setOperationGroupName:]((uint64_t)v50, v48);

  }
  objc_msgSend(v66[48], "lastObject", v63);
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v51;
  if (v51)
  {
    v53 = *(id *)(v51 + 32);
    if (v53)
    {
      v53[24] |= 2u;
      v53[20] = 1;
    }
  }
  else
  {
    v53 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v55 = v66[48];
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v69 != v58)
          objc_enumerationMutation(v55);
        objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "data");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0;
        v72 = 0;
        objc_msgSend(v60, "length");
        objc_msgSend(v54, "appendBytes:length:", &v72, PBDataWriterWriteBareVarint());
        objc_msgSend(v54, "appendData:", v60);

      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v57);
  }

  objc_msgSend(v54, "fc_gzipDeflate");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  return v61;
}

- (void)performOperation
{
  FCCKDirectRequestOperation *v2;
  void *v3;
  NSArray *v4;
  void *v5;
  NSError *resultError;
  NSURL *v7;
  id v8;
  NSURL *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  id *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  FCEdgeCacheHint *v31;
  void *v32;
  void *v33;
  void *v34;
  id *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  int v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  NSObject *v72;
  char *v73;
  id networkActivityBlock;
  void (**v75)(void);
  void *v76;
  FCNetworkActivity *v77;
  uint64_t v78;
  void *v79;
  id v80;
  _QWORD v81[5];
  id v82;
  id v83;
  _BYTE *v84;
  __int128 *v85;
  _QWORD v86[5];
  id v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE buf[24];
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  uint8_t v97[4];
  const char *v98;
  __int16 v99;
  char *v100;
  __int16 v101;
  int v102;
  __int16 v103;
  void *v104;
  uint64_t v105;

  v2 = self;
  v105 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (FCCKDirectRequestOperation *)self->_requests;
  if ((unint64_t)-[FCCKDirectRequestOperation count](self, "count") < 0x191)
  {
    objc_opt_self();
    if (qword_1ED0F7B58 != -1)
      dispatch_once(&qword_1ED0F7B58, &__block_literal_global_71);
    v80 = (id)qword_1ED0F7B50;
    if (!v2)
    {
      v8 = 0;
      goto LABEL_59;
    }
    v7 = v2->_baseURL;
    v8 = (id)objc_opt_new();
    FCOperationFlagsApplyToURLRequest(-[FCOperation flags](v2, "flags"), v8);
    -[FCCKDirectRequestOperation preferredTimeoutIntervalForRequest](v2, "preferredTimeoutIntervalForRequest");
    objc_msgSend(v8, "setTimeoutInterval:");
    v9 = v7;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL port](v9, "port");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[NSURL port](v9, "port");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR(":%@"), v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = &stru_1E464BC40;
    }

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v2->_requestUUID, CFSTR("X-Apple-Request-UUID"));
    FCClientInfoHeaderValue();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("X-MMe-Client-Info"));

    FCUserAgentHeaderValue();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("User-Agent"));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v2->_containerName, CFSTR("X-CloudKit-ContainerId"));
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[NSURL scheme](v9, "scheme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL host](v9, "host");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@; desc=\"%@://%@%@/static/protobuf/CloudDB/CloudDBClient.desc\"; messageType=RequestOperation; delimited=true"),
      CFSTR("application/x-protobuf"),
      v18,
      v19,
      v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("Content-Type"));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("client=1;comments=1;device=1;presence=1;records=1;sharing=1;subscriptions=1;users=1;"),
      CFSTR("X-CloudKit-ProtocolVersion"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("application/x-protobuf"), CFSTR("Accept"));
    -[FCCKDirectRequestOperation _bundleIDToReport]();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("X-CloudKit-BundleId"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("Public"), CFSTR("X-CloudKit-DatabaseScope"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("gzip"), CFSTR("Content-Encoding"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("no-transform"), CFSTR("Cache-Control"));
    objc_opt_self();
    if (qword_1ED0F7B60 != -1)
      dispatch_once(&qword_1ED0F7B60, &__block_literal_global_126_0);
    if (_MergedGlobals_88)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("DEBUG"), CFSTR("X-Apple-Request-Log-Level"));
    NewsCoreUserDefaults();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringForKey:", CFSTR("cloudkit_partition_override"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "length"))
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("X-Requested-Partition"));
    if (NFInternalBuild())
      objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("X-Apple-Internal-News"));
    objc_opt_class();
    objc_opt_self();
    if (s_newTodayFeedEnabled)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("X-Apple-News-Feature-NewTodayFeed"));
    objc_opt_class();
    objc_opt_self();
    if (s_newTagFeedEnabled)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("X-Apple-News-Feature-NewTagFeed"));
    if (v2->_additionalRequestHTTPHeaders)
      objc_msgSend(v10, "addEntriesFromDictionary:");

    objc_msgSend(v8, "setAllHTTPHeaderFields:", v10);
    if (!v2->_edgeCacheHint)
    {
      objc_msgSend(v8, "setURL:", v9);
      objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
      -[FCCKDirectRequestOperation _requestBodyData]((uint64_t)v2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHTTPBody:", v27);

      objc_msgSend(v8, "setCachePolicy:", 1);
      goto LABEL_47;
    }
    v24 = v2->_requests;
    if (-[NSArray count](v24, "count") == 1)
    {
      -[NSArray firstObject](v2->_requests, "firstObject");
      v25 = (id *)objc_claimAutoreleasedReturnValue();
      -[FCCKPRequestOperation queryRetrieveRequest](v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
LABEL_35:
        objc_msgSend(v8, "setHTTPMethod:", CFSTR("GET"));
        -[FCCKDirectRequestOperation _requestBodyData]((uint64_t)v2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "base64EncodedStringWithOptions:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addValue:forHTTPHeaderField:", v29, CFSTR("X-Apple-CloudKit-Request-Body"));

        objc_msgSend(v8, "setValue:forHTTPHeaderField:", 0, CFSTR("Cache-Control"));
        v30 = (void *)MEMORY[0x1E0CB3940];
        v31 = v2->_edgeCacheHint;
        -[FCEdgeCacheHint groupName](v31, "groupName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCEdgeCacheHint cacheControlKey](v2->_edgeCacheHint, "cacheControlKey");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@/%@"), v32, v33);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DF0], "data");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray firstObject](v2->_requests, "firstObject");
        v35 = (id *)objc_claimAutoreleasedReturnValue();
        -[FCCKPRequestOperation queryRetrieveRequest](v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "data");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "appendData:", v37);

        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        objc_opt_self();
        if (qword_1ED0F7B70 != -1)
          dispatch_once(&qword_1ED0F7B70, &__block_literal_global_127);
        v38 = (id)qword_1ED0F7B68;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v89, buf, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v90;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v90 != v40)
                objc_enumerationMutation(v38);
              v42 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
              objc_msgSend(v8, "allHTTPHeaderFields");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "objectForKey:", v42);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              {
                objc_msgSend(v44, "dataUsingEncoding:", 4);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "appendData:", v45);

              }
            }
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v89, buf, 16);
          }
          while (v39);
        }

        objc_msgSend(v34, "fc_sha256");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "fc_URLSafeBase64EncodedStringWithOptions:", 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "stringByAppendingPathComponent:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL URLByAppendingPathComponent:](v9, "URLByAppendingPathComponent:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setURL:", v49);

        objc_msgSend(v8, "setCachePolicy:", 1);
LABEL_47:
        if (v2->_edgeCacheHint)
        {
          v50 = (void *)FCOperationLog;
          if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
          {
            v51 = v50;
            -[FCOperation shortOperationDescription](v2, "shortOperationDescription");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "URL");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v52;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v53;
            _os_log_impl(&dword_1A1B90000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ will issue request to CK-at-Edge with URL %{public}@", buf, 0x16u);

          }
          v86[0] = MEMORY[0x1E0C809B0];
          v86[1] = 3221225472;
          v86[2] = __46__FCCKDirectRequestOperation_performOperation__block_invoke;
          v86[3] = &unk_1E4643ED8;
          v86[4] = v2;
          v87 = v80;
          v8 = v8;
          v88 = v8;
          __46__FCCKDirectRequestOperation_performOperation__block_invoke((uint64_t)v86);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (v54)
          {
            objc_msgSend(v54, "response");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "_calculatedExpiration");
            v57 = v56;
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            if (v57 > v58)
            {

LABEL_54:
              v61 = (void *)FCOperationLog;
              if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
              {
                v62 = v61;
                -[FCOperation shortOperationDescription](v2, "shortOperationDescription");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(v54, "response");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "_calculatedExpiration");
                objc_msgSend(v64, "dateWithTimeIntervalSinceReferenceDate:");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "URL");
                v67 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v63;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v66;
                *(_WORD *)&buf[22] = 2114;
                v94 = v67;
                _os_log_impl(&dword_1A1B90000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ reusing locally-cached response with expiration date %@ for CK-at-Edge request with URL %{public}@", buf, 0x20u);

              }
              objc_msgSend(v54, "data");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              -[FCCKDirectRequestOperation _processResponseData:]((id *)&v2->super.super.super.super.isa, v68);

              -[FCOperation finishedPerformingOperationWithError:](v2, "finishedPerformingOperationWithError:", v2->_resultError);
LABEL_66:

              return;
            }
            NewsCoreUserDefaults();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "BOOLForKey:", CFSTR("ignore_ttl_in_url_cache"));

            if (v60)
              goto LABEL_54;
          }
LABEL_60:
          *(_QWORD *)&v89 = 0;
          *((_QWORD *)&v89 + 1) = &v89;
          v90 = 0x2020000000uLL;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v94 = __Block_byref_object_copy__31;
          v95 = __Block_byref_object_dispose__31;
          v96 = 0;
          v81[0] = MEMORY[0x1E0C809B0];
          v81[1] = 3221225472;
          v81[2] = __46__FCCKDirectRequestOperation_performOperation__block_invoke_26;
          v81[3] = &unk_1E4643F28;
          v84 = buf;
          v81[4] = v2;
          v82 = v80;
          v8 = v8;
          v83 = v8;
          v85 = &v89;
          objc_msgSend(v82, "dataTaskWithRequest:completionHandler:", v8, v81);
          v70 = objc_claimAutoreleasedReturnValue();
          v71 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v70;

          -[FCOperation associateChildOperation:](v2, "associateChildOperation:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          v72 = (id)FCOperationLog;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "longOperationDescription");
            v73 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v97 = 138543362;
            v98 = v73;
            _os_log_impl(&dword_1A1B90000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ started", v97, 0xCu);

          }
          if (v2)
          {
            networkActivityBlock = v2->_networkActivityBlock;
            if (networkActivityBlock)
            {
              v75 = (void (**)(void))networkActivityBlock;
              v75[2]();
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_storeStrong((id *)&v2->_networkActivity, v76);

              v77 = v2->_networkActivity;
              -[FCNetworkActivity attachActivityToTask:](v77, "attachActivityToTask:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setDelegate:", v2);
            }
          }
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          *(_QWORD *)(*((_QWORD *)&v89 + 1) + 24) = v78;
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "resume");
          _Block_object_dispose(buf, 8);

          _Block_object_dispose(&v89, 8);
          goto LABEL_66;
        }
LABEL_59:
        v54 = 0;
        goto LABEL_60;
      }
    }
    else
    {

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("only queries are supported by ck-at-the-edge"));
      *(_DWORD *)v97 = 136315906;
      v98 = "-[FCCKDirectRequestOperation generateHTTPRequest]";
      v99 = 2080;
      v100 = "FCCKDirectRequestOperation.m";
      v101 = 1024;
      v102 = 463;
      v103 = 2114;
      v104 = v69;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v97, 0x26u);

    }
    goto LABEL_35;
  }
  v3 = (void *)MEMORY[0x1E0C94EA8];
  if (v2)
  {
    v4 = v2->_requests;
    objc_msgSend(v3, "errorWithCode:format:", 1020, CFSTR("Your request contains %ld items which is more than the maximum number of items in a single request (%ld)"), -[NSArray count](v4, "count"), 400);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_resultError, v5);

    resultError = v2->_resultError;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1020, CFSTR("Your request contains %ld items which is more than the maximum number of items in a single request (%ld)"), objc_msgSend(0, "count"), 400);

    resultError = 0;
  }
  -[FCOperation finishedPerformingOperationWithError:](v2, "finishedPerformingOperationWithError:", resultError);
}

- (id)_bundleIDToReport
{
  if (qword_1ED0F7B80 != -1)
    dispatch_once(&qword_1ED0F7B80, &__block_literal_global_129_0);
  return (id)qword_1ED0F7B78;
}

id __46__FCCKDirectRequestOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 378))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__FCCKDirectRequestOperation_performOperation__block_invoke_2;
    v7[3] = &unk_1E463B350;
    v7[4] = v2;
    __46__FCCKDirectRequestOperation_performOperation__block_invoke_2((uint64_t)v7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedResponseForRequest:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

uint64_t __46__FCCKDirectRequestOperation_performOperation__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring local cache for CK-at-Edge request because ignoreCache=true", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id requestCompletionHandler;
  void (**v8)(id, NSMutableArray *, NSMutableDictionary *, void *);
  NSMutableArray *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("FCErrorDomain")))
  {
    v5 = v10;
  }
  else
  {
    objc_msgSend(v10, "CKClientSuitableError");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (self)
  {
    requestCompletionHandler = self->_requestCompletionHandler;
    if (requestCompletionHandler)
    {
      v8 = (void (**)(id, NSMutableArray *, NSMutableDictionary *, void *))requestCompletionHandler;
      v9 = self->_resultResponses;
      v8[2](v8, v9, self->_resultErrorsByRequestID, v6);

    }
  }

}

- (FCCKDirectRequestOperation)initWithNetworkReachability:(id)a3
{
  FCCKDirectRequestOperation *v3;
  FCCKDirectRequestOperation *v4;
  void *v5;
  uint64_t v6;
  NSString *requestUUID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FCCKDirectRequestOperation;
  v3 = -[FCNetworkOperation initWithNetworkReachability:](&v9, sel_initWithNetworkReachability_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_requestType = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    requestUUID = v4->_requestUUID;
    v4->_requestUUID = (NSString *)v6;

    v4->_networkEventType = 0;
  }
  return v4;
}

- (BOOL)areNetworkRequirementsSatisfiedWithReachability:(id)a3 offlineReason:(int64_t *)a4
{
  id v5;
  char v6;

  v5 = a3;
  v6 = objc_msgSend(v5, "isCloudKitReachable");
  if ((v6 & 1) == 0)
    *a4 = objc_msgSend(v5, "offlineReason");

  return v6;
}

- (void)_processResponseData:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *context;
  void *v24;
  _QWORD buf[4];

  buf[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = objc_msgSend(v5, "length");
    v22 = v5;
    objc_msgSend(v5, "bytes");
    context = (void *)MEMORY[0x1A8580B64]();
    if (v6)
    {
      v21 = *MEMORY[0x1E0C94878];
      if (v6 >= 0x7FFFFFFF)
      {
        objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1005, CFSTR("response data has insane length %lu"), v6, v19, v20);
      }
      else
      {
        buf[0] = 0;
        if ((PBReaderReadVarIntBuf() & 1) != 0)
        {
          v7 = (void *)MEMORY[0x1E0C94EA8];
          v8 = CFSTR("next object has zero length");
        }
        else
        {
          v7 = (void *)MEMORY[0x1E0C94EA8];
          v8 = CFSTR("Couldn't read the size of the next object from the server");
        }
        objc_msgSend(v7, "errorWithCode:format:", 1005, v8, v18, v19, v20);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(context);
      if (v9)
      {
        v10 = v3;
        objc_storeStrong(a1 + 63, v9);
        objc_msgSend(v9, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v21))
        {
          v12 = objc_msgSend(v9, "code");

          v13 = v24;
          if (v12 == 1005)
          {
            v14 = (void *)FCOperationLog;
            if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_FAULT))
            {
              v16 = v14;
              objc_msgSend(v9, "localizedDescription");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf[0]) = 138543362;
              *(_QWORD *)((char *)buf + 4) = v17;
              _os_log_fault_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_FAULT, "Failed to parse CloudKit response with error: %{public}@", (uint8_t *)buf, 0xCu);

            }
          }
          v3 = v10;
        }
        else
        {

          v3 = v10;
          v13 = v24;
        }
        goto LABEL_18;
      }
    }
    else
    {
      objc_autoreleasePoolPop(context);
    }
    objc_storeStrong(a1 + 61, v4);
    v15 = a1 + 62;
    v13 = v24;
    objc_storeStrong(v15, v24);
    v9 = 0;
LABEL_18:

  }
}

void __40__FCCKDirectRequestOperation_URLSession__block_invoke()
{
  void *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  FCCKDirectRequestOperationURLCache *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (FCProcessIsMemoryConstrained())
  {
    objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setURLCache:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C92CA0], "defaultSessionConfiguration");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    NewsCoreUserDefaults();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("increase_url_cache_size"));

    if (v1)
      v2 = 1024000;
    else
      v2 = 512000;
    if (v1)
      v3 = 200000000;
    else
      v3 = 100000000;
    v4 = -[NSURLCache initWithMemoryCapacity:diskCapacity:diskPath:]([FCCKDirectRequestOperationURLCache alloc], "initWithMemoryCapacity:diskCapacity:diskPath:", v2, v3, CFSTR("CK-at-Edge-URL-Cache"));
    objc_msgSend(v10, "setURLCache:", v4);

  }
  objc_msgSend(v10, "set_timingDataOptions:", objc_msgSend(v10, "_timingDataOptions") | 1);
  objc_msgSend(v10, "setHTTPCookieStorage:", 0);
  objc_msgSend(v10, "setURLCredentialStorage:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.newsd"));

  if (v7)
    objc_msgSend(v10, "set_sourceApplicationBundleIdentifier:", CFSTR("com.apple.news"));
  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:", v10);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1ED0F7B50;
  qword_1ED0F7B50 = v8;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong((id *)&self->_resultErrorsByRequestID, 0);
  objc_storeStrong((id *)&self->_resultResponses, 0);
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong(&self->_networkActivityBlock, 0);
  objc_storeStrong((id *)&self->_networkEvent, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong(&self->_requestCompletionHandler, 0);
  objc_storeStrong(&self->_criticalNodeFailureTest, 0);
  objc_storeStrong((id *)&self->_edgeCacheHint, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

void __50__FCCKDirectRequestOperation__enableDebugLogLevel__block_invoke()
{
  id v0;

  NewsCoreUserDefaults();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_88 = objc_msgSend(v0, "BOOLForKey:", CFSTR("enable_debug_log_level_for_cloudkit_operations"));

}

void __47__FCCKDirectRequestOperation__bundleIDToReport__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F7B78;
  qword_1ED0F7B78 = v0;

}

void __56__FCCKDirectRequestOperation__headersImpactingEdgeCache__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("X-CloudKit-ContainerId");
  v2[1] = CFSTR("X-Apple-Permanent-Asset-URLs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F7B68;
  qword_1ED0F7B68 = v0;

}

- (BOOL)validateOperation
{
  FCCKDirectRequestOperation *v2;
  uint64_t v3;
  char v4;
  void *v5;
  char v6;
  char v7;
  char v8;
  char v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v2 = self;
  v23 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (FCCKDirectRequestOperation *)self->_requests;
  v3 = -[FCCKDirectRequestOperation count](self, "count");
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("direct-ck-request must have at least one request operation"));
    v15 = 136315906;
    v16 = "-[FCCKDirectRequestOperation validateOperation]";
    v17 = 2080;
    v18 = "FCCKDirectRequestOperation.m";
    v19 = 1024;
    v20 = 149;
    v21 = 2114;
    v22 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

    if (!v2)
    {
LABEL_9:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("direct-ck-request request must have a base URL"));
        v15 = 136315906;
        v16 = "-[FCCKDirectRequestOperation validateOperation]";
        v17 = 2080;
        v18 = "FCCKDirectRequestOperation.m";
        v19 = 1024;
        v20 = 153;
        v21 = 2114;
        v22 = v11;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

      }
      v4 = 0;
      if (!v2)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  else if (!v2)
  {
    goto LABEL_9;
  }
  if (!v2->_baseURL)
    goto LABEL_9;
  v4 = 1;
LABEL_12:
  if (v2->_containerName)
  {
    v6 = 1;
    goto LABEL_17;
  }
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("direct-ck-request request must have a container name"));
    v15 = 136315906;
    v16 = "-[FCCKDirectRequestOperation validateOperation]";
    v17 = 2080;
    v18 = "FCCKDirectRequestOperation.m";
    v19 = 1024;
    v20 = 157;
    v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

  }
  v6 = 0;
  if (!v2)
  {
LABEL_19:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("direct-ck-request request must have a request type"));
      v15 = 136315906;
      v16 = "-[FCCKDirectRequestOperation validateOperation]";
      v17 = 2080;
      v18 = "FCCKDirectRequestOperation.m";
      v19 = 1024;
      v20 = 161;
      v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

    }
    v7 = 0;
    if (!v2)
      goto LABEL_24;
    goto LABEL_22;
  }
LABEL_17:
  if (!v2->_requestType)
    goto LABEL_19;
  v7 = 1;
LABEL_22:
  if (v2->_networkEventType)
  {
    v8 = 1;
    goto LABEL_27;
  }
LABEL_24:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("direct-ck-request request must have a network event type"));
    v15 = 136315906;
    v16 = "-[FCCKDirectRequestOperation validateOperation]";
    v17 = 2080;
    v18 = "FCCKDirectRequestOperation.m";
    v19 = 1024;
    v20 = 165;
    v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

  }
  v8 = 0;
LABEL_27:
  v9 = v6 & v8 & v4 & v7;
  if (v3)
    return v9;
  else
    return 0;
}

- (void)setResultError:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 504), a2);
}

void __46__FCCKDirectRequestOperation_performOperation__block_invoke_26(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v12 = v10;
    objc_msgSend(v11, "shortOperationDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v13;
    _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ finished", buf, 0xCu);

  }
  FCDispatchQueueForQualityOfService(objc_msgSend(*(id *)(a1 + 32), "qualityOfService"));
  v14 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __46__FCCKDirectRequestOperation_performOperation__block_invoke_27;
  v21[3] = &unk_1E4643F00;
  v22 = v8;
  v23 = v9;
  v28 = *(_QWORD *)(a1 + 56);
  v15 = *(void **)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 32);
  v25 = v7;
  v26 = v15;
  v16 = *(id *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 64);
  v27 = v16;
  v29 = v17;
  v18 = v7;
  v19 = v9;
  v20 = v8;
  dispatch_async(v14, v21);

}

void __46__FCCKDirectRequestOperation_performOperation__block_invoke_27(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  int v36;
  const __CFString *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  const __CFString *info;
  void *v48;
  void *v49;
  uint64_t v50;
  FCNetworkEvent *v51;
  unsigned int *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  _QWORD *v56;
  _QWORD *v57;
  double v58;
  void *v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD *v62;
  FCNetworkEvent *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  id v68;
  _QWORD *v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  _BYTE buf[22];
  __int16 v78;
  const __CFString *v79;
  __int16 v80;
  void *v81;
  _QWORD v82[3];

  v82[2] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  FCCheckedDynamicCast(v2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (!v4)
  {
    if (objc_msgSend(v3, "statusCode") >= 200 && objc_msgSend(v3, "statusCode") < 300)
    {
      v20 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(void **)(a1 + 48);
        v22 = v20;
        objc_msgSend(v21, "shortOperationDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "_incompleteCurrentTaskTransactionMetrics");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v24;
        _os_log_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ received has task metrics: %{public}@", buf, 0x16u);

      }
      v25 = *(_QWORD *)(a1 + 48);
      if (v25 && *(_QWORD *)(v25 + 432))
      {
        objc_msgSend(v3, "allHeaderFields");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("X-Apple-Cache"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "allHeaderFields");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Last-Modified"));
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "allHeaderFields");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Via"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = (void *)FCOperationLog;
        if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
        {
          v33 = *(void **)(a1 + 48);
          v34 = v32;
          objc_msgSend(v33, "shortOperationDescription");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v27, "BOOLValue");
          v37 = CFSTR("non-cached");
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2114;
          if (v36)
            v37 = CFSTR("cached");
          *(_QWORD *)&buf[14] = v37;
          v78 = 2114;
          v79 = v29;
          v80 = 2114;
          v81 = v31;
          _os_log_impl(&dword_1A1B90000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ received %{public}@ response from CK-at-Edge with last-modified %{public}@ via %{public}@", buf, 0x2Au);

        }
        v38 = 20 * objc_msgSend(*(id *)(a1 + 56), "length");
        objc_msgSend(*(id *)(a1 + 64), "configuration");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "URLCache");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "diskCapacity");

        if (v38 > v41)
        {
          v42 = (void *)FCOperationLog;
          if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
          {
            v73 = *(void **)(a1 + 48);
            v74 = v42;
            objc_msgSend(v73, "shortOperationDescription");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(*(id *)(a1 + 56), "length"), 0);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v75;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v76;
            _os_log_error_impl(&dword_1A1B90000, v74, OS_LOG_TYPE_ERROR, "%{public}@ received response that won't fit in cache due to size %{public}@", buf, 0x16u);

          }
        }

      }
      v43 = (id)FCOperationLog;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "shortOperationDescription");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "length"));
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v45;
        info = *(const __CFString **)(a1 + 48);
        if (info)
          info = (const __CFString *)info[14].info;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v45;
        v78 = 2114;
        v79 = info;
        _os_log_impl(&dword_1A1B90000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ will process response data of length %{public}@ for request UUID %{public}@", buf, 0x20u);

      }
      -[FCCKDirectRequestOperation _processResponseData:](*(id **)(a1 + 48), *(void **)(a1 + 56));
      goto LABEL_40;
    }
    v8 = *(void **)(a1 + 48);
    if (!v8)
    {
      v50 = 0;
      v49 = 0;
      goto LABEL_39;
    }
    v9 = v3;
    v10 = objc_msgSend(v9, "statusCode");
    objc_msgSend(v9, "allHeaderFields");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != 503)
    {
      v82[0] = *MEMORY[0x1E0C94880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v17 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v17;
      v82[1] = *MEMORY[0x1E0C94738];
      v18 = (void *)MEMORY[0x1E0C9AA70];
      if (v11)
        v18 = v11;
      *(_QWORD *)buf = v17;
      *(_QWORD *)&buf[8] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v82, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 2001;
      goto LABEL_38;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Retry-After"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "intValue");
      if ((v14 - 0x7FFFFFFF) > 0x80000001)
      {
        v82[0] = *MEMORY[0x1E0C94808];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v82, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_37;
      }
      v15 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
      {
        v71 = v15;
        objc_msgSend(v8, "shortOperationDescription");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v72;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        v78 = 2112;
        v79 = CFSTR("Retry-After");
        _os_log_error_impl(&dword_1A1B90000, v71, OS_LOG_TYPE_ERROR, "%{public}@ Invalid value (%@) for %@ header field", buf, 0x20u);

      }
    }
    v16 = 0;
LABEL_37:
    v19 = 2022;
LABEL_38:

    objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:userInfo:format:", v19, v16, CFSTR("Request failed with http status code %ld"), v10);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = *(_QWORD *)(a1 + 48);
LABEL_39:
    -[FCCKDirectRequestOperation setResultError:](v50, v49);

    goto LABEL_40;
  }
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v6 == -999)
    {
      objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:format:", 1, CFSTR("Operation was cancelled"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKDirectRequestOperation setResultError:](*(_QWORD *)(a1 + 48), v7);

      goto LABEL_40;
    }
  }
  else
  {

  }
  -[FCCKDirectRequestOperation setResultError:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 40));
LABEL_40:
  v51 = [FCNetworkEvent alloc];
  v52 = *(unsigned int **)(a1 + 48);
  if (v52)
    v53 = v52[95];
  else
    v53 = 0;
  v54 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v52, "operationID");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = *(_QWORD **)(a1 + 48);
  if (v56)
    v56 = (_QWORD *)v56[57];
  v57 = v56;
  v58 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "_incompleteCurrentTaskTransactionMetrics");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = *(_QWORD **)(a1 + 48);
  if (v60)
    v60 = (_QWORD *)v60[50];
  v61 = *(_QWORD *)(a1 + 40);
  v62 = v60;
  v63 = -[FCNetworkEvent initWithType:URLRequest:operationID:requestUUID:startTime:HTTPResponse:metrics:containerName:error:](v51, "initWithType:URLRequest:operationID:requestUUID:startTime:HTTPResponse:metrics:containerName:error:", v53, v54, v55, v57, v3, v59, v58, v62, v61);
  v64 = *(_QWORD *)(a1 + 48);
  if (v64)
    objc_storeStrong((id *)(v64 + 464), v63);

  v65 = *(_QWORD *)(a1 + 48);
  if (v65)
  {
    v66 = *(void **)(v65 + 424);
    v67 = *(_QWORD *)(v65 + 464);
  }
  else
  {
    v66 = 0;
    v67 = 0;
  }
  v68 = v66;
  objc_msgSend(v68, "logNetworkEvent:", v67);

  v69 = *(_QWORD **)(a1 + 48);
  if (v69)
    v70 = v69[63];
  else
    v70 = 0;
  objc_msgSend(v69, "finishedPerformingOperationWithError:", v70);

}

- (double)preferredTimeoutIntervalForRequest
{
  double result;
  objc_super v3;

  if (!self || (result = 15.0, self->_networkEventType != 10))
  {
    v3.receiver = self;
    v3.super_class = (Class)FCCKDirectRequestOperation;
    -[FCNetworkOperation preferredTimeoutIntervalForRequest](&v3, sel_preferredTimeoutIntervalForRequest);
  }
  return result;
}

- (void)resetForRetry
{
  void *resultErrorsByRequestID;
  void *v4;
  const char *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  resultErrorsByRequestID = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(resultErrorsByRequestID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v5, v4, 456);

    objc_storeStrong((id *)&self->_resultResponses, 0);
    resultErrorsByRequestID = self->_resultErrorsByRequestID;
    self->_resultErrorsByRequestID = 0;
  }
  else
  {

  }
  -[FCCKDirectRequestOperation setResultError:]((uint64_t)self, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  FCNetworkActivity *networkActivity;
  void *v10;
  FCNetworkActivity *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  int v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (self && self->_networkActivity)
  {
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    networkActivity = self->_networkActivity;
    if (v8)
    {
      -[FCNetworkActivity completeActivityWithSuccess:](networkActivity, "completeActivityWithSuccess:", 0);
      v10 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_networkActivity;
        v12 = v10;
        v15 = 67109120;
        v16 = -[FCNetworkActivity label](v11, "label");
        v13 = "Did finish network activity with success=NO (label=%d)";
LABEL_8:
        _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 8u);

      }
    }
    else
    {
      -[FCNetworkActivity completeActivityWithSuccess:](networkActivity, "completeActivityWithSuccess:", 1);
      v14 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_networkActivity;
        v12 = v14;
        v15 = 67109120;
        v16 = -[FCNetworkActivity label](v11, "label");
        v13 = "Did finish network activity with success=YES (label=%d)";
        goto LABEL_8;
      }
    }
  }

}

- (void)URLSession:(id)a3 didCreateTask:(id)a4
{
  id v5;
  FCNetworkActivity *networkActivity;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (self)
  {
    networkActivity = self->_networkActivity;
    if (networkActivity)
    {
      -[FCNetworkActivity attachActivityToTask:](networkActivity, "attachActivityToTask:", v5);
      v7 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        objc_msgSend(v5, "originalRequest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "URL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "Did assign network activity to task (%{public}@)", (uint8_t *)&v11, 0xCu);

      }
    }
  }

}

- (void)setNetworkBehaviorMonitor:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 424), a2);
}

@end
