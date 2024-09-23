@implementation MPCAssistantCommandInternal

- (MPCAssistantCommandInternal)init
{
  MPCAssistantCommandInternal *v2;
  MPCAssistantSendCommand *v3;
  MPCAssistantSendCommand *sendCommand;
  MPCAssistantEndpointContext *v5;
  MPCAssistantEndpointContext *context;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *sendCommandQueue;
  uint64_t v10;
  NSMutableDictionary *analytics;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *analyticsQueue;
  dispatch_group_t v15;
  OS_dispatch_group *analyticsGroup;
  uint64_t v17;
  NSDate *startDate;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MPCAssistantCommandInternal;
  v2 = -[MPCAssistantCommandInternal init](&v20, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MPCAssistantSendCommand);
    sendCommand = v2->_sendCommand;
    v2->_sendCommand = v3;

    v5 = objc_alloc_init(MPCAssistantEndpointContext);
    context = v2->_context;
    v2->_context = v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.mediaplayer.assistant.MPCAssistantCommand.sendCommandQueue", v7);
    sendCommandQueue = v2->_sendCommandQueue;
    v2->_sendCommandQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    analytics = v2->_analytics;
    v2->_analytics = (NSMutableDictionary *)v10;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.mediaplayer.assistant.MPCAssistantCommand.sendCommandQueue", v12);
    analyticsQueue = v2->_analyticsQueue;
    v2->_analyticsQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_group_create();
    analyticsGroup = v2->_analyticsGroup;
    v2->_analyticsGroup = (OS_dispatch_group *)v15;

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v17 = objc_claimAutoreleasedReturnValue();
    startDate = v2->_startDate;
    v2->_startDate = (NSDate *)v17;

  }
  return v2;
}

