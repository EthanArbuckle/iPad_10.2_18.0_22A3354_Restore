@implementation CKNotificationListener

- (CKNotificationListener)init
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v8[16];
  uint8_t buf[16];

  objc_opt_self();
  if ((CKCurrentProcessIsDaemon() & 1) != 0)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v3 = ck_log_facility_notification_listener;
    if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_debug_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_DEBUG, "Not running in an app, so we'll use our own APSConnection", v8, 2u);
    }
    v5 = 0;
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v6 = ck_log_facility_notification_listener;
    if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18A5C5000, v6, OS_LOG_TYPE_DEBUG, "Running in an app and choosing app strategy", buf, 2u);
    }
    v5 = 1;
  }
  return (CKNotificationListener *)MEMORY[0x1E0DE7D20](self, sel_initWithStrategy_, v5, v4);
}

- (CKNotificationListener)initWithStrategy:(unint64_t)a3
{
  return (CKNotificationListener *)MEMORY[0x1E0DE7D20](self, sel_initWithStrategy_machServiceName_, a3, 0);
}

- (CKNotificationListener)initWithMachServiceName:(id)a3
{
  return (CKNotificationListener *)MEMORY[0x1E0DE7D20](self, sel_initWithStrategy_machServiceName_, 0, a3);
}

