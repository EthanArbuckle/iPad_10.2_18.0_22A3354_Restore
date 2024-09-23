@implementation __CFN_TransactionMetrics

- (void)linkWithConnection:(_BYTE *)a1
{
  const char *v3;
  id Property;
  id v5;
  _BYTE *self;

  self = a2;
  if (a1)
  {
    Property = self;
    if (self)
    {
      if (self[23])
      {
LABEL_8:
        objc_setProperty_atomic(a1, v3, self, 88);
        goto LABEL_9;
      }
      a1[9] = 1;
      self[23] = 1;
      Property = objc_getProperty(self, v3, 160, 1);
    }
    else
    {
      a1[9] = 1;
    }
    v5 = Property;

    if (!v5 && self)
      objc_setProperty_atomic_copy(self, v3, CFSTR("http/1.1"), 160);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)end:(void *)a3 taskMetrics:
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id Property;
  NSObject *v16;
  uint32_t os_unfair_lock_opaque;
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  double v22;
  double v23;
  const char *v24;
  double v25;
  unsigned int v26;
  double v27;
  double v28;
  unsigned int v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  _BOOL4 v35;
  id v36;
  const char *v37;
  double v38;
  unsigned int v39;
  unsigned int v40;
  double v41;
  unsigned int v42;
  double v43;
  double v44;
  unsigned int v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  const char *v52;
  NSObject *v53;
  uint32_t v54;
  id v55;
  const char *v56;
  unsigned int v57;
  _BOOL4 v58;
  id v59;
  uint64_t v60;
  double v61;
  double v62;
  const char *v63;
  unsigned int v64;
  double v65;
  unsigned int v66;
  double v67;
  double v68;
  unsigned int v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  NSObject *v76;
  id v77;
  os_signpost_id_t v78;
  NSObject *v79;
  NSObject *v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  id v84;
  id v85;
  id *v86;
  id v87;
  id v88;
  NSObject *v89;
  double v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t i;
  uint64_t v96;
  void *v97;
  double v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  NSDictionary *v102;
  uint64_t j;
  NSDictionary *v104;
  void *v105;
  double v106;
  id v107;
  uint64_t v108;
  id *v109;
  os_unfair_lock_s *self;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __CFN_ConnectionMetrics v119;
  const __CFString *v120;
  _QWORD v121[2];
  uint8_t v122[128];
  _BYTE buf[40];
  __int128 v124;
  uint64_t v125;
  __int16 v126;
  _BYTE v127[10];
  _BYTE v128[6];
  _BYTE v129[6];
  _BYTE v130[6];
  _BYTE v131[48];
  _BYTE v132[10];
  __int16 v133;
  uint64_t v134;
  __int16 v135;
  _BOOL4 v136;
  _QWORD v137[5];

  v137[2] = *MEMORY[0x1E0C80C00];
  v109 = a3;
  if (!a1)
    goto LABEL_60;
  self = (os_unfair_lock_s *)objc_getProperty((id)a1, v5, 88, 1);
  *(CFAbsoluteTime *)(a1 + 152) = CFAbsoluteTimeGetCurrent();
  *(_QWORD *)(a1 + 208) = a2;
  v6 = *(_QWORD *)(a1 + 224);
  if ((v6 & 0x82) != 0)
  {
    -[__CFN_ConnectionMetrics tcpInfo](self);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 256);
    *(_QWORD *)(a1 + 256) = v7;

    v6 = *(_QWORD *)(a1 + 224);
  }
  if ((v6 & 0x20) != 0)
  {
    -[__CFN_ConnectionMetrics subflowCounts](self);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 272);
    *(_QWORD *)(a1 + 272) = v9;

  }
  v108 = a1;
  v137[0] = 0;
  v137[1] = 0;
  v11 = v109[3];
  objc_msgSend(v11, "getUUIDBytes:", v137);

  v12 = 80;
  if (!*(_QWORD *)(v108 + 80))
    v12 = 72;
  v107 = *(id *)(v108 + v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = objc_msgSend(v107, "statusCode");
  else
    v14 = -1;
  if (*(_BYTE *)(v108 + 9))
  {
    Property = self;
    if (self)
      Property = objc_getProperty(self, v13, 160, 1);
    v16 = Property;
    memset(&v119, 0, 32);
    os_unfair_lock_opaque = self;
    connectionTimingFromMetrics(&v119, self);
    if (self)
      os_unfair_lock_opaque = self[8]._os_unfair_lock_opaque;
    summaryLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v14;
      v20 = v109[4];
      if (self)
        v21 = *(_QWORD *)&self[18]._os_unfair_lock_opaque;
      else
        v21 = 0;
      v22 = *(double *)(v108 + 144);
      v23 = *(double *)(v108 + 152);
      v24 = endReasonString(a2);
      v25 = *(double *)(v108 + 176);
      v26 = ((v25 - v22) * 1000.0);
      v27 = *(double *)(v108 + 184) - v25;
      v28 = *(double *)(v108 + 192);
      v29 = ((v28 - v22) * 1000.0);
      v30 = *(double *)(v108 + 200) - v28;
      v31 = *(_QWORD *)(v108 + 112) + *(_QWORD *)(v108 + 96);
      v32 = *(_QWORD *)(v108 + 136) + *(_QWORD *)(v108 + 120);
      v33 = *(_QWORD *)(v108 + 72);
      *(_DWORD *)buf = 68293890;
      *(_DWORD *)&buf[4] = 16;
      *(_WORD *)&buf[8] = 2098;
      *(_QWORD *)&buf[10] = v137;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v20;
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = v24;
      *(_WORD *)&buf[38] = 1024;
      LODWORD(v124) = ((v23 - v22) * 1000.0);
      WORD2(v124) = 2048;
      v14 = v19;
      *(_QWORD *)((char *)&v124 + 6) = v19;
      HIWORD(v124) = 2048;
      v125 = v21;
      v126 = 2114;
      *(_QWORD *)v127 = v16;
      *(_WORD *)&v127[8] = 1024;
      *(_DWORD *)v128 = *(_DWORD *)&v119._expensive;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)v129 = *(_DWORD *)&v119._isUnlistedTracker;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)v130 = *(_DWORD *)&v119._coalesced;
      *(_WORD *)&v130[4] = 1024;
      *(_DWORD *)v131 = os_unfair_lock_opaque == 2;
      *(_WORD *)&v131[4] = 1024;
      *(_DWORD *)&v131[6] = v26;
      *(_WORD *)&v131[10] = 1024;
      *(_DWORD *)&v131[12] = (v27 * 1000.0);
      *(_WORD *)&v131[16] = 1024;
      *(_DWORD *)&v131[18] = v29;
      *(_WORD *)&v131[22] = 1024;
      *(_DWORD *)&v131[24] = (v30 * 1000.0);
      *(_WORD *)&v131[28] = 2048;
      *(_QWORD *)&v131[30] = v31;
      *(_WORD *)&v131[38] = 2048;
      *(_QWORD *)&v131[40] = (uint64_t)((double)v31 / (v27 * 1024.0));
      *(_WORD *)v132 = 2048;
      *(_QWORD *)&v132[2] = v32;
      v133 = 2048;
      v134 = (uint64_t)((double)v32 / (v30 * 1024.0));
      v135 = 1024;
      v136 = v33 != 0;
      _os_log_impl(&dword_183ECA000, v18, OS_LOG_TYPE_DEFAULT, "Task <%{public,uuid_t}.16P>.<%lu> summary for %{public}s {transaction_duration_ms=%u, response_status=%ld, connection=%llu, protocol=\"%{public}@\", domain_lookup_duration_ms=%u, connect_duration_ms=%u, secure_connection_duration_ms=%u, private_relay=%{BOOL}d, request_start_ms=%u, request_duration_ms=%u, response_start_ms=%u, response_duration_ms=%u, request_bytes=%lld, request_throughput_kbps=%lld, response_bytes=%lld, response_throughput_kbps=%lld, cache_hit=%{BOOL}d}", buf, 0xA8u);
    }

    goto LABEL_30;
  }
  if (self)
  {
    v34 = BYTE2(self[5]._os_unfair_lock_opaque);
    summaryLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v35 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v35)
      {
        v36 = v109[4];
        v37 = endReasonString(a2);
        v38 = *(double *)(v108 + 144);
        v39 = ((*(double *)(v108 + 152) - v38) * 1000.0);
        v40 = (*(double *)(v108 + 232) * 1000.0);
        v41 = *(double *)(v108 + 176);
        v42 = ((v41 - v38) * 1000.0);
        v43 = *(double *)(v108 + 184) - v41;
        v44 = *(double *)(v108 + 192);
        v45 = ((v44 - v38) * 1000.0);
        v46 = *(_QWORD *)&self[18]._os_unfair_lock_opaque;
        v47 = *(double *)(v108 + 200) - v44;
        v48 = *(_QWORD *)(v108 + 112) + *(_QWORD *)(v108 + 96);
        v49 = *(_QWORD *)(v108 + 136) + *(_QWORD *)(v108 + 120);
        v50 = BYTE1(self[5]._os_unfair_lock_opaque);
        v51 = *(_QWORD *)(v108 + 72);
        *(_DWORD *)buf = 68293122;
        *(_DWORD *)&buf[4] = 16;
        *(_WORD *)&buf[8] = 2098;
        *(_QWORD *)&buf[10] = v137;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v36;
        *(_WORD *)&buf[28] = 2082;
        *(_QWORD *)&buf[30] = v37;
        *(_WORD *)&buf[38] = 1024;
        LODWORD(v124) = v39;
        WORD2(v124) = 2048;
        *(_QWORD *)((char *)&v124 + 6) = v14;
        HIWORD(v124) = 2048;
        v125 = v46;
        v126 = 1024;
        *(_DWORD *)v127 = v40;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = v50;
        *(_WORD *)v128 = 1024;
        *(_DWORD *)&v128[2] = v42;
        *(_WORD *)v129 = 1024;
        *(_DWORD *)&v129[2] = (v43 * 1000.0);
        *(_WORD *)v130 = 1024;
        *(_DWORD *)&v130[2] = v45;
        *(_WORD *)v131 = 1024;
        *(_DWORD *)&v131[2] = (v47 * 1000.0);
        *(_WORD *)&v131[6] = 2048;
        *(_QWORD *)&v131[8] = v48;
        *(_WORD *)&v131[16] = 2048;
        *(_QWORD *)&v131[18] = (uint64_t)((double)v48 / (v43 * 1024.0));
        *(_WORD *)&v131[26] = 2048;
        *(_QWORD *)&v131[28] = v49;
        *(_WORD *)&v131[36] = 2048;
        *(_QWORD *)&v131[38] = (uint64_t)((double)v49 / (v47 * 1024.0));
        *(_WORD *)&v131[46] = 1024;
        *(_DWORD *)v132 = v51 != 0;
        v52 = "Task <%{public,uuid_t}.16P>.<%lu> summary for %{public}s {transaction_duration_ms=%u, response_status=%ld,"
              " connection=%llu, reused=1, reused_after_ms=%u, reused_after_sleep=%{BOOL}d, request_start_ms=%u, request_"
              "duration_ms=%u, response_start_ms=%u, response_duration_ms=%u, request_bytes=%lld, request_throughput_kbps"
              "=%lld, response_bytes=%lld, response_throughput_kbps=%lld, cache_hit=%{BOOL}d}";
        v53 = v16;
        v54 = 146;
LABEL_29:
        _os_log_impl(&dword_183ECA000, v53, OS_LOG_TYPE_DEFAULT, v52, buf, v54);
      }
    }
    else if (v35)
    {
      v59 = v109[4];
      v60 = *(_QWORD *)&self[18]._os_unfair_lock_opaque;
      v61 = *(double *)(v108 + 144);
      v62 = *(double *)(v108 + 152);
      v63 = endReasonString(a2);
      v64 = (*(double *)(v108 + 232) * 1000.0);
      v65 = *(double *)(v108 + 176);
      v66 = ((v65 - v61) * 1000.0);
      v67 = *(double *)(v108 + 184) - v65;
      v68 = *(double *)(v108 + 192);
      v69 = ((v68 - v61) * 1000.0);
      v70 = *(double *)(v108 + 200) - v68;
      v71 = *(_QWORD *)(v108 + 112) + *(_QWORD *)(v108 + 96);
      v72 = *(_QWORD *)(v108 + 136) + *(_QWORD *)(v108 + 120);
      v73 = *(_QWORD *)(v108 + 72);
      *(_DWORD *)buf = 68292866;
      *(_DWORD *)&buf[4] = 16;
      *(_WORD *)&buf[8] = 2098;
      *(_QWORD *)&buf[10] = v137;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v59;
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = v63;
      *(_WORD *)&buf[38] = 1024;
      LODWORD(v124) = ((v62 - v61) * 1000.0);
      WORD2(v124) = 2048;
      *(_QWORD *)((char *)&v124 + 6) = v14;
      HIWORD(v124) = 2048;
      v125 = v60;
      v126 = 1024;
      *(_DWORD *)v127 = v64;
      *(_WORD *)&v127[4] = 1024;
      *(_DWORD *)&v127[6] = v66;
      *(_WORD *)v128 = 1024;
      *(_DWORD *)&v128[2] = (v67 * 1000.0);
      *(_WORD *)v129 = 1024;
      *(_DWORD *)&v129[2] = v69;
      *(_WORD *)v130 = 1024;
      *(_DWORD *)&v130[2] = (v70 * 1000.0);
      *(_WORD *)v131 = 2048;
      *(_QWORD *)&v131[2] = v71;
      *(_WORD *)&v131[10] = 2048;
      *(_QWORD *)&v131[12] = (uint64_t)((double)v71 / (v67 * 1024.0));
      *(_WORD *)&v131[20] = 2048;
      *(_QWORD *)&v131[22] = v72;
      *(_WORD *)&v131[30] = 2048;
      *(_QWORD *)&v131[32] = (uint64_t)((double)v72 / (v70 * 1024.0));
      *(_WORD *)&v131[40] = 1024;
      *(_DWORD *)&v131[42] = v73 != 0;
      v52 = "Task <%{public,uuid_t}.16P>.<%lu> summary for %{public}s {transaction_duration_ms=%u, response_status=%ld, c"
            "onnection=%llu, reused=1, reused_after_ms=%u, request_start_ms=%u, request_duration_ms=%u, response_start_ms"
            "=%u, response_duration_ms=%u, request_bytes=%lld, request_throughput_kbps=%lld, response_bytes=%lld, respons"
            "e_throughput_kbps=%lld, cache_hit=%{BOOL}d}";
      v53 = v16;
      v54 = 140;
      goto LABEL_29;
    }
  }
  else
  {
    summaryLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v55 = v109[4];
      v56 = endReasonString(a2);
      v57 = ((*(double *)(v108 + 152) - *(double *)(v108 + 144)) * 1000.0);
      v58 = *(_QWORD *)(v108 + 72) != 0;
      *(_DWORD *)buf = 68290306;
      *(_DWORD *)&buf[4] = 16;
      *(_WORD *)&buf[8] = 2098;
      *(_QWORD *)&buf[10] = v137;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v55;
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = v56;
      *(_WORD *)&buf[38] = 1024;
      LODWORD(v124) = v57;
      WORD2(v124) = 2048;
      *(_QWORD *)((char *)&v124 + 6) = v14;
      HIWORD(v124) = 1024;
      LODWORD(v125) = v58;
      v52 = "Task <%{public,uuid_t}.16P>.<%lu> summary for %{public}s {transaction_duration_ms=%u, response_status=%ld, c"
            "ache_hit=%{BOOL}d}";
      v53 = v16;
      v54 = 60;
      goto LABEL_29;
    }
  }
