@implementation FTMessageDelivery

+ (Class)HTTPMessageDeliveryClass
{
  return (Class)objc_opt_class();
}

+ (Class)APNSMessageDeliveryClass
{
  return (Class)objc_opt_class();
}

+ (id)alloc
{
  uint64_t v3;
  objc_super v5;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
    return [FTMessageDelivery_HTTP alloc];
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___FTMessageDelivery;
  return objc_msgSendSuper2(&v5, sel_alloc);
}

+ (id)createAPSConnection
{
  id v2;
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  IMGetConferenceSettings();
  v2 = 0;
  v3 = (objc_class *)MEMORY[0x1A85A5DE0](CFSTR("APSConnection"), CFSTR("ApplePushService"));
  v4 = *(id *)MEMORY[0x1A85A5DEC]("APSConnectionOverrideNamedDelegatePort", CFSTR("ApplePushService"));
  v5 = [v3 alloc];
  im_primary_queue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(v5, v7, (uint64_t)v2, v4, v6);

  OSLogHandleForIDSCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v16 = v8;
    v17 = 1024;
    v18 = objc_msgSend_messageSize(v8, v10, v11);
    v19 = 2112;
    v20 = v2;
    _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "Created APSConnection: %p  (Max size: %d  Environment: %@)", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    objc_msgSend_messageSize(v8, v12, v13);
    _IDSLogV();
  }

  return v8;
}

- (FTMessageDelivery)initWithAPSConnection:(id)a3
{
  id v4;
  FTMessageDelivery *v5;
  FTMessageDelivery *v6;
  FTMessageQueue *v7;
  FTMessageQueue *queue;
  const char *v9;
  FTMessageDeliveryAPSConnection *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  FTMessageDeliveryAPSConnection *connection;
  objc_class *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  IDSBAASigner *baaSigner;
  void *v23;
  const char *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTMessageDelivery;
  v5 = -[FTMessageDelivery init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_maxConcurrentMessages = 1;
    v7 = objc_alloc_init(FTMessageQueue);
    queue = v6->_queue;
    v6->_queue = v7;

    objc_msgSend_setDelegate_(v6->_queue, v9, (uint64_t)v6);
    if (v4)
    {
      v10 = (FTMessageDeliveryAPSConnection *)v4;
    }
    else
    {
      v11 = (void *)objc_opt_class();
      objc_msgSend_createAPSConnection(v11, v12, v13);
      v10 = (FTMessageDeliveryAPSConnection *)objc_claimAutoreleasedReturnValue();
    }
    connection = v6->_connection;
    v6->_connection = v10;

    v15 = (objc_class *)MEMORY[0x1A85A5DE0](CFSTR("IDSBAASigner"), CFSTR("IDS"));
    if (v15)
    {
      v18 = [v15 alloc];
      im_primary_queue();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_initWithQueue_(v18, v20, (uint64_t)v19);
      baaSigner = v6->_baaSigner;
      v6->_baaSigner = (IDSBAASigner *)v21;

    }
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v16, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v23, v24, (uint64_t)v6, sel_networkStateChanged, *MEMORY[0x1E0D366D0], 0);

  }
  return v6;
}

- (FTMessageDelivery)init
{
  return (FTMessageDelivery *)objc_msgSend_initWithAPSConnection_(self, a2, 0);
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  objc_super v13;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, 0, 0);

  objc_msgSend__clearRetryTimer(self, v6, v7);
  objc_msgSend_setDelegate_(self->_queue, v8, 0);
  objc_msgSend_removeAllMessages(self->_queue, v9, v10);
  objc_msgSend_removeAllObjects(self->_observerMap, v11, v12);
  v13.receiver = self;
  v13.super_class = (Class)FTMessageDelivery;
  -[FTMessageDelivery dealloc](&v13, sel_dealloc);
}

- (void)addRequestObserver:(id)a3
{
  const char *v4;
  uint64_t v5;
  NSHashTable *observerMap;
  NSHashTable *v7;
  NSHashTable *v8;
  char *v9;

  v4 = (const char *)a3;
  observerMap = self->_observerMap;
  v9 = (char *)v4;
  if (!observerMap)
  {
    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v4, v5);
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_observerMap;
    self->_observerMap = v7;

    v4 = v9;
    observerMap = self->_observerMap;
  }
  objc_msgSend_addObject_(observerMap, v4, (uint64_t)v4);

}

- (NSNumber)protocolVersion
{
  return 0;
}

