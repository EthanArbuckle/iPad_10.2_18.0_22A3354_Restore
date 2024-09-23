@implementation BGSystemTaskRequest

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.BackgroundSystemTasks", "BGSTFramework");
    v3 = (void *)_log_0;
    _log_0 = (uint64_t)v2;

  }
}

+ (BGSystemTaskRequest)taskRequestWithDescriptor:(id)a3 withIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BGNonRepeatingSystemTaskRequest *p_super;
  uint64_t v12;
  void *v13;
  void *v14;
  BGFastPassSystemTaskRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  BGFastPassSystemTaskRequest *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  BGNonRepeatingSystemTaskRequest *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  const char *string;
  const char *v37;
  NSObject *v38;
  BGRepeatingSystemTaskRequest *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  BGNonRepeatingSystemTaskRequest *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  const char *v66;
  void *v67;
  void *v68;
  BOOL v69;
  void *v70;
  int64_t int64;
  const char *v72;
  void *v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  const char *v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  const char *v90;
  void *v91;
  const char *v92;
  const char *v93;
  void *v94;
  void *v95;
  char v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  NSObject *v100;
  _BOOL8 v102;
  uint64_t v103;
  char v104;
  const char *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t, void *);
  void *v110;
  id v111;
  _BYTE *v112;
  _BYTE buf[24];
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x1D17E748C](v5);
  v8 = MEMORY[0x1E0C812F8];
  if (v7 != MEMORY[0x1E0C812F8])
    +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.12();
  xpc_dictionary_get_dictionary(v5, "RepeatingTask");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9 || MEMORY[0x1D17E748C](v9) != v8)
  {
    p_super = -[BGNonRepeatingSystemTaskRequest initWithIdentifier:]([BGNonRepeatingSystemTaskRequest alloc], "initWithIdentifier:", v6);
    xpc_dictionary_get_dictionary(v5, "NonRepeatingTask");
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12 && MEMORY[0x1D17E748C](v12) == v8)
    {
      v13 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      objc_msgSend(v13, "objectForKey:", CFSTR("FastPassTask"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = -[BGFastPassSystemTaskRequest initWithIdentifier:]([BGFastPassSystemTaskRequest alloc], "initWithIdentifier:", v6);
        objc_msgSend(v14, "objectForKey:", CFSTR("ProcessingTaskIdentifiers"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "count"))
          -[BGFastPassSystemTaskRequest setProcessingTaskIdentifiers:](v15, "setProcessingTaskIdentifiers:", v16);
        objc_msgSend(v14, "objectForKey:", CFSTR("SemanticVersion"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BGFastPassSystemTaskRequest setSemanticVersion:](v15, "setSemanticVersion:", (int)objc_msgSend(v17, "intValue"));

        objc_msgSend(v14, "objectForKey:", CFSTR("ReRun"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BGFastPassSystemTaskRequest setReRun:](v15, "setReRun:", objc_msgSend(v18, "BOOLValue"));

        v19 = v15;
        p_super = &v19->super;
      }
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ScheduleAfter"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGNonRepeatingSystemTaskRequest setScheduleAfter:](p_super, "setScheduleAfter:", (double)(int)objc_msgSend(v20, "intValue"));

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TrySchedulingBefore"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGNonRepeatingSystemTaskRequest setTrySchedulingBefore:](p_super, "setTrySchedulingBefore:", (double)(int)objc_msgSend(v21, "intValue"));

      -[BGNonRepeatingSystemTaskRequest trySchedulingBefore](p_super, "trySchedulingBefore");
      if (v22 != 0.0)
      {
        -[BGNonRepeatingSystemTaskRequest trySchedulingBefore](p_super, "trySchedulingBefore");
        v24 = v23;
        -[BGNonRepeatingSystemTaskRequest scheduleAfter](p_super, "scheduleAfter");
        if (v24 < v25)
        {
          v26 = (id)_log_0;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            -[BGNonRepeatingSystemTaskRequest trySchedulingBefore](p_super, "trySchedulingBefore");
            v28 = v27;
            -[BGNonRepeatingSystemTaskRequest scheduleAfter](p_super, "scheduleAfter");
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v6;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v28;
            *(_WORD *)&buf[22] = 2048;
            v114 = v29;
            _os_log_impl(&dword_1D13A5000, v26, OS_LOG_TYPE_INFO, "%{public}@: trySchedulingBefore %f is earlier than scheduleAfter %f. Adjusting.", buf, 0x20u);
          }

          -[BGNonRepeatingSystemTaskRequest scheduleAfter](p_super, "scheduleAfter");
          -[BGNonRepeatingSystemTaskRequest setTrySchedulingBefore:](p_super, "setTrySchedulingBefore:");
        }
      }

    }
    v30 = p_super;

    v10 = (void *)v12;
    if (v30)
      goto LABEL_17;
LABEL_34:
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.1();
    goto LABEL_161;
  }
  v39 = -[BGRepeatingSystemTaskRequest initWithIdentifier:]([BGRepeatingSystemTaskRequest alloc], "initWithIdentifier:", v6);
  v40 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("Interval"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[BGRepeatingSystemTaskRequest setInterval:](v39, "setInterval:", (double)(int)objc_msgSend(v41, "intValue"));

  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("MinDurationBetweenInstances"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[BGRepeatingSystemTaskRequest setMinDurationBetweenInstances:](v39, "setMinDurationBetweenInstances:", (double)(int)objc_msgSend(v42, "intValue"));

  -[BGRepeatingSystemTaskRequest minDurationBetweenInstances](v39, "minDurationBetweenInstances");
  if (v43 == 0.0
    || (-[BGRepeatingSystemTaskRequest minDurationBetweenInstances](v39, "minDurationBetweenInstances"),
        v45 = v44,
        -[BGRepeatingSystemTaskRequest interval](v39, "interval"),
        v45 > v46))
  {
    -[BGRepeatingSystemTaskRequest interval](v39, "interval");
    -[BGRepeatingSystemTaskRequest setMinDurationBetweenInstances:](v39, "setMinDurationBetweenInstances:", v47 * 0.8);
  }
  v30 = v39;

  if (!v30)
    goto LABEL_34;
LABEL_17:
  xpc_dictionary_get_array(v5, "FeatureCodes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = MEMORY[0x1E0C812C8];
  if (v31 && MEMORY[0x1D17E748C](v31) == v32)
  {
    v33 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (!objc_msgSend(v33, "count"))
    {
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
        +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.11();

      goto LABEL_44;
    }
    -[BGSystemTaskRequest setFeatureCodes:](v30, "setFeatureCodes:", v33);

  }
  if (-[BGNonRepeatingSystemTaskRequest isMemberOfClass:](v30, "isMemberOfClass:", objc_opt_class()))
  {
    -[BGSystemTaskRequest featureCodes](v30, "featureCodes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34 == 0;

    if (v35)
    {
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
        +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.2();
      goto LABEL_44;
    }
  }
  -[BGSystemTaskRequest setPostInstall:](v30, "setPostInstall:", xpc_dictionary_get_BOOL(v5, "PostInstall"));
  -[BGSystemTaskRequest setPriority:](v30, "setPriority:", 1);
  -[BGSystemTaskRequest setRequiresExternalPower:](v30, "setRequiresExternalPower:", 1);
  string = xpc_dictionary_get_string(v5, "Priority");
  v37 = string;
  if (!string)
  {
    if (!-[BGNonRepeatingSystemTaskRequest isMemberOfClass:](v30, "isMemberOfClass:", objc_opt_class()))
      goto LABEL_46;
    goto LABEL_37;
  }
  if (!strcmp(string, "Maintenance"))
    goto LABEL_46;
  if (!strcmp(v37, "Utility"))
  {
LABEL_37:
    -[BGSystemTaskRequest setPriority:](v30, "setPriority:", 2);
    -[BGSystemTaskRequest setRequiresExternalPower:](v30, "setRequiresExternalPower:", 0);
    goto LABEL_46;
  }
  if (!strcmp(v37, "UserInitiated"))
  {
    -[BGSystemTaskRequest setPriority:](v30, "setPriority:", 3);
    -[BGSystemTaskRequest setRequiresExternalPower:](v30, "setRequiresExternalPower:", 0);
  }
  else
  {
    v38 = (id)_log_0;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.10((uint64_t)v6, (uint64_t)v37, v38);

  }
LABEL_46:
  xpc_dictionary_get_value(v5, "RequiresExternalPower");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    -[BGSystemTaskRequest setRequiresExternalPower:](v30, "setRequiresExternalPower:", xpc_BOOL_get_value(v49));
    -[BGSystemTaskRequest setRequiresExternalPowerIsSetByUser:](v30, "setRequiresExternalPowerIsSetByUser:", 1);
  }
  -[BGSystemTaskRequest setRandomInitialDelay:](v30, "setRandomInitialDelay:", (double)xpc_dictionary_get_int64(v5, "RandomInitialDelay"));
  -[BGSystemTaskRequest setExpectedDuration:](v30, "setExpectedDuration:", (double)xpc_dictionary_get_int64(v5, "ExpectedDuration"));
  xpc_dictionary_get_array(v5, "RelatedApplications");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50 && MEMORY[0x1D17E748C](v50) == v32)
  {
    v51 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    -[BGSystemTaskRequest setRelatedApplications:](v30, "setRelatedApplications:", v51);

  }
  xpc_dictionary_get_array(v5, "InvolvedProcesses");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52 && MEMORY[0x1D17E748C](v52) == v32)
  {
    v53 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    -[BGSystemTaskRequest setInvolvedProcesses:](v30, "setInvolvedProcesses:", v53);

  }
  xpc_dictionary_get_value(v5, "RunOnAppForeground");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = MEMORY[0x1E0C812D0];
  if (v10 && MEMORY[0x1D17E748C](v10) == v54 && xpc_BOOL_get_value(v10))
  {
    -[BGSystemTaskRequest relatedApplications](v30, "relatedApplications");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count");

    if (!v56)
    {
      v87 = (void *)_log_0;
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
        +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.9(v87, v30);
      goto LABEL_161;
    }
    -[BGSystemTaskRequest setRunOnAppForeground:](v30, "setRunOnAppForeground:", 1);
  }
  xpc_dictionary_get_value(v5, "RequestsApplicationLaunch");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31 && MEMORY[0x1D17E748C](v31) == v54 && xpc_BOOL_get_value(v31))
  {
    -[BGSystemTaskRequest relatedApplications](v30, "relatedApplications");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "count");

    if (v58)
    {
      -[BGSystemTaskRequest setRequestsApplicationLaunch:](v30, "setRequestsApplicationLaunch:", 1);
      goto LABEL_64;
    }
    v88 = (void *)_log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.8(v88, v30);
LABEL_44:
    v48 = 0;
    v10 = v31;
    goto LABEL_162;
  }