- (void)sendCommandWithResult:(unsigned int)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  MPCAssistantCommandInternal *v19;
  MPCAssistantCommandInternal *v20;
  NSObject *v21;
  qos_class_t v22;
  void *v23;
  MPCAssistantCommandInternal *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  qos_class_t v42;
  void *v43;
  void **v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  MPCAssistantCommandInternal *v53;
  NSObject *v54;
  void *v55;
  MPCAssistantSendCommandResult *v56;
  void *v57;
  MPCAssistantCommandInternal *v58;
  MPCAssistantCommandInternal *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  MPCAssistantCommandInternal *v64;
  void *v65;
  void *v66;
  char v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  qos_class_t v90;
  void *v91;
  void *v92;
  char v93;
  NSObject *v94;
  void *v95;
  MPCAssistantSendCommandResult *v96;
  MPCAssistantSendCommandResult *v97;
  void *v98;
  char v99;
  NSObject *v100;
  __CFString *v101;
  NSObject *v102;
  NSObject *v103;
  MPCAssistantSendCommand *sendCommand;
  uint64_t v105;
  id v106;
  id v107;
  void *v108;
  MPCAssistantCommandInternal *v109;
  id v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  void *v115;
  MPCAssistantCommandInternal *v116;
  MPCAssistantCommandInternal *v117;
  id v119;
  void (**v120)(void *, MPCAssistantSendCommandResult *);
  MPCAssistantCommandInternal *v121;
  _QWORD v122[5];
  id v123;
  id v124;
  _QWORD v125[4];
  id v126;
  _QWORD v127[5];
  id v128;
  MPCAssistantCommandInternal *v129;
  id v130;
  id v131;
  id v132;
  unsigned int v133;
  char v134;
  _QWORD v135[4];
  MPCAssistantCommandInternal *v136;
  MPCAssistantCommandInternal *v137;
  void (**v138)(void *, MPCAssistantSendCommandResult *);
  id v139;
  _QWORD v140[4];
  void (**v141)(void *, MPCAssistantSendCommandResult *);
  _QWORD v142[4];
  void (**v143)(void *, MPCAssistantSendCommandResult *);
  _QWORD aBlock[4];
  MPCAssistantCommandInternal *v145;
  MPCAssistantCommandInternal *v146;
  id v147;
  id v148;
  id v149;
  qos_class_t v150;
  uint8_t buf[4];
  MPCAssistantCommandInternal *v152;
  __int16 v153;
  MPCAssistantCommandInternal *v154;
  __int16 v155;
  const __CFString *v156;
  uint64_t v157;

  v157 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BE658C0];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE658C0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  v121 = (MPCAssistantCommandInternal *)MRMediaRemoteCopyCommandDescription();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("sendCommand: %@"), v121);
  v19 = (MPCAssistantCommandInternal *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("%@<%@>"), v18, v16);
  v20 = v19;
  if (v9)
    -[MPCAssistantCommandInternal appendFormat:](v19, "appendFormat:", CFSTR(" for %@"), v9);
  v119 = v9;
  _MRLogForCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v152 = v20;
    _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }
  v117 = v20;

  v22 = qos_class_self();
  -[MPCAssistantCommandInternal _applyOriginatingDeviceUIDs:](self, "_applyOriginatingDeviceUIDs:", v119);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke;
  aBlock[3] = &unk_24CAB9AC0;
  v150 = v22;
  v116 = v18;
  v145 = v116;
  v24 = (MPCAssistantCommandInternal *)v16;
  v146 = v24;
  v25 = v23;
  v147 = v25;
  v114 = v12;
  v148 = v114;
  v26 = v11;
  v149 = v26;
  v120 = (void (**)(void *, MPCAssistantSendCommandResult *))_Block_copy(aBlock);
  v113 = v26;
  if (v10)
    v27 = (id)objc_msgSend(v10, "mutableCopy");
  else
    v27 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v28 = v27;
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, v13);
  v29 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "timeIntervalSinceReferenceDate");
  objc_msgSend(v29, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BE658A0]);

  objc_msgSend(v25, "originatingOutputDeviceUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BE65938]);

  v33 = *MEMORY[0x24BE65990];
  objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x24BE65990]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
    objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("com.apple.MediaAssistant"), v33);
  objc_msgSend(MEMORY[0x24BE65580], "currentSettings");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "supportPTOTRefactorPart2");

  if (!v36)
  {
    objc_msgSend(MEMORY[0x24BE65500], "localDeviceInfo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "deviceUID");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v45;
    objc_msgSend(v45, "clusterID");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("command"), v121);
    objc_msgSend(v25, "appBundleID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("appBundleID"), v46);

    v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v152 = v121;
      _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_DEFAULT, "Send Command: %{public}@", buf, 0xCu);
    }
    v110 = v10;

    v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v152 = self;
      v153 = 2112;
      v154 = v121;
      _os_log_impl(&dword_210BD8000, v48, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> sendCommandWithResult %@", buf, 0x16u);
    }

    objc_msgSend(v25, "outputDeviceUIDs");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      v50 = (void *)MEMORY[0x24BDD1618];
      objc_msgSend(v25, "outputDeviceUIDs");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = 0;
      objc_msgSend(v50, "archivedDataWithRootObject:requiringSecureCoding:error:", v51, 1, &v139);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (MPCAssistantCommandInternal *)v139;
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v52, *MEMORY[0x24BE658E8]);

      if (v53)
      {
        v54 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v152 = v53;
          _os_log_impl(&dword_210BD8000, v54, OS_LOG_TYPE_ERROR, "Encoding device IDs: %{public}@", buf, 0xCu);
        }

        MPCAssistantCreateError(8);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = -[MPCAssistantSendCommandResult initWithReturnStatuses:error:]([MPCAssistantSendCommandResult alloc], "initWithReturnStatuses:error:", 0, v55);
        v120[2](v120, v56);

        v57 = v119;
        v58 = v116;
        v59 = v117;
        v61 = v113;
        v60 = v114;
        goto LABEL_64;
      }
    }
    v109 = v24;
    objc_msgSend(v28, "objectForKeyedSubscript:", v33);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("source"), v62);

    v63 = MEMORY[0x24BDAC760];
    v135[0] = MEMORY[0x24BDAC760];
    v135[1] = 3221225472;
    v135[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_36;
    v135[3] = &unk_24CAB9B60;
    v64 = v121;
    v136 = v64;
    v137 = self;
    v138 = v120;
    v65 = _Block_copy(v135);
    objc_msgSend(MEMORY[0x24BE65580], "currentSettings");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "canHostMultiplayerStream");

    v127[0] = v63;
    v127[1] = 3221225472;
    v127[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_49;
    v127[3] = &unk_24CAB9D70;
    v127[4] = self;
    v68 = v25;
    v128 = v68;
    v129 = v64;
    v133 = a3;
    v69 = v28;
    v130 = v69;
    v107 = v65;
    v132 = v107;
    v70 = v112;
    v131 = v70;
    v134 = v67;
    v125[0] = v63;
    v125[1] = 3221225472;
    v125[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_4;
    v125[3] = &unk_24CAB9D98;
    v108 = _Block_copy(v127);
    v126 = v108;
    v71 = _Block_copy(v125);
    if (!v68)
    {
      v94 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      v57 = v119;
      v61 = v113;
      v60 = v114;
      v10 = v110;
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210BD8000, v94, OS_LOG_TYPE_ERROR, "No valid destination provided.", buf, 2u);
      }

      MPCAssistantCreateError(1);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = [MPCAssistantSendCommandResult alloc];
      v97 = -[MPCAssistantSendCommandResult initWithReturnStatuses:error:](v96, "initWithReturnStatuses:error:", MEMORY[0x24BDBD1A8], v95);
      v89 = v107;
      (*((void (**)(id, MPCAssistantSendCommandResult *))v107 + 2))(v107, v97);

      v58 = v116;
      v59 = v117;
      goto LABEL_63;
    }
    v106 = v69;
    v72 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v68, "outputDeviceUIDs");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "numberWithUnsignedInteger:", objc_msgSend(v73, "count"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("requestedUIDs"), v74);

    v75 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v68, "outputGroups");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "numberWithUnsignedInteger:", objc_msgSend(v76, "count"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("outputGroups"), v77);

    objc_msgSend(v68, "outputGroupID");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "length");
    v80 = MEMORY[0x24BDBD1C8];
    v81 = MEMORY[0x24BDBD1C0];
    if (v79)
      v82 = MEMORY[0x24BDBD1C8];
    else
      v82 = MEMORY[0x24BDBD1C0];
    -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("outputGroupIDPresent"), v82);

    if (objc_msgSend(v68, "singleGroup"))
      v83 = v80;
    else
      v83 = v81;
    -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("formGroup"), v83);
    objc_msgSend(v68, "outputGroups");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v110;
    if (!objc_msgSend(v84, "count"))
    {
      objc_msgSend(v68, "outputDeviceUIDs");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v85, "count"))
      {
        objc_msgSend(v68, "outputGroupID");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v86)
        {
          v105 = objc_msgSend(v68, "origin");

          if (!v105)
          {
            _MRLogForCategory();
            v88 = objc_claimAutoreleasedReturnValue();
            v58 = v116;
            v59 = v117;
            if (!os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
              goto LABEL_43;
            *(_DWORD *)buf = 138543874;
            v152 = v116;
            v153 = 2114;
            v154 = v109;
            v155 = 2112;
            v156 = CFSTR("No identifiers requested, processing locally.");
            goto LABEL_42;
          }
LABEL_38:
          v59 = v117;
          if (!objc_msgSend(v68, "singleGroup")
            || (objc_msgSend(v68, "outputGroupID"),
                v87 = (void *)objc_claimAutoreleasedReturnValue(),
                v87,
                !v87))
          {
            objc_msgSend(v68, "outputDeviceUIDs");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v92, "containsObject:", v70) & 1) != 0)
            {
              v93 = 0;
            }
            else
            {
              objc_msgSend(v68, "outputDeviceUIDs");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = objc_msgSend(v98, "containsObject:", v111);

              v93 = v99 ^ 1;
              v59 = v117;
            }

            if (!objc_msgSend(v68, "singleGroup") || (v93 & 1) != 0)
            {
              v101 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Send to destination: %@"), v68);
              _MRLogForCategory();
              v102 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v152 = v116;
                v153 = 2114;
                v154 = v109;
                v155 = 2112;
                v156 = v101;
                _os_log_impl(&dword_210BD8000, v102, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
              }

              v103 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
              if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v152 = (MPCAssistantCommandInternal *)v101;
                _os_log_impl(&dword_210BD8000, v103, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
              }

              -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("actualDestination"), CFSTR("remote"));
              sendCommand = self->_sendCommand;
              v122[0] = MEMORY[0x24BDAC760];
              v122[1] = 3221225472;
              v122[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_110;
              v122[3] = &unk_24CAB9DC8;
              v122[4] = self;
              v123 = v71;
              v124 = v107;
              -[MPCAssistantSendCommand sendMediaRemoteCommand:withOptions:toEndpointDestination:completion:](sendCommand, "sendMediaRemoteCommand:withOptions:toEndpointDestination:completion:", a3, v106, v68, v122);

              v89 = v107;
              v57 = v119;
              v58 = v116;
              v59 = v117;
            }
            else
            {
              _MRLogForCategory();
              v100 = objc_claimAutoreleasedReturnValue();
              v58 = v116;
              v89 = v107;
              if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v152 = v116;
                v153 = 2114;
                v154 = v109;
                v155 = 2112;
                v156 = CFSTR("Local identifier requested, processing locally.");
                _os_log_impl(&dword_210BD8000, v100, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
              }

              (*((void (**)(void *, uint64_t))v71 + 2))(v71, 1);
              v57 = v119;
            }
            v61 = v113;
            v60 = v114;
            goto LABEL_63;
          }
          _MRLogForCategory();
          v88 = objc_claimAutoreleasedReturnValue();
          v58 = v116;
          if (!os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
LABEL_43:

            (*((void (**)(void *, _QWORD))v71 + 2))(v71, 0);
            v57 = v119;
            v61 = v113;
            v60 = v114;
            v89 = v107;
LABEL_63:

            v53 = v136;
            v24 = v109;
LABEL_64:

            v91 = v112;
            goto LABEL_65;
          }
          *(_DWORD *)buf = 138543874;
          v152 = v116;
          v153 = 2114;
          v154 = v109;
          v155 = 2112;
          v156 = CFSTR("Existing group ID requested, processing locally.");
