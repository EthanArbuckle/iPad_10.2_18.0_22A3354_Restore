@implementation AMSMetricsLoggingEvent

- (AMSMetricsLoggingEvent)initWithSubsystem:(id)a3 category:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSMetricsLoggingEvent *v11;
  AMSMetricsLoggingEvent *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AMSMetricsLoggingEvent;
  v11 = -[AMSMetricsEvent initWithTopic:](&v14, sel_initWithTopic_, CFSTR("xp_amp_ams_log"));
  v12 = v11;
  if (v11)
  {
    -[AMSMetricsEvent setSuppressEngagement:](v11, "setSuppressEngagement:", 1);
    -[AMSMetricsLoggingEvent setSubsystem:](v12, "setSubsystem:", v8);
    -[AMSMetricsLoggingEvent setCategory:](v12, "setCategory:", v9);
    objc_storeStrong((id *)&v12->_error, a5);
    -[AMSMetricsLoggingEvent prepareEvent](v12, "prepareEvent");
  }

  return v12;
}

- (void)prepareEvent
{
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
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
  id v63;

  -[AMSMetricsEvent setAnonymous:](self, "setAnonymous:", 1);
  -[AMSMetricsEvent setCheckDiagnosticsAndUsageSetting:](self, "setCheckDiagnosticsAndUsageSetting:", 1);
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setClientApp:](self, "setClientApp:", v4);

  -[AMSMetricsLoggingEvent getBuildType](self, "getBuildType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setClientBuildType:](self, "setClientBuildType:", v5);

  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setCurrentProcess:](self, "setCurrentProcess:", v7);

  -[AMSMetricsEvent setEventType:](self, "setEventType:", CFSTR("log"));
  -[AMSMetricsLoggingEvent setLogLevel:](self, "setLogLevel:", 1);
  -[AMSMetricsLoggingEvent originatingURL](self, "originatingURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AMSMetricsLoggingEvent setOriginatingURL:](self, "setOriginatingURL:", v8);
  }
  else
  {
    -[AMSMetricsLoggingEvent error](self, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AMSURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMetricsLoggingEvent setOriginatingURL:](self, "setOriginatingURL:", v11);

  }
  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setReleaseVersion:](self, "setReleaseVersion:", v13);

  -[AMSMetricsLoggingEvent error](self, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setErrorCode:](self, "setErrorCode:", objc_msgSend(v14, "code"));

  -[AMSMetricsLoggingEvent error](self, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setErrorDomain:](self, "setErrorDomain:", v16);

  -[AMSMetricsLoggingEvent error](self, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ams_title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setErrorTitle:](self, "setErrorTitle:", v18);

  -[AMSMetricsLoggingEvent error](self, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ams_message");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setErrorMessage:](self, "setErrorMessage:", v20);

  -[AMSMetricsLoggingEvent error](self, "error");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "userInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("AMSCryptoErrorCode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setErrorUserInfoCryptoCode:](self, "setErrorUserInfoCryptoCode:", objc_msgSend(v23, "integerValue"));

  -[AMSMetricsLoggingEvent error](self, "error");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "userInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AMSEngagementPresented"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setErrorUserInfoEngagementPresented:](self, "setErrorUserInfoEngagementPresented:", objc_msgSend(v26, "BOOLValue"));

  -[AMSMetricsLoggingEvent error](self, "error");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "userInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("AMSServerErrorCode"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setErrorUserInfoServerErrorCode:](self, "setErrorUserInfoServerErrorCode:", objc_msgSend(v29, "integerValue"));

  -[AMSMetricsLoggingEvent error](self, "error");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "userInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("AMSStatusCode"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setErrorUserInfoStatusCode:](self, "setErrorUserInfoStatusCode:", objc_msgSend(v32, "integerValue"));

  -[AMSMetricsLoggingEvent clientApp](self, "clientApp");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v33, "isEqual:", CFSTR("com.apple.Fitness")) & 1) != 0)
    goto LABEL_7;
  -[AMSMetricsLoggingEvent clientApp](self, "clientApp");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isEqual:", CFSTR("com.apple.fitcored"));

  if ((v35 & 1) == 0)
  {
    +[AMSDevice buildVersion](AMSDevice, "buildVersion");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMetricsEvent setOsBuildVersion:](self, "setOsBuildVersion:", v36);

    +[AMSDevice operatingSystem](AMSDevice, "operatingSystem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMetricsEvent setOsName:](self, "setOsName:", v33);
LABEL_7:

  }
  -[AMSMetricsLoggingEvent error](self, "error");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "ams_underlyingError");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setUnderlyingErrorCode:](self, "setUnderlyingErrorCode:", objc_msgSend(v38, "code"));

  -[AMSMetricsLoggingEvent error](self, "error");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "ams_underlyingError");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "domain");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setUnderlyingErrorDomain:](self, "setUnderlyingErrorDomain:", v41);

  -[AMSMetricsLoggingEvent error](self, "error");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "ams_underlyingError");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "ams_message");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setUnderlyingErrorMessage:](self, "setUnderlyingErrorMessage:", v44);

  -[AMSMetricsLoggingEvent error](self, "error");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "ams_underlyingError");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "ams_title");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setUnderlyingErrorTitle:](self, "setUnderlyingErrorTitle:", v47);

  -[AMSMetricsLoggingEvent error](self, "error");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "ams_underlyingError");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "userInfo");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("AMSCryptoErrorCode"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setUnderlyingErrorUserInfoCryptoCode:](self, "setUnderlyingErrorUserInfoCryptoCode:", objc_msgSend(v51, "integerValue"));

  -[AMSMetricsLoggingEvent error](self, "error");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "ams_underlyingError");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "userInfo");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("AMSEngagementPresented"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setUnderlyingErrorUserInfoEngagementPresented:](self, "setUnderlyingErrorUserInfoEngagementPresented:", objc_msgSend(v55, "BOOLValue"));

  -[AMSMetricsLoggingEvent error](self, "error");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "ams_underlyingError");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "userInfo");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("AMSServerErrorCode"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setUnderlyingErrorUserInfoServerErrorCode:](self, "setUnderlyingErrorUserInfoServerErrorCode:", objc_msgSend(v59, "integerValue"));

  -[AMSMetricsLoggingEvent error](self, "error");
  v63 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "ams_underlyingError");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "userInfo");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("AMSStatusCode"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent setUnderlyingErrorUserInfoStatusCode:](self, "setUnderlyingErrorUserInfoStatusCode:", objc_msgSend(v62, "integerValue"));

}