LABEL_64:
  xpc_dictionary_get_value(v5, "BeforeApplicationLaunch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && MEMORY[0x1D17E748C](v10) == v54 && xpc_BOOL_get_value(v10))
  {
    -[BGSystemTaskRequest relatedApplications](v30, "relatedApplications");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "count");

    if (!v60)
    {
      v89 = (void *)_log_0;
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
        +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.7(v89, v30);
      goto LABEL_161;
    }
    -[BGSystemTaskRequest setBeforeApplicationLaunch:](v30, "setBeforeApplicationLaunch:", 1);
  }
  xpc_dictionary_get_value(v5, "UserRequestedBackupTask");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
    -[BGSystemTaskRequest setUserRequestedBackupTask:](v30, "setUserRequestedBackupTask:", xpc_BOOL_get_value(v61));
  xpc_dictionary_get_dictionary(v5, "NetworkEndpoint");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62 && MEMORY[0x1D17E748C](v62) == v8)
  {
    v63 = (void *)nw_endpoint_create_from_dictionary();
    -[BGSystemTaskRequest setNetworkEndpointPrimitive:](v30, "setNetworkEndpointPrimitive:", v63);

  }
  xpc_dictionary_get_dictionary(v5, "NetworkParameters");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64 && MEMORY[0x1D17E748C](v64) == v8)
  {
    v65 = (void *)nw_parameters_create_from_dictionary();
    -[BGSystemTaskRequest setNetworkParametersPrimitive:](v30, "setNetworkParametersPrimitive:", v65);

  }
  -[BGSystemTaskRequest setRequiresBuddyComplete:](v30, "setRequiresBuddyComplete:", xpc_dictionary_get_BOOL(v5, "RequiresBuddyComplete"));
  v66 = xpc_dictionary_get_string(v5, "GroupName");
  if (v66)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[BGSystemTaskRequest setGroupName:](v30, "setGroupName:", v67);

  }
  -[BGSystemTaskRequest groupName](v30, "groupName", v66);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68 == 0;

  if (v69)
  {
    v70 = v64;
  }
  else
  {
    xpc_dictionary_get_value(v5, "GroupConcurrencyLimit");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
      int64 = xpc_dictionary_get_int64(v5, "GroupConcurrencyLimit");
    else
      int64 = 1;
    -[BGSystemTaskRequest setGroupConcurrencyLimit:](v30, "setGroupConcurrencyLimit:", int64);
  }
  v72 = xpc_dictionary_get_string(v5, "RateLimitConfigurationName");
  if (v72)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[BGSystemTaskRequest setRateLimitConfigurationName:](v30, "setRateLimitConfigurationName:", v73);

  }
  -[BGSystemTaskRequest setRequiresSignificantUserInactivity:](v30, "setRequiresSignificantUserInactivity:", xpc_dictionary_get_BOOL(v5, "RequiresSignificantUserInactivity"));
  -[BGSystemTaskRequest setRequiresUserInactivity:](v30, "setRequiresUserInactivity:", xpc_dictionary_get_BOOL(v5, "RequiresUserInactivity"));
  -[BGSystemTaskRequest setAppRefresh:](v30, "setAppRefresh:", xpc_dictionary_get_BOOL(v5, "AppRefresh"));
  -[BGSystemTaskRequest setPowerNap:](v30, "setPowerNap:", xpc_dictionary_get_BOOL(v5, "PowerNap"));
  -[BGSystemTaskRequest setPreventsDeviceSleep:](v30, "setPreventsDeviceSleep:", xpc_dictionary_get_BOOL(v5, "PreventsDeviceSleep"));
  -[BGSystemTaskRequest setResourceIntensive:](v30, "setResourceIntensive:", xpc_dictionary_get_BOOL(v5, "ResourceIntensive"));
  v74 = xpc_dictionary_get_int64(v5, "Resources");
  if (v74 <= 1)
    v75 = 1;
  else
    v75 = v74;
  -[BGSystemTaskRequest setResources:](v30, "setResources:", v75);
  -[BGSystemTaskRequest setRequiresInexpensiveNetworkConnectivity:](v30, "setRequiresInexpensiveNetworkConnectivity:", xpc_dictionary_get_BOOL(v5, "RequiresInexpensiveNetworkConnectivity"));
  -[BGSystemTaskRequest setRequiresUnconstrainedNetworkConnectivity:](v30, "setRequiresUnconstrainedNetworkConnectivity:", xpc_dictionary_get_BOOL(v5, "RequiresUnconstrainedNetworkConnectivity"));
  v76 = xpc_dictionary_get_BOOL(v5, "RequiresNetworkConnectivity")
     || -[BGSystemTaskRequest requiresInexpensiveNetworkConnectivity](v30, "requiresInexpensiveNetworkConnectivity")
     || -[BGSystemTaskRequest requiresUnconstrainedNetworkConnectivity](v30, "requiresUnconstrainedNetworkConnectivity");
  -[BGSystemTaskRequest setRequiresNetworkConnectivity:](v30, "setRequiresNetworkConnectivity:", v76);
  -[BGSystemTaskRequest setNetworkDownloadSize:](v30, "setNetworkDownloadSize:", xpc_dictionary_get_int64(v5, "NetworkDownloadSize"));
  -[BGSystemTaskRequest setNetworkUploadSize:](v30, "setNetworkUploadSize:", xpc_dictionary_get_int64(v5, "NetworkUploadSize"));
  -[BGSystemTaskRequest setMayRebootDevice:](v30, "setMayRebootDevice:", xpc_dictionary_get_BOOL(v5, "MayRebootDevice"));
  xpc_dictionary_get_array(v5, "ProducedResultIdentifiers");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77 && MEMORY[0x1D17E748C](v77) == v32)
  {
    v78 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v78)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGSystemTaskRequest setProducedResultIdentifiers:](v30, "setProducedResultIdentifiers:", v79);

    }
  }
  xpc_dictionary_get_array(v5, "Dependencies");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && MEMORY[0x1D17E748C](v10) == v32)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v114 = __Block_byref_object_copy__1;
    v115 = __Block_byref_object_dispose__1;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v116 = (id)objc_claimAutoreleasedReturnValue();
    v107 = MEMORY[0x1E0C809B0];
    v108 = 3221225472;
    v109 = __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke;
    v110 = &unk_1E920FD00;
    v111 = v6;
    v112 = buf;
    if (!xpc_array_apply(v10, &v107))
    {

      _Block_object_dispose(buf, 8);
      goto LABEL_161;
    }
    -[BGSystemTaskRequest setDependencies:](v30, "setDependencies:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v107, v108, v109, v110);

    _Block_object_dispose(buf, 8);
  }
  -[BGSystemTaskRequest producedResultIdentifiers](v30, "producedResultIdentifiers");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    -[BGSystemTaskRequest producedResultIdentifiers](v30, "producedResultIdentifiers");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "count") == 0;

    if (v82)
    {
      v86 = (id)_log_0;
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
        +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.6();
LABEL_112:

LABEL_161:
      v48 = 0;
      goto LABEL_162;
    }
  }
  v83 = xpc_dictionary_get_string(v5, "RunOnMotionState");
  if (v83)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqualToString:", CFSTR("Stationary")) & 1) != 0)
    {
      v85 = 1;
    }
    else if ((objc_msgSend(v84, "isEqualToString:", CFSTR("Walking")) & 1) != 0)
    {
      v85 = 2;
    }
    else if ((objc_msgSend(v84, "isEqualToString:", CFSTR("Running")) & 1) != 0)
    {
      v85 = 3;
    }
    else if ((objc_msgSend(v84, "isEqualToString:", CFSTR("Cycling")) & 1) != 0)
    {
      v85 = 4;
    }
    else if ((objc_msgSend(v84, "isEqualToString:", CFSTR("Automotive")) & 1) != 0)
    {
      v85 = 5;
    }
    else if ((objc_msgSend(v84, "isEqualToString:", CFSTR("AutomotiveMoving")) & 1) != 0)
    {
      v85 = 6;
    }
    else
    {
      if (!objc_msgSend(v84, "isEqualToString:", CFSTR("AutomotiveStationary")))
      {
LABEL_131:

        goto LABEL_132;
      }
      v85 = 7;
    }
    -[BGSystemTaskRequest setRunOnMotionState:](v30, "setRunOnMotionState:", v85);
    goto LABEL_131;
  }
