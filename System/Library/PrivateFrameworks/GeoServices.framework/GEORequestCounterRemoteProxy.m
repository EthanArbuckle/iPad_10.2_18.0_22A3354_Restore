@implementation GEORequestCounterRemoteProxy

- (BOOL)countersEnabled
{
  return GEOConfigGetBOOL(GeoServicesConfig_RequestCounterEnabledDefault, (uint64_t)off_1EDF4D518);
}

- (void)setCountersEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *global_workloop;
  _QWORD v11[5];
  _QWORD v12[2];
  _QWORD v13[3];

  v3 = a3;
  v13[2] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 10, CFSTR("RequestCounter"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("enabled"));

  v12[0] = CFSTR("message");
  v12[1] = CFSTR("userInfo");
  v13[0] = CFSTR("requestCounter.setCountersEnabled");
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  qos_class_self();
  global_workloop = (void *)geo_get_global_workloop();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__GEORequestCounterRemoteProxy_setCountersEnabled___block_invoke;
  v11[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v11[4] = a2;
  objc_msgSend(v5, "sendMessage:withReply:handler:", v9, global_workloop, v11);

}

void __51__GEORequestCounterRemoteProxy_setCountersEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x18D765A14](a2) == MEMORY[0x1E0C81310])
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", (uint8_t *)&v5, 0xCu);

    }
  }
}

- (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  GEORequestCounterRemoteProxy *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  if (-[GEORequestCounterRemoteProxy countersEnabled](self, "countersEnabled"))
    v10 = self;
  else
    v10 = 0;
  +[_GEORemoteRequestCounterTicket requestCounterTicketForType:auditToken:traits:remoteProxy:](_GEORemoteRequestCounterTicket, "requestCounterTicketForType:auditToken:traits:remoteProxy:", a3, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_incrementForApp:(id)a3 offlineCohortId:(id)a4 requestMode:(int)a5 startTime:(id)a6 endTime:(id)a7 requestType:(id)a8 result:(unsigned __int8)a9 error:(id)a10 xmitBytes:(int64_t)a11 recvBytes:(int64_t)a12 usedInterfaces:(unint64_t)a13
{
  uint64_t v16;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
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
  void *global_workloop;
  void *v39;
  SEL v40;
  _QWORD v41[5];
  _QWORD v42[2];
  _QWORD v43[4];

  v16 = *(_QWORD *)&a5;
  v43[2] = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v22 = a6;
  v23 = a7;
  v24 = a10;
  if (-[GEORequestCounterRemoteProxy countersEnabled](self, "countersEnabled"))
  {
    v40 = a2;
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 10, CFSTR("RequestCounter"), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v22)
    {
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v22, CFSTR("startTime"));
      if (v23)
      {
LABEL_4:
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v23, CFSTR("endTime"));
LABEL_7:
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v20, CFSTR("appID"));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v21, CFSTR("cohortID"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, CFSTR("reqMode"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (a8.var1.var0 | a8.var0));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("reqType"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a9);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v31, CFSTR("reqResult"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a11);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v32, CFSTR("xmitB"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a12);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v33, CFSTR("recvB"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a13);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v34, CFSTR("iface"));

        _geo_NSErrorDictionaryRepresentationCopy(v24);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v35, CFSTR("error"));

        v42[0] = CFSTR("message");
        v42[1] = CFSTR("userInfo");
        v43[0] = CFSTR("requestCounter.increment");
        v43[1] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        qos_class_self();
        global_workloop = (void *)geo_get_global_workloop();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __155__GEORequestCounterRemoteProxy__incrementForApp_offlineCohortId_requestMode_startTime_endTime_requestType_result_error_xmitBytes_recvBytes_usedInterfaces___block_invoke;
        v41[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
        v41[4] = v40;
        objc_msgSend(v39, "sendMessage:withReply:handler:", v37, global_workloop, v41);

        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("startTime"));

      if (v23)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("endTime"));

    goto LABEL_7;
  }
LABEL_8:

}

void __155__GEORequestCounterRemoteProxy__incrementForApp_offlineCohortId_requestMode_startTime_endTime_requestType_result_error_xmitBytes_recvBytes_usedInterfaces___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x18D765A14](a2) == MEMORY[0x1E0C81310])
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", (uint8_t *)&v5, 0xCu);

    }
  }
}