- (id)getBuildType
{
  if (os_variant_has_internal_content())
    return CFSTR("internal");
  else
    return CFSTR("customer");
}

+ (id)shouldSampleErrorsWithBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  AMSMutableBinaryPromise *v6;
  AMSMutableBinaryPromise *v7;
  void *v8;
  NSObject *v9;
  _QWORD v11[4];
  AMSMutableBinaryPromise *v12;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleForKey:", CFSTR("amsmetrics-logging-sampling"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__48;
    v17 = __Block_byref_object_dispose__48;
    objc_msgSend(v4, "doubleForKey:", CFSTR("amsmetrics-logging-sampling-session"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(AMSMutableBinaryPromise);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__AMSMetricsLoggingEvent_shouldSampleErrorsWithBag___block_invoke;
    v11[3] = &unk_1E2543F88;
    p_buf = &buf;
    v7 = v6;
    v12 = v7;
    objc_msgSend(v5, "valueWithCompletion:", v11);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = CFSTR("amsmetrics-logging-sampling");
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "Bag not provided for %@", (uint8_t *)&buf, 0xCu);
    }

    +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess");
    v7 = (AMSMutableBinaryPromise *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __52__AMSMetricsLoggingEvent_shouldSampleErrorsWithBag___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (a4)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = CFSTR("amsmetrics-logging-sampling");
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "Unable to pull bag value for %@", buf, 0xCu);
    }

    v6 = &unk_1E25AF830;
  }
  v9 = *(void **)(a1 + 32);
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__AMSMetricsLoggingEvent_shouldSampleErrorsWithBag___block_invoke_214;
  v12[3] = &unk_1E2543F60;
  v13 = v6;
  v14 = v9;
  v11 = v6;
  objc_msgSend(v10, "valueWithCompletion:", v12);

}

