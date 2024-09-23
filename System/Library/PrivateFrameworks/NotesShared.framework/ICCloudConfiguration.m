@implementation ICCloudConfiguration

+ (id)cachedConfigurationURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("RemoteConfiguration"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathExtension:", CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (ICCloudThrottlingPolicy)throttlingPolicy
{
  os_unfair_lock_s *p_lock;
  ICCloudThrottlingPolicy *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_throttlingPolicy;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)minimumClientVersion
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_minimumClientVersion;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (void)loadSharedConfigurationWithQoSClass:(unsigned int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  dispatch_block_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  +[ICCloudConfiguration cloudConfigurationQueue]();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__ICCloudConfiguration_SharedInstance__loadSharedConfigurationWithQoSClass_completionHandler___block_invoke;
  v10[3] = &unk_1E76C9C48;
  v11 = v6;
  v12 = a1;
  v8 = v6;
  v9 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, (dispatch_qos_class_t)a3, 0, v10);
  dispatch_async(v7, v9);

}

+ (void)loadSharedConfigurationWithCompletionHandler:(id)a3
{
  objc_msgSend(a1, "loadSharedConfigurationWithQoSClass:completionHandler:", 21, a3);
}

+ (id)cloudConfigurationQueue
{
  objc_opt_self();
  if (cloudConfigurationQueue_token != -1)
    dispatch_once(&cloudConfigurationQueue_token, &__block_literal_global_21);
  return (id)cloudConfigurationQueue_queue;
}

void __59__ICCloudConfiguration_SharedInstance__sharedConfiguration__block_invoke()
{
  ICCloudConfiguration *v0;
  uint64_t v1;
  void *v2;
  id v3;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "![NSThread isMainThread]", "+[ICCloudConfiguration(SharedInstance) sharedConfiguration]_block_invoke", 1, 0, CFSTR("Unexpected call from main thread"));
  v0 = [ICCloudConfiguration alloc];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ICCloudConfiguration initWithUserDefaults:](v0, "initWithUserDefaults:", v3);
  v2 = (void *)sharedConfiguration_sharedConfiguration;
  sharedConfiguration_sharedConfiguration = v1;

}

- (ICCloudConfiguration)initWithUserDefaults:(id)a3 usesLocalConfigurationFile:(BOOL)a4
{
  _BOOL4 v4;
  ICCloudConfiguration *v5;
  ICCloudConfiguration *v6;
  dispatch_time_t v7;
  _QWORD block[4];
  ICCloudConfiguration *v10;

  v4 = a4;
  v5 = -[ICCloudConfiguration initWithConfigurationDictionary:userDefaults:usesLocalConfigurationFile:](self, "initWithConfigurationDictionary:userDefaults:usesLocalConfigurationFile:", MEMORY[0x1E0C9AA70], a3, a4);
  v6 = v5;
  if (v5)
  {
    if (v4)
      -[ICCloudConfiguration loadLocalConfigurationFile](v5, "loadLocalConfigurationFile");
    v7 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__ICCloudConfiguration_initWithUserDefaults_usesLocalConfigurationFile___block_invoke;
    block[3] = &unk_1E76C73F8;
    v10 = v6;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);

  }
  return v6;
}

- (void)loadLocalConfigurationFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Using default configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (ICCloudConfiguration)initWithUserDefaults:(id)a3
{
  return -[ICCloudConfiguration initWithUserDefaults:usesLocalConfigurationFile:](self, "initWithUserDefaults:usesLocalConfigurationFile:", a3, 1);
}

- (ICCloudConfiguration)initWithConfigurationDictionary:(id)a3 userDefaults:(id)a4 usesLocalConfigurationFile:(BOOL)a5
{
  id v8;
  id v9;
  ICCloudConfiguration *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICCloudConfiguration;
  v10 = -[ICCloudConfiguration init](&v15, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v10->_configurationDictionary, v13);

    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_userDefaults, a4);
    v10->_usesLocalConfigurationFile = a5;
  }

  return v10;
}

+ (BOOL)isConfigurationValid:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("configurationVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEFAULT, "Configuration has no version", (uint8_t *)&v8, 2u);
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "unsignedIntegerValue") != 11)
  {
    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218240;
      v9 = objc_msgSend(v4, "unsignedIntegerValue");
      v10 = 2048;
      v11 = 11;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_DEFAULT, "Configuration version (%ld) is not the expected version (%ld)", (uint8_t *)&v8, 0x16u);
    }

LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v5 = 1;
LABEL_10:

  return v5;
}

