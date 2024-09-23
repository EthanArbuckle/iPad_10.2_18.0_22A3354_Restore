@implementation MPCPlaybackEngineEventStream

- (_QWORD)sql
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[9];
    if (!v1)
      v1 = (void *)a1[8];
    a1 = v1;
  }
  return a1;
}

- (MPCPlabackEngineEventStreamTestingDelegate)testingDelegate
{
  return (MPCPlabackEngineEventStreamTestingDelegate *)objc_loadWeakRetained((id *)&self->_testingDelegate);
}

- (NSString)engineID
{
  return self->_engineID;
}

uint64_t __76__MPCPlaybackEngineEventStream_cachedEventWithTypes_matchingPayload_cursor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "startEvent");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(*(id *)(a1 + 40), "startEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "compare:", v9);

      if (v10 != -1)
        goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 40), "endEvent");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_6;
    v12 = (void *)v11;
    objc_msgSend(*(id *)(a1 + 40), "endEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v3, "compare:", v13);

    if (v14 != 1)
    {
LABEL_8:
      v6 = 0;
    }
    else
    {
LABEL_6:
      v6 = 1;
      if (*(_QWORD *)(a1 + 48))
      {
        v15 = (void *)MEMORY[0x24BDBCED8];
        objc_msgSend(v3, "payload");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "payload");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _MPCPlaybackEngineEventFlattenPayload(v18, v17, &unk_24CB174B8);

        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v28 = 1;
        v19 = *(void **)(a1 + 48);
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __76__MPCPlaybackEngineEventStream_cachedEventWithTypes_matchingPayload_cursor___block_invoke_2;
        v22[3] = &unk_24CAB7788;
        v20 = v17;
        v23 = v20;
        v24 = &v25;
        objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v22);
        v6 = *((_BYTE *)v26 + 24) != 0;

        _Block_object_dispose(&v25, 8);
      }
    }
  }

  return v6;
}

- (id)cachedEventWithTypes:(void *)a3 matchingPayload:(void *)a4 cursor:
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 80));
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          if (!_MPCPlaybackEngineEventTypeIsCacheable(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v14)))
          {
            a1 = 0;
            goto LABEL_15;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
          continue;
        break;
      }
    }

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _MPCPlaybackEngineEventFlattenPayload(v8, v15, &unk_24CB174A0);
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(*(id *)(a1 + 56), "reverseObjectEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __76__MPCPlaybackEngineEventStream_cachedEventWithTypes_matchingPayload_cursor___block_invoke;
    v18[3] = &unk_24CAB77B0;
    v19 = v10;
    v20 = v9;
    v21 = v15;
    v10 = v15;
    objc_msgSend(v16, "msv_firstWhere:", v18);
    a1 = objc_claimAutoreleasedReturnValue();

LABEL_15:
  }

  return (id)a1;
}

