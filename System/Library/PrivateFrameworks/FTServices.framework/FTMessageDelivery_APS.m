@implementation FTMessageDelivery_APS

- (int64_t)maxMessageSize
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  int64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend_connection(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_messageSize(v4, v5, v6);

  if (v7 <= 5119)
  {
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_connection(self, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v11;
      v24 = 1024;
      v25 = v7;
      v26 = 2048;
      v27 = 5120;
      _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_ERROR, "APSConnection %@  gave me a connection size of: %d  which doesn't pass our sanity size of: %ld   ignoring", buf, 0x1Cu);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      objc_msgSend_connection(self, v12, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSWarnV();

      objc_msgSend_connection(self, v14, v15, v19, v7, 5120);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

      objc_msgSend_connection(self, v16, v17, v20, v7, 5120);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogTransport();

    }
  }
  if (v7 <= 5120)
    return 5120;
  else
    return v7;
}

- (int64_t)maxLargeMessageSize
{
  uint64_t v2;
  void *v4;
  char v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  int64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend_connection(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return MEMORY[0x1E0DE7D20](self, sel_maxMessageSize, v7);
  objc_msgSend_connection(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_largeMessageSize(v8, v9, v10);

  if (v11 <= 5119)
  {
    OSLogHandleForIDSCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_connection(self, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v15;
      v28 = 1024;
      v29 = v11;
      v30 = 2048;
      v31 = 5120;
      _os_log_impl(&dword_1A4C7F000, v12, OS_LOG_TYPE_ERROR, "APSConnection %@  gave me a connection large size of: %d  which doesn't pass our sanity size of: %ld   ignoring", buf, 0x1Cu);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      objc_msgSend_connection(self, v16, v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSWarnV();

      objc_msgSend_connection(self, v18, v19, v23, v11, 5120);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

      objc_msgSend_connection(self, v20, v21, v24, v11, 5120);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogTransport();

    }
  }
  if (v11 <= 5120)
    return 5120;
  else
    return v11;
}

+ (id)sharedInstance
{
  if (qword_1ECF9D838 != -1)
    dispatch_once(&qword_1ECF9D838, &unk_1E4DD9470);
  return (id)qword_1ECF9D880;
}

- (FTMessageDelivery_APS)initWithAPSConnection:(id)a3 mobileNetworkManager:(id)a4
{
  id v7;
  FTMessageDelivery_APS *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  IDSOffGridConnectionMonitor *v21;
  IDSOffGridConnectionMonitor *offGridConnectionMonitor;
  void *v23;
  const char *v24;
  objc_super v26;

  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)FTMessageDelivery_APS;
  v8 = -[FTMessageDelivery initWithAPSConnection:](&v26, sel_initWithAPSConnection_, a3);
  if (v8)
  {
    v8->_APSOutgoingMessageClass = (Class)MEMORY[0x1A85A5DE0](CFSTR("APSOutgoingMessage"), CFSTR("ApplePushService"));
    objc_msgSend_connection(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDelegate_(v11, v12, (uint64_t)v8);

    objc_storeStrong((id *)&v8->_mobileNetworkManager, a4);
    objc_msgSend_array(MEMORY[0x1E0C99D20], v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setEnabledTopics_(v8, v16, (uint64_t)v15);

    objc_msgSend__updateTopics(v8, v17, v18);
    if (_os_feature_enabled_impl()
      && (objc_msgSend_shouldDisableFailFastWhenSatelliteIsAvailable(MEMORY[0x1E0D36AF8], v19, v20) & 1) == 0)
    {
      v21 = (IDSOffGridConnectionMonitor *)objc_alloc_init((Class)MEMORY[0x1A85A5DE0](CFSTR("IDSOffGridConnectionMonitor"), CFSTR("IDS")));
      offGridConnectionMonitor = v8->_offGridConnectionMonitor;
      v8->_offGridConnectionMonitor = v21;

    }
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v23, v24, (uint64_t)v8, sel__serverBagLoaded_, *MEMORY[0x1E0D34B98], 0);

  }
  return v8;
}

- (FTMessageDelivery_APS)initWithAPSConnection:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  FTMessageDelivery_APS *v10;

  v4 = (void *)MEMORY[0x1E0D36A68];
  v5 = a3;
  objc_msgSend_sharedInstance(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (FTMessageDelivery_APS *)objc_msgSend_initWithAPSConnection_mobileNetworkManager_(self, v9, (uint64_t)v5, v8);

  return v10;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  NSMutableDictionary *apsMessageMap;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  objc_super v18;
  _QWORD v19[5];

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, 0, 0);

  apsMessageMap = self->_apsMessageMap;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1A4C9E8D0;
  v19[3] = &unk_1E4DD9698;
  v19[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(apsMessageMap, v7, (uint64_t)v19);
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(self->_timerMap, v8, (uint64_t)&unk_1E4DD9D90);
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(self->_deathTimerMap, v9, (uint64_t)&unk_1E4DD9DB0);
  objc_msgSend_array(MEMORY[0x1E0C99D20], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setEnabledTopics_(self, v13, (uint64_t)v12);

  objc_msgSend_connection(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelegate_(v16, v17, 0);

  v18.receiver = self;
  v18.super_class = (Class)FTMessageDelivery_APS;
  -[FTMessageDelivery dealloc](&v18, sel_dealloc);
}

- (void)_setEnabledTopics:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  v4 = a3;
  objc_msgSend_connection(self, v5, v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99D20], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99D20], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnabledTopics_ignoredTopics_opportunisticTopics_(v14, v13, (uint64_t)v9, v12, v4);

}

- (void)_invalidateTimerForMessageID:(id)a3
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_objectForKey_(self->_timerMap, a2, (uint64_t)a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v5, v3, v4);

}

- (void)_invalidateDeathTimerForMessageID:(id)a3
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_objectForKey_(self->_deathTimerMap, a2, (uint64_t)a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v5, v3, v4);

}

- (void)_setMapForMessage:(id)a3 apsMessage:(id)a4 messageBody:(id)a5 timeoutTime:(double)a6 timeoutSelector:(SEL)a7 handlerBlock:(id)a8 retries:(id)a9
{
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *ftMessageMap;
  NSMutableDictionary *v27;
  NSMutableDictionary *apsMessageMap;
  NSMutableDictionary *v29;
  NSMutableDictionary *timerMap;
  NSMutableDictionary *v31;
  NSMutableDictionary *retriesMap;
  NSMutableDictionary *v33;
  NSMutableDictionary *bodyMap;
  NSMutableDictionary *v35;
  NSMutableDictionary *startDateMap;
  NSMutableDictionary *v37;
  NSMutableDictionary *deathTimerMap;
  id v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  NSObject *v44;
  void *v45;
  _BOOL4 v46;
  const char *v47;
  NSObject *v48;
  void *v49;
  _BOOL4 v50;
  const char *v51;
  NSObject *v52;
  void *v53;
  _BOOL4 v54;
  const char *v55;
  NSObject *v56;
  void *v57;
  _BOOL4 v58;
  const char *v59;
  void *v60;
  _BOOL4 v61;
  id v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  double v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  double v81;
  __CFString *v82;
  id v83;
  id value;
  id v85;
  id v86;
  _QWORD v87[5];
  uint8_t buf[4];
  id v89;
  __int16 v90;
  id v91;
  __int16 v92;
  id v93;
  __int16 v94;
  double v95;
  __int16 v96;
  __CFString *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v86 = a4;
  value = a5;
  v83 = a8;
  v85 = a9;
  objc_msgSend_uniqueIDString(v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    OSLogHandleForIDSCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (a7)
      {
        NSStringFromSelector(a7);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = CFSTR("none");
      }
      *(_DWORD *)buf = 138413314;
      v89 = v19;
      v90 = 2112;
      v91 = v16;
      v92 = 2112;
      v93 = v86;
      v94 = 2048;
      v95 = a6;
      v96 = 2112;
      v97 = v21;
      _os_log_impl(&dword_1A4C7F000, v20, OS_LOG_TYPE_DEFAULT, "Mapping messageID: %@  message: %@   APSMessage: %@   timeout: %f  timeoutSelector: %@", buf, 0x34u);
      if (a7)

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      if (a7)
      {
        NSStringFromSelector(a7);
        v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v81 = a6;
        v79 = v16;
        v80 = v86;
        v74 = v19;
        _IDSLogV();

      }
      else
      {
        v82 = CFSTR("none");
        v81 = a6;
        v79 = v16;
        v80 = v86;
        v74 = v19;
        _IDSLogV();
      }
    }
    objc_msgSend__invalidateTimerForMessageID_(self, v23, (uint64_t)v19, v74, v79, v80, *(_QWORD *)&v81, v82);
    if (!self->_ftMessageMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      ftMessageMap = self->_ftMessageMap;
      self->_ftMessageMap = Mutable;

    }
    if (!self->_apsMessageMap)
    {
      v27 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      apsMessageMap = self->_apsMessageMap;
      self->_apsMessageMap = v27;

    }
    if (!self->_timerMap)
    {
      v29 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      timerMap = self->_timerMap;
      self->_timerMap = v29;

    }
    if (!self->_retriesMap)
    {
      v31 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      retriesMap = self->_retriesMap;
      self->_retriesMap = v31;

    }
    if (!self->_bodyMap)
    {
      v33 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      bodyMap = self->_bodyMap;
      self->_bodyMap = v33;

    }
    if (!self->_startDateMap)
    {
      v35 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      startDateMap = self->_startDateMap;
      self->_startDateMap = v35;

    }
    if (!self->_deathTimerMap)
    {
      v37 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      deathTimerMap = self->_deathTimerMap;
      self->_deathTimerMap = v37;

    }
    if (a6 > 0.0)
    {
      v39 = objc_alloc(MEMORY[0x1E0D36A18]);
      im_primary_queue();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend_initWithQueue_interval_repeats_userInfo_handlerBlock_(v39, v41, (uint64_t)v40, (unint64_t)a6, 0, v19, v83);

      if (v42)
      {
        objc_msgSend_setObject_forKey_(self->_timerMap, v43, (uint64_t)v42, v19);
      }
      else
      {
        OSLogHandleForIDSCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v89 = v19;
          _os_log_impl(&dword_1A4C7F000, v44, OS_LOG_TYPE_ERROR, "No timer specified for message ID: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          v75 = v19;
          _IDSLogTransport();
        }
      }

    }
    if (v16)
      CFDictionarySetValue((CFMutableDictionaryRef)self->_ftMessageMap, v19, v16);
    if (value)
      CFDictionarySetValue((CFMutableDictionaryRef)self->_bodyMap, v19, value);
    if (v85)
      CFDictionarySetValue((CFMutableDictionaryRef)self->_retriesMap, v19, v85);
    if (v86)
      CFDictionarySetValue((CFMutableDictionaryRef)self->_apsMessageMap, v19, v86);
    objc_msgSend_objectForKey_(self->_apsMessageMap, v24, (uint64_t)v19, v75);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45 == 0;

    if (v46)
    {
      OSLogHandleForIDSCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v19;
        _os_log_impl(&dword_1A4C7F000, v48, OS_LOG_TYPE_ERROR, "Missing APS Message for message ID: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        v76 = v19;
        _IDSLogTransport();
      }
    }
    objc_msgSend_objectForKey_(self->_ftMessageMap, v47, (uint64_t)v19, v76);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49 == 0;

    if (v50)
    {
      OSLogHandleForIDSCategory();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v19;
        _os_log_impl(&dword_1A4C7F000, v52, OS_LOG_TYPE_ERROR, "Missing FTMessage for message ID: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        v77 = v19;
        _IDSLogTransport();
      }
    }
    objc_msgSend_objectForKey_(self->_bodyMap, v51, (uint64_t)v19, v77);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53 == 0;

    if (v54)
    {
      OSLogHandleForIDSCategory();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v19;
        _os_log_impl(&dword_1A4C7F000, v56, OS_LOG_TYPE_ERROR, "Missing body for message ID: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        v78 = v19;
        _IDSLogTransport();
      }
    }
    objc_msgSend_objectForKey_(self->_retriesMap, v55, (uint64_t)v19, v78);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57 == 0;

    if (v58)
      CFDictionarySetValue((CFMutableDictionaryRef)self->_retriesMap, v19, &unk_1E4DE6580);
    objc_msgSend_objectForKey_(self->_deathTimerMap, v59, (uint64_t)v19);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v60 == 0;

    if (v61)
    {
      v62 = objc_alloc(MEMORY[0x1E0D36A18]);
      im_primary_queue();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeout(v16, v64, v65);
      v67 = v66;
      objc_msgSend_uniqueIDString(v16, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = sub_1A4C9F464;
      v87[3] = &unk_1E4DD9A50;
      v87[4] = self;
      v72 = (void *)objc_msgSend_initWithQueue_interval_repeats_userInfo_handlerBlock_(v62, v71, (uint64_t)v63, (unint64_t)fmax(v67, 20.0), 0, v70, v87);

      objc_msgSend_setObject_forKey_(self->_deathTimerMap, v73, (uint64_t)v72, v19);
    }
  }
  else
  {
    OSLogHandleForIDSCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v89 = v16;
      _os_log_impl(&dword_1A4C7F000, v22, OS_LOG_TYPE_ERROR, "Cannot map Message: %@   no ID!", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }

}

- (void)_clearMapForMessageID:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSMutableDictionary *deathTimerMap;
  const char *v19;
  uint64_t v20;
  NSMutableDictionary *ftMessageMap;
  const char *v22;
  uint64_t v23;
  NSMutableDictionary *apsMessageMap;
  const char *v25;
  uint64_t v26;
  NSMutableDictionary *bodyMap;
  const char *v28;
  uint64_t v29;
  NSMutableDictionary *timerMap;
  NSMutableDictionary *retriesMap;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v4;
    _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "_clearMapForMessageID: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v32 = v4;
    _IDSLogV();
  }
  objc_msgSend__invalidateTimerForMessageID_(self, v6, (uint64_t)v4, v32);
  objc_msgSend__invalidateDeathTimerForMessageID_(self, v7, (uint64_t)v4);
  objc_msgSend_removeObjectForKey_(self->_ftMessageMap, v8, (uint64_t)v4);
  objc_msgSend_removeObjectForKey_(self->_apsMessageMap, v9, (uint64_t)v4);
  objc_msgSend_removeObjectForKey_(self->_retriesMap, v10, (uint64_t)v4);
  objc_msgSend_removeObjectForKey_(self->_timerMap, v11, (uint64_t)v4);
  objc_msgSend_removeObjectForKey_(self->_bodyMap, v12, (uint64_t)v4);
  objc_msgSend_removeObjectForKey_(self->_deathTimerMap, v13, (uint64_t)v4);
  if (!objc_msgSend_count(self->_deathTimerMap, v14, v15))
  {
    deathTimerMap = self->_deathTimerMap;
    self->_deathTimerMap = 0;

  }
  if (!objc_msgSend_count(self->_ftMessageMap, v16, v17))
  {
    ftMessageMap = self->_ftMessageMap;
    self->_ftMessageMap = 0;

  }
  if (!objc_msgSend_count(self->_apsMessageMap, v19, v20))
  {
    apsMessageMap = self->_apsMessageMap;
    self->_apsMessageMap = 0;

  }
  if (!objc_msgSend_count(self->_bodyMap, v22, v23))
  {
    bodyMap = self->_bodyMap;
    self->_bodyMap = 0;

  }
  if (!objc_msgSend_count(self->_timerMap, v25, v26))
  {
    timerMap = self->_timerMap;
    self->_timerMap = 0;

  }
  if (!objc_msgSend_count(self->_retriesMap, v28, v29))
  {
    retriesMap = self->_retriesMap;
    self->_retriesMap = 0;

  }
}

