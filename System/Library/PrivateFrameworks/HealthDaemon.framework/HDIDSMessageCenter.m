@implementation HDIDSMessageCenter

- (id)nanoSyncDevices
{
  void *v2;
  void *v3;

  -[HDIDSMessageCenter idsService](self, "idsService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (IDSService)idsService
{
  return self->_service;
}

- (void)sendRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  id v13;
  SEL v14;

  v5 = a3;
  objc_msgSend(v5, "toParticipant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request.toParticipant != nil"));

  }
  objc_msgSend(v5, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 320, CFSTR("You cannot call sendRequest twice for the same request object"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__HDIDSMessageCenter_sendRequest___block_invoke;
  block[3] = &unk_1E6CE9C58;
  v13 = v5;
  v14 = a2;
  block[4] = self;
  v9 = v5;
  dispatch_async(queue, block);

}

void __34__HDIDSMessageCenter_sendRequest___block_invoke(uint64_t a1)
{
  unsigned __int8 v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
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
  id v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HDIDSMessagePersistentContext *v44;
  unsigned __int16 v45;
  const char *v46;
  SEL v47;
  void *v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  id WeakRetained;
  char v54;
  id v55;
  double Current;
  double v57;
  double v58;
  double v59;
  _QWORD *v60;
  void *v61;
  int v62;
  void *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  NSObject *log;
  __int128 v70;
  id newValue;
  id v72;
  id v73;
  __int16 v74;
  char v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  int v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  id v89;
  uint64_t v90;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104));
  if ((v1 & 1) != 0)
    return;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = *(const char **)(a1 + 48);
    v67 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", v66, v67, CFSTR("HDIDSMessageCenter.m"), 326, CFSTR("Cannot use %@ until -resume is used"), v68);

  }
  v74 = objc_msgSend(*(id *)(a1 + 40), "messageID");
  v75 = objc_msgSend(*(id *)(a1 + 40), "priority");
  v3 = (void *)MEMORY[0x1E0C99DF0];
  objc_msgSend(*(id *)(a1 + 40), "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithCapacity:", objc_msgSend(v4, "length") + 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendBytes:length:", &v74, 3);
  objc_msgSend(*(id *)(a1 + 40), "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v8);

  }
  v9 = objc_msgSend(*(id *)(a1 + 40), "priority");
  if (v9 > 2)
    v10 = 200;
  else
    v10 = qword_1B7F55FC8[v9];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sendTimeout");
  if (v12 > 0.0)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "sendTimeout");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D341C8]);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "doNotCompress"))
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D34140]);
  if (objc_msgSend(*(id *)(a1 + 40), "forceLocalDelivery"))
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34168]);
  if (objc_msgSend(*(id *)(a1 + 40), "queueOnly1"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%hu"), objc_msgSend(*(id *)(a1 + 40), "messageID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D341A8]);

  }
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v20);
  *(_QWORD *)&v70 = objc_claimAutoreleasedReturnValue();

  *((_QWORD *)&v70 + 1) = v18;
  if (v18)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34158]);
  if (objc_msgSend(*(id *)(a1 + 40), "nonWaking"))
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34190]);
  objc_msgSend(*(id *)(a1 + 40), "toParticipant");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "destinationIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "toParticipant");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "deviceIdentifier");
  newValue = (id)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v24 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    v73 = 0;
    LOBYTE(v24) = objc_msgSend(v24, "sendData:toDestinations:priority:options:identifier:error:", v5, v25, v10, v11, &v73, &v72);
    v26 = v73;
    v27 = v72;

    if ((v24 & 1) != 0)
    {
      v28 = v5;
      _HKInitializeLogging();
      v29 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(_QWORD **)(a1 + 32);
        v31 = v29;
        -[HDIDSMessageCenter _logPrefix](v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v30) = objc_msgSend(*(id *)(a1 + 40), "messageID");
        HDStringFromHDIDSPriority(objc_msgSend(*(id *)(a1 + 40), "priority"));
        v33 = v27;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v28, "length");
        *(_DWORD *)buf = 138544642;
        v77 = v32;
        v78 = 2114;
        v79 = v26;
        v80 = 1024;
        v81 = (int)v30;
        v82 = 2114;
        v83 = v34;
        v84 = 2114;
        v85 = v22;
        v86 = 2048;
        v87 = v35;
        _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ outgoing request %{public}@ messageID:%u pri:%{public}@ to %{public}@ (%tu bytes)", buf, 0x3Au);

        v27 = v33;
      }
      v36 = 1;
      goto LABEL_30;
    }
  }
  else
  {
    v37 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "toParticipant");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "description");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("missing destination device identifer for %@"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v90 = *MEMORY[0x1E0CB2D50];
    v91[0] = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HDIDSErrorDomain"), 3, v41);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    v26 = 0;
  }
  _HKInitializeLogging();
  v42 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v60 = *(_QWORD **)(a1 + 32);
    log = v42;
    -[HDIDSMessageCenter _logPrefix](v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(*(id *)(a1 + 40), "messageID");
    HDStringFromHDIDSPriority(objc_msgSend(*(id *)(a1 + 40), "priority"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v5;
    v64 = objc_msgSend(v5, "length");
    *(_DWORD *)buf = 138544898;
    v77 = v61;
    v78 = 2114;
    v79 = v26;
    v80 = 1024;
    v81 = v62;
    v82 = 2114;
    v83 = v63;
    v84 = 2114;
    v85 = v22;
    v86 = 2048;
    v87 = v64;
    v88 = 2114;
    v89 = v27;
    _os_log_error_impl(&dword_1B7802000, log, OS_LOG_TYPE_ERROR, "%{public}@ outgoing request %{public}@ messageID:%u pri:%{public}@ to %{public}@ (%tu bytes) error: %{public}@", buf, 0x44u);

  }
  else
  {
    v28 = v5;
  }
  v36 = 0;
LABEL_30:
  v43 = v27;
  v44 = objc_alloc_init(HDIDSMessagePersistentContext);
  v45 = objc_msgSend(*(id *)(a1 + 40), "messageID");
  if (v44)
  {
    v44->_messageID = v45;
    objc_setProperty_nonatomic_copy(v44, v46, v26, 16);
    objc_setProperty_nonatomic_copy(v44, v47, newValue, 24);
    objc_msgSend(*(id *)(a1 + 40), "persistentUserInfo");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v44->_userInfo, v48);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v44->_date, v49);

    v44->_fromRequest = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "persistentUserInfo");

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  }
  v50 = *(_QWORD *)(a1 + 40);
  if (v50)
  {
    objc_storeWeak((id *)(v50 + 72), *(id *)(a1 + 32));
    v52 = *(void **)(a1 + 40);
    if (v52)
      objc_setProperty_nonatomic_copy(v52, v51, v26, 32);
  }
  if (v26)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    v54 = objc_opt_respondsToSelector();

    if ((v54 & 1) != 0)
    {
      v55 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
      objc_msgSend(v55, "messageCenter:didResolveIDSIdentifierForRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "didSendRequest:deviceID:type:length:", v26, newValue, objc_msgSend(*(id *)(a1 + 40), "messageID"), objc_msgSend(v28, "length"));
    if ((v36 & 1) != 0)
    {
      if (v70 != 0)
      {
        Current = CFAbsoluteTimeGetCurrent();
        objc_msgSend(*(id *)(a1 + 40), "responseTimeout");
        if (v57 <= 0.0)
          v58 = 3600.0;
        else
          objc_msgSend(*(id *)(a1 + 40), "responseTimeout");
        v59 = Current + v58;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKey:expires:", v44, v26, v59);
        -[HDIDSMessageCenter _updateExpireTimerWithTimestamp:](*(_QWORD *)(a1 + 32), v59);
      }
    }
    else
    {
      -[HDIDSMessageCenter _handleError:context:](*(_QWORD *)(a1 + 32), v43, v44);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "didReceiveError:forMessageID:", v43, v26);
    }
  }
  else if ((v36 & 1) == 0)
  {
    -[HDIDSMessageCenter _handleError:context:](*(_QWORD *)(a1 + 32), v43, v44);
  }

}