- (CKNotificationListener)initWithStrategy:(unint64_t)a3 machServiceName:(id)a4
{
  void *v4;
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *isa;
  NSObject *v12;
  dispatch_queue_t v13;
  void *info;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *length;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *data;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  char isEqualToString;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  NSObject *v84;
  NSObject *v85;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  objc_super v94;
  uint8_t buf[4];
  const __CFString *v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v94.receiver = self;
  v94.super_class = (Class)CKNotificationListener;
  v8 = -[CKNotificationListener init](&v94, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.cloudkit.notification-listener", v9);
    isa = v8[1].isa;
    v8[1].isa = v10;

    dispatch_queue_set_specific((dispatch_queue_t)v8[1].isa, &v8[1], (void *)1, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.cloudkit.notification-listener.callback", v12);
    info = (void *)v8[1].info;
    v8[1].info = (uint64_t)v13;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    length = (void *)v8->length;
    v8->length = v18;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    data = v8[1].data;
    v8[1].data = (char *)v23;

    v8[1].length = a3;
    v28 = objc_msgSend_copy(v7, v25, v26, v27);
    v29 = v8->data;
    v8->data = (char *)v28;

    LOBYTE(v8->info) = 0;
    v33 = v8[1].length;
    if (v33)
    {
      if (v33 == 1)
      {
        objc_msgSend_bundleRecordForCurrentProcess(MEMORY[0x1E0CA5898], v30, v31, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_sharedManager(CKProcessScopedStateManager, v35, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_untrustedEntitlements(v38, v39, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_apsEnvironmentEntitlement(v42, v43, v44, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lowercaseString(v46, v47, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (v50)
          {
            v54 = *MEMORY[0x1E0CFE130];
            objc_msgSend_lowercaseString((void *)*MEMORY[0x1E0CFE130], v51, v52, v53);
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isEqualToString_(v50, v55, (uint64_t)v4, v56))
            {

            }
            else
            {
              while (1)
              {
                v69 = *MEMORY[0x1E0CFE128];
                objc_msgSend_lowercaseString((void *)*MEMORY[0x1E0CFE128], v57, v58, v59);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                isEqualToString = objc_msgSend_isEqualToString_(v50, v71, (uint64_t)v70, v72);

                if ((isEqualToString & 1) != 0)
                  break;
                if (ck_log_initialization_predicate != -1)
                  dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                v87 = ck_log_facility_ck;
                if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138413058;
                  v96 = CFSTR("aps-environment");
                  v97 = 2112;
                  v98 = v54;
                  v99 = 2112;
                  v100 = v69;
                  v101 = 2112;
                  v102 = v50;
                  _os_log_error_impl(&dword_18A5C5000, v87, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF CLOUDKIT: CloudKit push notifications require the '%@' entitlement to be '%@' or '%@'. Current value='%@'", buf, 0x2Au);
                }
                objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v88, (uint64_t)CFSTR("BUG IN CLIENT OF CLOUDKIT: CloudKit push notifications require the '%@' entitlement to be '%@' or '%@'. Current value='%@'"), v89, CFSTR("aps-environment"), v54, v69, v50);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_UTF8String(v90, v91, v92, v93);
                _os_crash();
                __break(1u);
LABEL_31:
                dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
LABEL_10:
                v7 = ck_log_facility_ck;
                v8 = CFSTR("aps-connection-initiate");
                if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v96 = CFSTR("aps-connection-initiate");
                  _os_log_error_impl(&dword_18A5C5000, v7, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF CLOUDKIT: Not entitled to listen to push notifications. Please add the '%@' entitlement.", buf, 0xCu);
                }
                objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v63, (uint64_t)CFSTR("BUG IN CLIENT OF CLOUDKIT: Not entitled to listen to push notifications. Please add the '%@' entitlement."), v64, CFSTR("aps-connection-initiate"));
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_UTF8String(v65, v66, v67, v68);
                _os_crash();
                __break(1u);
              }
            }
          }
          objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v51, v52, v53);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_infoDictionary(v74, v75, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v78, v79, (uint64_t)CFSTR("UIBackgroundModes"), v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend_containsObject_(v81, v82, (uint64_t)CFSTR("remote-notification"), v83) & 1) == 0)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v84 = ck_log_facility_notification_listener;
            if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_18A5C5000, v84, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF CLOUDKIT: CloudKit push notifications require the 'remote-notification' background mode in your info plist.", buf, 2u);
            }
          }

        }
      }
    }
    else
    {
      objc_msgSend_sharedManager(CKProcessScopedStateManager, v30, v31, v32);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_untrustedEntitlements(v50, v60, v61, v62);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = sub_18A5CD440(v34);

      if ((v54 & 1) == 0)
      {
        if (ck_log_initialization_predicate == -1)
          goto LABEL_10;
        goto LABEL_31;
      }
    }
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v85 = ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v96 = v8;
    _os_log_impl(&dword_18A5C5000, v85, OS_LOG_TYPE_INFO, "Init notification listener %@", buf, 0xCu);
  }

  return (CKNotificationListener *)v8;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  CKNotificationListener *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v3 = ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = self;
    _os_log_impl(&dword_18A5C5000, v3, OS_LOG_TYPE_INFO, "Dealloc notification listener %@", buf, 0xCu);
  }
  if (self->_strategy == 1)
  {
    objc_msgSend_sharedPushRegistry(CKPKPushRegistry, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeDelegate_(v7, v8, (uint64_t)self, v9);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend_notificationObservers(self, v4, v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v12)
  {
    v16 = v12;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v10);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v13, v14, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObserver_(v20, v21, v19, v22);

      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v16);
  }

  v23.receiver = self;
  v23.super_class = (Class)CKNotificationListener;
  -[CKNotificationListener dealloc](&v23, sel_dealloc);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  OS_dispatch_queue **p_queue;
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  if (self)
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v4, self->_strategy, v5);
  else
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v4, 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v6, v8, (uint64_t)CFSTR("strategy"), (uint64_t)v7, 0);

  objc_msgSend_machServiceName(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v6, v13, (uint64_t)CFSTR("machServiceName"), (uint64_t)v12, 0);

  objc_msgSend_queue(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  p_queue = &self->_queue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_18A6ECDDC;
  v20[3] = &unk_1E1F61A48;
  v20[4] = self;
  v21 = v6;
  v19 = v6;
  ck_call_or_dispatch_sync_if_not_key(v17, p_queue, v20);

}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKNotificationListener *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKNotificationListener *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (BOOL)hasInitializedAPSConnection
{
  uint64_t v2;
  uint64_t v3;
  CKNotificationListener *v4;
  NSObject *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = self;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend_queue(self, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A6ECF04;
  v7[3] = &unk_1E1F5F758;
  v7[4] = v4;
  v7[5] = &v8;
  dispatch_sync(v5, v7);

  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

- (BOOL)useOpportunisticPushTopics
{
  uint64_t v2;
  uint64_t v3;
  CKNotificationListener *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = self;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend_queue(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18A6ED018;
  v7[3] = &unk_1E1F5F758;
  v7[4] = v4;
  v7[5] = &v8;
  ck_call_or_dispatch_sync_if_not_key(v5, &v4->_queue, v7);

  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

- (void)setUseOpportunisticPushTopics:(BOOL)a3
{
  uint64_t v3;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  _QWORD block[5];
  BOOL v13;

  if (self && self->_strategy)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v6, v10, v7, (uint64_t)CFSTR("Cannot use opportunistic push topics for %@ outside of a daemon."), v9);

  }
  objc_msgSend_queue(self, a2, a3, v3);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A6ED108;
  block[3] = &unk_1E1F61A70;
  block[4] = self;
  v13 = a3;
  dispatch_sync(v11, block);

}

- (void)registerForSubscriptionWithID:(id)a3 inDatabase:(id)a4 handler:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel__registerForSubscriptionWithID_inDatabase_handler_completionHandler_, a3, a4);
}