- (void)setConfigurationFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *minimumClientVersion;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  ICCloudThrottlingLevel *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  ICCloudThrottlingLevel *v34;
  ICCloudThrottlingPolicy *v35;
  void *throttlingPolicy;
  NSObject *v37;
  ICCloudThrottlingPolicy *v38;
  ICCloudThrottlingPolicy *v39;
  ICCloudThrottlingPolicy *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  double v47;
  NSObject *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  NSObject *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  NSObject *v56;
  void *v57;
  void *v58;
  unint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  NSObject *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  NSObject *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  _BOOL4 v76;
  uint64_t v77;
  unint64_t v78;
  void *v79;
  void *v80;
  unint64_t v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSNumber *v88;
  NSObject *v89;
  NSNumber *maximumAttachmentSizeMB;
  void *v91;
  void *v92;
  unint64_t v93;
  void *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  unint64_t v99;
  NSObject *v100;
  void *v101;
  void *v102;
  unint64_t v103;
  NSObject *v104;
  void *v105;
  uint64_t v106;
  unint64_t v107;
  NSObject *v108;
  void *v109;
  unint64_t v110;
  NSObject *v111;
  void *v112;
  void *v113;
  unint64_t v114;
  NSObject *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  unint64_t v124;
  NSObject *v125;
  void *v126;
  void *v127;
  NSObject *v128;
  void *v129;
  void *v130;
  NSObject *v131;
  void *v132;
  void *v133;
  unint64_t v134;
  NSObject *v135;
  void *v136;
  double v137;
  double v138;
  NSObject *v139;
  void *v140;
  void *v141;
  NSObject *v142;
  void *v143;
  void *v144;
  double v145;
  NSObject *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  NSObject *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  NSObject *v154;
  ICCloudConfiguration *v155;
  void *v156;
  void *v157;
  NSObject *v158;
  void *v159;
  NSUserDefaults *v160;
  void *v161;
  void *v162;
  NSObject *v163;
  id v164;
  id v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  id v190;
  void *v191;
  os_unfair_lock_t lock;
  void *v193;
  void *v194;
  ICCloudConfiguration *v195;
  id obj;
  id obja;
  _QWORD block[4];
  id v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  _QWORD v204[2];
  _QWORD v205[2];
  uint8_t buf[4];
  const __CFString *v207;
  ICCloudThrottlingLevel *v208;
  _BYTE v209[128];
  uint64_t v210;

  v210 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = (void *)MEMORY[0x1E0C9AA70];
  v8 = v7;

  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_configurationDictionary, v7);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minimumClientVersions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9
    && (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("iOS")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("iOS"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    minimumClientVersion = self->_minimumClientVersion;
    self->_minimumClientVersion = v12;
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no minimum client version", buf, 2u);
    }

    minimumClientVersion = self->_minimumClientVersion;
    self->_minimumClientVersion = (NSString *)CFSTR("9,0,0");
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("throttlingPolicyResetIntervalSeconds"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  if (v17 == 0.0)
    v17 = 86400.0;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("throttlingPolicy"));
  v18 = objc_claimAutoreleasedReturnValue();
  v194 = v10;
  v195 = self;
  v193 = (void *)v18;
  if (v18)
  {
    v19 = (void *)v18;
    v190 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (ICCloudThrottlingLevel *)objc_claimAutoreleasedReturnValue();
    v200 = 0u;
    v201 = 0u;
    v202 = 0u;
    v203 = 0u;
    obj = v19;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v209, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v201;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v201 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * i);
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("count"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "unsignedIntegerValue");

          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("intervalSeconds"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "doubleValue");
          v30 = v29;

          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("maximumIntervalFactor"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          v33 = v32;

          v34 = -[ICCloudThrottlingLevel initWithBatchInterval:maximumBatchIntervalFactor:numberOfBatches:]([ICCloudThrottlingLevel alloc], "initWithBatchInterval:maximumBatchIntervalFactor:numberOfBatches:", v27, v30, v33);
          -[ICCloudThrottlingLevel addObject:](v20, "addObject:", v34);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v209, 16);
      }
      while (v22);
    }

    v35 = -[ICCloudThrottlingPolicy initWithThrottlingLevels:resetInterval:]([ICCloudThrottlingPolicy alloc], "initWithThrottlingLevels:resetInterval:", v20, v17);
    self = v195;
    throttlingPolicy = v195->_throttlingPolicy;
    v195->_throttlingPolicy = v35;
    v8 = v190;
  }
  else
  {
    v37 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v37, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no throttling levels", buf, 2u);
    }

    v20 = -[ICCloudThrottlingLevel initWithBatchInterval:maximumBatchIntervalFactor:numberOfBatches:]([ICCloudThrottlingLevel alloc], "initWithBatchInterval:maximumBatchIntervalFactor:numberOfBatches:", 0, 60.0, 5.0);
    v38 = [ICCloudThrottlingPolicy alloc];
    v208 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v208, 1);
    throttlingPolicy = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[ICCloudThrottlingPolicy initWithThrottlingLevels:resetInterval:](v38, "initWithThrottlingLevels:resetInterval:", throttlingPolicy, v17);
    v40 = self->_throttlingPolicy;
    self->_throttlingPolicy = v39;

  }
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("appStoreRatingCohortPercentage"), v8);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  obja = v42;
  if (v42)
  {
    v43 = objc_msgSend(v42, "unsignedIntegerValue");
  }
  else
  {
    v44 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v44, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating cohort percentage", buf, 2u);
    }

    v43 = 0;
  }
  self->_appStoreRatingCohortPercentage = v43;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("appStoreRatingIdleTimeInterval"), v8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v191 = v46;
  if (v46)
  {
    objc_msgSend(v46, "doubleValue");
  }
  else
  {
    v48 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v48, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating idle time interval", buf, 2u);
    }

    v47 = 5.0;
  }
  self->_appStoreRatingIdleTimeInterval = v47;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("appStoreRatingLaunchCount"), v8);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v189 = v50;
  if (v50)
  {
    v51 = objc_msgSend(v50, "unsignedIntegerValue");
  }
  else
  {
    v52 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v52, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating launch count", buf, 2u);
    }

    v51 = 3;
  }
  self->_appStoreRatingLaunchCount = v51;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("appStoreRatingLaunchDayPeriod"), v8);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v188 = v54;
  if (v54)
  {
    v55 = objc_msgSend(v54, "unsignedIntegerValue");
  }
  else
  {
    v56 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v56, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating launch day period", buf, 2u);
    }

    v55 = 30;
  }
  self->_appStoreRatingLaunchDayPeriod = v55;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("appStoreRatingOldestLaunchDayPeriod"), v8);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v187 = v58;
  if (v58)
  {
    v59 = objc_msgSend(v58, "unsignedIntegerValue");
  }
  else
  {
    v60 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v60, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating oldest launch day period", buf, 2u);
    }

    v59 = 7;
  }
  self->_appStoreRatingOldestLaunchDayPeriod = v59;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("appStoreRatingNoteCount"), v8);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v186 = v62;
  if (v62)
  {
    v63 = objc_msgSend(v62, "unsignedIntegerValue");
  }
  else
  {
    v64 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v64, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating note count", buf, 2u);
    }

    v63 = 100;
  }
  self->_appStoreRatingNoteCount = v63;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("appStoreRatingRequestDayPeriod"), v8);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v185 = v66;
  if (v66)
  {
    v67 = objc_msgSend(v66, "unsignedIntegerValue");
  }
  else
  {
    v68 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v68, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no app store rating request day period", buf, 2u);
    }

    v67 = 120;
  }
  self->_appStoreRatingRequestDayPeriod = v67;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("maxInlineAssetSizeBytes"), v8);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v184 = v70;
  if (v70)
  {
    v71 = objc_msgSend(v70, "unsignedIntegerValue");
  }
  else
  {
    v72 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v72, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no max inline asset size", buf, 2u);
    }

    v71 = 0x80000;
  }
  self->_maxInlineAssetSizeBytes = v71;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("maxAttachmentsPerNote"), v8);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = os_log_create("com.apple.notes", "Cloud");
  v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT);
  v183 = v74;
  if (v74)
  {
    if (v76)
    {
      v77 = objc_msgSend(v74, "unsignedIntegerValue");
      *(_DWORD *)buf = 134217984;
      v207 = (const __CFString *)v77;
      _os_log_impl(&dword_1BD918000, v75, OS_LOG_TYPE_DEFAULT, "Maximum attachments per note %lu", buf, 0xCu);
    }

    v78 = objc_msgSend(v74, "unsignedIntegerValue");
  }
  else
  {
    if (v76)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v75, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no max attachments per note", buf, 2u);
    }

    v78 = 100;
  }
  self->_maxAttachmentsPerNote = v78;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("maxSubAttachmentsPerAttachment"), v8);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  v182 = v80;
  if (v80)
  {
    v81 = objc_msgSend(v80, "unsignedIntegerValue");
  }
  else
  {
    v82 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v82, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no max sub attachments per attachment", buf, 2u);
    }

    v81 = 24;
  }
  self->_maxSubAttachmentsPerAttachment = v81;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("shouldSyncWhenEnteringForeground"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v83;
  if (v83)
  {
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("iOS"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    self->_shouldSyncWhenEnteringForeground = objc_msgSend(v85, "BOOLValue");

  }
  v181 = v84;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("maximumAttachmentSizeMB"), v8);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  v180 = v87;
  if (v87)
  {
    v88 = v87;
  }
  else
  {
    v89 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v89, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no max attachment size", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x4000);
    v88 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  maximumAttachmentSizeMB = self->_maximumAttachmentSizeMB;
  self->_maximumAttachmentSizeMB = v88;

  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("resultsLimitPerSyncOperation"), v8);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  v179 = v92;
  if (v92)
    v93 = objc_msgSend(v92, "unsignedIntegerValue");
  else
    v93 = 50;
  self->_resultsLimitPerSyncOperation = v93;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("shouldPerformTopHit"), v8);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  v178 = v95;
  if (v95)
  {
    self->_shouldPerformTopHitSearch = objc_msgSend(v95, "BOOLValue");
  }
  else
  {
    v96 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v96, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration not knowing whether or not the Top Hit Search Query should be enabled. Enabling it by default", buf, 2u);
    }

    self->_shouldPerformTopHitSearch = 1;
  }
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("mentionNotificationMaxRetries"), v8);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  v177 = v98;
  if (v98)
  {
    v99 = objc_msgSend(v98, "unsignedIntegerValue");
  }
  else
  {
    v100 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v100, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no mentionNotificationMaxRetries value", buf, 2u);
    }

    v99 = 10;
  }
  self->_mentionNotificationMaxRetries = v99;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("launchTaskMaxRetries"), v8);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  if (v102)
  {
    v103 = objc_msgSend(v102, "unsignedIntegerValue");
  }
  else
  {
    v104 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v104, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no launchTaskMaxRetryNumber value", buf, 2u);
    }

    v103 = 10;
  }
  self->_launchTaskMaxRetries = v103;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("serverSideUpdateTaskMaxFailureCount"), v8);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v106 = objc_claimAutoreleasedReturnValue();

  v175 = (void *)v106;
  if (v106)
  {
    v107 = objc_msgSend(v102, "unsignedIntegerValue");
  }
  else
  {
    v108 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v108, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no serverSideUpdateTaskMaxFailureCount value", buf, 2u);
    }

    v107 = 10;
  }
  self->_serverSideUpdateTaskMaxFailureCount = v107;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("durationInSecondsForNextPasswordReask"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = v109;
  if (v109)
  {
    v110 = objc_msgSend(v109, "unsignedIntegerValue");
  }
  else
  {
    v111 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v111, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no durationForNextPasswordReask value", buf, 2u);
    }

    v110 = 1209600;
  }
  self->_durationForNextPasswordReask = v110;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("unsupportedNoteDeviceCheckIntervalSeconds"), v8);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  v173 = v113;
  if (v113)
  {
    v114 = objc_msgSend(v113, "unsignedIntegerValue");
  }
  else
  {
    v115 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v115, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no unsupportedNoteDeviceCheckIntervalSecondsNumber value", buf, 2u);
    }

    v114 = 86400;
  }
  self->_unsupportedNoteDeviceCheckIntervalSeconds = v114;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("requestUserNotificationAuthorizationAtLaunch"), v8);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v172 = v117;
  if (v117)
  {
    self->_requestUserNotificationAuthorizationAtLaunch = objc_msgSend(v117, "BOOLValue");
  }
  else
  {
    v118 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v118, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with requestUserNotificationAuthorizationAtLaunch missing. We will check for shared objects before requesting authorization for user notifications at launch by default", buf, 2u);
    }

    self->_requestUserNotificationAuthorizationAtLaunch = 0;
  }
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("fastSyncEnabled"), v8);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v171 = v120;
  if (v120)
  {
    self->_fastSyncEnabled = objc_msgSend(v120, "BOOLValue");
  }
  else
  {
    v121 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v121, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no fastSyncEnabled value", buf, 2u);
    }

    self->_fastSyncEnabled = 1;
  }
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("fastSyncMaximumMessageSizeBytes"), v8);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  v170 = v123;
  if (v123)
  {
    v124 = objc_msgSend(v123, "unsignedIntegerValue");
  }
  else
  {
    v125 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v125, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no fastSyncMaximumMessageSizeBytes value", buf, 2u);
    }

    v124 = 64000;
  }
  self->_fastSyncMaximumMessageSizeBytes = v124;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("fastSyncPaperKitEnablePCSEncryption"), v8);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  v169 = v127;
  if (v127)
  {
    self->_fastSyncPaperKitEnablePCSEncryption = objc_msgSend(v127, "BOOLValue");
  }
  else
  {
    v128 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v128, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no fastSyncPaperKitEnablePCSEncryption value", buf, 2u);
    }

    self->_fastSyncPaperKitEnablePCSEncryption = 1;
  }
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("fastSyncPaperKitEnableEphemeralRecords"), v8);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = v130;
  if (v130)
  {
    self->_fastSyncPaperKitEnableEphemeralRecords = objc_msgSend(v130, "BOOLValue");
  }
  else
  {
    v131 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v131, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no fastSyncPaperKitEnableEphemeralRecords value", buf, 2u);
    }

    self->_fastSyncPaperKitEnableEphemeralRecords = 1;
  }
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("fastSyncMaximumThumbnailMessageSizeBytes"), v8);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  if (v133)
  {
    v134 = objc_msgSend(v133, "unsignedIntegerValue");
  }
  else
  {
    v135 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v135, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no fastSyncMaximumThumbnailMessageSizeBytes value", buf, 2u);
    }

    v134 = 102400;
  }
  self->_fastSyncMaximumThumbnailMessageSizeBytes = v134;
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("fastSyncPresenceDebounceDuration"), v8);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = v102;
  v167 = v133;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v136, "doubleValue");
    if (v137 > 5.0)
      v137 = 5.0;
    v138 = fmax(v137, 0.25);
  }
  else
  {
    v139 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v207 = CFSTR("fastSyncPresenceDebounceDuration");
      _os_log_impl(&dword_1BD918000, v139, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no %@ value", buf, 0xCu);
    }

    v138 = 1.0;
  }
  self->_fastSyncPresenceDebounceDuration = v138;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("keychainFetchingEnabled"), v8);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  if (v141)
  {
    self->_keychainFetchingEnabled = objc_msgSend(v141, "BOOLValue");
  }
  else
  {
    v142 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v207 = CFSTR("keychainFetchingEnabled");
      _os_log_impl(&dword_1BD918000, v142, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no %@ value", buf, 0xCu);
    }

    self->_keychainFetchingEnabled = 1;
  }
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("keychainFetchErrorTimeout"), v8);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  if (v144)
  {
    objc_msgSend(v144, "doubleValue");
  }
  else
  {
    v146 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v207 = CFSTR("keychainFetchErrorTimeout");
      _os_log_impl(&dword_1BD918000, v146, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no %@ value", buf, 0xCu);
    }

    v145 = 300.0;
  }
  self->_keychainFetchErrorTimeout = v145;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](self, "overridableValueForKey:inConfigurationDictionary:", CFSTR("keychainMinimumSyncInterval"), v8);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  v166 = v136;
  if (v148)
  {
    objc_msgSend(v148, "doubleValue");
  }
  else
  {
    v150 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v207 = CFSTR("keychainMinimumSyncInterval");
      _os_log_impl(&dword_1BD918000, v150, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no %@ value", buf, 0xCu);
    }

    v149 = 0x40AC200000000000;
  }
  *(_QWORD *)&v195->_keychainMinimumSyncInterval = v149;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](v195, "overridableValueForKey:inConfigurationDictionary:", CFSTR("keychainMaximumSyncInterval"), v8);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  if (v152)
  {
    objc_msgSend(v152, "doubleValue");
  }
  else
  {
    v154 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v207 = CFSTR("keychainMaximumSyncInterval");
      _os_log_impl(&dword_1BD918000, v154, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no %@ value", buf, 0xCu);
    }

    v153 = 0x40AC200000000000;
  }
  v155 = v195;
  *(_QWORD *)&v195->_keychainMaximumSyncInterval = v153;
  objc_opt_class();
  -[ICCloudConfiguration overridableValueForKey:inConfigurationDictionary:](v195, "overridableValueForKey:inConfigurationDictionary:", CFSTR("audioTranscriptPostProcessingEnabled"), v8);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  if (v157)
  {
    v195->_audioTranscriptPostProcessingEnabled = objc_msgSend(v157, "BOOLValue");
  }
  else
  {
    v158 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD918000, v158, OS_LOG_TYPE_DEFAULT, "Trying to create a cloud configuration with no audioTranscriptPostProcessingEnabled value", buf, 2u);
    }

    v155 = v195;
    v195->_audioTranscriptPostProcessingEnabled = 1;
  }
  os_unfair_lock_unlock(lock);
  v159 = (void *)MEMORY[0x1E0CB37C0];
  v204[0] = CFSTR("ICCloudConfigurationDictionary");
  v204[1] = CFSTR("ICCloudConfigurationUserDefaults");
  v205[0] = v8;
  v160 = v155->_userDefaults;
  v205[1] = v160;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v205, v204, 2);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "notificationWithName:object:userInfo:", CFSTR("ICCloudConfigurationChanged"), v155, v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  v163 = MEMORY[0x1E0C80D38];
  v164 = MEMORY[0x1E0C80D38];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ICCloudConfiguration_setConfigurationFromDictionary___block_invoke;
  block[3] = &unk_1E76C73F8;
  v165 = v162;
  v199 = v165;
  dispatch_async(v163, block);

}

