@implementation AMSUserNotification

uint64_t __64__AMSUserNotification_notificationCenter_didChangeSettings_bag___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess");
}

id __64__AMSUserNotification_notificationCenter_didChangeSettings_bag___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  +[AMSUserNotificationMetricsEvent eventForSettingsChangedWithSettings:bundleID:account:](AMSUserNotificationMetricsEvent, "eventForSettingsChangedWithSettings:bundleID:account:", a1[4], a1[5], a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueEvent:", v3);
  objc_msgSend(v4, "flush");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __64__AMSUserNotification_notificationCenter_didChangeSettings_bag___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1[4], "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_activeiTunesAccountForMediaType:", AMSAccountMediaTypeProduction);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__AMSUserNotification_notificationCenter_didChangeSettings_bag___block_invoke_2;
  v13[3] = &unk_1E2547590;
  v14 = v3;
  v15 = v4;
  v16 = a1[5];
  v8 = v4;
  v9 = v3;
  objc_msgSend(v6, "continueWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __64__AMSUserNotification_notificationCenter_didChangeSettings_bag___block_invoke_3;
  v11[3] = &unk_1E253DF98;
  v12 = a1[6];
  objc_msgSend(v10, "addFinishBlock:", v11);

}

+ (id)notificationCenter:(id)a3 didChangeSettings:(id)a4 bag:(id)a5
{
  id v6;
  id v7;
  AMSMutableBinaryPromise *v8;
  AMSMutableBinaryPromise *v9;
  id v10;
  id v11;
  AMSMutableBinaryPromise *v12;
  AMSMutableBinaryPromise *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  AMSMutableBinaryPromise *v18;

  v6 = a3;
  v7 = a5;
  v8 = objc_alloc_init(AMSMutableBinaryPromise);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__AMSUserNotification_notificationCenter_didChangeSettings_bag___block_invoke;
  v15[3] = &unk_1E25475B8;
  v16 = v6;
  v17 = v7;
  v9 = v8;
  v18 = v9;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v11, "getNotificationSettingsWithCompletionHandler:", v15);
  v12 = v18;
  v13 = v9;

  return v13;
}

- (AMSUserNotification)init
{
  AMSUserNotification *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUserNotification;
  result = -[AMSUserNotification init](&v3, sel_init);
  if (result)
    result->_interruptionLevel = *MEMORY[0x1E0CEC820];
  return result;
}

- (AMSUserNotification)initWithTitle:(id)a3
{
  return -[AMSUserNotification initWithTitle:intent:](self, "initWithTitle:intent:", a3, 0);
}

- (AMSUserNotification)initWithTitle:(id)a3 intent:(int64_t)a4
{
  id v7;
  AMSUserNotification *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *categoryIdentifier;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  NSString *logKey;
  NSMutableDictionary *v21;
  NSMutableDictionary *userInfo;

  v7 = a3;
  v8 = -[AMSUserNotification init](self, "init");
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), CFSTR("ams_"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    categoryIdentifier = v8->_categoryIdentifier;
    v8->_categoryIdentifier = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@%@"), CFSTR("ams_"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v17;

    v8->_intent = a4;
    AMSGenerateLogCorrelationKey();
    v19 = objc_claimAutoreleasedReturnValue();
    logKey = v8->_logKey;
    v8->_logKey = (NSString *)v19;

    objc_storeStrong((id *)&v8->_title, a3);
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v8->_userInfo;
    v8->_userInfo = v21;

  }
  return v8;
}

+ (id)notificationWithPayload:(id)a3 andConfig:(id)a4
{
  id v5;
  id v6;
  AMSUserNotification *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AMSUserNotification initWithPayload:andConfig:]([AMSUserNotification alloc], "initWithPayload:andConfig:", v6, v5);

  return v7;
}