LABEL_30:

  v74 = (id)v108;
  if (HARLoggingEnabled(*((_DWORD *)v74 + 4)))
  {
    if (emptyJSONDictData(void)::onceToken != -1)
      dispatch_once(&emptyJSONDictData(void)::onceToken, &__block_literal_global_206);
    v75 = (id)emptyJSONDictData(void)::data;
    instrumentsTransactionLog();
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = *((id *)v74 + 6);
    v78 = os_signpost_id_make_with_pointer(v76, v77);

    instrumentsTransactionLog();
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = v79;
    if (v78 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      v81 = *(_QWORD *)(v108 + 208);
      v82 = objc_msgSend(v75, "length");
      v83 = objc_msgSend(objc_retainAutorelease(v75), "bytes");
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v81;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 1040;
      *(_DWORD *)&buf[24] = v82;
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = v83;
      _os_signpost_emit_with_name_impl(&dword_183ECA000, v80, OS_SIGNPOST_INTERVAL_END, v78, "Transaction", "End Reason: %lu, Status Code: %ld, Additional Info: %{public,xcode:data}.*s", buf, 0x26u);
    }

  }
  v84 = v109[3];
  v85 = v109[10];
  v86 = (id *)v74;
  v87 = v84;
  v88 = v85;
  if (HARLoggingEnabled(*((_DWORD *)v74 + 4)))
  {
    v89 = HARQueue;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __logHAREntry_block_invoke;
    *(_QWORD *)&buf[24] = &unk_1E14FE1E0;
    *(_QWORD *)&buf[32] = v86;
    *(_QWORD *)&v124 = v87;
    *((_QWORD *)&v124 + 1) = v88;
    dispatch_async(v89, buf);

  }
  if (AnalyticsIsEventUsed_delayInitStub(v90))
  {
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    objc_msgSend(v86[8], "_allHTTPHeaderFieldsAsArrays");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v115, v122, 16);
    if (v92)
    {
      v93 = *(_QWORD *)v116;
      v94 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (i = 0; i != v92; ++i)
        {
          if (*(_QWORD *)v116 != v93)
            objc_enumerationMutation(v91);
          v96 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * i);
          if ((arc4random() & 0xFFFFF) == 0)
          {
            v119._transportConnection.__cntrl_ = (__shared_weak_count *)CFSTR("HeaderName");
            v120 = CFSTR("IsRequest");
            v121[0] = v96;
            v121[1] = v94;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, &v119._transportConnection.__cntrl_, 2);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            AnalyticsSendEvent_delayInitStub(v98);

          }
        }
        v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v115, v122, 16);
      }
      while (v92);
    }

    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    objc_msgSend(*(id *)(v108 + 80), "_allHTTPHeaderFieldsAsArrays");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v111, &v119._UUID, 16);
    if (v100)
    {
      v101 = *(_QWORD *)v112;
      v102 = (NSDictionary *)MEMORY[0x1E0C9AAA0];
      do
      {
        for (j = 0; j != v100; ++j)
        {
          if (*(_QWORD *)v112 != v101)
            objc_enumerationMutation(v99);
          v104 = *(NSDictionary **)(*((_QWORD *)&v111 + 1) + 8 * j);
          if ((arc4random() & 0xFFFFF) == 0)
          {
            *(_QWORD *)&v119._privacyStance = CFSTR("HeaderName");
            v119._connection = (OS_nw_connection *)CFSTR("IsRequest");
            v119._cachedTCPInfoAtEnd = v104;
            v119._cachedSubflowCounts = v102;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119._cachedTCPInfoAtEnd, &v119._privacyStance, 2);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            AnalyticsSendEvent_delayInitStub(v106);

          }
        }
        v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v111, &v119._UUID, 16);
      }
      while (v100);
    }

  }