LABEL_42:
          _os_log_impl(&dword_210BD8000, v88, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
          goto LABEL_43;
        }

      }
    }

    goto LABEL_38;
  }
  v37 = (void *)objc_msgSend(v25, "createPlayerPath");
  v38 = objc_msgSend(v25, "singleGroup");
  v39 = (void *)MEMORY[0x24BE654C0];
  objc_msgSend(v25, "outputDeviceUIDs");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v37;
  if (v38)
  {
    objc_msgSend(v37, "client");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = qos_class_self();
    dispatch_get_global_queue(v42, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v142[0] = MEMORY[0x24BDAC760];
    v142[1] = 3221225472;
    v142[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_24;
    v142[3] = &unk_24CAB9AE8;
    v44 = (void **)&v143;
    v143 = v120;
    objc_msgSend(v39, "sendCommand:withOptions:toNewEndpointContainingOutputDeviceUIDs:nowPlayingClient:timeout:queue:completion:", a3, v28, v40, v41, v43, v142, 0.0);

  }
  else
  {
    v90 = qos_class_self();
    dispatch_get_global_queue(v90, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v140[0] = MEMORY[0x24BDAC760];
    v140[1] = 3221225472;
    v140[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2;
    v140[3] = &unk_24CAB9B10;
    v44 = (void **)&v141;
    v141 = v120;
    objc_msgSend(v39, "sendCommand:withOptions:toEachEndpointContainingOutputDeviceUIDs:timeout:queue:completion:", a3, v28, v40, v41, v140, 0.0);
  }
  v59 = v117;
  v60 = v114;

  v91 = *v44;
  v57 = v119;
  v58 = v116;
  v61 = v113;
LABEL_65:

}

- (void)sendPlaybackQueueWithResult:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  MPCAssistantCommandInternal *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v10;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "Send Queue: %{public}@", buf, 0xCu);
  }

  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __96__MPCAssistantCommandInternal_sendPlaybackQueueWithResult_toDestination_withOptions_completion___block_invoke;
  v22 = &unk_24CAB9E40;
  v23 = v10;
  v24 = v11;
  v25 = self;
  v26 = v12;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  v18 = _Block_copy(&v19);
  -[MPCAssistantCommandInternal _findOutputDevicesForDestination:options:completion:](self, "_findOutputDevicesForDestination:options:completion:", v13, v15, v18, v19, v20, v21, v22);

}

- (void)sendPlaybackArchiveWithResult:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  MPCAssistantCommandInternal *v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  MPCAssistantCommandInternal *v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  MPCAssistantCommandInternal *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  _QWORD aBlock[4];
  id v72;
  id v73;
  MPCAssistantCommandInternal *v74;
  id v75;
  id v76;
  uint8_t buf[4];
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v46 = a4;
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v78 = v10;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEBUG, "Send Playback Archive: %@", buf, 0xCu);
  }

  +[MPCAssistantRemoteControlDestination nowPlayingApplicationDestination](MPCAssistantRemoteControlDestination, "nowPlayingApplicationDestination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v16 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  v18 = *MEMORY[0x24BE658C8];
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE658C8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = v15;
  if (!v19)
  {
    v20 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v15, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v18);

    v17 = v20;
  }
  v22 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke;
  aBlock[3] = &unk_24CAB9E68;
  v23 = v10;
  v72 = v23;
  v24 = v17;
  v73 = v24;
  v74 = self;
  v25 = v14;
  v75 = v25;
  v26 = v12;
  v76 = v26;
  v27 = _Block_copy(aBlock);
  v64[0] = v22;
  v64[1] = 3221225472;
  v64[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_2;
  v64[3] = &unk_24CAB9EB8;
  v28 = v23;
  v65 = v28;
  v66 = self;
  v29 = v25;
  v67 = v29;
  v30 = v24;
  v68 = v30;
  v69 = v27;
  v31 = v26;
  v70 = v31;
  v45 = v27;
  v32 = _Block_copy(v64);
  v58[0] = v22;
  v58[1] = 3221225472;
  v58[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_4;
  v58[3] = &unk_24CAB9F08;
  v33 = v28;
  v59 = v33;
  v34 = v30;
  v60 = v34;
  v61 = self;
  v62 = v29;
  v35 = v32;
  v63 = v35;
  v36 = v29;
  v37 = _Block_copy(v58);
  v52[0] = v22;
  v52[1] = 3221225472;
  v52[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_7;
  v52[3] = &unk_24CAB9F30;
  v38 = v33;
  v53 = v38;
  v54 = v34;
  v55 = self;
  v56 = v31;
  v57 = v35;
  v39 = v35;
  v40 = v34;
  v41 = v31;
  v48[0] = v22;
  v48[1] = 3221225472;
  v48[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_3_126;
  v48[3] = &unk_24CAB9F58;
  v49 = v38;
  v50 = _Block_copy(v52);
  v51 = v37;
  v42 = v37;
  v43 = v50;
  v44 = v38;
  -[MPCAssistantCommandInternal _findOutputDevicesForDestination:options:completion:](self, "_findOutputDevicesForDestination:options:completion:", v46, v11, v48);

}

- (id)_applyOriginatingDeviceUIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  if ((objc_msgSend(v3, "originatingDeviceControl") & 1) == 0)
  {
    objc_msgSend(v3, "outputDeviceUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {

    }
    else
    {
      objc_msgSend(v3, "originatingOutputDeviceUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "originatingOutputDeviceUID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v14 = v8;
          _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "Originating device destination: %{public}@", buf, 0xCu);

        }
        objc_msgSend(v3, "originatingOutputDeviceUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setOutputDeviceUIDs:", v10);

        objc_msgSend(v4, "setSingleGroup:", 0);
        objc_msgSend(v4, "setOriginatingDeviceControl:", 1);
      }
    }
  }

  return v4;
}

- (void)_findOutputDevicesForDestination:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  qos_class_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void (**v29)(void *, void *);
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void (**v55)(void *, void *);
  _QWORD aBlock[4];
  __CFString *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  qos_class_t v62;
  uint8_t buf[4];
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE658C0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v52 = v9;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE658C8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v14 = v15;
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE658D8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v14 = v17;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("findOutputDevicesForDestination"), v14);
  v21 = v20;
  if (v8)
    objc_msgSend(v20, "appendFormat:", CFSTR(" for %@"), v8);
  _MRLogForCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v64 = v21;
    _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }
  v51 = v21;

  v23 = qos_class_self();
  -[MPCAssistantCommandInternal _applyOriginatingDeviceUIDs:](self, "_applyOriginatingDeviceUIDs:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__MPCAssistantCommandInternal__findOutputDevicesForDestination_options_completion___block_invoke;
  aBlock[3] = &unk_24CAB9F80;
  v62 = v23;
  v57 = CFSTR("findOutputDevicesForDestination");
  v25 = v14;
  v58 = v25;
  v59 = v24;
  v26 = v11;
  v60 = v26;
  v27 = v10;
  v61 = v27;
  v28 = v24;
  v29 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[MPCAssistantCommandInternal _applyOriginatingDeviceUIDs:](self, "_applyOriginatingDeviceUIDs:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE65580], "currentSettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "supportPTOTRefactorPart2");

  if (v32)
  {
    objc_msgSend(v30, "origin");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "isLocal"))
    {
      v34 = (void *)objc_msgSend(v30, "mutableCopy");
      objc_msgSend(v34, "outputDeviceUIDs");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCAssistantCommand.m"), 597, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!newDestination.outputDeviceUIDs"));

      }
      v36 = &unk_24CB17530;
      v37 = v34;
    }
    else
    {
      if (objc_msgSend(v33, "identifier") != 1129140302)
      {
        if (!v33)
          goto LABEL_25;
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCAssistantCommand.m"), 605, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!origin"));
        v34 = v30;
