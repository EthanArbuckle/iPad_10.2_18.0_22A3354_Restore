@implementation GEORequestCounterTicketBase

- (void)startingRequestWithTask:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t signpostId;
  GEORequestCounterTicketBase *parentTask;
  NSString *appId;
  int v16;
  int v17;
  int v18;
  GEORequestCounterTicketBase *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (self->_nwActivity)
    objc_msgSend(v5, "set_nw_activity:");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  self->_start = v8;

  objc_storeStrong((id *)&self->_task, a3);
  if (self->_signpostId + 1 >= 2)
  {
    -[NSURLSessionTask originalRequest](self->_task, "originalRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForHTTPHeaderField:", CFSTR("Proxy-Authorization"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    GEOGetNetworkRequestLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      parentTask = self->_parentTask;
      if (parentTask)
        parentTask = (GEORequestCounterTicketBase *)parentTask->_signpostId;
      appId = self->_appId;
      v16 = self->_type.subtype.raw | self->_type.type;
      if (v10)
        v17 = 89;
      else
        v17 = 78;
      v18 = 134218754;
      v19 = parentTask;
      v20 = 2112;
      v21 = appId;
      v22 = 1024;
      v23 = v16;
      v24 = 1024;
      v25 = v17;
      _os_signpost_emit_with_name_impl(&dword_1885A9000, v12, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "RequestInterval", "Parent=%#llx App=%@ RequestKind=%#05x Proxied=%c", (uint8_t *)&v18, 0x22u);
    }

  }
}