- (_QWORD)_logPrefix
{
  _QWORD *v1;
  void *v2;
  objc_class *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@: \"%@\"), v4, v1[3]);
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)_updateExpireTimerWithTimestamp:(uint64_t)a1
{
  double v4;
  double v6;
  double v7;
  NSObject *v8;
  BOOL v9;
  double v10;
  dispatch_time_t v11;

  if (a1)
  {
    v4 = *(double *)(a1 + 88);
    if (v4 == 0.0 || v4 > a2)
    {
      v6 = a2 - CFAbsoluteTimeGetCurrent();
      v7 = v6 * 1000000000.0;
      v8 = *(NSObject **)(a1 + 96);
      v9 = v6 < 0.0;
      v10 = 0.0;
      if (!v9)
        v10 = v7;
      v11 = dispatch_time(0, (uint64_t)v10);
      dispatch_source_set_timer(v8, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      *(double *)(a1 + 88) = a2;
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10;
  unsigned __int8 v11;
  uint64_t v12;
  _QWORD *v13;
  NSMutableDictionary *responseHandlers;
  void *v15;
  void *v16;
  id v17;

  v17 = a5;
  v10 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v11 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v11 & 1) == 0)
  {
    -[HDIDSPersistentDictionary objectForKey:](self->_persistentContextStore, "objectForKey:", v17);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (_QWORD *)v12;
    if (v12)
    {
      if (a6)
      {
        if (!*(_BYTE *)(v12 + 8)
          || (responseHandlers = self->_responseHandlers,
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(v12 + 10)),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              -[NSMutableDictionary objectForKey:](responseHandlers, "objectForKey:", v15),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v16,
              v15,
              !v16))
        {
          -[HDIDSPersistentDictionary removeObjectForKey:](self->_persistentContextStore, "removeObjectForKey:", v17);
        }
        -[HDIDSPersistentDictionary didFinishSending:](self->_persistentContextStore, "didFinishSending:", v13[2]);
      }
      else
      {
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HDIDSErrorDomain"), 3, 0);
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        -[HDIDSPersistentDictionary didReceiveError:forMessageID:](self->_persistentContextStore, "didReceiveError:forMessageID:", v10, v13[2]);
        -[HDIDSMessageCenter _handleError:context:]((uint64_t)self, v10, v13);
      }
    }

  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *queue;
  IDSService *v16;
  IDSService *service;
  void *v18;
  HDIDSParticipant *v19;
  HDIDSParticipant *v20;
  HDIDSParticipant *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  HDIDSPersistentDictionary *persistentContextStore;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  HDIDSPersistentDictionary *v37;
  void *v38;
  id v39;
  uint64_t v40;
  HDIDSPersistentDictionary *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSMutableDictionary *responseHandlers;
  void *v47;
  void *v48;
  void *v49;
  HDIDSIncomingResponse *v50;
  HDIDSIncomingResponse *v51;
  id *v52;
  uint64_t v53;
  void *v54;
  objc_class *v55;
  void *v56;
  id v57;
  void *v58;
  const char *v59;
  void *v60;
  SEL v61;
  void *v62;
  id WeakRetained;
  id v64;
  unsigned __int16 *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  HDIDSPersistentDictionary *v71;
  void *v72;
  HDIDSIncomingRequest *v73;
  HDIDSIncomingRequest *v74;
  void *v75;
  void *v76;
  void *v77;
  const char *v78;
  void *v79;
  void *response;
  HDIDSOutgoingResponse *v81;
  HDIDSOutgoingResponse *v82;
  SEL v83;
  id v84;
  NSMutableDictionary *requestHandlers;
  void *v86;
  id *v87;
  void *v88;
  id v89;
  void *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  char v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  int v108;
  void *v109;
  NSObject *v110;
  void *v111;
  uint64_t v112;
  NSObject *v113;
  void *v114;
  NSObject *v115;
  void *v116;
  void *v117;
  NSObject *log;
  void *v119;
  unsigned int v120;
  unsigned int v121;
  void *v122;
  void *v123;
  HDIDSParticipant *v124;
  HDIDSParticipant *v125;
  uint64_t v126;
  unint64_t v127;
  id *v128;
  id obj;
  HDIDSIncomingRequest *obja;
  void *v131;
  void *v132;
  SEL aSelector;
  uint8_t buf[4];
  void *v135;
  __int16 v136;
  _BYTE v137[24];
  __int16 v138;
  id v139;
  __int16 v140;
  uint64_t v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  queue = self->_queue;
  v16 = (IDSService *)a3;
  dispatch_assert_queue_V2(queue);
  service = self->_service;

  if (service == v16)
  {
    -[HDIDSMessageCenter deviceForFromID:](self, "deviceForFromID:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = [HDIDSParticipant alloc];
    if (v18)
      v20 = -[HDIDSParticipant initWithDevice:](v19, "initWithDevice:", v18);
    else
      v20 = -[HDIDSParticipant initWithIdentifier:](v19, "initWithIdentifier:", v13);
    v21 = v20;
    -[HDIDSParticipant deviceIdentifier](v20, "deviceIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "incomingResponseIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v12, "length");
    if (v23)
    {
      if (v24 >= 2)
      {
        v25 = v12;
        v26 = v18;
        v131 = v22;
        v124 = v21;
        v119 = v25;
        v27 = objc_retainAutorelease(v25);
        v120 = *(unsigned __int16 *)objc_msgSend(v27, "bytes");
        objc_msgSend(v27, "subdataWithRange:", 2, objc_msgSend(v27, "length") - 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        persistentContextStore = self->_persistentContextStore;
        objc_msgSend(v14, "incomingResponseIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDIDSPersistentDictionary objectForKey:](persistentContextStore, "objectForKey:", v30);
        v31 = objc_claimAutoreleasedReturnValue();

        _HKInitializeLogging();
        v32 = (id)*MEMORY[0x1E0CB5370];
        v126 = v31;
        obj = v28;
        v122 = v26;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          -[HDIDSMessageCenter _logPrefix](self);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "incomingResponseIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            v35 = *(void **)(v31 + 16);
          else
            v35 = 0;
          v36 = v35;
          *(_DWORD *)buf = 138544642;
          v135 = v33;
          v136 = 2114;
          *(_QWORD *)v137 = v34;
          *(_WORD *)&v137[8] = 2114;
          *(_QWORD *)&v137[10] = v35;
          *(_WORD *)&v137[18] = 1024;
          *(_DWORD *)&v137[20] = v120;
          v138 = 2114;
          v139 = v13;
          v140 = 2048;
          v141 = objc_msgSend(v27, "length");
          _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ incoming response %{public}@ to request %{public}@ messageID:%u from %{public}@ (%tu bytes)", buf, 0x3Au);

          v31 = v126;
          v28 = obj;
        }

        if (v31)
        {
          v37 = self->_persistentContextStore;
          objc_msgSend(v14, "outgoingResponseIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = *(id *)(v126 + 16);
          v40 = objc_msgSend(v27, "length");
          v22 = v131;
          -[HDIDSPersistentDictionary didReceiveResponse:toRequest:deviceID:type:length:](v37, "didReceiveResponse:toRequest:deviceID:type:length:", v38, v39, v131, v120, v40);

          v41 = self->_persistentContextStore;
          objc_msgSend(v14, "incomingResponseIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDIDSPersistentDictionary removeObjectForKey:](v41, "removeObjectForKey:", v42);

          v21 = v124;
          v43 = v126;
          if (*(unsigned __int16 *)(v126 + 10) != v120)
          {
            _HKInitializeLogging();
            v44 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              v106 = v44;
              -[HDIDSMessageCenter _logPrefix](self);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = *(unsigned __int16 *)(v126 + 10);
              objc_msgSend(v14, "incomingResponseIdentifier");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v135 = v107;
              v136 = 1024;
              *(_DWORD *)v137 = v120;
              *(_WORD *)&v137[4] = 1024;
              *(_DWORD *)&v137[6] = v108;
              *(_WORD *)&v137[10] = 2114;
              *(_QWORD *)&v137[12] = v109;
              _os_log_error_impl(&dword_1B7802000, v106, OS_LOG_TYPE_ERROR, "%{public}@ unexpected message ID (%u != %u) for message %{public}@", buf, 0x22u);

              v22 = v131;
              v43 = v126;

            }
          }
          v12 = v119;
          if (!*(_BYTE *)(v43 + 8))
          {
            _HKInitializeLogging();
            v45 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              v110 = v45;
              -[HDIDSMessageCenter _logPrefix](self);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = *(_QWORD *)(v126 + 16);
              *(_DWORD *)buf = 138543618;
              v135 = v111;
              v136 = 2114;
              *(_QWORD *)v137 = v112;
              _os_log_error_impl(&dword_1B7802000, v110, OS_LOG_TYPE_ERROR, "%{public}@ unexpected response %{public}@", buf, 0x16u);

              v43 = v126;
            }
          }
          responseHandlers = self->_responseHandlers;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(v43 + 10));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](responseHandlers, "objectForKey:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v122;
          if (v48)
          {
            aSelector = 0;
            v49 = v48;
            objc_msgSend(v48, "getValue:", &aSelector);
            v50 = objc_alloc_init(HDIDSIncomingResponse);
            v51 = v50;
            v52 = (id *)v126;
            if (v50)
            {
              objc_storeWeak((id *)&v50->_messageCenter, self);
              objc_storeStrong((id *)&v51->_fromParticipant, v124);
              v51->_messageID = *(_WORD *)(v126 + 10);
              objc_storeStrong((id *)&v51->_data, obj);
            }
            -[HDIDSMessageCenter _pbMappingForMessageID:]((uint64_t)self, *(unsigned __int16 *)(v126 + 10));
            v53 = objc_claimAutoreleasedReturnValue();
            v54 = (void *)v53;
            if (v53)
            {
              v55 = *(objc_class **)(v53 + 16);
              if (v55)
              {
                v56 = (void *)objc_msgSend([v55 alloc], "initWithData:", obj);
                v57 = v56;
                if (v51)
                  objc_storeStrong((id *)&v51->_pbResponse, v56);

                v52 = (id *)v126;
              }
            }
            objc_msgSend(v14, "outgoingResponseIdentifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = v58;
            if (v51)
            {
              objc_setProperty_nonatomic_copy(v51, v59, v58, 32);

              objc_setProperty_nonatomic_copy(v51, v61, v52[2], 40);
              objc_storeStrong((id *)&v51->_requestSent, v52[5]);
              objc_storeStrong((id *)&v51->_requestPersistentUserInfo, v52[4]);
            }
            else
            {

            }
            _HKInitializeLogging();
            v62 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
            {
              log = v62;
              -[HDIDSMessageCenter _logPrefix](self);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "outgoingResponseIdentifier");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v135 = v117;
              v136 = 2112;
              *(_QWORD *)v137 = v99;
              *(_WORD *)&v137[8] = 1024;
              *(_DWORD *)&v137[10] = v120;
              *(_WORD *)&v137[14] = 2112;
              *(_QWORD *)&v137[16] = v100;
              _os_log_debug_impl(&dword_1B7802000, log, OS_LOG_TYPE_DEBUG, "%@ dispatching incoming response %@ with message id %u to '%@'", buf, 0x26u);

              v18 = v122;
              v52 = (id *)v126;

            }
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(WeakRetained, "performSelector:withObject:", aSelector, v51);

            v21 = v124;
            v22 = v131;
          }
          else
          {
            v49 = 0;
            _HKInitializeLogging();
            v94 = (void *)*MEMORY[0x1E0CB5370];
            v52 = (id *)v126;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              v113 = v94;
              -[HDIDSMessageCenter _logPrefix](self);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v135 = v114;
              v136 = 1024;
              *(_DWORD *)v137 = v120;
              _os_log_error_impl(&dword_1B7802000, v113, OS_LOG_TYPE_ERROR, "%{public}@ no registered response handler for message: %hu", buf, 0x12u);

              v52 = (id *)v126;
            }
          }

          v28 = obj;
        }
        else
        {
          _HKInitializeLogging();
          v90 = (void *)*MEMORY[0x1E0CB5370];
          v21 = v124;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v91 = v90;
            -[HDIDSMessageCenter _logPrefix](self);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "incomingResponseIdentifier");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v135 = v92;
            v136 = 1024;
            *(_DWORD *)v137 = v120;
            *(_WORD *)&v137[4] = 2114;
            *(_QWORD *)&v137[6] = v93;
            _os_log_impl(&dword_1B7802000, v91, OS_LOG_TYPE_DEFAULT, "%{public}@ could not find context for message: %hu identifier %{public}@", buf, 0x1Cu);

          }
          v52 = 0;
          v22 = v131;
          v18 = v26;
          v12 = v119;
        }
LABEL_55:

      }
    }
    else if (v24 >= 3)
    {
      v132 = v22;
      v64 = objc_retainAutorelease(v12);
      v65 = (unsigned __int16 *)objc_msgSend(v64, "bytes");
      v121 = *v65;
      v127 = *((unsigned __int8 *)v65 + 2);
      _HKInitializeLogging();
      v66 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v67 = v66;
        -[HDIDSMessageCenter _logPrefix](self);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "outgoingResponseIdentifier");
        v123 = v18;
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        HDStringFromHDIDSPriority(v127);
        v125 = v21;
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v135 = v68;
        v136 = 2114;
        *(_QWORD *)v137 = v69;
        *(_WORD *)&v137[8] = 1024;
        *(_DWORD *)&v137[10] = v121;
        *(_WORD *)&v137[14] = 2114;
        *(_QWORD *)&v137[16] = v70;
        v138 = 2114;
        v139 = v13;
        v140 = 2048;
        v141 = objc_msgSend(v64, "length");
        _os_log_impl(&dword_1B7802000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@ incoming request %{public}@ messageID:%u pri:%{public}@ from %{public}@ (%tu bytes)", buf, 0x3Au);

        v18 = v123;
        v21 = v125;

      }
      v71 = self->_persistentContextStore;
      objc_msgSend(v14, "outgoingResponseIdentifier");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDIDSPersistentDictionary didReceiveRequest:deviceID:type:length:](v71, "didReceiveRequest:deviceID:type:length:", v72, v132, v121, objc_msgSend(v64, "length"));

      v73 = objc_alloc_init(HDIDSIncomingRequest);
      v74 = v73;
      if (v73)
      {
        objc_storeWeak((id *)&v73->_messageCenter, self);
        objc_storeStrong((id *)&v74->_fromParticipant, v21);
        v74->_messageID = v121;
      }
      obja = v74;
      if (objc_msgSend(v14, "expectsPeerResponse"))
      {
        objc_msgSend(v14, "outgoingResponseIdentifier");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v75)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 684, CFSTR("*** IDS BUG! idsContext must have an outgoingResponseIdentifier or expectsPeerResponse must be false."));

        }
      }
      objc_msgSend(v14, "outgoingResponseIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v77;
      v28 = obja;
      if (obja)
      {
        objc_setProperty_nonatomic_copy(obja, v78, v77, 32);

        obja->_priority = v127;
        obja->_expectsResponse = objc_msgSend(v14, "expectsPeerResponse");
      }
      else
      {

        objc_msgSend(v14, "expectsPeerResponse");
      }
      objc_msgSend(v64, "subdataWithRange:", 3, objc_msgSend(v64, "length") - 3);
      response = (void *)objc_claimAutoreleasedReturnValue();
      if (obja)
      {
        objc_storeStrong((id *)&obja->_data, response);

        v81 = objc_alloc_init(HDIDSOutgoingResponse);
        v82 = v81;
        v22 = v132;
        if (v81)
        {
          v81->_messageID = obja->_messageID;
          -[HDIDSOutgoingResponse setPriority:](v81, "setPriority:", obja->_priority);
          objc_storeStrong((id *)&v82->_toParticipant, obja->_fromParticipant);
          objc_setProperty_nonatomic_copy(v82, v83, obja->_idsIdentifier, 48);
          v84 = objc_loadWeakRetained((id *)&obja->_messageCenter);
          objc_storeStrong((id *)&v82->_messageCenter, v84);

          v82->_requestMessageID = obja->_messageID;
        }
        else
        {
          objc_msgSend(0, "setPriority:", obja->_priority);

        }
        response = obja->_response;
        obja->_response = v82;
      }
      else
      {
        v22 = v132;
      }

      requestHandlers = self->_requestHandlers;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v121);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](requestHandlers, "objectForKeyedSubscript:", v86);
      v87 = (id *)objc_claimAutoreleasedReturnValue();

      if (v87)
      {
        v52 = v87;
        aSelector = 0;
        objc_msgSend(v87, "getValue:", &aSelector);
        _HKInitializeLogging();
        v88 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
        {
          v101 = v88;
          -[HDIDSMessageCenter _logPrefix](self);
          v128 = v52;
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "outgoingResponseIdentifier");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v104 = v18;
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v135 = v102;
          v136 = 2112;
          *(_QWORD *)v137 = v103;
          *(_WORD *)&v137[8] = 1024;
          *(_DWORD *)&v137[10] = v121;
          *(_WORD *)&v137[14] = 2112;
          *(_QWORD *)&v137[16] = v105;
          _os_log_debug_impl(&dword_1B7802000, v101, OS_LOG_TYPE_DEBUG, "%@ dispatching incoming request %@ with message id %u to '%@'", buf, 0x26u);

          v22 = v132;
          v18 = v104;
          v28 = obja;

          v52 = v128;
        }
        v89 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v89, "performSelector:withObject:", aSelector, v28);

      }
      else
      {
        v95 = objc_loadWeakRetained((id *)&self->_delegate);
        v96 = objc_opt_respondsToSelector();

        if ((v96 & 1) != 0)
        {
          v97 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v97, "messageCenter:didReceiveUnknownRequest:", self, obja);

          v52 = 0;
          v22 = v132;
        }
        else
        {
          if (obja)
            obja->_expectsResponse = 0;
          _HKInitializeLogging();
          v98 = (void *)*MEMORY[0x1E0CB5370];
          v22 = v132;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v115 = v98;
            -[HDIDSMessageCenter _logPrefix](self);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v135 = v116;
            v136 = 1024;
            *(_DWORD *)v137 = v121;
            _os_log_error_impl(&dword_1B7802000, v115, OS_LOG_TYPE_ERROR, "%{public}@ received a message of type %u for which no request handler was registered.", buf, 0x12u);

          }
          v52 = 0;
        }
      }
      goto LABEL_55;
    }

  }
}