- (BOOL)_isBusyWithMessage:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend_allKeysForObject_(self->_apsMessageMap, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_count(v3, v4, v5) != 0;

  return v6;
}

- (id)_currentAPSMessages
{
  uint64_t v2;

  return (id)objc_msgSend_allValues(self->_apsMessageMap, a2, v2);
}

- (id)_currentMessages
{
  uint64_t v2;

  return (id)objc_msgSend_allValues(self->_ftMessageMap, a2, v2);
}

- (id)allMessages
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  objc_msgSend_queuedMessages(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend_mutableCopy(v4, v5, v6);

  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend__currentMessages(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v7, v11, (uint64_t)v10);

  return v7;
}

- (id)_currentTimers
{
  uint64_t v2;

  return (id)objc_msgSend_allValues(self->_timerMap, a2, v2);
}

- (int64_t)_retryCountForMessage:(id)a3
{
  NSMutableDictionary *retriesMap;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  int64_t v9;

  retriesMap = self->_retriesMap;
  objc_msgSend_uniqueIDString(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(retriesMap, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (int)objc_msgSend_intValue(v6, v7, v8);

  return v9;
}

- (id)_bodyForMessage:(id)a3
{
  NSMutableDictionary *bodyMap;
  void *v4;
  const char *v5;
  void *v6;

  bodyMap = self->_bodyMap;
  objc_msgSend_uniqueIDString(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(bodyMap, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_messageForAPSOutgoingMessage:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  objc_msgSend_allKeysForObject_(self->_apsMessageMap, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___imFirstObject(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_ftMessageMap, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_apsOutgoingMessageForFTMessage:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  objc_msgSend_allKeysForObject_(self->_ftMessageMap, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___imFirstObject(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_apsMessageMap, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_fillMessageParameters:(id *)a3 ftMessage:(id *)a4
{
  BOOL result;
  id v8;
  id v9;
  id v10;

  result = 0;
  if (a3 && a4)
  {
    v8 = *a3;
    v9 = *a4;
    if (v8)
    {
      if (v9)
        return 1;
    }
    else
    {
      objc_msgSend__apsOutgoingMessageForFTMessage_(self, a2, (uint64_t)v9);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      *a3 = v8;
      v10 = *a4;
      if (*a4)
        return v8 && v10 != 0;
    }
    objc_msgSend__messageForAPSOutgoingMessage_(self, a2, (uint64_t)v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = v10;
    v8 = *a3;
    return v8 && v10 != 0;
  }
  return result;
}

- (BOOL)_shouldSendSOSForFailure:(id)a3
{
  const char *v3;
  uint64_t v4;
  id v5;
  void **v6;
  void *v7;
  void *v8;
  const char *v9;
  char isEqualToString;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  int v15;

  v5 = a3;
  if (!qword_1ECF9D728)
  {
    v6 = (void **)MEMORY[0x1A85A5DEC]("APSErrorDomain", CFSTR("ApplePushService"));
    if (v6)
      v7 = *v6;
    else
      v7 = 0;
    objc_storeStrong((id *)&qword_1ECF9D728, v7);
  }
  objc_msgSend_domain(v5, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v8, v9, qword_1ECF9D728);

  if ((isEqualToString & 1) != 0
    || (objc_msgSend_domain(v5, v11, v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend_isEqualToString_(v13, v14, *MEMORY[0x1E0CB32E8]),
        v13,
        v15))
  {
    objc_msgSend_code(v5, v11, v12);
  }

  return 0;
}

- (void)_noteMessageFailed:(id)a3 ftMessage:(id)a4 retryBehavior:(int)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  int v14;
  id v15;
  id v16;
  const char *v17;
  void **v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  int isEqualToString;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  _BOOL4 v29;
  void *v30;
  const char *v31;
  int v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  int hasReceivedPushAck;
  const __CFString *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  int v56;
  const __CFString *v57;
  int v58;
  const __CFString *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  const __CFString *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const __CFString *v71;
  const __CFString *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  int v82;
  const char *v83;
  uint64_t v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  const char *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  char v99;
  const char *v100;
  uint64_t v101;
  double v102;
  double v103;
  NSObject *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  const char *v109;
  const char *v110;
  const char *v111;
  void *v112;
  double v113;
  uint64_t v114;
  const char *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  uint64_t v122;
  uint64_t v123;
  const __CFString *v124;
  void *v125;
  const __CFString *v126;
  char v127;
  uint64_t v128;
  _QWORD v129[4];
  id v130;
  _QWORD v131[4];
  id v132;
  id v133;
  id v134;
  _BYTE buf[22];
  void *v136;
  const __CFString *v137;
  __int16 v138;
  const __CFString *v139;
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v133 = a4;
  v134 = a3;
  v11 = a4;
  v12 = a3;
  v14 = objc_msgSend__fillMessageParameters_ftMessage_(self, v13, (uint64_t)&v134, &v133);
  v15 = v134;

  v16 = v133;
  if (!v14)
    goto LABEL_93;
  if (!qword_1ECF9D738)
  {
    v18 = (void **)MEMORY[0x1A85A5DEC]("APSErrorDomain", CFSTR("ApplePushService"));
    if (v18)
      v19 = *v18;
    else
      v19 = 0;
    objc_storeStrong((id *)&qword_1ECF9D738, v19);
  }
  v128 = objc_msgSend__retryCountForMessage_(self, v17, (uint64_t)v16);
  objc_msgSend_domain(v10, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v22, v23, *MEMORY[0x1E0CB32E8]);

  if (isEqualToString)
  {
    v127 = 0;
    v29 = objc_msgSend_code(v10, v25, v26) == -1001;
    goto LABEL_14;
  }
  objc_msgSend_domain(v10, v25, v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_isEqualToString_(v30, v31, qword_1ECF9D738);

  if (v32)
  {
    v33 = objc_msgSend_code(v10, v27, v28);
    if (v33 <= 7)
    {
      if (((1 << v33) & 0xC6) != 0)
      {
        v29 = 0;
        v127 = 1;
        goto LABEL_14;
      }
      if (v33 == 3)
        goto LABEL_93;
    }
    v127 = 1;
    v29 = 1;
  }
  else
  {
    v127 = 0;
    v29 = 0;
  }
LABEL_14:
  if (objc_msgSend_ignoreMaxRetryCount(v16, v27, v28))
  {
    OSLogHandleForIDSCategory();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      hasReceivedPushAck = objc_msgSend_hasReceivedPushAck(v16, v37, v38);
      v40 = CFSTR("NO");
      if (hasReceivedPushAck)
        v40 = CFSTR("YES");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v128;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v40;
      _os_log_impl(&dword_1A4C7F000, v36, OS_LOG_TYPE_DEFAULT, "  => Message ignores max retry count set on server bag. Keep retrying (current retires %d). Has received courier ack? %@", buf, 0x12u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (_IDSShouldLog() & 1) == 0)
      goto LABEL_47;
    goto LABEL_43;
  }
  objc_msgSend_sharedInstance(MEMORY[0x1E0D34E78], v34, v35);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v43, v44, (uint64_t)CFSTR("md-retry-attempts"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v46 = v45;
    v49 = objc_msgSend_intValue(v46, v47, v48);
    OSLogHandleForIDSCategory();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v49;
      _os_log_impl(&dword_1A4C7F000, v50, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with %d retries", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v118 = v49;
      _IDSLogV();
    }

    v51 = (int)v49;
  }
  else
  {
    OSLogHandleForIDSCategory();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = 2;
      _os_log_impl(&dword_1A4C7F000, v52, OS_LOG_TYPE_DEFAULT, "Server Bag has no value for retries, using the default: %ld retries", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v118 = 2;
      _IDSLogV();
    }
    v51 = 2;
  }

  if (v128 < v51)
    goto LABEL_47;
  OSLogHandleForIDSCategory();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v56 = objc_msgSend_hasReceivedPushAck(v16, v54, v55);
    v57 = CFSTR("NO");
    if (v56)
      v57 = CFSTR("YES");
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v128;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v57;
    _os_log_impl(&dword_1A4C7F000, v53, OS_LOG_TYPE_DEFAULT, "  => Message retried too many times (%d), not retrying anymore. Has received courier ack? %@", buf, 0x12u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    v29 = 0;
    if ((_IDSShouldLog() & 1) != 0)
    {
LABEL_43:
      v58 = objc_msgSend_hasReceivedPushAck(v16, v41, v42, v118);
      v59 = CFSTR("NO");
      if (v58)
        v59 = CFSTR("YES");
      v118 = v128;
      v120 = (uint64_t)v59;
      _IDSLogV();
    }
  }
  else
  {
    v29 = 0;
  }
LABEL_47:
  OSLogHandleForIDSCategory();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_uniqueIDString(v16, v61, v62);
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = (void *)v63;
    v65 = CFSTR("NO");
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    if (a5 == 1)
      v66 = CFSTR("YES");
    else
      v66 = CFSTR("NO");
    *(_QWORD *)&buf[14] = v63;
    if (v29)
      v65 = CFSTR("YES");
    LOWORD(v136) = 1024;
    *(_DWORD *)((char *)&v136 + 2) = v128;
    HIWORD(v136) = 2112;
    v137 = v66;
    v138 = 2112;
    v139 = v65;
    _os_log_impl(&dword_1A4C7F000, v60, OS_LOG_TYPE_DEFAULT, "Noting message failed: %@   (Request ID: %@  Retries: %d  Retry Allowed: %@  Wants Retry: %@)", buf, 0x30u);

  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    objc_msgSend_uniqueIDString(v16, v67, v68, v118, v120);
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = (void *)v69;
    v71 = CFSTR("NO");
    if (a5 == 1)
      v72 = CFSTR("YES");
    else
      v72 = CFSTR("NO");
    if (v29)
      v71 = CFSTR("YES");
    v124 = v72;
    v126 = v71;
    v120 = v69;
    v122 = v128;
    v118 = (uint64_t)v16;
    _IDSLogV();

  }
  objc_msgSend_logFailureInfo(v16, v67, v68, v118, v120, v122, v124, v126);
  if (objc_msgSend__shouldSendSOSForFailure_(self, v73, (uint64_t)v10))
  {
    if (objc_msgSend_code(v10, v74, v75))
      v78 = objc_msgSend_code(v10, v76, v77);
    else
      v78 = 9999;
    OSLogHandleForIDSCategory();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      v82 = objc_msgSend_code(v10, v80, v81);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v82;
      _os_log_impl(&dword_1A4C7F000, v79, OS_LOG_TYPE_DEFAULT, "FTMessageDelivery Sending SOS for APS failure that recieved response code: (HTTP Status Code: %d)", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v119 = objc_msgSend_code(v10, v83, v84);
      _IDSLogV();
    }
    OSLogHandleForIDSCategory();
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_topic(v16, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 0;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v78;
      *(_WORD *)&buf[20] = 2112;
      v136 = v88;
      _os_log_impl(&dword_1A4C7F000, v85, OS_LOG_TYPE_DEFAULT, "SOS Metric Domain (%d), sos type (%d), error code (%d), url (%@)", buf, 0x1Eu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_topic(v16, v89, v90);
      v119 = 0;
      v121 = 0.0;
      v123 = v78;
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    v91 = (void *)MEMORY[0x1E0D34E68];
    objc_msgSend_topic(v16, v89, v90, v119, *(_QWORD *)&v121, v123, v125);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_metricWithDomain_type_error_bagURL_(v91, v93, 0, 0, v78, v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_logger(MEMORY[0x1E0D34E60], v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logMetric_(v97, v98, (uint64_t)v94);

  }
  v99 = !v29;
  if (a5 != 1)
    v99 = 1;
  if ((v99 & 1) != 0)
  {
    if ((v127 & 1) != 0 || ((a5 == 2) | objc_msgSend_hasReceivedPushAck(v16, v74, v75)) == 1)
    {
      objc_msgSend__notifyDelegateAboutError_resultCode_forMessage_(self, v74, (uint64_t)v10, 20001, v16);
    }
    else if ((objc_msgSend_hasReceivedPushAck(v16, v74, v114) & 1) == 0)
    {
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v129[0] = MEMORY[0x1E0C809B0];
      v129[1] = 3221225472;
      v129[2] = sub_1A4CA0830;
      v129[3] = &unk_1E4DD9DD8;
      objc_copyWeak(&v130, (id *)buf);
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v115, v128);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__setMapForMessage_apsMessage_messageBody_timeoutTime_timeoutSelector_handlerBlock_retries_(self, v117, (uint64_t)v16, 0, 0, sel__messageAckGracePeriodTimedOut_, v129, v116, 90.0);

      objc_destroyWeak(&v130);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v102 = 1.0;
    if (objc_msgSend_wantsCustomRetryInterval(v16, v74, v75))
    {
      objc_msgSend_customRetryInterval(v16, v100, v101);
      v102 = v103;
    }
    OSLogHandleForIDSCategory();
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v102;
      _os_log_impl(&dword_1A4C7F000, v104, OS_LOG_TYPE_DEFAULT, "  => Will retry message: %@ in %f seconds", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v121 = v102;
      v119 = (uint64_t)v16;
      _IDSLogV();
    }
    objc_msgSend_connection(self, v105, v106, v119, *(_QWORD *)&v121);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancelOutgoingMessage_(v107, v108, (uint64_t)v15);

    objc_msgSend_setHasReceivedPushAck_(v16, v109, 0);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v131[0] = MEMORY[0x1E0C809B0];
    v131[1] = 3221225472;
    v131[2] = sub_1A4CA0734;
    v131[3] = &unk_1E4DD9DD8;
    objc_copyWeak(&v132, (id *)buf);
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v110, v128 + 1);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = 1.0;
    if (v102 >= 1.0)
      v113 = v102;
    objc_msgSend__setMapForMessage_apsMessage_messageBody_timeoutTime_timeoutSelector_handlerBlock_retries_(self, v111, (uint64_t)v16, 0, 0, sel__messageNeedsRetry_, v131, v112, v113);

    objc_destroyWeak(&v132);
    objc_destroyWeak((id *)buf);
  }
LABEL_93:

}

- (void)_noteMessageSucceeded:(id)a3 ftMessage:(id)a4 error:(id)a5 result:(id)a6 resultCode:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  int v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  int v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  id v39;
  id v40;
  int64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  int64_t v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v44 = a4;
  v45 = a3;
  v14 = a4;
  v15 = a3;
  v17 = objc_msgSend__fillMessageParameters_ftMessage_(self, v16, (uint64_t)&v45, &v44);
  v18 = v45;

  v19 = v44;
  if (v17)
  {
    objc_msgSend_uniqueIDString(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHasReceivedPushAck_(v19, v23, 1);
    OSLogHandleForIDSCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v47 = v19;
      v48 = 2048;
      v49 = a7;
      _os_log_impl(&dword_1A4C7F000, v24, OS_LOG_TYPE_DEFAULT, "Informing delegate about message %@ with resultCode %ld", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v39 = v19;
      v41 = a7;
      _IDSLogV();
    }
    objc_msgSend__informDelegateAboutMessage_error_result_resultCode_interface_(self, v25, (uint64_t)v19, 0, v13, a7, 1, v39, v41);
    OSLogHandleForIDSCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v19, v27, v28);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_count(self->_ftMessageMap, v30, v31);
      *(_DWORD *)buf = 138412802;
      v47 = v19;
      v48 = 2112;
      v49 = (int64_t)v29;
      v50 = 1024;
      v51 = v32;
      _os_log_impl(&dword_1A4C7F000, v26, OS_LOG_TYPE_DEFAULT, "Noting message success: %@   (Request ID: %@   %d remaining)", buf, 0x1Cu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v19, v33, v34);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_count(self->_ftMessageMap, v35, v36);
      v40 = v19;
      _IDSLogV();

    }
    objc_msgSend__clearMapForMessageID_(self, v33, (uint64_t)v22, v40, v42, v43);
    objc_msgSend__dequeueIfNeeded(self, v37, v38);

  }
}

- (void)_noteMessageACKd:(id)a3 ftMessage:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  int v9;
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v34 = a4;
  v35 = a3;
  v6 = a4;
  v7 = a3;
  v9 = objc_msgSend__fillMessageParameters_ftMessage_(self, v8, (uint64_t)&v35, &v34);
  v10 = v35;

  v11 = v34;
  if (v9)
  {
    OSLogHandleForIDSCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v11, v13, v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend_count(self->_ftMessageMap, v16, v17);
      *(_DWORD *)buf = 138412802;
      v37 = v11;
      v38 = 2112;
      v39 = v15;
      v40 = 1024;
      v41 = v18;
      _os_log_impl(&dword_1A4C7F000, v12, OS_LOG_TYPE_DEFAULT, "Noting message ack'd: %@   (Request ID: %@   %d remaining)", buf, 0x1Cu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v11, v19, v20);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_count(self->_ftMessageMap, v21, v22);
      v31 = v11;
      _IDSLogV();

    }
    objc_msgSend_originalTimestamp(v11, v19, v20, v31, v32, v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23 == 0;

    if (v24)
    {
      objc_msgSend_pushAckTimestamp(v11, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOriginalTimestamp_(v11, v28, (uint64_t)v27);

    }
    objc_msgSend_setHasReceivedPushAck_(v11, v25, 1);
    objc_msgSend__dequeueIfNeeded(self, v29, v30);
  }

}

- (void)_noteMessageSent:(id)a3 ftMessage:(id)a4 body:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  int v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  double v33;
  double v34;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  double v45;
  double v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  double v55;
  double v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  id v64;
  const char *v65;
  uint64_t v66;
  int v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  int v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  id v89;
  _BYTE buf[12];
  __int16 v91;
  double v92;
  __int16 v93;
  int v94;
  __int16 v95;
  int v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v88 = a4;
  v89 = a3;
  v9 = a4;
  v10 = a3;
  v12 = objc_msgSend__fillMessageParameters_ftMessage_(self, v11, (uint64_t)&v89, &v88);
  v13 = v89;

  v14 = v88;
  if (v12)
  {
    objc_msgSend_uniqueIDString(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_wantsAPSRetries(v14, v18, v19)
      && objc_msgSend_highPriority(v14, v20, v21))
    {
      OSLogHandleForIDSCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v22, OS_LOG_TYPE_DEFAULT, "   => Setting ack timeout time, this will use APS retries", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV();
      v24 = objc_msgSend__retryCountForMessage_(self, v23, (uint64_t)v14);
      objc_msgSend_sharedInstance(MEMORY[0x1E0D34E78], v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v27, v28, (uint64_t)CFSTR("md-retry-start-interval"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v30 = v29;
        objc_msgSend_doubleValue(v30, v31, v32);
        v34 = v33;
        OSLogHandleForIDSCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v34;
          _os_log_impl(&dword_1A4C7F000, v35, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with a retry interval of %f ", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v82 = *(_QWORD *)&v34;
          _IDSLogV();
        }

      }
      else
      {
        OSLogHandleForIDSCategory();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = 0x404E000000000000;
          _os_log_impl(&dword_1A4C7F000, v50, OS_LOG_TYPE_DEFAULT, "Server Bag has no value for interval , using the default: %f interval", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v82 = 0x404E000000000000;
          _IDSLogV();
        }
        v34 = 60.0;
      }

      if (objc_msgSend_wantsCustomRetryInterval(v14, v51, v52))
      {
        objc_msgSend_customRetryInterval(v14, v53, v54);
        v34 = v55;
      }
      v56 = v34 * (double)(v24 + 1);
      OSLogHandleForIDSCategory();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v24;
        v91 = 2048;
        v92 = v56;
        _os_log_impl(&dword_1A4C7F000, v57, OS_LOG_TYPE_DEFAULT, "Message has used %ld retries, Retry timeout time with multiplier will be %f", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v83 = v56;
        v82 = v24;
        _IDSLogV();
      }
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = sub_1A4CA16B0;
      v86[3] = &unk_1E4DD9DD8;
      objc_copyWeak(&v87, (id *)buf);
      objc_msgSend__setMapForMessage_apsMessage_messageBody_timeoutTime_timeoutSelector_handlerBlock_retries_(self, v58, (uint64_t)v14, v13, v8, sel__messageACKTimedOut_, v86, 0, v56);
      objc_destroyWeak(&v87);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      OSLogHandleForIDSCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_timeout(v14, v37, v38);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v39;
        _os_log_impl(&dword_1A4C7F000, v36, OS_LOG_TYPE_DEFAULT, "   => Setting send timeout time: %f", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        objc_msgSend_timeout(v14, v40, v41);
        v82 = v42;
        _IDSLogV();
      }
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      objc_msgSend_timeout(v14, v43, v44);
      v46 = v45;
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = sub_1A4CA17AC;
      v84[3] = &unk_1E4DD9DD8;
      objc_copyWeak(&v85, (id *)buf);
      objc_msgSend__setMapForMessage_apsMessage_messageBody_timeoutTime_timeoutSelector_handlerBlock_retries_(self, v47, (uint64_t)v14, v13, v8, sel__messageSendTimedOut_, v84, 0, v46 + 2.0);
      objc_destroyWeak(&v85);
      objc_destroyWeak((id *)buf);
    }
    v59 = objc_msgSend_payloadLength(v13, v48, v49, v82, *(_QWORD *)&v83);
    objc_msgSend_setSentByteCount_(v14, v60, v59);
    OSLogHandleForIDSCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v14, v62, v63);
      v64 = (id)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend_count(self->_ftMessageMap, v65, v66);
      objc_msgSend_objectForKey_(self->_retriesMap, v68, (uint64_t)v17);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend_intValue(v69, v70, v71);
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v14;
      v91 = 2112;
      v92 = *(double *)&v64;
      v93 = 1024;
      v94 = v67;
      v95 = 1024;
      v96 = v72;
      _os_log_impl(&dword_1A4C7F000, v61, OS_LOG_TYPE_DEFAULT, "Noting message sent: %@   (Request ID: %@  Remaining: %d  Attempt: %d)", buf, 0x22u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v14, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_count(self->_ftMessageMap, v76, v77);
      objc_msgSend_objectForKey_(self->_retriesMap, v78, (uint64_t)v17);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_intValue(v79, v80, v81);
      _IDSLogV();

    }
  }

}

- (void)_sendMessage:(id)a3 ftMessage:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A4CA1958;
  v11[3] = &unk_1E4DD9E00;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend__apsMessageForMessage_body_completion_(self, v10, (uint64_t)v9, v8, v11);

}

- (void)_messageACKTimedOut:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_userInfo(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_ftMessageMap, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v9, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v9;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "Timed out waiting for server ack for message: %@   (Request ID: %@)", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v9, v14, v15);
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    if (_IMWillLog())
    {
      objc_msgSend_uniqueIDString(v9, v16, v17);
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
    if (MarcoShouldLogCheckpoints())
    {
      objc_msgSend_uniqueIDString(v9, v18, v19);
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      MarcoNoteCheckpoint();

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB32E8], -1001, 0, v22, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__noteMessageFailed_ftMessage_retryBehavior_error_(self, v21, 0, v9, 1, v20);

  }
}

- (void)_messageSendTimedOut:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_userInfo(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_ftMessageMap, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v9, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v9;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "Timed out waiting for server response for message: %@   (Request ID: %@)", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v9, v14, v15);
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    if (_IMWillLog())
    {
      objc_msgSend_uniqueIDString(v9, v16, v17);
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
    if (MarcoShouldLogCheckpoints())
    {
      objc_msgSend_uniqueIDString(v9, v18, v19);
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      MarcoNoteCheckpoint();

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB32E8], -1001, 0, v22, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__noteMessageFailed_ftMessage_retryBehavior_error_(self, v21, 0, v9, 1, v20);

  }
}

- (void)_messageCompletelyTimedOut:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_userInfo(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_ftMessageMap, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v9, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v9;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "Timed out waiting for server response for message: %@   (Request ID: %@)", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v9, v14, v15);
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    if (_IMWillLog())
    {
      objc_msgSend_uniqueIDString(v9, v16, v17);
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
    if (MarcoShouldLogCheckpoints())
    {
      objc_msgSend_uniqueIDString(v9, v18, v19);
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      MarcoNoteCheckpoint();

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB32E8], -1001, 0, v22, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__noteMessageFailed_ftMessage_retryBehavior_error_(self, v21, 0, v9, 0, v20);

  }
}

- (void)_messageNeedsRetry:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_userInfo(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_ftMessageMap, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend__retryCountForMessage_(self, v10, (uint64_t)v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_removeObjectForKey_(self->_bodyMap, v12, (uint64_t)v7);
    objc_msgSend_removeObjectForKey_(self->_apsMessageMap, v13, (uint64_t)v7);
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRetryCount_(v9, v16, (uint64_t)v15);

  }
  objc_msgSend_objectForKey_(self->_apsMessageMap, v12, (uint64_t)v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__bodyForMessage_(self, v18, (uint64_t)v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    OSLogHandleForIDSCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v9, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v17;
      v35 = 2112;
      v36 = v23;
      _os_log_impl(&dword_1A4C7F000, v20, OS_LOG_TYPE_DEFAULT, "Starting retry for message: %@   (Request ID: %@)", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v9, v24, v25);
      v31 = v17;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    if (_IMWillLog())
    {
      objc_msgSend_uniqueIDString(v9, v26, v27);
      v31 = v17;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
    if (MarcoShouldLogCheckpoints())
    {
      objc_msgSend_uniqueIDString(v9, v28, v29);
      v31 = v17;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      MarcoNoteCheckpoint();

    }
    objc_msgSend__sendMessage_ftMessage_(self, v28, (uint64_t)v19, v9, v31, v32);
  }
  else
  {
    OSLogHandleForIDSCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v4;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_1A4C7F000, v30, OS_LOG_TYPE_ERROR, "Missing message for retry!  (timer: %@   messageID: %@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }

}

- (void)_messageAckGracePeriodTimedOut:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_userInfo(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(self->_ftMessageMap, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v9, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v9;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "Timed out waiting for server response after final grace period for message: %@   (Request ID: %@)", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v9, v14, v15);
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    if (_IMWillLog())
    {
      objc_msgSend_uniqueIDString(v9, v16, v17);
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      _IMAlwaysLog();

    }
    if (MarcoShouldLogCheckpoints())
    {
      objc_msgSend_uniqueIDString(v9, v18, v19);
      v22 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      MarcoNoteCheckpoint();

    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v18, *MEMORY[0x1E0CB32E8], -1001, 0, v22, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__noteMessageFailed_ftMessage_retryBehavior_error_(self, v21, 0, v9, 2, v20);

  }
}

- (id)_requiredTopicsWithUltraConstrainedTopics:(id *)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  void *v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  id v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, void *);
  void *v44;
  id v45;
  uint64_t *v46;
  _QWORD v47[4];
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = sub_1A4CA2B88;
  v54 = sub_1A4CA2B98;
  v55 = 0;
  objc_msgSend_currentMessage(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topic(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_length(v11, v12, v13))
  {
    objc_msgSend_addObject_(v5, v14, (uint64_t)v11);
    if (a3)
    {
      objc_msgSend_currentMessage(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend_ultraConstrainedAllowed(v17, v18, v19);

      if (v20)
      {
        v22 = (void *)v51[5];
        if (!v22)
        {
          v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v24 = (void *)v51[5];
          v51[5] = (uint64_t)v23;

          v22 = (void *)v51[5];
        }
        objc_msgSend_addObject_(v22, v21, (uint64_t)v11);
      }
    }
  }

  objc_msgSend_queuedMessages(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = sub_1A4CA2BA0;
  v47[3] = &unk_1E4DD9E28;
  v29 = v5;
  v48 = v29;
  v49 = &v50;
  objc_msgSend_enumerateObjectsUsingBlock_(v27, v30, (uint64_t)v47);

  objc_msgSend__currentMessages(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v28;
  v42 = 3221225472;
  v43 = sub_1A4CA2C44;
  v44 = &unk_1E4DD9E28;
  v34 = v29;
  v45 = v34;
  v46 = &v50;
  objc_msgSend_enumerateObjectsUsingBlock_(v33, v35, (uint64_t)&v41);

  if (a3)
  {
    v38 = (void *)v51[5];
    if (v38)
    {
      objc_msgSend_allObjects(v38, v36, v37, v41, v42, v43, v44);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend_allObjects(v34, v36, v37, v41, v42, v43, v44);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v50, 8);
  return v39;
}

- (void)_updateTopics
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  NSMutableArray *v16;
  NSMutableArray *enabledTopics;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  NSArray *v30;
  NSArray *ultraConstrainedTopics;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  objc_msgSend__requiredTopicsWithUltraConstrainedTopics_(self, a2, (uint64_t)&v33);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v33;
  v7 = objc_msgSend_count(self->_enabledTopics, v5, v6);
  if (v7 == objc_msgSend_count(v3, v8, v9))
    v11 = objc_msgSend_isEqualToArray_(self->_enabledTopics, v10, (uint64_t)v3) ^ 1;
  else
    v11 = 1;
  OSLogHandleForIDSCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v3;
    _os_log_impl(&dword_1A4C7F000, v12, OS_LOG_TYPE_DEFAULT, "Enabling required topics: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v32 = v3;
    _IDSLogV();
  }
  if (v11)
  {
    objc_msgSend__setEnabledTopics_(self, v13, (uint64_t)v3);
    v16 = (NSMutableArray *)objc_msgSend_mutableCopy(v3, v14, v15);
    enabledTopics = self->_enabledTopics;
    self->_enabledTopics = v16;

  }
  else
  {
    OSLogHandleForIDSCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v20, OS_LOG_TYPE_DEBUG, "  => Skipping, already enabled", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
  }
  v21 = objc_msgSend_count(self->_ultraConstrainedTopics, v18, v19, v32);
  if (v21 != objc_msgSend_count(v4, v22, v23)
    || (objc_msgSend_isEqualToArray_(self->_ultraConstrainedTopics, v24, (uint64_t)v4) & 1) == 0)
  {
    objc_msgSend_connection(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUltraConstrainedTopics_(v26, v27, (uint64_t)v4);

    v30 = (NSArray *)objc_msgSend_copy(v4, v28, v29);
    ultraConstrainedTopics = self->_ultraConstrainedTopics;
    self->_ultraConstrainedTopics = v30;

  }
}

- (void)_apsMessageBodyForMessage:(id)a3 completion:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  int v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  BOOL v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  NSObject *v74;
  const char *v75;
  id v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  int isInternalInstall;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t j;
  uint64_t v95;
  int v96;
  const char *v97;
  void *v98;
  const char *v99;
  void *v100;
  const char *v101;
  const char *v102;
  NSObject *v103;
  const char *v104;
  id v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t k;
  uint64_t v115;
  void *v116;
  const char *v117;
  void *v118;
  const char *v119;
  NSObject *v120;
  const char *v121;
  id v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t m;
  uint64_t v134;
  void *v135;
  const char *v136;
  void *v137;
  const char *v138;
  NSObject *v139;
  const char *v140;
  id v141;
  const char *v142;
  uint64_t v143;
  NSObject *v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  int CanBeLogged;
  __CFString *v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  NSObject *v164;
  id v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  NSObject *v169;
  id v170;
  BOOL v171;
  const char *v172;
  uint64_t v173;
  int v174;
  const char *v175;
  uint64_t v176;
  id v177;
  void *v178;
  const char *v179;
  NSObject *v180;
  id v181;
  const char *v182;
  uint64_t v183;
  id v184;
  NSObject *v185;
  id v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  const char *v191;
  void *v192;
  NSObject *v193;
  id v194;
  NSObject *v195;
  id v196;
  id v197;
  __CFDictionary *v198;
  void (**v199)(_QWORD, _QWORD);
  const char *v200;
  uint64_t v201;
  const char *v202;
  void *v203;
  void *v204;
  void *v205;
  uint64_t v206;
  __CFString *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v213;
  __CFDictionary *theDict;
  id v215;
  void *v216;
  id v217;
  void *v218;
  id v219;
  _QWORD v220[4];
  id v221;
  id v222;
  __CFDictionary *v223;
  id v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  uint8_t v244[128];
  uint8_t buf[4];
  uint64_t v246;
  __int16 v247;
  id v248;
  uint64_t v249;

  v249 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v215 = a4;
  v218 = v5;
  v219 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_messageBodyUsingCache(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_mutableCopy(v8, v9, v10);

  v217 = (id)v11;
  if (!v11)
    v217 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_bagKey(v218, v12, v13);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topic(v218, v14, v15);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  if (v216)
  {
    theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    OSLogHandleForIDSCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v246 = (uint64_t)v216;
      v247 = 2112;
      v248 = v213;
      _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "Building URL request with topic: %@  bagKey: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v203 = v216;
      v208 = v213;
      _IDSLogV();
    }
    if (!objc_msgSend_wantsHTTPHeaders(v218, v17, v18, v203, v208))
      goto LABEL_106;
    OSLogHandleForIDSCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_userAgent(self, v22, v23);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v246 = (uint64_t)v24;
      _os_log_impl(&dword_1A4C7F000, v21, OS_LOG_TYPE_DEFAULT, "       User Agent: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_userAgent(self, v25, v26);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    objc_msgSend_userAgent(self, v25, v26, v204);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v210, v27, v28))
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_sharedInstance(FTDeviceSupport, v29, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userAgentString(v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v31, v36, (uint64_t)CFSTR("%@ %@"), v210, v35);
      v211 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_sharedInstance(FTDeviceSupport, v29, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userAgentString(v32, v38, v39);
      v211 = (void *)objc_claimAutoreleasedReturnValue();
    }

    OSLogHandleForIDSCategory();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v246 = (uint64_t)v211;
      _os_log_impl(&dword_1A4C7F000, v40, OS_LOG_TYPE_DEFAULT, "            Agent: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v205 = v211;
      _IDSLogV();
    }
    v43 = objc_msgSend_wantsUserAgentInHeaders(v218, v41, v42, v205);
    v46 = objc_msgSend_length(v211, v44, v45);
    if (v43)
    {
      if (!v46)
        goto LABEL_39;
      objc_msgSend_userAgentHeaderString(v218, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v219, v50, (uint64_t)v211, v49);
    }
    else
    {
      if (!v46)
        goto LABEL_39;
      objc_msgSend_userAgentHeaderString(v218, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v217, v51, (uint64_t)v211, v49);
    }

LABEL_39:
    if (objc_msgSend_wantsCompressedBody(v218, v47, v48))
    {
      sub_1A4CA431C();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend_length(v54, v55, v56) == 0;

      if (!v57)
      {
        sub_1A4CA431C();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v219, v59, (uint64_t)v58, CFSTR("Accept-Language"));

      }
    }
    objc_msgSend_additionalMessageHeadersForOutgoingPush(v218, v52, v53);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v239 = 0u;
    v240 = 0u;
    v237 = 0u;
    v238 = 0u;
    objc_msgSend_allKeys(v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v237, v244, 16);
    if (v66)
    {
      v67 = *(_QWORD *)v238;
      do
      {
        for (i = 0; i != v66; ++i)
        {
          if (*(_QWORD *)v238 != v67)
            objc_enumerationMutation(v63);
          v69 = *(_QWORD *)(*((_QWORD *)&v237 + 1) + 8 * i);
          objc_msgSend_objectForKey_(v60, v65, v69, v206, v209);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          if (v70)
          {
            objc_msgSend_objectForKey_(v60, v71, v69);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v219, v73, (uint64_t)v72, v69);

          }
          OSLogHandleForIDSCategory();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_objectForKey_(v60, v75, v69);
            v76 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v246 = v69;
            v247 = 2112;
            v248 = v76;
            _os_log_impl(&dword_1A4C7F000, v74, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);

          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            objc_msgSend_objectForKey_(v60, v65, v69);
            v206 = v69;
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV();

          }
        }
        v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v65, (uint64_t)&v237, v244, 16);
      }
      while (v66);
    }

    objc_msgSend_sharedInstance(MEMORY[0x1E0D36A50], v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    isInternalInstall = objc_msgSend_isInternalInstall(v79, v80, v81);

    if (isInternalInstall)
    {
      objc_msgSend_additionalInternalHeaders(v218, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      v235 = 0u;
      v236 = 0u;
      v233 = 0u;
      v234 = 0u;
      objc_msgSend_allKeys(v85, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v233, v243, 16);
      if (!v92)
        goto LABEL_75;
      v93 = *(_QWORD *)v234;
      while (1)
      {
        for (j = 0; j != v92; ++j)
        {
          if (*(_QWORD *)v234 != v93)
            objc_enumerationMutation(v88);
          v95 = *(_QWORD *)(*((_QWORD *)&v233 + 1) + 8 * j);
          v96 = objc_msgSend_wantsUserAgentInHeaders(v218, v90, v91, v206, v209);
          objc_msgSend_objectForKey_(v85, v97, v95);
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          if (v96)
          {
            if (!v98)
              goto LABEL_68;
            objc_msgSend_objectForKey_(v85, v99, v95);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v219, v101, (uint64_t)v100, v95);
          }
          else
          {
            if (!v98)
              goto LABEL_68;
            objc_msgSend_objectForKey_(v85, v99, v95);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v217, v102, (uint64_t)v100, v95);
          }

LABEL_68:
          OSLogHandleForIDSCategory();
          v103 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_objectForKey_(v85, v104, v95);
            v105 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v246 = v95;
            v247 = 2112;
            v248 = v105;
            _os_log_impl(&dword_1A4C7F000, v103, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);

          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            objc_msgSend_objectForKey_(v85, v90, v95);
            v206 = v95;
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV();

          }
        }
        v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v90, (uint64_t)&v233, v243, 16);
        if (!v92)
        {
LABEL_75:

          goto LABEL_77;
        }
      }
    }
    v85 = v60;
LABEL_77:
    objc_msgSend_nonStandardMessageHeadersForOutgoingPush(v218, v83, v84, v206);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    v231 = 0u;
    v232 = 0u;
    v229 = 0u;
    v230 = 0u;
    objc_msgSend_allKeys(v106, v107, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v110, (uint64_t)&v229, v242, 16);
    if (v112)
    {
      v113 = *(_QWORD *)v230;
      do
      {
        for (k = 0; k != v112; ++k)
        {
          if (*(_QWORD *)v230 != v113)
            objc_enumerationMutation(v109);
          v115 = *(_QWORD *)(*((_QWORD *)&v229 + 1) + 8 * k);
          objc_msgSend_objectForKey_(v106, v111, v115, v204, v209);
          v116 = (void *)objc_claimAutoreleasedReturnValue();

          if (v116)
          {
            objc_msgSend_objectForKey_(v106, v117, v115);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v219, v119, (uint64_t)v118, v115);

          }
          OSLogHandleForIDSCategory();
          v120 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_objectForKey_(v106, v121, v115);
            v122 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v246 = v115;
            v247 = 2112;
            v248 = v122;
            _os_log_impl(&dword_1A4C7F000, v120, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);

          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            objc_msgSend_objectForKey_(v106, v111, v115);
            v204 = (void *)v115;
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV();

          }
        }
        v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v111, (uint64_t)&v229, v242, 16);
      }
      while (v112);
    }

    objc_msgSend_nonStandardMessageHeadersForOutgoingPush(v218, v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();

    v227 = 0u;
    v228 = 0u;
    v225 = 0u;
    v226 = 0u;
    objc_msgSend_allKeys(v125, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v129, (uint64_t)&v225, v241, 16);
    if (v131)
    {
      v132 = *(_QWORD *)v226;
      do
      {
        for (m = 0; m != v131; ++m)
        {
          if (*(_QWORD *)v226 != v132)
            objc_enumerationMutation(v128);
          v134 = *(_QWORD *)(*((_QWORD *)&v225 + 1) + 8 * m);
          objc_msgSend_objectForKey_(v125, v130, v134, v204, v209);
          v135 = (void *)objc_claimAutoreleasedReturnValue();

          if (v135)
          {
            objc_msgSend_objectForKey_(v125, v136, v134);
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v219, v138, (uint64_t)v137, v134);

          }
          OSLogHandleForIDSCategory();
          v139 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_objectForKey_(v125, v140, v134);
            v141 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v246 = v134;
            v247 = 2112;
            v248 = v141;
            _os_log_impl(&dword_1A4C7F000, v139, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);

          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            objc_msgSend_objectForKey_(v125, v130, v134);
            v204 = (void *)v134;
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV();

          }
        }
        v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(v128, v130, (uint64_t)&v225, v241, 16);
      }
      while (v131);
    }

LABEL_106:
    if (objc_msgSend_wantsCompressedBody(v218, v19, v20, v204))
    {
      OSLogHandleForIDSCategory();
      v144 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
      {
        CanBeLogged = objc_msgSend_payloadCanBeLogged(v218, v145, v146);
        if (CanBeLogged)
        {
          objc_msgSend_description(v217, v147, v148);
          v150 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v150 = CFSTR("(Not Loggable)");
        }
        *(_DWORD *)buf = 138412290;
        v246 = (uint64_t)v150;
        _os_log_impl(&dword_1A4C7F000, v144, OS_LOG_TYPE_DEFAULT, "Body: %@", buf, 0xCu);
        if (CanBeLogged)

      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        if ((objc_msgSend_payloadCanBeLogged(v218, v142, v143) & 1) != 0)
        {
          objc_msgSend_description(v217, v151, v152);
          v207 = (__CFString *)objc_claimAutoreleasedReturnValue();
          _IDSLogV();

        }
        else
        {
          v207 = CFSTR("(Not Loggable)");
          _IDSLogV();
        }
      }
    }
    if (objc_msgSend_wantsBagKey(v218, v142, v143, v207))
    {
      objc_msgSend_sharedInstance(MEMORY[0x1E0D34E78], v153, v154);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bagKey(v218, v156, v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_urlWithKey_(v155, v159, (uint64_t)v158);
      v160 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_absoluteString(v160, v161, v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      if (v163)
      {
        CFDictionarySetValue(theDict, CFSTR("u"), v163);
      }
      else
      {
        v164 = MEMORY[0x1E0C81028];
        v165 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
          sub_1A4CBB2D0();

      }
    }
    v167 = objc_msgSend_command(v218, v153, v154);
    if (v167 >= 1)
    {
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      if (v168)
      {
        CFDictionarySetValue(theDict, CFSTR("c"), v168);
      }
      else
      {
        v169 = MEMORY[0x1E0C81028];
        v170 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
          sub_1A4CBB250();

      }
    }
    v171 = objc_msgSend_count(v217, v166, v167) == 0;
    v174 = objc_msgSend_wantsCompressedBody(v218, v172, v173);
    if (v171)
    {
      if (v174)
      {
        objc_msgSend_dictionary(MEMORY[0x1E0C99D80], v175, v176);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(theDict, v179, (uint64_t)v178, CFSTR("p"));

      }
    }
    else if (v174)
    {
      v177 = v217;
      if (v177)
      {
        CFDictionarySetValue(theDict, CFSTR("p"), v177);
      }
      else
      {
        v180 = MEMORY[0x1E0C81028];
        v181 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR))
          sub_1A4CBB1D0();

      }
    }
    else
    {
      objc_msgSend_addEntriesFromDictionary_(theDict, v175, (uint64_t)v217);
    }
    if (objc_msgSend_count(v219, v175, v176) && objc_msgSend_wantsHTTPHeaders(v218, v182, v183))
    {
      v184 = v219;
      if (v184)
      {
        CFDictionarySetValue(theDict, CFSTR("h"), v184);
      }
      else
      {
        v185 = MEMORY[0x1E0C81028];
        v186 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
          sub_1A4CBB150();

      }
    }
    if (objc_msgSend_wantsIntegerUniqueIDs(v218, v182, v183))
    {
      v189 = (void *)MEMORY[0x1E0CB37E8];
      v190 = objc_msgSend_uniqueID(v218, v187, v188);
      objc_msgSend_numberWithUnsignedLongLong_(v189, v191, v190);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      if (v192)
      {
LABEL_153:
        CFDictionarySetValue(theDict, CFSTR("i"), v192);
LABEL_161:

        v220[0] = MEMORY[0x1E0C809B0];
        v220[1] = 3221225472;
        v220[2] = sub_1A4CA4360;
        v220[3] = &unk_1E4DD9E50;
        v221 = v219;
        v197 = v218;
        v222 = v197;
        v198 = theDict;
        v223 = v198;
        v224 = v215;
        v199 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85A6380](v220);
        if (objc_msgSend_wantsSignature(v197, v200, v201))
          objc_msgSend__signMessage_useDataSignatures_body_queryString_completion_(self, v202, (uint64_t)v197, 1, 0, 0, v199);
        else
          v199[2](v199, 0);

        goto LABEL_165;
      }
      v195 = MEMORY[0x1E0C81028];
      v196 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
        sub_1A4CBB0D0();
    }
    else
    {
      objc_msgSend_uniqueIDString(v218, v187, v188);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      if (v192)
        goto LABEL_153;
      v193 = MEMORY[0x1E0C81028];
      v194 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
        sub_1A4CBB0D0();
    }

    goto LABEL_161;
  }
  OSLogHandleForIDSCategory();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v246 = (uint64_t)v218;
    _os_log_impl(&dword_1A4C7F000, v37, OS_LOG_TYPE_DEFAULT, "Cannot send message: Empty topic requested for message: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  if (_IMWillLog())
    _IMAlwaysLog();
  if (MarcoShouldLogCheckpoints())
    MarcoNoteCheckpoint();
  (*((void (**)(id, _QWORD))v215 + 2))(v215, 0);
LABEL_165:

}

- (void)_apsMessageForMessage:(id)a3 body:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1A4CA4850;
  v16[3] = &unk_1E4DD9C10;
  v16[4] = self;
  v11 = v8;
  v17 = v11;
  v18 = v10;
  v12 = v10;
  v13 = MEMORY[0x1A85A6380](v16);
  v15 = (void *)v13;
  if (v9)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v9);
  else
    objc_msgSend__apsMessageBodyForMessage_completion_(self, v14, (uint64_t)v11, v13);

}

- (void)_powerLogEvent:(id)a3 dictionary:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (qword_1ECF9D788 != -1)
    dispatch_once(&qword_1ECF9D788, &unk_1E4DD9E70);
  if (off_1ECF9D780)
    off_1ECF9D780(2, v6, v5, 0);

}