LABEL_132:
  -[BGSystemTaskRequest setPowerBudgeted:](v30, "setPowerBudgeted:", xpc_dictionary_get_BOOL(v5, "PowerBudgeted"));
  -[BGSystemTaskRequest setDataBudgeted:](v30, "setDataBudgeted:", xpc_dictionary_get_BOOL(v5, "DataBudgeted"));
  v90 = xpc_dictionary_get_string(v5, "DataBudgetName");
  if (v90)
  {
    if (-[BGSystemTaskRequest dataBudgeted](v30, "dataBudgeted"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[BGSystemTaskRequest setDataBudgetName:](v30, "setDataBudgetName:", v91);

      goto LABEL_135;
    }
    v86 = (id)_log_0;
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.5(v30, v86);
    goto LABEL_112;
  }
LABEL_135:
  -[BGSystemTaskRequest setShouldWakeDevice:](v30, "setShouldWakeDevice:", xpc_dictionary_get_BOOL(v5, "ShouldWakeDevice"));
  -[BGSystemTaskRequest setRequiresProtectionClass:](v30, "setRequiresProtectionClass:", 3);
  v92 = xpc_dictionary_get_string(v5, "RequiresProtectionClass");
  if (v92 && (*v92 - 65) <= 3u)
    -[BGSystemTaskRequest setRequiresProtectionClass:](v30, "setRequiresProtectionClass:", (*v92 - 65) + 1);
  -[BGSystemTaskRequest setOverrideRateLimiting:](v30, "setOverrideRateLimiting:", xpc_dictionary_get_BOOL(v5, "OverrideRateLimiting"));
  -[BGSystemTaskRequest setMagneticInterferenceSensitivity:](v30, "setMagneticInterferenceSensitivity:", xpc_dictionary_get_BOOL(v5, "MagneticInterferenceSensitivity"));
  -[BGSystemTaskRequest setMailFetch:](v30, "setMailFetch:", xpc_dictionary_get_BOOL(v5, "MailFetch"));
  -[BGSystemTaskRequest setBypassPeakPower:](v30, "setBypassPeakPower:", xpc_dictionary_get_BOOL(v5, "BypassPeakPower"));
  -[BGSystemTaskRequest setBypassBatteryAging:](v30, "setBypassBatteryAging:", xpc_dictionary_get_BOOL(v5, "BypassBatteryAging"));
  -[BGSystemTaskRequest setBacklogged:](v30, "setBacklogged:", xpc_dictionary_get_BOOL(v5, "Backlogged"));
  -[BGSystemTaskRequest setRequiresMinimumBatteryLevel:](v30, "setRequiresMinimumBatteryLevel:", xpc_dictionary_get_int64(v5, "RequiresMinimumBatteryLevel"));
  -[BGSystemTaskRequest setBlockRebootActivitiesForSU:](v30, "setBlockRebootActivitiesForSU:", xpc_dictionary_get_BOOL(v5, "BlockRebootActivitiesForSU"));
  -[BGSystemTaskRequest setUseStatisticalModelForTriggersRestart:](v30, "setUseStatisticalModelForTriggersRestart:", xpc_dictionary_get_BOOL(v5, "UseStatisticalModelForTriggersRestart"));
  -[BGSystemTaskRequest requiresMinimumBatteryLevel](v30, "requiresMinimumBatteryLevel");
  if (-[BGSystemTaskRequest requiresMinimumBatteryLevel](v30, "requiresMinimumBatteryLevel") >= 0x65)
    -[BGSystemTaskRequest setRequiresMinimumBatteryLevel:](v30, "setRequiresMinimumBatteryLevel:", 0);
  -[BGSystemTaskRequest setRequiresMinimumDataBudgetPercentage:](v30, "setRequiresMinimumDataBudgetPercentage:", xpc_dictionary_get_int64(v5, "RequiresMinimumDataBudgetPercentage"));
  -[BGSystemTaskRequest requiresMinimumDataBudgetPercentage](v30, "requiresMinimumDataBudgetPercentage");
  if (-[BGSystemTaskRequest requiresMinimumDataBudgetPercentage](v30, "requiresMinimumDataBudgetPercentage") >= 0x65)
    -[BGSystemTaskRequest setRequiresMinimumDataBudgetPercentage:](v30, "setRequiresMinimumDataBudgetPercentage:", 0);
  v93 = xpc_dictionary_get_string(v5, "DiskVolume");
  if (!v93)
    goto LABEL_146;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v95, "fileExistsAtPath:isDirectory:", v94, 0);

  if ((v96 & 1) == 0)
  {
    v100 = (id)_log_0;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.4(v30, (uint64_t)v94, v100);
    goto LABEL_160;
  }
  if (!-[BGSystemTaskRequest networkDownloadSize](v30, "networkDownloadSize"))
  {
    v100 = (id)_log_0;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      +[BGSystemTaskRequest taskRequestWithDescriptor:withIdentifier:].cold.3(v30, v100);
LABEL_160:

    goto LABEL_161;
  }
  -[BGSystemTaskRequest setDiskVolume:](v30, "setDiskVolume:", v94);