+ (id)_errorForTDMessageDeliveryStatus:(int64_t)a3 userInfo:(id)a4
{
  const char *v5;
  id v6;

  v6 = a4;
  if (a3)
  {
    if (a3 == 1)
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)CFSTR("FTMessageDeliveryNoResultCodeError"), 1, v6);
    else
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v5, (uint64_t)FTErrorDomain, a3, v6);
    a3 = objc_claimAutoreleasedReturnValue();
  }

  return (id)a3;
}

- (void)_informDelegateAboutMessage:(id)a3 error:(id)a4 result:(id)a5 resultCode:(int64_t)a6 interface:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  NSHashTable *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v39 = v14;
  if (v13)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend_domain(v13, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_code(v13, v19, v20);
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v22, (uint64_t)v18, v21, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v15, a6, v14);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = self->_observerMap;
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v40, v44, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v41 != v27)
          objc_enumerationMutation(v23);
        v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v32 = (void *)objc_msgSend_copy(v12, v30, v31);
          objc_msgSend_completedRequest_resultCode_interface_(v29, v33, (uint64_t)v32, a6, a7);

        }
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v30, (uint64_t)&v40, v44, 16);
    }
    while (v26);
  }

  objc_msgSend_completionBlock(v12, v34, v35);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  if (v36)
    (*(void (**)(uint64_t, id, void *, int64_t, void *))(v36 + 16))(v36, v12, v38, a6, v39);

}

- (BOOL)_sendMessageAsynchronously:(id)a3 error:(id *)a4
{
  return 1;
}

- (NSArray)queuedMessages
{
  uint64_t v2;

  return (NSArray *)objc_msgSend_messages(self->_queue, a2, v2);
}

- (IDSBaseMessage)currentMessage
{
  uint64_t v2;

  return (IDSBaseMessage *)objc_msgSend_topMessage(self->_queue, a2, v2);
}

- (BOOL)busy
{
  return 0;
}

- (BOOL)hasQueuedItems
{
  uint64_t v2;

  return objc_msgSend_count(self->_queue, a2, v2) > 0;
}

- (id)_queue
{
  return self->_queue;
}

- (BOOL)sendMessage:(id)a3
{
  return 0;
}

- (void)_retryTimerHit:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  IMTimer *timer;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  uint8_t buf[4];
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_invalidate(self->_timer, v5, v6);
  timer = self->_timer;
  self->_timer = 0;

  OSLogHandleForIDSCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, "Should retry!", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
      MarcoLog();
    if (IMShouldLog())
      IMLogString();
  }
  if (objc_msgSend_logToRegistration(self, v9, v10))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v13, OS_LOG_TYPE_DEFAULT, "...Should retry", buf, 2u);
    }

  }
  objc_msgSend_topMessage(self->_queue, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  if (v14)
  {
    objc_msgSend_retryCount(v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_integerValue(v18, v19, v20);

    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v22, v21 + 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRetryCount_(v17, v24, (uint64_t)v23);

    v36 = 0;
    LOBYTE(v21) = objc_msgSend__sendMessageAsynchronously_error_(self, v25, (uint64_t)v17, &v36);
    v26 = v36;
    if ((v21 & 1) == 0)
    {
      OSLogHandleForIDSCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v26;
        _os_log_impl(&dword_1A4C7F000, v27, OS_LOG_TYPE_ERROR, "Failed retrying message: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        v35 = v26;
        _IDSLogTransport();
      }
      if (objc_msgSend_logToRegistration(self, v28, v29, v35))
      {
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v30, v31);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4C7F000, v32, OS_LOG_TYPE_DEFAULT, "...Failed retrying", buf, 2u);
        }

      }
    }
LABEL_25:

    goto LABEL_26;
  }
  if (objc_msgSend_logToRegistration(self, v15, v16))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v33, v34);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v26, OS_LOG_TYPE_DEFAULT, "No message to retry -- returning", buf, 2u);
    }
    goto LABEL_25;
  }
LABEL_26:

}

- (void)_clearRetryTimer
{
  uint64_t v2;
  IMTimer *timer;

  objc_msgSend_invalidate(self->_timer, a2, v2);
  timer = self->_timer;
  self->_timer = 0;

}

- (void)_setRetryTimer:(double)a3
{
  uint64_t v3;
  id v6;
  const char *v7;
  IMTimer *shouldWake_target_selector_userInfo;
  IMTimer *timer;

  objc_msgSend__clearRetryTimer(self, a2, v3);
  v6 = objc_alloc(MEMORY[0x1E0D36AE0]);
  shouldWake_target_selector_userInfo = (IMTimer *)objc_msgSend_initWithTimeInterval_name_shouldWake_target_selector_userInfo_(v6, v7, (uint64_t)CFSTR("com.apple.imagent.http-delivery"), 1, self, sel__retryTimerHit_, 0, a3);
  timer = self->_timer;
  self->_timer = shouldWake_target_selector_userInfo;

}