- (id)overridableValueForKey:(id)a3 inConfigurationDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSUserDefaults *userDefaults;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  if (self)
    userDefaults = self->_userDefaults;
  else
    userDefaults = 0;
  objc_msgSend(v8, "overridableValueForKey:inConfigurationDictionary:userDefaults:", v7, v6, userDefaults);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)overridableValueForKey:(id)a3 inConfigurationDictionary:(id)a4 userDefaults:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

void __55__ICCloudConfiguration_setConfigurationFromDictionary___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotification:", *(_QWORD *)(a1 + 32));

}

void __94__ICCloudConfiguration_SharedInstance__loadSharedConfigurationWithQoSClass_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 40), "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

+ (ICCloudConfiguration)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1)
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_314);
  return (ICCloudConfiguration *)(id)sharedConfiguration_sharedConfiguration;
}

void __47__ICCloudConfiguration_cloudConfigurationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create_with_target_V2("com.apple.notes.cloud-configuration", 0, v2);
  v1 = (void *)cloudConfigurationQueue_queue;
  cloudConfigurationQueue_queue = (uint64_t)v0;

}

- (BOOL)fastSyncEnabled
{
  ICCloudConfiguration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_fastSyncEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSDictionary)configurationDictionary
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSDictionary copy](self->_configurationDictionary, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (unint64_t)appStoreRatingCohortPercentage
{
  os_unfair_lock_s *p_lock;
  unint64_t appStoreRatingCohortPercentage;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  appStoreRatingCohortPercentage = self->_appStoreRatingCohortPercentage;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingCohortPercentage;
}

- (double)appStoreRatingIdleTimeInterval
{
  os_unfair_lock_s *p_lock;
  double appStoreRatingIdleTimeInterval;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  appStoreRatingIdleTimeInterval = self->_appStoreRatingIdleTimeInterval;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingIdleTimeInterval;
}

- (unint64_t)appStoreRatingLaunchCount
{
  os_unfair_lock_s *p_lock;
  unint64_t appStoreRatingLaunchCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  appStoreRatingLaunchCount = self->_appStoreRatingLaunchCount;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingLaunchCount;
}

- (unint64_t)appStoreRatingLaunchDayPeriod
{
  os_unfair_lock_s *p_lock;
  unint64_t appStoreRatingLaunchDayPeriod;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  appStoreRatingLaunchDayPeriod = self->_appStoreRatingLaunchDayPeriod;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingLaunchDayPeriod;
}

- (unint64_t)appStoreRatingOldestLaunchDayPeriod
{
  os_unfair_lock_s *p_lock;
  unint64_t appStoreRatingOldestLaunchDayPeriod;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  appStoreRatingOldestLaunchDayPeriod = self->_appStoreRatingOldestLaunchDayPeriod;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingOldestLaunchDayPeriod;
}

- (unint64_t)appStoreRatingNoteCount
{
  os_unfair_lock_s *p_lock;
  unint64_t appStoreRatingNoteCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  appStoreRatingNoteCount = self->_appStoreRatingNoteCount;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingNoteCount;
}

- (unint64_t)appStoreRatingRequestDayPeriod
{
  os_unfair_lock_s *p_lock;
  unint64_t appStoreRatingRequestDayPeriod;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  appStoreRatingRequestDayPeriod = self->_appStoreRatingRequestDayPeriod;
  os_unfair_lock_unlock(p_lock);
  return appStoreRatingRequestDayPeriod;
}

- (BOOL)shouldSyncWhenEnteringForeground
{
  ICCloudConfiguration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_shouldSyncWhenEnteringForeground;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)maxInlineAssetSizeBytes
{
  os_unfair_lock_s *p_lock;
  unint64_t maxInlineAssetSizeBytes;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  maxInlineAssetSizeBytes = self->_maxInlineAssetSizeBytes;
  os_unfair_lock_unlock(p_lock);
  return maxInlineAssetSizeBytes;
}

- (NSNumber)maximumAttachmentSizeMB
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_maximumAttachmentSizeMB;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)maxAttachmentsPerNote
{
  os_unfair_lock_s *p_lock;
  unint64_t maxAttachmentsPerNote;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  maxAttachmentsPerNote = self->_maxAttachmentsPerNote;
  os_unfair_lock_unlock(p_lock);
  return maxAttachmentsPerNote;
}