- (void)_notifyDelegateAboutError:(id)a3 resultCode:(int64_t)a4 forMessage:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;

  v8 = a5;
  v9 = a3;
  objc_msgSend_uniqueIDString(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__clearMapForMessageID_(self, v13, (uint64_t)v12);

  objc_msgSend__informDelegateAboutMessage_error_result_resultCode_interface_(self, v14, (uint64_t)v8, v9, 0, a4, 1);
  objc_msgSend__dequeueIfNeeded(self, v15, v16);
}

- (void)invalidate
{
  NSObject *v3;
  FTMessageDelivery_APS *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint8_t buf[4];
  FTMessageDelivery_APS *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = self;
    _os_log_impl(&dword_1A4C7F000, v3, OS_LOG_TYPE_DEFAULT, "invalidating: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend__queue(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllMessages(v7, v8, v9);

  objc_msgSend__updateTopics(v4, v10, v11);
  objc_sync_exit(v4);

}

- (BOOL)_sendMessageAsynchronously:(id)a3 error:(id *)a4
{
  id v5;
  FTMessageDelivery_APS *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  FTMessageDelivery_APS *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Requesting async send: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v15 = v5;
    _IDSLogV();
  }
  objc_msgSend_bagKey(v5, v8, v9, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1A4CA4FAC;
  v16[3] = &unk_1E4DD9710;
  v11 = v10;
  v17 = v11;
  v12 = v5;
  v18 = v12;
  v19 = v6;
  objc_msgSend__apsMessageBodyForMessage_completion_(v6, v13, (uint64_t)v12, v16);

  objc_sync_exit(v6);
  return 1;
}

- (void)_dequeueIfNeeded
{
  void *CanBeLogged;
  void *v3;
  void *v4;
  void *v5;
  FTMessageDelivery_APS *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  _BOOL4 v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  __CFString *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  char hasRequiredKeys;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  NSObject *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  __CFString *v62;
  NSObject *v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  __CFString *v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  __CFString *v92;
  NSObject *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  int v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  __CFString *v103;
  const char *v104;
  uint64_t v105;
  NSObject *v106;
  NSObject *v107;
  const char *v108;
  void *v109;
  const char *v110;
  NSObject *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  int v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  __CFString *v124;
  NSObject *v125;
  NSObject *v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  __CFString *v135;
  const char *v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  int v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  __CFString *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  int v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  __CFString *v155;
  const char *v156;
  __CFString *v157;
  id v158;
  os_activity_scope_state_s state;
  NSObject *v160;
  uint8_t buf[4];
  __CFString *v162;
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v160 = _os_activity_create(&dword_1A4C7F000, "APS dequeue message", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v160, &state);
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend__queue(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_count(v10, v11, v12) == 0;

  if (!v13)
  {
    objc_msgSend__queue(v7, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_topMessage(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_isIDSMessage(v19, v20, v21) && objc_msgSend_wantsBagKey(v19, v22, v23))
    {
      objc_msgSend_sharedInstance(MEMORY[0x1E0D34E78], v24, v25);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isLoaded(v26, v27, v28) & 1) == 0)
      {
        OSLogHandleForIDSCategory();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4C7F000, v74, OS_LOG_TYPE_DEFAULT, "Server bag is not loaded, waiting for it", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          _IDSLogV();
        if (objc_msgSend_isServerAvailable(v26, v75, v76))
        {
          OSLogHandleForIDSCategory();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4C7F000, v77, OS_LOG_TYPE_DEFAULT, " => Server is available", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            _IDSLogV();
          if ((objc_msgSend_isLoading(v26, v78, v79) & 1) == 0)
          {
            OSLogHandleForIDSCategory();
            v111 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A4C7F000, v111, OS_LOG_TYPE_DEFAULT, " => Starting load", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              _IDSLogV();
            objc_msgSend_startBagLoad(v26, v112, v113);
            goto LABEL_148;
          }
          OSLogHandleForIDSCategory();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4C7F000, v80, OS_LOG_TYPE_DEFAULT, " => Already loading", buf, 2u);
          }

          if (!os_log_shim_legacy_logging_enabled() || (_IDSShouldLog() & 1) == 0)
            goto LABEL_148;
        }
        else
        {
          OSLogHandleForIDSCategory();
          v93 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4C7F000, v93, OS_LOG_TYPE_DEFAULT, " => Server not available", buf, 2u);
          }

          if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
            goto LABEL_148;
        }
        _IDSLogV();
        goto LABEL_148;
      }

    }
    else
    {
      OSLogHandleForIDSCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v31, OS_LOG_TYPE_DEFAULT, " => Server bag not needed, proceeding", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV();
    }
    if (objc_msgSend_busy(v7, v29, v30))
    {
      OSLogHandleForIDSCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v34, OS_LOG_TYPE_DEFAULT, "We're already busy, not pulling from queue", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV();
      goto LABEL_149;
    }
    objc_msgSend__queue(v7, v32, v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dequeueTopMessage(v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_isValidMessage(v41, v42, v43) & 1) == 0)
    {
      OSLogHandleForIDSCategory();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v63, OS_LOG_TYPE_DEFAULT, "Cancelling message delivery! invalid message!", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV();
      OSLogHandleForIDSCategory();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        CanBeLogged = (void *)objc_msgSend_payloadCanBeLogged(v41, v65, v66);
        if ((_DWORD)CanBeLogged)
        {
          objc_msgSend_messageBodyUsingCache(v41, v67, v68);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(v19, v69, v70);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_service(v41, v71, v72);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          IDSLoggableDescriptionForObjectOnService();
          v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v73 = CFSTR("(Not Loggable)");
        }
        *(_DWORD *)buf = 138412290;
        v162 = v73;
        _os_log_impl(&dword_1A4C7F000, v64, OS_LOG_TYPE_DEFAULT, "Message body: %@", buf, 0xCu);
        if ((_DWORD)CanBeLogged)
        {

        }
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v98 = objc_msgSend_payloadCanBeLogged(v41, v94, v95);
        if (v98)
        {
          objc_msgSend_messageBodyUsingCache(v41, v96, v97);
          v64 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(v64, v99, v100);
          CanBeLogged = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_service(v41, v101, v102);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          IDSLoggableDescriptionForObjectOnService();
          v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v103 = CFSTR("(Not Loggable)");
        }
        v157 = v103;
        _IDSLogV();
        if (v98)
        {

        }
      }
      objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v94, 5003, 0, v157);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__notifyDelegateAboutError_resultCode_forMessage_(v7, v114, (uint64_t)v109, 5003, v41);
      v26 = 0;
      goto LABEL_147;
    }
    v158 = 0;
    hasRequiredKeys = objc_msgSend_hasRequiredKeys_(v41, v44, (uint64_t)&v158);
    v26 = (__CFString *)v158;
    if ((hasRequiredKeys & 1) == 0)
    {
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v46, v47);
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        sub_1A4CBB410((uint64_t)v26, v81);

      OSLogHandleForIDSCategory();
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v162 = v26;
        _os_log_impl(&dword_1A4C7F000, v82, OS_LOG_TYPE_DEFAULT, "Cancelling message delivery! Missing keys: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v157 = v26;
        _IDSLogV();
      }
      OSLogHandleForIDSCategory();
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        v3 = (void *)objc_msgSend_payloadCanBeLogged(v41, v84, v85);
        if ((_DWORD)v3)
        {
          objc_msgSend_messageBodyUsingCache(v41, v86, v87);
          CanBeLogged = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(CanBeLogged, v88, v89);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_service(v41, v90, v91);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          IDSLoggableDescriptionForObjectOnService();
          v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v92 = CFSTR("(Not Loggable)");
        }
        *(_DWORD *)buf = 138412290;
        v162 = v92;
        _os_log_impl(&dword_1A4C7F000, v83, OS_LOG_TYPE_DEFAULT, "Message body: %@", buf, 0xCu);
        if ((_DWORD)v3)
        {

        }
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v119 = objc_msgSend_payloadCanBeLogged(v41, v115, v116);
        if (v119)
        {
          objc_msgSend_messageBodyUsingCache(v41, v117, v118);
          v83 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(v83, v120, v121);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_service(v41, v122, v123);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          IDSLoggableDescriptionForObjectOnService();
          v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v124 = CFSTR("(Not Loggable)");
        }
        v157 = v124;
        _IDSLogV();
        if (v119)
        {

        }
      }
      objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v115, 5008, 0, v157);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__notifyDelegateAboutError_resultCode_forMessage_(v7, v136, (uint64_t)v109, 5008, v41);
      goto LABEL_147;
    }
    if ((objc_msgSend_ignoresNetworkConnectivity(v41, v46, v47) & 1) == 0
      && objc_msgSend_isAirplaneModeEnabled(v7->_mobileNetworkManager, v48, v49)
      && (objc_msgSend_isWiFiUsable(v7->_mobileNetworkManager, v48, v50) & 1) == 0)
    {
      OSLogHandleForIDSCategory();
      v125 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v125, OS_LOG_TYPE_DEFAULT, "Message not being delivered, airplane mode is enabled", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV();
      OSLogHandleForIDSCategory();
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      {
        v3 = (void *)objc_msgSend_payloadCanBeLogged(v41, v127, v128);
        if ((_DWORD)v3)
        {
          objc_msgSend_messageBodyUsingCache(v41, v129, v130);
          CanBeLogged = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(CanBeLogged, v131, v132);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_service(v41, v133, v134);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          IDSLoggableDescriptionForObjectOnService();
          v135 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v135 = CFSTR("(Not Loggable)");
        }
        *(_DWORD *)buf = 138412290;
        v162 = v135;
        _os_log_impl(&dword_1A4C7F000, v126, OS_LOG_TYPE_DEFAULT, "Message body: %@", buf, 0xCu);
        if ((_DWORD)v3)
        {

        }
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v150 = objc_msgSend_payloadCanBeLogged(v41, v137, v147);
        if (v150)
        {
          objc_msgSend_messageBodyUsingCache(v41, v148, v149);
          v126 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(v126, v151, v152);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_service(v41, v153, v154);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          IDSLoggableDescriptionForObjectOnService();
          v155 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v155 = CFSTR("(Not Loggable)");
        }
        v157 = v155;
        _IDSLogV();
        if (v150)
        {

        }
      }
      goto LABEL_146;
    }
    if (objc_msgSend_shouldFailFastForMessage_(v7, v48, (uint64_t)v41))
    {
      OSLogHandleForIDSCategory();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v52, OS_LOG_TYPE_DEFAULT, "Message not being delivered, no network, can attempt stewie", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV();
      OSLogHandleForIDSCategory();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v3 = (void *)objc_msgSend_payloadCanBeLogged(v41, v54, v55);
        if ((_DWORD)v3)
        {
          objc_msgSend_messageBodyUsingCache(v41, v56, v57);
          CanBeLogged = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(CanBeLogged, v58, v59);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_service(v41, v60, v61);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          IDSLoggableDescriptionForObjectOnService();
          v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v62 = CFSTR("(Not Loggable)");
        }
        *(_DWORD *)buf = 138412290;
        v162 = v62;
        _os_log_impl(&dword_1A4C7F000, v53, OS_LOG_TYPE_DEFAULT, "Message body: %@", buf, 0xCu);
        if ((_DWORD)v3)
        {

        }
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v141 = objc_msgSend_payloadCanBeLogged(v41, v137, v138);
        if (v141)
        {
          objc_msgSend_messageBodyUsingCache(v41, v139, v140);
          v53 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(v53, v142, v143);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_service(v41, v144, v145);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          IDSLoggableDescriptionForObjectOnService();
          v146 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v146 = CFSTR("(Not Loggable)");
        }
        v157 = v146;
        _IDSLogV();
        if (v141)
        {

        }
      }
