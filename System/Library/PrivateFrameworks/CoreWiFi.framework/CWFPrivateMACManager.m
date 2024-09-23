@implementation CWFPrivateMACManager

- (CWFPrivateMACManager)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("-[CWFPrivateMACManager init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CWFPrivateMACManager)initWithInterfaceName:(id)a3 hardwareMACAddress:(id)a4
{
  id v7;
  id v8;
  CWFPrivateMACManager *v9;
  CWFPrivateMACManager *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *targetQueue;
  NSMutableDictionary *v14;
  NSMutableDictionary *privateMACAddressCache;
  NSMutableArray *v16;
  NSMutableArray *privateMACAddressCacheIDList;
  NSMutableDictionary *v18;
  NSMutableDictionary *userJoinFailureTimestampMap;
  NSMutableDictionary *v20;
  NSMutableDictionary *userJoinFailureCountMap;
  NSMutableDictionary *v22;
  NSMutableDictionary *tempUserSettingMap;
  NSMutableDictionary *v24;
  NSMutableDictionary *networkIDCache;
  NSMutableArray *v26;
  NSMutableArray *networkIDCacheIDList;
  uint64_t v28;
  NSData *deviceKey;
  uint64_t v30;
  NSData *rotationKey;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *rotationKeyUpdatedAt;
  objc_super v39;

  v7 = a3;
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CWFPrivateMACManager;
  v9 = -[CWFPrivateMACManager init](&v39, sel_init);
  v10 = v9;
  if (!v7)
    goto LABEL_16;
  if (!v9)
  {
    rotationKeyUpdatedAt = 0;
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v9->_interfaceName, a3);
  if (!v8)
    goto LABEL_16;
  objc_storeStrong((id *)&v10->_hardwareMACAddress, a4);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("com.apple.corewifi.private-mac.target", v11);
  targetQueue = v10->_targetQueue;
  v10->_targetQueue = (OS_dispatch_queue *)v12;

  if (!v10->_targetQueue)
    goto LABEL_16;
  v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  privateMACAddressCache = v10->_privateMACAddressCache;
  v10->_privateMACAddressCache = v14;

  if (!v10->_privateMACAddressCache)
    goto LABEL_16;
  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  privateMACAddressCacheIDList = v10->_privateMACAddressCacheIDList;
  v10->_privateMACAddressCacheIDList = v16;

  if (!v10->_privateMACAddressCacheIDList)
    goto LABEL_16;
  v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  userJoinFailureTimestampMap = v10->_userJoinFailureTimestampMap;
  v10->_userJoinFailureTimestampMap = v18;

  if (!v10->_userJoinFailureTimestampMap)
    goto LABEL_16;
  v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  userJoinFailureCountMap = v10->_userJoinFailureCountMap;
  v10->_userJoinFailureCountMap = v20;

  if (!v10->_userJoinFailureCountMap)
    goto LABEL_16;
  v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  tempUserSettingMap = v10->_tempUserSettingMap;
  v10->_tempUserSettingMap = v22;

  if (!v10->_tempUserSettingMap)
    goto LABEL_16;
  v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  networkIDCache = v10->_networkIDCache;
  v10->_networkIDCache = v24;

  if (!v10->_networkIDCache)
    goto LABEL_16;
  v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  networkIDCacheIDList = v10->_networkIDCacheIDList;
  v10->_networkIDCacheIDList = v26;

  if (v10->_networkIDCacheIDList)
  {
    v10->_rotationInterval = 86400;
    if (os_variant_has_internal_content())
      _os_feature_enabled_impl();
    sub_1B06434D8(0x100uLL);
    v28 = objc_claimAutoreleasedReturnValue();
    deviceKey = v10->_deviceKey;
    v10->_deviceKey = (NSData *)v28;

    sub_1B06434D8(0x100uLL);
    v30 = objc_claimAutoreleasedReturnValue();
    rotationKey = v10->_rotationKey;
    v10->_rotationKey = (NSData *)v30;

    objc_msgSend_date(MEMORY[0x1E0C99D68], v32, v33, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    rotationKeyUpdatedAt = v10->_rotationKeyUpdatedAt;
    v10->_rotationKeyUpdatedAt = (NSDate *)v36;
  }
  else
  {
LABEL_16:
    rotationKeyUpdatedAt = v10;
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend_setUpdatedDeviceKeyHandler_(self, a2, 0, v2, v3);
  objc_msgSend_setUpdatedRotationKeyHandler_(self, v5, 0, v6, v7);
  objc_msgSend_setUpdatedSystemSettingHandler_(self, v8, 0, v9, v10);
  MEMORY[0x1E0DE7D20](self, sel_setUpdatedPrivateMACAddressHandler_, 0, v11, v12);
}

- (NSData)rotationKey
{
  CWFPrivateMACManager *v2;
  NSData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_rotationKey;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRotationKey:(id)a3
{
  NSData *v5;
  CWFPrivateMACManager *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSData *rotationKey;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t rotationInterval;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  _QWORD block[5];
  int v39;
  void *v40;
  __int16 v41;
  unint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = (NSData *)a3;
  v6 = self;
  objc_sync_enter(v6);
  rotationKey = v6->_rotationKey;
  if (rotationKey == v5 || v5 && rotationKey && (objc_msgSend_isEqual_(rotationKey, v7, (uint64_t)v5, v8, v9) & 1) != 0)
  {
    objc_sync_exit(v6);

  }
  else
  {
    objc_storeStrong((id *)&v6->_rotationKey, a3);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCache, v11, v12, v13, v14);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCacheIDList, v15, v16, v17, v18);
    objc_sync_exit(v6);

    CWFGetOSLog();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      CWFGetOSLog();
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      CWFHexadecimalStringFromData(v5, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_redactedForWiFi(v26, v27, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      rotationInterval = v6->_rotationInterval;
      v39 = 138543618;
      v40 = v31;
      v41 = 2048;
      v42 = rotationInterval;
      _os_log_send_and_compose_impl();

    }
    objc_msgSend_targetQueue(v6, v33, v34, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0650AC0;
    block[3] = &unk_1E6133138;
    block[4] = v6;
    dispatch_async(v37, block);

  }
}

- (NSDate)rotationKeyUpdatedAt
{
  CWFPrivateMACManager *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_rotationKeyUpdatedAt;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRotationKeyUpdatedAt:(id)a3
{
  NSDate *v5;
  CWFPrivateMACManager *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *rotationKeyUpdatedAt;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  unint64_t rotationInterval;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD block[5];
  int v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (NSDate *)a3;
  v6 = self;
  objc_sync_enter(v6);
  rotationKeyUpdatedAt = v6->_rotationKeyUpdatedAt;
  if (rotationKeyUpdatedAt == v5
    || v5 && rotationKeyUpdatedAt && (objc_msgSend_isEqual_(rotationKeyUpdatedAt, v7, (uint64_t)v5, v8, v9) & 1) != 0)
  {
    objc_sync_exit(v6);

  }
  else
  {
    objc_storeStrong((id *)&v6->_rotationKeyUpdatedAt, a3);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCache, v11, v12, v13, v14);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCacheIDList, v15, v16, v17, v18);
    objc_sync_exit(v6);

    CWFGetOSLog();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      CWFGetOSLog();
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      rotationInterval = v6->_rotationInterval;
      v29 = 134217984;
      v30 = rotationInterval;
      _os_log_send_and_compose_impl();
    }

    objc_msgSend_targetQueue(v6, v23, v24, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0650D64;
    block[3] = &unk_1E6133138;
    block[4] = v6;
    dispatch_async(v27, block);

  }
}

- (NSData)deviceKey
{
  CWFPrivateMACManager *v2;
  NSData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_deviceKey;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDeviceKey:(id)a3
{
  NSData *v5;
  CWFPrivateMACManager *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSData *deviceKey;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  _QWORD block[5];
  int v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (NSData *)a3;
  v6 = self;
  objc_sync_enter(v6);
  deviceKey = v6->_deviceKey;
  if (deviceKey == v5 || v5 && deviceKey && (objc_msgSend_isEqual_(deviceKey, v7, (uint64_t)v5, v8, v9) & 1) != 0)
  {
    objc_sync_exit(v6);

  }
  else
  {
    objc_storeStrong((id *)&v6->_deviceKey, a3);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCache, v11, v12, v13, v14);
    objc_msgSend_removeAllObjects(v6->_privateMACAddressCacheIDList, v15, v16, v17, v18);
    objc_sync_exit(v6);

    CWFGetOSLog();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      CWFGetOSLog();
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      CWFHexadecimalStringFromData(v5, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_redactedForWiFi(v26, v27, v28, v29, v30);
      v37 = 138543362;
      v38 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();

    }
    objc_msgSend_targetQueue(v6, v31, v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B0651030;
    block[3] = &unk_1E6133138;
    block[4] = v6;
    dispatch_async(v35, block);

  }
}

- (int64_t)systemSetting
{
  CWFPrivateMACManager *v2;
  int64_t systemSetting;

  v2 = self;
  objc_sync_enter(v2);
  systemSetting = v2->_systemSetting;
  objc_sync_exit(v2);

  return systemSetting;
}

- (void)setSystemSetting:(int64_t)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  CWFPrivateMACManager *obj;
  _QWORD block[5];
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  obj = self;
  objc_sync_enter(obj);
  if (obj->_systemSetting == a3)
  {
    objc_sync_exit(obj);

  }
  else
  {
    obj->_systemSetting = a3;
    objc_msgSend_removeAllObjects(obj->_privateMACAddressCache, v4, v5, v6, v7);
    objc_msgSend_removeAllObjects(obj->_privateMACAddressCacheIDList, v8, v9, v10, v11);
    objc_sync_exit(obj);

    CWFGetOSLog();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      CWFGetOSLog();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      sub_1B06435E8(a3);
      v22 = 138543362;
      v23 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();

    }
    objc_msgSend_targetQueue(obj, v15, v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B06512CC;
    block[3] = &unk_1E6133138;
    block[4] = obj;
    dispatch_async(v19, block);

  }
}

- (BOOL)__calloutToAllowRotation
{
  dispatch_block_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD v15[3];
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v3 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E61326C0);
  objc_msgSend_targetQueue(self, v4, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B0651470;
  v11[3] = &unk_1E6133318;
  v13 = &v17;
  v14 = v15;
  v11[4] = self;
  v12 = v3;
  v9 = v3;
  dispatch_async(v8, v11);

  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v8) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);
  return (char)v8;
}

- (id)privateMACAddressForNetworkProfile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CWFPrivateMACManager *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  unint64_t rotationInterval;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  double v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  double v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  double v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  NSObject *v130;
  void *v131;
  void *v132;
  CWFPrivateMACManager *v133;
  NSMutableDictionary *privateMACAddressCache;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  id v147;
  void *v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  double v154;
  double v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  double v165;
  double v166;
  void *v167;
  NSObject *v168;
  id v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  void *v175;
  void *v176;
  id v177;
  uint64_t v179;
  _QWORD block[5];
  id v181;
  id v182;
  int v183;
  const char *v184;
  __int16 v185;
  void *v186;
  __int16 v187;
  id v188;
  __int16 v189;
  void *v190;
  uint64_t v191;

  v191 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_identifier(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 22, 0);
    v179 = objc_claimAutoreleasedReturnValue();
LABEL_46:
    v131 = (void *)v179;
    v55 = 0;
    v50 = 0;
    goto LABEL_48;
  }
  if (objc_msgSend_privateMACAddressModeForNetworkProfile_(self, v10, (uint64_t)v4, v11, v12) == 1)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, *MEMORY[0x1E0CB2FE0], 45, 0);
    v179 = objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
  if (objc_msgSend___calloutToAllowRotation(self, v13, v14, v15, v16))
  {
    v21 = self;
    objc_sync_enter(v21);
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v22, v23, v24, v25);
    v27 = v26;
    rotationInterval = v21->_rotationInterval;
    objc_msgSend_timeIntervalSinceReferenceDate(v21->_rotationKeyUpdatedAt, v29, v30, v31, v32);
    if (ceil(v27 / (double)rotationInterval) != ceil(v33 / (double)v21->_rotationInterval))
    {
      sub_1B06434D8(0x100uLL);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRotationKey_(v21, v35, (uint64_t)v34, v36, v37);

      objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v38, v39, v40, v41, v27);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRotationKeyUpdatedAt_(v21, v43, (uint64_t)v42, v44, v45);

    }
    objc_sync_exit(v21);

  }
  objc_msgSend_deviceKey(self, v17, v18, v19, v20);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v50)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v46, *MEMORY[0x1E0CB2FE0], 6, 0);
    v179 = objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
  objc_msgSend_rotationKey(self, v46, v47, v48, v49);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    if (objc_msgSend_isPublicAirPlayNetwork(v4, v51, v52, v53, v54))
    {
      objc_msgSend_cachedPrivateMACAddress(v4, v56, v57, v58, v59);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v64)
        goto LABEL_23;
      objc_msgSend_lastJoinedAt(v4, v60, v61, v62, v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v65, v66, v67, v68, v69);
      v71 = v70;
      objc_msgSend_lastDisconnectTimestamp(v4, v72, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v76, v77, v78, v79, v80);
      v82 = v81;

      if (v71 <= v82)
      {
LABEL_23:
        sub_1B06434D8(0x100uLL);
        v120 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_hardwareMACAddress(self, v121, v122, v123, v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        _os_feature_enabled_impl();

        objc_msgSend_targetQueue(self, v126, v127, v128, v129);
        v130 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1B0651BE8;
        block[3] = &unk_1E6133340;
        block[4] = self;
        v181 = v4;
        v182 = 0;
        dispatch_async(v130, block);

        v131 = 0;
        v132 = 0;
        v55 = (void *)v120;
        goto LABEL_31;
      }
      goto LABEL_29;
    }
    if (os_variant_has_internal_content())
      _os_feature_enabled_impl();
    objc_msgSend_cachedPrivateMACAddress(v4, v87, v88, v89, v90);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94 && objc_msgSend_privateMACAddressModeForNetworkProfile_(self, v91, (uint64_t)v4, v92, v93) == 2)
    {
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v95, v96, v97, v98);
      v100 = v99;
      objc_msgSend_cachedPrivateMACAddressUpdatedAt(v4, v101, v102, v103, v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v105, v106, v107, v108, v109);
      if (v100 - v114 < 1209600.0)
      {

        goto LABEL_29;
      }
      objc_msgSend_lastJoinedAt(v4, v110, v111, v112, v113);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v149, v150, v151, v152, v153);
      v155 = v154;
      objc_msgSend_lastDisconnectTimestamp(v4, v156, v157, v158, v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v160, v161, v162, v163, v164);
      v166 = v165;

      if (v155 > v166)
        goto LABEL_29;
    }
    else
    {

    }
    objc_msgSend_cachedPrivateMACAddress(v4, v83, v84, v85, v86);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v118
      || (v119 = objc_msgSend_privateMACAddressModeForNetworkProfile_(self, v115, (uint64_t)v4, v116, v117),
          v118,
          v119 != 3))
    {
      v133 = self;
      objc_sync_enter(v133);
      privateMACAddressCache = v133->_privateMACAddressCache;
      objc_msgSend_identifier(v4, v135, v136, v137, v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(privateMACAddressCache, v140, (uint64_t)v139, v141, v142);
      v132 = (void *)objc_claimAutoreleasedReturnValue();

      if (v132)
      {
        v147 = v132;
      }
      else
      {
        objc_msgSend_hardwareMACAddress(v133, v143, v144, v145, v146);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        _os_feature_enabled_impl();

      }
      objc_sync_exit(v133);

      goto LABEL_30;
    }
LABEL_29:
    objc_msgSend_cachedPrivateMACAddress(v4, v83, v84, v85, v86);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
    v131 = 0;
    goto LABEL_31;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v51, *MEMORY[0x1E0CB2FE0], 6, 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
LABEL_48:
  v132 = 0;
LABEL_31:
  CWFGetOSLog();
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  if (v167)
  {
    CWFGetOSLog();
    v168 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v168 = MEMORY[0x1E0C81028];
    v169 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
  {
    if (v132)
      v174 = "Successfully created";
    else
      v174 = "FAILED to create";
    objc_msgSend_redactedForWiFi(v132, v170, v171, v172, v173);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = 136446978;
    v184 = v174;
    v185 = 2114;
    v186 = v175;
    v187 = 2114;
    v188 = v4;
    v189 = 2114;
    v190 = v131;
    _os_log_send_and_compose_impl();

  }
  if (v131)
    v176 = 0;
  else
    v176 = v132;
  v177 = v176;

  return v177;
}

- (id)__calloutToGetEffectiveHardwareMACAddress
{
  dispatch_block_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD v16[3];
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1B063EA50;
  v22 = sub_1B063E9F0;
  v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v3 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E6132060);
  objc_msgSend_targetQueue(self, v4, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1B0651DAC;
  v12[3] = &unk_1E6133318;
  v14 = &v18;
  v15 = v16;
  v12[4] = self;
  v13 = v3;
  v9 = v3;
  dispatch_async(v8, v12);

  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v19[5];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

- (int64_t)privateMACAddressModeForNetworkProfile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  objc_msgSend_identifier(v4, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v9 = objc_msgSend_privateMACAddressModeUserSetting(v4, v10, v11, v12, v13);
    if (!v9)
    {
      v9 = objc_msgSend_privateMACAddressModeConfigurationProfileSetting(v4, v14, v15, v16, v17);
      if (!v9)
      {
        v9 = objc_msgSend_systemSetting(self, v14, v15, v16, v17);
        if (!v9)
        {
          if ((objc_msgSend_privateMACAddressDisabledByEvaluation(v4, v14, v15, v16, v17) & 1) != 0)
          {
            v9 = 1;
          }
          else if ((objc_msgSend_isHotspot(v4, v14, v15, v16, v17) & 1) != 0
                 || (objc_msgSend_isPublicAirPlayNetwork(v4, v14, v15, v16, v17) & 1) != 0
                 || (objc_msgSend_isCarPlay(v4, v14, v15, v16, v17) & 1) != 0
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 10
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 17
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 15
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 14
                 || objc_msgSend_addReason(v4, v14, v15, v16, v17) == 18
                 || (objc_msgSend_isOpen(v4, v14, v15, v16, v17) & 1) != 0
                 || (objc_msgSend_isOWE(v4, v14, v15, v16, v17) & 1) != 0
                 || (objc_msgSend_isWEP(v4, v14, v15, v16, v17) & 1) != 0
                 || (objc_msgSend_isWAPI(v4, v14, v15, v16, v17) & 1) != 0
                 || objc_msgSend_isWPA(v4, v14, v15, v16, v17))
          {
            v9 = 2;
          }
          else
          {
            v9 = 3;
          }
        }
      }
    }
    objc_msgSend_addedAt(v4, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v22 = objc_msgSend_temporaryUserSettingForNetworkProfile_(self, v19, (uint64_t)v4, v20, v21);
      if (v22)
        v9 = v22;
    }
  }

  return v9;
}

- (void)submitPrivateMACStatsMetricWithEventType:(id)a3 networkProfile:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  id v67;
  id v68;
  void *v69;

  v6 = a3;
  v7 = a4;
  if (!objc_opt_class())
    goto LABEL_40;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)v6, (uint64_t)CFSTR("privateMacEvent"), v14);
  v18 = objc_msgSend_privateMACAddressModeForNetworkProfile_(self, v15, (uint64_t)v7, v16, v17);
  objc_msgSend_privateMACAddressForNetworkProfile_(self, v19, (uint64_t)v7, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hardwareMACAddress(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___calloutToGetEffectiveHardwareMACAddress(self, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v32;
  switch(v18)
  {
    case 3:
      if (v32 == v22 || v32 && v22 && objc_msgSend_isEqual_(v32, v33, (uint64_t)v22, v35, v36))
      {
        objc_msgSend_setObject_forKeyedSubscript_(v12, v33, (uint64_t)CFSTR("Static"), (uint64_t)CFSTR("privateMacType"), v36);
        break;
      }
      goto LABEL_20;
    case 2:
      if (v32 == v22 || v32 && v22 && objc_msgSend_isEqual_(v32, v33, (uint64_t)v22, v35, v36))
      {
        objc_msgSend_setObject_forKeyedSubscript_(v12, v33, (uint64_t)CFSTR("Rotating"), (uint64_t)CFSTR("privateMacType"), v36);
        break;
      }
      goto LABEL_20;
    case 1:
      if (v32 == v27 || v32 && v27 && objc_msgSend_isEqual_(v32, v33, (uint64_t)v27, v35, v36))
      {
        objc_msgSend_setObject_forKeyedSubscript_(v12, v33, (uint64_t)CFSTR("Physical"), (uint64_t)CFSTR("privateMacType"), v36);
        break;
      }
LABEL_20:
      objc_msgSend_setObject_forKeyedSubscript_(v12, v33, (uint64_t)CFSTR("Configured"), (uint64_t)CFSTR("privateMacType"), v36);
      break;
  }
  v38 = objc_msgSend_privateMACAddressModeUserSetting(v7, v33, v34, v35, v36);
  v41 = MEMORY[0x1E0C9AAB0];
  v42 = MEMORY[0x1E0C9AAA0];
  if (v38)
    objc_msgSend_setObject_forKeyedSubscript_(v12, v39, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("privateMacToggled"), v40);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v12, v39, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("privateMacToggled"), v40);
  if (objc_msgSend_privateMACAddressModeConfigurationProfileSetting(v7, v43, v44, v45, v46) == 1)
    objc_msgSend_setObject_forKeyedSubscript_(v12, v47, v41, (uint64_t)CFSTR("privateMacDisabledByProfile"), v48);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v12, v47, v42, (uint64_t)CFSTR("privateMacDisabledByProfile"), v48);
  if (objc_msgSend_privateMACAddressEnabledForEvaluation(v7, v49, v50, v51, v52))
    objc_msgSend_setObject_forKeyedSubscript_(v12, v53, v41, (uint64_t)CFSTR("privateMacClassification"), v54);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v12, v53, v42, (uint64_t)CFSTR("privateMacClassification"), v54);
  if (objc_msgSend_networkOfInterestHomeState(v7, v55, v56, v57, v58))
  {
    if (objc_msgSend_networkOfInterestHomeState(v7, v59, v60, v61, v62) == 1)
      objc_msgSend_setObject_forKeyedSubscript_(v12, v63, v41, (uint64_t)CFSTR("privateMacNetworkTypeIsHome"), v64);
    else
      objc_msgSend_setObject_forKeyedSubscript_(v12, v63, v42, (uint64_t)CFSTR("privateMacNetworkTypeIsHome"), v64);
  }
  CWFGetOSLog();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    CWFGetOSLog();
    v66 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = MEMORY[0x1E0C81028];
    v67 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    _os_log_send_and_compose_impl();

  v69 = v12;
  v68 = v12;
  AnalyticsSendEventLazy();