- (id)deviceForFromID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HDIDSMessageCenter idsService](self, "idsService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceForFromID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[HDIDSMessageCenter idsService](self, "idsService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "linkedDeviceForFromID:withRelationship:", v4, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_pbMappingForMessageID:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void __36__HDIDSMessageCenter__sendResponse___block_invoke(uint64_t a1)
{
  unsigned __int8 v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  id v25;
  void *v26;
  const char *v27;
  _QWORD *v28;
  NSObject *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HDIDSMessagePersistentContext *v43;
  const char *v44;
  HDIDSMessagePersistentContext *v45;
  NSObject *v46;
  SEL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id WeakRetained;
  char v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  _QWORD *v66;
  void *v67;
  int v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  os_log_t loga;
  os_log_t log;
  NSObject *logb;
  void *v80;
  void *v81;
  id v82;
  id v83;
  __int16 v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  id v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  int v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  id v100;
  uint64_t v101;
  _QWORD v102[3];

  v102[1] = *MEMORY[0x1E0C80C00];
  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104));
  if ((v1 & 1) == 0)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = *(const char **)(a1 + 56);
      v75 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", v74, v75, CFSTR("HDIDSMessageCenter.m"), 435, CFSTR("Cannot use %@ until -resume is used"), v76);

    }
    v84 = *(_WORD *)(a1 + 64);
    v3 = (void *)MEMORY[0x1E0C99DF0];
    objc_msgSend(*(id *)(a1 + 40), "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataWithCapacity:", objc_msgSend(v4, "length") + 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "appendBytes:length:", &v84, 2);
    objc_msgSend(*(id *)(a1 + 40), "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendData:", v8);

    }
    v9 = objc_msgSend(*(id *)(a1 + 40), "priority");
    if (v9 > 2)
      v10 = 200;
    else
      v10 = qword_1B7F55FC8[v9];
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sendTimeout");
    if (v12 > 0.0)
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 40), "sendTimeout");
      objc_msgSend(v13, "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D341C8]);

    }
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *MEMORY[0x1E0D34198]);
    if (objc_msgSend(*(id *)(a1 + 40), "doNotCompress"))
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D34140]);
    if (objc_msgSend(*(id *)(a1 + 40), "forceLocalDelivery"))
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34168]);
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 64));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v16);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "toParticipant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "destinationIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "toParticipant");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deviceIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();

    v81 = v5;
    if (v18)
    {
      v21 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0;
      v83 = 0;
      v23 = objc_msgSend(v21, "sendData:toDestinations:priority:options:identifier:error:", v5, v22, v10, v11, &v83, &v82);
      v24 = v83;
      v25 = v82;

      if ((v23 & 1) != 0)
      {
        _HKInitializeLogging();
        v26 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(_QWORD **)(a1 + 32);
          v29 = v26;
          -[HDIDSMessageCenter _logPrefix](v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = *(unsigned __int16 *)(a1 + 64);
          v32 = v11;
          v33 = v18;
          v34 = v25;
          v35 = *(_QWORD *)(a1 + 48);
          HDStringFromHDIDSPriority(objc_msgSend(*(id *)(a1 + 40), "priority"));
          loga = v20;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v81, "length");
          *(_DWORD *)buf = 138544898;
          v86 = v30;
          v87 = 2114;
          v88 = v24;
          v89 = 2114;
          v90 = v35;
          v25 = v34;
          v18 = v33;
          v11 = v32;
          v91 = 1024;
          v92 = v31;
          v93 = 2114;
          v94 = v36;
          v95 = 2114;
          v96 = v18;
          v97 = 2048;
          v98 = v37;
          _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ outgoing response %{public}@ to request %{public}@ messageID:%u pri:%{public}@ to %{public}@ (%tu bytes)", buf, 0x44u);

          v20 = loga;
        }
        v38 = 1;
        goto LABEL_24;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing device identifer in request %@"), *(_QWORD *)(a1 + 48));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = *MEMORY[0x1E0CB2D50];
      v102[0] = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, &v101, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HDIDSErrorDomain"), 3, v40);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      v24 = 0;
    }
    _HKInitializeLogging();
    v41 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v66 = *(_QWORD **)(a1 + 32);
      logb = v41;
      -[HDIDSMessageCenter _logPrefix](v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = *(unsigned __int16 *)(a1 + 64);
      v69 = v20;
      v70 = *(_QWORD *)(a1 + 48);
      HDStringFromHDIDSPriority(objc_msgSend(*(id *)(a1 + 40), "priority"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v81, "length");
      *(_DWORD *)buf = 138545154;
      v86 = v67;
      v87 = 2114;
      v88 = v24;
      v89 = 2114;
      v90 = v70;
      v20 = v69;
      v91 = 1024;
      v92 = v68;
      v93 = 2114;
      v94 = v71;
      v95 = 2114;
      v96 = v18;
      v97 = 2048;
      v98 = v72;
      v99 = 2114;
      v100 = v25;
      _os_log_error_impl(&dword_1B7802000, logb, OS_LOG_TYPE_ERROR, "%{public}@ outgoing response %{public}@ to request %{public}@ messageID:%u pri:%{public}@ to %{public}@ (%tu bytes) error: %{public}@", buf, 0x4Eu);

    }
    v38 = 0;
LABEL_24:
    v42 = *(void **)(a1 + 40);
    if (v42)
      objc_setProperty_nonatomic_copy(v42, v27, v24, 48);
    v43 = objc_alloc_init(HDIDSMessagePersistentContext);
    v45 = v43;
    if (v43)
    {
      v43->_messageID = *(_WORD *)(a1 + 64);
      objc_setProperty_nonatomic_copy(v43, v44, v24, 16);
      v46 = v20;
      objc_setProperty_nonatomic_copy(v45, v47, v20, 24);
      objc_msgSend(*(id *)(a1 + 40), "persistentUserInfo");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v45->_userInfo, v48);

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v45->_date, v49);

      v45->_fromRequest = 0;
      if (v24)
      {
LABEL_28:
        log = v11;
        v50 = v18;
        v51 = v25;
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
        v53 = objc_opt_respondsToSelector();

        if ((v53 & 1) != 0)
        {
          v54 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
          objc_msgSend(v54, "messageCenter:didResolveIDSIdentifierForResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

        }
        v55 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
        v56 = *(_QWORD *)(a1 + 48);
        v57 = *(unsigned __int16 *)(a1 + 66);
        v58 = objc_msgSend(v81, "length");
        v59 = v55;
        v60 = v46;
        objc_msgSend(v59, "didSendResponse:toRequest:deviceID:type:length:", v24, v56, v46, v57, v58);
        if ((v38 & 1) != 0)
        {
          v61 = v81;
          v25 = v51;
          v18 = v50;
          v11 = log;
          if (v80)
          {
            objc_msgSend(*(id *)(a1 + 40), "sendTimeout");
            if (v62 <= 0.0)
            {
              v64 = 3600.0;
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 40), "sendTimeout");
              v64 = v63;
            }
            v65 = v64 + CFAbsoluteTimeGetCurrent();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKey:expires:", v45, v24, v65);
            -[HDIDSMessageCenter _updateExpireTimerWithTimestamp:](*(_QWORD *)(a1 + 32), v65);
          }
        }
        else
        {
          v25 = v51;
          -[HDIDSMessageCenter _handleError:context:](*(_QWORD *)(a1 + 32), v51, v45);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "didReceiveError:forMessageID:", v51, v24);
          v61 = v81;
          v18 = v50;
          v11 = log;
        }
