@implementation IDSRegistrationKeychainReader

+ (id)sharedInstance
{
  if (qword_1ECDD47A8 != -1)
    dispatch_once(&qword_1ECDD47A8, &unk_1E3C1B690);
  return (id)qword_1ECDD47F8;
}

- (IDSRegistrationKeychainReader)init
{
  IDSRegistrationKeychainReader *v2;
  uint64_t v3;
  IDSRegistrationKeychainReader *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  id purgeCancelBlock;
  IDSRegistrationKeychainReader *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  id purgeEnqueueBlock;
  NSMutableArray *registrationData;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v19[4];
  IDSRegistrationKeychainReader *v20;
  id v21;
  _QWORD v22[4];
  IDSRegistrationKeychainReader *v23;
  id v24;
  id location;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)IDSRegistrationKeychainReader;
  v2 = -[IDSRegistrationKeychainReader init](&v26, sel_init);
  if (v2)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_19B9A5B5C;
    v22[3] = &unk_1E3C1F9A0;
    objc_copyWeak(&v24, &location);
    v4 = v2;
    v23 = v4;
    v8 = objc_msgSend_copy(v22, v5, v6, v7);
    purgeCancelBlock = v4->_purgeCancelBlock;
    v4->_purgeCancelBlock = (id)v8;

    v19[0] = v3;
    v19[1] = 3221225472;
    v19[2] = sub_19B9A5BA8;
    v19[3] = &unk_1E3C1F9A0;
    objc_copyWeak(&v21, &location);
    v10 = v4;
    v20 = v10;
    v14 = objc_msgSend_copy(v19, v11, v12, v13);
    purgeEnqueueBlock = v10->_purgeEnqueueBlock;
    v10->_purgeEnqueueBlock = (id)v14;

    pthread_mutex_lock(&stru_1EE409720);
    registrationData = v10->_registrationData;
    v10->_registrationData = 0;

    pthread_mutex_unlock(&stru_1EE409720);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)sub_19B9A5C8C, CFSTR("__kIDSRegistrationKeychainChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_lock(&stru_1EE409720);
  pthread_mutex_unlock(&stru_1EE409720);
  v3.receiver = self;
  v3.super_class = (Class)IDSRegistrationKeychainReader;
  -[IDSRegistrationKeychainReader dealloc](&v3, sel_dealloc);
}

+ (id)keychainServiceForVersion:(unint64_t)a3
{
  __CFString *v3;

  if (a3)
    v3 = CFSTR("com.apple.facetime");
  else
    v3 = CFSTR("com.apple.iChat.VeniceRegistrationAgent");
  return v3;
}

+ (id)keychainAccountForVersion:(unint64_t)a3
{
  double v3;
  __CFString *v4;

  if (a3)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@V%d"), v3, CFSTR("registration"), a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("VeniceInfo");
  }
  return v4;
}

+ (id)keychainAccessGroupForVersion:(unint64_t)a3
{
  return CFSTR("apple");
}

- (void)_flush
{
  NSObject *v3;
  NSMutableArray *registrationData;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  uint8_t v9[16];

  im_primary_queue();
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, self->_purgeCancelBlock);

  pthread_mutex_lock(&stru_1EE409720);
  registrationData = self->_registrationData;
  self->_registrationData = 0;

  objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "Purged keychain reader", v9, 2u);
  }

  pthread_mutex_unlock(&stru_1EE409720);
}

- (void)flushCache
{
  ((void (*)(IDSRegistrationKeychainReader *, char *))MEMORY[0x1E0DE7D20])(self, sel__flush);
}

- (void)_setPurgeTimer
{
  NSObject *v3;

  im_primary_queue();
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, self->_purgeEnqueueBlock);

}