LABEL_146:
      objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v137, 10000, 0, v157);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__notifyDelegateAboutError_resultCode_forMessage_(v7, v156, (uint64_t)v109, 10000, v41);
LABEL_147:

      v19 = v41;
      goto LABEL_148;
    }
    if (objc_msgSend_isTrafficDisabledOnVMForMessage_(v7, v51, (uint64_t)v41))
    {
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v104, v105);
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        sub_1A4CBB3D0(v106);

      OSLogHandleForIDSCategory();
      v107 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v107, OS_LOG_TYPE_DEFAULT, "Message not being delivered, vm traffic is disable", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
      objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v108, 20000, 0);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__notifyDelegateAboutError_resultCode_forMessage_(v7, v110, (uint64_t)v109, 20000, v41);
      goto LABEL_147;
    }
    objc_msgSend__sendMessageAsynchronously_error_(v7, v104, (uint64_t)v41, 0);
    v19 = v41;
LABEL_148:

LABEL_149:
    goto LABEL_150;
  }
  OSLogHandleForIDSCategory();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v35, OS_LOG_TYPE_DEFAULT, "Nothing left in queue, done", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  objc_msgSend__updateTopics(v7, v36, v37);
LABEL_150:
  objc_sync_exit(v7);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (BOOL)busy
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  const char *v15;
  uint64_t v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend_copy(self->_ftMessageMap, a2, v2);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend_allValues(v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, v23, 16);
  if (v11)
  {
    v12 = 0;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v7);
        v12 += objc_msgSend_hasReceivedPushAck(*(void **)(*((_QWORD *)&v19 + 1) + 8 * i), v9, v10) ^ 1;
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v19, v23, 16);
    }
    while (v11);
    v11 = v12;
  }

  v17 = objc_msgSend_maxConcurrentMessages(self, v15, v16) <= v11;
  return v17;
}