LABEL_40:

        return;
      }
    }
    else
    {
      v46 = v20;
      objc_msgSend(*(id *)(a1 + 40), "persistentUserInfo");

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      if (v24)
        goto LABEL_28;
    }
    v60 = v46;
    v61 = v81;
    if ((v38 & 1) == 0)
      -[HDIDSMessageCenter _handleError:context:](*(_QWORD *)(a1 + 32), v25, v45);
    goto LABEL_40;
  }
}

+ (id)createPersistentDictionaryWithURL:(id)a3
{
  id v3;
  HDIDSPersistentDictionary *v4;

  v3 = a3;
  v4 = -[HDIDSPersistentDictionary initWithURL:objectClass:]([HDIDSPersistentDictionary alloc], "initWithURL:objectClass:", v3, objc_opt_class());

  return v4;
}

- (HDIDSMessageCenter)initWithIDSServiceIdentifier:(id)a3 persistentDictionary:(id)a4 queue:(id)a5 daemon:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HDIDSMessageCenter *v15;
  HDIDSMessageCenter *v16;
  uint64_t v17;
  NSString *serviceIdentifier;
  uint64_t v19;
  NSString *shortServiceIdentifier;
  NSMutableDictionary *v21;
  NSMutableDictionary *requestHandlers;
  NSMutableDictionary *v23;
  NSMutableDictionary *errorHandlers;
  NSMutableDictionary *v25;
  NSMutableDictionary *responseHandlers;
  NSMutableDictionary *v27;
  NSMutableDictionary *pbMapping;
  dispatch_source_t v29;
  OS_dispatch_source *expireTimer;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  _QWORD handler[4];
  id v37;
  id location;
  objc_super v39;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persistentDictionary != nil"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceIdentifier != nil"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue != NULL"));