LABEL_146:
  v97 = xpc_dictionary_get_string(v5, "TargetDevice");
  v98 = v97;
  if (v97)
  {
    if (!strncmp(v97, "TargetDeviceDefaultPaired", 0x19uLL))
    {
      v99 = 1;
    }
    else if (!strncmp(v98, "TargetDeviceAllPaired", 0x15uLL))
    {
      v99 = 2;
    }
    else if (!strncmp(v98, "TargetDeviceRemote", 0x12uLL))
    {
      v99 = 3;
    }
    else
    {
      v99 = 0;
    }
    -[BGSystemTaskRequest setTargetDevice:](v30, "setTargetDevice:", v99);
  }
  v102 = xpc_dictionary_get_BOOL(v5, "CommunicatesWithPairedDevice");
  -[BGSystemTaskRequest setCommunicatesWithPairedDevice:](v30, "setCommunicatesWithPairedDevice:", v102);
  v103 = -[BGSystemTaskRequest targetDevice](v30, "targetDevice");
  v104 = !v102;
  if (v103)
    v104 = 1;
  if ((v104 & 1) == 0)
    -[BGSystemTaskRequest setTargetDevice:](v30, "setTargetDevice:", 1);
  v105 = xpc_dictionary_get_string(v5, "RemoteDeviceIdentifier");
  if (v105)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[BGSystemTaskRequest setRemoteDevice:](v30, "setRemoteDevice:", v106);

  }
  -[BGSystemTaskRequest setRequiresRemoteDeviceWake:](v30, "setRequiresRemoteDeviceWake:", xpc_dictionary_get_BOOL(v5, "RequiresRemoteDeviceWake"));
  v48 = v30;
LABEL_162:

  return (BGSystemTaskRequest *)v48;
}

uint64_t __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  const char *string;
  const char *v9;
  const char *v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int64_t int64;
  BGSystemTaskResultDependency *v17;
  void *v18;
  uint64_t v19;
  BGSystemTaskCompletionDependency *v20;
  void *v21;

  v4 = a3;
  if (MEMORY[0x1D17E748C]() == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(v4, "DependencyType");
    if (!string)
    {
      v12 = _log_0;
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
        __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_1(a1, v12, v13);
      goto LABEL_4;
    }
    v9 = string;
    v10 = xpc_dictionary_get_string(v4, "DependencyIdentifier");
    if (!v10)
    {
      v14 = _log_0;
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
        __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_2(a1, v14, v15);
      goto LABEL_4;
    }
    v11 = v10;
    if (!strncmp(v9, "DependencyTypeResult", 0x14uLL))
    {
      int64 = xpc_dictionary_get_int64(v4, "ResultDependencyBatchSize");
      v17 = [BGSystemTaskResultDependency alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[BGSystemTaskResultDependency initWithIdentifier:batchSize:](v17, "initWithIdentifier:batchSize:", v18, int64);
    }
    else
    {
      if (strncmp(v9, "DependencyTypeCompletion", 0x18uLL))
      {
        if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
          __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_3();
        goto LABEL_4;
      }
      v20 = [BGSystemTaskCompletionDependency alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[BGSystemTaskCompletionDependency initWithIdentifier:](v20, "initWithIdentifier:", v18);
    }
    v21 = (void *)v19;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v21);
    v6 = 1;
    goto LABEL_5;
  }
  v5 = _log_0;
  if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
    __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_4(a1, (uint64_t)v4, v5);
LABEL_4:
  v6 = 0;
LABEL_5:

  return v6;
}

+ (id)descriptorWithTaskRequest:(id)a3
{
  id v3;
  id v4;
  id v5;
  double v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  const __CFString *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  void *v103;
  void *v104;
  unint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  const __CFString *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v3;
    objc_msgSend(v5, "interval");
    if (v6 < 300.0)
    {
      v40 = (void *)_log_0;
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
        +[BGSystemTaskRequest descriptorWithTaskRequest:].cold.2(v40, v5);

      goto LABEL_35;
    }
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "interval");
    objc_msgSend(v8, "numberWithLong:", (uint64_t)v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("Interval"));

    objc_msgSend(v5, "minDurationBetweenInstances");
    if (v11 != 0.0)
    {
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "minDurationBetweenInstances");
      objc_msgSend(v12, "numberWithLong:", (uint64_t)v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("MinDurationBetweenInstances"));

    }
    v15 = CFSTR("RepeatingTask");
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = _log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
      +[BGSystemTaskRequest descriptorWithTaskRequest:].cold.3(v41);
    goto LABEL_35;
  }
  v16 = v3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v16, "isMemberOfClass:", objc_opt_class()))
  {
    v17 = v16;
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v17, "processingTaskIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      objc_msgSend(v17, "processingTaskIdentifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("ProcessingTaskIdentifiers"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "semanticVersion"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("SemanticVersion"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v17, "reRun"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("ReRun"));

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("FastPassTask"));
    v24 = v17;

  }
  objc_msgSend(v16, "scheduleAfter");
  if (v25 != 0.0)
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "scheduleAfter");
    objc_msgSend(v26, "numberWithLong:", (uint64_t)v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("ScheduleAfter"));

  }
  objc_msgSend(v16, "trySchedulingBefore");
  if (v29 != 0.0)
  {
    v30 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v16, "trySchedulingBefore");
    objc_msgSend(v30, "numberWithLong:", (uint64_t)v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, CFSTR("TrySchedulingBefore"));

  }
  if (objc_msgSend(v7, "count"))
  {
    v15 = CFSTR("NonRepeatingTask");
LABEL_17:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v15);
  }

  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v3, "featureCodes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (!v34)
    {
      v42 = (void *)_log_0;
      if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_ERROR))
        +[BGSystemTaskRequest descriptorWithTaskRequest:].cold.1(v42, v3);
