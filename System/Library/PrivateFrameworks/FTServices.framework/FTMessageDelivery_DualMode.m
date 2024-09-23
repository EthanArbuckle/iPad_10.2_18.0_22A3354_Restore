@implementation FTMessageDelivery_DualMode

- (int64_t)_randomPercentageChanceForDualDelivery
{
  return arc4random() % 0x65;
}

- (BOOL)_shouldUseDualDeliveryForMessage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  const char *v41;
  void *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  uint64_t v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((IMGetDomainBoolForKey() & 1) == 0)
  {
    objc_msgSend_topic(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedInstance(MEMORY[0x1E0D34E78], v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v11, v12, (uint64_t)CFSTR("apns-webtunnel-blacklisted-topics"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_containsObject_(v13, v14, (uint64_t)v8))
    {
      OSLogHandleForIDSCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v60 = (uint64_t)v8;
        v61 = 2112;
        v62 = v13;
        _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Message topic (%@) is in the list of blocklisted topics (%@)", buf, 0x16u);
      }

      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
        goto LABEL_78;
      goto LABEL_77;
    }
    objc_msgSend_sharedInstance(MEMORY[0x1E0D34E78], v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v18, v19, (uint64_t)CFSTR("apns-ids-query-min-version"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v21 = v20;
      v24 = objc_msgSend_intValue(v21, v22, v23);
      OSLogHandleForIDSCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v60) = v24;
        _os_log_impl(&dword_1A4C7F000, v25, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with %d Web Tunnel Version", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v58 = v24;
        _IDSLogV();
      }

      v24 = (int)v24;
    }
    else
    {
      OSLogHandleForIDSCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v60 = 0x4000000000000000;
        _os_log_impl(&dword_1A4C7F000, v26, OS_LOG_TYPE_DEFAULT, "Server Bag has no value for Min Version, using the default: %f", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v58 = 0x4000000000000000;
        _IDSLogV();
      }
      v24 = 2;
    }

    _IDSWebTunnelServiceVersionNumber();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_integerValue(v27, v28, v29);

    if (v30 < v24)
    {
      OSLogHandleForIDSCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v33, OS_LOG_TYPE_DEFAULT, "We do not meet the version requirements for web tunnel ID queries", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
        goto LABEL_78;
      goto LABEL_77;
    }
    if (objc_msgSend_importanceLevel(v4, v31, v32) == 2)
    {
      if (objc_msgSend__isInBackoffMode(self, v34, v35))
      {
        OSLogHandleForIDSCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4C7F000, v38, OS_LOG_TYPE_DEFAULT, "We are in backoff mode ", buf, 2u);
        }

        if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
          goto LABEL_78;
        goto LABEL_77;
      }
      objc_msgSend_sharedInstance(MEMORY[0x1E0D34E78], v36, v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v40, v41, (uint64_t)CFSTR("apns-ids-query-percentage-2"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v43 = v42;
        v46 = objc_msgSend_intValue(v43, v44, v45);
        OSLogHandleForIDSCategory();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v60) = v46;
          _os_log_impl(&dword_1A4C7F000, v47, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with %d Web Tunnel Percentage", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v58 = v46;
          _IDSLogV();
        }

        if (!(_DWORD)v46)
        {
          OSLogHandleForIDSCategory();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4C7F000, v56, OS_LOG_TYPE_DEFAULT, "Server gave us 0 quota to use this feature", buf, 2u);
          }

          if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
            goto LABEL_78;
          goto LABEL_77;
        }
        v50 = (int)v46;
      }
      else
      {
        OSLogHandleForIDSCategory();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v60 = 0x4059000000000000;
          _os_log_impl(&dword_1A4C7F000, v51, OS_LOG_TYPE_DEFAULT, "Server Bag has no value for percentage, using the default: %f percentage", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v58 = 0x4059000000000000;
          _IDSLogV();
        }

        v50 = 100;
      }
      v52 = objc_msgSend__randomPercentageChanceForDualDelivery(self, v48, v49, v58);
      OSLogHandleForIDSCategory();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v60 = v52;
        _os_log_impl(&dword_1A4C7F000, v53, OS_LOG_TYPE_DEFAULT, "Diceroll Was %ld", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV();
      if (v52 <= v50)
      {
        OSLogHandleForIDSCategory();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4C7F000, v55, OS_LOG_TYPE_DEFAULT, "Diceroll Sucesss, dual query will be performed", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          _IDSLogV();
        v7 = 1;
        goto LABEL_79;
      }
      OSLogHandleForIDSCategory();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v54, OS_LOG_TYPE_DEFAULT, "Diceroll failed", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
      {
LABEL_78:
        v7 = 0;
LABEL_79:

        goto LABEL_80;
      }
    }
    else
    {
      OSLogHandleForIDSCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v39, OS_LOG_TYPE_DEFAULT, "This query is not important enough to perform a web tunnel ID query", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
        goto LABEL_78;
    }