LABEL_24:

        v30 = v34;
LABEL_25:
        v29[2](v29, v30);

        goto LABEL_28;
      }
      v37 = (void *)objc_msgSend(v30, "mutableCopy");
      v34 = v37;
      v36 = &unk_24CB17548;
    }
    objc_msgSend(v37, "setOutputDeviceUIDs:", v36);
    v39 = v30;
    goto LABEL_24;
  }
  objc_msgSend(v30, "outputDeviceUIDs");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "count"))
  {

LABEL_27:
    v29[2](v29, v30);
    goto LABEL_28;
  }
  v40 = objc_msgSend(v30, "origin");

  if (v40)
    goto LABEL_27;
  objc_msgSend(MEMORY[0x24BE65500], "localDeviceInfo");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "deviceUID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE654C8], "sharedLocalEndpoint");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v42;
  if ((!v41 || objc_msgSend(v42, "isProxyGroupPlayer")) && MSVDeviceIsAudioAccessory())
  {
    v43 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v43, OS_LOG_TYPE_DEFAULT, "Found Default Destination: Proxy Promotion", buf, 2u);
    }

    -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("actualDestination"), CFSTR("proxy promotion"));
    v44 = (void *)objc_msgSend(v30, "mutableCopy");
    if (!v41)
    {
      objc_msgSend(v50, "uniqueIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v41);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setOutputDeviceUIDs:", v45);

    v29[2](v29, v44);
    v46 = v48;
  }
  else
  {
    v53 = v30;
    v55 = v29;
    v46 = v48;
    v54 = v48;
    MRAVEndpointGetMyGroupLeaderWithTimeout();

  }
LABEL_28:

}

- (void)_setAnalyticsKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NSObject *analyticsQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_group_enter((dispatch_group_t)self->_analyticsGroup);
  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__MPCAssistantCommandInternal__setAnalyticsKey_value___block_invoke;
  block[3] = &unk_24CABAA28;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(analyticsQueue, block);

}

- (void)_setAnalyticsError:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("success"), MEMORY[0x24BDBD1C0]);
    objc_msgSend(v6, "localizedFailureReason");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("errorString"), v4);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "code"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("errorCode"), v5);

  }
  else
  {
    -[MPCAssistantCommandInternal _setAnalyticsKey:value:](self, "_setAnalyticsKey:value:", CFSTR("success"), MEMORY[0x24BDBD1C8]);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_analyticsGroup, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_sendCommandQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sendCommand, 0);
}

void __54__MPCAssistantCommandInternal__setAnalyticsKey_value___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", a1[6], a1[5]);
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 48));
}

void __83__MPCAssistantCommandInternal__findOutputDevicesForDestination_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = qos_class_self();
  if (*(_DWORD *)(a1 + 72) != (_DWORD)v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("priority degraded from %u -> %u"), *(unsigned int *)(a1 + 72), v4);
    _MRLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v32 = v7;
      v33 = 2114;
      v34 = v8;
      v35 = 2112;
      v36 = v5;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

  }
  v9 = *(_QWORD *)(a1 + 48);
  _MRLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v9)
    {
      if (!v11)
        goto LABEL_18;
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v32 = v12;
      v33 = 2114;
      v34 = v13;
      v35 = 2112;
      v36 = v3;
      v37 = 2114;
      v38 = v14;
      v39 = 2048;
      v40 = v16;
      v17 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v18 = v10;
      v19 = 52;
      goto LABEL_17;
    }
    if (!v11)
      goto LABEL_18;
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v32 = v24;
    v33 = 2114;
    v34 = v25;
    v35 = 2112;
    v36 = v3;
    v37 = 2048;
    v38 = v26;
    v17 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_14;
  }
  if (v9)
  {
    if (!v11)
      goto LABEL_18;
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 40);
    v22 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v32 = v20;
    v33 = 2114;
    v34 = v21;
    v35 = 2114;
    v36 = v22;
    v37 = 2048;
    v38 = v23;
    v17 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_14:
    v18 = v10;
    v19 = 42;
    goto LABEL_17;
  }
  if (!v11)
    goto LABEL_18;
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
  *(_DWORD *)buf = 138543874;
  v32 = v27;
  v33 = 2114;
  v34 = v28;
  v35 = 2048;
  v36 = v29;
  v17 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
  v18 = v10;
  v19 = 32;
LABEL_17:
  _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);

LABEL_18:
  v30 = *(_QWORD *)(a1 + 64);
  if (v30)
    (*(void (**)(uint64_t, id))(v30 + 16))(v30, v3);

}