void __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  dispatch_time_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  dispatch_time_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  NSObject *v41;
  MPCPlaybackEngineEvent *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  MPCPlaybackEngineEvent *v46;
  void *v47;
  char v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  MPCPlaybackEngineEvent *v53;
  uint64_t v54;
  os_unfair_lock_s *v55;
  void *v56;
  __CFString *v57;
  NSObject *v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  os_unfair_lock_s *v74;
  void *v75;
  void (**v76)(_QWORD, _QWORD, _QWORD);
  void *v77;
  MPCPlaybackEngineEvent *v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  MPCPlaybackEngineEvent *v82;
  uint64_t v83;
  void *v84;
  int IsCacheable;
  _MPCPlaybackEngineEventStreamCursor *v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  void *v91;
  MPCPlaybackEngineEvent *v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  MPCPlaybackEngineEvent *v96;
  uint64_t v97;
  NSObject *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  NSObject *v104;
  _OWORD *v105;
  NSObject *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  _MPCPlaybackEngineEventStreamCursor *v110;
  uint64_t v111;
  _QWORD v112[5];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  id v117;
  id v118;
  _QWORD v119[5];
  _QWORD block[5];
  _QWORD v121[2];
  _BYTE v122[128];
  _BYTE buf[32];
  _BYTE v124[10];
  __int16 v125;
  NSObject *v126;
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 17))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v2 = objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 88) > *(_QWORD *)(a1 + 128))
    {
      objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      if (v6 > 60.0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 32), CFSTR("MPCPlaybackEngineEventStream.m"), 411, CFSTR("Projected event date is too far in the future: %@ %@ %@"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));

      }
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
      if (!v7
        || (objc_msgSend(v7, "earlierDate:", *(_QWORD *)(a1 + 48)),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = *(void **)(*(_QWORD *)(a1 + 32) + 96),
            v8,
            v8 == v9))
      {
        objc_msgSend(*(id *)(a1 + 48), "dateByAddingTimeInterval:", 0.1);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(v11 + 96);
        *(_QWORD *)(v11 + 96) = v10;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "timeIntervalSinceNow");
        v14 = dispatch_time(0, (uint64_t)(fabs(v13) * 1000000000.0));
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(NSObject **)(v15 + 80);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke_54;
        block[3] = &unk_24CABA2D0;
        block[4] = v15;
        dispatch_after(v14, v16, block);
      }
    }
    v17 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v17 + 72))
    {
      objc_msgSend(*(id *)(v17 + 64), "transactionWithName:error:", CFSTR("event emit"), 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(v19 + 72);
      *(_QWORD *)(v19 + 72) = v18;

      v21 = dispatch_time(0, (uint64_t)(*(double *)(*(_QWORD *)(a1 + 32) + 32) * 1000000000.0));
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(NSObject **)(v22 + 80);
      v119[0] = MEMORY[0x24BDAC760];
      v119[1] = 3221225472;
      v119[2] = __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke_2;
      v119[3] = &unk_24CABA2D0;
      v119[4] = v22;
      dispatch_after(v21, v23, v119);
    }
    MPCPlaybackEngineEventPayloadJSONFromPayload(*(void **)(a1 + 64));
    v106 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = *(_QWORD *)(a1 + 40);
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      objc_msgSend(*(id *)(a1 + 48), "timeIntervalSince1970");
      v27 = *(_QWORD *)(a1 + 88) + *(_QWORD *)(a1 + 96);
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = (uint64_t)v28;
      *(_WORD *)v124 = 2048;
      *(_QWORD *)&v124[2] = v27;
      v125 = 2114;
      v126 = v2;
      _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@] emitEventType:%{public}@ payload:… atTime:%{time_t}zd | emitting event [] continuousTime=%ldns event.id=%{public}@", buf, 0x34u);
    }

    v29 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream_Oversize");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v30 = *(_QWORD *)(a1 + 40);
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      objc_msgSend(*(id *)(a1 + 48), "timeIntervalSince1970");
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = (uint64_t)v32;
      *(_WORD *)v124 = 2114;
      *(_QWORD *)&v124[2] = v2;
      v125 = 2114;
      v126 = v106;
      _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@] emitEventType:%{public}@ payload:… atTime:%{time_t}zd | emitting payload [] event.id=%{public}@ payload=%{public}@", buf, 0x34u);
    }
    v105 = (_OWORD *)(a1 + 72);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "statementWithString:error:", CFSTR("INSERT INTO events (identifier, type, monoAbsolute, monoContinuous, monoTimebaseNS, userNS, threadPriority, payload) VALUES (@identifier, @type, @monoAbsolute, @monoContinuous, @monoTimebaseNS, @userNS, @threadPriority, @payload)"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject msv_UUIDData](v2, "msv_UUIDData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bindDataValue:toParameterNamed:", v34, CFSTR("@identifier"));

    objc_msgSend(v33, "bindStringValue:toParameterNamed:", *(_QWORD *)(a1 + 40), CFSTR("@type"));
    objc_msgSend(v33, "bindUInt64Value:toParameterNamed:", *(_QWORD *)(a1 + 80), CFSTR("@monoAbsolute"));
    objc_msgSend(v33, "bindUInt64Value:toParameterNamed:", *(_QWORD *)(a1 + 88), CFSTR("@monoContinuous"));
    objc_msgSend(v33, "bindUInt64Value:toParameterNamed:", *(_QWORD *)(a1 + 96), CFSTR("@monoTimebaseNS"));
    objc_msgSend(v33, "bindUInt64Value:toParameterNamed:", (unint64_t)(*(double *)(a1 + 104) * 1000000000.0), CFSTR("@userNS"));
    objc_msgSend(v33, "bindUInt64Value:toParameterNamed:", *(int *)(a1 + 168), CFSTR("@threadPriority"));
    v118 = 0;
    objc_msgSend(v33, "bindJSONValue:toParameterNamed:error:", v106, CFSTR("@payload"), &v118);
    v35 = v118;
    objc_msgSend(*(id *)(a1 + 32), "testingDelegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        v38 = *(_QWORD *)(a1 + 40);
        v39 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        objc_msgSend(*(id *)(a1 + 48), "timeIntervalSince1970");
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v38;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = (uint64_t)v40;
        *(_WORD *)v124 = 2114;
        *(_QWORD *)&v124[2] = v2;
        v125 = 2114;
        v126 = v35;
        _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_FAULT, "[EVS:%{public}@] emitEventType:%{public}@ payload:… atTime:%{time_t}zd | failed [json bind failure] event.id=%{public}@ error=%{public}@", buf, 0x34u);
      }

      if (v36)
      {
        MPCPlaybackEngineEventPayloadFromPayloadJSON(v106);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = [MPCPlaybackEngineEvent alloc];
        v43 = *(_QWORD *)(a1 + 40);
        v44 = *(unsigned int *)(a1 + 168);
        v45 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)buf = *v105;
        *(_OWORD *)&buf[16] = v45;
        *(_QWORD *)v124 = *(_QWORD *)(a1 + 104);
        v46 = -[MPCPlaybackEngineEvent initWithType:payload:monotonicTime:threadPriority:identifier:](v42, "initWithType:payload:monotonicTime:threadPriority:identifier:", v43, v41, buf, v44, v2);
        objc_msgSend(v36, "eventStream:didFailToEmitEvent:error:", *(_QWORD *)(a1 + 32), v46, v35);

        goto LABEL_56;
      }
LABEL_57:

      goto LABEL_58;
    }
    v47 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    v117 = 0;
    v48 = objc_msgSend(v47, "executeStatement:error:", v33, &v117);
    v49 = v117;
    v41 = v49;
    if ((v48 & 1) == 0)
    {
      v87 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
      {
        v88 = *(_QWORD *)(a1 + 40);
        v89 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        objc_msgSend(*(id *)(a1 + 48), "timeIntervalSince1970");
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v89;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v88;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = (uint64_t)v90;
        *(_WORD *)v124 = 2114;
        *(_QWORD *)&v124[2] = v2;
        v125 = 2114;
        v126 = v41;
        _os_log_impl(&dword_210BD8000, v87, OS_LOG_TYPE_FAULT, "[EVS:%{public}@] emitEventType:%{public}@ payload:… atTime:%{time_t}zd | failed [insert statement failed] event.id=%{public}@ error=%{public}@", buf, 0x34u);
      }

      if (v36)
      {
        MPCPlaybackEngineEventPayloadFromPayloadJSON(v106);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = [MPCPlaybackEngineEvent alloc];
        v93 = *(_QWORD *)(a1 + 40);
        v94 = *(unsigned int *)(a1 + 168);
        v95 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)buf = *v105;
        *(_OWORD *)&buf[16] = v95;
        *(_QWORD *)v124 = *(_QWORD *)(a1 + 104);
        v96 = -[MPCPlaybackEngineEvent initWithType:payload:monotonicTime:threadPriority:identifier:](v92, "initWithType:payload:monotonicTime:threadPriority:identifier:", v93, v91, buf, v94, v2);
        objc_msgSend(v36, "eventStream:didFailToEmitEvent:error:", *(_QWORD *)(a1 + 32), v96, v41);

      }
      objc_msgSend(v33, "invalidate");