void __52__AMSMetricsLoggingEvent_shouldSampleErrorsWithBag___block_invoke_214(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  _BOOL8 v13;
  void *v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (v7)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = CFSTR("amsmetrics-logging-sampling-session");
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "Unable to pull bag value for %@", (uint8_t *)&v15, 0xCu);
    }

    v6 = &unk_1E25AF830;
  }
  objc_msgSend(*(id *)(a1 + 32), "doubleValue");
  v11 = v10;
  objc_msgSend(v6, "doubleValue");
  v13 = +[AMSDefaults shouldSampleWithPercentage:sessionDuration:identifier:](AMSDefaults, "shouldSampleWithPercentage:sessionDuration:identifier:", 0x1E2551760, v11, v12);
  if (v13)
  {
    v14 = 0;
  }
  else
  {
    AMSError(11, CFSTR("Metrics Logging Event Failure"), CFSTR("Not sampling"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess:error:", v13, v14);

}

- (NSMutableDictionary)underlyingDictionaryForSentry
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  uint64_t v37;
  __CFString *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
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
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  AMSMetricsLoggingEvent *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
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
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t j;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  char isKindOfClass;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v148;
  void *v149;
  __CFString *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  id obj;
  id v160;
  AMSMetricsLoggingEvent *v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  uint64_t v177;

  v177 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("contexts"), CFSTR("app"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("breadcrumbs"), CFSTR("values"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("mechanism"), CFSTR("data"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("exception"), CFSTR("values"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("mechanism"), CFSTR("meta"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("contexts"), CFSTR("os"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", CFSTR("production"), CFSTR("environment"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("event_id"));

  -[AMSMetricsLoggingEvent stringForLogLevel:](self, "stringForLogLevel:", -[AMSMetricsLoggingEvent logLevel](self, "logLevel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("level"));

  objc_msgSend(v3, "setValue:forKey:", CFSTR("ams"), CFSTR("project"));
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[AMSMetricsEvent osName](self, "osName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent osVersion](self, "osVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@@%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("release"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  objc_msgSend(v11, "numberWithInteger:", (uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v14, CFSTR("timestamp"));

  objc_msgSend(v3, "setValue:forKey:", CFSTR("xp_amp_ams_error_log"), CFSTR("topic"));
  -[AMSMetricsLoggingEvent currentProcess](self, "currentProcess");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("extra.%@"), CFSTR("current_process"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setValue:forKeyPath:", v15, v16);

  -[AMSMetricsLoggingEvent url](self, "url");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("request"), CFSTR("url"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v3;
  objc_msgSend(v3, "ams_setValue:forKeyPath:", v17, v18);

  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  -[AMSMetricsLoggingEvent jsVersions](self, "jsVersions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "keyEnumerator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v170, v176, 16);
  v161 = self;
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v171;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v171 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * i);
        -[AMSMetricsLoggingEvent eventDestinations](self, "eventDestinations");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "containsObject:", v25))
        {

        }
        else
        {
          -[AMSMetricsLoggingEvent eventDestinations](self, "eventDestinations");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "count");

          self = v161;
          if (v28)
            continue;
        }
        -[AMSMetricsLoggingEvent jsVersions](self, "jsVersions");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("modules"), v25);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "ams_setValue:forKeyPath:", v30, v31);

        self = v161;
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v170, v176, 16);
    }
    while (v22);
  }

  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  -[AMSMetricsLoggingEvent eventDestinations](self, "eventDestinations");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v166, v175, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v167;
    v36 = &stru_1E2548760;
    do
    {
      v37 = 0;
      v38 = v36;
      do
      {
        if (*(_QWORD *)v167 != v35)
          objc_enumerationMutation(v32);
        v39 = *(_QWORD *)(*((_QWORD *)&v166 + 1) + 8 * v37);
        v40 = (void *)MEMORY[0x1E0CB3940];
        if (-[__CFString length](v38, "length"))
          v41 = CFSTR(", ");
        else
          v41 = &stru_1E2548760;
        objc_msgSend(v40, "stringWithFormat:", CFSTR("%@%@%@"), v38, v41, v39);
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v37;
        v38 = v36;
      }
      while (v34 != v37);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v166, v175, 16);
    }
    while (v34);

    self = v161;
    if (!v36)
      goto LABEL_26;
  }
  else
  {

    v36 = &stru_1E2548760;
  }
  if ((-[__CFString isEqualToString:](v36, "isEqualToString:", &stru_1E2548760) & 1) == 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("destination"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "ams_setValue:forKeyPath:", v36, v42);

  }
  v150 = v36;
  -[AMSMetricsLoggingEvent jsVersions](self, "jsVersions");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "allValues");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "componentsJoinedByString:", CFSTR(", "));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45 || (objc_msgSend(v45, "isEqualToString:", &stru_1E2548760) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("js_version"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "ams_setValue:forKeyPath:", v45, v46);

  }
  v149 = v45;
  -[AMSMetricsLoggingEvent clientBuildType](self, "clientBuildType");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("build_type"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v47, v48);

  -[AMSMetricsLoggingEvent clientApp](self, "clientApp");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("app_version"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v49, v50);

  -[AMSMetricsLoggingEvent engagementEventType](self, "engagementEventType");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("engagement_event_type"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v51, v52);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSMetricsLoggingEvent eventInlineInterruption](self, "eventInlineInterruption"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("event_inline_interruption"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v53, v54);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSMetricsLoggingEvent errorCode](self, "errorCode"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("code"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v55, v56);

  -[AMSMetricsLoggingEvent errorDomain](self, "errorDomain");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("domain"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v57, v58);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSMetricsLoggingEvent errorUserInfoCryptoCode](self, "errorUserInfoCryptoCode"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("error_crypto_code"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v59, v60);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSMetricsLoggingEvent errorUserInfoStatusCode](self, "errorUserInfoStatusCode"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("status_code"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v61, v62);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSMetricsLoggingEvent errorUserInfoServerErrorCode](self, "errorUserInfoServerErrorCode"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("error_server_code"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v63, v64);

  -[AMSMetricsLoggingEvent eventPlacement](self, "eventPlacement");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("event_placement"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v65, v66);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSMetricsLoggingEvent errorUserInfoEngagementPresented](self, "errorUserInfoEngagementPresented"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("presented"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v67, v68);

  -[AMSMetricsLoggingEvent eventServiceType](self, "eventServiceType");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("event_service_type"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v69, v70);

  -[AMSMetricsLoggingEvent lastBreadcrumb](self, "lastBreadcrumb");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("last_breadcrumb"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v71, v72);

  v73 = (void *)MEMORY[0x1E0CB37E8];
  -[AMSMetricsLoggingEvent lastBreadcrumbDuration](self, "lastBreadcrumbDuration");
  objc_msgSend(v73, "numberWithDouble:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("last_breadcrumb_duration"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v74, v75);

  -[AMSMetricsEvent osVersion](self, "osVersion");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("osVersion"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v76, v77);

  -[AMSMetricsLoggingEvent releaseVersion](v161, "releaseVersion");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("app_version"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v78, v79);

  -[AMSMetricsLoggingEvent subsystem](v161, "subsystem");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("tags"), CFSTR("subsystem"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v80, v81);

  -[AMSMetricsLoggingEvent releaseVersion](v161, "releaseVersion");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v154, CFSTR("app_version"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v82, v83);

  -[AMSMetricsLoggingEvent clientApp](v161, "clientApp");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v154, CFSTR("app_identifier"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v84, v85);

  -[AMSMetricsLoggingEvent clientBuildType](v161, "clientBuildType");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v154, CFSTR("build_type"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v86, v87);

  -[AMSMetricsEvent osVersion](v161, "osVersion");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v161;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v152, CFSTR("osVersion"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v88, v90);

  -[AMSMetricsEvent osBuildVersion](v161, "osBuildVersion");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v152, CFSTR("build"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v91, v92);

  -[AMSMetricsEvent osName](v161, "osName");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v152, CFSTR("name"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v93, v94);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSMetricsLoggingEvent errorCode](v161, "errorCode"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), v156, CFSTR("ns_error"), CFSTR("code"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "ams_setValue:forKeyPath:", v96, v97);

  -[AMSMetricsLoggingEvent errorDomain](v161, "errorDomain");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), v156, CFSTR("ns_error"), CFSTR("domain"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "ams_setValue:forKeyPath:", v98, v99);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSMetricsLoggingEvent errorUserInfoCryptoCode](v161, "errorUserInfoCryptoCode"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v157, CFSTR("error_crypto_code"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "ams_setValue:forKeyPath:", v100, v101);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSMetricsLoggingEvent errorUserInfoServerErrorCode](v161, "errorUserInfoServerErrorCode"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v157, CFSTR("error_server_code"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "ams_setValue:forKeyPath:", v102, v103);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSMetricsLoggingEvent errorUserInfoStatusCode](v161, "errorUserInfoStatusCode"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v157, CFSTR("status_code"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "ams_setValue:forKeyPath:", v104, v105);

  objc_msgSend(v95, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("handled"));
  -[AMSMetricsLoggingEvent category](v161, "category");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("mechanism"), CFSTR("type"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "ams_setValue:forKeyPath:", v106, v107);

  -[AMSMetricsLoggingEvent errorTitle](v161, "errorTitle");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setValue:forKey:", v108, CFSTR("type"));

  -[AMSMetricsLoggingEvent errorMessage](v161, "errorMessage");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v109, "length"))
  {
    -[AMSMetricsLoggingEvent errorMessage](v161, "errorMessage");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setValue:forKey:", v110, CFSTR("value"));
    v111 = v155;
  }
  else
  {
    -[AMSMetricsLoggingEvent errorTitle](v161, "errorTitle");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v110, "length"))
      -[AMSMetricsLoggingEvent errorTitle](v161, "errorTitle");
    else
      -[AMSMetricsLoggingEvent errorDomain](v161, "errorDomain");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v155;
    objc_msgSend(v95, "setValue:forKey:", v112, CFSTR("value"));

  }
  v148 = v95;
  objc_msgSend(v111, "addObject:", v95);
  -[AMSMetricsLoggingEvent underlyingErrorTitle](v161, "underlyingErrorTitle");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "length");

  if (v114)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSMetricsLoggingEvent underlyingErrorCode](v161, "underlyingErrorCode"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), v156, CFSTR("ns_error"), CFSTR("code"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "ams_setValue:forKeyPath:", v116, v117);

    -[AMSMetricsLoggingEvent errorDomain](v161, "errorDomain");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), v156, CFSTR("ns_error"), CFSTR("domain"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "ams_setValue:forKeyPath:", v118, v119);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSMetricsLoggingEvent underlyingErrorUserInfoCryptoCode](v161, "underlyingErrorUserInfoCryptoCode"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v157, CFSTR("error_crypto_code"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "ams_setValue:forKeyPath:", v120, v121);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSMetricsLoggingEvent underlyingErrorUserInfoServerErrorCode](v161, "underlyingErrorUserInfoServerErrorCode"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v157, CFSTR("error_server_code"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "ams_setValue:forKeyPath:", v122, v123);

    objc_msgSend(v115, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("handled"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSMetricsLoggingEvent underlyingErrorUserInfoStatusCode](v161, "underlyingErrorUserInfoStatusCode"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v157, CFSTR("status_code"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "ams_setValue:forKeyPath:", v124, v125);

    -[AMSMetricsLoggingEvent underlyingErrorTitle](v161, "underlyingErrorTitle");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "setValue:forKey:", v126, CFSTR("type"));

    -[AMSMetricsLoggingEvent underlyingErrorMessage](v161, "underlyingErrorMessage");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "setValue:forKey:", v127, CFSTR("value"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSMetricsLoggingEvent underlyingErrorUserInfoEngagementPresented](v161, "underlyingErrorUserInfoEngagementPresented"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v161;
    v111 = v155;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v157, CFSTR("presented"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "ams_setValue:forKeyPath:", v128, v129);

    objc_msgSend(v155, "addObject:", v115);
  }
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v111, v153);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  -[AMSMetricsLoggingEvent breadcrumbs](v89, "breadcrumbs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v130 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v162, v174, 16);
  if (v130)
  {
    v131 = v130;
    v132 = *(_QWORD *)v163;
    do
    {
      for (j = 0; j != v131; ++j)
      {
        if (*(_QWORD *)v163 != v132)
          objc_enumerationMutation(obj);
        v134 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3578], "ams_serverFriendlyFormatter");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v134, "doubleValue");
        objc_msgSend(v137, "dateWithTimeIntervalSince1970:");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "stringFromDate:", v138);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "setValue:forKey:", v139, CFSTR("timestamp"));

        -[AMSMetricsLoggingEvent breadcrumbs](v161, "breadcrumbs");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "objectForKeyedSubscript:", v134);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[AMSMetricsLoggingEvent breadcrumbs](v161, "breadcrumbs");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "objectForKeyedSubscript:", v134);
          v144 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("message"));
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "setValue:forKey:", v145, CFSTR("message"));

          objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("category"));
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "setValue:forKey:", v146, CFSTR("category"));

          objc_msgSend(v158, "addObject:", v135);
        }

      }
      v131 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v162, v174, 16);
    }
    while (v131);
  }

  if (objc_msgSend(v158, "count"))
    objc_msgSend(v160, "ams_setValue:forKeyPath:", v158, CFSTR("breadcrumbs"));

  return (NSMutableDictionary *)v160;
}