- (AMSUserNotification)initWithPayload:(id)a3 andConfig:(id)a4
{
  id v6;
  id v7;
  AMSUserNotification *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSString *informativeText;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSString *subtitle;
  void *v26;
  id v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  NSString *v37;
  void *v38;
  id v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  NSString *title;
  uint64_t v44;
  ACAccount *account;
  uint64_t v46;
  NSString *centerBundleIdentifier;
  void *v48;
  void *v49;
  NSString *v50;
  void *logKey;
  void *v52;
  uint64_t v53;
  NSString *threadIdentifier;
  void *v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  NSDate *scheduledTime;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  NSSet *subsections;
  void *v68;
  uint64_t v69;
  NSString *categoryIdentifier;
  uint64_t v71;
  NSString *v72;
  uint64_t v73;
  NSString *identifier;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  uint64_t v84;
  void *v85;
  __CFString *v86;
  __CFString *v87;
  uint64_t v88;
  NSURL *artworkUrl;
  void *v90;
  id v91;
  uint64_t v92;
  NSURL *videoUrl;
  void *v94;
  void *v95;
  unint64_t v96;
  uint64_t i;
  void *v98;
  void *v99;
  id v100;
  __CFString *v101;
  __CFString *v102;
  __CFString *v103;
  AMSUserNotificationAction *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  void *v118;
  id v119;
  __CFString *v120;
  __CFString *v121;
  __CFString *v122;
  void *v123;
  id v124;
  id v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  id v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  id v138;
  id v139;
  void *v140;
  id v141;
  id v142;
  void *v143;
  id v144;
  id v145;
  void *v146;
  AMSUserNotificationAction *v147;
  void *v148;
  uint64_t v149;
  NSDictionary *metricsEvent;
  id *p_metricsEvent;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  id v156;
  AMSUserNotificationAction *v157;
  void *v158;
  AMSUserNotificationAction *v159;
  void *v160;
  AMSUserNotificationAction *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  AMSUserNotificationAction *v166;
  void *v167;
  void *v168;
  uint64_t v169;
  NSMutableDictionary *userInfo;
  AMSUserNotification *v171;
  void *v173;
  __CFString *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  id v181;
  id obj;
  void *v183;
  AMSUserNotification *v184;
  void *v185;
  void *v186;
  uint64_t v187;
  AMSUserNotificationAction *v188;
  uint64_t v189;
  void *v190;
  __CFString *v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  _BYTE v196[128];
  uint64_t v197;

  v197 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[AMSUserNotification init](self, "init");

  if (!v8)
    goto LABEL_138;
  objc_msgSend(v6, "aps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("alert"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("body"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v18 = v14;

    informativeText = v8->_informativeText;
    v8->_informativeText = (NSString *)v18;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("level"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("level"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_interruptionLevel = objc_msgSend(v21, "integerValue");

    }
    else
    {
      v8->_interruptionLevel = 1;
    }

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("subtitle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)v24;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("title"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "aps");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("text"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v27 = v17;

    v28 = v8->_informativeText;
    v8->_informativeText = (NSString *)v27;

    objc_msgSend(v6, "aps");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("_lv"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "aps");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("_lv"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_interruptionLevel = objc_msgSend(v32, "integerValue");

    }
    else
    {
      v8->_interruptionLevel = 1;
    }

    objc_msgSend(v6, "aps");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("_sb"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v34;
    else
      v35 = 0;
    v36 = v35;

    v37 = v8->_subtitle;
    v8->_subtitle = (NSString *)v36;

    objc_msgSend(v6, "aps");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("title"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v39 = v26;
  else
    v39 = 0;
  v40 = (__CFString *)v39;

  v41 = &stru_1E2548760;
  if (v40)
    v41 = v40;
  v42 = v41;
  title = v8->_title;
  v8->_title = &v42->isa;

  objc_msgSend(v6, "account");
  v44 = objc_claimAutoreleasedReturnValue();
  account = v8->_account;
  v8->_account = (ACAccount *)v44;

  objc_msgSend(v6, "clientIdentifier");
  v46 = objc_claimAutoreleasedReturnValue();
  centerBundleIdentifier = v8->_centerBundleIdentifier;
  v8->_centerBundleIdentifier = (NSString *)v46;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_logKey"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
  {
    v50 = v48;
    logKey = v8->_logKey;
    v8->_logKey = v50;
  }
  else
  {
    objc_msgSend(v6, "logKey");
    logKey = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v8->_logKey, logKey);
  }

  objc_msgSend(v6, "aps");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("thread"));
  v53 = objc_claimAutoreleasedReturnValue();
  threadIdentifier = v8->_threadIdentifier;
  v8->_threadIdentifier = (NSString *)v53;

  objc_msgSend(v6, "aps");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("_st"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v57 = v56;
  else
    v57 = 0;
  v58 = v57;

  if (v58)
  {
    +[AMSUserNotification _dateFromString:](AMSUserNotification, "_dateFromString:", v58);
    v59 = objc_claimAutoreleasedReturnValue();
    scheduledTime = v8->_scheduledTime;
    v8->_scheduledTime = (NSDate *)v59;

  }
  objc_msgSend(v6, "aps");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("_sd"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v183 = v58;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v63 = objc_msgSend(v62, "BOOLValue");
  else
    v63 = 0;
  v8->_shouldSuppressDefaultAction = v63;
  objc_msgSend(v6, "aps");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("_ss"));
  v65 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v65);
    v66 = objc_claimAutoreleasedReturnValue();
LABEL_46:
    subsections = v8->_subsections;
    v8->_subsections = (NSSet *)v66;

    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v65);
    v66 = objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
LABEL_47:
  objc_msgSend(v6, "aps");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("category"));
  v69 = objc_claimAutoreleasedReturnValue();
  categoryIdentifier = v8->_categoryIdentifier;
  v8->_categoryIdentifier = (NSString *)v69;

  if (!v8->_categoryIdentifier)
  {
    objc_msgSend(v7, "userNotificationExtensionId");
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = v8->_categoryIdentifier;
    v8->_categoryIdentifier = (NSString *)v71;

  }
  +[AMSUserNotification _identifierFromPayload:](AMSUserNotification, "_identifierFromPayload:", v6);
  v73 = objc_claimAutoreleasedReturnValue();
  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v73;

  objc_msgSend(v6, "aps");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("_ex"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v179 = v12;
  v176 = v76;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v77 = objc_msgSend(v76, "BOOLValue");
  else
    v77 = 0;
  v177 = (void *)v65;
  v178 = v62;
  v180 = v7;
  v8->_explicitContent = v77;
  objc_msgSend(v6, "aps");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("_an"));
  v79 = objc_claimAutoreleasedReturnValue();
  v80 = (void *)v79;
  v81 = (void *)MEMORY[0x1E0C9AAA0];
  if (v79)
    v81 = (void *)v79;
  v82 = v81;

  v175 = v82;
  v8->_anonymizeMetrics = objc_msgSend(v82, "BOOLValue");
  objc_msgSend(v6, "aps");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("_au"));
  v84 = objc_claimAutoreleasedReturnValue();
  v85 = (void *)v84;
  v86 = &stru_1E2548760;
  if (v84)
    v86 = (__CFString *)v84;
  v87 = v86;

  v174 = v87;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v87);
  v88 = objc_claimAutoreleasedReturnValue();
  artworkUrl = v8->_artworkUrl;
  v8->_artworkUrl = (NSURL *)v88;

  objc_msgSend(v6, "aps");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("_vu"));
  v91 = (id)objc_claimAutoreleasedReturnValue();

  v173 = v91;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v91);
  v92 = objc_claimAutoreleasedReturnValue();
  videoUrl = v8->_videoUrl;
  v184 = v8;
  v8->_videoUrl = (NSURL *)v92;

  v181 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v185 = v6;
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aps");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("_ba"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  v194 = 0u;
  v195 = 0u;
  v192 = 0u;
  v193 = 0u;
  obj = v95;
  v96 = 0x1E0CB3000uLL;
  v189 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v192, v196, 16);
  if (v189)
  {
    v187 = *(_QWORD *)v193;
    v188 = 0;
    do
    {
      for (i = 0; i != v189; ++i)
      {
        if (*(_QWORD *)v193 != v187)
          objc_enumerationMutation(obj);
        v98 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * i);
        objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("_tl"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v100 = v99;
        else
          v100 = 0;
        v101 = (__CFString *)v100;

        v102 = &stru_1E2548760;
        if (v101)
          v102 = v101;
        v103 = v102;

        v191 = v103;
        v104 = -[AMSUserNotificationAction initWithTitle:]([AMSUserNotificationAction alloc], "initWithTitle:", v103);
        objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("_id"));
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUserNotificationAction setIdentifier:](v104, "setIdentifier:", v105);

        -[AMSUserNotificationAction identifier](v104, "identifier");
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v106)
        {
          v107 = *(void **)(v96 + 2368);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "UUIDString");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "stringWithFormat:", CFSTR("%@%@"), CFSTR("ams_"), v109);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSUserNotificationAction setIdentifier:](v104, "setIdentifier:", v110);

        }
        objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("_mt"));
        v111 = objc_claimAutoreleasedReturnValue();
        if (v111)
        {
          objc_msgSend(v186, "addObject:", v111);
          objc_msgSend(v185, "clientIdentifier");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          +[AMSUserNotificationMetricsEvent eventFromMetricsDictionary:centerBundleId:](AMSUserNotificationMetricsEvent, "eventFromMetricsDictionary:centerBundleId:", v111, v112);
          v113 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v113, "setAnonymous:", -[AMSUserNotification anonymizeMetrics](v184, "anonymizeMetrics"));
          objc_msgSend(v113, "setDisplayScheduledTime:", v183);
          objc_msgSend(v113, "setPostedSuccessfully:", 1);
          -[AMSUserNotificationAction setMetricsEvent:](v104, "setMetricsEvent:", v113);

        }
        objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("_ru"));
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v190 = (void *)v111;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v115 = v114;
        else
          v115 = 0;
        v116 = v115;

        if (v116)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v116);
          v117 = (id)objc_claimAutoreleasedReturnValue();

          if (v117)
          {
            objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("_rm"));
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v119 = v118;
            else
              v119 = 0;
            v120 = (__CFString *)v119;

            v121 = CFSTR("GET");
            if (v120)
              v121 = v120;
            v122 = v121;

            objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("_rh"));
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v124 = v123;
            else
              v124 = 0;
            v125 = v124;

            v126 = (void *)MEMORY[0x1E0C9AA70];
            if (v125)
              v126 = v125;
            v127 = v126;

            objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("_rb"));
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v117);
            objc_msgSend(v129, "setHTTPMethod:", v122);
            objc_msgSend(v129, "setAllHTTPHeaderFields:", v127);
            if (v128)
            {
              objc_msgSend(v128, "dataUsingEncoding:", 4);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "setHTTPBody:", v130);

            }
            -[AMSUserNotificationAction setRequest:](v104, "setRequest:", v129);

          }
        }
        else
        {
          v117 = 0;
        }
        objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("_url"));
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v132 = v131;
        else
          v132 = 0;
        v133 = v132;

        if (v133)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSUserNotificationAction setDefaultURL:](v104, "setDefaultURL:", v134);

        }
        objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("_tp"));
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v136 = objc_msgSend(v135, "integerValue");
        else
          v136 = 0;
        objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("_gl"));
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v138 = v137;
        else
          v138 = 0;
        v139 = v138;

        -[AMSUserNotificationAction setSystemImageName:](v104, "setSystemImageName:", v139);
        objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("_ci"));
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v141 = v140;
        else
          v141 = 0;
        v142 = v141;

        -[AMSUserNotificationAction setClientIdentifier:](v104, "setClientIdentifier:", v142);
        objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("_mru"));
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v144 = v143;
        else
          v144 = 0;
        v145 = v144;

        if (v145)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v145);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSUserNotificationAction setMediaApiRequestURL:](v104, "setMediaApiRequestURL:", v146);

        }
        else
        {
          -[AMSUserNotificationAction setMediaApiRequestURL:](v104, "setMediaApiRequestURL:", 0);
        }
        if (v136 == 1)
        {
          v147 = v104;

          v188 = v147;
        }
        else
        {
          objc_msgSend(v181, "addObject:", v104);
        }

        v96 = 0x1E0CB3000;
      }
      v189 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v192, v196, 16);
    }
    while (v189);
  }
  else
  {
    v188 = 0;
  }

  v6 = v185;
  objc_msgSend(v185, "aps");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("_mt"));
  v149 = objc_claimAutoreleasedReturnValue();
  v8 = v184;
  p_metricsEvent = (id *)&v184->_metricsEvent;
  metricsEvent = v184->_metricsEvent;
  v184->_metricsEvent = (NSDictionary *)v149;

  if (objc_msgSend(v186, "count") && *p_metricsEvent)
  {
    v152 = (void *)objc_msgSend(*p_metricsEvent, "mutableCopy");
    objc_msgSend(v152, "setObject:forKeyedSubscript:", v186, CFSTR("options"));
    objc_storeStrong(p_metricsEvent, v152);

  }
  objc_msgSend(v185, "aps");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("tapUrl"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v155 = v154;
  else
    v155 = 0;
  v156 = v155;

  v7 = v180;
  v157 = v188;
  if (!v188 && v156)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v156);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    if (v158)
    {
      v159 = objc_alloc_init(AMSUserNotificationAction);
      -[AMSUserNotificationAction setDefaultURL:](v159, "setDefaultURL:", v158);
    }
    else
    {
      v159 = 0;
    }

    v157 = v159;
  }
  v160 = v181;
  if (v157)
    goto LABEL_129;
  objc_msgSend(v185, "URLString");
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v162
    || (v163 = (void *)MEMORY[0x1E0C99E98],
        objc_msgSend(v185, "URLString"),
        v164 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v163, "URLWithString:", v164),
        v165 = (void *)objc_claimAutoreleasedReturnValue(),
        v164,
        !v165))
  {
    v161 = 0;
    v160 = v181;
    goto LABEL_135;
  }
  v166 = objc_alloc_init(AMSUserNotificationAction);
  -[AMSUserNotificationAction setDefaultURL:](v166, "setDefaultURL:", v165);

  v157 = v166;
  v160 = v181;
  if (v166)
  {
LABEL_129:
    v161 = v157;
    objc_storeStrong((id *)&v184->_defaultAction, v157);
  }
  else
  {
    v161 = 0;
  }