LABEL_56:

      goto LABEL_57;
    }
    v100 = v49;
    v101 = v36;
    v102 = v33;
    v104 = v2;
    objc_msgSend(v33, "invalidate");
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v50 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
    if (!v51)
    {
      v53 = 0;
      v110 = 0;
      goto LABEL_55;
    }
    v52 = v51;
    v53 = 0;
    v110 = 0;
    v111 = *(_QWORD *)v114;
    v108 = *MEMORY[0x24BE65AB0];
    v107 = v50;
LABEL_24:
    v54 = 0;
    v109 = v52;
    while (1)
    {
      if (*(_QWORD *)v114 != v111)
        objc_enumerationMutation(v50);
      v55 = *(os_unfair_lock_s **)(*((_QWORD *)&v113 + 1) + 8 * v54);
      if ((unint64_t)-[os_unfair_lock_s lastEventSuccessTimestamp](v55, "lastEventSuccessTimestamp") > *(_QWORD *)(a1 + 160))
        break;
LABEL_35:
      v74 = v55 + 2;
      os_unfair_lock_lock(v55 + 2);
      -[os_unfair_lock_s mutatingEventHandlers](v55, "mutatingEventHandlers");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v76 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock(v74);
      if (!v53)
      {
        if ((_MPCPlaybackEngineEventTypeIsCacheable(*(void **)(a1 + 40)) & 1) == 0 && !v76)
        {
          v53 = 0;
          goto LABEL_46;
        }
        MPCPlaybackEngineEventPayloadFromPayloadJSON(v106);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = [MPCPlaybackEngineEvent alloc];
        v79 = *(_QWORD *)(a1 + 40);
        v80 = *(unsigned int *)(a1 + 168);
        v81 = *(_OWORD *)(a1 + 88);
        *(_OWORD *)buf = *v105;
        *(_OWORD *)&buf[16] = v81;
        *(_QWORD *)v124 = *(_QWORD *)(a1 + 104);
        v82 = -[MPCPlaybackEngineEvent initWithType:payload:monotonicTime:threadPriority:identifier:](v78, "initWithType:payload:monotonicTime:threadPriority:identifier:", v79, v77, buf, v80, v104);
        v83 = *(_QWORD *)(a1 + 32);
        v53 = v82;
        if (v83)
        {
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v83 + 80));
          -[MPCPlaybackEngineEvent type](v53, "type");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          IsCacheable = _MPCPlaybackEngineEventTypeIsCacheable(v84);

          if (IsCacheable)
          {
            objc_msgSend(*(id *)(v83 + 56), "addObject:", v53);
            objc_msgSend(*(id *)(v83 + 56), "sortUsingSelector:", sel_compare_);
            if ((unint64_t)objc_msgSend(*(id *)(v83 + 56), "count") >= 0x65)
              objc_msgSend(*(id *)(v83 + 56), "removeObjectsInRange:", 0, objc_msgSend(*(id *)(v83 + 56), "count") - 100);
          }
        }

        v86 = -[_MPCPlaybackEngineEventStreamCursor initWithEventStream:startEvent:endEvent:]([_MPCPlaybackEngineEventStreamCursor alloc], "initWithEventStream:startEvent:endEvent:", *(_QWORD *)(a1 + 32), v53, 0);
        v110 = v86;
        if (!v76)
          goto LABEL_46;
LABEL_37:
        ((void (**)(_QWORD, MPCPlaybackEngineEvent *, _MPCPlaybackEngineEventStreamCursor *))v76)[2](v76, v53, v110);
        goto LABEL_46;
      }
      if (v76)
        goto LABEL_37;
LABEL_46:

      if (v52 == ++v54)
      {
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
        if (!v52)
        {
LABEL_55:

          ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
          v97 = *(_QWORD *)(a1 + 32);
          v98 = *(NSObject **)(v97 + 80);
          v112[0] = MEMORY[0x24BDAC760];
          v112[1] = 3221225472;
          v112[2] = __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke_83;
          v112[3] = &unk_24CABA2D0;
          v112[4] = v97;
          dispatch_async(v98, v112);

          v2 = v104;
          v35 = 0;
          v33 = v102;
          v41 = v100;
          v36 = v101;
          goto LABEL_56;
        }
        goto LABEL_24;
      }
    }
    -[os_unfair_lock_s consumer](v55, "consumer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = *(__CFString **)(a1 + 40);
    v58 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    v59 = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
    if (v57 == CFSTR("item-position-jump"))
    {
      if (v59)
      {
        v103 = *(_QWORD *)(a1 + 40);
        v65 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        objc_msgSend(*(id *)(a1 + 48), "timeIntervalSince1970");
        v67 = (uint64_t)v66;
        objc_msgSend((id)objc_opt_class(), "identifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("item-jump-identifier"));
        v68 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v65;
        v50 = v107;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v103;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = v67;
        *(_WORD *)v124 = 2114;
        *(_QWORD *)&v124[2] = v64;
        v125 = 2114;
        v126 = v68;
        _os_log_impl(&dword_210BD8000, v58, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] emitEventType:%{public}@ payload:… atTime:%{time_t}zd | subscriber ahead of event [backdated jump event] consumer=%{public}@ jumpIdentifier=%{public}@", buf, 0x34u);

        goto LABEL_33;
      }
    }
    else if (v59)
    {
      v60 = *(_QWORD *)(a1 + 40);
      v61 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      objc_msgSend(*(id *)(a1 + 48), "timeIntervalSince1970");
      v63 = (uint64_t)v62;
      objc_msgSend((id)objc_opt_class(), "identifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v61;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v60;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v63;
      v50 = v107;
      *(_WORD *)v124 = 2114;
      *(_QWORD *)&v124[2] = v64;
      _os_log_impl(&dword_210BD8000, v58, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] emitEventType:%{public}@ payload:… atTime:%{time_t}zd | subscriber ahead of event [out of order delivery] consumer=%{public}@", buf, 0x2Au);
LABEL_33:

    }
    v69 = (void *)MEMORY[0x24BE65C38];
    v70 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "identifier");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = *(_QWORD *)(a1 + 64);
    v121[0] = v71;
    v121[1] = v72;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 2);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v108, CFSTR("Bug"), CFSTR("EVSSubscriberAheadOfEvent"), v70, 0, v73, 0);

    v52 = v109;
    goto LABEL_35;
  }
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(*(id *)(a1 + 48), "timeIntervalSince1970");
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = (uint64_t)v5;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] emitEventType:%{public}@ | dropping event [invalidated] time=%{time_t}zd", buf, 0x20u);
  }