LABEL_35:
      v43 = 0;
      goto LABEL_167;
    }
  }
  objc_msgSend(v3, "featureCodes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (v36)
  {
    objc_msgSend(v3, "featureCodes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, CFSTR("FeatureCodes"));

  }
  if (objc_msgSend(v3, "postInstall"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "postInstall"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("PostInstall"));

  }
  v39 = CFSTR("Maintenance");
  switch(objc_msgSend(v3, "priority"))
  {
    case 0:
      if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
        v39 = CFSTR("Utility");
      goto LABEL_38;
    case 1:
      goto LABEL_38;
    case 2:
      v39 = CFSTR("Utility");
      goto LABEL_38;
    case 3:
      v39 = CFSTR("UserInitiated");
LABEL_38:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("Priority"));
      break;
    default:
      break;
  }
  if (objc_msgSend(v3, "requiresExternalPowerIsSetByUser"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "requiresExternalPower"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, CFSTR("RequiresExternalPower"));

  }
  objc_msgSend(v3, "randomInitialDelay");
  if (v45 != 0.0)
  {
    v46 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "randomInitialDelay");
    objc_msgSend(v46, "numberWithLong:", (uint64_t)v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, CFSTR("RandomInitialDelay"));

  }
  objc_msgSend(v3, "expectedDuration");
  if (v49 != 0.0)
  {
    v50 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "expectedDuration");
    objc_msgSend(v50, "numberWithLong:", (uint64_t)v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v52, CFSTR("ExpectedDuration"));

  }
  objc_msgSend(v3, "relatedApplications");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    objc_msgSend(v3, "relatedApplications");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v54, CFSTR("RelatedApplications"));

  }
  objc_msgSend(v3, "involvedProcesses");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend(v3, "involvedProcesses");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, CFSTR("InvolvedProcesses"));

  }
  if (objc_msgSend(v3, "runOnAppForeground"))
  {
    objc_msgSend(v3, "relatedApplications");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "runOnAppForeground"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, CFSTR("RunOnAppForeground"));

    }
  }
  if (objc_msgSend(v3, "requestsApplicationLaunch"))
  {
    objc_msgSend(v3, "relatedApplications");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "requestsApplicationLaunch"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v60, CFSTR("RequestsApplicationLaunch"));

    }
  }
  if (objc_msgSend(v3, "beforeApplicationLaunch"))
  {
    objc_msgSend(v3, "relatedApplications");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "beforeApplicationLaunch"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v62, CFSTR("BeforeApplicationLaunch"));

    }
  }
  if (objc_msgSend(v3, "userRequestedBackupTask"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "userRequestedBackupTask"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v63, CFSTR("UserRequestedBackupTask"));

  }
  if (objc_msgSend(v3, "requiresBuddyComplete"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "requiresBuddyComplete"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v64, CFSTR("RequiresBuddyComplete"));

  }
  objc_msgSend(v3, "groupName");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    objc_msgSend(v3, "groupName");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v66, CFSTR("GroupName"));

  }
  if (objc_msgSend(v3, "groupConcurrencyLimit"))
  {
    objc_msgSend(v3, "groupName");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v3, "groupConcurrencyLimit"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v68, CFSTR("GroupConcurrencyLimit"));

    }
  }
  objc_msgSend(v3, "rateLimitConfigurationName");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    objc_msgSend(v3, "rateLimitConfigurationName");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v70, CFSTR("RateLimitConfigurationName"));

  }
  if (objc_msgSend(v3, "requiresSignificantUserInactivity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "requiresSignificantUserInactivity"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v71, CFSTR("RequiresSignificantUserInactivity"));

  }
  if (objc_msgSend(v3, "requiresUserInactivity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "requiresUserInactivity"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v72, CFSTR("RequiresUserInactivity"));

  }
  if (objc_msgSend(v3, "powerNap"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "powerNap"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v73, CFSTR("PowerNap"));

  }
  if (objc_msgSend(v3, "appRefresh"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "appRefresh"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v74, CFSTR("AppRefresh"));

  }
  if (objc_msgSend(v3, "preventsDeviceSleep"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "preventsDeviceSleep"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v75, CFSTR("PreventsDeviceSleep"));

  }
  if (objc_msgSend(v3, "resourceIntensive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "resourceIntensive"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v76, CFSTR("ResourceIntensive"));

  }
  if (objc_msgSend(v3, "resources"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v3, "resources"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v77, CFSTR("Resources"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E9213810, CFSTR("Resources"));
  }
  if (objc_msgSend(v3, "requiresInexpensiveNetworkConnectivity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "requiresInexpensiveNetworkConnectivity"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v78, CFSTR("RequiresInexpensiveNetworkConnectivity"));

  }
  if (objc_msgSend(v3, "requiresUnconstrainedNetworkConnectivity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "requiresUnconstrainedNetworkConnectivity"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v79, CFSTR("RequiresUnconstrainedNetworkConnectivity"));

  }
  if ((objc_msgSend(v3, "requiresInexpensiveNetworkConnectivity") & 1) != 0
    || (objc_msgSend(v3, "requiresUnconstrainedNetworkConnectivity") & 1) != 0
    || objc_msgSend(v3, "requiresNetworkConnectivity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "requiresNetworkConnectivity"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v80, CFSTR("RequiresNetworkConnectivity"));

  }
  if (objc_msgSend(v3, "networkDownloadSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v3, "networkDownloadSize"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v81, CFSTR("NetworkDownloadSize"));

  }
  if (objc_msgSend(v3, "networkUploadSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v3, "networkUploadSize"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v82, CFSTR("NetworkUploadSize"));

  }
  if (objc_msgSend(v3, "mayRebootDevice"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "mayRebootDevice"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v83, CFSTR("MayRebootDevice"));

  }
  objc_msgSend(v3, "producedResultIdentifiers");
  v84 = objc_claimAutoreleasedReturnValue();
  if (v84)
  {
    v85 = (void *)v84;
    objc_msgSend(v3, "producedResultIdentifiers");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "count");

    if (v87)
    {
      objc_msgSend(v3, "producedResultIdentifiers");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "allObjects");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v89, CFSTR("ProducedResultIdentifiers"));

    }
  }
  objc_msgSend(v3, "dependencies");
  v90 = objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    v91 = (void *)v90;
    objc_msgSend(v3, "dependencies");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "count");

    if (v93)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = 0u;
      v136 = 0u;
      v137 = 0u;
      v138 = 0u;
      objc_msgSend(v3, "dependencies", 0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v135, v139, 16);
      if (v96)
      {
        v97 = v96;
        v98 = *(_QWORD *)v136;
        do
        {
          v99 = 0;
          do
          {
            if (*(_QWORD *)v136 != v98)
              objc_enumerationMutation(v95);
            objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * v99), "asDictionary");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "addObject:", v100);

            ++v99;
          }
          while (v97 != v99);
          v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v135, v139, 16);
        }
        while (v97);
      }

      objc_msgSend(v4, "setObject:forKeyedSubscript:", v94, CFSTR("Dependencies"));
    }
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("TargetDeviceLocal"), CFSTR("TargetDevice"));
  if (objc_msgSend(v3, "targetDevice") == 1)
  {
    v101 = CFSTR("TargetDeviceDefaultPaired");
  }
  else if (objc_msgSend(v3, "targetDevice") == 2)
  {
    v101 = CFSTR("TargetDeviceAllPaired");
  }
  else
  {
    if (objc_msgSend(v3, "targetDevice") != 3)
      goto LABEL_118;
    v101 = CFSTR("TargetDeviceRemote");
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v101, CFSTR("TargetDevice"));
LABEL_118:
  if (objc_msgSend(v3, "communicatesWithPairedDevice"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "communicatesWithPairedDevice"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v102, CFSTR("CommunicatesWithPairedDevice"));

  }
  objc_msgSend(v3, "remoteDevice");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v103, CFSTR("RemoteDeviceIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "requiresRemoteDeviceWake"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v104, CFSTR("RequiresRemoteDeviceWake"));

  if (objc_msgSend(v3, "runOnMotionState"))
  {
    v105 = objc_msgSend(v3, "runOnMotionState") - 1;
    if (v105 <= 6)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", off_1E920FD20[v105], CFSTR("RunOnMotionState"));
  }
  if (objc_msgSend(v3, "powerBudgeted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "powerBudgeted"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v106, CFSTR("PowerBudgeted"));

  }
  if (objc_msgSend(v3, "dataBudgeted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "dataBudgeted"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v107, CFSTR("DataBudgeted"));

    objc_msgSend(v3, "dataBudgetName");
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    if (v108)
    {
      objc_msgSend(v3, "dataBudgetName");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v109, CFSTR("DataBudgetName"));

    }
  }
  if (objc_msgSend(v3, "shouldWakeDevice"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "shouldWakeDevice"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v110, CFSTR("ShouldWakeDevice"));

  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("C"), CFSTR("RequiresProtectionClass"));
  if (objc_msgSend(v3, "requiresProtectionClass") == 1)
  {
    v111 = CFSTR("A");
LABEL_136:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v111, CFSTR("RequiresProtectionClass"));
    goto LABEL_137;
  }
  if (objc_msgSend(v3, "requiresProtectionClass") == 2)
  {
    v111 = CFSTR("B");
    goto LABEL_136;
  }
  if (objc_msgSend(v3, "requiresProtectionClass") == 4)
  {
    v111 = CFSTR("D");
    goto LABEL_136;
  }
LABEL_137:
  objc_msgSend(v3, "networkEndpoint");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (v112)
  {
    objc_msgSend(v3, "networkEndpoint");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v113, CFSTR("NetworkEndpoint"));

  }
  objc_msgSend(v3, "networkParameters");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (v114)
  {
    objc_msgSend(v3, "networkParameters");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v115, CFSTR("NetworkParameters"));

  }
  if (objc_msgSend(v3, "overrideRateLimiting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "overrideRateLimiting"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v116, CFSTR("OverrideRateLimiting"));

  }
  if (objc_msgSend(v3, "magneticInterferenceSensitivity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "magneticInterferenceSensitivity"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v117, CFSTR("MagneticInterferenceSensitivity"));

  }
  if (objc_msgSend(v3, "mailFetch"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "mailFetch"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v118, CFSTR("MailFetch"));

  }
  if (objc_msgSend(v3, "bypassPeakPower"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "bypassPeakPower"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v119, CFSTR("BypassPeakPower"));

  }
  if (objc_msgSend(v3, "bypassBatteryAging"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "bypassBatteryAging"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v120, CFSTR("BypassBatteryAging"));

  }
  if (objc_msgSend(v3, "backlogged"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "backlogged"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v121, CFSTR("Backlogged"));

  }
  if (objc_msgSend(v3, "requiresMinimumBatteryLevel"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v3, "requiresMinimumBatteryLevel"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v122, CFSTR("RequiresMinimumBatteryLevel"));

  }
  if (objc_msgSend(v3, "requiresMinimumDataBudgetPercentage"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v3, "requiresMinimumDataBudgetPercentage"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v123, CFSTR("RequiresMinimumDataBudgetPercentage"));

  }
  if (objc_msgSend(v3, "blockRebootActivitiesForSU"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "blockRebootActivitiesForSU"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v124, CFSTR("BlockRebootActivitiesForSU"));

  }
  objc_msgSend(v3, "diskVolume");
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  if (v125)
  {
    objc_msgSend(v3, "diskVolume");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v126, CFSTR("DiskVolume"));

  }
  v127 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v127)
  {
    objc_msgSend(v3, "networkEndpointPrimitive");
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    if (v128)
    {
      objc_msgSend(v3, "networkEndpointPrimitive");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = (void *)MEMORY[0x1D17E7150]();
      xpc_dictionary_set_value(v127, "NetworkEndpoint", v130);

    }
    objc_msgSend(v3, "networkParametersPrimitive");
    v131 = (void *)objc_claimAutoreleasedReturnValue();

    if (v131)
    {
      objc_msgSend(v3, "networkParametersPrimitive");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = (void *)nw_parameters_copy_dictionary();
      xpc_dictionary_set_value(v127, "NetworkParameters", v133);

    }
  }
  v43 = v127;