- (unint64_t)maxSubAttachmentsPerAttachment
{
  os_unfair_lock_s *p_lock;
  unint64_t maxSubAttachmentsPerAttachment;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  maxSubAttachmentsPerAttachment = self->_maxSubAttachmentsPerAttachment;
  os_unfair_lock_unlock(p_lock);
  return maxSubAttachmentsPerAttachment;
}

- (unint64_t)resultsLimitPerSyncOperation
{
  os_unfair_lock_s *p_lock;
  unint64_t resultsLimitPerSyncOperation;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  resultsLimitPerSyncOperation = self->_resultsLimitPerSyncOperation;
  os_unfair_lock_unlock(p_lock);
  return resultsLimitPerSyncOperation;
}

- (BOOL)shouldPerformTopHitSearch
{
  ICCloudConfiguration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_shouldPerformTopHitSearch;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)mentionNotificationMaxRetries
{
  os_unfair_lock_s *p_lock;
  unint64_t mentionNotificationMaxRetries;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  mentionNotificationMaxRetries = self->_mentionNotificationMaxRetries;
  os_unfair_lock_unlock(p_lock);
  return mentionNotificationMaxRetries;
}

- (unint64_t)launchTaskMaxRetries
{
  os_unfair_lock_s *p_lock;
  unint64_t launchTaskMaxRetries;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  launchTaskMaxRetries = self->_launchTaskMaxRetries;
  os_unfair_lock_unlock(p_lock);
  return launchTaskMaxRetries;
}