LABEL_135:
  if (objc_msgSend(v160, "count"))
    objc_storeStrong((id *)&v184->_buttonActions, v160);
  objc_msgSend(v185, "payload");
  v167 = v160;
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = objc_msgSend(v168, "mutableCopy");
  userInfo = v184->_userInfo;
  v184->_userInfo = (NSMutableDictionary *)v169;

LABEL_138:
  v171 = v8;

  return v171;
}

- (AMSUserNotification)initWithUNNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AMSPushPayload *v8;
  AMSUserNotification *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSURL *artworkUrl;
  AMSUserNotification *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSString *logKey;
  NSString *identifier;
  id v24;
  int v26;
  void *v27;
  __int16 v28;
  NSString *v29;
  __int16 v30;
  NSString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AMSPushPayload initWithPayload:]([AMSPushPayload alloc], "initWithPayload:", v7);
  v9 = -[AMSUserNotification initWithPayload:andConfig:](self, "initWithPayload:andConfig:", v8, 0);
  if (!v9)
  {
LABEL_6:
    v18 = v9;
    goto LABEL_12;
  }
  if (+[AMSUserNotification _canParseNotificationWithIdentifier:userInfo:](AMSUserNotification, "_canParseNotificationWithIdentifier:userInfo:", v9->_identifier, v7))
  {
    objc_msgSend(v4, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "content");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "attachments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      objc_msgSend(v11, "attachments");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URL");
      v16 = objc_claimAutoreleasedReturnValue();
      artworkUrl = v9->_artworkUrl;
      v9->_artworkUrl = (NSURL *)v16;

    }
    goto LABEL_6;
  }
  +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_opt_class();
    logKey = v9->_logKey;
    identifier = v9->_identifier;
    v26 = 138543874;
    v27 = v21;
    v28 = 2114;
    v29 = logKey;
    v30 = 2114;
    v31 = identifier;
    v24 = v21;
    _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Not allowed to operate on a NSUserNotification that did not originate from AMS. Identifier: %{public}@", (uint8_t *)&v26, 0x20u);

  }
  v18 = 0;
LABEL_12:

  return v18;
}

- (id)createNSUserNotification
{
  return 0;
}