- (NSDictionary)breadcrumbs
{
  return self->_breadcrumbs;
}

- (NSString)category
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("category"));
}

- (NSString)clientApp
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("clientApp"));
}

- (NSString)clientBuildType
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("clientBuildType"));
}

- (NSString)currentProcess
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("currentProcess"));
}

- (NSString)engagementEventType
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("engagementEventType"));
}

- (int64_t)errorCode
{
  void *v2;
  int64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("errorCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)errorDomain
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("errorDomain"));
}

- (NSString)errorTitle
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("errorTitle"));
}

- (NSString)errorMessage
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("errorMessage"));
}

- (int64_t)errorUserInfoCryptoCode
{
  void *v2;
  int64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("errorUserInfoCryptoCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)errorUserInfoEngagementPresented
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("errorUserInfoEngagementPresented"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (int64_t)errorUserInfoServerErrorCode
{
  void *v2;
  int64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("errorUserInfoServerErrorCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)errorUserInfoStatusCode
{
  void *v2;
  int64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("errorUserInfoStatusCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSArray)eventDestinations
{
  return (NSArray *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventDestinations"));
}

- (double)eventEndTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventEndTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (BOOL)eventInlineInterruption
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventInlineInterruption"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)eventParamEventType
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventParamEventType"));
}

- (NSString)eventParamItemId
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventParamItemId"));
}

- (NSString)eventParamProductType
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventParamProductType"));
}

- (NSString)eventParamSource
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventParamSource"));
}

- (NSString)eventParamSuccess
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventParamSuccess"));
}

- (NSString)eventPlacement
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventPlacement"));
}

- (NSString)eventServiceType
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventServiceType"));
}

- (double)eventStartTime
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventStartTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics timeIntervalFromServerTime:](AMSMetrics, "timeIntervalFromServerTime:", v2);
  v4 = v3;

  return v4;
}