- (void)_registerForSubscriptionWithID:(id)a3 inDatabase:(id)a4 handler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  void *v25;
  char v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  CKException *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  id v55;
  _QWORD block[4];
  id v57;
  id v58;
  CKNotificationListener *v59;
  id v60;
  id v61;
  id v62;
  _QWORD *v63;
  _QWORD v64[4];
  NSObject *v65;
  _QWORD *v66;
  _QWORD v67[5];
  id v68;
  os_activity_scope_state_s state;
  id v70;
  id v71;
  id v72;
  id v73[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_container(v11, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = 0;
  v18 = _CKCheckArgument((uint64_t)"database", v11, 0, 0, 0, v73);
  v19 = v73[0];
  v20 = v19;
  if ((v18 & 1) == 0)
    goto LABEL_6;

  v72 = 0;
  v21 = _CKCheckArgument((uint64_t)"container", v17, 0, 0, 0, &v72);
  v22 = v72;
  v20 = v22;
  if ((v21 & 1) == 0)
    goto LABEL_6;

  v71 = 0;
  v23 = _CKCheckArgument((uint64_t)"subscriptionID", v10, 0, 0, 0, &v71);
  v24 = v71;
  v20 = v24;
  if ((v23 & 1) == 0
    || (v24,
        v25 = _Block_copy(v12),
        v70 = 0,
        v26 = _CKCheckArgument((uint64_t)"handler", v25, 0, 0, 0, &v70),
        v20 = v70,
        v25,
        (v26 & 1) == 0))
  {
LABEL_6:
    v45 = [CKException alloc];
    v49 = objc_msgSend_code(v20, v46, v47, v48);
    objc_msgSend_localizedDescription(v20, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (id)objc_msgSend_initWithCode_format_(v45, v54, v49, (uint64_t)CFSTR("%@"), v53);

    objc_exception_throw(v55);
  }

  v27 = _os_activity_create(&dword_18A5C5000, "client/notification-listener-register", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v27, &state);
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = sub_18A6ED790;
  v67[4] = sub_18A6ED7A0;
  v68 = 0;
  objc_msgSend_queue(self, v28, v29, v30);
  v31 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v31);
  v32 = MEMORY[0x1E0C809B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = sub_18A6ED7A8;
  v64[3] = &unk_1E1F61A98;
  v66 = v67;
  v33 = v31;
  v65 = v33;
  objc_msgSend_pushEnvironmentWithCompletionHandler_(v17, v34, (uint64_t)v64, v35);
  objc_msgSend_queue(self, v36, v37, v38);
  v39 = objc_claimAutoreleasedReturnValue();
  block[0] = v32;
  block[1] = 3221225472;
  block[2] = sub_18A6ED808;
  block[3] = &unk_1E1F61AC0;
  v57 = v10;
  v58 = v11;
  v59 = self;
  v60 = v17;
  v62 = v13;
  v63 = v67;
  v61 = v12;
  v40 = v13;
  v41 = v12;
  v42 = v17;
  v43 = v11;
  v44 = v10;
  dispatch_async(v39, block);

  _Block_object_dispose(v67, 8);
  os_activity_scope_leave(&state);

}

- (void)unregisterForSubscriptionWithID:(id)a3 inDatabase:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__unregisterForSubscriptionWithID_inDatabase_completionHandler_, a3, a4);
}