LABEL_58:

}

- (void)_onQueue_flushIfReady
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a1 && *(uint64_t *)(a1 + 88) <= 0 && (objc_msgSend(*(id *)(a1 + 96), "msv_isFuture") & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v2 = objc_msgSend(*(id *)(a1 + 48), "count");
    v3 = v2;
    if (*(_BYTE *)(a1 + 16) && v2 >= 1)
    {
      objc_msgSend(*(id *)(a1 + 48), "allObjects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "msv_filter:", &__block_literal_global_21310);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "count");

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (!v3 && !*(_BYTE *)(a1 + 17))
    {
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 88) = 0;
      *(_QWORD *)(a1 + 96) = 0;

      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = *(id *)(a1 + 40);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_onQueue_flush", (_QWORD)v12);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

    }
  }
}

- (void)emitEventType:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];

  v6 = a4;
  v7 = a3;
  MPCPlaybackEngineEventGetMonotonicTime(v8);
  -[MPCPlaybackEngineEventStream emitEventType:payload:atTime:](self, "emitEventType:payload:atTime:", v7, v6, v8);

}

- (void)emitEventType:(id)a3 payload:(id)a4 atTime:(id *)a5
{
  id v9;
  id v10;
  uint64x2_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSString *engineID;
  double v16;
  unint64_t v17;
  void *v18;
  int v19;
  NSObject *queue;
  __int128 v21;
  float64x2_t v22;
  float64x2_t v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  double var4;
  __int128 v32;
  uint64x2_t v33;
  double v34;
  SEL v35;
  unint64_t v36;
  int v37;
  __int128 v38;
  uint64x2_t v39;
  double v40;
  uint8_t buf[4];
  NSString *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v40 = 0.0;
  v38 = 0u;
  v39 = 0u;
  MPCPlaybackEngineEventGetMonotonicTime(&v38);
  if ((a5->var0 & 1) == 0)
  {
    v11 = v39;
    *(_OWORD *)&a5->var0 = v38;
    *(uint64x2_t *)&a5->var2 = v11;
    a5->var4 = v40;
  }
  v22 = (float64x2_t)vdupq_n_s64(0x41CDCD6500000000uLL);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", vaddvq_f64(vdivq_f64(vcvtq_f64_u64(v39), v22)), *(_OWORD *)&v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", vaddvq_f64(vdivq_f64(vcvtq_f64_u64(*(uint64x2_t *)&a5->var2), v23)));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_invalidated)
  {
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      engineID = self->_engineID;
      objc_msgSend(v13, "timeIntervalSince1970");
      *(_DWORD *)buf = 138543874;
      v42 = engineID;
      v43 = 2114;
      v44 = v9;
      v45 = 2048;
      v46 = (uint64_t)v16;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] emitEventType:%{public}@ | dropping event [invalidated] time=%{time_t}zd", buf, 0x20u);
    }

  }
  else
  {
    v17 = a5->var2 + a5->var3;
    -[MPCPlaybackEngineEventStream testingDelegate](self, "testingDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      _MPCPlaybackEngineEventStreamValidateSystemTime(v9, v17);
    v19 = MSVGetCurrentThreadPriority();
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke;
    block[3] = &unk_24CAB7738;
    block[4] = self;
    v25 = v9;
    v26 = v13;
    v21 = *(_OWORD *)&a5->var2;
    v29 = *(_OWORD *)&a5->var0;
    v30 = v21;
    var4 = a5->var4;
    v32 = v38;
    v33 = v39;
    v34 = v40;
    v27 = v12;
    v35 = a2;
    v37 = v19;
    v28 = v10;
    v36 = v17;
    dispatch_async(queue, block);

  }
}

void __53__MPCPlaybackEngineEventStream__invalidateAssertion___block_invoke(uint64_t a1)
{
  -[MPCPlaybackEngineEventStream _onQueue_flushIfReady](*(_QWORD *)(a1 + 32));
}

- (void)addConsumer:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *engineID;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  MPCPlaybackEngineEventStream *v12;
  uint8_t buf[4];
  NSString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    objc_msgSend((id)objc_opt_class(), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v14 = engineID;
    v15 = 2114;
    v16 = v7;
    v17 = 2048;
    v18 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@] addConsumer:<%{public}@: %p>", buf, 0x20u);

  }
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__MPCPlaybackEngineEventStream_addConsumer___block_invoke;
  v10[3] = &unk_24CABA1D0;
  v11 = v4;
  v12 = self;
  v9 = v4;
  dispatch_async(queue, v10);

}