- (id)createUNNotificationActions
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[AMSUserNotification buttonActions](self, "buttonActions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "systemImageName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = (void *)MEMORY[0x1E0CEC710];
          objc_msgSend(v8, "systemImageName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "iconWithSystemImageName:", v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v12 = (void *)MEMORY[0x1E0CEC700];
        objc_msgSend(v8, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "actionWithIdentifier:title:options:icon:", v13, v14, objc_msgSend(v8, "un_ActionOptions"), v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v15);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (id)createUNNotificationContent
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
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  -[AMSUserNotification informativeText](self, "informativeText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBody:", v4);

  -[AMSUserNotification categoryIdentifier](self, "categoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCategoryIdentifier:", v5);

  -[AMSUserNotification threadIdentifier](self, "threadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setThreadIdentifier:", v6);

  -[AMSUserNotification title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v7);

  -[AMSUserNotification subtitle](self, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubtitle:", v8);

  -[AMSUserNotification userInfo](self, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUserNotification _generatePayloadWithBase:](self, "_generatePayloadWithBase:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInfo:", v10);

  objc_msgSend(v3, "setInterruptionLevel:", -[AMSUserNotification interruptionLevel](self, "interruptionLevel"));
  objc_msgSend(v3, "setShouldSuppressDefaultAction:", -[AMSUserNotification shouldSuppressDefaultAction](self, "shouldSuppressDefaultAction"));
  -[AMSUserNotification defaultAction](self, "defaultAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "setShouldBackgroundDefaultAction:", 1);
    objc_msgSend(v3, "setShouldAuthenticateDefaultAction:", 1);
  }
  -[AMSUserNotification subsections](self, "subsections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AMSUserNotification subsections](self, "subsections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTopicIdentifiers:", v13);

  }
  return v3;
}

- (id)createUNNotificationRequestFromContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSUserNotification scheduledTime](self, "scheduledTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUserNotification scheduledTime](self, "scheduledTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceNow");
    v8 = v7;

    +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 >= 0.0)
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_opt_class();
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUserNotification scheduledTime](self, "scheduledTime");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v17;
        v28 = 2114;
        v29 = v18;
        v30 = 2114;
        v31 = v19;
        _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Scheduling notification for time: %{public}@", (uint8_t *)&v26, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUserNotification scheduledTime](self, "scheduledTime");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "components:fromDate:", 252, v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEC6B8], "triggerWithDateMatchingComponents:repeats:", v10, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_opt_class();
        AMSLogKey();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUserNotification scheduledTime](self, "scheduledTime");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v12;
        v28 = 2114;
        v29 = v13;
        v30 = 2114;
        v31 = v14;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Notification scheduled time %{public}@ has passed, ignoring schedule.", (uint8_t *)&v26, 0x20u);

      }
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  v22 = (void *)MEMORY[0x1E0CEC740];
  -[AMSUserNotification identifier](self, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "requestWithIdentifier:content:trigger:", v23, v4, v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)addButtonAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[AMSUserNotification buttonActions](self, "buttonActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = v8;

  objc_msgSend(v9, "addObject:", v4);
  -[AMSUserNotification setButtonActions:](self, "setButtonActions:", v9);

}

- (id)determineSelectedActionFromResponse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  AMSUserNotification *v37;
  id *v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  AMSUserNotification *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  int v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AMSUserNotification logKey](self, "logKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = AMSSetLogKey(v7);

  objc_msgSend(v6, "actionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CEC808]);

  if (v10)
  {
    -[AMSUserNotification defaultAction](self, "defaultAction");
    v11 = objc_claimAutoreleasedReturnValue();
    +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11)
    {
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[AMSUserNotification logKey](self, "logKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = self;
        v46 = 2114;
        v47 = v15;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Default action selected", buf, 0x16u);

      }
      v16 = 0;
      goto LABEL_39;
    }
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      -[AMSUserNotification logKey](self, "logKey");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = self;
      v46 = 2114;
      v47 = v32;
      _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Default action selected, but action not defined", buf, 0x16u);

    }
    v11 = 0;
  }
  else
  {
    objc_msgSend(v6, "actionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CEC818]);

    if (v18)
    {
      +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[AMSUserNotification logKey](self, "logKey");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = self;
        v46 = 2114;
        v47 = v21;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] User dismissed alert", buf, 0x16u);

      }
      AMSError(6, CFSTR("User Notification Cancelled"), CFSTR("Cancel action selected"), 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v11 = 0;
      goto LABEL_37;
    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[AMSUserNotification buttonActions](self, "buttonActions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v11)
    {
      v37 = self;
      v38 = a4;
      v23 = 0;
      v24 = *(_QWORD *)v41;
      while (2)
      {
        v25 = 0;
        v39 = v23 + v11;
        do
        {
          if (*(_QWORD *)v41 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v25);
          objc_msgSend(v26, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "actionIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "isEqualToString:", v28);

          if (v29)
          {
            v11 = v26;
            v30 = v23 + v25;
            goto LABEL_29;
          }
          ++v25;
        }
        while (v11 != v25);
        v11 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        v30 = v39;
        v23 = v39;
        if (v11)
          continue;
        break;
      }
LABEL_29:
      self = v37;
      a4 = v38;
    }
    else
    {
      v30 = 0;
    }

    +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v33, "OSLogObject");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      -[AMSUserNotification logKey](self, "logKey");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = self;
      v46 = 2114;
      v47 = v35;
      v48 = 1024;
      v49 = v30;
      _os_log_impl(&dword_18C849000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] User selected button index: %d", buf, 0x1Cu);

    }
  }
  v16 = 0;
LABEL_37:
  if (!(v11 | v16))
  {
    AMSError(7, CFSTR("User Notification Failure"), CFSTR("Action not found"), 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }
LABEL_39:
  if (a4)
    *a4 = objc_retainAutorelease((id)v16);

  return (id)v11;
}

+ (id)handleNotificationResponse:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  AMSMutableBinaryPromise *v8;
  NSObject *v9;
  AMSMutableBinaryPromise *v10;
  id v11;
  id v12;
  void *v13;
  AMSMutableBinaryPromise *v14;
  _QWORD v16[4];
  id v17;
  AMSMutableBinaryPromise *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(AMSMutableBinaryPromise);
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__AMSUserNotification_handleNotificationResponse_bag___block_invoke;
  v16[3] = &unk_1E25432B8;
  v20 = a1;
  v17 = v6;
  v10 = v8;
  v18 = v10;
  v19 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, v16);

  v13 = v19;
  v14 = v10;

  return v14;
}