- (void)_requestCompletedWithError:(id)a3 xmitBytes:(int64_t)a4 recvBytes:(int64_t)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  int result;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t signpostId;
  GEORequestCounterTicketBase *parentTask;
  NSString *appId;
  int v21;
  int v22;
  NSObject *v23;
  const __CFString *v24;
  const __CFString *v25;
  int64_t v26;
  int64_t v27;
  unint64_t v28;
  NSURLSessionTask *task;
  void *v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  float64_t v35;
  float64x2_t v36;
  float64x2_t v37;
  int8x16_t v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  NSString *v44;
  NSString *offlineCohortId;
  void *v46;
  void *v47;
  GEORequestCounterTicketBase *v48;
  GEORequestCounterTicketBase *v49;
  uint64_t v50;
  float64_t v51;
  unsigned int requestMode;
  uint64_t v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  v12 = GEOErrorToCounterInfoResult(v8);
  result = self->_result;
  if (result == 3 || result == 254)
  {
    if (self->_signpostId + 1 >= 2)
    {
      -[NSURLSessionTask originalRequest](self->_task, "originalRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "valueForHTTPHeaderField:", CFSTR("Proxy-Authorization"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      GEOGetNetworkRequestLog();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      signpostId = self->_signpostId;
      if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        parentTask = self->_parentTask;
        if (parentTask)
          parentTask = (GEORequestCounterTicketBase *)parentTask->_signpostId;
        appId = self->_appId;
        v21 = self->_type.subtype.raw | self->_type.type;
        if (v15)
          v22 = 89;
        else
          v22 = 78;
        *(_DWORD *)buf = 134218754;
        v55 = parentTask;
        v56 = 2112;
        v57 = (const __CFString *)appId;
        v58 = 1024;
        LODWORD(v59[0]) = v21;
        WORD2(v59[0]) = 1024;
        *(_DWORD *)((char *)v59 + 6) = v22;
        _os_signpost_emit_with_name_impl(&dword_1885A9000, v17, OS_SIGNPOST_INTERVAL_END, signpostId, "RequestInterval", "Parent=%#llx App=%@ RequestKind=%#05x Proxied=%c", buf, 0x22u);
      }

    }
    if (self->_nwActivity
      && !self->_nwActivityCompleted
      && (self->_result == 254 || (self->_explicitInterfaces & 0x100) != 0))
    {
      nw_activity_complete_with_reason();
      self->_nwActivityCompleted = 1;
    }
    v53 = v12;
    self->_result = v12;
    v26 = self->_subTaskXmitBytes + a4;
    v27 = self->_subTaskRecvBytes + a5;
    v28 = self->_explicitInterfaces | self->_subTaskUsedInterfaces;
    -[NSURLSessionTask _incompleteCurrentTaskTransactionMetrics](self->_task, "_incompleteCurrentTaskTransactionMetrics");
    v23 = objc_claimAutoreleasedReturnValue();
    task = self->_task;
    self->_task = 0;

    if (v23)
    {
      -[NSObject fetchStartDate](v23, "fetchStartDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "timeIntervalSinceReferenceDate");
      v51 = v31;

      -[NSObject responseEndDate](v23, "responseEndDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSinceReferenceDate");
      v34 = v33;

      if (v34 == 0.0)
        v35 = v11;
      else
        v35 = v34;
      v36.f64[0] = self->_start;
      v36.f64[1] = v35;
      v37.f64[1] = self->_end;
      v37.f64[0] = v51;
      v38 = (int8x16_t)vcgtq_f64(v37, v36);
      v36.f64[0] = v51;
      *(int8x16_t *)&self->_start = vbslq_s8(v38, *(int8x16_t *)&self->_start, (int8x16_t)v36);
      if (!v8 || v26 || v27)
        goto LABEL_38;
      -[NSObject connectEndDate](v23, "connectEndDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {

LABEL_38:
        v41 = -[NSObject isCellular](v23, "isCellular");
        v42 = 1;
        if (v41)
          v42 = 2;
        v43 = v42 | v28;
        if (-[NSObject isExpensive](v23, "isExpensive"))
          v43 |= 4uLL;
        if (-[NSObject isConstrained](v23, "isConstrained"))
          v43 |= 8uLL;
        if (-[NSObject isMultipath](v23, "isMultipath"))
          v28 = v43 | 0x10;
        else
          v28 = v43;
        goto LABEL_47;
      }
      -[NSObject networkProtocolName](v23, "networkProtocolName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
        goto LABEL_38;
    }
    else
    {
      self->_end = v11;
    }
LABEL_47:
    if (!self->_logNetworkActivityOnly)
    {
      v44 = self->_appId;
      offlineCohortId = self->_offlineCohortId;
      requestMode = self->_requestMode;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_start);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_end);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v50) = v53;
      -[GEORequestCounterTicketBase _incrementForApp:offlineCohortId:requestMode:startTime:endTime:requestType:result:error:xmitBytes:recvBytes:usedInterfaces:](self, "_incrementForApp:offlineCohortId:requestMode:startTime:endTime:requestType:result:error:xmitBytes:recvBytes:usedInterfaces:", v44, offlineCohortId, requestMode, v46, v47, *(_QWORD *)&self->_type, v50, v8, v26, v27, v28);

    }
    v48 = self->_parentTask;
    if (v48)
    {
      -[GEORequestCounterTicketBase _subTask:completed:error:started:finished:xmitBytes:recvBytes:usedInterfaces:](v48, "_subTask:completed:error:started:finished:xmitBytes:recvBytes:usedInterfaces:", self, v53, v8, v26, v27, v28, self->_start, self->_end);
      v49 = self->_parentTask;
      self->_parentTask = 0;

    }
    goto LABEL_51;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    if ((self->_result + 2) > 7u)
      v24 = CFSTR("Success");
    else
      v24 = off_1E1C021D8[(char)(self->_result + 2)];
    if ((v12 - 1) > 3u)
      v25 = CFSTR("Success");
    else
      v25 = off_1E1C02218[(char)v12 - 1];
    *(_DWORD *)buf = 138412802;
    v55 = (void *)v24;
    v56 = 2112;
    v57 = v25;
    v58 = 2112;
    v59[0] = self;
    _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_FAULT, "Tried to complete request twice (initial: %@, new: %@): %@", buf, 0x20u);
  }
LABEL_51:

}

- (void)requestCompleted:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (self->_explicitInterfaces)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _explicitInterfaces == 0", v6, 2u);
    }
  }
  else
  {
    -[NSURLSessionTask _incompleteCurrentTaskTransactionMetrics](self->_task, "_incompleteCurrentTaskTransactionMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORequestCounterTicketBase _requestCompletedWithError:xmitBytes:recvBytes:](self, "_requestCompletedWithError:xmitBytes:recvBytes:", v4, objc_msgSend(v5, "countOfRequestBodyBytesSent") + objc_msgSend(v5, "countOfRequestHeaderBytesSent"), objc_msgSend(v5, "countOfResponseBodyBytesReceived") + objc_msgSend(v5, "countOfResponseHeaderBytesReceived"));

  }
}