- (MPCPlaybackEngineEventStream)initWithParameters:(id)a3
{
  id v4;
  id v5;
  MPCPlaybackEngineEventStream *v6;
  _QWORD v8[4];
  MPCPlaybackEngineEventStream *v9;
  id v10;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__MPCPlaybackEngineEventStream_initWithParameters___block_invoke;
  v8[3] = &unk_24CAB7700;
  v9 = self;
  v10 = v4;
  v5 = v4;
  v6 = -[MPCPlaybackEngineEventStream initWithDatabaseCreationBlock:](v9, "initWithDatabaseCreationBlock:", v8);

  return v6;
}

- (MPCPlaybackEngineEventStream)initWithDatabaseCreationBlock:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD block[4];
  id v24;
  id v25;
  uint64_t state64;
  _QWORD handler[4];
  id v28;
  id location;
  objc_super v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MPCPlaybackEngineEventStream;
  v5 = -[MPCPlaybackEngineEventStream init](&v30, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCPlaybackEngineEventStream/access", v7);
    v9 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v10;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v12;

    *((_DWORD *)v5 + 2) = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 101);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v14;

    *((_BYTE *)v5 + 17) = 0;
    *((_QWORD *)v5 + 4) = 0x3FF0000000000000;
    v16 = MSVDeviceOSIsInternalInstall();
    v17 = MEMORY[0x24BDAC760];
    if (v16)
    {
      objc_initWeak(&location, v5);
      v18 = MEMORY[0x24BDAC9B8];
      handler[0] = v17;
      handler[1] = 3221225472;
      handler[2] = __62__MPCPlaybackEngineEventStream_initWithDatabaseCreationBlock___block_invoke;
      handler[3] = &unk_24CAB76D8;
      objc_copyWeak(&v28, &location);
      notify_register_dispatch("com.apple.mediaplaybackcore.evsdebug", (int *)v5 + 3, MEMORY[0x24BDAC9B8], handler);

      state64 = 0;
      notify_get_state(*((_DWORD *)v5 + 3), &state64);
      v19 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = *((_QWORD *)v5 + 3);
        *(_DWORD *)buf = 138543618;
        v32 = v20;
        v33 = 1024;
        v34 = state64 != 0;
        _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] notify_register(\"com.apple.mediaplaybackcore.evsdebug\") | evsdebug flag [initial] evsdebug=%{BOOL}u", buf, 0x12u);
      }

      *((_BYTE *)v5 + 16) = state64 != 0;
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    v21 = *((_QWORD *)v5 + 10);
    block[0] = v17;
    block[1] = 3221225472;
    block[2] = __62__MPCPlaybackEngineEventStream_initWithDatabaseCreationBlock___block_invoke_4;
    block[3] = &unk_24CAB9830;
    v24 = v5;
    v25 = v4;
    dispatch_async(v21, block);

  }
  return (MPCPlaybackEngineEventStream *)v5;
}

void __44__MPCPlaybackEngineEventStream_addConsumer___block_invoke(uint64_t a1)
{
  _MPCPlaybackEngineEventStreamSubscription *v2;

  v2 = -[_MPCPlaybackEngineEventStreamSubscription initWithConsumer:eventStream:]([_MPCPlaybackEngineEventStreamSubscription alloc], "initWithConsumer:eventStream:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "addObject:", v2);
  objc_msgSend(*(id *)(a1 + 32), "subscribeToEventStream:", v2);

}

void __51__MPCPlaybackEngineEventStream_initWithParameters___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[MPCPlaybackEngineEventStream _removeAllDatabasePackages:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("_MPC_EVS_IN_DOCUMENTS_IS_CLEAN"));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "URLsForDirectory:inDomains:", 9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlaybackEventStreams"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlaybackEngineEventStream _removeAllDatabasePackages:](*(_QWORD *)(a1 + 32), v6);
    v7 = *(void **)(a1 + 48);
    v12 = 0;
    objc_msgSend(v7, "removeItemAtURL:error:", v6, &v12);
    v8 = v12;
    if (v8)
    {
      v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v14 = v10;
        v15 = 2114;
        v16 = v8;
        _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_ERROR, "Failed to remove legacy EVS container folder: %{public}@ error: %{public}@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBool:forKey:", 1, CFSTR("_MPC_EVS_IN_DOCUMENTS_IS_CLEAN"));

  }
}

- (void)_removeAllDatabasePackages:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _QWORD v46[4];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v29 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x24BDBCC60];
    v46[0] = *MEMORY[0x24BDBCC60];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, v5, 4, &v38);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v38;

    if (v7)
    {
      v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(v29 + 24);
        *(_DWORD *)buf = 138543875;
        v41 = v9;
        v42 = 2113;
        v43 = v3;
        v44 = 2114;
        v45 = v7;
        _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] _removeAllDatabasePackages | unable to list directory [] url=%{private}@ error=%{public}@", buf, 0x20u);
      }
    }
    else
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v8 = v6;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v10)
      {
        v11 = v10;
        v26 = v6;
        v27 = v3;
        v7 = 0;
        v12 = "com.apple.amp.mediaplaybackcore";
        v13 = *(_QWORD *)v35;
        v30 = *(_QWORD *)v35;
        do
        {
          v14 = 0;
          v28 = v11;
          do
          {
            if (*(_QWORD *)v35 != v13)
              objc_enumerationMutation(v8);
            v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
            v33 = 0;
            objc_msgSend(v15, "getResourceValue:forKey:error:", &v33, v31, 0, v26, v27);
            v16 = v33;
            if (objc_msgSend(v16, "BOOLValue"))
            {
              v32 = v7;
              objc_msgSend(v4, "removeItemAtURL:error:", v15, &v32);
              v17 = v32;

              v18 = os_log_create(v12, "PlaybackEventStream");
              v19 = v18;
              if (v17)
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  v20 = v12;
                  v21 = v8;
                  v22 = v4;
                  v23 = *(_QWORD *)(v29 + 24);
                  objc_msgSend(v17, "msv_description");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v41 = v23;
                  v4 = v22;
                  v8 = v21;
                  v12 = v20;
                  v42 = 2114;
                  v43 = v15;
                  v44 = 2114;
                  v45 = v24;
                  _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] _removeAllDatabasePackages | removing database package [] url=%{public}@ error=%{public}@", buf, 0x20u);

                  v11 = v28;
                }
              }
              else
              {
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  v25 = *(_QWORD *)(v29 + 24);
                  *(_DWORD *)buf = 138543618;
                  v41 = v25;
                  v42 = 2114;
                  v43 = v15;
                  _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[EVS:%{public}@] _removeAllDatabasePackages | removing database package [] url=%{public}@", buf, 0x16u);
                }
                v17 = 0;
              }

              v7 = v17;
              v13 = v30;
            }

            ++v14;
          }
          while (v11 != v14);
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v11);
        v6 = v26;
        v3 = v27;
      }
      else
      {
        v7 = 0;
      }
    }

  }
}