void __83__MPCAssistantCommandInternal__findOutputDevicesForDestination_options_completion___block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int IsAudioAccessory;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((MSVDeviceIsAppleTV() & 1) != 0)
  {
    if (!a2)
    {
LABEL_9:
      v10 = v5;
      if (objc_msgSend(v10, "code") == 33
        && (objc_msgSend(v10, "domain"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE65728]),
            v11,
            v12))
      {
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v23 = 138543362;
          v24 = 0;
          _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEBUG, "Group leader endpoint is: %{public}@", (uint8_t *)&v23, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "_setAnalyticsKey:value:", CFSTR("actualDestination"), CFSTR("group leader"));
        objc_msgSend(*(id *)(a1 + 48), "groupUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 138543362;
          v24 = v14;
          _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "Found Default Destination: WHA Group ID %{public}@", (uint8_t *)&v23, 0xCu);
        }

        v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
        objc_msgSend(v16, "setOutputGroupID:", v14);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      }
      else
      {
        v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        v18 = v17;
        if (v10)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "msv_description");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 138543618;
            v24 = 0;
            v25 = 2114;
            v26 = v19;
            _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_ERROR, "Group leader endpoint is: %{public}@ error=%{public}@", (uint8_t *)&v23, 0x16u);

          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v23 = 138543362;
          v24 = 0;
          _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEBUG, "Group leader endpoint is: %{public}@", (uint8_t *)&v23, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }

      goto LABEL_29;
    }
    goto LABEL_5;
  }
  IsAudioAccessory = MSVDeviceIsAudioAccessory();
  if (a2)
  {
LABEL_5:
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = a2;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "Found Default Destination: Group Leader %{public}@", (uint8_t *)&v23, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_setAnalyticsKey:value:", CFSTR("actualDestination"), CFSTR("group leader"));
    v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v27[0] = a2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOutputGroups:", v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_29;
  }
  if (IsAudioAccessory)
    goto LABEL_9;
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v21 = v20;
  if (v5)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "msv_description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = 0;
      v25 = 2114;
      v26 = v22;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_ERROR, "Group leader endpoint is: %{public}@ error=%{public}@", (uint8_t *)&v23, 0x16u);

    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v23 = 138543362;
    v24 = 0;
    _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEBUG, "Group leader endpoint is: %{public}@", (uint8_t *)&v23, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_29:

}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MPCAssistantSendCommandResult *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "BOOLValueForOption:", 3)
    && (objc_msgSend(*(id *)(a1 + 32), "supportedOptions") & 8) != 0)
  {
    v4 = (MPCAssistantSendCommandResult *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v11 = *MEMORY[0x24BE65978];
    v12[0] = &unk_24CB16F50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAssistantSendCommandResult addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", v5);

    v6 = *(void **)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_122;
    v8[3] = &unk_24CAB9E90;
    v10 = *(id *)(a1 + 64);
    v9 = v3;
    objc_msgSend(v6, "sendCommandWithResult:toDestination:withOptions:completion:", 135, v7, v4, v8);

    goto LABEL_6;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v4 = -[MPCAssistantSendCommandResult initWithCommandResult:error:]([MPCAssistantSendCommandResult alloc], "initWithCommandResult:error:", v3, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_6:

  }
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "BOOLValueForOption:", 1)
    && (objc_msgSend(*(id *)(a1 + 32), "supportedOptions") & 2) != 0)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_3;
    v7[3] = &unk_24CAB9E90;
    v8 = v3;
    v9 = *(id *)(a1 + 64);
    objc_msgSend(v4, "sendCommandWithResult:toDestination:withOptions:completion:", 134, v5, v6, v7);

  }
  else if (*(_QWORD *)(a1 + 72))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *ExternalRepresentation;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;

  v3 = a2;
  MRSystemAppPlaybackQueueCreate();
  objc_msgSend(*(id *)(a1 + 32), "playbackSessionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetCustomDataIdentifier();

  objc_msgSend(*(id *)(a1 + 32), "playbackSessionData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MRSystemAppPlaybackQueueSetCustomData();

  MRSystemAppPlaybackQueueSetReplaceIntent();
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  MRSystemAppPlaybackQueueDestroy();
  v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", ExternalRepresentation, *MEMORY[0x24BE659D8]);
  v8 = *MEMORY[0x24BE658D8];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE658D8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "playbackSessionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "playbackSessionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);
LABEL_4:

  }
  v11 = *(void **)(a1 + 48);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_5;
  v15[3] = &unk_24CAB9EE0;
  v16 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(void **)(a1 + 56);
  v17 = v12;
  v18 = v13;
  v19 = v14;
  v20 = *(id *)(a1 + 64);
  objc_msgSend(v11, "sendCommandWithResult:toDestination:withOptions:completion:", 122, v3, v7, v15);

}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const void *v7;
  void *ExternalRepresentation;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MPCAssistantSendCommandResult *v17;
  uint64_t v18;
  id v19;
  MPCAssistantSendCommandResult *v20;
  NSObject *v21;
  MPCAssistantSendCommandResult *v22;
  void *v23;
  _QWORD v24[4];
  MPCAssistantSendCommandResult *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  const void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playbackSessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playbackSessionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playbackSessionData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const void *)MRPlaybackSessionCreate();

  ExternalRepresentation = (void *)MRPlaybackSessionCreateExternalRepresentation();
  CFRelease(v7);
  if (ExternalRepresentation)
  {
    v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v30 = *MEMORY[0x24BE65958];
    v31 = ExternalRepresentation;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v10);

    if (objc_msgSend(*(id *)(a1 + 32), "BOOLValueForOption:", 2))
      v11 = 3;
    else
      v11 = 1;
    v12 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE65998]);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE658C0]);

    v16 = *(void **)(a1 + 48);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_124;
    v24[3] = &unk_24CAB9EE0;
    v17 = (MPCAssistantSendCommandResult *)*(id *)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 48);
    v25 = v17;
    v26 = v18;
    v27 = v3;
    v28 = v12;
    v29 = *(id *)(a1 + 64);
    v19 = v12;
    objc_msgSend(v16, "sendCommandWithResult:toDestination:withOptions:completion:", 133, v27, v9, v24);

    v20 = v25;
  }
  else
  {
    MPCAssistantCreateError(10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v7;
      v35 = 2112;
      v36 = v9;
      v37 = 2112;
      v38 = v19;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_ERROR, "Failed to create external representation from %@ with error %@ and status %@", buf, 0x20u);
    }

    v22 = [MPCAssistantSendCommandResult alloc];
    v32 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MPCAssistantSendCommandResult initWithReturnStatuses:error:](v22, "initWithReturnStatuses:error:", v23, v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_3_126(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v3 == 1)
  {
    v4 = a1 + 48;
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = a1 + 40;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v4 + 16))();
  }

}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "supportedOptions") & 2) != 0)
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_2_125;
    v9[3] = &unk_24CAB9DF0;
    v8 = *(_QWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    objc_msgSend(v6, "sendCommandWithResult:toDestination:withOptions:completion:", 25, v7, v8, v9);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v3, "commandResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_2_125(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "commandResult");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "supportedOptions") & 2) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "BOOLValueForOption:", 2))
      v6 = 3;
    else
      v6 = 1;
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE65998]);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE658C0]);

    v10 = *(void **)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_6;
    v12[3] = &unk_24CAB9DF0;
    v13 = *(id *)(a1 + 64);
    objc_msgSend(v10, "sendCommandWithResult:toDestination:withOptions:completion:", 25, v11, v5, v12);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v3, "commandResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }

}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "commandResult");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v6, "commandResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

void __98__MPCAssistantCommandInternal_sendPlaybackArchiveWithResult_toDestination_withOptions_completion___block_invoke_122(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  MPCAssistantSendCommandResult *v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    v7 = v3;
    objc_msgSend(*(id *)(a1 + 32), "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      v6 = -[MPCAssistantSendCommandResult initWithCommandResult:error:]([MPCAssistantSendCommandResult alloc], "initWithCommandResult:error:", *(_QWORD *)(a1 + 32), 0);
      (*(void (**)(uint64_t, MPCAssistantSendCommandResult *))(v5 + 16))(v5, v6);

    }
    else
    {
      (*(void (**)(_QWORD, id))(v5 + 16))(*(_QWORD *)(a1 + 40), v7);
    }
    v3 = v7;
  }

}

void __96__MPCAssistantCommandInternal_sendPlaybackQueueWithResult_toDestination_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __96__MPCAssistantCommandInternal_sendPlaybackQueueWithResult_toDestination_withOptions_completion___block_invoke_2;
  v8[3] = &unk_24CAB9E18;
  v13 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v12 = v3;
  v7 = v3;
  objc_msgSend(v4, "getPlaybackQueueWithDestination:completion:", v7, v8);

}