LABEL_40:
}

- (void)setUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CWFPrivateMACManager *v12;
  NSMutableDictionary *userJoinFailureTimestampMap;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSMutableDictionary *userJoinFailureCountMap;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  NSMutableDictionary *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  NSMutableDictionary *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  double v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  NSMutableDictionary *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  NSObject *v100;
  id v101;
  void *v102;

  v4 = a3;
  v6 = a4;
  objc_msgSend_identifier(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_13;
  v12 = self;
  objc_sync_enter(v12);
  userJoinFailureTimestampMap = v12->_userJoinFailureTimestampMap;
  objc_msgSend_identifier(v6, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(userJoinFailureTimestampMap, v19, (uint64_t)v18, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  userJoinFailureCountMap = v12->_userJoinFailureCountMap;
  objc_msgSend_identifier(v6, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(userJoinFailureCountMap, v29, (uint64_t)v28, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_unsignedIntegerValue(v32, v33, v34, v35, v36);

  objc_msgSend_date(MEMORY[0x1E0C99D68], v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v42;
  if (v4)
  {
    _os_feature_enabled_impl();
    v48 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend_setHour_(v48, v49, 5, v50, v51);
    objc_msgSend_setMinute_(v48, v52, 0, v53, v54);
    objc_msgSend_setSecond_(v48, v55, 0, v56, v57);
    objc_msgSend_currentCalendar(MEMORY[0x1E0C99D48], v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_nextDateAfterDate_matchingComponents_options_(v62, v63, (uint64_t)v47, (uint64_t)v48, 1024);
    v64 = objc_claimAutoreleasedReturnValue();

    v65 = v12->_userJoinFailureCountMap;
    objc_msgSend_identifier(v6, v66, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v65, v71, 0, (uint64_t)v70, v72);

    v73 = v12->_userJoinFailureTimestampMap;
    objc_msgSend_identifier(v6, v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v73, v79, v64, (uint64_t)v78, v80);
    v22 = (void *)v64;
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend_timeIntervalSinceReferenceDate(v42, v43, v44, v45, v46);
  v82 = v81;
  objc_msgSend_timeIntervalSinceReferenceDate(v22, v83, v84, v85, v86);
  if (v82 >= v90)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v87, v37 + 1, v88, v89);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v12->_userJoinFailureCountMap;
    objc_msgSend_identifier(v6, v92, v93, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v91, v97, (uint64_t)v78, (uint64_t)v96, v98);

    goto LABEL_6;
  }
LABEL_7:
  CWFGetOSLog();
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    CWFGetOSLog();
    v100 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v100 = MEMORY[0x1E0C81028];
    v101 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
    sub_1B0630E50(v22);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();

  }
  objc_sync_exit(v12);

LABEL_13:
}

- (BOOL)allowUserJoinFailureUIForNetworkProfile:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CWFPrivateMACManager *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  NSMutableDictionary *userJoinFailureTimestampMap;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  BOOL v36;
  NSMutableDictionary *userJoinFailureCountMap;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v4 = a3;
  objc_msgSend_identifier(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = self;
    objc_sync_enter(v10);
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v11, v12, v13, v14);
    v16 = v15;
    userJoinFailureTimestampMap = v10->_userJoinFailureTimestampMap;
    objc_msgSend_identifier(v4, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(userJoinFailureTimestampMap, v23, (uint64_t)v22, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v26, v27, v28, v29, v30);
    if (v16 >= v35)
    {
      userJoinFailureCountMap = v10->_userJoinFailureCountMap;
      objc_msgSend_identifier(v4, v31, v32, v33, v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(userJoinFailureCountMap, v39, (uint64_t)v38, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (unint64_t)objc_msgSend_unsignedIntegerValue(v42, v43, v44, v45, v46) > 1;

    }
    else
    {
      v36 = 0;
    }

    objc_sync_exit(v10);
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (int64_t)temporaryUserSettingForNetworkProfile:(id)a3
{
  id v4;
  CWFPrivateMACManager *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *tempUserSettingMap;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_identifier(v4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    tempUserSettingMap = v5->_tempUserSettingMap;
    objc_msgSend_identifier(v4, v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(tempUserSettingMap, v17, (uint64_t)v16, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_integerValue(v20, v21, v22, v23, v24);

  }
  else
  {
    v25 = 0;
  }
  objc_sync_exit(v5);

  return v25;
}

- (void)setTemporaryUserSetting:(int64_t)a3 networkProfile:(id)a4
{
  id v6;
  CWFPrivateMACManager *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableDictionary *tempUserSettingMap;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSMutableDictionary *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  void *v35;

  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend_identifier(v6, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (a3)
    {
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v13, a3, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      tempUserSettingMap = v7->_tempUserSettingMap;
      objc_msgSend_identifier(v6, v19, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(tempUserSettingMap, v24, (uint64_t)v17, (uint64_t)v23, v25);

      CWFGetOSLog();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        CWFGetOSLog();
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = MEMORY[0x1E0C81028];
        v33 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        sub_1B06435E8(a3);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();

      }
    }
    else
    {
      v28 = v7->_tempUserSettingMap;
      objc_msgSend_identifier(v6, v13, v14, v15, v16);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v28, v30, 0, (uint64_t)v29, v31);

      CWFGetOSLog();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        CWFGetOSLog();
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = MEMORY[0x1E0C81028];
        v34 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        _os_log_send_and_compose_impl();
    }

  }
  objc_sync_exit(v7);

}

- (void)clearTemporaryUserSettings
{
  CWFPrivateMACManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_removeAllObjects(v2->_tempUserSettingMap, v3, v4, v5, v6);
  CWFGetOSLog();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CWFGetOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();

  objc_sync_exit(v2);
}

- (void)setNetworkIDForAssociationWithMACAddress:(id)a3 networkProfile:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  CWFPrivateMACManager *v15;
  NSMutableDictionary *networkIDCache;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSMutableDictionary *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSMutableDictionary *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  char isEqual;
  NSMutableDictionary *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSMutableDictionary *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSMutableArray *networkIDCacheIDList;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  NSObject *v84;
  id v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  void *v101;
  NSObject *v102;
  id v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  id v119;
  int *v120;
  int v121;
  void *v122;
  id v123;
  id v124;
  int v125;
  const char *v126;
  __int16 v127;
  id v128;
  __int16 v129;
  id v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = a4;
  v12 = v6;
  if (!v6)
  {
    objc_msgSend_hardwareMACAddress(self, v7, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v122 = v6;
  v13 = v6 == 0;
  v124 = 0;
  sub_1B0643684(v11, v12, &v124);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v124;
  if (v13)

  if (v14)
  {
    v15 = self;
    objc_sync_enter(v15);
    networkIDCache = v15->_networkIDCache;
    objc_msgSend_identifier(v11, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(networkIDCache, v22, (uint64_t)v21, v23, v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == v29)
    {
      isEqual = 1;
    }
    else
    {
      v30 = v15->_networkIDCache;
      objc_msgSend_identifier(v11, v25, v26, v27, v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v30, v32, (uint64_t)v31, v33, v34);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v40 = v15->_networkIDCache;
        objc_msgSend_identifier(v11, v35, v36, v37, v38);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v40, v42, (uint64_t)v41, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v14, v46, (uint64_t)v45, v47, v48);

      }
      else
      {
        isEqual = 0;
      }

    }
    v50 = v15->_networkIDCache;
    objc_msgSend_identifier(v11, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v50, v56, (uint64_t)v14, (uint64_t)v55, v57);

    if (objc_msgSend_count(v15->_networkIDCacheIDList, v58, v59, v60, v61) == 10)
    {
      v66 = v15->_networkIDCache;
      objc_msgSend_lastObject(v15->_networkIDCacheIDList, v62, v63, v64, v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v66, v68, 0, (uint64_t)v67, v69);

      objc_msgSend_removeLastObject(v15->_networkIDCacheIDList, v70, v71, v72, v73);
    }
    networkIDCacheIDList = v15->_networkIDCacheIDList;
    objc_msgSend_identifier(v11, v62, v63, v64, v65);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_insertObject_atIndex_(networkIDCacheIDList, v76, (uint64_t)v75, 0, v77);

    objc_sync_exit(v15);
    if ((isEqual & 1) == 0)
    {
      objc_msgSend_networkName(v11, v78, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (v82)
      {
        CWFGetOSLog();
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        if (v83)
        {
          CWFGetOSLog();
          v84 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v84 = MEMORY[0x1E0C81028];
          v85 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          v125 = 138543362;
          v126 = (const char *)v11;
          v121 = 12;
          v120 = &v125;
          _os_log_send_and_compose_impl();
        }

        objc_msgSend_interfaceName(v15, v86, v87, v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_networkName(v11, v91, v92, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        IPConfigurationForgetNetwork();

      }
    }

    objc_msgSend_interfaceName(v15, v96, v97, v98, v99);
    v100 = objc_claimAutoreleasedReturnValue();
    sub_1B06438A0(v14, v100);
    v123 = 0;
  }
  else
  {
    CWFGetOSLog();
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (v118)
    {
      CWFGetOSLog();
      v100 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v100 = MEMORY[0x1E0C81028];
      v119 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
    {
      v125 = 138412546;
      v126 = (const char *)v123;
      v127 = 2114;
      v128 = v11;
      v121 = 22;
      v120 = &v125;
      _os_log_send_and_compose_impl();
    }
  }

  CWFGetOSLog();
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v101)
  {
    CWFGetOSLog();
    v102 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v102 = MEMORY[0x1E0C81028];
    v103 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v102, (os_log_type_t)(16 * (v123 != 0))))
  {
    if (v123)
      v106 = "FAILED to";
    else
      v106 = "Successfully";
    objc_msgSend_subdataWithRange_(v14, v104, 0, 32, v105, v120, v121, v122);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    CWFHexadecimalStringFromData(v107, v108, v109, v110, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_redactedForWiFi(v112, v113, v114, v115, v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = 136446722;
    v126 = v106;
    v127 = 2114;
    v128 = v117;
    v129 = 2114;
    v130 = v11;
    _os_log_send_and_compose_impl();

  }
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)hardwareMACAddress
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (id)updatedSystemSettingHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setUpdatedSystemSettingHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (id)updatedDeviceKeyHandler
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setUpdatedDeviceKeyHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (id)updatedPrivateMACAddressHandler
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setUpdatedPrivateMACAddressHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (id)updatedRotationKeyHandler
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setUpdatedRotationKeyHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (id)effectiveHardwareMACAddress
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setEffectiveHardwareMACAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (id)allowRotationHandler
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setAllowRotationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (OS_dispatch_queue)targetQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTargetQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong(&self->_allowRotationHandler, 0);
  objc_storeStrong(&self->_effectiveHardwareMACAddress, 0);
  objc_storeStrong(&self->_updatedRotationKeyHandler, 0);
  objc_storeStrong(&self->_updatedPrivateMACAddressHandler, 0);
  objc_storeStrong(&self->_updatedDeviceKeyHandler, 0);
  objc_storeStrong(&self->_updatedSystemSettingHandler, 0);
  objc_storeStrong((id *)&self->_hardwareMACAddress, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_networkIDCacheIDList, 0);
  objc_storeStrong((id *)&self->_networkIDCache, 0);
  objc_storeStrong((id *)&self->_tempUserSettingMap, 0);
  objc_storeStrong((id *)&self->_userJoinFailureCountMap, 0);
  objc_storeStrong((id *)&self->_userJoinFailureTimestampMap, 0);
  objc_storeStrong((id *)&self->_privateMACAddressCacheIDList, 0);
  objc_storeStrong((id *)&self->_privateMACAddressCache, 0);
  objc_storeStrong((id *)&self->_rotationKeyUpdatedAt, 0);
  objc_storeStrong((id *)&self->_rotationKey, 0);
  objc_storeStrong((id *)&self->_deviceKey, 0);
}

@end
