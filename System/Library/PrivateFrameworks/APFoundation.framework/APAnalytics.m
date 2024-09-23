@implementation APAnalytics

+ (void)sendEvent:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const __CFString *v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v7 = v3;
  if (v3 && objc_msgSend_length(v3, v4, v5, v6))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("%@.%@"), v9, CFSTR("com.apple.ap.promotedcontent"), v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("dataBOOL");
    v15 = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)&v15, (uint64_t)&v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__analyticsSendEvent_eventPayload_(APAnalytics, v13, (uint64_t)v10, (uint64_t)v12);

  }
  else
  {
    APLogForCategory(2uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v17 = "+[APAnalytics sendEvent:]";
      _os_log_impl(&dword_1CF251000, v10, OS_LOG_TYPE_ERROR, "%{public}s Invalid eventType", buf, 0xCu);
    }
  }

}

+ (void)sendEvent:(id)a3 customPayload:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v10 = v6;
  if (v6
    && objc_msgSend_count(v6, v7, v8, v9)
    && objc_msgSend__validatePayload_(a1, v11, (uint64_t)v10, v12))
  {
    objc_msgSend__sendEvent_payload_(APAnalytics, v13, (uint64_t)v14, (uint64_t)v10);
  }

}

+ (void)_sendEvent:(id)a3 payload:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9 = a4;
  if (v5 && objc_msgSend_length(v5, v6, v7, v8))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("%@.%@"), v11, CFSTR("com.apple.ap.promotedcontent"), v5);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend__analyticsSendEvent_eventPayload_(APAnalytics, v13, (uint64_t)v12, (uint64_t)v9);
  }
  else
  {
    APLogForCategory(2uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380675;
      v15 = "+[APAnalytics _sendEvent:payload:]";
      _os_log_impl(&dword_1CF251000, v12, OS_LOG_TYPE_ERROR, "%{private}s Invalid eventType", buf, 0xCu);
    }
  }

}

+ (void)_analyticsSendEvent:(id)a3 eventPayload:(id)a4
{
  AnalyticsSendEvent();
}

+ (BOOL)_validatePayload:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  BOOL v14;
  NSObject *v15;
  const char *v16;
  uint8_t v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = a3;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v19, (uint64_t)v23, 16);
  if (!v5)
  {
    v14 = 1;
    goto LABEL_22;
  }
  v6 = v5;
  v7 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v3);
      v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        APLogForCategory(2uLL);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_1CF251000, v12, OS_LOG_TYPE_ERROR, "Incorrect key type", v18, 2u);
        }
        goto LABEL_21;
      }
      objc_msgSend_objectForKeyedSubscript_(v3, v10, v9, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        APLogForCategory(2uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v18 = 0;
          v16 = "Nested dictionaries are not supported.";
LABEL_19:
          _os_log_impl(&dword_1CF251000, v15, OS_LOG_TYPE_ERROR, v16, v18, 2u);
        }
LABEL_20:

LABEL_21:
        v14 = 0;
        goto LABEL_22;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        APLogForCategory(2uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v18 = 0;
          v16 = "Nested arrays are not supported.";
          goto LABEL_19;
        }
        goto LABEL_20;
      }

    }
    v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v13, (uint64_t)&v19, (uint64_t)v23, 16);
    v14 = 1;
    if (v6)
      continue;
    break;
  }
LABEL_22:

  return v14;
}