void __96__MPCAssistantCommandInternal_sendPlaybackQueueWithResult_toDestination_withOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  MPCAssistantSendCommandResult *v8;
  MPCAssistantSendCommandResult *v9;
  void *v10;
  uint64_t v11;
  void *ExternalRepresentation;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v10 = *(void **)(a1 + 32);
    if (v10)
    {
      v11 = objc_msgSend(v10, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (MPCAssistantSendCommandResult *)v11;
    objc_msgSend(objc_retainAutorelease(v5), "_mediaRemotePlaybackQueue");
    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
    if (ExternalRepresentation)
      -[MPCAssistantSendCommandResult setObject:forKey:](v9, "setObject:forKey:", ExternalRepresentation, *MEMORY[0x24BE659D8]);
    objc_msgSend(*(id *)(a1 + 40), "contextID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "contextID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCAssistantSendCommandResult setObject:forKey:](v9, "setObject:forKey:", v14, *MEMORY[0x24BE658D8]);

    }
    objc_msgSend(*(id *)(a1 + 40), "userIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDD1618];
      objc_msgSend(*(id *)(a1 + 40), "userIdentity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      objc_msgSend(v16, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v35);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v35;

      if (v19)
      {
        v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v19, "msv_description");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v18;
          v38 = 2114;
          v39 = v21;
          _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_ERROR, "Send Queue (User Identity): %{public}@ error=%{public}@", buf, 0x16u);

        }
      }
      else
      {
        -[MPCAssistantSendCommandResult setObject:forKey:](v9, "setObject:forKey:", v18, *MEMORY[0x24BE659E8]);
        v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v37 = v18;
          _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEBUG, "Send Queue (User Identity): %{public}@", buf, 0xCu);
        }
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "homeKitUserIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 40), "homeKitUserIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCAssistantSendCommandResult setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BE65900]);

    }
    v24 = objc_alloc(MEMORY[0x24BEC87B0]);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "processName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.MediaPlaybackCore.performRemoteQueueCommand-"), "stringByAppendingString:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v24, "initWithName:", v27);

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 60.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setExpirationDate:", v29);

    objc_msgSend(MEMORY[0x24BEC87A8], "sharedService");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAssertion:", v28);

    v31 = *(void **)(a1 + 48);
    v32 = *(_QWORD *)(a1 + 56);
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __96__MPCAssistantCommandInternal_sendPlaybackQueueWithResult_toDestination_withOptions_completion___block_invoke_116;
    v33[3] = &unk_24CAB9DF0;
    v34 = *(id *)(a1 + 64);
    objc_msgSend(v31, "sendCommandWithResult:toDestination:withOptions:completion:", 122, v32, v9, v33);

    goto LABEL_21;
  }
  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
  {
    v8 = [MPCAssistantSendCommandResult alloc];
    v9 = -[MPCAssistantSendCommandResult initWithReturnStatuses:error:](v8, "initWithReturnStatuses:error:", MEMORY[0x24BDBD1A8], v6);
    (*(void (**)(uint64_t, MPCAssistantSendCommandResult *))(v7 + 16))(v7, v9);
LABEL_21:

  }
}

uint64_t __96__MPCAssistantCommandInternal_sendPlaybackQueueWithResult_toDestination_withOptions_completion___block_invoke_116(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = qos_class_self();
  if (*(_DWORD *)(a1 + 72) != (_DWORD)v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("priority degraded from %u -> %u"), *(unsigned int *)(a1 + 72), v4);
    _MRLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v49 = v7;
      v50 = 2114;
      v51 = v8;
      v52 = 2112;
      v53 = v5;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

  }
  objc_msgSend(v3, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !v9)
  {
    v10 = *(_QWORD *)(a1 + 48);
    _MRLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v12)
        goto LABEL_27;
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v49 = v13;
      v50 = 2114;
      v51 = v14;
      v52 = 2112;
      v53 = v3;
      v54 = 2114;
      v55 = v15;
      v56 = 2048;
      v57 = v17;
      v18 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v19 = v11;
      v20 = 52;
      goto LABEL_20;
    }
    if (!v12)
      goto LABEL_27;
    v38 = *(_QWORD *)(a1 + 32);
    v39 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v49 = v38;
    v50 = 2114;
    v51 = v39;
    v52 = 2112;
    v53 = v3;
    v54 = 2048;
    v55 = v40;
    v18 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_19;
  }
  objc_msgSend(v3, "error");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *(_QWORD *)(a1 + 48);
  _MRLogForCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  v11 = v23;
  if (v21)
  {
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (!v24)
        goto LABEL_27;
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v49 = v25;
      v50 = 2114;
      v51 = v26;
      v52 = 2114;
      v53 = v16;
      v54 = 2114;
      v55 = v27;
      v56 = 2048;
      v57 = v29;
      v30 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      v31 = v11;
      v32 = 52;
      goto LABEL_24;
    }
    if (v24)
    {
      v41 = *(_QWORD *)(a1 + 32);
      v42 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v49 = v41;
      v50 = 2114;
      v51 = v42;
      v52 = 2114;
      v53 = v16;
      v54 = 2048;
      v55 = v43;
      v30 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
      v31 = v11;
      v32 = 42;
LABEL_24:
      _os_log_error_impl(&dword_210BD8000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);

      goto LABEL_21;
    }
  }
  else
  {
    v33 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (!v33)
        goto LABEL_27;
      v34 = *(_QWORD *)(a1 + 32);
      v35 = *(_QWORD *)(a1 + 40);
      v36 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v49 = v34;
      v50 = 2114;
      v51 = v35;
      v52 = 2114;
      v53 = v36;
      v54 = 2048;
      v55 = v37;
      v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_19:
      v19 = v11;
      v20 = 42;
LABEL_20:
      _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
LABEL_21:

      goto LABEL_27;
    }
    if (v33)
    {
      v44 = *(_QWORD *)(a1 + 32);
      v45 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138543874;
      v49 = v44;
      v50 = 2114;
      v51 = v45;
      v52 = 2048;
      v53 = v46;
      v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v11;
      v20 = 32;
      goto LABEL_20;
    }
  }
LABEL_27:

  v47 = *(_QWORD *)(a1 + 64);
  if (v47)
    (*(void (**)(uint64_t, id))(v47 + 16))(v47, v3);

}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  MPCAssistantSendCommandResult *v5;

  v4 = a3;
  v5 = -[MPCAssistantSendCommandResult initWithCommandResult:error:]([MPCAssistantSendCommandResult alloc], "initWithCommandResult:error:", v4, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  MPCAssistantSendCommandResult *v7;
  void *v8;
  MPCAssistantSendCommandResult *v9;

  v5 = a3;
  v6 = a2;
  v7 = [MPCAssistantSendCommandResult alloc];
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MPCAssistantSendCommandResult initWithCommandResult:error:](v7, "initWithCommandResult:error:", v8, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int IsInformational;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  double v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IsInformational = MRMediaRemoteErrorIsInformational();

    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    v8 = v7;
    if (IsInformational)
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "returnStatuses");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v9;
      v37 = 2114;
      v38 = v10;
      v39 = 2114;
      v40 = v11;
      v12 = "Send Command Result: %{public}@, [%{public}@] informational: %{public}@";
      v13 = v8;
      v14 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      v16 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "returnStatuses");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v16;
      v37 = 2114;
      v38 = v10;
      v39 = 2114;
      v40 = v11;
      v12 = "Send Command Result: %{public}@, [%{public}@] error: %{public}@";
      v13 = v8;
      v14 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_210BD8000, v13, v14, v12, buf, 0x20u);

  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "returnStatuses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v15;
    v37 = 2114;
    v38 = v10;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "Send Command Result: %{public}@, [%{public}@]", buf, 0x16u);
  }