- (void)_reloadFromDictionaryLocked:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  NSMutableArray *v14;
  NSMutableArray *registrationData;
  const char *v16;
  uint64_t v17;
  double v18;
  int v19;
  const char *v20;
  uint64_t v21;
  double v22;
  NSObject *v23;
  _DWORD v24[2];
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("data"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v8, (uint64_t)CFSTR("save-identifier"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (NSMutableArray *)objc_msgSend_mutableCopy(v7, v11, v12, v13);
  registrationData = self->_registrationData;
  self->_registrationData = v14;

  v19 = objc_msgSend_count(self->_registrationData, v16, v17, v18);
  objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v20, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24[0] = 67109378;
    v24[1] = v19;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "Loaded keychain dictionary, %d entries, saveIdentifier %@", (uint8_t *)v24, 0x12u);
  }

}

- (id)registrationData
{
  const char *v3;
  uint64_t v4;
  double v5;
  NSMutableArray *registrationData;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;

  pthread_mutex_lock(&stru_1EE409720);
  registrationData = self->_registrationData;
  if (!registrationData)
  {
    objc_msgSend__reloadFromKeychainLocked(self, v3, v4, v5);
    registrationData = self->_registrationData;
  }
  v7 = (void *)objc_msgSend_copy(registrationData, v3, v4, v5);
  pthread_mutex_unlock(&stru_1EE409720);
  objc_msgSend__setPurgeTimer(self, v8, v9, v10);
  return v7;
}

- (void)_reloadFromKeychainLocked
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  NSObject *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  NSObject *v30;
  const char *v32;
  double v33;
  id v34;
  id v35;
  const char *v36;
  uint64_t v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  unint64_t v46;
  NSObject *v47;
  void *v48;
  const char *v49;
  double v50;
  void *v51;
  void *v52;
  const char *v53;
  double v54;
  id v55;
  const char *v56;
  uint64_t v57;
  double v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  double v62;
  NSObject *v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  id v68;
  const char *v69;
  double v70;
  const char *v71;
  uint64_t v72;
  double v73;
  unint64_t v74;
  const char *v75;
  uint64_t v76;
  double v77;
  NSObject *v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  double v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  double v86;
  NSObject *v87;
  NSObject *v88;
  const char *v89;
  uint64_t v90;
  double v91;
  NSObject *v92;
  const char *v93;
  uint64_t v94;
  double v95;
  NSObject *v96;
  const char *v97;
  uint64_t v98;
  double v99;
  __CFDictionary *v100;
  const char *v101;
  double v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  double v106;
  int v107;
  const char *v108;
  double v109;
  void *v110;
  const char *v111;
  double v112;
  void *v113;
  const char *v114;
  double v115;
  void *v116;
  const char *v117;
  double v118;
  void *v119;
  __CFDictionary *v120;
  const __CFString *v121;
  void *v122;
  const char *v123;
  double v124;
  void *v125;
  const char *v126;
  double v127;
  void *v128;
  const char *v129;
  double v130;
  const char *v131;
  double v132;
  void *v133;
  const char *v134;
  double v135;
  const char *v136;
  double v137;
  void *v138;
  const char *v139;
  double v140;
  NSObject *v141;
  const char *v142;
  double v143;
  void *v144;
  id v145[2];
  int v146;
  uint8_t buf[4];
  _BYTE v148[14];
  __int16 v149;
  id v150;
  __int16 v151;
  void *v152;
  uint64_t v153;

  v3 = 0;
  v4 = 0;
  v153 = *MEMORY[0x1E0C80C00];
  v5 = 2;
  while (1)
  {
    v6 = v3;
    v7 = (void *)objc_opt_class();
    objc_msgSend_keychainServiceForVersion_(v7, v8, v5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_class();
    objc_msgSend_keychainAccountForVersion_(v11, v12, v5, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_opt_class();
    objc_msgSend_keychainAccessGroupForVersion_(v15, v16, v5, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = 0;
    objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v148 = v5;
      *(_WORD *)&v148[4] = 2112;
      *(_QWORD *)&v148[6] = v10;
      v149 = 2112;
      v150 = v14;
      v151 = 2112;
      v152 = v18;
      _os_log_impl(&dword_19B949000, v22, OS_LOG_TYPE_INFO, "Attempting to load V%d keychain blob from service: %@   account: %@   accessGroup: %@", buf, 0x26u);
    }

    v145[1] = v6;
    v23 = IMGetKeychainData();
    v3 = v6;

    if (v23)
    {
      if (v3)
        break;
    }

    ++v4;
    --v5;
    if (v4 > 2)
    {
      v5 = 0;
      goto LABEL_12;
    }
  }
  objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v24, v25, v26);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v148 = v5;
    _os_log_impl(&dword_19B949000, v30, OS_LOG_TYPE_INFO, "  => Found V%d keychain blob", buf, 8u);
  }