LABEL_77:
    _IDSLogV();
    goto LABEL_78;
  }
  v7 = 1;
LABEL_80:

  return v7;
}

- (BOOL)_isInBackoffMode
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  void *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = IMGetAppIntForKey();
  if (v2 < 1)
    return 0;
  v3 = v2;
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "We have a cached vale for server backoff mode", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  objc_msgSend_date(MEMORY[0x1E0C99D68], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v8, v9, (double)v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForIDSCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v10;
    _os_log_impl(&dword_1A4C7F000, v11, OS_LOG_TYPE_DEFAULT, "Back off End Date is %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v24 = v10;
    _IDSLogV();
  }
  objc_msgSend_dateByAddingTimeInterval_(v7, v12, v13, 3600.0, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_earlierDate_(v10, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_timeIntervalSinceNow(v16, v17, v18);
  v20 = v19 >= 0.0;
  if (v19 < 0.0)
  {
    OSLogHandleForIDSCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v22, OS_LOG_TYPE_DEFAULT, "Back off Interval is in the past, we are good to go", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
    IMRemoveAppValueForKey();
  }
  else
  {
    OSLogHandleForIDSCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v21, OS_LOG_TYPE_DEFAULT, "Back off Interval is in the future, we are in backoff", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
  }

  return v20;
}

- (void)_enterBackOffMode
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend_date(MEMORY[0x1E0C99D68], a2, v2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateByAddingTimeInterval_(v12, v3, v4, 3600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timeIntervalSinceReferenceDate(v5, v7, v8);
  objc_msgSend_numberWithDouble_(v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetAppValueForKey();

}

- (FTMessageDelivery_DualMode)initWithPreferedType:(int64_t)a3
{
  const char *v3;
  uint64_t v4;
  FTMessageDelivery_DualMode *v5;
  FTMessageDelivery *v6;
  FTMessageDelivery *apsDelivery;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  FTMessageDelivery *httpDelivery;
  const char *v17;
  FTMessageQueue *v18;
  FTMessageQueue *dualModeQueue;
  const char *v20;
  const char *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FTMessageDelivery_DualMode;
  v5 = -[FTMessageDelivery_DualMode init](&v23, sel_init, a3);
  if (v5)
  {
    v6 = (FTMessageDelivery *)objc_alloc_init((Class)objc_msgSend_APNSMessageDeliveryClass(FTMessageDelivery, v3, v4));
    apsDelivery = v5->_apsDelivery;
    v5->_apsDelivery = v6;

    v10 = objc_alloc((Class)objc_msgSend_HTTPMessageDeliveryClass(FTMessageDelivery, v8, v9));
    objc_msgSend_connection(v5->_apsDelivery, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_initWithAPSConnection_(v10, v14, (uint64_t)v13);
    httpDelivery = v5->_httpDelivery;
    v5->_httpDelivery = (FTMessageDelivery *)v15;

    objc_msgSend_setMaxConcurrentMessages_(v5->_apsDelivery, v17, 8);
    v18 = objc_alloc_init(FTMessageQueue);
    dualModeQueue = v5->_dualModeQueue;
    v5->_dualModeQueue = v18;

    objc_msgSend_setDelegate_(v5->_dualModeQueue, v20, (uint64_t)v5);
    objc_msgSend_setUserAgent_(v5, v21, (uint64_t)CFSTR("com.apple.identityservicesd"));
  }
  return v5;
}

- (void)setUserAgent:(id)a3
{
  const char *v5;
  const char *v6;
  id v7;

  objc_storeStrong((id *)&self->_userAgentString, a3);
  v7 = a3;
  objc_msgSend_setUserAgent_(self->_httpDelivery, v5, (uint64_t)v7);
  objc_msgSend_setUserAgent_(self->_apsDelivery, v6, (uint64_t)v7);

}

- (void)addRequestObserver:(id)a3
{
  FTMessageDelivery *httpDelivery;
  const char *v5;
  const char *v6;
  id v7;

  httpDelivery = self->_httpDelivery;
  v7 = a3;
  objc_msgSend_addRequestObserver_(httpDelivery, v5, (uint64_t)v7);
  objc_msgSend_addRequestObserver_(self->_apsDelivery, v6, (uint64_t)v7);

}

- (void)sendMessage:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "Incoming request to send a dualMode message %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v9 = v4;
    _IDSLogV();
  }
  objc_msgSend_addMessage_(self->_dualModeQueue, v6, (uint64_t)v4, v9);
  objc_msgSend_dequeueMessageIfNeeded(self, v7, v8);

}

- (void)cancelMessage:(id)a3
{
  FTMessageDelivery *apsDelivery;
  const char *v5;
  const char *v6;
  id v7;

  apsDelivery = self->_apsDelivery;
  v7 = a3;
  objc_msgSend_cancelMessage_(apsDelivery, v5, (uint64_t)v7);
  objc_msgSend_cancelMessage_(self->_httpDelivery, v6, (uint64_t)v7);

}

- (void)dequeueMessageIfNeeded
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  uint8_t *v17;
  const char *v18;
  uint64_t v19;
  uint8_t v20[2];
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t buf[16];

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v3, OS_LOG_TYPE_DEFAULT, "Dequeing message if needed", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    _IDSLogV();
  if (objc_msgSend_count(self->_dualModeQueue, v4, v5) >= 1)
  {
    objc_msgSend_dequeueTopMessage(self->_dualModeQueue, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_allowDualDelivery(v8, v9, v10))
    {
      OSLogHandleForIDSCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1A4C7F000, v11, OS_LOG_TYPE_DEFAULT, "Message Allow Dual Delivery", v22, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV();
      if (objc_msgSend__shouldUseDualDeliveryForMessage_(self, v12, (uint64_t)v8))
      {
        OSLogHandleForIDSCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_1A4C7F000, v13, OS_LOG_TYPE_DEFAULT, "Server says yes for APS delivery, lets go ahead and use that", v21, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLog())
            _IDSLogV();
        }
        objc_msgSend_setHasAttemptedAPSDelivery_(v8, v14, 1);
        objc_msgSend_handleTranslationAndDeliveryOnAPS_(self, v15, (uint64_t)v8);
LABEL_29:

        return;
      }
      OSLogHandleForIDSCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          _IDSLogV();
        objc_msgSend_sendMessage_(self->_httpDelivery, v18, (uint64_t)v8, v19);
        goto LABEL_29;
      }
      *(_WORD *)v20 = 0;
      v17 = v20;
    }
    else
    {
      OSLogHandleForIDSCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      LOWORD(v19) = 0;
      v17 = (uint8_t *)&v19;
    }
    _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "Not allowed to use APS delivery, using HTTP", v17, 2u);
    goto LABEL_25;
  }
}