LABEL_11:
  v17 = *(void **)(a1 + 40);
  objc_msgSend(v3, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setAnalyticsError:", v18);

  objc_msgSend(v3, "returnStatuses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    objc_msgSend(v3, "returnStatuses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_setAnalyticsKey:value:", CFSTR("resultCodes"), v22);
  }
  v23 = *(id **)(a1 + 40);
  v24 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v23[7], "timeIntervalSinceNow");
  objc_msgSend(v24, "numberWithDouble:", fabs(v25));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setAnalyticsKey:value:", CFSTR("duration"), v26);

  v27 = *(_QWORD *)(a1 + 40);
  v29 = *(NSObject **)(v27 + 40);
  v28 = *(NSObject **)(v27 + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_43;
  block[3] = &unk_24CABA2D0;
  block[4] = v27;
  dispatch_group_notify(v28, v29, block);
  if (*(_QWORD *)(a1 + 48))
  {
    v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "error");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "commandResult");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v36 = v31;
      v37 = 2112;
      v38 = v32;
      v39 = 2112;
      v40 = v33;
      _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Completing with error %@, commandResult: %@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_49(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD);
  int IsGroupLeader;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void (**v15)(_QWORD);
  _QWORD aBlock[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  int v22;
  char v23;
  char v24;
  uint8_t buf[16];

  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEBUG, "Attempting local device system music context modification to prepare for local playback.", buf, 2u);
  }

  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "Send to destination: LOCAL", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setAnalyticsKey:value:", CFSTR("actualDestination"), CFSTR("local"));
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_54;
  aBlock[3] = &unk_24CAB9D20;
  v6 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v17 = v6;
  v23 = a2;
  v18 = *(id *)(a1 + 48);
  v22 = *(_DWORD *)(a1 + 80);
  v19 = *(id *)(a1 + 56);
  v21 = *(id *)(a1 + 72);
  v20 = *(id *)(a1 + 64);
  v24 = *(_BYTE *)(a1 + 84);
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  IsGroupLeader = MRMediaRemoteGetIsGroupLeader();
  if (*(_BYTE *)(a1 + 84) || !IsGroupLeader)
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 40), "outputGroupID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "outputDeviceUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v12 = *(_DWORD *)(a1 + 80);

      if (v12 == 122)
        goto LABEL_12;
    }
    else
    {

    }
LABEL_14:
    v7[2](v7);
    goto LABEL_15;
  }
  v10 = *(_DWORD *)(a1 + 80);

  if (v10 != 122)
    goto LABEL_14;
LABEL_12:
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("When processing %@ if we are the group leader, pause our now-playing app if we have one"), *(_QWORD *)(a1 + 48));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE65990]);

  v15 = v7;
  MRMediaRemoteSendCommandWithReply();

LABEL_15:
}

uint64_t __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_110(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v3 = (void *)a1[4];
  objc_msgSend(v8, "devicesControlled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAnalyticsKey:value:", CFSTR("actualDeviceCount"), v4);

  objc_msgSend(v8, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_4;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("MPAssistantErrorDomain")) & 1) == 0)
  {

    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "code");

  if (v7 != 2)
  {
LABEL_6:
    (*(void (**)(void))(a1[6] + 16))();
    goto LABEL_7;
  }
LABEL_4:
  (*(void (**)(void))(a1[5] + 16))();
LABEL_7:

}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  int v10;
  char v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  char v19;
  char v20;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v2 + 16);
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_55;
  v12[3] = &unk_24CAB9CD0;
  v19 = *(_BYTE *)(a1 + 84);
  v12[4] = v2;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 40);
  v18 = *(_DWORD *)(a1 + 80);
  v15 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 72);
  v16 = *(id *)(a1 + 64);
  v20 = *(_BYTE *)(a1 + 85);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_84;
  v6[3] = &unk_24CAB9CF8;
  v11 = *(_BYTE *)(a1 + 84);
  v6[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_DWORD *)(a1 + 80);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v4, "modifySystemMusicContextForEndpointDestination:discoveryHandler:completion:", v3, v12, v6);

}

uint64_t __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_3_89(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_55(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  MPCAssistantSendCommandResult *v59;
  MPCAssistantSendCommandResult *v60;
  void (**v61)(_QWORD, void *);
  void (**v62)(_QWORD, _QWORD);
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  id obj;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[5];
  id v73;
  void (**v74)(_QWORD, _QWORD);
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[5];
  id v84;
  id v85;
  id v86;
  _QWORD aBlock[5];
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  int v93;
  _BYTE v94[128];
  uint8_t v95[128];
  uint8_t buf[4];
  uint64_t v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v68 = a3;
  v8 = a4;
  if (_os_feature_enabled_impl() && *(_BYTE *)(a1 + 84))
  {
    v9 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_3;
    aBlock[3] = &unk_24CAB9BB0;
    v10 = *(void **)(a1 + 40);
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v88 = v10;
    v89 = *(id *)(a1 + 48);
    v93 = *(_DWORD *)(a1 + 80);
    v90 = *(id *)(a1 + 56);
    v91 = *(id *)(a1 + 72);
    v92 = v8;
    v11 = _Block_copy(aBlock);
    v83[0] = v9;
    v83[1] = 3221225472;
    v83[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_60;
    v83[3] = &unk_24CAB9C00;
    v83[4] = *(_QWORD *)(a1 + 32);
    v84 = *(id *)(a1 + 64);
    v85 = *(id *)(a1 + 72);
    v12 = v11;
    v86 = v12;
    v13 = _Block_copy(v83);
    v14 = v13;
    if (!v68)
    {
      objc_msgSend(*(id *)(a1 + 48), "outputDeviceUIDs");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v46, "count"))
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "outputGroupID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v54)
        {
          (*((void (**)(id, id))v12 + 2))(v12, v7);
          goto LABEL_50;
        }
      }
      v55 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v56 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v97 = v56;
        _os_log_impl(&dword_210BD8000, v55, OS_LOG_TYPE_ERROR, "Expected to find devices for destination %@, but none found.", buf, 0xCu);
      }

      MPCAssistantCreateError(1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = *(_QWORD *)(a1 + 72);
      v59 = [MPCAssistantSendCommandResult alloc];
      v60 = -[MPCAssistantSendCommandResult initWithReturnStatuses:error:](v59, "initWithReturnStatuses:error:", MEMORY[0x24BDBD1A8], v57);
      (*(void (**)(uint64_t, MPCAssistantSendCommandResult *))(v58 + 16))(v58, v60);

      goto LABEL_50;
    }
    v61 = (void (**)(_QWORD, void *))v13;
    v62 = (void (**)(_QWORD, _QWORD))v12;
    v64 = v8;
    v65 = v7;
    objc_msgSend(v7, "outputDevices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v15, "msv_map:", &__block_literal_global_28118);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v97 = v17;
      v98 = 2112;
      v99 = v18;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Checking existing devices on target endpoint: %@ ", buf, 0x16u);

    }
    v63 = a1;

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v15;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v80 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v24 = v68;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v94, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v76;
            while (2)
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v76 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
                objc_msgSend(v23, "uid");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v29) = objc_msgSend(v29, "containsUID:", v30);

                if ((v29 & 1) != 0)
                {

                  goto LABEL_21;
                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v94, 16);
              if (v26)
                continue;
              break;
            }
          }

          objc_msgSend(v66, "addObject:", v23);