LABEL_60:

}

- (void)requestBeginOnConnection:(double)a3 reusedAfterTime:
{
  const char *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  void *v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  if (a1)
  {
    *(CFAbsoluteTime *)(a1 + 176) = CFAbsoluteTimeGetCurrent();
    *(double *)(a1 + 232) = a3;
    v6 = *(_QWORD *)(a1 + 224);
    if ((v6 & 0x82) != 0)
    {
      v7 = (os_unfair_lock_s *)objc_getProperty((id)a1, v5, 88, 1);
      -[__CFN_ConnectionMetrics tcpInfo](v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 248);
      *(_QWORD *)(a1 + 248) = v8;

      v6 = *(_QWORD *)(a1 + 224);
    }
    if ((v6 & 0x20) != 0)
    {
      v10 = (os_unfair_lock_s *)objc_getProperty((id)a1, v5, 88, 1);
      -[__CFN_ConnectionMetrics subflowCounts](v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 264);
      *(_QWORD *)(a1 + 264) = v11;

    }
  }

}

- (void)setTransferredRequest:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

+ (id)nstatCountsFromTCPInfo:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  unsigned int v31;
  uint64_t v32;
  id obj;
  id obja;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[18];
  _QWORD v47[18];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  objc_opt_self();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v30, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v2;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v3)
  {
    v40 = 0;
    v41 = 0;
    v38 = 0;
    v39 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v35 = *(_QWORD *)v43;
    v37 = 0;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v43 != v35)
          objc_enumerationMutation(obj);
        v13 = objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i)), "bytes");
        v8 += *(_QWORD *)(v13 + 100);
        v7 += *(_QWORD *)(v13 + 108);
        v11 += *(_QWORD *)(v13 + 68);
        v10 += *(_QWORD *)(v13 + 76);
        v6 += *(_QWORD *)(v13 + 116);
        v5 += *(_QWORD *)(v13 + 124);
        v9 += *(_QWORD *)(v13 + 84);
        v4 += *(_QWORD *)(v13 + 152);
        v37 += *(_QWORD *)(v13 + 168);
        v38 += *(_QWORD *)(v13 + 184);
        v39 += *(_QWORD *)(v13 + 200);
        v40 += *(_QWORD *)(v13 + 216);
        v41 += *(_QWORD *)(v13 + 232);
      }
      v31 = *(_DWORD *)(v13 + 24);
      v32 = *(_QWORD *)(v13 + 28);
      v2 = obj;
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v3);
  }
  else
  {
    v40 = 0;
    v41 = 0;
    v38 = 0;
    v39 = 0;
    v37 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v32 = 0;
    v31 = 0;
  }

  v46[0] = CFSTR("_kCFNTimingDataNStatRXPackets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v36;
  v46[1] = CFSTR("_kCFNTimingDataNStatRXBytes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v47[1] = obja;
  v46[2] = CFSTR("_kCFNTimingDataNStatTXPackets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v29;
  v46[3] = CFSTR("_kCFNTimingDataNStatTXBytes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v28;
  v46[4] = CFSTR("_kCFNTimingDataNStatRXDuplicateBytes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v27;
  v46[5] = CFSTR("_kCFNTimingDataNStatRXOutOfOrderBytes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v26;
  v46[6] = CFSTR("_kCFNTimingDataNStatTXRetransmit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v25;
  v47[7] = &unk_1E152A760;
  v46[7] = CFSTR("_kCFNTimingDataNStatConnectAttempts");
  v46[8] = CFSTR("_kCFNTimingDataNStatConnectSuccesses");
  v47[8] = &unk_1E152A760;
  v46[9] = CFSTR("_kCFNTimingDataNStatMinRTT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47[9] = v14;
  v46[10] = CFSTR("_kCFNTimingDataNStatAvgRTT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[10] = v15;
  v46[11] = CFSTR("_kCFNTimingDataNStatVarRTT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47[11] = v16;
  v46[12] = CFSTR("_kCFNTimingDataNStatCellRXPackets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[12] = v17;
  v46[13] = CFSTR("_kCFNTimingDataNStatCellTXPackets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v37);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47[13] = v18;
  v46[14] = CFSTR("_kCFNTimingDataNStatWifiRXPackets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v38);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47[14] = v19;
  v46[15] = CFSTR("_kCFNTimingDataNStatWifiTXPackets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v39);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47[15] = v20;
  v46[16] = CFSTR("_kCFNTimingDataNStatWiredRXPackets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v40);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[16] = v21;
  v46[17] = CFSTR("_kCFNTimingDataNStatWiredTXPackets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v41);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v47[17] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)legacyStaticMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  unint64_t v17;
  id *v18;
  const char *v19;
  id *v20;
  id v21;
  void *v22;
  double v23;
  void *v24;
  unint64_t v25;
  void *v26;
  double v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  NSObject *v40;
  const sockaddr *address;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  __int128 v57;
  __int128 v58;
  const __CFString *v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 50);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (isIMRemoteURLConnectionAgentProcess(void)::onceToken != -1)
      dispatch_once(&isIMRemoteURLConnectionAgentProcess(void)::onceToken, &__block_literal_global_18656);
    if (isIMRemoteURLConnectionAgentProcess(void)::isIMRemoteURLConnectionAgent)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("_kCFNTimingDataInternalTransactionMetrics"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 144));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("_kCFNTimingDataFetchStart"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("_kCFNTimingDataTimingDataInit"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 176));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("_kCFNTimingDataRequestStart"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 184));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("_kCFNTimingDataRequestEnd"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 192));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("_kCFNTimingDataResponseStart"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 200));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("_kCFNTimingDataResponseEnd"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(a1 + 9) == 0, *(double *)(a1 + 176));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("_kCFNTimingDataConnectionReused"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 96));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("_kCFNTimingDataRequestHeaderSize"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 120));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("_kCFNTimingDataResponseHeaderSize"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 136));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("_kCFNTimingDataResponseBodyBytesReceived"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 128));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("_kCFNTimingDataResponseBodyBytesDecoded"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 112) + *(_QWORD *)(a1 + 96));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("_kCFNTimingDataTotalBytesSent"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 136) + *(_QWORD *)(a1 + 120));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("_kCFNTimingDataTotalBytesReceived"));

    v17 = *(_QWORD *)(a1 + 216);
    if (v17 <= 5 && ((1 << v17) & 0x2C) != 0)
      objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_kCFNBackgroundMetricsIsDiscretionary"));
    v18 = (id *)objc_getProperty((id)a1, v16, 88, 1);
    v20 = v18;
    if (v18)
    {
      v21 = objc_getProperty(v18, v19, 64, 1);
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("_kCFNTimingDataConnectionUUID"));

      if (*(_BYTE *)(a1 + 9))
      {
        v57 = 0u;
        v58 = 0u;
        connectionTimingFromMetrics((__CFN_ConnectionMetrics *)&v57, v20);
        v23 = *(double *)&v57;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v57);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v24, CFSTR("_kCFNTimingDataDomainLookupStart"));

        LODWORD(v25) = v58;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23 + (double)v25 / 1000.0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v26, CFSTR("_kCFNTimingDataDomainLookupEnd"));

        v27 = *((double *)&v57 + 1);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v57 + 1));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v28, CFSTR("_kCFNTimingDataConnectStart"));

        v29 = DWORD1(v58);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27 + (double)DWORD1(v58) / 1000.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v30, CFSTR("_kCFNTimingDataConnectEnd"));

        if (BYTE12(v58))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27 + (double)(v29 - DWORD2(v58)) / 1000.0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v31, CFSTR("_kCFNTimingDataSecureConnectionStart"));

        }
      }
      v32 = v20[17];
      v33 = v32;
      if (v32 && nw_endpoint_get_type(v32) == nw_endpoint_type_address)
      {
        -[NSObject description](v33, "description");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v34, CFSTR("_kCFNTimingDataLocalAddressAndPort"));

      }
      v35 = v20[18];
      v36 = v35;
      if (v35 && nw_endpoint_get_type(v35) == nw_endpoint_type_address)
      {
        -[NSObject description](v36, "description");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v37, CFSTR("_kCFNTimingDataRemoteAddressAndPort"));

      }
      if ((*(_BYTE *)(a1 + 224) & 4) != 0)
      {
        v39 = v20[18];
        v40 = v39;
        if (v39 && nw_endpoint_get_type(v39) == nw_endpoint_type_address)
        {
          address = nw_endpoint_get_address(v40);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", address, address->sa_len);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v42, CFSTR("_kCFNTimingDataConnectionPeerAddress"));

        }
        v43 = v20[19];
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v43, CFSTR("_kCFNTimingDataConnectionInterfaceIdentifier"));

      }
      v44 = objc_getProperty(v20, v38, 160, 1);
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v44, CFSTR("_kCFNTimingDataNetworkProtocolName"));

      v59 = CFSTR("TFOSuccess");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v20 + 19));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v46, CFSTR("_kCFNTimingDataTCPFastOpenStats"));

      v47 = *(_QWORD *)(a1 + 224);
      if ((v47 & 0x80) != 0)
      {
        v48 = *(id *)(a1 + 248);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v48, CFSTR("_kCFNTimingDataTCPInfoAtStart"));

        v49 = *(id *)(a1 + 256);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v49, CFSTR("_kCFNTimingDataTCPInfoAtStop"));

        v47 = *(_QWORD *)(a1 + 224);
      }
      if ((v47 & 2) != 0)
      {
        v50 = *(id *)(a1 + 248);
        +[__CFN_TransactionMetrics nstatCountsFromTCPInfo:]((uint64_t)__CFN_TransactionMetrics, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v51, CFSTR("_kCFNTimingDataConnectionStartTimeCounts"));

        v52 = *(id *)(a1 + 256);
        +[__CFN_TransactionMetrics nstatCountsFromTCPInfo:]((uint64_t)__CFN_TransactionMetrics, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v53, CFSTR("_kCFNTimingDataConnectionStopTimeCounts"));

        v47 = *(_QWORD *)(a1 + 224);
      }
      if ((v47 & 0x20) != 0)
      {
        v54 = *(id *)(a1 + 264);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v54, CFSTR("_kCFNTimingDataSubflowCountsAtStart"));

        v55 = *(id *)(a1 + 272);
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v55, CFSTR("_kCFNTimingDataSubflowCountsAtStop"));

      }
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)requestBody:(uint64_t)a1
{
  NSObject *v3;
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  NSObject *v11;

  v3 = a2;
  if (a1)
  {
    v8 = v3;
    *(_QWORD *)(a1 + 104) += dispatch_data_get_size(v3);
    v4 = *(_DWORD *)(a1 + 16);
    v5 = *(id *)(a1 + 48);
    v6 = v8;
    if (HARLoggingEnabled(v4) && HARBodySizeLimit)
    {
      v7 = HARQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __logHARRequestBody_block_invoke;
      block[3] = &unk_1E14FDE88;
      v10 = v5;
      v11 = v6;
      dispatch_async(v7, block);

    }
    v3 = v8;
  }

}