- (int64_t)maxMessageSize
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)maxLargeMessageSize
{
  return ((uint64_t (*)(FTMessageDelivery *, char *))MEMORY[0x1E0DE7D20])(self, sel_maxMessageSize);
}

- (void)networkStateChanged
{
  NSObject *v2;
  uint8_t v3[16];

  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A4C7F000, v2, OS_LOG_TYPE_DEFAULT, "Network state changed", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLog())
      _IDSLogV();
  }
}

- (void)_correctServerTimestampForDriftOnMessage:(id)a3 currentDate:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  int v57;
  void *v58;
  __int16 v59;
  double v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend_serverTimestamp(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9)
  {
    v13 = v9;
  }
  else
  {
    objc_msgSend_ftMessageDeliveryServerTimestamp(MEMORY[0x1E0D36AF8], v10, v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend_serverTimestampReceivedDate(v5, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17;
  if (v17)
  {
    v21 = v17;
  }
  else
  {
    objc_msgSend_ftMessageDeliveryServerTimestampReceivedDate(MEMORY[0x1E0D36AF8], v18, v19);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  if (v14)
  {
    objc_msgSend_timeIntervalSince1970(v6, v23, v24);
    v26 = v25;
    objc_msgSend_doubleValue(v22, v27, v28);
    v32 = v26 - v31;
    if (v26 - v31 > 0.0)
    {
      v33 = v31;
      objc_msgSend_doubleValue(v14, v29, v30);
      v35 = v34 / 1000.0;
      v36 = v32 + v34 / 1000.0;
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v37, v38, v36 * 1000.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setServerTimestamp_(v5, v40, (uint64_t)v39);

      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v41, v42, v26);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setServerTimestampReceivedDate_(v5, v44, (uint64_t)v43);

      objc_msgSend_nonce(MEMORY[0x1E0D36AA8], v45, v46);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v48, v49, v33);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v51, v52, v35);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v54, v55, v36);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 138413058;
        v58 = v50;
        v59 = 2048;
        v60 = v32;
        v61 = 2112;
        v62 = v53;
        v63 = 2112;
        v64 = v56;
        _os_log_impl(&dword_1A4C7F000, v47, OS_LOG_TYPE_DEFAULT, "Timestamp received %@, delta %f servertimestamp %@ newServerTimestamp %@", (uint8_t *)&v57, 0x2Au);

      }
    }
  }

}