- (NSArray)jsVersionMap
{
  return (NSArray *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("jsVersionMap"));
}

- (NSString)lastBreadcrumb
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("lastBreadcrumb"));
}

- (double)lastBreadcrumbDuration
{
  void *v2;
  double v3;
  double v4;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("lastBreadcrumbDuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (int64_t)logLevel
{
  void *v2;
  int64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("logLevel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (id)stringForLogLevel:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("debug"), CFSTR("error"), CFSTR("info"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)originatingURL
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("originatingURL"));
}

- (NSString)originatingURLParamBagProfile
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("originatingURLParamBagProfile"));
}

- (NSString)originatingURLParamBagProfileVersion
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("originatingURLParamBagProfileVersion"));
}

- (NSString)releaseVersion
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("releaseVersion"));
}

- (NSString)subsystem
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("subsystem"));
}

- (id)underlyingDictionaryOverride
{
  __CFString *v3;
  void *v4;

  -[AMSMetricsEvent topic](self, "topic");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3 == CFSTR("xp_amp_ams_error_log"))
  {
    -[AMSMetricsLoggingEvent underlyingDictionaryForSentry](self, "underlyingDictionaryForSentry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)underlyingErrorCode
{
  void *v2;
  int64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("underlyingErrorCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)underlyingErrorDomain
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("underlyingErrorDomain"));
}

- (NSString)underlyingErrorMessage
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("underlyingErrorMessage"));
}