LABEL_4:
  v39.receiver = self;
  v39.super_class = (Class)HDIDSMessageCenter;
  v15 = -[HDIDSMessageCenter init](&v39, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_daemon, v14);
    v17 = objc_msgSend(v11, "copy");
    serviceIdentifier = v16->_serviceIdentifier;
    v16->_serviceIdentifier = (NSString *)v17;

    -[NSString stringByReplacingOccurrencesOfString:withString:](v16->_serviceIdentifier, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple.private.alloy."), &stru_1E6D11BB8);
    v19 = objc_claimAutoreleasedReturnValue();
    shortServiceIdentifier = v16->_shortServiceIdentifier;
    v16->_shortServiceIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v16->_queue, a5);
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestHandlers = v16->_requestHandlers;
    v16->_requestHandlers = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    errorHandlers = v16->_errorHandlers;
    v16->_errorHandlers = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    responseHandlers = v16->_responseHandlers;
    v16->_responseHandlers = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pbMapping = v16->_pbMapping;
    v16->_pbMapping = v27;

    objc_storeStrong((id *)&v16->_persistentContextStore, a4);
    objc_initWeak(&location, v16);
    v29 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v16->_queue);
    expireTimer = v16->_expireTimer;
    v16->_expireTimer = (OS_dispatch_source *)v29;

    v31 = v16->_expireTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __85__HDIDSMessageCenter_initWithIDSServiceIdentifier_persistentDictionary_queue_daemon___block_invoke;
    handler[3] = &unk_1E6CECE78;
    objc_copyWeak(&v37, &location);
    dispatch_source_set_event_handler(v31, handler);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)addRequestHandler:(SEL)a3 forMessageID:(unsigned __int16)a4
{
  uint64_t v4;
  NSMutableDictionary *requestHandlers;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  SEL v12;

  v4 = a4;
  v12 = a3;
  if (self->_service)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 221, CFSTR("Cannot use %@ after using -resume"), v11, v12);

  }
  requestHandlers = self->_requestHandlers;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v12, ":");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](requestHandlers, "setObject:forKey:", v7, v8);

}

