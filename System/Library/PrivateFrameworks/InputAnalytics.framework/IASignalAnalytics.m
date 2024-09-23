@implementation IASignalAnalytics

+ (id)xpcClient
{
  void *v2;
  IAXPCClient *v3;
  void *v4;

  v2 = (void *)qword_254343BB8;
  if (!qword_254343BB8)
  {
    v3 = objc_alloc_init(IAXPCClient);
    v4 = (void *)qword_254343BB8;
    qword_254343BB8 = (uint64_t)v3;

    v2 = (void *)qword_254343BB8;
  }
  return v2;
}

+ (void)invalidateConnection
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_invalidateConnection((void *)qword_254343BB8, a2, v2, v3, v4);
  v5 = (void *)qword_254343BB8;
  qword_254343BB8 = 0;

}

+ (void)sendSignal:(id)a3 toChannel:(id)a4 withPayload:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  IASignalAnalyticsObject *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  sub_23F09763C();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_description(v10, v12, v13, v14, v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138478339;
    v35 = v9;
    v36 = 2113;
    v37 = v8;
    v38 = 2117;
    v39 = v33;
    _os_log_debug_impl(&dword_23F08C000, v11, OS_LOG_TYPE_DEBUG, "channel:%{private}@ signal:%{private}@ payload:%{sensitive}@", (uint8_t *)&v34, 0x20u);

  }
  if ((objc_msgSend_checkAndHandleSpecialCasesWithChannel_signal_payload_(a1, v16, (uint64_t)v9, (uint64_t)v8, (uint64_t)v10) & 1) == 0)
  {
    v17 = [IASignalAnalyticsObject alloc];
    v19 = (void *)objc_msgSend_initWithChannel_signal_sessionIdString_payload_(v17, v18, (uint64_t)v9, (uint64_t)v8, 0, v10);
    objc_msgSend_xpcClient(a1, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_server(v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_didAction_(v29, v30, (uint64_t)v19, v31, v32);

  }
}

+ (void)sendSignal:(id)a3 toChannel:(id)a4 withSessionID:(id)a5 withPayload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  IASignalAnalyticsObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  int v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  sub_23F09763C();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_description(v12, v15, v16, v17, v18);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v13, v41, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138478595;
    v47 = v11;
    v48 = 2113;
    v49 = v10;
    v50 = 2113;
    v51 = v40;
    v52 = 2117;
    v53 = v45;
    _os_log_debug_impl(&dword_23F08C000, v14, OS_LOG_TYPE_DEBUG, "channel:%{private}@ signal:%{private}@ sessionID:%{private}@ payload:%{sensitive}@", (uint8_t *)&v46, 0x2Au);

  }
  v19 = [IASignalAnalyticsObject alloc];
  objc_msgSend_UUIDString(v12, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend_initWithChannel_signal_sessionIdString_payload_(v19, v25, (uint64_t)v11, (uint64_t)v10, (uint64_t)v24, v13);

  objc_msgSend_xpcClient(a1, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_server(v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didAction_(v36, v37, (uint64_t)v26, v38, v39);

}

+ (void)sendSignal:(id)a3 toChannel:(id)a4 withUniqueStringID:(id)a5 withPayload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  IASignalAnalyticsObject *v19;
  const char *v20;
  void *v21;
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
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  int v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  sub_23F09763C();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_description(v13, v15, v16, v17, v18);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138478595;
    v37 = v11;
    v38 = 2113;
    v39 = v10;
    v40 = 2113;
    v41 = v12;
    v42 = 2117;
    v43 = v35;
    _os_log_debug_impl(&dword_23F08C000, v14, OS_LOG_TYPE_DEBUG, "channel:%{private}@ signal:%{private}@ uniqueStringId:%{private}@ payload:%{sensitive}@", (uint8_t *)&v36, 0x2Au);

  }
  v19 = [IASignalAnalyticsObject alloc];
  v21 = (void *)objc_msgSend_initWithChannel_signal_sessionIdString_payload_(v19, v20, (uint64_t)v11, (uint64_t)v10, (uint64_t)v12, v13);
  objc_msgSend_xpcClient(a1, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_server(v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didAction_(v31, v32, (uint64_t)v21, v33, v34);

}

+ (BOOL)checkAndHandleSpecialCasesWithChannel:(id)a3 signal:(id)a4 payload:(id)a5
{
  return 0;
}

+ (void)handleLaunchSmartRepliesFeedbackWithAction:(int64_t)a3 Payload:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  char *v15;
  BOOL v16;
  IAFeedbackServiceSwiftBridge *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t v25[16];

  v5 = a4;
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("OriginalContent"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v10, (uint64_t)CFSTR("GeneratedContent"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_23F09763C();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (char *)v14;
  if (!v5 || (v9 ? (v16 = v13 == 0) : (v16 = 1), v16))
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_23F09FD78(v5, v15, v22, v23, v24);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_23F08C000, (os_log_t)v15, OS_LOG_TYPE_INFO, "Launching survey!", v25, 2u);
    }

    v17 = [IAFeedbackServiceSwiftBridge alloc];
    v15 = (char *)objc_msgSend_initWithFeatureDomain_action_originalContent_generatedContent_(v17, v18, 1, a3, (uint64_t)v9, v13);
    objc_msgSend_launchFeedbackWithCompletionHandler_(v15, v19, (uint64_t)&unk_250F8F238, v20, v21);
  }

}

+ (void)handleSmartRepliesFeedbackUIPresentedWithPayload:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  char *v13;
  BOOL v14;
  IAFeedbackServiceSwiftBridge *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v23[16];

  v3 = a3;
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("OriginalContent"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v8, (uint64_t)CFSTR("GeneratedContent"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_23F09763C();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (char *)v12;
  if (!v3 || (v7 ? (v14 = v11 == 0) : (v14 = 1), v14))
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_23F09FD78(v3, v13, v20, v21, v22);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_23F08C000, (os_log_t)v13, OS_LOG_TYPE_INFO, "Calling .presented", v23, 2u);
    }

    v15 = [IAFeedbackServiceSwiftBridge alloc];
    v13 = (char *)objc_msgSend_initWithFeatureDomain_action_originalContent_generatedContent_(v15, v16, 1, 0, (uint64_t)v7, v11);
    objc_msgSend_reportPresentedWithCompletionHandler_(v13, v17, (uint64_t)&unk_250F8F690, v18, v19);
  }

}

@end
