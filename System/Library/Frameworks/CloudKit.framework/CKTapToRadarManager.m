@implementation CKTapToRadarManager

- (CKTapToRadarManager)init
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  const char *v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, CFSTR("CKTapToRadarManager.m"), 32, CFSTR("Please use +[CKTapToRadarManager sharedManager]"));

  return 0;
}

- (id)initInternal
{
  CKTapToRadarManager *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *alertQueue;
  uint64_t v7;
  NSMutableDictionary *lastPromptDateByMessageHash;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSUserDefaults *userDefaults;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)CKTapToRadarManager;
  v2 = -[CKTapToRadarManager init](&v36, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.cloudkit.taptoradar.alertQueue", v4);
    alertQueue = v2->_alertQueue;
    v2->_alertQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    lastPromptDateByMessageHash = v2->_lastPromptDateByMessageHash;
    v2->_lastPromptDateByMessageHash = (NSMutableDictionary *)v7;

    v9 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v12 = objc_msgSend_initWithSuiteName_(v9, v10, (uint64_t)CFSTR("com.apple.cloudd"), v11);
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v12;

    objc_msgSend_objectForKey_(v2->_userDefaults, v14, (uint64_t)CFSTR("LastTTRPromptDates"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend_allKeys(v16, v17, v18, v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v32, (uint64_t)v37, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v33;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v33 != v24)
              objc_enumerationMutation(v20);
            v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v25);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_objectForKeyedSubscript_(v16, v27, v26, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend_setObject_forKeyedSubscript_(v2->_lastPromptDateByMessageHash, v30, (uint64_t)v29, v26);

            }
            ++v25;
          }
          while (v23 != v25);
          v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v27, (uint64_t)&v32, (uint64_t)v37, 16);
        }
        while (v23);
      }

    }
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_1ECD96F80 != -1)
    dispatch_once(&qword_1ECD96F80, &unk_1E1F58BB8);
  return (id)qword_1ECD96F78;
}

- (id)_hashForMessage:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_msgSend_hash(a3, a2, (uint64_t)a3, v3);
  return (id)objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("%lu"), v7, v5);
}