- (NSString)underlyingErrorTitle
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("underlyingErrorTitle"));
}

- (int64_t)underlyingErrorUserInfoCryptoCode
{
  void *v2;
  int64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("underlyingErrorUserInfoCryptoCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)underlyingErrorUserInfoEngagementPresented
{
  void *v2;
  char v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("underlyingErrorUserInfoEngagementPresented"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (int64_t)underlyingErrorUserInfoServerErrorCode
{
  void *v2;
  int64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("underlyingErrorUserInfoServerErrorCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)underlyingErrorUserInfoStatusCode
{
  void *v2;
  int64_t v3;

  -[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("underlyingErrorUserInfoStatusCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)url
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("url"));
}

- (NSString)urlParamBagProfile
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("urlParamBagProfile"));
}

- (NSString)urlParamBagProfileVersion
{
  return (NSString *)-[AMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("urlParamBagProfileVersion"));
}

- (void)setBreadcrumbs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *breadcrumbs;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_94);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("message"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v8, CFSTR("lastBreadcrumb"));

  }
  else
  {
    -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", 0, CFSTR("lastBreadcrumb"));
  }
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", &unk_1E25AF830, CFSTR("lastBreadcrumbDuration"));
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    objc_msgSend(v5, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v18, "count") - 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 - v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v15, CFSTR("lastBreadcrumbDuration"));

  }
  v16 = (NSDictionary *)objc_msgSend(v18, "copy");
  breadcrumbs = self->_breadcrumbs;
  self->_breadcrumbs = v16;

}

BOOL __41__AMSMetricsLoggingEvent_setBreadcrumbs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "doubleValue");
  v6 = v5;
  objc_msgSend(v4, "doubleValue");
  v8 = v7;

  return v6 > v8;
}

- (void)setCategory:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("category"));
}

- (void)setClientApp:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("clientApp"));
}

- (void)setClientBuildType:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("clientBuildType"));
}

- (void)setCurrentProcess:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("currentProcess"));
}

- (void)setEngagementEventType:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("engagementEventType"));
}

- (void)setErrorCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("errorCode"));

}

- (void)setErrorDomain:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("errorDomain"));
}

- (void)setErrorMessage:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("errorMessage"));
}

- (void)setErrorTitle:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("errorTitle"));
}

- (void)setErrorUserInfoCryptoCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("errorUserInfoCryptoCode"));

}

- (void)setErrorUserInfoEngagementPresented:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("errorUserInfoEngagementPresented"));

}

- (void)setErrorUserInfoServerErrorCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("errorUserInfoServerErrorCode"));

}

- (void)setErrorUserInfoStatusCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("errorUserInfoStatusCode"));

}

- (void)setEventDestinations:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__AMSMetricsLoggingEvent_setEventDestinations___block_invoke;
  v8[3] = &unk_1E2542260;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v7, CFSTR("eventDestinations"));
}

void __47__AMSMetricsLoggingEvent_setEventDestinations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
  v3 = v6;

  v4 = *(void **)(a1 + 32);
  if (!v3)
  {
LABEL_5:
    objc_msgSend(v4, "addObject:", v6);
    v3 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

LABEL_6:
}

- (void)setEventEndTime:(double)a3
{
  id v4;

  +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("eventEndTime"));

}

- (void)setEventInlineInterruption:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("eventInlineInterruption"));

}

- (void)setEventParamEventType:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventParamEventType"));
}

- (void)setEventParamItemId:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventParamItemId"));
}

- (void)setEventParamProductType:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventParamProductType"));
}