- (unint64_t)serverSideUpdateTaskMaxFailureCount
{
  os_unfair_lock_s *p_lock;
  unint64_t serverSideUpdateTaskMaxFailureCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  serverSideUpdateTaskMaxFailureCount = self->_serverSideUpdateTaskMaxFailureCount;
  os_unfair_lock_unlock(p_lock);
  return serverSideUpdateTaskMaxFailureCount;
}

- (unint64_t)durationForNextPasswordReask
{
  os_unfair_lock_s *p_lock;
  unint64_t durationForNextPasswordReask;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  durationForNextPasswordReask = self->_durationForNextPasswordReask;
  os_unfair_lock_unlock(p_lock);
  return durationForNextPasswordReask;
}

- (unint64_t)unsupportedNoteDeviceCheckIntervalSeconds
{
  os_unfair_lock_s *p_lock;
  unint64_t unsupportedNoteDeviceCheckIntervalSeconds;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsupportedNoteDeviceCheckIntervalSeconds = self->_unsupportedNoteDeviceCheckIntervalSeconds;
  os_unfair_lock_unlock(p_lock);
  return unsupportedNoteDeviceCheckIntervalSeconds;
}

- (BOOL)requestUserNotificationAuthorizationAtLaunch
{
  ICCloudConfiguration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_requestUserNotificationAuthorizationAtLaunch;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)fastSyncMaximumMessageSizeBytes
{
  os_unfair_lock_s *p_lock;
  unint64_t fastSyncMaximumMessageSizeBytes;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fastSyncMaximumMessageSizeBytes = self->_fastSyncMaximumMessageSizeBytes;
  os_unfair_lock_unlock(p_lock);
  return fastSyncMaximumMessageSizeBytes;
}