- (id)_lastPromptDateForMessage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  objc_msgSend_alertQueue(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend_lastPromptDateByMessageHash(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__hashForMessage_(self, v13, (uint64_t)v4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v12, v16, (uint64_t)v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend_distantPast(MEMORY[0x1E0C99D68], v19, v20, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v18;
}

- (void)_notePromptAttemptForMessage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;

  v4 = a3;
  objc_msgSend_alertQueue(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend_date(MEMORY[0x1E0C99D68], v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastPromptDateByMessageHash(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__hashForMessage_(self, v17, (uint64_t)v4, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v16, v20, (uint64_t)v12, (uint64_t)v19);
  objc_msgSend_userDefaults(self, v21, v22, v23);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastPromptDateByMessageHash(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v29, v28, (uint64_t)v27, (uint64_t)CFSTR("LastTTRPromptDates"));

}

- (void)_launchTTRWithRequest:(id)a3
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  id v80;

  v80 = a3;
  v3 = (void *)MEMORY[0x1E0CB3940];
  CKBuildVersion();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_title(v80, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@: Tap-To-Radar: \"%@\"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend_length(v11, v12, v13, v14) >= 0xF0)
  {
    objc_msgSend_substringToIndex_(v11, v15, 239, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v18;
  }
  objc_msgSend_componentID(v80, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    objc_msgSend_setComponentID_(v80, v20, (uint64_t)CFSTR("552485"), v22);
  objc_msgSend_componentName(v80, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    objc_msgSend_setComponentName_(v80, v24, (uint64_t)CFSTR("CloudKit"), v26);
  objc_msgSend_componentVersion(v80, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
    objc_msgSend_setComponentVersion_(v80, v28, (uint64_t)CFSTR("All"), v30);
  objc_msgSend_radarDescription(v80, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    objc_msgSend_title(v80, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRadarDescription_(v80, v36, (uint64_t)v35, v37);

  }
  v38 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_componentID(v80, v32, v33, v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentName(v80, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentVersion(v80, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_radarDescription(v80, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relatedRadar(v80, v52, v53, v54);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
    v59 = CFSTR("\n");
  else
    v59 = &stru_1E1F66ED0;
  objc_msgSend_relatedRadar(v80, v55, v56, v57);
  v60 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)v60;
  if (v60)
    objc_msgSend_stringWithFormat_(v38, v61, (uint64_t)CFSTR("tap-to-radar://new?Title=%@&ComponentID=%@&ComponentName=%@&ComponentVersion=%@&Classification=Serious Bug&Description=%@%@%@&Reproducibility=I Didn't Try"), v62, v11, v39, v43, v47, v51, v59, v60);
  else
    objc_msgSend_stringWithFormat_(v38, v61, (uint64_t)CFSTR("tap-to-radar://new?Title=%@&ComponentID=%@&ComponentName=%@&ComponentVersion=%@&Classification=Serious Bug&Description=%@%@%@&Reproducibility=I Didn't Try"), v62, v11, v39, v43, v47, v51, v59, &stru_1E1F66ED0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x1E0CB3500], v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v64, v69, (uint64_t)v68, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v72, (uint64_t)v71, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultWorkspace(MEMORY[0x1E0CA5878], v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_openURL_configuration_completionHandler_(v78, v79, (uint64_t)v74, 0, 0);

}

- (void)_lockedTriggerTapToRadarWithRequest:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int isAppleInternalInstall;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  const __CFDictionary *v72;
  __CFUserNotification *v73;
  const char *v74;
  uint64_t v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  _QWORD v81[4];
  _QWORD v82[4];
  _BYTE buf[12];
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_alertQueue(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend_title(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_sharedOptions(CKBehaviorOptions, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v16, v17, v18, v19);

    if (isAppleInternalInstall)
    {
      objc_msgSend_title(v4, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__lastPromptDateForMessage_(self, v25, (uint64_t)v24, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceNow(v27, v28, v29, v30);
      v32 = fabs(v31);

      objc_msgSend_sharedOptions(CKBehaviorOptions, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_minTTRPromptInterval(v36, v37, v38, v39);
      v41 = v40;

      if (v32 >= v41)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v48 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          v76 = v48;
          objc_msgSend_title(v4, v77, v78, v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v80;
          _os_log_debug_impl(&dword_18A5C5000, v76, OS_LOG_TYPE_DEBUG, "Creating a TTR prompt for \"%@\", buf, 0xCu);

        }
        objc_msgSend_title(v4, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__notePromptAttemptForMessage_(self, v53, (uint64_t)v52, v54);

        v55 = *MEMORY[0x1E0C9B800];
        v82[0] = CFSTR("Tap-To-Radar");
        v56 = *MEMORY[0x1E0C9B810];
        v81[0] = v55;
        v81[1] = v56;
        v57 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_matterhornName(CKContainer, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_title(v4, v62, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v57, v66, (uint64_t)CFSTR("A problem has been detected with your %@ account:\n\n\"%@\"\n\nWould you mind filing a Radar?"), v67, v61, v65);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = *MEMORY[0x1E0C9B838];
        v82[1] = v68;
        v82[2] = CFSTR("File a Radar");
        v70 = *MEMORY[0x1E0C9B830];
        v81[2] = v69;
        v81[3] = v70;
        v82[3] = CFSTR("Not Now");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v71, (uint64_t)v82, (uint64_t)v81, 4);
        v72 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        v73 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v72);
        *(_QWORD *)buf = 0;
        CFUserNotificationReceiveResponse(v73, 86400.0, (CFOptionFlags *)buf);
        if ((buf[0] & 3) == 0)
          objc_msgSend__launchTTRWithRequest_(self, v74, (uint64_t)v4, v75);
        if (v73)
          CFRelease(v73);

      }
      else
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v42 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          v43 = v42;
          objc_msgSend_title(v4, v44, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          *(double *)&buf[4] = v32;
          v84 = 2112;
          v85 = v47;
          _os_log_debug_impl(&dword_18A5C5000, v43, OS_LOG_TYPE_DEBUG, "Not creating a TTR notification because it hasn't been long enough since the last prompt (%0.1fs) for message \"%@\", buf, 0x16u);

        }
      }
    }
  }

}

- (void)triggerTapToRadarWithRequest:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend_alertQueue(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A8195D0;
  block[3] = &unk_1E1F61580;
  objc_copyWeak(&v12, &location);
  v11 = v4;
  v9 = v4;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)alertQueue
{
  return self->_alertQueue;
}

- (void)setAlertQueue:(id)a3
{
  objc_storeStrong((id *)&self->_alertQueue, a3);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (NSMutableDictionary)lastPromptDateByMessageHash
{
  return self->_lastPromptDateByMessageHash;
}

- (void)setLastPromptDateByMessageHash:(id)a3
{
  objc_storeStrong((id *)&self->_lastPromptDateByMessageHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPromptDateByMessageHash, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_alertQueue, 0);
}

@end