- (void)dealloc
{
  GEORequestCounterTicketBase *parentTask;
  GEORequestCounterTicketBase *v4;
  objc_super v5;

  if (self->_nwActivity && !self->_nwActivityCompleted)
  {
    nw_activity_complete_with_reason();
    self->_nwActivityCompleted = 1;
  }
  parentTask = self->_parentTask;
  if (parentTask && self->_result == 254)
  {
    -[GEORequestCounterTicketBase _subTask:completed:error:started:finished:xmitBytes:recvBytes:usedInterfaces:](parentTask, "_subTask:completed:error:started:finished:xmitBytes:recvBytes:usedInterfaces:", self, 255, 0, 0, 0, 0, 0.0, 0.0);
    v4 = self->_parentTask;
    self->_parentTask = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)GEORequestCounterTicketBase;
  -[GEORequestCounterTicketBase dealloc](&v5, sel_dealloc);
}

- (void)_subTask:(id)a3 completed:(unsigned __int8)a4 error:(id)a5 started:(double)a6 finished:(double)a7 xmitBytes:(int64_t)a8 recvBytes:(int64_t)a9 usedInterfaces:(unint64_t)a10
{
  int v14;
  id v16;
  unsigned __int8 subtasks;
  int64_t subTaskRecvBytes;
  int64_t v19;
  float64x2_t v20;
  float64x2_t v21;
  int8x16_t v22;
  unsigned __int8 v23;
  __int128 v24;
  id v26;

  v24 = *(_OWORD *)&a7;
  v14 = a4;
  v26 = a3;
  v16 = a5;
  subtasks = self->_subtasks;
  if (subtasks)
  {
    if (v14 != 255)
    {
      subTaskRecvBytes = self->_subTaskRecvBytes;
      v19 = self->_subTaskXmitBytes + a8;
      v20.f64[0] = self->_start;
      *(_QWORD *)&v20.f64[1] = v24;
      v21.f64[1] = self->_end;
      v21.f64[0] = a6;
      v22 = (int8x16_t)vcgtq_f64(v21, v20);
      v20.f64[0] = a6;
      *(int8x16_t *)&self->_start = vbslq_s8(v22, *(int8x16_t *)&self->_start, (int8x16_t)v20);
      self->_subTaskXmitBytes = v19;
      self->_subTaskRecvBytes = subTaskRecvBytes + a9;
      self->_subTaskUsedInterfaces |= a10;
      if ((v14 - 1) <= 0xFD)
      {
        self->_subtasks = 0;
        self->_subTaskResult = v14;
LABEL_6:
        -[GEORequestCounterTicketBase requestCompleted:](self, "requestCompleted:", v16, v24);
        goto LABEL_7;
      }
    }
    v23 = subtasks - 1;
    self->_subtasks = v23;
    if (!v23)
      goto LABEL_6;
  }
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwActivity, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_parentTask, 0);
  objc_storeStrong((id *)&self->_offlineCohortId, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

- (id)createSubtask:(BOOL)a3
{
  void *v3;

  if (self->_result == 254)
  {
    ++self->_subtasks;
    objc_msgSend((id)objc_opt_class(), "_requestCounterTicketForType:appId:traits:offlineCohortId:withParent:logNetworkActivityOnly:", *(_QWORD *)&self->_type, self->_appId, 0, self->_offlineCohortId, self, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "bundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "offlineCohortId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_requestCounterTicketForType:appId:traits:offlineCohortId:withParent:logNetworkActivityOnly:", a3, v10, v8, v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_requestCounterTicketForType:(id)a3 appId:(id)a4 traits:(id)a5 offlineCohortId:(id)a6 withParent:(id)a7 logNetworkActivityOnly:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  _DWORD *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  NSObject *v24;
  int v25;
  int v26;
  uint64_t v27;
  void *v28;
  uint8_t v30[16];

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (objc_msgSend(v14, "length"))
  {
    v18 = (char *)objc_alloc_init((Class)a1);
    if (v18)
    {
      v19 = objc_msgSend(v14, "copy");
      v20 = (void *)*((_QWORD *)v18 + 1);
      *((_QWORD *)v18 + 1) = v19;

      v21 = objc_msgSend(v16, "copy");
      v22 = (void *)*((_QWORD *)v18 + 2);
      *((_QWORD *)v18 + 2) = v21;

      v23 = v17 ? v17[6] : objc_msgSend(v15, "requestMode");
      *((_DWORD *)v18 + 6) = v23;
      *((_QWORD *)v18 + 16) = 0;
      *($C4D369C9F02205611300857CFD58F739 *)(v18 + 28) = a3;
      v18[36] = a8;
      GEOGetNetworkRequestLog();
      v24 = objc_claimAutoreleasedReturnValue();
      *((_QWORD *)v18 + 15) = os_signpost_id_generate(v24);

      *(_OWORD *)(v18 + 40) = xmmword_189CC2D70;
      v18[37] = -2;
      if (objc_msgSend(v14, "length"))
      {
        v25 = GEORequestCounterNWActivityDomainForAppId(v14);
        v26 = GEODataRequestKindToNWActivityLabel(*(_QWORD *)&a3);
        if (v25)
        {
          if (v26)
          {
            v27 = nw_activity_create();
            v28 = (void *)*((_QWORD *)v18 + 13);
            *((_QWORD *)v18 + 13) = v27;

            if (v17)
            {
              objc_storeStrong((id *)v18 + 10, a7);
              if (*((_QWORD *)v18 + 13))
              {
                if (*((_QWORD *)v17 + 13))
                  nw_activity_set_parent_activity();
              }
            }
            nw_activity_activate();
          }
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: appId.length > 0", v30, 2u);
    }
    v18 = 0;
  }

  return v18;
}

- (void)startingRequestWithExplicitInterfaces:(unint64_t)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t signpostId;
  GEORequestCounterTicketBase *parentTask;
  NSString *appId;
  int v13;
  int v14;
  int v15;
  GEORequestCounterTicketBase *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  self->_explicitInterfaces = a3;
  if (self->_nwActivity && !self->_nwActivityCompleted)
    nw_activity_activate();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  self->_start = v5;

  if (self->_signpostId + 1 >= 2)
  {
    -[NSURLSessionTask originalRequest](self->_task, "originalRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForHTTPHeaderField:", CFSTR("Proxy-Authorization"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    GEOGetNetworkRequestLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      parentTask = self->_parentTask;
      if (parentTask)
        parentTask = (GEORequestCounterTicketBase *)parentTask->_signpostId;
      appId = self->_appId;
      v13 = self->_type.subtype.raw | self->_type.type;
      if (v7)
        v14 = 89;
      else
        v14 = 78;
      v15 = 134218754;
      v16 = parentTask;
      v17 = 2112;
      v18 = appId;
      v19 = 1024;
      v20 = v13;
      v21 = 1024;
      v22 = v14;
      _os_signpost_emit_with_name_impl(&dword_1885A9000, v9, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "RequestInterval", "Parent=%#llx App=%@ RequestKind=%#05x Proxied=%c", (uint8_t *)&v15, 0x22u);
    }

  }
}

- (void)explicitInterfaceRequestCompleted:(id)a3 xmitBytes:(unint64_t)a4 recvBytes:(unint64_t)a5
{
  id v8;
  uint8_t v9[16];

  v8 = a3;
  if (self->_explicitInterfaces)
  {
    -[GEORequestCounterTicketBase _requestCompletedWithError:xmitBytes:recvBytes:](self, "_requestCompletedWithError:xmitBytes:recvBytes:", v8, a4, a5);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _explicitInterfaces != 0", v9, 2u);
  }

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<RT %p app: %@ %@>"), self, self->_appId, self->_nwActivity);
}

- (void)_incrementForApp:(id)a3 offlineCohortId:(id)a4 requestMode:(int)a5 startTime:(id)a6 endTime:(id)a7 requestType:(id)a8 result:(unsigned __int8)a9 error:(id)a10 xmitBytes:(int64_t)a11 recvBytes:(int64_t)a12 usedInterfaces:(unint64_t)a13
{
  -[GEORequestCounterTicketBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, *(_QWORD *)&a5, a6, a7, a8);
}

- (NSString)appId
{
  return self->_appId;
}

@end