- (BOOL)fastSyncPaperKitEnablePCSEncryption
{
  ICCloudConfiguration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_fastSyncPaperKitEnablePCSEncryption;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)fastSyncPaperKitEnableEphemeralRecords
{
  ICCloudConfiguration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_fastSyncPaperKitEnableEphemeralRecords;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)fastSyncMaximumThumbnailMessageSizeBytes
{
  os_unfair_lock_s *p_lock;
  unint64_t fastSyncMaximumThumbnailMessageSizeBytes;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fastSyncMaximumThumbnailMessageSizeBytes = self->_fastSyncMaximumThumbnailMessageSizeBytes;
  os_unfair_lock_unlock(p_lock);
  return fastSyncMaximumThumbnailMessageSizeBytes;
}

- (double)fastSyncPresenceDebounceDuration
{
  os_unfair_lock_s *p_lock;
  double fastSyncPresenceDebounceDuration;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fastSyncPresenceDebounceDuration = self->_fastSyncPresenceDebounceDuration;
  os_unfair_lock_unlock(p_lock);
  return fastSyncPresenceDebounceDuration;
}

- (BOOL)keychainFetchingEnabled
{
  ICCloudConfiguration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_keychainFetchingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (double)keychainFetchErrorTimeout
{
  os_unfair_lock_s *p_lock;
  double keychainFetchErrorTimeout;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  keychainFetchErrorTimeout = self->_keychainFetchErrorTimeout;
  os_unfair_lock_unlock(p_lock);
  return keychainFetchErrorTimeout;
}

- (double)keychainMinimumSyncInterval
{
  os_unfair_lock_s *p_lock;
  double keychainMinimumSyncInterval;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  keychainMinimumSyncInterval = self->_keychainMinimumSyncInterval;
  os_unfair_lock_unlock(p_lock);
  return keychainMinimumSyncInterval;
}

- (double)keychainMaximumSyncInterval
{
  os_unfair_lock_s *p_lock;
  double keychainMaximumSyncInterval;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  keychainMaximumSyncInterval = self->_keychainMaximumSyncInterval;
  os_unfair_lock_unlock(p_lock);
  return keychainMaximumSyncInterval;
}

- (BOOL)audioTranscriptPostProcessingEnabled
{
  ICCloudConfiguration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_audioTranscriptPostProcessingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

void __72__ICCloudConfiguration_initWithUserDefaults_usesLocalConfigurationFile___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "downloadRemoteConfiguration:", 0);
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_downloadRemoteConfiguration_, 0, 1, 86400.0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[ICCloudConfiguration setDownloadTimer:](*(_QWORD *)(a1 + 32), v2);

}