LABEL_167:
  return v43;
}

- (BGSystemTaskRequest)initWithIdentifier:(id)a3
{
  id v5;
  BGSystemTaskRequest *v6;
  BGSystemTaskRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BGSystemTaskRequest;
  v6 = -[BGSystemTaskRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v28;
  void *v29;
  void *v30;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[BGSystemTaskRequest identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:", v6);

  objc_msgSend(v7, "setRequiresNetworkConnectivity:", -[BGSystemTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));
  objc_msgSend(v7, "setRequiresExternalPower:", -[BGSystemTaskRequest requiresExternalPower](self, "requiresExternalPower"));
  objc_msgSend(v7, "setPriority:", -[BGSystemTaskRequest priority](self, "priority"));
  objc_msgSend(v7, "setRequiresProtectionClass:", -[BGSystemTaskRequest requiresProtectionClass](self, "requiresProtectionClass"));
  objc_msgSend(v7, "setPreventsDeviceSleep:", -[BGSystemTaskRequest preventsDeviceSleep](self, "preventsDeviceSleep"));
  -[BGSystemTaskRequest randomInitialDelay](self, "randomInitialDelay");
  objc_msgSend(v7, "setRandomInitialDelay:");
  objc_msgSend(v7, "setPostInstall:", -[BGSystemTaskRequest postInstall](self, "postInstall"));
  objc_msgSend(v7, "setRequiresInexpensiveNetworkConnectivity:", -[BGSystemTaskRequest requiresInexpensiveNetworkConnectivity](self, "requiresInexpensiveNetworkConnectivity"));
  objc_msgSend(v7, "setRequiresUnconstrainedNetworkConnectivity:", -[BGSystemTaskRequest requiresUnconstrainedNetworkConnectivity](self, "requiresUnconstrainedNetworkConnectivity"));
  objc_msgSend(v7, "setAppRefresh:", -[BGSystemTaskRequest appRefresh](self, "appRefresh"));
  objc_msgSend(v7, "setRequiresSignificantUserInactivity:", -[BGSystemTaskRequest requiresSignificantUserInactivity](self, "requiresSignificantUserInactivity"));
  objc_msgSend(v7, "setRequiresUserInactivity:", -[BGSystemTaskRequest requiresUserInactivity](self, "requiresUserInactivity"));
  objc_msgSend(v7, "setPowerNap:", -[BGSystemTaskRequest powerNap](self, "powerNap"));
  objc_msgSend(v7, "setResourceIntensive:", -[BGSystemTaskRequest resourceIntensive](self, "resourceIntensive"));
  objc_msgSend(v7, "setResources:", -[BGSystemTaskRequest resources](self, "resources"));
  objc_msgSend(v7, "setMayRebootDevice:", -[BGSystemTaskRequest mayRebootDevice](self, "mayRebootDevice"));
  objc_msgSend(v7, "setUserRequestedBackupTask:", -[BGSystemTaskRequest userRequestedBackupTask](self, "userRequestedBackupTask"));
  objc_msgSend(v7, "setNetworkDownloadSize:", -[BGSystemTaskRequest networkDownloadSize](self, "networkDownloadSize"));
  objc_msgSend(v7, "setNetworkUploadSize:", -[BGSystemTaskRequest networkUploadSize](self, "networkUploadSize"));
  objc_msgSend(v7, "setCommunicatesWithPairedDevice:", -[BGSystemTaskRequest communicatesWithPairedDevice](self, "communicatesWithPairedDevice"));
  objc_msgSend(v7, "setShouldWakeDevice:", -[BGSystemTaskRequest shouldWakeDevice](self, "shouldWakeDevice"));
  -[BGSystemTaskRequest groupName](self, "groupName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v7, "setGroupName:", v9);

  objc_msgSend(v7, "setGroupConcurrencyLimit:", -[BGSystemTaskRequest groupConcurrencyLimit](self, "groupConcurrencyLimit"));
  -[BGSystemTaskRequest rateLimitConfigurationName](self, "rateLimitConfigurationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v7, "setRateLimitConfigurationName:", v11);

  -[BGSystemTaskRequest expectedDuration](self, "expectedDuration");
  objc_msgSend(v7, "setExpectedDuration:");
  objc_msgSend(v7, "setPowerBudgeted:", -[BGSystemTaskRequest powerBudgeted](self, "powerBudgeted"));
  objc_msgSend(v7, "setDataBudgeted:", -[BGSystemTaskRequest dataBudgeted](self, "dataBudgeted"));
  -[BGSystemTaskRequest dataBudgetName](self, "dataBudgetName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataBudgetName:", v12);

  -[BGSystemTaskRequest relatedApplications](self, "relatedApplications");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  objc_msgSend(v7, "setRelatedApplications:", v14);

  -[BGSystemTaskRequest involvedProcesses](self, "involvedProcesses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copyWithZone:", a3);
  objc_msgSend(v7, "setInvolvedProcesses:", v16);

  objc_msgSend(v7, "setRunOnAppForeground:", -[BGSystemTaskRequest runOnAppForeground](self, "runOnAppForeground"));
  objc_msgSend(v7, "setRequestsApplicationLaunch:", -[BGSystemTaskRequest requestsApplicationLaunch](self, "requestsApplicationLaunch"));
  objc_msgSend(v7, "setBeforeApplicationLaunch:", -[BGSystemTaskRequest beforeApplicationLaunch](self, "beforeApplicationLaunch"));
  objc_msgSend(v7, "setRequiresBuddyComplete:", -[BGSystemTaskRequest requiresBuddyComplete](self, "requiresBuddyComplete"));
  objc_msgSend(v7, "setTargetDevice:", -[BGSystemTaskRequest targetDevice](self, "targetDevice"));
  -[BGSystemTaskRequest remoteDevice](self, "remoteDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteDevice:", v17);

  objc_msgSend(v7, "setRequiresRemoteDeviceWake:", -[BGSystemTaskRequest requiresRemoteDeviceWake](self, "requiresRemoteDeviceWake"));
  -[BGSystemTaskRequest networkEndpoint](self, "networkEndpoint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v7, "setNetworkEndpoint:", v19);

  -[BGSystemTaskRequest networkParameters](self, "networkParameters");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v7, "setNetworkParameters:", v21);

  objc_msgSend(v7, "setRunOnMotionState:", objc_msgSend(v7, "runOnMotionState"));
  -[BGSystemTaskRequest producedResultIdentifiers](self, "producedResultIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  objc_msgSend(v7, "setProducedResultIdentifiers:", v23);

  -[BGSystemTaskRequest dependencies](self, "dependencies");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  objc_msgSend(v7, "setDependencies:", v25);

  objc_msgSend(v7, "setOverrideRateLimiting:", -[BGSystemTaskRequest overrideRateLimiting](self, "overrideRateLimiting"));
  objc_msgSend(v7, "setMagneticInterferenceSensitivity:", -[BGSystemTaskRequest magneticInterferenceSensitivity](self, "magneticInterferenceSensitivity"));
  objc_msgSend(v7, "setMailFetch:", -[BGSystemTaskRequest mailFetch](self, "mailFetch"));
  objc_msgSend(v7, "setBypassBatteryAging:", -[BGSystemTaskRequest bypassBatteryAging](self, "bypassBatteryAging"));
  objc_msgSend(v7, "setBypassPeakPower:", -[BGSystemTaskRequest bypassPeakPower](self, "bypassPeakPower"));
  objc_msgSend(v7, "setRequiresMinimumBatteryLevel:", -[BGSystemTaskRequest requiresMinimumBatteryLevel](self, "requiresMinimumBatteryLevel"));
  objc_msgSend(v7, "setRequiresMinimumDataBudgetPercentage:", -[BGSystemTaskRequest requiresMinimumDataBudgetPercentage](self, "requiresMinimumDataBudgetPercentage"));
  objc_msgSend(v7, "setBlockRebootActivitiesForSU:", -[BGSystemTaskRequest blockRebootActivitiesForSU](self, "blockRebootActivitiesForSU"));
  -[BGSystemTaskRequest featureCodes](self, "featureCodes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
  objc_msgSend(v7, "setFeatureCodes:", v27);

  -[BGSystemTaskRequest diskVolume](self, "diskVolume");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDiskVolume:", v28);

  objc_msgSend(v7, "setRequiresExternalPowerIsSetByUser:", -[BGSystemTaskRequest requiresExternalPowerIsSetByUser](self, "requiresExternalPowerIsSetByUser"));
  -[BGSystemTaskRequest networkEndpointPrimitive](self, "networkEndpointPrimitive");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNetworkEndpointPrimitive:", v29);

  -[BGSystemTaskRequest networkParametersPrimitive](self, "networkParametersPrimitive");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNetworkParametersPrimitive:", v30);

  return v7;
}

- (int64_t)requiresProtectionClass
{
  int64_t result;
  NSObject *v4;
  uint8_t v5[16];

  if (!-[NSSet count](self->_dependencies, "count") && !-[NSSet count](self->_producedResultIdentifiers, "count"))
    return self->_requiresProtectionClass;
  result = self->_requiresProtectionClass;
  if (result >= 4)
  {
    v4 = _log_0;
    if (os_log_type_enabled((os_log_t)_log_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D13A5000, v4, OS_LOG_TYPE_DEFAULT, "Dependencies imply at least Class C unlock, clamping task request accordingly", v5, 2u);
    }
    return 3;
  }
  return result;
}

- (void)setRequiresExternalPower:(BOOL)a3
{
  self->_requiresExternalPower = a3;
  self->_requiresExternalPowerIsSetByUser = 1;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)requiresNetworkConnectivity
{
  return self->_requiresNetworkConnectivity;
}

- (void)setRequiresNetworkConnectivity:(BOOL)a3
{
  self->_requiresNetworkConnectivity = a3;
}

- (BOOL)requiresExternalPower
{
  return self->_requiresExternalPower;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void)setRequiresProtectionClass:(int64_t)a3
{
  self->_requiresProtectionClass = a3;
}

- (BOOL)preventsDeviceSleep
{
  return self->_preventsDeviceSleep;
}

- (void)setPreventsDeviceSleep:(BOOL)a3
{
  self->_preventsDeviceSleep = a3;
}

- (double)randomInitialDelay
{
  return self->_randomInitialDelay;
}

- (void)setRandomInitialDelay:(double)a3
{
  self->_randomInitialDelay = a3;
}

- (BOOL)postInstall
{
  return self->_postInstall;
}

- (void)setPostInstall:(BOOL)a3
{
  self->_postInstall = a3;
}

- (BOOL)requiresInexpensiveNetworkConnectivity
{
  return self->_requiresInexpensiveNetworkConnectivity;
}

- (void)setRequiresInexpensiveNetworkConnectivity:(BOOL)a3
{
  self->_requiresInexpensiveNetworkConnectivity = a3;
}

- (BOOL)requiresUnconstrainedNetworkConnectivity
{
  return self->_requiresUnconstrainedNetworkConnectivity;
}

- (void)setRequiresUnconstrainedNetworkConnectivity:(BOOL)a3
{
  self->_requiresUnconstrainedNetworkConnectivity = a3;
}

- (BOOL)appRefresh
{
  return self->_appRefresh;
}

- (void)setAppRefresh:(BOOL)a3
{
  self->_appRefresh = a3;
}

- (BOOL)requiresUserInactivity
{
  return self->_requiresUserInactivity;
}

- (void)setRequiresUserInactivity:(BOOL)a3
{
  self->_requiresUserInactivity = a3;
}

- (BOOL)requiresSignificantUserInactivity
{
  return self->_requiresSignificantUserInactivity;
}

- (void)setRequiresSignificantUserInactivity:(BOOL)a3
{
  self->_requiresSignificantUserInactivity = a3;
}

- (BOOL)powerNap
{
  return self->_powerNap;
}

- (void)setPowerNap:(BOOL)a3
{
  self->_powerNap = a3;
}

- (BOOL)resourceIntensive
{
  return self->_resourceIntensive;
}

- (void)setResourceIntensive:(BOOL)a3
{
  self->_resourceIntensive = a3;
}

- (int64_t)resources
{
  return self->_resources;
}

- (void)setResources:(int64_t)a3
{
  self->_resources = a3;
}

- (BOOL)mayRebootDevice
{
  return self->_mayRebootDevice;
}

- (void)setMayRebootDevice:(BOOL)a3
{
  self->_mayRebootDevice = a3;
}

- (BOOL)userRequestedBackupTask
{
  return self->_userRequestedBackupTask;
}

- (void)setUserRequestedBackupTask:(BOOL)a3
{
  self->_userRequestedBackupTask = a3;
}

- (int64_t)networkDownloadSize
{
  return self->_networkDownloadSize;
}

- (void)setNetworkDownloadSize:(int64_t)a3
{
  self->_networkDownloadSize = a3;
}

- (int64_t)networkUploadSize
{
  return self->_networkUploadSize;
}

- (void)setNetworkUploadSize:(int64_t)a3
{
  self->_networkUploadSize = a3;
}

- (BOOL)communicatesWithPairedDevice
{
  return self->_communicatesWithPairedDevice;
}

- (void)setCommunicatesWithPairedDevice:(BOOL)a3
{
  self->_communicatesWithPairedDevice = a3;
}

- (BOOL)shouldWakeDevice
{
  return self->_shouldWakeDevice;
}

- (void)setShouldWakeDevice:(BOOL)a3
{
  self->_shouldWakeDevice = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)groupConcurrencyLimit
{
  return self->_groupConcurrencyLimit;
}

- (void)setGroupConcurrencyLimit:(unint64_t)a3
{
  self->_groupConcurrencyLimit = a3;
}

- (NSString)rateLimitConfigurationName
{
  return self->_rateLimitConfigurationName;
}

- (void)setRateLimitConfigurationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (double)expectedDuration
{
  return self->_expectedDuration;
}

- (void)setExpectedDuration:(double)a3
{
  self->_expectedDuration = a3;
}

- (BOOL)powerBudgeted
{
  return self->_powerBudgeted;
}

- (void)setPowerBudgeted:(BOOL)a3
{
  self->_powerBudgeted = a3;
}

- (BOOL)dataBudgeted
{
  return self->_dataBudgeted;
}

- (void)setDataBudgeted:(BOOL)a3
{
  self->_dataBudgeted = a3;
}

- (NSArray)relatedApplications
{
  return self->_relatedApplications;
}

- (void)setRelatedApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)involvedProcesses
{
  return self->_involvedProcesses;
}

- (void)setInvolvedProcesses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)runOnAppForeground
{
  return self->_runOnAppForeground;
}

- (void)setRunOnAppForeground:(BOOL)a3
{
  self->_runOnAppForeground = a3;
}

- (BOOL)requestsApplicationLaunch
{
  return self->_requestsApplicationLaunch;
}

- (void)setRequestsApplicationLaunch:(BOOL)a3
{
  self->_requestsApplicationLaunch = a3;
}

- (BOOL)requiresBuddyComplete
{
  return self->_requiresBuddyComplete;
}

- (void)setRequiresBuddyComplete:(BOOL)a3
{
  self->_requiresBuddyComplete = a3;
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(int64_t)a3
{
  self->_targetDevice = a3;
}

- (NSString)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)requiresRemoteDeviceWake
{
  return self->_requiresRemoteDeviceWake;
}

- (void)setRequiresRemoteDeviceWake:(BOOL)a3
{
  self->_requiresRemoteDeviceWake = a3;
}

- (NSDictionary)networkEndpoint
{
  return self->_networkEndpoint;
}

- (void)setNetworkEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDictionary)networkParameters
{
  return self->_networkParameters;
}

- (void)setNetworkParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (int64_t)runOnMotionState
{
  return self->_runOnMotionState;
}

- (void)setRunOnMotionState:(int64_t)a3
{
  self->_runOnMotionState = a3;
}

- (NSSet)producedResultIdentifiers
{
  return self->_producedResultIdentifiers;
}

- (void)setProducedResultIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSSet)dependencies
{
  return self->_dependencies;
}

- (void)setDependencies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)overrideRateLimiting
{
  return self->_overrideRateLimiting;
}

- (void)setOverrideRateLimiting:(BOOL)a3
{
  self->_overrideRateLimiting = a3;
}

- (BOOL)magneticInterferenceSensitivity
{
  return self->_magneticInterferenceSensitivity;
}

- (void)setMagneticInterferenceSensitivity:(BOOL)a3
{
  self->_magneticInterferenceSensitivity = a3;
}

- (BOOL)mailFetch
{
  return self->_mailFetch;
}

- (void)setMailFetch:(BOOL)a3
{
  self->_mailFetch = a3;
}

- (BOOL)bypassBatteryAging
{
  return self->_bypassBatteryAging;
}

- (void)setBypassBatteryAging:(BOOL)a3
{
  self->_bypassBatteryAging = a3;
}

- (BOOL)bypassPeakPower
{
  return self->_bypassPeakPower;
}

- (void)setBypassPeakPower:(BOOL)a3
{
  self->_bypassPeakPower = a3;
}

- (BOOL)backlogged
{
  return self->_backlogged;
}

- (void)setBacklogged:(BOOL)a3
{
  self->_backlogged = a3;
}

- (unint64_t)requiresMinimumBatteryLevel
{
  return self->_requiresMinimumBatteryLevel;
}

- (void)setRequiresMinimumBatteryLevel:(unint64_t)a3
{
  self->_requiresMinimumBatteryLevel = a3;
}

- (unint64_t)requiresMinimumDataBudgetPercentage
{
  return self->_requiresMinimumDataBudgetPercentage;
}

- (void)setRequiresMinimumDataBudgetPercentage:(unint64_t)a3
{
  self->_requiresMinimumDataBudgetPercentage = a3;
}

- (BOOL)blockRebootActivitiesForSU
{
  return self->_blockRebootActivitiesForSU;
}

- (void)setBlockRebootActivitiesForSU:(BOOL)a3
{
  self->_blockRebootActivitiesForSU = a3;
}

- (BOOL)useStatisticalModelForTriggersRestart
{
  return self->_useStatisticalModelForTriggersRestart;
}

- (void)setUseStatisticalModelForTriggersRestart:(BOOL)a3
{
  self->_useStatisticalModelForTriggersRestart = a3;
}

- (NSArray)featureCodes
{
  return self->_featureCodes;
}

- (void)setFeatureCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)dataBudgetName
{
  return self->_dataBudgetName;
}