id __51__MPCPlaybackEngineEventStream_initWithParameters___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
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
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "engineID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLsForDirectory:inDomains:", 14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.MediaPlaybackCore.PlaybackEventStreams"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 40), "playerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "engineID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@.sqlpkg"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__MPCPlaybackEngineEventStream_initWithParameters___block_invoke_2;
  block[3] = &unk_24CABAA28;
  v16 = *(id *)(a1 + 32);
  v34 = v16;
  v17 = v9;
  v35 = v17;
  v18 = v6;
  v19 = v18;
  v36 = v18;
  if (_block_invoke_onceToken == -1)
  {
    v20 = v17;
    v21 = v18;
  }
  else
  {
    dispatch_once(&_block_invoke_onceToken, block);
    v20 = v35;
    v21 = v36;
    v16 = v34;
  }
  objc_msgSend(v19, "removeItemAtURL:error:", v15, 0);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBool:forKey:", 0, CFSTR("_MPC_CLEAR_EVS"));

  objc_msgSend(v15, "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v23, 1, 0, 0);

  objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", CFSTR("Database"), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE65C90]), "initWithURL:error:", v24, &v32);
  v26 = v32;
  if (v26 || !v25)
  {
    v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138543874;
      v38 = v29;
      v39 = 2114;
      v40 = v24;
      v41 = 2114;
      v42 = v26;
      _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_FAULT, "[EVS:%{public}@] initWithParameters:… | unable to create events database [] url=%{public}@ error=%{public}@", buf, 0x20u);
    }

    v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE65C90]), "initWithMemory");
  }
  else
  {
    v27 = v25;
  }
  v30 = v27;

  return v30;
}

- (id)eventDeliveryDeferralAssertionOfType:(int64_t)a3 forReason:(id)a4 withTimeout:(double)a5
{
  id v9;
  _MPCPlaybackEngineEventStreamDeferralAssertion *v10;
  NSObject *v11;
  NSString *engineID;
  void *v13;
  int v14;
  void *v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  double v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEventStream.m"), 357, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v10 = -[_MPCPlaybackEngineEventStreamDeferralAssertion initWithEventStream:type:reason:timeout:]([_MPCPlaybackEngineEventStreamDeferralAssertion alloc], "initWithEventStream:type:reason:timeout:", self, a3, v9, a5);
  os_unfair_lock_lock(&self->_deferralAssertionsLock);
  -[NSHashTable addObject:](self->_deferralAssertions, "addObject:", v10);
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    engineID = self->_engineID;
    -[_MPCPlaybackEngineEventStreamDeferralAssertion identifier](v10, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSHashTable count](self->_deferralAssertions, "count");
    *(_DWORD *)buf = 138544642;
    v18 = engineID;
    v19 = 1024;
    v20 = a3;
    v21 = 2048;
    v22 = a5;
    v23 = 2114;
    v24 = v9;
    v25 = 2114;
    v26 = v13;
    v27 = 1024;
    v28 = v14;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[EVS:%{public}@] eventDeliveryDeferralAssertionOfType:%d reason:… timeout:%g | taking assertion [%{public}@] id=%{public}@ assertionCount=%d", buf, 0x36u);

  }
  os_unfair_lock_unlock(&self->_deferralAssertionsLock);

  return v10;
}

- (id)eventDeliveryDeferralAssertionOfType:(int64_t)a3 forReason:(id)a4
{
  return -[MPCPlaybackEngineEventStream eventDeliveryDeferralAssertionOfType:forReason:withTimeout:](self, "eventDeliveryDeferralAssertionOfType:forReason:withTimeout:", a3, a4, 0.0);
}

void __76__MPCPlaybackEngineEventStream_cachedEventWithTypes_matchingPayload_cursor___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  char v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v9)
  {

  }
  else
  {
    v8 = objc_msgSend(v9, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }

}

void __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "commit");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  *(_QWORD *)(v2 + 72) = 0;

}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEventStream.m"), 297, CFSTR("EVS: deallocated before invalidation"));

  }
  notify_cancel(self->_deferralDebugToken);
  v5.receiver = self;
  v5.super_class = (Class)MPCPlaybackEngineEventStream;
  -[MPCPlaybackEngineEventStream dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  if (!self->_invalidated)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__MPCPlaybackEngineEventStream_invalidate__block_invoke;
    block[3] = &unk_24CABA2D0;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

- (void)scheduleInvalidation
{
  NSObject *queue;
  _QWORD block[5];

  if (!self->_invalidated)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__MPCPlaybackEngineEventStream_scheduleInvalidation__block_invoke;
    block[3] = &unk_24CABA2D0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPCPlaybackEngineEventStream;
  -[MPCPlaybackEngineEventStream debugDescription](&v6, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("\n - Database: %@"), self->_database);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n - Subscriptions: %@"), self->_subscriptions);
  os_unfair_lock_lock(&self->_deferralAssertionsLock);
  objc_msgSend(v4, "appendFormat:", CFSTR("\n - Assertions: %@"), self->_deferralAssertions);
  os_unfair_lock_unlock(&self->_deferralAssertionsLock);
  return v4;
}

- (void)removeConsumer:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *engineID;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  NSString *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    engineID = self->_engineID;
    objc_msgSend((id)objc_opt_class(), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = engineID;
    v14 = 2114;
    v15 = v7;
    v16 = 2048;
    v17 = v4;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@] removeConsumer:<%{public}@: %p>", buf, 0x20u);

  }
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__MPCPlaybackEngineEventStream_removeConsumer___block_invoke;
  v10[3] = &unk_24CABA1D0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(queue, v10);

}