- (void)setDownloadTimer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 232), a2);
}

- (void)dealloc
{
  ICCloudConfiguration *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (ICCloudConfiguration *)self->_downloadTimer;
  -[ICCloudConfiguration invalidate](self, "invalidate");
  v3.receiver = v2;
  v3.super_class = (Class)ICCloudConfiguration;
  -[ICCloudConfiguration dealloc](&v3, sel_dealloc);
}

+ (NSURL)defaultConfigurationURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("CloudConfigurationPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    objc_msgSend(a1, "availableConfigurationURLs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __47__ICCloudConfiguration_defaultConfigurationURL__block_invoke;
    v22[3] = &unk_1E76C9B70;
    v23 = v4;
    objc_msgSend(v6, "ic_objectPassingTest:", v22);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "setDefaultConfigurationURL:", v7);
    v5 = (id)v7;
  }
  if (!v5)
  {
LABEL_5:
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(a1, "availableConfigurationURLs", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
LABEL_7:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsString:", CFSTR("Normal"));

        if ((v15 & 1) != 0)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
          if (v10)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      v5 = v13;

      if (v5)
        goto LABEL_16;
    }
    else
    {
LABEL_13:

    }
    objc_msgSend(a1, "availableConfigurationURLs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
    objc_msgSend(a1, "setDefaultConfigurationURL:", v5);
  }

  return (NSURL *)v5;
}

uint64_t __47__ICCloudConfiguration_defaultConfigurationURL__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

+ (void)setDefaultConfigurationURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0D64188];
  v4 = a3;
  objc_msgSend(v3, "sharedAppGroupDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("CloudConfigurationPath"));
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronize");

}