void __54__AMSUserNotification_handleNotificationResponse_bag___block_invoke(uint64_t a1)
{
  AMSUserNotification *v2;
  void *v3;
  AMSUserNotification *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  if ((objc_msgSend(*(id *)(a1 + 56), "shouldHandleNotificationResponse:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v2 = [AMSUserNotification alloc];
    objc_msgSend(*(id *)(a1 + 32), "notification");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[AMSUserNotification initWithUNNotification:](v2, "initWithUNNotification:", v3);

    v5 = *(_QWORD *)(a1 + 32);
    v13 = 0;
    -[AMSUserNotification determineSelectedActionFromResponse:error:](v4, "determineSelectedActionFromResponse:error:", v5, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (objc_msgSend(v7, "code") != 6)
    {
      objc_msgSend(v6, "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {

      }
      else
      {
        objc_msgSend(v6, "defaultURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          objc_msgSend(*(id *)(a1 + 56), "openAppUsingBundleIdentifier:", v4);
      }
    }
    if (v6)
    {
      -[AMSUserNotification handleSelectedButton:bag:](v4, "handleSelectedButton:bag:", v6, *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "completionHandlerAdapter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addFinishBlock:", v11);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess");
    }

  }
  else
  {
    AMSError(2, CFSTR("User Notification Failure"), CFSTR("Unable to parse the notification response"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v12);

  }
}

- (id)handleSelectedButton:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  AMSMutableBinaryPromise *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  AMSMutableBinaryPromise *v15;
  id v16;
  id v17;
  AMSMutableBinaryPromise *v18;
  AMSMutableBinaryPromise *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  AMSMutableBinaryPromise *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(AMSMutableBinaryPromise);
  if (!v7)
  {
    +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      -[AMSUserNotification logKey](self, "logKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v11;
      v27 = 2114;
      v28 = v13;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Handling button tap without a bag.", buf, 0x16u);

    }
  }
  dispatch_get_global_queue(2, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __48__AMSUserNotification_handleSelectedButton_bag___block_invoke;
  v21[3] = &unk_1E2541468;
  v21[4] = self;
  v22 = v6;
  v23 = v7;
  v15 = v8;
  v24 = v15;
  v16 = v7;
  v17 = v6;
  dispatch_async(v14, v21);

  v18 = v24;
  v19 = v15;

  return v19;
}

void __48__AMSUserNotification_handleSelectedButton_bag___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __objc2_class **v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  AMSURLRequestEncoder *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  AMSMediaTokenService *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  AMSMediaTokenService *v41;
  void *v42;
  AMSMediaRequestEncoder *v43;
  AMSMediaResponseDecoder *v44;
  void *v45;
  void *v46;
  void *v47;
  AMSMediaProtocolHandler *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  AMSMetricsEvent *v75;
  void *v76;
  void *v77;
  id v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[5];
  id v82;
  _QWORD v83[5];
  id v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "intent");
  if (v2 == 1)
  {
    v3 = off_1E2519AC0;
  }
  else
  {
    if (v2 != 2)
      goto LABEL_6;
    v3 = off_1E2519AC8;
  }
  -[__objc2_class userNotification:selectedButtonAction:bag:](*v3, "userNotification:selectedButtonAction:bag:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_6:
  +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v86 = v6;
    v87 = 2114;
    v88 = v9;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling RichNotification response.", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class();
      v14 = *(void **)(a1 + 32);
      v15 = v13;
      objc_msgSend(v14, "logKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v86 = v13;
      v87 = 2114;
      v88 = v16;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing request", buf, 0x16u);

    }
    v17 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "account");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setAccount:](v17, "setAccount:", v18);

    objc_msgSend(*(id *)(a1 + 32), "logKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder setLogUUID:](v17, "setLogUUID:", v19);

    objc_msgSend(*(id *)(a1 + 40), "request");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSURLRequestEncoder requestByEncodingRequest:parameters:](v17, "requestByEncodingRequest:parameters:", v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0;
    objc_msgSend(v21, "resultWithError:", &v84);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v84;

    if (v23)
    {
      +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_opt_class();
        v27 = *(void **)(a1 + 32);
        v28 = v23;
        v29 = v26;
        objc_msgSend(v27, "logKey");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v86 = v26;
        v87 = 2114;
        v88 = v30;
        v89 = 2114;
        v90 = v28;
        _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error creating request: %{public}@", buf, 0x20u);

        v23 = v28;
      }

      v31 = 0;
    }
    else
    {
      +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dataTaskPromiseWithRequest:", v22);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v23 = 0;
    v31 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "mediaApiRequestURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(*(id *)(a1 + 40), "clientIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (AMSMediaTokenService *)v34;
    if (v33)
    {
      if (!v34)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v35 = (AMSMediaTokenService *)objc_claimAutoreleasedReturnValue();
      }
      -[AMSMediaTokenService OSLogObject](v35, "OSLogObject");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_opt_class();
        v38 = *(void **)(a1 + 32);
        v39 = v37;
        objc_msgSend(v38, "logKey");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v86 = v37;
        v87 = 2114;
        v88 = v40;
        _os_log_impl(&dword_18C849000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing Media API request", buf, 0x16u);

      }
      v41 = [AMSMediaTokenService alloc];
      objc_msgSend(*(id *)(a1 + 40), "clientIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[AMSMediaTokenService initWithClientIdentifier:bag:](v41, "initWithClientIdentifier:bag:", v42, *(_QWORD *)(a1 + 48));

      v43 = -[AMSMediaRequestEncoder initWithTokenService:bag:]([AMSMediaRequestEncoder alloc], "initWithTokenService:bag:", v35, *(_QWORD *)(a1 + 48));
      v44 = objc_alloc_init(AMSMediaResponseDecoder);
      -[AMSMediaRequestEncoder setResponseDecoder:](v43, "setResponseDecoder:", v44);

      objc_msgSend(*(id *)(a1 + 32), "account");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMediaRequestEncoder setAccount:](v43, "setAccount:", v45);

      objc_msgSend(*(id *)(a1 + 32), "logKey");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMediaRequestEncoder setLogKey:](v43, "setLogKey:", v46);

      +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = -[AMSMediaProtocolHandler initWithTokenService:]([AMSMediaProtocolHandler alloc], "initWithTokenService:", v35);
      objc_msgSend(v47, "setProtocolHandler:", v48);

      objc_msgSend(*(id *)(a1 + 40), "mediaApiRequestURL");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSMediaRequestEncoder requestWithURL:](v43, "requestWithURL:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "dataTaskPromiseWithRequestPromise:", v50);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __48__AMSUserNotification_handleSelectedButton_bag___block_invoke_130;
      v83[3] = &unk_1E253FFE0;
      v83[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v32, "addFinishBlock:", v83);

    }
    else
    {
      if (!v34)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v35 = (AMSMediaTokenService *)objc_claimAutoreleasedReturnValue();
      }
      -[AMSMediaTokenService OSLogObject](v35, "OSLogObject");
      v43 = (AMSMediaRequestEncoder *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v43->super, OS_LOG_TYPE_ERROR))
      {
        v51 = (void *)objc_opt_class();
        v52 = *(void **)(a1 + 32);
        v53 = v51;
        objc_msgSend(v52, "logKey");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v86 = v51;
        v87 = 2114;
        v88 = v54;
        _os_log_impl(&dword_18C849000, &v43->super, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Payload set mediaApiRequestURL but clientIdentifier is not set", buf, 0x16u);

      }
      v32 = 0;
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "defaultURL");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v56)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v56, "OSLogObject");
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = (void *)objc_opt_class();
      v59 = v32;
      v60 = v31;
      v61 = v23;
      v62 = *(void **)(a1 + 32);
      v78 = v58;
      objc_msgSend(v62, "logKey");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "defaultURL");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      AMSLogableURL(v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v86 = v58;
      v87 = 2114;
      v88 = v63;
      v89 = 2112;
      v90 = v65;
      _os_log_impl(&dword_18C849000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening url: %@", buf, 0x20u);

      v23 = v61;
      v31 = v60;
      v32 = v59;

    }
    objc_msgSend(*(id *)(a1 + 40), "defaultURL");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSOpenURL openStandardURL:](AMSOpenURL, "openStandardURL:", v66);

  }
  objc_msgSend(*(id *)(a1 + 40), "metricsEvent");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    objc_msgSend(*(id *)(a1 + 32), "metricsEvent");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v68, "mutableCopy");
    v70 = v69;
    if (v69)
    {
      v71 = v69;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v71 = (id)objc_claimAutoreleasedReturnValue();
    }
    v72 = v71;

    objc_msgSend(*(id *)(a1 + 40), "metricsEvent");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "underlyingDictionary");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addEntriesFromDictionary:", v74);

    v75 = -[AMSMetricsEvent initWithUnderlyingDictionary:]([AMSMetricsEvent alloc], "initWithUnderlyingDictionary:", v72);
    -[AMSMetricsEvent setAnonymous:](v75, "setAnonymous:", objc_msgSend(*(id *)(a1 + 32), "anonymizeMetrics"));
    +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", *(_QWORD *)(a1 + 48));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "enqueueEvent:", v75);

  }
  if (v31)
  {
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __48__AMSUserNotification_handleSelectedButton_bag___block_invoke_135;
    v81[3] = &unk_1E25442A0;
    v81[4] = *(_QWORD *)(a1 + 32);
    v82 = *(id *)(a1 + 56);
    objc_msgSend(v31, "addFinishBlock:", v81);
    v77 = v82;
  }
  else
  {
    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v23);
      goto LABEL_53;
    }
    if (!v32)
    {
      objc_msgSend(*(id *)(a1 + 56), "finishWithSuccess");
      goto LABEL_53;
    }
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __48__AMSUserNotification_handleSelectedButton_bag___block_invoke_137;
    v79[3] = &unk_1E253FFE0;
    v80 = *(id *)(a1 + 56);
    objc_msgSend(v32, "addFinishBlock:", v79);
    v77 = v80;
  }