- (void)addResponseHandler:(SEL)a3 forMessageID:(unsigned __int16)a4
{
  uint64_t v4;
  NSMutableDictionary *responseHandlers;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  SEL v12;

  v4 = a4;
  v12 = a3;
  if (self->_service)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 233, CFSTR("Cannot use %@ after using -resume"), v11, v12);

  }
  responseHandlers = self->_responseHandlers;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v12, ":");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](responseHandlers, "setObject:forKey:", v7, v8);

}

- (void)addErrorHandler:(SEL)a3 forMessageID:(unsigned __int16)a4
{
  uint64_t v4;
  NSMutableDictionary *errorHandlers;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  SEL v12;

  v4 = a4;
  v12 = a3;
  if (self->_service)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 227, CFSTR("Cannot use %@ after using -resume"), v11, v12);

  }
  errorHandlers = self->_errorHandlers;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v12, ":");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](errorHandlers, "setObject:forKey:", v7, v8);

}

- (void)mapPBRequest:(Class)a3 toResponse:(Class)a4 messageID:(unsigned __int16)a5
{
  uint64_t v5;
  NSMutableDictionary *pbMapping;
  void *v10;
  HDIDSPBMapping *v11;

  v5 = a5;
  v11 = objc_alloc_init(HDIDSPBMapping);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestClass, a3);
    objc_storeStrong((id *)&v11->_responseClass, a4);
  }
  pbMapping = self->_pbMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](pbMapping, "setObject:forKeyedSubscript:", v11, v10);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)resume
{
  unsigned __int8 v4;
  id WeakRetained;
  IDSService *v6;
  IDSService *service;
  NSObject *queue;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[5];

  v4 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 290, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("atomic_load(&_invalidated) == false"));

  }
  if (self->_service)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 291, CFSTR("Cannot use %@ after using -resume"), v11);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "IDSServiceWithIdentifier:", self->_serviceIdentifier);
  v6 = (IDSService *)objc_claimAutoreleasedReturnValue();
  service = self->_service;
  self->_service = v6;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__HDIDSMessageCenter_resume__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __28__HDIDSMessageCenter_resume__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 96), 0, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 96));
}