- (void)responseHeaderEnd:(uint64_t)a1
{
  id v4;
  int v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v4 = a2;
  if (a1 && v4)
  {
    v9 = v4;
    objc_storeStrong((id *)(a1 + 80), a2);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a1 + 120);
    v5 = *(_DWORD *)(a1 + 16);
    v6 = *(id *)(a1 + 48);
    v7 = v9;
    if (HARLoggingEnabled(v5))
    {
      if (HARBodySizeLimit)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v7, "statusCode") != 304)
        {
          v8 = HARQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __clearCachedHARResponseBody_block_invoke;
          block[3] = &unk_1E14FE118;
          v11 = v6;
          dispatch_async(v8, block);

        }
      }
    }

    v4 = v9;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subflowCountsEnd, 0);
  objc_storeStrong((id *)&self->_subflowCountsBegin, 0);
  objc_storeStrong((id *)&self->_tcpInfoEnd, 0);
  objc_storeStrong((id *)&self->_tcpInfoBegin, 0);
  objc_storeStrong((id *)&self->_dataTransferReport, 0);
  objc_storeStrong((id *)&self->_connectionMetrics, 0);
  objc_storeStrong((id *)&self->_lastResponse, 0);
  objc_storeStrong((id *)&self->_cachedResponse, 0);
  objc_storeStrong((id *)&self->_transferredRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_request, CFSTR("request"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transferredRequest, CFSTR("transferredRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cachedResponse, CFSTR("cachedResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastResponse, CFSTR("lastResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_connectionMetrics, CFSTR("connectionMetrics"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_scheduledOriginLoad, CFSTR("scheduledOriginLoad"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_firstOnConnection, CFSTR("firstOnConnection"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_requestHeaderSize, CFSTR("requestHeaderSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_requestBodySize, CFSTR("requestBodySize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_requestBodyTransferSize, CFSTR("requestBodyTransferSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_responseHeaderSize, CFSTR("responseHeaderSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_responseBodySize, CFSTR("responseBodySize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_responseBodyTransferSize, CFSTR("responseBodyTransferSize"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("beginTime"), self->_beginTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("endTime"), self->_endTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("cacheLookupBeginTime"), self->_cacheLookupBeginTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("cacheLookupEndTime"), self->_cacheLookupEndTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("requestBeginTime"), self->_requestBeginTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("requestEndTime"), self->_requestEndTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("responseBeginTime"), self->_responseBeginTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("responseEndTime"), self->_responseEndTime);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_endReason, CFSTR("endReason"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pushed, CFSTR("pushed"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_schedulingTier, CFSTR("schedulingTier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_APSRelayAttempted, CFSTR("APSRelayAttempted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_APSRelaySucceeded, CFSTR("APSRelaySucceeded"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_options, CFSTR("options"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("reusedAfterTime"), self->_reusedAfterTime);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_dataTransferReport)
  {
    v4 = (void *)nw_data_transfer_report_copy_dictionary();
    objc_msgSend(v5, "encodeXPCObject:forKey:", v4, CFSTR("dataTransferReport"));

  }
}

- (__CFN_TransactionMetrics)initWithCoder:(id)a3
{
  id v4;
  __CFN_TransactionMetrics *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  NSURLRequest *request;
  uint64_t v10;
  NSURLRequest *transferredRequest;
  uint64_t v12;
  NSURLResponse *cachedResponse;
  uint64_t v14;
  NSURLResponse *lastResponse;
  uint64_t v16;
  __CFN_ConnectionMetrics *connectionMetrics;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  OS_nw_data_transfer_report *dataTransferReport;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)__CFN_TransactionMetrics;
  v5 = -[__CFN_TransactionMetrics init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
    v8 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (NSURLRequest *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferredRequest"));
    v10 = objc_claimAutoreleasedReturnValue();
    transferredRequest = v5->_transferredRequest;
    v5->_transferredRequest = (NSURLRequest *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cachedResponse"));
    v12 = objc_claimAutoreleasedReturnValue();
    cachedResponse = v5->_cachedResponse;
    v5->_cachedResponse = (NSURLResponse *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastResponse"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastResponse = v5->_lastResponse;
    v5->_lastResponse = (NSURLResponse *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectionMetrics"));
    v16 = objc_claimAutoreleasedReturnValue();
    connectionMetrics = v5->_connectionMetrics;
    v5->_connectionMetrics = (__CFN_ConnectionMetrics *)v16;

    v5->_scheduledOriginLoad = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("scheduledOriginLoad"));
    v5->_firstOnConnection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("firstOnConnection"));
    v5->_requestHeaderSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestHeaderSize"));
    v5->_requestBodySize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestBodySize"));
    v5->_requestBodyTransferSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestBodyTransferSize"));
    v5->_responseHeaderSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("responseHeaderSize"));
    v5->_responseBodySize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("responseBodySize"));
    v5->_responseBodyTransferSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("responseBodyTransferSize"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("beginTime"));
    v5->_beginTime = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("endTime"));
    v5->_endTime = v19;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cacheLookupBeginTime"));
    v5->_cacheLookupBeginTime = v20;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cacheLookupEndTime"));
    v5->_cacheLookupEndTime = v21;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("requestBeginTime"));
    v5->_requestBeginTime = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("requestEndTime"));
    v5->_requestEndTime = v23;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("responseBeginTime"));
    v5->_responseBeginTime = v24;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("responseEndTime"));
    v5->_responseEndTime = v25;
    v5->_endReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("endReason"));
    v5->_pushed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pushed"));
    v5->_schedulingTier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("schedulingTier"));
    v5->_APSRelayAttempted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("APSRelayAttempted"));
    v5->_APSRelaySucceeded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("APSRelaySucceeded"));
    v5->_options = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("options"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_reusedAfterTime"));
    v5->_reusedAfterTime = v26;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("dataTransferReport"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = nw_data_transfer_report_create_from_dictionary();
        dataTransferReport = v5->_dataTransferReport;
        v5->_dataTransferReport = (OS_nw_data_transfer_report *)v28;

      }
    }
  }

  return v5;
}

- (int64_t)_daemon_responseHeaderSize
{
  return self->_responseHeaderSize;
}

- (int64_t)_daemon_responseBodyTransferSize
{
  return self->_responseBodyTransferSize;
}

- (int64_t)_daemon_requestHeaderSize
{
  return self->_requestHeaderSize;
}

- (int64_t)_daemon_requestBodyTransferSize
{
  return self->_requestBodyTransferSize;
}

- (__CFN_ConnectionMetrics)_daemon_connectionMetrics
{
  if (self)
    self = (__CFN_TransactionMetrics *)objc_getProperty(self, a2, 88, 1);
  return (__CFN_ConnectionMetrics *)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