- (void)_signMessage:(id)a3 useDataSignatures:(BOOL)a4 body:(id)a5 queryString:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void (**v35)(_QWORD);
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  int isInitializedForSigning;
  const char *v46;
  uint64_t v47;
  void *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  id v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  id v70;
  id v71;
  id v72;
  _QWORD block[5];
  id v74;
  id v75;
  id v76;
  void (**v77)(_QWORD);
  _QWORD v78[4];
  id v79;
  id v80;
  void (**v81)(_QWORD);
  id v82;
  id v83;
  _QWORD v84[5];
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  BOOL v91;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend_wantsBodySignature(v12, v16, v17))
    v18 = v13;
  else
    v18 = 0;
  v19 = v18;
  if (objc_msgSend_wantsBAASigning(v12, v20, v21))
    v22 = v13;
  else
    v22 = 0;
  v71 = v22;
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_bagKey(v12, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(MEMORY[0x1E0C99D68], v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__correctServerTimestampForDriftOnMessage_currentDate_(self, v30, (uint64_t)v12, v29);

  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = sub_1A4C84BE8;
  v84[3] = &unk_1E4DD9590;
  v84[4] = self;
  v31 = v12;
  v85 = v31;
  v91 = a4;
  v32 = v26;
  v86 = v32;
  v72 = v14;
  v87 = v72;
  v33 = v19;
  v88 = v33;
  v34 = v23;
  v89 = v34;
  v70 = v15;
  v90 = v70;
  v35 = (void (**)(_QWORD))MEMORY[0x1A85A6380](v84);
  objc_msgSend_signingSession(v31, v36, v37);
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38
    && (v41 = (void *)v38,
        objc_msgSend_signingSession(v31, v39, v40),
        v42 = (void *)objc_claimAutoreleasedReturnValue(),
        isInitializedForSigning = objc_msgSend_isInitializedForSigning(v42, v43, v44),
        v42,
        v41,
        isInitializedForSigning))
  {
    if (objc_msgSend_wantsBodySigningOnly(v31, v39, v40))
    {
      objc_msgSend_serverTimestamp(v31, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = 0;
      _FTGenerateDigestForSigningFromPayload(2, v33, v48, 0, &v83);
      v49 = v83;
    }
    else
    {
      objc_msgSend_pushToken(v31, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_serverTimestamp(v31, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0;
      _FTGenerateDigestForSigningFromComponents(2, v32, v72, v48, v33, v59, 0, &v82);
      v49 = v82;

    }
    v56 = v71;

    v60 = objc_alloc(MEMORY[0x1E0D34CB8]);
    objc_msgSend_serverTimestamp(v31, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend_initWithSHA256Digest_requestBody_serverTimestamp_(v60, v64, (uint64_t)v49, v33, v63);

    objc_msgSend_signingSession(v31, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = sub_1A4C859F4;
    v78[3] = &unk_1E4DD95B8;
    v79 = v31;
    v80 = v34;
    v81 = v35;
    objc_msgSend_headersBySigningData_completion_(v68, v69, (uint64_t)v65, v78);

  }
  else if (objc_msgSend_wantsBAASigning(v31, v39, v40) && _os_feature_enabled_impl())
  {
    objc_msgSend_baaSigner(self, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_queue(v52, v53, v54);
    v55 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A4C85C80;
    block[3] = &unk_1E4DD95E0;
    block[4] = self;
    v56 = v71;
    v74 = v71;
    v75 = v31;
    v76 = v34;
    v77 = v35;
    dispatch_async(v55, block);

  }
  else
  {
    v35[2](v35);
    v56 = v71;
  }

}

- (void)signDataWithPushIdentity:(id)a3 serverTimestamp:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  FTMessageDeliveryAPSConnection *connection;
  const char *v17;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v12 = a5;
  if (qword_1EE788A78 != -1)
    dispatch_once(&qword_1EE788A78, &unk_1E4DD9350);
  if (qword_1EE788A70)
  {
    v13 = objc_alloc_init((Class)qword_1EE788A70);
    objc_msgSend_setData_(v13, v14, (uint64_t)v8);
    objc_msgSend_setTime_(v13, v15, (uint64_t)v9);
    connection = self->_connection;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1A4C8602C;
    v18[3] = &unk_1E4DD9650;
    v19 = v12;
    objc_msgSend_signDataWithDeviceIdentity_withCompletion_(connection, v17, (uint64_t)v13, v18);

  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      sub_1A4CBA1B0(v13);
  }

}

- (BOOL)bagDisablesVMTraffic
{
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  BOOL v7;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v2, v3, (uint64_t)CFSTR("VM-traffic-disabled-version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (int)objc_msgSend_intValue(v4, v5, v6) > 0;

  return v7;
}

- (BOOL)isTrafficDisabledOnVMForMessage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  if (_os_feature_enabled_impl()
    && objc_msgSend_isIDSMessage(v4, v5, v6)
    && IDSIsVirtualMachine())
  {
    v9 = objc_msgSend_bagDisablesVMTraffic(self, v7, v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (BOOL)logToRegistration
{
  return self->_logToRegistration;
}

- (void)setLogToRegistration:(BOOL)a3
{
  self->_logToRegistration = a3;
}

- (unint64_t)maxConcurrentMessages
{
  return self->_maxConcurrentMessages;
}

- (void)setMaxConcurrentMessages:(unint64_t)a3
{
  self->_maxConcurrentMessages = a3;
}

- (BOOL)retryInAirplaneMode
{
  return self->_retryInAirplaneMode;
}

- (void)setRetryInAirplaneMode:(BOOL)a3
{
  self->_retryInAirplaneMode = a3;
}

- (BOOL)disallowRetry
{
  return self->_disallowRetry;
}

- (void)setDisallowRetry:(BOOL)a3
{
  self->_disallowRetry = a3;
}

- (FTMessageDeliveryAPSConnection)connection
{
  return (FTMessageDeliveryAPSConnection *)objc_getProperty(self, a2, 64, 1);
}

- (IDSBAASigner)baaSigner
{
  return (IDSBAASigner *)objc_getProperty(self, a2, 72, 1);
}

- (NSHashTable)observerMap
{
  return (NSHashTable *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerMap, 0);
  objc_storeStrong((id *)&self->_baaSigner, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