void __85__HDIDSMessageCenter_initWithIDSServiceIdentifier_persistentDictionary_queue_daemon___block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current;
  void *v2;
  dispatch_queue_t v3;
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  os_log_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  os_log_t v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  id v18;
  dispatch_queue_t *WeakRetained;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  char *v26;
  CFAbsoluteTime v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[15]);
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = WeakRetained[10];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __37__HDIDSMessageCenter__expireMessages__block_invoke;
    v24[3] = &unk_1E6D0BE98;
    v26 = sel__expireMessages;
    v24[4] = WeakRetained;
    v27 = Current;
    v4 = v2;
    v25 = v4;
    -[NSObject enumerateObjectsSortedByExpirationDate:](v3, "enumerateObjectsSortedByExpirationDate:", v24);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v21;
      v10 = (os_log_t *)MEMORY[0x1E0CB5370];
      *(_QWORD *)&v7 = 138412546;
      v17 = v7;
      v18 = v5;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HDIDSErrorDomain"), 2, 0, v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          _HKInitializeLogging();
          v14 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
          {
            v15 = v14;
            -[HDIDSMessageCenter _logPrefix](WeakRetained);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v17;
            v29 = v16;
            v30 = 2112;
            v31 = v12;
            _os_log_debug_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEBUG, "%@ expire: %@", buf, 0x16u);

            v5 = v18;
          }
          -[HDIDSMessageCenter _handleError:context:]((uint64_t)WeakRetained, v13, v12);

          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v8);
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  -[HDIDSMessageCenter invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDIDSMessageCenter;
  -[HDIDSMessageCenter dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  BOOL *p_invalidated;
  unsigned __int8 v3;
  NSObject *queue;
  _QWORD block[5];

  p_invalidated = &self->_invalidated;
  do
    v3 = __ldaxr((unsigned __int8 *)p_invalidated);
  while (__stlxr(1u, (unsigned __int8 *)p_invalidated));
  if ((v3 & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__HDIDSMessageCenter_invalidate__block_invoke;
    block[3] = &unk_1E6CE80E8;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

void __32__HDIDSMessageCenter_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "invalidate");
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 96));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = 0;

}