+ (NSArray)availableConfigurationURLs
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  os_unfair_lock_lock((os_unfair_lock_t)&availableConfigurationURLs_lock);
  if (availableConfigurationURLs_configurationURLs)
  {
    v2 = (id)objc_msgSend((id)availableConfigurationURLs_configurationURLs, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("CloudConfigurations"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "allObjects");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)availableConfigurationURLs_configurationURLs;
      availableConfigurationURLs_configurationURLs = v8;

    }
    else
    {
      v10 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[ICCloudConfiguration availableConfigurationURLs].cold.1();

    }
    v2 = (id)availableConfigurationURLs_configurationURLs;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&availableConfigurationURLs_lock);
  return (NSArray *)v2;
}

- (void)downloadRemoteConfiguration:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://configuration.apple.com/configurations/internetservices/cloudkit/notes-1.9.plist"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICCloudConfiguration downloadConfigurationFromRemoteURL:completionHandler:](self, "downloadConfigurationFromRemoteURL:completionHandler:", v4, &__block_literal_global_118);

}

void __52__ICCloudConfiguration_downloadRemoteConfiguration___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;

  if ((a2 & 1) == 0)
  {
    v2 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __52__ICCloudConfiguration_downloadRemoteConfiguration___block_invoke_cold_1();

  }
}

- (void)downloadConfigurationFromRemoteURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, void *);
  void *v16;
  ICCloudConfiguration *v17;
  id v18;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB39F8];
  v8 = a3;
  objc_msgSend(v7, "defaultSessionConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRequestCachePolicy:", 1);
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke;
  v16 = &unk_1E76C9BD8;
  v17 = self;
  v18 = v6;
  v11 = v6;
  objc_msgSend(v10, "dataTaskWithURL:completionHandler:", v8, &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "resume", v13, v14, v15, v16, v17);
}

void __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  os_log_t v15;
  os_log_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint8_t v24[8];
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_5(v9);

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
  }
  else
  {
    v12 = v8;
    if (objc_msgSend(v12, "statusCode") == 200)
    {
      v25 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, &v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v25;
      v15 = os_log_create("com.apple.notes", "Cloud");
      v16 = v15;
      if (v14)
      {
        v17 = v15;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_3(v14);

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_2();

        if (objc_msgSend((id)objc_opt_class(), "isConfigurationValid:", v13))
        {
          v20 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_1();

          objc_msgSend(*(id *)(a1 + 32), "setConfigurationFromDictionary:", v13);
        }
        objc_msgSend((id)objc_opt_class(), "cachedConfigurationURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "writeToURL:atomically:", v21, 1) & 1) == 0)
        {
          v22 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl(&dword_1BD918000, v22, OS_LOG_TYPE_DEFAULT, "Not able to write remote configuration to cache.", v24, 2u);
          }

        }
        v23 = *(_QWORD *)(a1 + 40);
        if (v23)
          (*(void (**)(uint64_t, uint64_t))(v23 + 16))(v23, 1);

      }
    }
    else
    {
      v18 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_4(v12);

      v19 = *(_QWORD *)(a1 + 40);
      if (v19)
        (*(void (**)(uint64_t, _QWORD))(v19 + 16))(v19, 0);
    }

  }
}

- (void)loadConfigurationFromURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICCloudConfiguration loadConfigurationFromURL:].cold.2();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICCloudConfiguration setConfigurationFromDictionary:](self, "setConfigurationFromDictionary:", v6);
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICCloudConfiguration loadConfigurationFromURL:].cold.1();

  }
}

- (void)loadConfigurationFromURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICCloudConfiguration *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[ICCloudConfiguration cloudConfigurationQueue]();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__ICCloudConfiguration_loadConfigurationFromURL_completionHandler___block_invoke;
  block[3] = &unk_1E76C9C00;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __67__ICCloudConfiguration_loadConfigurationFromURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v2, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setConfigurationFromDictionary:", v3);
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      v6 = *(void (**)(void))(v5 + 16);
LABEL_6:
      v6();
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      v6 = *(void (**)(void))(v7 + 16);
      goto LABEL_6;
    }
  }

}

- (BOOL)usesLocalConfigurationFile
{
  return self->_usesLocalConfigurationFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_downloadTimer, 0);
  objc_storeStrong((id *)&self->_minimumClientVersion, 0);
  objc_storeStrong((id *)&self->_maximumAttachmentSizeMB, 0);
  objc_storeStrong((id *)&self->_throttlingPolicy, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
}

+ (void)availableConfigurationURLs
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Unexpected error accessing cloud configuration URLs.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __52__ICCloudConfiguration_downloadRemoteConfiguration___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Unable to download remote configuration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Using remote configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Received remote configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Error serializing plist data to dictionary: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", objc_msgSend(a1, "statusCode"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Connected to remote configuration plist server but got back non 200 response: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __77__ICCloudConfiguration_downloadConfigurationFromRemoteURL_completionHandler___block_invoke_cold_5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Error downloading remote configuration plist: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)loadConfigurationFromURL:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1BD918000, v0, OS_LOG_TYPE_ERROR, "Failed to load cloud configuration dictionary from URL: %@", v1, 0xCu);
}

- (void)loadConfigurationFromURL:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1BD918000, v0, OS_LOG_TYPE_DEBUG, "Loading cloud configuration from URL: %@", v1, 0xCu);
}

@end