- (void)setDataBudgetName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)beforeApplicationLaunch
{
  return self->_beforeApplicationLaunch;
}

- (void)setBeforeApplicationLaunch:(BOOL)a3
{
  self->_beforeApplicationLaunch = a3;
}

- (NSString)diskVolume
{
  return self->_diskVolume;
}

- (void)setDiskVolume:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (OS_nw_endpoint)networkEndpointPrimitive
{
  return self->_networkEndpointPrimitive;
}

- (void)setNetworkEndpointPrimitive:(id)a3
{
  objc_storeStrong((id *)&self->_networkEndpointPrimitive, a3);
}

- (OS_nw_parameters)networkParametersPrimitive
{
  return self->_networkParametersPrimitive;
}

- (void)setNetworkParametersPrimitive:(id)a3
{
  objc_storeStrong((id *)&self->_networkParametersPrimitive, a3);
}

- (BOOL)requiresExternalPowerIsSetByUser
{
  return self->_requiresExternalPowerIsSetByUser;
}

- (void)setRequiresExternalPowerIsSetByUser:(BOOL)a3
{
  self->_requiresExternalPowerIsSetByUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkParametersPrimitive, 0);
  objc_storeStrong((id *)&self->_networkEndpointPrimitive, 0);
  objc_storeStrong((id *)&self->_diskVolume, 0);
  objc_storeStrong((id *)&self->_dataBudgetName, 0);
  objc_storeStrong((id *)&self->_featureCodes, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_producedResultIdentifiers, 0);
  objc_storeStrong((id *)&self->_networkParameters, 0);
  objc_storeStrong((id *)&self->_networkEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_involvedProcesses, 0);
  objc_storeStrong((id *)&self->_relatedApplications, 0);
  objc_storeStrong((id *)&self->_rateLimitConfigurationName, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)taskRequestWithDescriptor:withIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "%{public}@: Could not form task request", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)taskRequestWithDescriptor:withIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "%{public}@: Feature codes are mandatory for FastPass", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)taskRequestWithDescriptor:(void *)a1 withIdentifier:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, a2, v4, "%{public}@: networkDownloadSize cannot be empty when diskVolume is set", v5);

  OUTLINED_FUNCTION_2();
}