- (void)setEventParamSource:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventParamSource"));
}

- (void)setEventParamSuccess:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventParamSuccess"));
}

- (void)setEventPlacement:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventPlacement"));
}

- (void)setEventServiceType:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventServiceType"));
}

- (void)setEventStartTime:(double)a3
{
  id v4;

  +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("eventStartTime"));

}

- (void)setJsVersionMap:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("jsVersionMap"));
}

- (void)setJsVersions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *jsVersions;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: %@"), v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  -[AMSMetricsLoggingEvent setJsVersionMap:](self, "setJsVersionMap:", v4);
  v14 = (NSDictionary *)objc_msgSend(v5, "copy");
  jsVersions = self->_jsVersions;
  self->_jsVersions = v14;

}

- (void)setLogLevel:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("logLevel"));

}

- (void)setOriginatingURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v22 = v4;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v4);
    objc_msgSend(v5, "queryItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", CFSTR("profile"));

          if (v14)
          {
            objc_msgSend(v12, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[AMSMetricsLoggingEvent setOriginatingURLParamBagProfile:](self, "setOriginatingURLParamBagProfile:", v15);

          }
          objc_msgSend(v12, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", CFSTR("profileVersion"));

          if (v17)
          {
            objc_msgSend(v12, "value");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[AMSMetricsLoggingEvent setOriginatingURLParamBagProfileVersion:](self, "setOriginatingURLParamBagProfileVersion:", v18);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    v4 = v22;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent cleanURL:](self, "cleanURL:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "absoluteString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v21, CFSTR("originatingURL"));

}

- (void)setOriginatingURLParamBagProfile:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("originatingURLParamBagProfile"));
}

- (void)setOriginatingURLParamBagProfileVersion:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("originatingURLParamBagProfileVersion"));
}

- (void)setReleaseVersion:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("releaseVersion"));
}

- (void)setSubsystem:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("subsystem"));
}

- (void)setUnderlyingErrorCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("underlyingErrorCode"));

}

- (void)setUnderlyingErrorDomain:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("underlyingErrorDomain"));
}

- (void)setUnderlyingErrorMessage:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("underlyingErrorMessage"));
}

- (void)setUnderlyingErrorTitle:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("underlyingErrorTitle"));
}

- (void)setUnderlyingErrorUserInfoCryptoCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("underlyingErrorUserInfoCryptoCode"));

}

- (void)setUnderlyingErrorUserInfoEngagementPresented:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("underlyingErrorUserInfoEngagementPresented"));

}

- (void)setUnderlyingErrorUserInfoServerErrorCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("underlyingErrorUserInfoServerErrorCode"));

}

- (void)setUnderlyingErrorUserInfoStatusCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("underlyingErrorUserInfoStatusCode"));

}

- (void)setUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v4);
    objc_msgSend(v5, "queryItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v11, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", CFSTR("profile"));

          if (v13)
          {
            objc_msgSend(v11, "value");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[AMSMetricsLoggingEvent setUrlParamBagProfile:](self, "setUrlParamBagProfile:", v14);

          }
          objc_msgSend(v11, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqual:", CFSTR("profileVersion"));

          if (v16)
          {
            objc_msgSend(v11, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[AMSMetricsLoggingEvent setUrlParamBagProfileVersion:](self, "setUrlParamBagProfileVersion:", v17);

          }
          objc_msgSend(v11, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", CFSTR("placement"));

          if (v19)
          {
            objc_msgSend(v11, "value");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[AMSMetricsLoggingEvent setEventPlacement:](self, "setEventPlacement:", v20);

          }
          objc_msgSend(v11, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqual:", CFSTR("serviceType"));

          if (v22)
          {
            objc_msgSend(v11, "value");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[AMSMetricsLoggingEvent setEventServiceType:](self, "setEventServiceType:", v23);

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v8);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsLoggingEvent cleanURL:](self, "cleanURL:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "absoluteString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v26, CFSTR("url"));

}

- (void)setUrlParamBagProfile:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("urlParamBagProfile"));
}

- (void)setUrlParamBagProfileVersion:(id)a3
{
  -[AMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("urlParamBagProfileVersion"));
}