LABEL_53:
}

void __48__AMSUserNotification_handleSelectedButton_bag___block_invoke_130(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "logKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v8;
      v20 = 2114;
      v21 = v11;
      v22 = 2114;
      v23 = v4;
      v12 = "%{public}@: [%{public}@] Finished Media API request with error %{public}@";
      v13 = v7;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 32;
LABEL_10:
      _os_log_impl(&dword_18C849000, v13, v14, v12, (uint8_t *)&v18, v15);

    }
  }
  else
  {
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      v17 = *(void **)(a1 + 32);
      v10 = v16;
      objc_msgSend(v17, "logKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2114;
      v21 = v11;
      v12 = "%{public}@: [%{public}@] Finished Media API request successfully";
      v13 = v7;
      v14 = OS_LOG_TYPE_DEFAULT;
      v15 = 22;
      goto LABEL_10;
    }
  }

}

void __48__AMSUserNotification_handleSelectedButton_bag___block_invoke_135(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v7;
      v13 = 2114;
      v14 = v10;
      v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error performing request: %{public}@", (uint8_t *)&v11, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess:error:", v4 == 0, v4);

}

uint64_t __48__AMSUserNotification_handleSelectedButton_bag___block_invoke_137(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", a3 == 0, a3);
}

+ (void)handleServiceExtensionNotificationRequest:(id)a3 bag:(id)a4 withContentHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  AMSPushPayload *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  AMSUserNotification *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  AMSUserNotification *v26;
  NSObject *v27;
  AMSUserNotification *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
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
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  AMSUserNotification *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void (**v67)(id, void *);
  id v68;
  void *v69;
  id v71;
  void *v72;
  uint8_t buf[4];
  id v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  AMSUserNotification *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = [AMSPushPayload alloc];
  objc_msgSend(v7, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AMSPushPayload initWithPayload:](v10, "initWithPayload:", v12);

  v69 = (void *)v13;
  v14 = -[AMSUserNotification initWithPayload:andConfig:]([AMSUserNotification alloc], "initWithPayload:andConfig:", v13, 0);
  -[AMSUserNotification logKey](v14, "logKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = AMSSetLogKey(v15);

  +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_opt_class();
    v20 = v19;
    -[AMSUserNotification logKey](v14, "logKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v74 = v19;
    v75 = 2114;
    v76 = v21;
    v77 = 2114;
    v78 = v14;
    _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling service extension for note: %{public}@", buf, 0x20u);

  }
  -[AMSUserNotification logKey](v14, "logKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    AMSGenerateLogCorrelationKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUserNotification setLogKey:](v14, "setLogKey:", v23);

  }
  -[AMSUserNotification centerBundleIdentifier](v14, "centerBundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = +[AMSRestrictions explicitContentSettingForBundleID:](AMSRestrictions, "explicitContentSettingForBundleID:", v24);

  if (-[AMSUserNotification explicitContent](v14, "explicitContent") && !v25)
  {
    +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
    v26 = (AMSUserNotification *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v26 = (AMSUserNotification *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSUserNotification OSLogObject](v26, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v74 = a1;
      v75 = 2114;
      v76 = v22;
      _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Explicit content disallowed", buf, 0x16u);
    }
LABEL_21:

    -[AMSUserNotification centerBundleIdentifier](v14, "centerBundleIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    if (v33)
    {
      if (!v34)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v35, "OSLogObject");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_opt_class();
        v38 = v37;
        -[AMSUserNotification logKey](v14, "logKey");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v37;
        v75 = 2114;
        v76 = v39;
        _os_log_impl(&dword_18C849000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing notification", buf, 0x16u);

      }
      -[AMSUserNotification centerBundleIdentifier](v14, "centerBundleIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", v35);
      objc_msgSend(v7, "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject removePendingNotificationRequestsWithIdentifiers:](v40, "removePendingNotificationRequestsWithIdentifiers:", v42);

    }
    else
    {
      if (!v34)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v35, "OSLogObject");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v74 = a1;
        v75 = 2114;
        v76 = v22;
        _os_log_impl(&dword_18C849000, v40, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove notification for nil bundle identifier", buf, 0x16u);
      }
    }

    goto LABEL_49;
  }
  -[AMSUserNotification account](v14, "account");
  v28 = (AMSUserNotification *)objc_claimAutoreleasedReturnValue();
  v26 = v28;
  if (v28)
  {
    if ((-[AMSUserNotification isActive](v28, "isActive") & 1) == 0)
    {
      -[AMSUserNotification centerBundleIdentifier](v14, "centerBundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v27 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject OSLogObject](v27, "OSLogObject");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v74 = v31;
          v75 = 2114;
          v76 = v22;
          v77 = 2114;
          v78 = v26;
          v32 = v31;
          _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Ignoring notification for inactive account: %{public}@", buf, 0x20u);

        }
        goto LABEL_21;
      }
    }
  }

  -[AMSUserNotification metricsEvent](v14, "metricsEvent");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    +[AMSUserNotificationMetricsEvent eventForPostedNotification:](AMSUserNotificationMetricsEvent, "eventForPostedNotification:", v14);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setPostedSuccessfully:", 1);
    objc_msgSend(v44, "setAnonymous:", -[AMSUserNotification anonymizeMetrics](v14, "anonymizeMetrics"));
    -[AMSUserNotification scheduledTime](v14, "scheduledTime");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(MEMORY[0x1E0CB3578], "ams_serverFriendlyFormatter");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUserNotification scheduledTime](v14, "scheduledTime");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringFromDate:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setDisplayScheduledTime:", v48);

    }
    +[AMSMetrics internalInstanceUsingBag:](AMSMetrics, "internalInstanceUsingBag:", v8);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "enqueueEvent:", v44);

  }
  -[AMSUserNotification createUNNotificationContent](v14, "createUNNotificationContent");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v50, "mutableCopy");

  -[AMSUserNotification artworkUrl](v14, "artworkUrl");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "absoluteString");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "length");

  if (v53)
  {
    v67 = v9;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "UUIDString");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSUserNotification artworkUrl](v14, "artworkUrl");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v8;
    objc_msgSend(a1, "_downloadAssetAtUrl:withIdentifier:logKey:bag:", v56, v55, v22, v8);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v71 = 0;
      objc_msgSend(MEMORY[0x1E0CEC718], "attachmentWithIdentifier:URL:options:error:", v55, v57, 0, &v71);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (AMSUserNotification *)v71;
      if (v60)
      {
        v65 = v59;
        v66 = v58;
        +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v61)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v61, "OSLogObject");
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          v63 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v74 = v63;
          v75 = 2114;
          v76 = v22;
          v77 = 2114;
          v78 = v60;
          v64 = v63;
          _os_log_impl(&dword_18C849000, v62, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating attachment: %{public}@", buf, 0x20u);

        }
        v59 = v65;
        v58 = v66;
      }
      else if (v59)
      {
        objc_msgSend(v58, "addObject:", v59);
        objc_msgSend(v35, "setAttachments:", v58);
      }

    }
    v9 = v67;
    v8 = v68;
  }
  v9[2](v9, v35);