- (void)_unregisterForSubscriptionWithID:(id)a3 inDatabase:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  CKException *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  CKNotificationListener *v38;
  id v39;
  os_activity_scope_state_s state;
  id v41;
  id v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v42 = 0;
  v11 = _CKCheckArgument((uint64_t)"database", v9, 0, 0, 0, &v42);
  v12 = v42;
  v13 = v12;
  if ((v11 & 1) == 0
    || (v12,
        v41 = 0,
        v14 = _CKCheckArgument((uint64_t)"subscriptionID", v8, 0, 0, 0, &v41),
        v15 = v41,
        v13 = v15,
        (v14 & 1) == 0))
  {
    v24 = [CKException alloc];
    v28 = objc_msgSend_code(v13, v25, v26, v27);
    objc_msgSend_localizedDescription(v13, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend_initWithCode_format_(v24, v33, v28, (uint64_t)CFSTR("%@"), v32);

    objc_exception_throw(v34);
  }

  v16 = _os_activity_create(&dword_18A5C5000, "client/notification-listener-unregister", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  objc_msgSend_queue(self, v17, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A6EDCF8;
  block[3] = &unk_1E1F61AE8;
  v36 = v8;
  v37 = v9;
  v38 = self;
  v39 = v10;
  v21 = v10;
  v22 = v9;
  v23 = v8;
  dispatch_async(v20, block);

  os_activity_scope_leave(&state);
}

- (BOOL)isRegisteredForSubscriptionWithID:(id)a3 inDatabase:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend_queue(self, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18A6EDF40;
  v15[3] = &unk_1E1F61B10;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v18 = &v19;
  v12 = v7;
  v13 = v6;
  dispatch_sync(v11, v15);

  LOBYTE(v11) = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return (char)v11;
}

- (id)uniqueKeyForSubscriptionID:(id)a3 inDatabase:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;

  v5 = a4;
  v6 = a3;
  objc_msgSend_container(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v10, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_environment(v18, v19, v20, v21);

  v23 = (void *)MEMORY[0x1E0CB3940];
  v27 = objc_msgSend_databaseScope(v5, v24, v25, v26);

  objc_msgSend_stringWithFormat_(v23, v28, (uint64_t)CFSTR("%@-%d-%d-%@"), v29, v14, v22, v27, v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_options(v10, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountOverrideInfo(v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_email(v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend_email(v38, v43, v44, v45);
    v46 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_accountID(v38, v43, v44, v45);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      objc_msgSend_accountID(v38, v50, v51, v52);
      v46 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_altDSID(v38, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v53)
        goto LABEL_9;
      objc_msgSend_altDSID(v38, v54, v55, v56);
      v46 = objc_claimAutoreleasedReturnValue();
    }
  }
  v57 = (void *)v46;
  if (v46)
  {
    objc_msgSend_stringByAppendingFormat_(v30, v47, (uint64_t)CFSTR("-%@"), v48, v46);
    v58 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v58;
  }
LABEL_9:

  return v30;
}

- (id)apsConnectionForEnvironment:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_18A6ED790;
  v19 = sub_18A6ED7A0;
  v20 = 0;
  objc_msgSend_queue(self, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A6EE24C;
  block[3] = &unk_1E1F61B38;
  v13 = v4;
  v14 = &v15;
  block[4] = self;
  v9 = v4;
  dispatch_sync(v8, block);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v7 = ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138543362;
    v9 = v6;
    _os_log_debug_impl(&dword_18A5C5000, v7, OS_LOG_TYPE_DEBUG, "APS connection received public token: %{public}@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *apsConnections;
  NSMutableDictionary *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *, _BYTE *);
  void *v31;
  id v32;
  _BYTE *v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v8 = (void *)ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEBUG))
  {
    v19 = v8;
    objc_msgSend_topic(v7, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userInfo(v7, v24, v25, v26);
    v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2112;
    v35 = v27;
    _os_log_debug_impl(&dword_18A5C5000, v19, OS_LOG_TYPE_DEBUG, "%p APS connection received incoming message on topic %@: %@", buf, 0x20u);

  }
  objc_msgSend_userInfo(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = sub_18A6ED790;
  v36 = sub_18A6ED7A0;
  v37 = (id)*MEMORY[0x1E0CFE130];
  if (self)
    apsConnections = self->_apsConnections;
  else
    apsConnections = 0;
  v14 = apsConnections;
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = sub_18A6EF170;
  v31 = &unk_1E1F61BD8;
  v15 = v6;
  v32 = v15;
  v33 = buf;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v14, v16, (uint64_t)&v28, v17);

  objc_msgSend_handlePushNotificationWithPayload_environment_completionHandler_(self, v18, (uint64_t)v12, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 0, v28, v29, v30, v31);
  _Block_object_dispose(buf, 8);

}

- (void)handlePushNotificationWithPayload:(id)a3 completionHandler:(id)a4
{
  objc_msgSend_handlePushNotificationWithPayload_environment_completionHandler_(self, a2, (uint64_t)a3, 0, a4);
}

- (void)handlePushNotificationWithPayload:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  OS_dispatch_queue **p_queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  CKNotificationListener *v23;
  id v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)os_transaction_create();
  objc_msgSend_queue(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  p_queue = &self->_queue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_18A6EF308;
  v21[3] = &unk_1E1F61CA0;
  v22 = v8;
  v23 = self;
  v24 = v9;
  v25 = v11;
  v26 = v10;
  v17 = v10;
  v18 = v11;
  v19 = v9;
  v20 = v8;
  ck_call_or_dispatch_async_if_not_key(v15, p_queue, v21);

}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v4 = a4;
  v8 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_debug_impl(&dword_18A5C5000, v6, OS_LOG_TYPE_DEBUG, "APS connection status changed to connected=%d", (uint8_t *)v7, 8u);
  }

}

- (void)connectionDidReconnect:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v4 = ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_18A5C5000, v4, OS_LOG_TYPE_DEBUG, "APS connection did reconnect", v5, 2u);
  }

}

- (void)didReceiveIncomingPushWithPayload:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  CKNotificationListener *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v8 = ck_log_facility_notification_listener;
  if (os_log_type_enabled((os_log_t)ck_log_facility_notification_listener, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_DEFAULT, "%@ received push with payload %@", buf, 0x16u);
  }
  objc_msgSend_dictionaryPayload(v6, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18A6F0394;
  v15[3] = &unk_1E1F61CC8;
  v16 = v7;
  v13 = v7;
  objc_msgSend_handlePushNotificationWithPayload_completionHandler_(self, v14, (uint64_t)v12, (uint64_t)v15);

}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSArray)notificationObservers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNotificationObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_apsConnections, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_subscriptionInfos, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end
