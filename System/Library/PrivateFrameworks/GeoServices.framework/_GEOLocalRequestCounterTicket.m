@implementation _GEOLocalRequestCounterTicket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
}

- (void)_incrementForApp:(id)a3 offlineCohortId:(id)a4 requestMode:(int)a5 startTime:(id)a6 endTime:(id)a7 requestType:(id)a8 result:(unsigned __int8)a9 error:(id)a10 xmitBytes:(int64_t)a11 recvBytes:(int64_t)a12 usedInterfaces:(unint64_t)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a6;
  v19 = a7;
  v20 = a10;
  v21 = a4;
  GEOGetNetworkRequestLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    v24 = v23;
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 138414082;
    v32 = v17;
    v33 = 1024;
    v34 = a8.var1.var0 | a8.var0;
    v35 = 1024;
    v36 = a9;
    v37 = 2048;
    v38 = v24;
    v39 = 2048;
    v40 = v25;
    v41 = 1024;
    v42 = a11;
    v43 = 1024;
    v44 = a12;
    v45 = 1024;
    v46 = a13;
    _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_DEFAULT, "A:%@,T:%d,R:%d,B:%.6f,E:%.6f,S:%d,V:%d,M:%d", buf, 0x3Eu);
  }

  +[GEORequestCountPowerLogger sharedInstance](GEORequestCountPowerLogger, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "incrementCountForClient:requestType:", v17, (a8.var1.var0 | a8.var0));

  +[GEOOfflineStateManager shared](GEOOfflineStateManager, "shared");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "length"))
    v28 = v21;
  else
    v28 = v17;
  objc_msgSend(v19, "timeIntervalSinceDate:", v18);
  objc_msgSend(v27, "reportResponse:usedInterfaces:requestMode:forCohortId:duration:error:", a8, a13, a5, v28, v20);

  -[GEORequestCounterPersistence incrementForApp:startTime:endTime:requestType:result:xmitBytes:recvBytes:usedInterfaces:withCompletion:](self->_persistence, "incrementForApp:startTime:endTime:requestType:result:xmitBytes:recvBytes:usedInterfaces:withCompletion:", v17, v18, v19, (a8.var1.var0 | a8.var0), a9, a11, a12, a13, 0);
}

+ (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5 persistence:(id)a6
{
  id v11;
  uint64_t v12;
  void *v13;

  v11 = a6;
  objc_msgSend(a1, "requestCounterTicketForType:auditToken:traits:", a3, a4, a5);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    objc_storeStrong((id *)(v12 + 136), a6);

  return v13;
}

@end