LABEL_21:
          ;
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
      }
      while (v20);
    }

    v31 = v66;
    if (objc_msgSend(v66, "count"))
    {
      objc_msgSend(*(id *)(v63 + 48), "outputDeviceUIDs");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v65;
      v14 = v61;
      v12 = v62;
      if (objc_msgSend(v32, "count"))
      {
        v33 = *(unsigned __int8 *)(v63 + 85);

        v8 = v64;
        if (v33)
        {
          v34 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v66, "msv_map:", &__block_literal_global_73_28120);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("unmatched existing devices: %@"), v35);

          v61[2](v61, v36);
          goto LABEL_45;
        }
      }
      else
      {

        v8 = v64;
      }
      v49 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = *(_QWORD *)(v63 + 32);
        objc_msgSend(v66, "msv_map:", &__block_literal_global_75_28122);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v97 = v50;
        v31 = v66;
        v98 = 2112;
        v99 = v51;
        _os_log_impl(&dword_210BD8000, v49, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Removing unmatched existing devices: %@ ", buf, 0x16u);

      }
      v52 = *(_QWORD *)(v63 + 32);
      v53 = *(_QWORD *)(v52 + 24);
      v72[0] = MEMORY[0x24BDAC760];
      v72[1] = 3221225472;
      v72[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_78;
      v72[3] = &unk_24CAB9CA8;
      v72[4] = v52;
      v74 = v62;
      v73 = v65;
      objc_msgSend(v73, "removeOutputDevices:initiator:withReplyQueue:completion:", v31, CFSTR("MPCAssistantCommand-removeUnwantedDevices"), v53, v72);

      goto LABEL_45;
    }
    v7 = v65;
    v12 = v62;
    v14 = v61;
    if ((objc_msgSend(v65, "isLocalEndpoint") & 1) != 0 || objc_msgSend(v65, "connectionType") == 6)
    {
      v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      v8 = v64;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = *(_QWORD *)(v63 + 32);
        *(_DWORD *)buf = 134218242;
        v97 = v48;
        v98 = 2112;
        v99 = v65;
        _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Found suitable endpoint %@ ", buf, 0x16u);
      }

    }
    else
    {
      v8 = v64;
      if (*(_BYTE *)(v63 + 85))
      {
        v61[2](v61, CFSTR("Belong to remote endpoint"));
        goto LABEL_45;
      }
    }
    ((void (**)(_QWORD, void *))v62)[2](v62, v65);
LABEL_45:

LABEL_50:
    v45 = v88;
LABEL_51:

    goto LABEL_52;
  }
  if (*(_BYTE *)(a1 + 85))
  {
    objc_msgSend(*(id *)(a1 + 48), "outputDeviceUIDs");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "count");

    if (v38)
    {
      v39 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 48), "outputDeviceUIDs");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v97 = v40;
        v98 = 2112;
        v99 = v41;
        _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Create hosted endpoint for routes %@ ", buf, 0x16u);

      }
      v42 = (void *)MEMORY[0x24BE654C0];
      objc_msgSend(*(id *)(a1 + 48), "outputDeviceUIDs");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_82;
      v69[3] = &unk_24CAB9BD8;
      v70 = *(id *)(a1 + 72);
      v71 = v8;
      objc_msgSend(v42, "hostedEndpointForOutputDeviceUIDs:queue:completion:", v43, v44, v69);

      v45 = v70;
      goto LABEL_51;
    }
  }
  (*((void (**)(id, id))v8 + 2))(v8, v7);
LABEL_52:

}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  MPCAssistantSendCommandResult *v10;
  MPCAssistantSendCommandResult *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (!_os_feature_enabled_impl() || !*(_BYTE *)(a1 + 68))
  {
    MRAVOutputContextGetSharedAudioPresentationContext();
    v6 = (void *)MRAVOutputContextCopyOutputDevices();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setAnalyticsKey:value:", CFSTR("actualDeviceCount"), v8);

    if (v5)
    {
      v9 = *(_QWORD *)(a1 + 56);
      v10 = [MPCAssistantSendCommandResult alloc];
      v11 = -[MPCAssistantSendCommandResult initWithReturnStatuses:error:](v10, "initWithReturnStatuses:error:", MEMORY[0x24BDBD1A8], v5);
      (*(void (**)(uint64_t, MPCAssistantSendCommandResult *))(v9 + 16))(v9, v11);

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendCommand:withOptions:toEndpoint:toDestination:completion:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), v12, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }

  }
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Sending command %@ to destination %@ endpoint %@", buf, 0x2Au);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = *(void **)(v8 + 8);
  v11 = *(unsigned int *)(a1 + 80);
  v15[0] = MEMORY[0x24BDAC760];
  v15[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_58;
  v15[3] = &unk_24CAB9B88;
  v13 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v15[1] = 3221225472;
  v15[4] = v8;
  v16 = v9;
  v18 = *(id *)(a1 + 64);
  v19 = *(id *)(a1 + 72);
  v17 = v3;
  v14 = v3;
  objc_msgSend(v10, "sendCommand:withOptions:toEndpoint:toDestination:completion:", v11, v12, v14, v13, v15);

}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v14 = v5;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Creating hosted endpoint for local because %{public}@", buf, 0x16u);
  }

  v6 = (void *)MEMORY[0x24BE654C0];
  v12 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_62;
  v9[3] = &unk_24CAB9BD8;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v6, "hostedEndpointForOutputDeviceUIDs:queue:completion:", v7, v8, v9);

}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Removal completed with error %@ ", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_82(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  MPCAssistantSendCommandResult *v5;
  MPCAssistantSendCommandResult *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = [MPCAssistantSendCommandResult alloc];
    v6 = -[MPCAssistantSendCommandResult initWithReturnStatuses:error:](v5, "initWithReturnStatuses:error:", MEMORY[0x24BDBD1A8], v7);
    (*(void (**)(uint64_t, MPCAssistantSendCommandResult *))(v4 + 16))(v4, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

id __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_74(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_72(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_66(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_62(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  MPCAssistantSendCommandResult *v5;
  MPCAssistantSendCommandResult *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = [MPCAssistantSendCommandResult alloc];
    v6 = -[MPCAssistantSendCommandResult initWithReturnStatuses:error:](v5, "initWithReturnStatuses:error:", MEMORY[0x24BDBD1A8], v7);
    (*(void (**)(uint64_t, MPCAssistantSendCommandResult *))(v4 + 16))(v4, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_58(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v8 = 134218498;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[KAOS] <%p> Command %@ completed with result: %@", (uint8_t *)&v8, 0x20u);
  }

  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "Command completed", (uint8_t *)&v8, 2u);
  }

  (*(void (**)(void))(a1[7] + 16))();
  (*(void (**)(void))(a1[8] + 16))();

}

uint64_t __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_43()
{
  return AnalyticsSendEventLazy();
}

id __90__MPCAssistantCommandInternal_sendCommandWithResult_toDestination_withOptions_completion___block_invoke_2_46(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

@end