LABEL_49:

}

+ (void)openAppUsingBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CA5938]);
  v6 = *MEMORY[0x1E0D22DA8];
  v14[0] = *MEMORY[0x1E0D22D88];
  v14[1] = v6;
  v15[0] = MEMORY[0x1E0C9AAB0];
  v15[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrontBoardOptions:", v7);

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__AMSUserNotification_openAppUsingBundleIdentifier___block_invoke;
  v11[3] = &unk_1E2547568;
  v12 = v4;
  v13 = a1;
  v10 = v4;
  objc_msgSend(v8, "openApplicationWithBundleIdentifier:configuration:completionHandler:", v9, v5, v11);

}

void __52__AMSUserNotification_openAppUsingBundleIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[AMSLogConfig sharedUserNotificationConfig](AMSLogConfig, "sharedUserNotificationConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "centerBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      v12 = "%{public}@: [%{public}@] No default action - Opened via %@ instead";
      v13 = v8;
      v14 = OS_LOG_TYPE_DEFAULT;
      v15 = 32;
LABEL_10:
      _os_log_impl(&dword_18C849000, v13, v14, v12, (uint8_t *)&v17, v15);

    }
  }
  else
  {
    if (!v6)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "logKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "centerBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v16;
      v19 = 2114;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v5;
      v12 = "%{public}@: [%{public}@] No default action - Failed to open via %@ - %@";
      v13 = v8;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 42;
      goto LABEL_10;
    }
  }

}

+ (id)notificationCenter:(id)a3 openSettingsForNotification:(id)a4 bag:(id)a5
{
  return +[AMSBinaryPromise promiseWithSuccess](AMSBinaryPromise, "promiseWithSuccess", a3, a4, a5);
}

+ (BOOL)shouldDeleteNotificationForPayload:(id)a3 outIdentifier:(id *)a4 scheduledOnly:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;

  v8 = a3;
  objc_msgSend(v8, "aps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_delAll"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(v10, "BOOLValue");
  else
    v11 = 0;
  objc_msgSend(v8, "aps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_del"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = objc_msgSend(v13, "BOOLValue");
    if (((v14 | v11) & 1) == 0)
    {
      v15 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
    v15 = 0;
    if (!v11)
      goto LABEL_13;
  }
  if (a5)
    *a5 = v14;
  if (a4)
  {
    objc_msgSend(a1, "_identifierFromPayload:", v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = 1;
LABEL_13:

  return v15;
}

+ (BOOL)shouldHandleNotificationResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_canParseNotificationWithIdentifier:userInfo:", v6, v8);

  return (char)a1;
}

+ (BOOL)shouldHandleServiceExtensionNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_canParseNotificationWithIdentifier:userInfo:", v5, v7);

  return (char)a1;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_156 != -1)
    dispatch_once(&_MergedGlobals_156, &__block_literal_global_138);
  return (NSString *)(id)qword_1ECEAD9E8;
}

void __36__AMSUserNotification_bagSubProfile__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD9E8;
  qword_1ECEAD9E8 = (uint64_t)CFSTR("AMSUserNotifications");

}

+ (NSString)bagSubProfileVersion
{
  if (qword_1ECEAD9F0 != -1)
    dispatch_once(&qword_1ECEAD9F0, &__block_literal_global_154);
  return (NSString *)(id)qword_1ECEAD9F8;
}

void __43__AMSUserNotification_bagSubProfileVersion__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEAD9F8;
  qword_1ECEAD9F8 = (uint64_t)CFSTR("1");

}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)_canParseNotificationWithIdentifier:(id)a3 userInfo:(id)a4
{
  id v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  char v12;
  void *v13;
  id v14;

  v5 = a4;
  v6 = objc_msgSend(a3, "hasPrefix:", CFSTR("ams_"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if ((v6 & 1) != 0
    || ((objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_id")),
         v9 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (v10 = 0)
      : (v10 = v9),
        v9,
        v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("ams_")),
        v10,
        (v11 & 1) != 0))
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    v12 = objc_msgSend(v14, "hasPrefix:", CFSTR("ams_"));
  }

  return v12;
}

+ (id)_cachedImagePathForIdentifier:(id)a3 assetURL:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0C99D20]);
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithObjects:", v9, CFSTR("com.apple.AppleMediaServices"), CFSTR("UserNotificationImageCache"), 0);

  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (objc_msgSend(MEMORY[0x1E0CB3620], "ams_ensureDirectoryExists:", v11))
  {
    objc_msgSend(v6, "pathExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v5, v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v5;
    }
    v15 = v14;
    objc_msgSend(v11, "stringByAppendingPathComponent:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)_identifierFromPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(v3, "aps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "aps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if (!objc_msgSend(v5, "length"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), CFSTR("ams_"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("ams_")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("ams_"), v5);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }

  return v5;
}

+ (id)_downloadAssetAtUrl:(id)a3 withIdentifier:(id)a4 logKey:(id)a5 bag:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  AMSURLRequestEncoder *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v28;
  char v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a1, "_cachedImagePathForIdentifier:assetURL:", a4, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "fileExistsAtPath:", v16);

  if ((v17 & 1) != 0)
    goto LABEL_16;
  v18 = -[AMSURLRequestEncoder initWithBag:]([AMSURLRequestEncoder alloc], "initWithBag:", v12);
  -[AMSURLRequestEncoder setLogUUID:](v18, "setLogUUID:", v11);
  -[AMSURLRequestEncoder setUrlKnownToBeTrusted:](v18, "setUrlKnownToBeTrusted:", 1);
  -[AMSURLRequestEncoder requestWithMethod:URL:parameters:](v18, "requestWithMethod:URL:parameters:", 2, v10, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v19, "resultWithError:", &v34);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v34;

  if (v20)
    goto LABEL_8;
  +[AMSURLSession defaultSession](AMSURLSession, "defaultSession");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dataTaskPromiseWithRequest:", v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v22, "resultWithError:", &v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v33;

  if (v20)
  {

LABEL_8:
    +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig", v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v36 = a1;
      v37 = 2114;
      v38 = v11;
      v39 = 2114;
      v40 = v20;
      _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Error downloading asset: %{public}@", buf, 0x20u);
    }
    v26 = 0;
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v23, "data");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v23, "data");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  if (v14)
  {
    v32 = 0;
    v29 = objc_msgSend(v26, "writeToURL:options:error:", v14, 1, &v32);
    v30 = v32;
    v20 = v30;
    if ((v29 & 1) == 0 && v30)
    {
      +[AMSLogConfig sharedPushNotificationConfig](AMSLogConfig, "sharedPushNotificationConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject", v31);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v36 = a1;
        v37 = 2114;
        v38 = v11;
        v39 = 2114;
        v40 = v20;
        _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cache asset data: %{public}@", buf, 0x20u);
      }
      goto LABEL_13;
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_14:

  if (v20)
  {

    v14 = 0;
  }
LABEL_16:

  return v14;
}