+ (void)sendEventTimed:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 message:(id)a6
{
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  double v14;
  NSObject *v15;
  const char *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  if (a4 && a5)
  {
    objc_msgSend_timeIntervalSinceDate_(a5, v10, (uint64_t)a4, v11);
    if (v14 >= 0.0)
    {
      objc_msgSend_sendEventTimed_roundtrip_message_(a1, v13, a3, (uint64_t)v12);
      goto LABEL_11;
    }
    APLogForCategory(2uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446210;
      v18 = "+[APAnalytics sendEventTimed:startDate:endDate:message:]";
      v16 = "%{public}s Start date is prior to end date";
LABEL_8:
      _os_log_impl(&dword_1CF251000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    APLogForCategory(2uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446210;
      v18 = "+[APAnalytics sendEventTimed:startDate:endDate:message:]";
      v16 = "%{public}s Invalid parameter";
      goto LABEL_8;
    }
  }

LABEL_11:
}

+ (void)sendEventTimed:(int64_t)a3 roundtrip:(double)a4 message:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("%@.%@"), v9, CFSTR("com.apple.ap.promotedcontent"), CFSTR("timed"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend_length(v7, v10, v11, v12))
  {
    v26[0] = CFSTR("code");
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v10, a3, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    v26[1] = CFSTR("roundTrip");
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v15, v16, v17, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = CFSTR("message");
    v27[1] = v18;
    v27[2] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v27, (uint64_t)v26, 3);
  }
  else
  {
    v28[0] = CFSTR("code");
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v10, a3, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = CFSTR("roundTrip");
    v29[0] = v14;
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v20, v21, v22, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v29, (uint64_t)v28, 2);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__analyticsSendEvent_eventPayload_(APAnalytics, v25, (uint64_t)v13, (uint64_t)v24);
}

+ (void)sendEventError:(int64_t)a3 message:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("%@.%@"), v7, CFSTR("com.apple.ap.promotedcontent"), CFSTR("error"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend_length(v5, v8, v9, v10))
  {
    v17[0] = CFSTR("code");
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, a3, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR("message");
    v18[0] = v12;
    v18[1] = v5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v18, (uint64_t)v17, 2);
  }
  else
  {
    v19 = CFSTR("code");
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, a3, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v20, (uint64_t)&v19, 1);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__analyticsSendEvent_eventPayload_(APAnalytics, v16, (uint64_t)v11, (uint64_t)v15);
}

+ (void)sendEvent:(id)a3 valueInt:(int64_t)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("dataInt");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend_numberWithInteger_(v5, v7, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v14, (uint64_t)&v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__sendEvent_payload_(APAnalytics, v12, (uint64_t)v6, (uint64_t)v11);
}

+ (void)sendEvent:(id)a3 valueFloat:(float)a4
{
  void *v5;
  id v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = CFSTR("dataFloat");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  *(float *)&v7 = a4;
  objc_msgSend_numberWithFloat_(v5, v8, v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v16, (uint64_t)&v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__sendEvent_payload_(APAnalytics, v14, (uint64_t)v6, (uint64_t)v13);
}

+ (void)sendEvent:(id)a3 statusDetail:(id)a4 startDate:(id)a5 error:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  int v35;
  const char *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a4;
  v12 = a3;
  objc_msgSend_timeIntervalSinceNow(a5, v13, v14, v15);
  objc_msgSend_numberWithDouble_(v10, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    APLogForCategory(2uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v9, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 136446466;
      v36 = "+[APAnalytics sendEvent:statusDetail:startDate:error:]";
      v37 = 2114;
      v38 = v24;
      _os_log_impl(&dword_1CF251000, v20, OS_LOG_TYPE_ERROR, "%{public}s Received error for timed event %{public}@", (uint8_t *)&v35, 0x16u);

    }
    v25 = &unk_1E8C5BAE0;
  }
  else
  {
    v25 = &unk_1E8C5BAC8;
  }
  v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_setObject_forKeyedSubscript_(v26, v27, (uint64_t)v19, (uint64_t)CFSTR("processingTime"));
  objc_msgSend_setObject_forKeyedSubscript_(v26, v28, (uint64_t)v11, (uint64_t)CFSTR("statusDetails"));

  objc_msgSend_setObject_forKeyedSubscript_(v26, v29, (uint64_t)v25, (uint64_t)CFSTR("statusCode"));
  v33 = (void *)objc_msgSend_copy(v26, v30, v31, v32);
  objc_msgSend_sendEvent_customPayload_(APAnalytics, v34, (uint64_t)v12, (uint64_t)v33);

}

+ (void)sendEventLazy:(id)a3 eventPayloadBuilder:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint8_t buf[16];

  v5 = a3;
  v9 = a4;
  if (v9)
  {
    if (objc_msgSend_length(v5, v6, v7, v8))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("%@.%@"), v11, CFSTR("com.apple.ap.promotedcontent"), v5);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v9;
      AnalyticsSendEventLazy();

    }
    else
    {
      APLogForCategory(2uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CF251000, v12, OS_LOG_TYPE_ERROR, "Invalid eventType", buf, 2u);
      }
    }

  }
}

@end