- (void)flushEvents
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__MPCPlaybackEngineEventStream_flushEvents__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)flushEventsWithConsumer:(id)a3 fromTimestamp:(unint64_t)a4 untilTimestamp:(unint64_t)a5
{
  id v8;
  _MPCPlaybackEngineEventStreamSubscription *v9;
  NSObject *queue;
  _MPCPlaybackEngineEventStreamSubscription *v11;
  _QWORD block[4];
  _MPCPlaybackEngineEventStreamSubscription *v13;

  v8 = a3;
  v9 = -[_MPCPlaybackEngineEventStreamSubscription initWithConsumer:eventStream:]([_MPCPlaybackEngineEventStreamSubscription alloc], "initWithConsumer:eventStream:", v8, self);
  -[_MPCPlaybackEngineEventStreamSubscription setLastEventSuccessTimestamp:](v9, "setLastEventSuccessTimestamp:", a4);
  -[_MPCPlaybackEngineEventStreamSubscription setMaximumEventDeliveryTimestamp:](v9, "setMaximumEventDeliveryTimestamp:", a5);
  objc_msgSend(v8, "subscribeToEventStream:", v9);

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__MPCPlaybackEngineEventStream_flushEventsWithConsumer_fromTimestamp_untilTimestamp___block_invoke;
  block[3] = &unk_24CABA2D0;
  v13 = v9;
  v11 = v9;
  dispatch_sync(queue, block);

}

- (void)performQuery:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__MPCPlaybackEngineEventStream_performQuery___block_invoke;
  block[3] = &unk_24CAB9830;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)performQueryReturningObject:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__21062;
  v15 = __Block_byref_object_dispose__21063;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__MPCPlaybackEngineEventStream_performQueryReturningObject___block_invoke;
  v8[3] = &unk_24CAB7760;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[MPCPlaybackEngineEventStream performQuery:](self, "performQuery:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)performQueryReturningBOOL:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__MPCPlaybackEngineEventStream_performQueryReturningBOOL___block_invoke;
  v7[3] = &unk_24CAB7760;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  -[MPCPlaybackEngineEventStream performQuery:](self, "performQuery:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (MPCPlaybackEngineEvent)lastEvent
{
  void *v2;
  void *v3;

  -[MPCPlaybackEngineEventStream lastEventsWithCount:](self, "lastEventsWithCount:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPCPlaybackEngineEvent *)v3;
}

- (id)lastEventsWithCount:(int64_t)a3
{
  NSObject *v5;
  NSString *engineID;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  NSString *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (self->_invalidated)
  {
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      engineID = self->_engineID;
      v17 = 138543618;
      v18 = engineID;
      v19 = 1024;
      v20 = a3;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] lastEventsWithCount:%d | returning empty [invalidated]", (uint8_t *)&v17, 0x12u);
    }

    return MEMORY[0x24BDBD1A8];
  }
  else
  {
    -[MPCPlaybackEngineEventStream sql](self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "statementWithString:error:", CFSTR("SELECT identifier, type, monoAbsolute, monoContinuous, monoTimebaseNS, userNS, threadPriority, payload, _ns FROM events ORDER BY _ns LIMIT @count"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "bindInt64Value:toParameterNamed:", a3, CFSTR("@count"));
    -[MPCPlaybackEngineEventStream sql](self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resultsForStatement:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nextObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      do
      {
        +[MPCPlaybackEngineEvent eventFromRowResult:]((uint64_t)MPCPlaybackEngineEvent, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v12, "addObject:", v15);

        objc_msgSend(v11, "nextObject");
        v16 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v16;
      }
      while (v16);
    }
    objc_msgSend(v9, "invalidate");

    return v12;
  }
}

- (void)setMaximumEventDeliveryTimestamp:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __65__MPCPlaybackEngineEventStream_setMaximumEventDeliveryTimestamp___block_invoke;
  v4[3] = &unk_24CAB90B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)resetConsumerEventDeliveryToTimestamp:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__MPCPlaybackEngineEventStream_resetConsumerEventDeliveryToTimestamp___block_invoke;
  v4[3] = &unk_24CAB90B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (double)transactionDebounceTime
{
  return self->_transactionDebounceTime;
}

- (void)setTransactionDebounceTime:(double)a3
{
  self->_transactionDebounceTime = a3;
}

- (void)setTestingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_testingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_nextScheduledFlush, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_cachedEvents, 0);
  objc_storeStrong((id *)&self->_deferralAssertions, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_engineID, 0);
}