+ (void)taskRequestWithDescriptor:(NSObject *)a3 withIdentifier:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v8 = 2114;
  v9 = a2;
  OUTLINED_FUNCTION_8(&dword_1D13A5000, a3, v6, "%{public}@: Disk volume %{public}@ does not exist", v7);

}

+ (void)taskRequestWithDescriptor:(void *)a1 withIdentifier:(NSObject *)a2 .cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, a2, v4, "%{public}@: dataBudgeted cannot be false when dataBudgetName is set", v5);

  OUTLINED_FUNCTION_2();
}

+ (void)taskRequestWithDescriptor:withIdentifier:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "%{public}@: Non-consuming producer activities are not allowed to be submitted via plists", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)taskRequestWithDescriptor:(void *)a1 withIdentifier:(void *)a2 .cold.7(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_11(a1);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v3, v5, "%{public}@: relatedApplications cannot be empty when beforeApplicationLaunch is set to true", v6);

  OUTLINED_FUNCTION_2();
}

+ (void)taskRequestWithDescriptor:(void *)a1 withIdentifier:(void *)a2 .cold.8(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_11(a1);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v3, v5, "%{public}@: relatedApplications cannot be empty when requestsApplicationLaunch is set to true", v6);

  OUTLINED_FUNCTION_2();
}

+ (void)taskRequestWithDescriptor:(void *)a1 withIdentifier:(void *)a2 .cold.9(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_11(a1);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v3, v5, "%{public}@: relatedApplications cannot be empty when runOnAppForeground is set to true", v6);

  OUTLINED_FUNCTION_2();
}

+ (void)taskRequestWithDescriptor:(NSObject *)a3 withIdentifier:.cold.10(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = 138543874;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  v10 = 2080;
  v11 = "Maintenance";
  _os_log_error_impl(&dword_1D13A5000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Invalid priority value %@, Defaulting to %s", (uint8_t *)&v6, 0x20u);

}

+ (void)taskRequestWithDescriptor:withIdentifier:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v0, v1, "%{public}@: Feature codes, if present, must have entries", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)taskRequestWithDescriptor:withIdentifier:.cold.12()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_1D13A5000, a2, a3, "%{public}@: Dependencies require a valid object type", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_1D13A5000, a2, a3, "%{public}@: Dependencies require a valid identifier", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2080;
  v4 = v0;
  OUTLINED_FUNCTION_8(&dword_1D13A5000, v1, (uint64_t)v1, "%{public}@: Dependency type is of invalid form: %s", v2);
  OUTLINED_FUNCTION_1();
}

void __64__BGSystemTaskRequest_taskRequestWithDescriptor_withIdentifier___block_invoke_cold_4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_8(&dword_1D13A5000, a3, (uint64_t)a3, "%{public}@: %{public}@ is an invalid dependency form, must be a dictionary", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

+ (void)descriptorWithTaskRequest:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_11(a1);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v3, v5, "%{public}@: Feature codes are mandatory for FastPass", v6);

  OUTLINED_FUNCTION_2();
}

+ (void)descriptorWithTaskRequest:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_11(a1);
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D13A5000, v3, v5, "%{public}@: Repeating activites must have an interval of more than 300 sec", v6);

  OUTLINED_FUNCTION_2();
}

+ (void)descriptorWithTaskRequest:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D13A5000, log, OS_LOG_TYPE_ERROR, "Task Request of invalid type", v1, 2u);
}

@end