- (void)obliterateWithReason:(id)a3 preserveCopy:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HDIDSMessageCenter_obliterateWithReason_preserveCopy___block_invoke;
  block[3] = &unk_1E6CF7348;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_sync(queue, block);

}

uint64_t __56__HDIDSMessageCenter_obliterateWithReason_preserveCopy___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "obliterateWithReason:preserveCopy:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __37__HDIDSMessageCenter__expireMessages__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v9 = a3;
  if (v13)
  {
    if (v9)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HDIDSMessageCenter.m"), 258, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("obj != nil"));

    if (a4)
      goto LABEL_4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HDIDSMessageCenter.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  if (!v9)
    goto LABEL_9;
LABEL_3:
  if (a4)
    goto LABEL_4;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HDIDSMessageCenter.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stop != NULL"));

LABEL_4:
  if (*(double *)(a1 + 56) <= a5)
  {
    -[HDIDSMessageCenter _updateExpireTimerWithTimestamp:](*(_QWORD *)(a1 + 32), a5);
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  }

}

- (void)_handleError:(void *)a3 context:
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 120));
    if (v6)
    {
      if (v6[2])
      {
        objc_msgSend(*(id *)(a1 + 80), "removeObjectForKey:");
        objc_msgSend(*(id *)(a1 + 80), "didReceiveError:forMessageID:", v5, v6[2]);
      }
      v7 = *((unsigned __int16 *)v6 + 5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__handleError_context_, a1, CFSTR("HDIDSMessageCenter.m"), 517, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

      v7 = 0;
    }
    v8 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");

      objc_msgSend(v12, "setObject:forKey:", v6, CFSTR("HDIDSContext"));
      v13 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v5, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, objc_msgSend(v5, "code"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = 0;
      objc_msgSend(v10, "getValue:", &v18);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
      objc_msgSend(WeakRetained, "performSelector:withObject:", v18, v15);

    }
  }

}

- (void)cancelPendingRequestsWithMessageID:(unsigned __int16)a3 device:(id)a4
{
  id v7;
  NSObject *queue;
  id v9;
  void *v10;
  _QWORD block[5];
  id v12;
  SEL v13;
  unsigned __int16 v14;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDIDSMessageCenter.m"), 542, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device != nil"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HDIDSMessageCenter_cancelPendingRequestsWithMessageID_device___block_invoke;
  block[3] = &unk_1E6D0BEE8;
  v12 = v7;
  v13 = a2;
  v14 = a3;
  block[4] = self;
  v9 = v7;
  dispatch_async(queue, block);

}

void __64__HDIDSMessageCenter_cancelPendingRequestsWithMessageID_device___block_invoke(uint64_t a1)
{
  unsigned __int8 v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_t *v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  os_log_t v18;
  _QWORD *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104));
  if ((v1 & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v3 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(const char **)(a1 + 48);
      v24 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v23, v24, CFSTR("HDIDSMessageCenter.m"), 548, CFSTR("Cannot use %@ until -resume is used"), v25);

      v3 = *(_QWORD *)(a1 + 32);
    }
    v4 = *(void **)(v3 + 80);
    v5 = *(unsigned __int16 *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "hd_deviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageIDsForPendingOutgoingMessagesWithType:deviceID:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      v12 = (os_log_t *)MEMORY[0x1E0CB5370];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v15 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
          v26 = 0;
          v16 = objc_msgSend(v15, "cancelIdentifier:error:", v14, &v26);
          v17 = v26;
          if ((v16 & 1) == 0)
          {
            _HKInitializeLogging();
            v18 = *v12;
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
            {
              v19 = *(_QWORD **)(a1 + 32);
              v20 = v18;
              -[HDIDSMessageCenter _logPrefix](v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v32 = v21;
              v33 = 2114;
              v34 = v14;
              v35 = 2114;
              v36 = v17;
              _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@ failed to cancel request %{public}@: %{public}@", buf, 0x20u);

            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "didCancel:", v8);
  }
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  IDSService *v11;
  IDSService *service;
  void *v13;
  NSObject *v14;
  void *v15;
  NSString *serviceIdentifier;
  void *v17;
  id WeakRetained;
  char v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v11 = (IDSService *)a3;
  dispatch_assert_queue_V2(queue);
  service = self->_service;

  if (service == v11)
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      -[HDIDSMessageCenter _logPrefix](self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      serviceIdentifier = self->_serviceIdentifier;
      objc_msgSend(v8, "hd_shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v15;
      v23 = 2114;
      v24 = serviceIdentifier;
      v25 = 2114;
      v26 = v17;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ active paired IDSDevice for %{public}@ did switch: %{public}@", (uint8_t *)&v21, 0x20u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v20, "messageCenter:activeDeviceDidChange:acknowledgementHandler:", self, v8, v9);

    }
  }

}

- (HDIDSMessageCenterDelegate)delegate
{
  return (HDIDSMessageCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expireTimer, 0);
  objc_storeStrong((id *)&self->_persistentContextStore, 0);
  objc_storeStrong((id *)&self->_pbMapping, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_errorHandlers, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pairingUUID, 0);
  objc_storeStrong((id *)&self->_shortServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

@end