void __70__MPCPlaybackEngineEventStream_resetConsumerEventDeliveryToTimestamp___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setLastEventSuccessTimestamp:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __65__MPCPlaybackEngineEventStream_setMaximumEventDeliveryTimestamp___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setMaximumEventDeliveryTimestamp:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __58__MPCPlaybackEngineEventStream_performQueryReturningBOOL___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __60__MPCPlaybackEngineEventStream_performQueryReturningObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __45__MPCPlaybackEngineEventStream_performQuery___block_invoke(uint64_t a1)
{
  _MPCPlaybackEngineEventStreamCursor *v2;
  _MPCPlaybackEngineEventStreamCursor *v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = 0;
  v4 = 0u;
  v5 = 0u;
  MPCPlaybackEngineEventGetMonotonicTime(&v4);
  v2 = [_MPCPlaybackEngineEventStreamCursor alloc];
  v3 = -[_MPCPlaybackEngineEventStreamCursor initWithEventStream:fromNanoSeconds:endEvent:](v2, "initWithEventStream:fromNanoSeconds:endEvent:", *(_QWORD *)(a1 + 32), (_QWORD)v5 + *((_QWORD *)&v5 + 1), 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __85__MPCPlaybackEngineEventStream_flushEventsWithConsumer_fromTimestamp_untilTimestamp___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_flush");
  objc_msgSend(*(id *)(a1 + 32), "cancelSubscription");
  objc_msgSend(*(id *)(a1 + 32), "consumer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsubscribeFromEventStream:", *(_QWORD *)(a1 + 32));

}

void __43__MPCPlaybackEngineEventStream_flushEvents__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "_onQueue_flush", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke_54(uint64_t a1)
{
  -[MPCPlaybackEngineEventStream _onQueue_flushIfReady](*(_QWORD *)(a1 + 32));
}

void __61__MPCPlaybackEngineEventStream_emitEventType_payload_atTime___block_invoke_83(uint64_t a1)
{
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  -[MPCPlaybackEngineEventStream _onQueue_flushIfReady](*(_QWORD *)(a1 + 32));
}

BOOL __55__MPCPlaybackEngineEventStream__onQueue_isReadyToFlush__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") != 1;
}

void __47__MPCPlaybackEngineEventStream_removeConsumer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "consumer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", v7);
          objc_msgSend(v7, "cancelSubscription");
          objc_msgSend(*(id *)(a1 + 40), "unsubscribeFromEventStream:", v7);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __52__MPCPlaybackEngineEventStream_scheduleInvalidation__block_invoke(uint64_t a1)
{
  -[MPCPlaybackEngineEventStream _onQueue_flushAndInvalidate](*(_QWORD *)(a1 + 32));
}

- (void)_onQueue_flushAndInvalidate
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a1 && !*(_BYTE *)(a1 + 17))
  {
    v2 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 24);
      *(_DWORD *)buf = 138543362;
      v28 = v3;
      _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "[EVS:%{public}@] invalidate | invalidating event stream", buf, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v9, "_onQueue_flush");
          objc_msgSend(v9, "cancelSubscription");
          objc_msgSend(v9, "consumer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "unsubscribeFromEventStream:", v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      }
      while (v6);
    }

    *(_BYTE *)(a1 + 17) = 1;
    objc_msgSend(*(id *)(a1 + 64), "databaseURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x212BD2784]();
    v13 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = 0;

    v14 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    objc_autoreleasePoolPop(v12);
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v15, "removeItemAtURL:error:", v11, &v22);
      v16 = v22;

      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      v18 = v17;
      if (v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v19 = *(_QWORD *)(a1 + 24);
          objc_msgSend(v16, "msv_description");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v28 = v19;
          v29 = 2114;
          v30 = v11;
          v31 = 2114;
          v32 = v20;
          _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] invalidate | removing database [invalidation] url=%{public}@ error=%{public}@", buf, 0x20u);

        }
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(a1 + 24);
          *(_DWORD *)buf = 138543618;
          v28 = v21;
          v29 = 2114;
          v30 = v11;
          _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[EVS:%{public}@] invalidate | removing database [invalidation] url=%{public}@", buf, 0x16u);
        }
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
}

void __42__MPCPlaybackEngineEventStream_invalidate__block_invoke(uint64_t a1)
{
  -[MPCPlaybackEngineEventStream _onQueue_flushAndInvalidate](*(_QWORD *)(a1 + 32));
}

void __62__MPCPlaybackEngineEventStream_initWithDatabaseCreationBlock___block_invoke(uint64_t a1, int a2)
{
  _BYTE *WeakRetained;
  NSObject *v4;
  void *v5;
  uint64_t state64;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  state64 = 0;
  notify_get_state(a2, &state64);
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(WeakRetained, "engineID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    v9 = 1024;
    v10 = state64 != 0;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] notify_register(\"com.apple.mediaplaybackcore.evsdebug\") | evsdebug flag [notification] evsdebug=%{BOOL}u", buf, 0x12u);

  }
  WeakRetained[16] = state64 != 0;
  objc_msgSend(WeakRetained, "flushEvents");

}

void __62__MPCPlaybackEngineEventStream_initWithDatabaseCreationBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(v6 + 24);
    v8 = *(void **)(v6 + 64);
    *(_DWORD *)buf = 138543618;
    v15 = v7;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_INFO, "[EVS:%{public}@] initWithDatabaseCreationBlock:… | created database [] database=%{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "transactionWithName:error:", CFSTR("schema"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v9, "executeStatementString:error:", CFSTR("CREATE TABLE IF NOT EXISTS events(identifier BLOB PRIMARY KEY, type TEXT, monoAbsolute INT, monoContinuous INT, monoTimebaseNS INT, userNS INT, threadPriority INT, payload TEXT, _ns INT UNIQUE GENERATED ALWAYS AS (monoTimebaseNS + monoContinuous) STORED)"), &v13);
  v10 = v13;
  if (v10)
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] initWithDatabaseCreationBlock:… | failed to create table [] error=%{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(v9, "executeStatementString:error:", CFSTR("CREATE UNIQUE INDEX IF NOT EXISTS events_ns ON events (_ns)"), 0);
  objc_msgSend(v9, "executeStatementString:error:", CFSTR("CREATE INDEX IF NOT EXISTS events_type ON events (type, _ns)"), 0);
  objc_msgSend(v9, "commit");

}

@end