LABEL_12:
  if (objc_msgSend_length(v3, v27, v28, v29))
  {
    v145[0] = 0;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v32, (uint64_t)v3, v33, 0, 0, v145);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v35 = v145[0];
    v39 = v35;
    if (!v34)
    {
      objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v36, v37, v38);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v148 = v39;
        _os_log_impl(&dword_19B949000, v47, OS_LOG_TYPE_DEFAULT, "Unable to parse property list: %@", buf, 0xCu);
      }

      v48 = (void *)objc_opt_class();
      objc_msgSend_keychainServiceForVersion_(v48, v49, v5, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)objc_opt_class();
      objc_msgSend_keychainAccountForVersion_(v52, v53, v5, v54);
      v55 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v56, v57, v58);
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v148 = v5;
        *(_WORD *)&v148[4] = 2112;
        *(_QWORD *)&v148[6] = v51;
        v149 = 2112;
        v150 = v55;
        _os_log_impl(&dword_19B949000, v59, OS_LOG_TYPE_DEFAULT, "Removing invalid keychain data (V%d) for service: %@   account: %@", buf, 0x1Cu);
      }

      v146 = 0;
      if ((IMRemoveKeychainData() & 1) == 0)
      {
        objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v60, v61, v62);
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v148 = v146;
          _os_log_impl(&dword_19B949000, v63, OS_LOG_TYPE_DEFAULT, "  => Unable to remove invalid keychain blob (error: %d)", buf, 8u);
        }

      }
      v34 = 0;
      goto LABEL_76;
    }

    objc_msgSend_objectForKey_(v34, v40, (uint64_t)CFSTR("version"), v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v42;
    if (v42)
      v46 = objc_msgSend_unsignedIntegerValue(v42, v43, v44, v45);
    else
      v46 = 0;
    if (v46 >= 2)
      goto LABEL_77;
    objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v43, v44, v45);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v148 = v46;
      _os_log_impl(&dword_19B949000, v64, OS_LOG_TYPE_DEFAULT, "Keychain dictionary V%d needs upgrade", buf, 8u);
    }

    v55 = v34;
    if (!objc_msgSend_count(v55, v65, v66, v67))
    {
      v34 = 0;
LABEL_75:
      v51 = v55;
LABEL_76:

LABEL_77:
      objc_msgSend__reloadFromDictionaryLocked_(self, v142, (uint64_t)v34, v143);
      goto LABEL_78;
    }
    v68 = v55;
    objc_msgSend_objectForKey_(v68, v69, (uint64_t)CFSTR("version"), v70);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend_unsignedIntegerValue(v144, v71, v72, v73);
    objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v75, v76, v77);
    v78 = objc_claimAutoreleasedReturnValue();
    v79 = v78;
    if (v74 > 2)
    {
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v148 = v74;
        *(_WORD *)&v148[4] = 1024;
        *(_DWORD *)&v148[6] = 2;
        _os_log_impl(&dword_19B949000, v79, OS_LOG_TYPE_DEFAULT, "Invalid keychain dict version (%d) -- current is %d", buf, 0xEu);
      }

      v34 = 0;