- (void)handleTranslationAndDeliveryOnAPS:(id)a3
{
  id v4;
  IDSWebTunnelRequestMessage *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  double v16;
  double v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  int v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  BOOL v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  id v85;
  id v86;
  void (**v87)(_QWORD, _QWORD);
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  FTMessageDelivery *apsDelivery;
  const char *v93;
  uint64_t v94;
  _QWORD v95[4];
  id v96;
  id v97;
  FTMessageDelivery_DualMode *v98;
  _QWORD v99[4];
  id v100;
  id v101;
  uint8_t buf[4];
  uint64_t v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [IDSWebTunnelRequestMessage alloc];
  v7 = (void *)objc_msgSend_initWithMessage_(v5, v6, (uint64_t)v4);
  objc_msgSend_sharedInstance(MEMORY[0x1E0D34E78], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v10, v11, (uint64_t)CFSTR("apns-ids-query-wait-time"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = v12;
    objc_msgSend_doubleValue(v13, v14, v15);
    v17 = v16;
    OSLogHandleForIDSCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v103 = *(_QWORD *)&v17;
      _os_log_impl(&dword_1A4C7F000, v18, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with a wait time interval of %f ", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v94 = *(_QWORD *)&v17;
      _IDSLogV();
    }

  }
  else
  {
    OSLogHandleForIDSCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v103 = 0x4024000000000000;
      _os_log_impl(&dword_1A4C7F000, v19, OS_LOG_TYPE_DEFAULT, "Server Bag has no value for wait time interval , using the default: %f interval", buf, 0xCu);
    }

    v17 = 10.0;
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v94 = 0x4024000000000000;
      _IDSLogV();
    }
  }

  objc_msgSend_setTimeout_(v7, v20, v21, v17);
  v24 = objc_msgSend_wantsIDSServer(v4, v22, v23);
  objc_msgSend_setDisableIDSTranslation_(v7, v25, v24 ^ 1u);
  objc_msgSend_messageBodyDataOverride(v4, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend_messageBodyDataOverride(v4, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMessageRequestBodyData_(v7, v32, (uint64_t)v31);
    v33 = 0;
  }
  else
  {
    objc_msgSend_messageBodyUsingCache(v4, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = 0;
    objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v34, (uint64_t)v31, 100, 0, &v101);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v101;
    v33 = (void *)objc_msgSend__FTCopyGzippedData(v35, v37, v38);
    objc_msgSend_setMessageRequestBodyData_(v7, v39, (uint64_t)v33);

  }
  objc_msgSend_sharedInstance(MEMORY[0x1E0D34E78], v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bagKey(v4, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_urlWithKey_(v42, v46, (uint64_t)v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_URLOverride(v4, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend_URLOverride(v4, v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();

    v47 = (void *)v53;
  }
  v54 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_additionalQueryStringParameters(v4, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_count(v57, v58, v59) == 0;

  v63 = MEMORY[0x1E0C809B0];
  if (!v60)
  {
    objc_msgSend_additionalQueryStringParameters(v4, v61, v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v63;
    v99[1] = 3221225472;
    v99[2] = sub_1A4C8880C;
    v99[3] = &unk_1E4DD9698;
    v65 = v54;
    v100 = v65;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v64, v66, (uint64_t)v99);

    if (objc_msgSend_length(v65, v67, v68))
    {
      objc_msgSend_absoluteString(v47, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingFormat_(v71, v72, (uint64_t)CFSTR("?%@"), v65);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v74, (uint64_t)v73);
      v75 = objc_claimAutoreleasedReturnValue();

      v47 = (void *)v75;
    }

  }
  objc_msgSend_absoluteString(v47, v61, v62, v94);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageURL_(v7, v77, (uint64_t)v76);

  objc_msgSend_underlyingService(v4, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTopic_(v7, v81, (uint64_t)v80);

  if (objc_msgSend_length(self->_userAgentString, v82, v83))
    objc_msgSend_setUserAgentOverride_(v7, v84, (uint64_t)self->_userAgentString);
  v95[0] = v63;
  v95[1] = 3221225472;
  v95[2] = sub_1A4C888A8;
  v95[3] = &unk_1E4DD9710;
  v85 = v4;
  v96 = v85;
  v86 = v7;
  v97 = v86;
  v98 = self;
  v87 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85A6380](v95);
  if (objc_msgSend_wantsIDSSignatures(v85, v88, v89))
  {
    apsDelivery = self->_apsDelivery;
    if (objc_msgSend_wantsBodySignature(v85, v90, v91))
      objc_msgSend__signMessage_useDataSignatures_body_queryString_completion_(apsDelivery, v93, (uint64_t)v85, 0, v33, v54, v87);
    else
      objc_msgSend__signMessage_useDataSignatures_body_queryString_completion_(apsDelivery, v93, (uint64_t)v85, 0, 0, v54, v87);
  }
  else
  {
    v87[2](v87, 0);
  }

}

- (void)signDataWithPushIdentity:(id)a3 serverTimestamp:(id)a4 withCompletion:(id)a5
{
  objc_msgSend_signDataWithPushIdentity_serverTimestamp_withCompletion_(self->_apsDelivery, a2, (uint64_t)a3, a4, a5);
}

- (void)queue:(id)a3 hitTimeoutForMessage:(id)a4
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v8 = a4;
  if (objc_msgSend_hasAttemptedAPSDelivery(v8, v5, v6))
    objc_msgSend_sendMessage_(self->_httpDelivery, v7, (uint64_t)v8);

}

- (NSArray)queuedMessages
{
  uint64_t v2;

  return (NSArray *)objc_msgSend_messages(self->_dualModeQueue, a2, v2);
}

- (void)invalidate
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  objc_msgSend_invalidate(self->_httpDelivery, a2, v2);
  objc_msgSend_invalidate(self->_apsDelivery, v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentString, 0);
  objc_storeStrong((id *)&self->_dualModeQueue, 0);
  objc_storeStrong((id *)&self->_apsDelivery, 0);
  objc_storeStrong((id *)&self->_httpDelivery, 0);
}

@end