+ (id)_propertyValueClassesForKnownProperties
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[44];
  _QWORD v9[45];

  v9[44] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("category");
  v9[0] = objc_opt_class();
  v8[1] = CFSTR("clientApp");
  v9[1] = objc_opt_class();
  v8[2] = CFSTR("clientBuildType");
  v9[2] = objc_opt_class();
  v8[3] = CFSTR("currentProcess");
  v9[3] = objc_opt_class();
  v8[4] = CFSTR("engagementEventType");
  v9[4] = objc_opt_class();
  v8[5] = CFSTR("errorCode");
  v9[5] = objc_opt_class();
  v8[6] = CFSTR("errorDomain");
  v9[6] = objc_opt_class();
  v8[7] = CFSTR("errorMessage");
  v9[7] = objc_opt_class();
  v8[8] = CFSTR("errorTitle");
  v9[8] = objc_opt_class();
  v8[9] = CFSTR("errorUserInfoCryptoCode");
  v9[9] = objc_opt_class();
  v8[10] = CFSTR("errorUserInfoEngagementPresented");
  v9[10] = objc_opt_class();
  v8[11] = CFSTR("errorUserInfoServerErrorCode");
  v9[11] = objc_opt_class();
  v8[12] = CFSTR("errorUserInfoStatusCode");
  v9[12] = objc_opt_class();
  v8[13] = CFSTR("eventDestinations");
  v9[13] = objc_opt_class();
  v8[14] = CFSTR("eventEndTime");
  v9[14] = objc_opt_class();
  v8[15] = CFSTR("eventInlineInterruption");
  v9[15] = objc_opt_class();
  v8[16] = CFSTR("eventParamEventType");
  v9[16] = objc_opt_class();
  v8[17] = CFSTR("eventParamItemId");
  v9[17] = objc_opt_class();
  v8[18] = CFSTR("eventParamProductType");
  v9[18] = objc_opt_class();
  v8[19] = CFSTR("eventParamSource");
  v9[19] = objc_opt_class();
  v8[20] = CFSTR("eventParamSuccess");
  v9[20] = objc_opt_class();
  v8[21] = CFSTR("eventPlacement");
  v9[21] = objc_opt_class();
  v8[22] = CFSTR("eventServiceType");
  v9[22] = objc_opt_class();
  v8[23] = CFSTR("eventStartTime");
  v9[23] = objc_opt_class();
  v8[24] = CFSTR("jsVersionMap");
  v9[24] = objc_opt_class();
  v8[25] = CFSTR("lastBreadcrumb");
  v9[25] = objc_opt_class();
  v8[26] = CFSTR("lastBreadcrumbDuration");
  v9[26] = objc_opt_class();
  v8[27] = CFSTR("logLevel");
  v9[27] = objc_opt_class();
  v8[28] = CFSTR("originatingURL");
  v9[28] = objc_opt_class();
  v8[29] = CFSTR("originatingURLParamBagProfile");
  v9[29] = objc_opt_class();
  v8[30] = CFSTR("originatingURLParamBagProfileVersion");
  v9[30] = objc_opt_class();
  v8[31] = CFSTR("releaseVersion");
  v9[31] = objc_opt_class();
  v8[32] = CFSTR("subsystem");
  v9[32] = objc_opt_class();
  v8[33] = CFSTR("underlyingErrorCode");
  v9[33] = objc_opt_class();
  v8[34] = CFSTR("underlyingErrorDomain");
  v9[34] = objc_opt_class();
  v8[35] = CFSTR("underlyingErrorMessage");
  v9[35] = objc_opt_class();
  v8[36] = CFSTR("underlyingErrorTitle");
  v9[36] = objc_opt_class();
  v8[37] = CFSTR("underlyingErrorUserInfoCryptoCode");
  v9[37] = objc_opt_class();
  v8[38] = CFSTR("underlyingErrorUserInfoEngagementPresented");
  v9[38] = objc_opt_class();
  v8[39] = CFSTR("underlyingErrorUserInfoServerErrorCode");
  v9[39] = objc_opt_class();
  v8[40] = CFSTR("underlyingErrorUserInfoStatusCode");
  v9[40] = objc_opt_class();
  v8[41] = CFSTR("url");
  v9[41] = objc_opt_class();
  v8[42] = CFSTR("urlParamBagProfile");
  v9[42] = objc_opt_class();
  v8[43] = CFSTR("urlParamBagProfileVersion");
  v9[43] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 44);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AMSMetricsLoggingEvent;
  objc_msgSendSuper2(&v7, sel__propertyValueClassesForKnownProperties);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  return v4;
}

- (id)cleanURL:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0CB3998];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithURL:resolvingAgainstBaseURL:", v4, 1);

    objc_msgSend(v5, "queryItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_274);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
      v8 = v7;
    else
      v8 = 0;
    objc_msgSend(v5, "setQueryItems:", v8);
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v5, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURL(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

id __35__AMSMetricsLoggingEvent_cleanURL___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", CFSTR("iadid")))
    v5 = 0;
  else
    v5 = v2;
  v6 = v5;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSMetricsLoggingEvent;
  v4 = -[AMSMetricsEvent copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 8, self->_jsVersions);
  objc_storeStrong(v4 + 6, self->_breadcrumbs);
  objc_storeStrong(v4 + 7, self->_error);
  return v4;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)jsVersions
{
  return self->_jsVersions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsVersions, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_breadcrumbs, 0);
}

@end