LABEL_74:

      goto LABEL_75;
    }
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v148 = 2;
      _os_log_impl(&dword_19B949000, v79, OS_LOG_TYPE_INFO, "Updating keychain dict to current version (%d)", buf, 8u);
    }

    objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v80, v81, v82);
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v148 = v68;
      _os_log_impl(&dword_19B949000, v83, OS_LOG_TYPE_INFO, "Keychain dictionary before upgrade : %@", buf, 0xCu);
    }

    if (v74 >= 2)
    {
LABEL_71:
      objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v84, v85, v86);
      v141 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v148 = v68;
        _os_log_impl(&dword_19B949000, v141, OS_LOG_TYPE_INFO, "Keychain dictionary after upgrade : %@", buf, 0xCu);
      }

      v34 = v68;
      v68 = v34;
      goto LABEL_74;
    }
    while (1)
    {
      if (v74 == 1)
      {
        objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v84, v85, v86);
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v92, OS_LOG_TYPE_INFO, "  => Updating from V1 to V2", buf, 2u);
        }
        v74 = 2;
        goto LABEL_70;
      }
      objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v84, v85, v86);
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v87, OS_LOG_TYPE_INFO, "  => Updating from V0 to V1", buf, 2u);
      }

      v88 = v68;
      v92 = v88;
      if (!v88 || !objc_msgSend_count(v88, v89, v90, v91))
      {
        objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v89, v90, v91);
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v96, OS_LOG_TYPE_DEFAULT, "Unable to upgrade an empty keychain data from V0 to V1", buf, 2u);
        }
        v68 = 0;
        goto LABEL_69;
      }
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v89, v90, v91);
      v68 = (id)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend_mutableCopy(v92, v93, v94, v95);
      v100 = (__CFDictionary *)objc_msgSend_mutableCopy(v92, v97, v98, v99);
      objc_msgSend_objectForKey_(v92, v101, (uint64_t)CFSTR("type"), v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend_intValue(v103, v104, v105, v106);

      if (!v107)
        break;
      if (v107 == 1)
      {
        objc_msgSend_objectForKey_(v92, v108, (uint64_t)CFSTR("phone-number"), v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        if (v110)
          CFDictionarySetValue((CFMutableDictionaryRef)v96, CFSTR("main-id"), v110);

        objc_msgSend_objectForKey_(v92, v111, (uint64_t)CFSTR("phone-number"), v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        if (v113)
          CFDictionarySetValue(v100, CFSTR("main-id"), v113);

        objc_msgSend_objectForKey_(v92, v114, (uint64_t)CFSTR("user-id"), v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        if (v116)
          CFDictionarySetValue((CFMutableDictionaryRef)v96, CFSTR("profile-id"), v116);

        objc_msgSend_objectForKey_(v92, v117, (uint64_t)CFSTR("user-id"), v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        if (v119)
        {
          v120 = v100;
          v121 = CFSTR("profile-id");
          goto LABEL_66;
        }
        goto LABEL_67;
      }
LABEL_68:
      CFDictionarySetValue((CFMutableDictionaryRef)v96, CFSTR("migrated-v0-dictionary"), v92);
      CFDictionarySetValue(v100, CFSTR("migrated-v0-dictionary"), v92);
      _StringForIDSRegistrationServiceType(CFSTR("FaceTime"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v96, v126, (uint64_t)v125, v127, CFSTR("service"));

      _StringForIDSRegistrationServiceType(CFSTR("iMessage"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v100, v129, (uint64_t)v128, v130, CFSTR("service"));

      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v131, 1, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v68, v134, (uint64_t)v133, v135, CFSTR("version"));

      objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v136, (uint64_t)v96, v137, v100, 0);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v68, v139, (uint64_t)v138, v140, CFSTR("data"));

LABEL_69:
      v74 = 1;
LABEL_70:

      if (v74 >= 2)
        goto LABEL_71;
    }
    objc_msgSend_objectForKey_(v92, v108, (uint64_t)CFSTR("phone-number"), v109);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (v122)
      CFDictionarySetValue((CFMutableDictionaryRef)v96, CFSTR("main-id"), v122);

    objc_msgSend_objectForKey_(v92, v123, (uint64_t)CFSTR("phone-number"), v124);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (v119)
    {
      v120 = v100;
      v121 = CFSTR("main-id");
LABEL_66:
      CFDictionarySetValue(v120, v121, v119);
    }
LABEL_67:

    goto LABEL_68;
  }
  v34 = 0;
  objc_msgSend__reloadFromDictionaryLocked_(self, v32, 0, v33);
LABEL_78:

}

- (id)registrationWithServiceType:(id)a3 accountType:(int)a4 isTemporary:(BOOL)a5 value:(id)a6
{
  _BOOL4 v7;
  const char *v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const char *v20;
  double v21;
  uint64_t v22;
  const char *v23;
  double v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  int v35;
  const char *v36;
  double v37;
  void *v38;
  id v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  const char *v45;
  uint64_t v46;
  double v47;
  IDSRegistrationKeychainReader *v49;
  id v50;
  NSMutableArray *obj;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v7 = a5;
  v66 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v50 = a6;
  pthread_mutex_lock(&stru_1EE409720);
  if (a4 == 2)
  {
    objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_INFO, "Ignoring keychain registration request for local account", buf, 2u);
    }

    v14 = 0;
  }
  else
  {
    if (!self->_registrationData)
      objc_msgSend__reloadFromKeychainLocked(self, v10, v11, v12);
    objc_msgSend_keychainManager(MEMORY[0x1E0D36AA8], v10, v11, v12);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      _StringForIDSRegistrationServiceType(v52);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _StringForIDSAccountType(a4);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v59 = v16;
      if (v7)
        v19 = CFSTR("YES");
      v60 = 2112;
      v61 = v17;
      v62 = 2112;
      v63 = v19;
      v64 = 2112;
      v65 = v50;
      _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_INFO, "Looking up registration with service type: %@  account type: %@  temporary: %@  value: %@", buf, 0x2Au);

    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = self->_registrationData;
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v53, v21, v57, 16);
    if (v22)
    {
      v25 = v22;
      v49 = self;
      if (v7)
        v26 = 2;
      else
        v26 = 0;
      v27 = *(_QWORD *)v54;
      if (a4)
        v28 = 1;
      else
        v28 = v26;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v54 != v27)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend_objectForKey_(v30, v23, (uint64_t)CFSTR("type"), v24, v49);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend_intValue(v31, v32, v33, v34);

          objc_msgSend_objectForKey_(v30, v36, (uint64_t)CFSTR("service"), v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSRegistrationServiceTypeForString(v38);
          v39 = (id)objc_claimAutoreleasedReturnValue();

          if (v35 == (_DWORD)v28
            && (v39 == v52 || objc_msgSend_isEqualToString_(v39, v40, (uint64_t)v52, v41)))
          {
            objc_msgSend_objectForKey_(v30, v40, (uint64_t)off_1E3C1F9E8[v28], v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isEqualToString_(v42, v43, (uint64_t)v50, v44))
            {
              v14 = v30;

              goto LABEL_30;
            }

          }
        }
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v53, v24, v57, 16);
        if (v25)
          continue;
        break;
      }
      v14 = 0;
LABEL_30:
      self = v49;
    }
    else
    {
      v14 = 0;
    }

    pthread_mutex_unlock(&stru_1EE409720);
    objc_msgSend__setPurgeTimer(self, v45, v46, v47);
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_purgeEnqueueBlock, 0);
  objc_storeStrong(&self->_purgeCancelBlock, 0);
  objc_storeStrong((id *)&self->_purgeTimer, 0);
  objc_storeStrong((id *)&self->_registrationData, 0);
}

@end