- (void)readRequestsPerAppDuring:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *global_workloop;
  void *v15;
  _QWORD v16[4];
  id v17;
  SEL v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 10, CFSTR("RequestCounter"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("startTime"));

    objc_msgSend(v6, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("endTime"));

    v19[0] = CFSTR("message");
    v19[1] = CFSTR("userInfo");
    v20[0] = CFSTR("requestCounter.readRequests");
    v20[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    qos_class_self();
    global_workloop = (void *)geo_get_global_workloop();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__GEORequestCounterRemoteProxy_readRequestsPerAppDuring_handler___block_invoke;
    v16[3] = &unk_1E1C036F8;
    v18 = a2;
    v17 = v7;
    -[NSObject sendMessage:withReply:handler:](v8, "sendMessage:withReply:handler:", v13, global_workloop, v16);

  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "%{public}@ cannot be called without a handler", buf, 0xCu);

    }
  }

}

void __65__GEORequestCounterRemoteProxy_readRequestsPerAppDuring_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v19;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKey:", CFSTR("userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_geo_errorForKey:", CFSTR("err"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("response"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v12, v6, &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;
    if (v14)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v23 = v14;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Error decoding response: %{private}@", buf, 0xCu);
      }

    }
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v23 = v17;
      v24 = 2113;
      v25 = v13;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "%{private}@ received: %{private}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)readRequestLogsDuring:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *global_workloop;
  void *v15;
  _QWORD v16[4];
  id v17;
  SEL v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 10, CFSTR("RequestCounter"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("startTime"));

    objc_msgSend(v6, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("endTime"));

    v19[0] = CFSTR("message");
    v19[1] = CFSTR("userInfo");
    v20[0] = CFSTR("requestCounter.readRequestLogs");
    v20[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    qos_class_self();
    global_workloop = (void *)geo_get_global_workloop();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__GEORequestCounterRemoteProxy_readRequestLogsDuring_handler___block_invoke;
    v16[3] = &unk_1E1C036F8;
    v18 = a2;
    v17 = v7;
    -[NSObject sendMessage:withReply:handler:](v8, "sendMessage:withReply:handler:", v13, global_workloop, v16);

  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "%{public}@ cannot be called without a handler", buf, 0xCu);

    }
  }

}

void __62__GEORequestCounterRemoteProxy_readRequestLogsDuring_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v22;
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKey:", CFSTR("userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_geo_errorForKey:", CFSTR("err"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("response"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v10, v7, &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;
    if (v12)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v26 = v12;
        _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Error decoding response: %{private}@", buf, 0xCu);
      }

    }
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v23 = v5;
      v15 = v3;
      v16 = v10;
      v17 = v7;
      v18 = v6;
      v19 = a1;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v26 = v20;
      v27 = 2113;
      v28 = v11;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "%{private}@ received: %{private}@", buf, 0x16u);

      a1 = v19;
      v6 = v18;
      v7 = v17;
      v10 = v16;
      v3 = v15;
      v5 = v23;
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)clearCounters
{
  void *v3;
  void *v4;
  void *v5;
  void *global_workloop;
  _QWORD v7[5];
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 10, CFSTR("RequestCounter"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("message");
  v9[0] = CFSTR("requestCounter.clear");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  qos_class_self();
  global_workloop = (void *)geo_get_global_workloop();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__GEORequestCounterRemoteProxy_clearCounters__block_invoke;
  v7[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v7[4] = a2;
  objc_msgSend(v3, "sendMessage:withReply:handler:", v5, global_workloop, v7);

}

void __45__GEORequestCounterRemoteProxy_clearCounters__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x18D765A14](a2) == MEMORY[0x1E0C81310])
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", (uint8_t *)&v5, 0xCu);

    }
  }
}