- (void)cancelMessage:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  id v24;
  id v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)FTMessageDelivery_APS;
  -[FTMessageDelivery cancelMessage:](&v27, sel_cancelMessage_, v4);
  if (v4)
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v4;
      _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling message in the queue: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v24 = v4;
      _IDSLogV();
    }
    objc_msgSend__apsOutgoingMessageForFTMessage_(self, v6, (uint64_t)v4, v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__queue(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_removeMessage_(v10, v11, (uint64_t)v4);

    if (v12)
    {
      if (v7)
      {
        objc_msgSend_connection(self, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_cancelOutgoingMessage_(v15, v16, (uint64_t)v7);

        objc_msgSend__noteMessageSucceeded_ftMessage_error_result_resultCode_(self, v17, (uint64_t)v7, v4, 0, 0, 0);
      }
      else
      {
        objc_msgSend__informDelegateAboutMessage_error_result_resultCode_interface_(self, v13, (uint64_t)v4, 0, 0, 5013, 1);
      }
      OSLogHandleForIDSCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v4;
        v30 = 2112;
        v31 = v7;
        _os_log_impl(&dword_1A4C7F000, v21, OS_LOG_TYPE_DEFAULT, "Removed message: %@   apsMessage: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v25 = v4;
        v26 = v7;
        _IDSLogV();
      }
      if (v7)
        objc_msgSend__dequeueIfNeeded(self, v19, v20);
    }
    else
    {
      OSLogHandleForIDSCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v4;
        v30 = 2112;
        v31 = v7;
        _os_log_impl(&dword_1A4C7F000, v18, OS_LOG_TYPE_DEFAULT, "Message: %@ not in queue.   Current message: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v25 = v4;
        v26 = v7;
        _IDSLogV();
      }
    }
    objc_msgSend_uniqueIDString(v4, v19, v20, v25, v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__clearMapForMessageID_(self, v23, (uint64_t)v22);

  }
}

- (BOOL)sendMessage:(id)a3
{
  id v4;
  FTMessageDelivery_APS *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend__setUsingOutgoingPush_(v4, v6, 1);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v7, v8);
  objc_msgSend_setTimeSent_(v4, v9, v10);
  OSLogHandleForIDSCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v4;
    _os_log_impl(&dword_1A4C7F000, v11, OS_LOG_TYPE_DEFAULT, "Adding message to the queue: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v27 = v4;
    _IDSLogV();
  }
  objc_msgSend__queue(v5, v12, v13, v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addMessage_(v14, v15, (uint64_t)v4);

  if ((objc_msgSend_busy(v5, v16, v17) & 1) != 0)
  {
    OSLogHandleForIDSCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend__currentMessages(v5, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v23;
      _os_log_impl(&dword_1A4C7F000, v20, OS_LOG_TYPE_DEFAULT, "  Busy delivering: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend__currentMessages(v5, v24, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
  }
  else
  {
    objc_msgSend__dequeueIfNeeded(v5, v18, v19);
  }
  objc_sync_exit(v5);

  return 1;
}

- (void)_serverBagLoaded:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "Server bag loaded", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  if ((objc_msgSend_busy(self, v6, v7) & 1) != 0)
  {
    OSLogHandleForIDSCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend__currentMessages(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "  Busy delivering: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend__currentMessages(self, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
  }
  else
  {
    objc_msgSend__dequeueIfNeeded(self, v8, v9);
  }

}

- (BOOL)shouldFailFastForMessage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void **v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  char isConnectionSuitableForIMLOverStewie;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  BOOL v22;

  v4 = a3;
  if (!_os_feature_enabled_impl()
    || (objc_msgSend_shouldDisableFailFastWhenSatelliteIsAvailable(MEMORY[0x1E0D36AF8], v5, v6) & 1) != 0)
  {
    goto LABEL_20;
  }
  if (!qword_1ECF9D768)
  {
    v9 = (void **)MEMORY[0x1A85A5DEC]("IDSServiceNameiMessage", CFSTR("IDS"));
    if (v9)
      v10 = *v9;
    else
      v10 = 0;
    objc_storeStrong((id *)&qword_1ECF9D768, v10);
  }
  if (!qword_1ECF9D778)
  {
    v11 = (void **)MEMORY[0x1A85A5DEC]("IDSServiceNameiMessageLite", CFSTR("IDS"));
    if (v11)
      v12 = *v11;
    else
      v12 = 0;
    objc_storeStrong((id *)&qword_1ECF9D778, v12);
  }
  objc_msgSend_topic(v4, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToIgnoringCase_(v13, v14, qword_1ECF9D768) & 1) != 0)
  {
    isConnectionSuitableForIMLOverStewie = objc_msgSend_isConnectionSuitableForIMLOverStewie(self->_offGridConnectionMonitor, v15, v16);
  }
  else
  {
    objc_msgSend_topic(v4, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToIgnoringCase_(v18, v19, qword_1ECF9D778) & 1) == 0)
    {

      goto LABEL_20;
    }
    isConnectionSuitableForIMLOverStewie = objc_msgSend_isConnectionSuitableForIMLOverStewie(self->_offGridConnectionMonitor, v20, v21);

  }
  if ((isConnectionSuitableForIMLOverStewie & 1) == 0)
  {
LABEL_20:
    v22 = 0;
    goto LABEL_21;
  }
  v22 = 1;
LABEL_21:

  return v22;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  NSMutableArray *enabledTopics;
  NSArray *ultraConstrainedTopics;

  enabledTopics = self->_enabledTopics;
  self->_enabledTopics = 0;

  ultraConstrainedTopics = self->_ultraConstrainedTopics;
  self->_ultraConstrainedTopics = 0;

}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  NSMutableArray *enabledTopics;
  NSArray *ultraConstrainedTopics;

  enabledTopics = self->_enabledTopics;
  self->_enabledTopics = 0;

  ultraConstrainedTopics = self->_ultraConstrainedTopics;
  self->_ultraConstrainedTopics = 0;

}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  const char *v12;
  void *v13;
  char isKindOfClass;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  const char *v27;
  NSMutableDictionary *v28;
  void *v29;
  NSObject *v30;
  NSMutableDictionary *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  NSMutableDictionary *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  char v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  NSMutableDictionary *ftMessageMap;
  char v55;
  const char *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  id v63;
  NSMutableDictionary *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  NSMutableDictionary *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  NSMutableDictionary *v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  id v90;
  NSObject *v91;
  id v92;
  id v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  const char *v98;
  NSMutableDictionary *v99;
  NSObject *v100;
  NSMutableDictionary *v101;
  const char *v102;
  uint64_t v103;
  NSObject *v104;
  NSObject *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  NSObject *v109;
  int v110;
  const char *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  NSMutableDictionary *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  void *v120;
  NSObject *v121;
  const char *v122;
  NSObject *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  NSMutableDictionary *v128;
  NSMutableDictionary *v129;
  NSMutableDictionary *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  void *v142;
  id v143;
  unint64_t v144;
  _QWORD v145[3];
  _QWORD v146[3];
  uint8_t buf[4];
  NSMutableDictionary *v148;
  __int16 v149;
  id v150;
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v138 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)CFSTR("c"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForIDSCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForObjectOnService();
    v11 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v148 = v11;
    _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "received response dictionary: %@", buf, 0xCu);

  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    IDSLoggableDescriptionForObjectOnService();
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    _IDSLogV();

  }
  objc_msgSend_objectForKey_(v8, v12, (uint64_t)CFSTR("i"), v124);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend_objectForKey_(v8, v15, (uint64_t)CFSTR("i"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16;
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend_stringValue(v16, v17, v18);
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  objc_msgSend__dataForKey_(v8, v17, (uint64_t)CFSTR("U"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v21, (uint64_t)CFSTR("h"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = objc_msgSend_intValue(v142, v22, v23) == 97;

    if (v25)
    {
      OSLogHandleForIDSCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_objectForKey_(v8, v27, (uint64_t)CFSTR("h"));
        v28 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v148 = v28;
        _os_log_impl(&dword_1A4C7F000, v26, OS_LOG_TYPE_DEFAULT, "Response Headers: %@", buf, 0xCu);

      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        objc_msgSend_objectForKey_(v8, v22, (uint64_t)CFSTR("h"));
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV();

      }
    }
  }
  objc_msgSend_objectForKey_(self->_ftMessageMap, v22, (uint64_t)v19, v125);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    OSLogHandleForIDSCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      IDSLoggableDescriptionForObjectOnService();
      v31 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v148 = v31;
      _os_log_impl(&dword_1A4C7F000, v30, OS_LOG_TYPE_DEFAULT, "received response dictionary: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      IDSLoggableDescriptionForObjectOnService();
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    v34 = objc_msgSend_intValue(v142, v32, v33, v126);
    if (objc_msgSend_responseCommand(v29, v35, v36) == v34
      || objc_msgSend_intValue(v142, v37, v38) == 255
      || objc_msgSend_intValue(v142, v39, v40) == 101)
    {
      OSLogHandleForIDSCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        IDSLoggableDescriptionForObjectOnService();
        v42 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v148 = v42;
        _os_log_impl(&dword_1A4C7F000, v41, OS_LOG_TYPE_DEFAULT, "received response dictionary: %@", buf, 0xCu);

      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        IDSLoggableDescriptionForObjectOnService();
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV();

      }
      objc_msgSend_objectForKey_(v8, v43, (uint64_t)CFSTR("b"), v127);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        objc_msgSend_objectForKey_(v8, v45, (uint64_t)CFSTR("b"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v48 = objc_opt_isKindOfClass();

        objc_msgSend_objectForKey_(v8, v49, (uint64_t)CFSTR("b"));
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v48 & 1) != 0)
        {
          objc_msgSend__FTDataFromBase64String(v139, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_45;
        }
        objc_opt_class();
        v55 = objc_opt_isKindOfClass();

        if ((v55 & 1) != 0)
        {
          objc_msgSend_objectForKey_(v8, v56, (uint64_t)CFSTR("b"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_44:
          v139 = 0;
LABEL_45:
          v144 = 0xAAAAAAAAAAAAAAAALL;
          v134 = v52;
          objc_msgSend__FTDecompressData(v52, v45, v46);
          v58 = objc_claimAutoreleasedReturnValue();
          v135 = (void *)v58;
          v59 = v134;
          if (v58)
            v59 = (void *)v58;
          v136 = v59;
          objc_msgSend_objectForKey_(v8, v60, (uint64_t)CFSTR("p"));
          v63 = (id)objc_claimAutoreleasedReturnValue();
          if (v63)
          {
            v64 = 0;
          }
          else
          {
            v62 = (uint64_t)v136;
            if (!v136)
            {
              v63 = 0;
              v64 = 0;
              goto LABEL_55;
            }
            v143 = 0;
            objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v61, (uint64_t)v136, 0, &v144, &v143);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = (NSMutableDictionary *)v143;
            v63 = v65;

          }
          if (!v64 && v63)
          {
            v64 = 0;
            goto LABEL_61;
          }
LABEL_55:
          if (objc_msgSend_length(v139, v61, v62) || objc_msgSend_count(v63, v66, v67))
          {
            OSLogHandleForIDSCategory();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v148 = v64;
              v149 = 2112;
              v150 = v136;
              _os_log_impl(&dword_1A4C7F000, v68, OS_LOG_TYPE_ERROR, "Error decompressing body: %@  (Data: %@)", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              _IDSWarnV();
              _IDSLogV();
              v128 = v64;
              v131 = v136;
              _IDSLogTransport();
            }
          }
LABEL_61:
          objc_msgSend_objectForKey_(v8, v61, (uint64_t)CFSTR("h"), v128, v131);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v8, v69, (uint64_t)CFSTR("s"));
          v70 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          if (_os_feature_enabled_impl())
          {
            objc_msgSend_objectForKey_(v8, v71, (uint64_t)CFSTR("hs"));
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = MEMORY[0x1A85A5DE0](CFSTR("IDSBAASigner"), CFSTR("IDS"));
            if (v73)
            {
              v75 = (void *)v74;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & (v75 != 0)) == 1)
              {
                v78 = objc_msgSend_integerValue(v73, v76, v77);
                if (objc_msgSend_isBAAHTTPResponseCode_(v75, v79, v78))
                {
                  v80 = v73;

                  v70 = v80;
                }
              }
            }

          }
          if (v137)
          {
            objc_msgSend_objectForKey_(v137, v71, (uint64_t)CFSTR("X-Apple-Splunk-Hint"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setSplunkHint_(v29, v82, (uint64_t)v81);

          }
          if ((objc_msgSend_isWebTunnelMessage(v29, v71, v72) & 1) == 0)
          {
            sub_1A4CA9E64(v63);
            v85 = objc_claimAutoreleasedReturnValue();

            v63 = (id)v85;
          }
          objc_msgSend_date(MEMORY[0x1E0C99D68], v83, v84);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setResponseReceived_(v29, v87, (uint64_t)v86);

          if (!objc_msgSend_count(v63, v88, v89))
          {
            v90 = v8;

            v63 = v90;
          }
          OSLogHandleForIDSCategory();
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            IDSLoggableDescriptionForObjectOnService();
            v92 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v148 = v70;
            v149 = 2112;
            v150 = v92;
            _os_log_impl(&dword_1A4C7F000, v91, OS_LOG_TYPE_DEFAULT, "received response code: %@  response body: %@", buf, 0x16u);

          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            IDSLoggableDescriptionForObjectOnService();
            v129 = v70;
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV();

          }
          v93 = objc_alloc(MEMORY[0x1E0D34D08]);
          v133 = (void *)objc_msgSend_initWithServerResponseDictionary_(v93, v94, (uint64_t)v63);
          if (v63)
          {
            if (objc_msgSend_isIDSMessage(v29, v95, v96))
              objc_msgSend_handleResponseDictionary_(v29, v97, (uint64_t)v63);
            else
              objc_msgSend_handleResponseDictionary_(v29, v97, (uint64_t)v8);
            objc_msgSend_objectForKey_(v63, v98, (uint64_t)CFSTR("status"), v129, v132);
            v99 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
            if (v99)
            {
              OSLogHandleForIDSCategory();
              v100 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v148 = v99;
                _os_log_impl(&dword_1A4C7F000, v100, OS_LOG_TYPE_DEFAULT, "  Found internal status code of: %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                v129 = v99;
                _IDSLogV();
              }
              v101 = v99;

              v70 = v101;
            }

          }
          if (objc_msgSend_wantsMultipleResponses(v29, v95, v96, v129))
          {
            OSLogHandleForIDSCategory();
            v104 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A4C7F000, v104, OS_LOG_TYPE_DEFAULT, "  This Message Wants Multiple responses", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              _IDSLogV();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              OSLogHandleForIDSCategory();
              v105 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A4C7F000, v105, OS_LOG_TYPE_DEFAULT, "  This Message responds to receiving updates for multipleMessages", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                _IDSLogV();
              objc_msgSend_noteResponseForToken_(v29, v106, (uint64_t)v133);
            }
            if ((objc_opt_respondsToSelector() & 1) == 0)
              goto LABEL_111;
            if (objc_msgSend_expectingMoreResponses(v29, v107, v108))
            {
              OSLogHandleForIDSCategory();
              v109 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A4C7F000, v109, OS_LOG_TYPE_DEFAULT, " More To Come, Not done yet", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                _IDSLogV();
              goto LABEL_111;
            }
            OSLogHandleForIDSCategory();
            v123 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A4C7F000, v123, OS_LOG_TYPE_DEFAULT, "  Last message Has Been acknowledged", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              _IDSLogV();
          }
          v110 = objc_msgSend_intValue(v70, v102, v103);
          objc_msgSend__noteMessageSucceeded_ftMessage_error_result_resultCode_(self, v111, 0, v29, v64, v63, v110);
LABEL_111:
          v145[0] = CFSTR("CommandID");
          v145[1] = CFSTR("MessageIdentifier");
          v146[0] = v142;
          v146[1] = v19;
          v145[2] = CFSTR("Topic");
          v146[2] = v7;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v107, (uint64_t)v146, v145, 3);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v112, v113, v114);

          if (v140)
          {
            JWUUIDPushObjectToString();
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v115, v117, (uint64_t)v116, CFSTR("MessageGUID"));

          }
          v118 = objc_opt_class();
          sub_1A4CA57B8(v118, v8, (void *)*MEMORY[0x1E0D344E8]);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          if (v120)
            objc_msgSend_setObject_forKeyedSubscript_(v115, v119, (uint64_t)v120, CFSTR("CommandContext"));
          OSLogHandleForIDSCategory();
          v121 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v148 = v115;
            _os_log_impl(&dword_1A4C7F000, v121, OS_LOG_TYPE_DEFAULT, "Logging incoming push power event: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            v130 = v115;
            _IDSLogV();
          }
          objc_msgSend__powerLogEvent_dictionary_(self, v122, (uint64_t)CFSTR("IDS IncomingPushReceived"), v115, v130);

          goto LABEL_121;
        }
        OSLogHandleForIDSCategory();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4C7F000, v57, OS_LOG_TYPE_ERROR, "Received an unknown object for kBodyIDKey", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          _IDSLogTransport();
        }
      }
      v52 = 0;
      goto LABEL_44;
    }
  }
  else
  {
    OSLogHandleForIDSCategory();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      ftMessageMap = self->_ftMessageMap;
      *(_DWORD *)buf = 138412290;
      v148 = ftMessageMap;
      _os_log_impl(&dword_1A4C7F000, v53, OS_LOG_TYPE_DEFAULT, "no message found, map reads: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
  }
LABEL_121:

}

- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  __CFString *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  const __CFString *v21;
  const char *v22;
  uint64_t v23;
  int v24;
  const __CFString *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  id v59;
  void *v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  const __CFString *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend__isBusyWithMessage_(self, v8, (uint64_t)v7))
  {
    objc_msgSend__messageForAPSOutgoingMessage_(self, v9, (uint64_t)v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    OSLogHandleForIDSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uniqueIDString(v10, v12, v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v62 = v7;
      v63 = 2112;
      v64 = v14;
      _os_log_impl(&dword_1A4C7F000, v11, OS_LOG_TYPE_DEFAULT, "Server ACK'd outgoing message: %@      (Request ID: %@)", buf, 0x16u);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_uniqueIDString(v10, v15, v16);
      v59 = v7;
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    OSLogHandleForIDSCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend_wantsResponse(v10, v18, v19);
      v21 = CFSTR("NO");
      if (v20)
        v21 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v62 = v10;
      v63 = 2112;
      v64 = v21;
      _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "   message: %@ wants response: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v24 = objc_msgSend_wantsResponse(v10, v22, v23);
      v25 = CFSTR("NO");
      if (v24)
        v25 = CFSTR("YES");
      v59 = v10;
      v60 = (void *)v25;
      _IDSLogV();
    }
    v27 = 1000000 * objc_msgSend_ackTimestamp(v7, v22, v23, v59, v60);
    if (v27)
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPushAckTimestamp_(v10, v29, (uint64_t)v28);

    }
    objc_msgSend_deliveryAcknowledgementBlock(v10, v26, v27);
    v30 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v30;
    if (v30)
      (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v10);
    objc_msgSend__messageForAPSOutgoingMessage_(self, v31, (uint64_t)v7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__bodyForMessage_(self, v34, (uint64_t)v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v35, v36, *MEMORY[0x1E0D344F0]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = objc_msgSend_integerValue(v37, v38, v39);
    if ((unint64_t)(v40 - 200) <= 0x27 && ((1 << (v40 + 56)) & 0x8100000FC1) != 0)
    {
      v43 = objc_alloc(MEMORY[0x1E0D34CE8]);
      v46 = objc_msgSend_integerValue(v37, v44, v45);
      v48 = objc_msgSend__retryCountForMessage_(self, v47, (uint64_t)v33);
      v50 = (void *)objc_msgSend_initWithCommand_success_errorDomain_errorCode_retryCount_(v43, v49, v46, 1, 0, 0, v48);
      objc_msgSend_loggerWithCategory_(MEMORY[0x1E0D34E30], v51, 2000);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logMetric_(v52, v53, (uint64_t)v50);

    }
    objc_msgSend_date(MEMORY[0x1E0C99D68], v41, v42);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestEnd_(v10, v55, (uint64_t)v54);

    if (objc_msgSend_wantsResponse(v10, v56, v57))
      objc_msgSend__noteMessageACKd_ftMessage_(self, v58, (uint64_t)v7, v10);
    else
      objc_msgSend__noteMessageSucceeded_ftMessage_error_result_resultCode_(self, v58, (uint64_t)v7, v10, 0, 0, 0);

  }
}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void **v13;
  void *v14;
  void *v15;
  const char *v16;
  int isEqualToString;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  unint64_t v85;
  id v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  NSMutableArray *enabledTopics;
  NSArray *ultraConstrainedTopics;
  id v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  id v112;
  uint8_t buf[4];
  id v114;
  __int16 v115;
  int v116;
  __int16 v117;
  id v118;
  __int16 v119;
  void *v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v112 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend__isBusyWithMessage_(self, v10, (uint64_t)v8))
  {
    if (!qword_1ECF9D730)
    {
      v13 = (void **)MEMORY[0x1A85A5DEC]("APSErrorDomain", CFSTR("ApplePushService"));
      if (v13)
        v14 = *v13;
      else
        v14 = 0;
      objc_storeStrong((id *)&qword_1ECF9D730, v14);
    }
    objc_msgSend_domain(v9, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v15, v16, qword_1ECF9D730);

    if (!isEqualToString || objc_msgSend_code(v9, v18, v19) != 3)
    {
      objc_msgSend__messageForAPSOutgoingMessage_(self, v18, (uint64_t)v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = objc_msgSend_disallowRetry(self, v21, v22) ^ 1;
      OSLogHandleForIDSCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v114 = v9;
        v115 = 1024;
        v116 = v111;
        _os_log_impl(&dword_1A4C7F000, v23, OS_LOG_TYPE_DEFAULT, "message delivery failed {error: %@, retryBehavior: %d}", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v105 = v9;
        v106 = v111;
        _IDSLogV();
      }
      OSLogHandleForIDSCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_domain(v9, v25, v26);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend_code(v9, v28, v29);
        objc_msgSend_localizedDescription(v9, v31, v32);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userInfo(v9, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v36, v37, *MEMORY[0x1E0CB3300]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v114 = v27;
        v115 = 1024;
        v116 = v30;
        v117 = 2112;
        v118 = v33;
        v119 = 2112;
        v120 = v38;
        _os_log_impl(&dword_1A4C7F000, v24, OS_LOG_TYPE_ERROR, "FTMessageDelivery failed! Error (%@:%d): %@ %@", buf, 0x26u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        objc_msgSend_domain(v9, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend_code(v9, v42, v43);
        objc_msgSend_localizedDescription(v9, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userInfo(v9, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *MEMORY[0x1E0CB3300];
        objc_msgSend_objectForKey_(v50, v52, *MEMORY[0x1E0CB3300]);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSWarnV();

        objc_msgSend_domain(v9, v53, v54, v41, v44, v47, v109);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend_code(v9, v56, v57);
        objc_msgSend_localizedDescription(v9, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userInfo(v9, v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v64, v65, v51);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV();

        objc_msgSend_domain(v9, v66, v67, v55, v58, v61, v110);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend_code(v9, v69, v70);
        objc_msgSend_localizedDescription(v9, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userInfo(v9, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v77, v78, v51);
        v107 = v74;
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = v68;
        v106 = v71;
        _IDSLogTransport();

      }
      objc_msgSend__bodyForMessage_(self, v39, (uint64_t)v20, v105, v106, v107, v108);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v79, v80, *MEMORY[0x1E0D344F0]);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      v85 = objc_msgSend_integerValue(v81, v82, v83) - 200;
      if (v85 <= 0x27 && ((1 << v85) & 0x8100000FC1) != 0)
      {
        v86 = objc_alloc(MEMORY[0x1E0D34CE8]);
        v89 = objc_msgSend_integerValue(v81, v87, v88);
        objc_msgSend_domain(v9, v90, v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend_code(v9, v93, v94);
        v97 = objc_msgSend__retryCountForMessage_(self, v96, (uint64_t)v20);
        v99 = (void *)objc_msgSend_initWithCommand_success_errorDomain_errorCode_retryCount_(v86, v98, v89, 0, v92, v95, v97);

        objc_msgSend_loggerWithCategory_(MEMORY[0x1E0D34E30], v100, 2000);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_logMetric_(v101, v102, (uint64_t)v99);

      }
      objc_msgSend__noteMessageFailed_ftMessage_retryBehavior_error_(self, v84, (uint64_t)v8, v20, v111, v9);
      enabledTopics = self->_enabledTopics;
      self->_enabledTopics = 0;

      ultraConstrainedTopics = self->_ultraConstrainedTopics;
      self->_ultraConstrainedTopics = 0;

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retriesMap, 0);
  objc_storeStrong((id *)&self->_deathTimerMap, 0);
  objc_storeStrong((id *)&self->_timerMap, 0);
  objc_storeStrong((id *)&self->_apsMessageMap, 0);
  objc_storeStrong((id *)&self->_bodyMap, 0);
  objc_storeStrong((id *)&self->_startDateMap, 0);
  objc_storeStrong((id *)&self->_ftMessageMap, 0);
  objc_storeStrong((id *)&self->_ultraConstrainedTopics, 0);
  objc_storeStrong((id *)&self->_enabledTopics, 0);
  objc_storeStrong((id *)&self->_offGridConnectionMonitor, 0);
  objc_storeStrong((id *)&self->_mobileNetworkManager, 0);
}

@end