- (id)_generatePayloadWithBase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
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
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
  -[AMSUserNotification account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_DSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("0"));

  -[AMSUserNotification centerBundleIdentifier](self, "centerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("2"));

  -[AMSUserNotification logKey](self, "logKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("_logKey"));

  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSUserNotification informativeText](self, "informativeText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("body"));

  -[AMSUserNotification title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("title"));

  -[AMSUserNotification subtitle](self, "subtitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("subtitle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AMSUserNotification interruptionLevel](self, "interruptionLevel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("level"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("alert"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSUserNotification anonymizeMetrics](self, "anonymizeMetrics"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("_an"));

  -[AMSUserNotification artworkUrl](self, "artworkUrl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("_au"));

  -[AMSUserNotification videoUrl](self, "videoUrl");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "absoluteString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("_vu"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSUserNotification shouldSuppressDefaultAction](self, "shouldSuppressDefaultAction"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("_sd"));

  -[AMSUserNotification categoryIdentifier](self, "categoryIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("category"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSUserNotification explicitContent](self, "explicitContent"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("_ex"));

  -[AMSUserNotification metricsEvent](self, "metricsEvent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, CFSTR("_mt"));

  -[AMSUserNotification subsections](self, "subsections");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, CFSTR("_ss"));

  -[AMSUserNotification threadIdentifier](self, "threadIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, CFSTR("thread"));

  -[AMSUserNotification identifier](self, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v28, CFSTR("_id"));

  -[AMSUserNotification scheduledTime](self, "scheduledTime");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "ams_serverFriendlyFormatter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUserNotification scheduledTime](self, "scheduledTime");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringFromDate:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v32, CFSTR("_st"));
  }
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AMSUserNotification defaultAction](self, "defaultAction");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  __48__AMSUserNotification__generatePayloadWithBase___block_invoke(v34, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "ams_addNullableObject:", v35);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[AMSUserNotification buttonActions](self, "buttonActions", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v44;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(v36);
        __48__AMSUserNotification__generatePayloadWithBase___block_invoke(*(void **)(*((_QWORD *)&v43 + 1) + 8 * v40), 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "ams_addNullableObject:", v41);

        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v38);
  }

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v33, CFSTR("_ba"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("aps"));

  return v5;
}

id __48__AMSUserNotification__generatePayloadWithBase___block_invoke(void *a1, int a2)
{
  id v3;
  id v4;
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
  id v15;
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

  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  if (a2)
    v6 = &unk_1E25AFB90;
  else
    v6 = &unk_1E25AFBA8;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("_tp"));
  objc_msgSend(v3, "defaultURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("_url"));

  objc_msgSend(v3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("_id"));

  objc_msgSend(v3, "metricsEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "underlyingDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("_mt"));

  objc_msgSend(v3, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v3, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "HTTPBody");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v3, "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "HTTPBody");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithData:encoding:", v17, 4);

      objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("_rb"));
    }
    objc_msgSend(v3, "request");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "HTTPMethod");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("_rm"));

    objc_msgSend(v3, "request");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allHTTPHeaderFields");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("_rh"));

    objc_msgSend(v3, "request");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "absoluteString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("_ru"));

  }
  objc_msgSend(v3, "clientIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("_ci"));

  objc_msgSend(v3, "mediaApiRequestURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "absoluteString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("_mru"));

  objc_msgSend(v3, "title");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("_tl"));

  objc_msgSend(v3, "systemImageName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("_gl"));

  return v5;
}

+ (id)_dateFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3578], "ams_serverFriendlyFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "ams_serverFriendlyLocalTimeZoneFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFromString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

+ (id)handleNotificationResponse:(id)a3 bagContract:(id)a4
{
  id v6;
  id v7;
  AMSContractBagShim *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v6);

  objc_msgSend(a1, "handleNotificationResponse:bag:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)handleSelectedButton:(id)a3 bagContract:(id)a4
{
  id v6;
  id v7;
  AMSContractBagShim *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[AMSContractBagShim initWithBagContract:]([AMSContractBagShim alloc], "initWithBagContract:", v6);

  -[AMSUserNotification handleSelectedButton:bag:](self, "handleSelectedButton:bag:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSURL)artworkUrl
{
  return self->_artworkUrl;
}

- (void)setArtworkUrl:(id)a3
{
  objc_storeStrong((id *)&self->_artworkUrl, a3);
}

- (NSURL)videoUrl
{
  return self->_videoUrl;
}

- (void)setVideoUrl:(id)a3
{
  objc_storeStrong((id *)&self->_videoUrl, a3);
}

- (NSArray)buttonActions
{
  return self->_buttonActions;
}

- (void)setButtonActions:(id)a3
{
  objc_storeStrong((id *)&self->_buttonActions, a3);
}

- (NSString)centerBundleIdentifier
{
  return self->_centerBundleIdentifier;
}

- (void)setCenterBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_centerBundleIdentifier, a3);
}

- (AMSUserNotificationAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAction, a3);
}

- (BOOL)explicitContent
{
  return self->_explicitContent;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
  objc_storeStrong((id *)&self->_informativeText, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (NSDictionary)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
  objc_storeStrong((id *)&self->_metricsEvent, a3);
}

- (NSDate)scheduledTime
{
  return self->_scheduledTime;
}

- (void)setScheduledTime:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledTime, a3);
}

- (NSSet)subsections
{
  return self->_subsections;
}

- (void)setSubsections:(id)a3
{
  objc_storeStrong((id *)&self->_subsections, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (unint64_t)interruptionLevel
{
  return self->_interruptionLevel;
}

- (void)setInterruptionLevel:(unint64_t)a3
{
  self->_interruptionLevel = a3;
}

- (BOOL)anonymizeMetrics
{
  return self->_anonymizeMetrics;
}

- (void)setAnonymizeMetrics:(BOOL)a3
{
  self->_anonymizeMetrics = a3;
}

- (int64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(int64_t)a3
{
  self->_intent = a3;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_categoryIdentifier, a3);
}

- (BOOL)shouldSuppressDefaultAction
{
  return self->_shouldSuppressDefaultAction;
}

- (void)setShouldSuppressDefaultAction:(BOOL)a3
{
  self->_shouldSuppressDefaultAction = a3;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_threadIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_subsections, 0);
  objc_storeStrong((id *)&self->_scheduledTime, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_centerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_videoUrl, 0);
  objc_storeStrong((id *)&self->_artworkUrl, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