- (void)readProactiveTileDownloadsSince:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *global_workloop;
  _QWORD v13[4];
  id v14;
  SEL v15;
  _QWORD v16[2];
  _QWORD v17[2];
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = a3;
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 10, CFSTR("RequestCounter"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("since");
    v19[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR("message");
    v16[1] = CFSTR("userInfo");
    v17[0] = CFSTR("requestCounter.readProactiveTileDownloads");
    v17[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    qos_class_self();
    global_workloop = (void *)geo_get_global_workloop();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__GEORequestCounterRemoteProxy_readProactiveTileDownloadsSince_handler___block_invoke;
    v13[3] = &unk_1E1C036F8;
    v15 = a2;
    v14 = v6;
    objc_msgSend(v8, "sendMessage:withReply:handler:", v11, global_workloop, v13);

  }
}

void __72__GEORequestCounterRemoteProxy_readProactiveTileDownloadsSince_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v17;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKey:", CFSTR("userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_geo_errorForKey:", CFSTR("err"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = 0;
    if (!v6 && v7)
    {
      v10 = (void *)MEMORY[0x1E0CB3710];
      v11 = (void *)MEMORY[0x1E0C99E60];
      v12 = objc_opt_class();
      objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v13, v8, &v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v18;

    }
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v20 = v15;
      v21 = 2113;
      v22 = v9;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "%{private}@ received: %{private}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)recordRoutePreloadSessionAt:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  void *global_workloop;
  _QWORD v29[5];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  if (-[GEORequestCounterRemoteProxy countersEnabled](self, "countersEnabled"))
  {
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 10, CFSTR("RequestCounter"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v13, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    objc_msgSend(v16, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("start"));

    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v13, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    objc_msgSend(v19, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("end"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("transport_type"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("tiles_preloaded"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("tiles_used"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, CFSTR("tiles_missed"));

    v30[0] = CFSTR("message");
    v30[1] = CFSTR("userInfo");
    v31[0] = CFSTR("requestCounter.recordRoutePreloadSession");
    v31[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    qos_class_self();
    global_workloop = (void *)geo_get_global_workloop();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __111__GEORequestCounterRemoteProxy_recordRoutePreloadSessionAt_transportType_tilesPreloaded_tilesUsed_tilesMissed___block_invoke;
    v29[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
    v29[4] = a2;
    objc_msgSend(v14, "sendMessage:withReply:handler:", v27, global_workloop, v29);

  }
}

void __111__GEORequestCounterRemoteProxy_recordRoutePreloadSessionAt_transportType_tilesPreloaded_tilesUsed_tilesMissed___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x18D765A14](a2) == MEMORY[0x1E0C81310])
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "%@ failed on XPC", (uint8_t *)&v5, 0xCu);

    }
  }
}

- (void)fetchRoutePreloadSessionsFrom:(id)a3 completion:(id)a4 completionQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  SEL v21;
  _QWORD v22[2];
  _QWORD v23[2];
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (v8)
  {
    v9 = a5;
    v10 = a3;
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 10, CFSTR("RequestCounter"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("since");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v14 = v13;

    objc_msgSend(v12, "numberWithDouble:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = CFSTR("message");
    v22[1] = CFSTR("userInfo");
    v23[0] = CFSTR("requestCounter.fetchRoutePreloadSessions");
    v23[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __89__GEORequestCounterRemoteProxy_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke;
    v19[3] = &unk_1E1C036F8;
    v21 = a2;
    v20 = v8;
    objc_msgSend(v11, "sendMessage:withReply:handler:", v18, v9, v19);

  }
}

void __89__GEORequestCounterRemoteProxy_fetchRoutePreloadSessionsFrom_completion_completionQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "%{public}@ failed on XPC", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v4, "objectForKey:", CFSTR("userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_geo_errorForKey:", CFSTR("err"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("response"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "received error on XPC reply (%@)", buf, 0xCu);
      }

    }
    if (v7)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = (void *)MEMORY[0x1E0C99E60];
      v11 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v6;
      objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v12, v7, &v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v19;

      v6 = v14;
    }
    else
    {
      v13 = 0;
    }
    GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounterRemoteProxy");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v21 = v18;
      v22 = 2113;
      v23 = v13;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEBUG, "%{private}@ received: %{private}@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (id)externalRequestCounterTicketForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6
{
  return +[_GEORemoteExternalRequestCounterTicket externalRequestCounterForType:subtype:source:appId:remoteProxy:](_GEORemoteExternalRequestCounterTicket, "externalRequestCounterForType:subtype:source:appId:remoteProxy:", a3, a4, a5, a6, self);
}

- (void)_incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  GEOExternalRequestCounterIncrementRequest *v22;
  GEOExternalRequestCounterInfo *v23;
  void *v24;
  id v25;

  v25 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  if (-[GEORequestCounterRemoteProxy countersEnabled](self, "countersEnabled"))
  {
    v22 = -[GEOExternalRequestCounterIncrementRequest initWithTraits:auditToken:throttleToken:]([GEOExternalRequestCounterIncrementRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
    v23 = objc_alloc_init(GEOExternalRequestCounterInfo);
    -[GEOExternalRequestCounterInfo setAppId:](v23, "setAppId:", v25);
    -[GEOExternalRequestCounterInfo setStartTime:](v23, "setStartTime:", v17);
    -[GEOExternalRequestCounterInfo setEndTime:](v23, "setEndTime:", v18);
    -[GEOExternalRequestCounterInfo setXmitBytes:](v23, "setXmitBytes:", a6);
    -[GEOExternalRequestCounterInfo setRecvBytes:](v23, "setRecvBytes:", a7);
    -[GEOExternalRequestCounterInfo setUsedInterface:](v23, "setUsedInterface:", a8);
    -[GEOExternalRequestCounterInfo setRequestType:](v23, "setRequestType:", v19);
    -[GEOExternalRequestCounterInfo setRequestSubtype:](v23, "setRequestSubtype:", v20);
    -[GEOExternalRequestCounterInfo setSource:](v23, "setSource:", v21);
    -[GEOExternalRequestCounterIncrementRequest setInfo:](v22, "setInfo:", v23);
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 10, CFSTR("RequestCounter"), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOXPCRequest send:](v22, "send:", v24);

  }
}

- (void)externalRequestsCount:(id)a3
{
  id v3;
  GEOExternalRequestCounterCountRequest *v4;
  void *v5;
  void *global_workloop;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = -[GEOExternalRequestCounterCountRequest initWithTraits:auditToken:throttleToken:]([GEOExternalRequestCounterCountRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 10, CFSTR("RequestCounter"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  qos_class_self();
  global_workloop = (void *)geo_get_global_workloop();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__GEORequestCounterRemoteProxy_externalRequestsCount___block_invoke;
  v8[3] = &unk_1E1C03720;
  v9 = v3;
  v7 = v3;
  -[GEOXPCRequest send:withReply:handler:](v4, "send:withReply:handler:", v5, global_workloop, v8);

}

void __54__GEORequestCounterRemoteProxy_externalRequestsCount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)placeCacheRegisterCacheResult:(unsigned __int8)a3 forApp:(id)a4 requestType:(int)a5 timestamp:(id)a6
{
  uint64_t v6;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  GEORequestCounterCacheAddEntry *v13;

  v6 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a6;
  v10 = a4;
  v13 = -[GEORequestCounterCacheAddEntry initWithTraits:auditToken:throttleToken:]([GEORequestCounterCacheAddEntry alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  v11 = (void *)objc_msgSend(v10, "copy");

  -[GEORequestCounterCacheAddEntry setAppId:](v13, "setAppId:", v11);
  -[GEORequestCounterCacheAddEntry setTimestamp:](v13, "setTimestamp:", v9);

  -[GEORequestCounterCacheAddEntry setRequestKindRaw:](v13, "setRequestKindRaw:", v6);
  -[GEORequestCounterCacheAddEntry setResult:](v13, "setResult:", v8);
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 10, CFSTR("RequestCounter"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOXPCRequest send:](v13, "send:", v12);

}

- (void)placeCacheGetCounts:(unint64_t)a3 forApp:(id)a4 inTimeRange:(id)a5 ofType:(int)a6 handler:(id)a7
{
  uint64_t v7;
  id v11;
  id v12;
  id v13;
  GEORequestCounterCacheGetResults *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *global_workloop;
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = *(_QWORD *)&a6;
  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = -[GEORequestCounterCacheGetResults initWithTraits:auditToken:throttleToken:]([GEORequestCounterCacheGetResults alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEORequestCounterCacheGetResults setMode:](v14, "setMode:", a3);
  v15 = (void *)objc_msgSend(v13, "copy");

  -[GEORequestCounterCacheGetResults setAppId:](v14, "setAppId:", v15);
  objc_msgSend(v12, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORequestCounterCacheGetResults setStartTime:](v14, "setStartTime:", v16);

  objc_msgSend(v12, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEORequestCounterCacheGetResults setEndTime:](v14, "setEndTime:", v17);
  -[GEORequestCounterCacheGetResults setRequestKindRaw:](v14, "setRequestKindRaw:", v7);
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 10, CFSTR("RequestCounter"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  qos_class_self();
  global_workloop = (void *)geo_get_global_workloop();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __86__GEORequestCounterRemoteProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke;
  v21[3] = &unk_1E1C03748;
  v22 = v11;
  v20 = v11;
  -[GEOXPCRequest send:withReply:handler:](v14, "send:withReply:handler:", v18, global_workloop, v21);

}

void __86__GEORequestCounterRemoteProxy_placeCacheGetCounts_forApp_inTimeRange_ofType_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  }
  else
  {
    objc_msgSend(v9, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

  }
}

@end
