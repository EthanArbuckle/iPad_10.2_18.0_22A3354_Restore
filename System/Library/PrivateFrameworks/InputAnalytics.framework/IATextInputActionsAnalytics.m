@implementation IATextInputActionsAnalytics

- (IATextInputActionsAnalytics)initWithAnalyticsDelegate:(id)a3
{

  return 0;
}

- (IATextInputActionsAnalytics)initWithAnalyticsMetadataObserver:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  IATextInputActionsAnalytics *v8;
  uint8_t v10[16];

  v4 = a3;
  sub_23F0975CC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23F08C000, v5, OS_LOG_TYPE_INFO, "initWithAnalyticsMetadataObserver service", v10, 2u);
  }

  v8 = (IATextInputActionsAnalytics *)objc_msgSend_initWithAnalyticsMetadataObserver_withServiceName_(self, v6, (uint64_t)v4, (uint64_t)CFSTR("com.apple.inputanalyticsd"), v7);
  return v8;
}

- (void)invalidateConnection
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  IAXPCClient *xpcClient;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  sub_23F0975CC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F08C000, v3, OS_LOG_TYPE_INFO, "invalidateConnection called", buf, 2u);
  }

  objc_msgSend_invalidateConnection(self->_xpcClient, v4, v5, v6, v7);
  xpcClient = self->_xpcClient;
  self->_xpcClient = 0;

  sub_23F0975CC();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23F08C000, v9, OS_LOG_TYPE_INFO, "invalidateConnection completed", v10, 2u);
  }

}

- (id)_instanceOfActionClass:(Class)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
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
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;

  objc_msgSend_analyticsDelegate(self, a2, (uint64_t)a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    sub_23F0975CC();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_23F09F170();

  }
  v9 = objc_opt_class();
  if (objc_msgSend_isSubclassOfClass_(a3, v10, v9, v11, v12))
  {
    v13 = objc_alloc_init(a3);
    objc_msgSend_analyticsDelegate(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sessionIdentifier(v18, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSessionIdentifier_(self, v24, (uint64_t)v23, v25, v26);

    objc_msgSend_sessionIdentifier(self, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTextInputSessionId_(v13, v32, (uint64_t)v31, v33, v34);

    objc_msgSend_analyticsDelegate(self, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend_source(v39, v40, v41, v42, v43);
    objc_msgSend_setSource_(v13, v45, v44, v46, v47);

    objc_msgSend_analyticsDelegate(self, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend_flagOptions(v52, v53, v54, v55, v56);
    objc_msgSend_setFlagOptions_(v13, v58, v57, v59, v60);

    objc_msgSend_analyticsDelegate(self, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appBundleId(v65, v66, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAppBundleId_(v13, v71, (uint64_t)v70, v72, v73);

    objc_msgSend_analyticsDelegate(self, v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processBundleId(v78, v79, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProcessBundleId_(v13, v84, (uint64_t)v83, v85, v86);

    objc_msgSend_analyticsDelegate(self, v87, v88, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputMode(v91, v92, v93, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_populateActionInputMode_withInputMode_(self, v97, (uint64_t)v13, (uint64_t)v96, v98);

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)flushAndSetLastAction:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  IATextInputActionsSessionAction *v7;
  IATextInputActionsSessionAction *lastAction;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  IAXPCClient *xpcClient;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  IATextInputActionsSessionAction *v24;
  int v25;
  IAXPCClient *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = (IATextInputActionsSessionAction *)a3;
  lastAction = self->_lastAction;
  if (lastAction)
  {
    if (self->_useAnalyticsDaemon)
    {
      sub_23F0975CC();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        xpcClient = self->_xpcClient;
        objc_msgSend_server(xpcClient, v10, v11, v12, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 134218240;
        v26 = xpcClient;
        v27 = 2048;
        v28 = v15;
        _os_log_impl(&dword_23F08C000, v9, OS_LOG_TYPE_INFO, "flushAndSetLastAction calling didAction on xpc client 0x%lx with server 0x%lx", (uint8_t *)&v25, 0x16u);

      }
      objc_msgSend_server(self->_xpcClient, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_didAction_(v20, v21, (uint64_t)self->_lastAction, v22, v23);

    }
    else
    {
      objc_msgSend_consumeAction_(self->_localServer, v4, (uint64_t)lastAction, v5, v6);
    }
  }
  v24 = self->_lastAction;
  self->_lastAction = v7;

}

- (void)mergeOrConsumeAction:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  IAXPCClient *xpcClient;
  IATextInputActionsSessionAction *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  IAXPCClient *v53;
  IATextInputActionsSessionAction *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  IATextInputActionsSessionAction *lastAction;
  uint64_t v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  IATextInputActionsSessionAction *v69;
  int v70;
  uint64_t v71;
  __int16 v72;
  IATextInputActionsSessionAction *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v10 = v5;
  if (v5)
  {
    if (objc_msgSend_flagOptions(v5, v6, v7, v8, v9) >= 9)
    {
      sub_23F0975CC();
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
        sub_23F09F19C(v10, v15, v16, v17, v18);

    }
    if (self->_useAnalyticsDaemon)
    {
      objc_msgSend_asBegan(v10, v11, v12, v13, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        sub_23F0975CC();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          xpcClient = self->_xpcClient;
          objc_msgSend_server(xpcClient, v21, v22, v23, v24);
          v26 = (IATextInputActionsSessionAction *)objc_claimAutoreleasedReturnValue();
          v70 = 134218240;
          v71 = (uint64_t)xpcClient;
          v72 = 2048;
          v73 = v26;
          _os_log_impl(&dword_23F08C000, v20, OS_LOG_TYPE_INFO, "mergeOrConsumeAction calling didSessionBeginWithSessionMetadata on xpc client 0x%lx with server 0x%lx", (uint8_t *)&v70, 0x16u);

        }
        objc_msgSend_server(self->_xpcClient, v27, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_didSessionBeginWithSessionMetadata_(v31, v32, (uint64_t)v10, v33, v34);

      }
    }
    objc_msgSend_asEnd(v10, v11, v12, v13, v14);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v35;
    if (v35)
    {
      if (!self->_useAnalyticsDaemon)
      {
        objc_msgSend_keyboardTrialParameters(v35, v36, v37, v38, v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setKeyboardTrialParameters_(self->_localServer, v42, (uint64_t)v41, v43, v44);

      }
      objc_msgSend_flushAndSetLastAction_(self, v36, (uint64_t)v40, v38, v39);
      objc_msgSend_flushAndSetLastAction_(self, v45, 0, v46, v47);
      if (self->_useAnalyticsDaemon)
      {
        sub_23F0975CC();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          v53 = self->_xpcClient;
          objc_msgSend_server(v53, v49, v50, v51, v52);
          v54 = (IATextInputActionsSessionAction *)objc_claimAutoreleasedReturnValue();
          v70 = 134218240;
          v71 = (uint64_t)v53;
          v72 = 2048;
          v73 = v54;
          _os_log_impl(&dword_23F08C000, v48, OS_LOG_TYPE_INFO, "mergeOrConsumeAction calling didSessionEndWithSessionMetadata on xpc client 0x%lx with server 0x%lx", (uint8_t *)&v70, 0x16u);

        }
        objc_msgSend_server(self->_xpcClient, v55, v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_didSessionEndWithSessionMetadata_(v59, v60, (uint64_t)v40, v61, v62);

      }
    }
    else
    {
      lastAction = self->_lastAction;
      if (lastAction)
      {
        v64 = objc_msgSend_mergeActionIfPossible_(lastAction, v36, (uint64_t)v10, v38, v39);
        sub_23F0975CC();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          v69 = self->_lastAction;
          v70 = 134218499;
          v71 = v64;
          v72 = 2113;
          v73 = v69;
          v74 = 2113;
          v75 = v10;
          _os_log_debug_impl(&dword_23F08C000, v65, OS_LOG_TYPE_DEBUG, "[IATextInputActionsAnalytics] mergeOrConsumeAction: Merge result %lu lastAction:%{private}@ newAction:%{private}@", (uint8_t *)&v70, 0x20u);
        }

        if (!v64)
          objc_msgSend_flushAndSetLastAction_(self, v66, (uint64_t)v10, v67, v68);
      }
      else
      {
        objc_storeStrong((id *)&self->_lastAction, a3);
      }
    }

  }
}

- (void)populateActionInputMode:(id)a3 withInputMode:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;

  v67 = a3;
  v6 = a4;
  v11 = v6;
  if (v6)
  {
    v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
    objc_msgSend_setInputMode_(v67, v13, (uint64_t)v12, v14, v15);

    objc_msgSend_analyticsDelegate(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_flagOptions(v20, v21, v22, v23, v24);
    LODWORD(v12) = objc_msgSend_isWebSetInFlagOptions_(IATextInputActionsUtils, v26, v25, v27, v28);

    if ((_DWORD)v12)
    {
      objc_msgSend_inputMode(v67, v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_keyboardType(v33, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_length(v38, v39, v40, v41, v42);

      objc_msgSend_inputMode(v67, v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v48;
      if (v43)
      {
        objc_msgSend_keyboardType(v48, v49, v50, v51, v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v54, v55, (uint64_t)CFSTR("Web"), v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_inputMode(v67, v59, v60, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setKeyboardType_(v63, v64, (uint64_t)v58, v65, v66);

      }
      else
      {
        objc_msgSend_setKeyboardType_(v48, v49, (uint64_t)CFSTR("Web"), v51, v52);
      }

    }
  }

}

- (void)didSessionBegin
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *queue;
  id v15;
  _QWORD v16[5];
  id v17;

  sub_23F0975CC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_23F09F224();

  v4 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v5, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asBegan(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_23F08F424;
  v16[3] = &unk_250F8F620;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  dispatch_async(queue, v16);

}

- (void)didSessionEnd
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *queue;
  id v24;
  _QWORD v25[5];
  id v26;

  sub_23F0975CC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_23F09F250();

  v4 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v5, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asEnd(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  objc_msgSend_keyboardTrialParameters(WeakRetained, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeyboardTrialParameters_(v13, v20, (uint64_t)v19, v21, v22);

  queue = self->_queue;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_23F08F534;
  v25[3] = &unk_250F8F620;
  v25[4] = self;
  v26 = v13;
  v24 = v13;
  dispatch_async(queue, v25);

}

- (void)didOther
{
  NSObject *v2;

  sub_23F0975CC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_23F09F27C();

}

- (void)didInsertText:(id)a3 withType:(int64_t)a4
{
  MEMORY[0x24BEDD108](self, sel_didInsertText_withType_selectedTextBefore_withInputMode_, a3, a4, 0);
}

- (void)didInsertText:(id)a3 withType:(int64_t)a4 withInputMode:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_didInsertText_withType_selectedTextBefore_withInputMode_, a3, a4, 0);
}

- (void)didInsertText:(id)a3 withType:(int64_t)a4 selectedTextBefore:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_didInsertText_withType_selectedTextBefore_withInputMode_, a3, a4, a5);
}

- (void)didInsertText:(id)a3 withType:(int64_t)a4 selectedTextBefore:(id)a5 withInputMode:(id)a6
{
  objc_msgSend_didInsertText_withType_relativeRangeBefore_withNumAlternatives_selectedTextBefore_withInputMode_(self, a2, (uint64_t)a3, a4, 0, 0, 0, a5, a6);
}

- (void)didInsertText:(id)a3 withType:(int64_t)a4 relativeRangeBefore:(_NSRange)a5 withNumAlternatives:(int64_t)a6 selectedTextBefore:(id)a7 withInputMode:(id)a8
{
  NSUInteger length;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  id v69;
  __int16 v70;
  id v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  length = a5.length;
  v74 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a7;
  v15 = a8;
  sub_23F0975CC();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_description(v15, v18, v19, v20, v21);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 138478339;
      v69 = v13;
      v70 = 2113;
      v71 = v14;
      v72 = 2113;
      v73 = v67;
      _os_log_debug_impl(&dword_23F08C000, v17, OS_LOG_TYPE_DEBUG, "[IATextInputActionsAnalytics] didInsertText:\"%{private}@\" selectedTextBefore:%{private}@ withInputMode:%{private}@", (uint8_t *)&v68, 0x20u);

    }
    if (objc_msgSend_length(v14, v22, v23, v24, v25))
    {
      objc_msgSend__didDeleteBackwardText_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, v26, (uint64_t)v14, a4, 1, v15, 1);
    }
    else if (!v14 && length)
    {
      objc_msgSend__didDeleteBackwardCount_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, v26, length, a4, 1, v15, 1);
    }
    v27 = objc_opt_class();
    objc_msgSend__instanceOfActionClass_(self, v28, v27, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_asInsertion(v31, v32, v33, v34, v35);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_setTextInputActionsType_(v17, v36, a4, v37, v38);
    objc_msgSend_setWithAlternativesCount_(v17, v39, a6 > 0, v40, v41);
    objc_msgSend_populateActionInputMode_withInputMode_(self, v42, (uint64_t)v17, (uint64_t)v15, v43);
    objc_msgSend_getDetailsForString_(IAStringDetails, v44, (uint64_t)v13, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend_characters(v47, v48, v49, v50, v51);
    objc_msgSend_setInsertedTextLength_(v17, v53, v52, v54, v55);
    v60 = objc_msgSend_emojiCharacters(v47, v56, v57, v58, v59);
    objc_msgSend_setInsertedEmojiCount_(v17, v61, v60, v62, v63);

    objc_msgSend__didInsertTextAction_(self, v64, (uint64_t)v17, v65, v66);
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    sub_23F09F2A8();
  }

}

- (void)_didInsertTextAction:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *queue;
  id v32;
  _QWORD v33[5];
  id v34;

  v4 = a3;
  v9 = objc_msgSend_flagOptions(v4, v5, v6, v7, v8);
  if (objc_msgSend_isEmojiSearchSetInFlagOptions_(IATextInputActionsUtils, v10, v9, v11, v12))
  {
    if (objc_msgSend_source(v4, v13, v14, v15, v16) == 5)
    {
      objc_msgSend_setSource_(v4, v17, 4, v18, v19);
      if (objc_msgSend_insertedEmojiCount(v4, v20, v21, v22, v23) == 1
        && objc_msgSend_insertedTextLength(v4, v24, v25, v26, v27) == 1)
      {
        objc_msgSend_setInputActionCountFromMergedActions_(v4, v28, 1, v29, v30);
      }
    }
  }
  queue = self->_queue;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_23F08F900;
  v33[3] = &unk_250F8F620;
  v33[4] = self;
  v34 = v4;
  v32 = v4;
  dispatch_async(queue, v33);

}

- (void)_didDeleteBackwardTextDetails:(id)a3 withType:(int64_t)a4 shouldOverrideInputActionCountToZero:(BOOL)a5 withInputMode:(id)a6 forceNotMarkedText:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v9;
  id v12;
  id v13;
  uint64_t v14;
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
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;

  v7 = a7;
  v9 = a5;
  v12 = a3;
  v13 = a6;
  if (v12)
  {
    v14 = objc_opt_class();
    objc_msgSend__instanceOfActionClass_(self, v15, v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_asDeletion(v18, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setTextInputActionsType_(v23, v24, a4, v25, v26);
    v31 = objc_msgSend_characters(v12, v27, v28, v29, v30);
    objc_msgSend_setRemovedTextLength_(v23, v32, v31, v33, v34);
    v39 = objc_msgSend_emojiCharacters(v12, v35, v36, v37, v38);
    objc_msgSend_setRemovedEmojiCount_(v23, v40, v39, v41, v42);
    objc_msgSend_populateActionInputMode_withInputMode_(self, v43, (uint64_t)v23, (uint64_t)v13, v44);
    if (v9)
    {
      v49 = objc_msgSend_inputActionCount(v23, v45, v46, v47, v48);
      objc_msgSend_setInputActionCountFromMergedActions_(v23, v50, -v49, v51, v52);
    }
    if (v7)
    {
      v53 = objc_msgSend_flagOptions(v23, v45, v46, v47, v48);
      objc_msgSend_setFlagOptions_(v23, v54, v53 & 0xFFFFFFFFFFFFFFFDLL, v55, v56);
    }
    objc_msgSend__didDeleteBackwardAction_(self, v45, (uint64_t)v23, v47, v48);

  }
  else
  {
    sub_23F0975CC();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      sub_23F09F330();

  }
}

- (void)_didDeleteBackwardText:(id)a3 withType:(int64_t)a4 shouldOverrideInputActionCountToZero:(BOOL)a5 withInputMode:(id)a6 forceNotMarkedText:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  const char *v17;
  NSObject *v18;

  v7 = a7;
  v8 = a5;
  v15 = a6;
  if (a3)
  {
    objc_msgSend_getDetailsForString_(IAStringDetails, v12, (uint64_t)a3, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__didDeleteBackwardTextDetails_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, v17, (uint64_t)v16, a4, v8, v15, v7);

  }
  else
  {
    sub_23F0975CC();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_23F09F330();

  }
}

- (void)didDeleteBackwardText:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  v4 = a3;
  sub_23F0975CC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_23F09F35C((uint64_t)v4, v5, v6);

  objc_msgSend_didDeleteBackwardText_withType_(self, v7, (uint64_t)v4, 1, v8);
}

- (void)didDeleteBackwardText:(id)a3 withType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const char *v8;

  v6 = a3;
  sub_23F0975CC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_23F09F3C4();

  objc_msgSend__didDeleteBackwardText_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, v8, (uint64_t)v6, a4, 0, 0, 0);
}

- (void)didDeleteBackwardText:(id)a3 withType:(int64_t)a4 withInputMode:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  sub_23F0975CC();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_stringForType_(IATextInputActionsUtils, v11, a4, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v9, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138740483;
    v22 = v8;
    v23 = 2113;
    v24 = v15;
    v25 = 2113;
    v26 = v20;
    _os_log_debug_impl(&dword_23F08C000, v10, OS_LOG_TYPE_DEBUG, "[IATextInputActionsAnalytics] didDeleteBackwardText:%{sensitive}@ withType:%{private}@ withInputMode:'%{private}@'", (uint8_t *)&v21, 0x20u);

  }
  objc_msgSend__didDeleteBackwardText_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, v14, (uint64_t)v8, a4, 0, v9, 0);

}

- (void)didDeleteBackwardCount:(unint64_t)a3 withType:(int64_t)a4
{
  objc_msgSend__didDeleteBackwardCount_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, a2, a3, a4, 0, 0, 0);
}

- (void)_didDeleteBackwardCount:(unint64_t)a3 withType:(int64_t)a4 shouldOverrideInputActionCountToZero:(BOOL)a5 withInputMode:(id)a6 forceNotMarkedText:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  IAStringDetails *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;

  v7 = a5;
  v11 = a6;
  sub_23F0975CC();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_23F09F454(a4, (const char *)a3, v12, v13, v14);

  v15 = objc_alloc_init(IAStringDetails);
  objc_msgSend_setCharacters_(v15, v16, a3, v17, v18);
  objc_msgSend__didDeleteBackwardTextDetails_withType_shouldOverrideInputActionCountToZero_withInputMode_forceNotMarkedText_(self, v19, (uint64_t)v15, a4, v7, v11, 0);

}

- (void)_didDeleteBackwardAction:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_23F08FE5C;
  v7[3] = &unk_250F8F620;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)didChangeToSelection:(_NSRange)a3 relativeRangeBefore:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  NSObject *queue;
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  NSUInteger v29;
  __int16 v30;
  NSUInteger v31;
  __int16 v32;
  NSUInteger v33;
  __int16 v34;
  NSUInteger v35;
  uint64_t v36;

  length = a4.length;
  location = a4.location;
  v6 = a3.length;
  v7 = a3.location;
  v36 = *MEMORY[0x24BDAC8D0];
  if (a3.length != a4.length || a3.location != a4.location)
  {
    sub_23F0975CC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218752;
      v29 = v7;
      v30 = 2048;
      v31 = v6;
      v32 = 2048;
      v33 = location;
      v34 = 2048;
      v35 = length;
      _os_log_debug_impl(&dword_23F08C000, v9, OS_LOG_TYPE_DEBUG, "[IATextInputActionsAnalytics] didChangeToSelection:(%lu, %lu) rangeBefore:(%lu, %lu)", buf, 0x2Au);
    }

    v10 = objc_opt_class();
    objc_msgSend__instanceOfActionClass_(self, v11, v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_asSelection(v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setRelativeRangeBefore_(v19, v20, location, length, v21);
    objc_msgSend_setRangeAfter_(v19, v22, v7, v6, v23);
    queue = self->_queue;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = sub_23F090004;
    v26[3] = &unk_250F8F620;
    v26[4] = self;
    v27 = v19;
    v25 = v19;
    dispatch_async(queue, v26);

  }
}

- (void)didCopy:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *queue;
  id v19;
  _QWORD v20[5];
  id v21;

  sub_23F0975CC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_23F09F4E8();

  v5 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v6, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asCopy(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTextInputActionsType_(v14, v15, 11, v16, v17);
  queue = self->_queue;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_23F0900F4;
  v20[3] = &unk_250F8F620;
  v20[4] = self;
  v21 = v14;
  v19 = v14;
  dispatch_async(queue, v20);

}

- (void)didCut:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *queue;
  id v19;
  _QWORD v20[5];
  id v21;

  sub_23F0975CC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_23F09F514();

  v5 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v6, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asCut(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTextInputActionsType_(v14, v15, 10, v16, v17);
  queue = self->_queue;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_23F0901E4;
  v20[3] = &unk_250F8F620;
  v20[4] = self;
  v21 = v14;
  v19 = v14;
  dispatch_async(queue, v20);

}

- (void)didPaste:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *queue;
  id v19;
  _QWORD v20[5];
  id v21;

  sub_23F0975CC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_23F09F540();

  v5 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v6, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asPaste(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTextInputActionsType_(v14, v15, 12, v16, v17);
  queue = self->_queue;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_23F0902D4;
  v20[3] = &unk_250F8F620;
  v20[4] = self;
  v21 = v14;
  v19 = v14;
  dispatch_async(queue, v20);

}

- (void)didUndo
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *queue;
  id v18;
  _QWORD v19[5];
  id v20;

  sub_23F0975CC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_23F09F56C();

  v4 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v5, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asUndo(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTextInputActionsType_(v13, v14, 13, v15, v16);
  queue = self->_queue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_23F0903C4;
  v19[3] = &unk_250F8F620;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  dispatch_async(queue, v19);

}

- (void)didRedo
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *queue;
  id v18;
  _QWORD v19[5];
  id v20;

  sub_23F0975CC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_23F09F598();

  v4 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v5, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asRedo(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTextInputActionsType_(v13, v14, 14, v15, v16);
  queue = self->_queue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_23F0904B4;
  v19[3] = &unk_250F8F620;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  dispatch_async(queue, v19);

}

- (void)_didReplacementForText:(id)a3 withText:(id)a4 allowNilText:(BOOL)a5 allowEmptyText:(BOOL)a6 allowNilReplacement:(BOOL)a7 withSource:(int64_t)a8 withType:(int64_t)a9 withInputActionCount:(int64_t)a10
{
  __CFString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  __CFString *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
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
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *queue;
  id v92;
  _QWORD v93[5];
  id v94;

  v16 = (__CFString *)a3;
  v21 = a4;
  if (v16)
    v22 = v16;
  else
    v22 = &stru_250F901F0;
  if (v16 || a5)
  {
    if (objc_msgSend_length(v22, v17, v18, v19, v20) || a6)
    {
      if (v21 || a7)
      {
        if (v21)
          v23 = v21;
        else
          v23 = &stru_250F901F0;
        v27 = objc_opt_class();
        objc_msgSend__instanceOfActionClass_(self, v28, v27, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_asReplaceText(v31, v32, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setSource_(v36, v37, a8, v38, v39);
        objc_msgSend_setTextInputActionsType_(v36, v40, a9, v41, v42);
        objc_msgSend_getDetailsForString_(IAStringDetails, v43, (uint64_t)v22, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend_characters(v46, v47, v48, v49, v50);
        objc_msgSend_setRemovedTextLength_(v36, v52, v51, v53, v54);
        v59 = objc_msgSend_emojiCharacters(v46, v55, v56, v57, v58);
        objc_msgSend_setRemovedEmojiCount_(v36, v60, v59, v61, v62);

        objc_msgSend_getDetailsForString_(IAStringDetails, v63, (uint64_t)v23, v64, v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend_characters(v66, v67, v68, v69, v70);
        objc_msgSend_setInsertedTextLength_(v36, v72, v71, v73, v74);
        v79 = objc_msgSend_emojiCharacters(v66, v75, v76, v77, v78);
        objc_msgSend_setInsertedEmojiCount_(v36, v80, v79, v81, v82);
        v87 = objc_msgSend_inputActionCount(v36, v83, v84, v85, v86);
        objc_msgSend_setInputActionCountFromMergedActions_(v36, v88, a10 - v87, v89, v90);
        queue = self->_queue;
        v93[0] = MEMORY[0x24BDAC760];
        v93[1] = 3221225472;
        v93[2] = sub_23F090728;
        v93[3] = &unk_250F8F620;
        v93[4] = self;
        v94 = v36;
        v92 = v36;
        dispatch_async(queue, v93);

      }
      else
      {
        sub_23F0975CC();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          sub_23F09F5C4((uint64_t)v22, v23, v26);
      }
    }
    else
    {
      sub_23F0975CC();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_23F09F638();

      v23 = v21;
    }
  }
  else
  {
    sub_23F0975CC();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_23F09F6A0((uint64_t)v21, v23, v24);
    v22 = (__CFString *)v21;
  }

}

- (void)didCandidateBarReplacementForText:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;

  v6 = a3;
  v7 = a4;
  sub_23F0975CC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_23F09F714();

  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v9, (uint64_t)v6, (uint64_t)v7, 1, 1, 0, 7, 1, 1);
}

- (void)didCalloutBarReplacementForText:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;

  v6 = a3;
  v7 = a4;
  sub_23F0975CC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_23F09F774();

  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v9, (uint64_t)v6, (uint64_t)v7, 0, 0, 0, 8, 1, 1);
}

- (void)didAutocorrectReplacementForText:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;

  v6 = a3;
  v7 = a4;
  sub_23F0975CC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_23F09F7D4();

  objc_msgSend_analyticsDelegate(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_source(v13, v14, v15, v16, v17);
  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v19, (uint64_t)v6, (uint64_t)v7, 0, 0, 1, v18, 6, 1);

}

- (void)didAutocorrectTapOnCompletionReplacementForText:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;

  v6 = a3;
  v7 = a4;
  sub_23F0975CC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_23F09F834();

  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v9, (uint64_t)v6, (uint64_t)v7, 0, 0, 1, 12, 6, 1);
}

- (void)didInlineCompletionReplacementForText:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;

  v6 = a3;
  v7 = a4;
  sub_23F0975CC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_23F09F894();

  objc_msgSend_analyticsDelegate(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_source(v13, v14, v15, v16, v17);
  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v19, (uint64_t)v6, (uint64_t)v7, 1, 1, 0, v18, 15, 1);

}

- (void)didInlineCompletionTapOnCompletionReplacementForText:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;

  v6 = a3;
  v7 = a4;
  sub_23F0975CC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_23F09F8F4();

  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v9, (uint64_t)v6, (uint64_t)v7, 1, 1, 0, 12, 15, 1);
}

- (void)didRevisionBubbleReplacementForText:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;

  v6 = a3;
  v7 = a4;
  sub_23F0975CC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_23F09F954();

  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v9, (uint64_t)v6, (uint64_t)v7, 0, 0, 0, 11, 1, 0);
}

- (void)didRevisionBubbleTap
{
  NSObject *v3;
  const char *v4;

  sub_23F0975CC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_23F09F9B4();

  objc_msgSend__didReplacementForText_withText_allowNilText_allowEmptyText_allowNilReplacement_withSource_withType_withInputActionCount_(self, v4, (uint64_t)&stru_250F901F0, (uint64_t)&stru_250F901F0, 0, 1, 0, 11, 1, 1);
}

- (void)didCandidateBarAction
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *queue;
  id v20;
  _QWORD v21[5];
  id v22;

  v3 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v4, v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asReplaceText(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTextInputActionsType_(v12, v13, 1, v14, v15);
  objc_msgSend_setSource_(v12, v16, 7, v17, v18);
  queue = self->_queue;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_23F090D14;
  v21[3] = &unk_250F8F620;
  v21[4] = self;
  v22 = v12;
  v20 = v12;
  dispatch_async(queue, v21);

}

- (void)didReplaceWithCandidate:(int64_t)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *queue;
  id v31;
  _QWORD v32[5];
  id v33;

  sub_23F0975CC();
  v5 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG))
    sub_23F09F9E0(a3, v5, v6, v7, v8);

  v9 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v10, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asReplaceWithCandidate(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setReplaceWithCandidateType_(v18, v19, a3, v20, v21);
  v26 = objc_msgSend_inputActionCount(v18, v22, v23, v24, v25);
  objc_msgSend_setInputActionCountFromMergedActions_(v18, v27, -v26, v28, v29);
  queue = self->_queue;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_23F090E20;
  v32[3] = &unk_250F8F620;
  v32[4] = self;
  v33 = v18;
  v31 = v18;
  dispatch_async(queue, v32);

}

- (void)didConversionForMarkedText:(id)a3 withText:(id)a4
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
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  int isMarkedTextSetInFlagOptions;
  NSObject *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *queue;
  id v84;
  _QWORD v85[5];
  id v86;

  v6 = a3;
  v7 = a4;
  v12 = v7;
  if (v6 && v7)
  {
    if (objc_msgSend_length(v6, v8, v9, v10, v11) && objc_msgSend_length(v12, v13, v14, v15, v16))
    {
      objc_msgSend_analyticsDelegate(self, v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend_source(v21, v22, v23, v24, v25);

      if (v26 <= 0xC && ((1 << v26) & 0x10B8) != 0)
      {
        objc_msgSend_analyticsDelegate(self, v27, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend_flagOptions(v31, v32, v33, v34, v35);
        isMarkedTextSetInFlagOptions = objc_msgSend_isMarkedTextSetInFlagOptions_(IATextInputActionsUtils, v37, v36, v38, v39);

        if (isMarkedTextSetInFlagOptions)
        {
          sub_23F0975CC();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            sub_23F09FB40();

        }
        v42 = objc_opt_class();
        objc_msgSend__instanceOfActionClass_(self, v43, v42, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_asInsertion(v46, v47, v48, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setTextInputActionsType_(v51, v52, 7, v53, v54);
        objc_msgSend_getDetailsForString_(IAStringDetails, v55, (uint64_t)v12, v56, v57);
        v58 = objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend_characters(v58, v59, v60, v61, v62);
        objc_msgSend_setInsertedTextLength_(v51, v64, v63, v65, v66);
        v71 = objc_msgSend_emojiCharacters(v58, v67, v68, v69, v70);
        objc_msgSend_setInsertedEmojiCount_(v51, v72, v71, v73, v74);
        v79 = objc_msgSend_inputActionCount(v51, v75, v76, v77, v78);
        objc_msgSend_setInputActionCountFromMergedActions_(v51, v80, 1 - v79, v81, v82);
        queue = self->_queue;
        v85[0] = MEMORY[0x24BDAC760];
        v85[1] = 3221225472;
        v85[2] = sub_23F0910A8;
        v85[3] = &unk_250F8F620;
        v85[4] = self;
        v86 = v51;
        v84 = v51;
        dispatch_async(queue, v85);

        goto LABEL_16;
      }
      sub_23F0975CC();
      v58 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
    }
    else
    {
      sub_23F0975CC();
      v58 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
    }
    sub_23F09FAD8();
    goto LABEL_16;
  }
  sub_23F0975CC();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    sub_23F09FA70();
LABEL_16:

}

- (void)didKeyboardDockItemButtonPress:(unint64_t)a3 buttonType:(unint64_t)a4 buttonSize:(CGSize)a5 touchDown:(CGPoint)a6 touchUp:(CGPoint)a7 touchDuration:(double)a8 inputSource:(int64_t)a9 inputType:(int64_t)a10 uiInterfaceOrientation:(int64_t)a11
{
  double y;
  double x;
  double v18;
  double v19;
  double height;
  double width;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *queue;
  id v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  _QWORD v76[5];
  id v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  double v83;
  __int16 v84;
  double v85;
  __int16 v86;
  double v87;
  __int16 v88;
  double v89;
  __int16 v90;
  double v91;
  __int16 v92;
  double v93;
  __int16 v94;
  double v95;
  uint64_t v96;

  y = a7.y;
  x = a7.x;
  v18 = a6.y;
  v19 = a6.x;
  height = a5.height;
  width = a5.width;
  v96 = *MEMORY[0x24BDAC8D0];
  sub_23F0975CC();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_stringForKeyboardDockItemButtonPressResult_(IATextInputActionsUtils, v25, a3, v26, v27);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringForKeyboardDockItemButtonType_(IATextInputActionsUtils, v72, a4, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138479875;
    v79 = v71;
    v80 = 2113;
    v81 = v75;
    v82 = 2048;
    v83 = width;
    v84 = 2048;
    v85 = height;
    v86 = 2048;
    v87 = v19;
    v88 = 2048;
    v89 = v18;
    v90 = 2048;
    v91 = x;
    v92 = 2048;
    v93 = y;
    v94 = 2048;
    v95 = a8;
    _os_log_debug_impl(&dword_23F08C000, v24, OS_LOG_TYPE_DEBUG, "[IATextInputActionsAnalytics] didKeyboardDockItemButtonPress:%{private}@ buttonType:%{private}@ buttonSize:(%fw %fh) touchDown:(%f,%f) touchUp:(%f,%f) touchDuration:%f", buf, 0x5Cu);

  }
  v28 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v29, v28, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asKeyboardDockItemButtonPress(v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setSource_(v37, v38, a9, v39, v40);
  objc_msgSend_setTextInputActionsType_(v37, v41, a10, v42, v43);
  objc_msgSend_setButtonPressResult_(v37, v44, a3, v45, v46);
  objc_msgSend_setButtonType_(v37, v47, a4, v48, v49);
  objc_msgSend_setUiOrientation_(v37, v50, a11, v51, v52);
  objc_msgSend_setButtonSize_(v37, v53, v54, v55, v56, width, height);
  objc_msgSend_setTouchDownPoint_(v37, v57, v58, v59, v60, v19, v18);
  objc_msgSend_setTouchUpPoint_(v37, v61, v62, v63, v64, x, y);
  objc_msgSend_setTouchDuration_(v37, v65, v66, v67, v68, a8);
  queue = self->_queue;
  v76[0] = MEMORY[0x24BDAC760];
  v76[1] = 3221225472;
  v76[2] = sub_23F091340;
  v76[3] = &unk_250F8F620;
  v76[4] = self;
  v77 = v37;
  v70 = v37;
  dispatch_async(queue, v76);

}

- (void)didDictationBegin:(BOOL)a3 usesMultiModalDictation:(BOOL)a4
{
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *queue;
  id v22;
  _QWORD block[4];
  id v24;
  IATextInputActionsAnalytics *v25;
  BOOL v26;
  BOOL v27;

  sub_23F0975CC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_23F09FBA8();

  v8 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v9, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asDictationBegan(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setSource_(v17, v18, 1, v19, v20);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_23F091448;
  block[3] = &unk_250F8F648;
  v26 = a3;
  v27 = a4;
  v24 = v17;
  v25 = self;
  v22 = v17;
  dispatch_async(queue, block);

}

- (void)didDictationEnd
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *queue;
  id v15;
  _QWORD v16[5];
  id v17;

  sub_23F0975CC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_23F09FBD4();

  v4 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v5, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asDictationEnded(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_23F091570;
  v16[3] = &unk_250F8F620;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  dispatch_async(queue, v16);

}

- (void)_didInsertionKeyPressOfKey:(id)a3 withType:(int64_t)a4
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;

  v6 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asInsertion(v10, v11, v12, v13, v14);
  v35 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTextInputActionsType_(v35, v15, a4, v16, v17);
  objc_msgSend_setInsertedTextLength_(v35, v18, 0, v19, v20);
  objc_msgSend_setInsertedEmojiCount_(v35, v21, 0, v22, v23);
  v28 = objc_msgSend_inputActionCount(v35, v24, v25, v26, v27);
  objc_msgSend_setInputActionCountFromMergedActions_(v35, v29, 1 - v28, v30, v31);
  objc_msgSend__didInsertTextAction_(self, v32, (uint64_t)v35, v33, v34);

}

- (void)didInsertionKeyPress
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;

  sub_23F0975CC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_23F09FC00();

  objc_msgSend__didInsertionKeyPressOfKey_withType_(self, v4, 0, 1, v5);
}

- (void)didInsertionKeyPressOfKey:(id)a3 withType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;

  v6 = a3;
  sub_23F0975CC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_23F09FC2C();

  objc_msgSend__didInsertionKeyPressOfKey_withType_(self, v8, (uint64_t)v6, a4, v9);
}

- (void)_didDeletionKeyPressOfKey:(id)a3 withType:(int64_t)a4
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;

  v6 = objc_opt_class();
  objc_msgSend__instanceOfActionClass_(self, v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asDeletion(v10, v11, v12, v13, v14);
  v35 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setTextInputActionsType_(v35, v15, a4, v16, v17);
  objc_msgSend_setRemovedTextLength_(v35, v18, 0, v19, v20);
  objc_msgSend_setRemovedEmojiCount_(v35, v21, 0, v22, v23);
  v28 = objc_msgSend_inputActionCount(v35, v24, v25, v26, v27);
  objc_msgSend_setInputActionCountFromMergedActions_(v35, v29, 1 - v28, v30, v31);
  objc_msgSend__didDeleteBackwardAction_(self, v32, (uint64_t)v35, v33, v34);

}

- (void)didDeletionKeyPress
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;

  sub_23F0975CC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_23F09FCBC();

  objc_msgSend__didDeletionKeyPressOfKey_withType_(self, v4, 0, 1, v5);
}

- (void)didDeletionKeyPressOfKey:(id)a3 withType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;

  v6 = a3;
  sub_23F0975CC();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_23F09FCE8();

  objc_msgSend__didDeletionKeyPressOfKey_withType_(self, v8, (uint64_t)v6, a4, v9);
}

- (IATextInputActionsMetadataObserving)analyticsDelegate
{
  return (IATextInputActionsMetadataObserving *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_lastAction, 0);
  objc_storeStrong((id *)&self->_localServer, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
}

- (IATextInputActionsAnalytics)initWithAnalyticsMetadataObserver:(id)a3 withEventHandler:(id)a4
{
  id v5;
  id v6;
  IATextInputActionsAnalytics *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  IATextInputActionsSessionAction *lastAction;
  IATextInputActionsServer *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  IATextInputActionsServer *localServer;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)IATextInputActionsAnalytics;
  v5 = a4;
  v6 = a3;
  v7 = -[IATextInputActionsAnalytics init](&v19, sel_init);
  v7->_useAnalyticsDaemon = 0;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.inputAnalytics.IATextInputActionsAnalytics", v8);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v9;

  lastAction = v7->_lastAction;
  v7->_lastAction = 0;

  objc_storeWeak((id *)&v7->_analyticsDelegate, v6);
  v12 = [IATextInputActionsServer alloc];
  v16 = objc_msgSend_initWithEventHandler_(v12, v13, (uint64_t)v5, v14, v15, v19.receiver, v19.super_class);

  localServer = v7->_localServer;
  v7->_localServer = (IATextInputActionsServer *)v16;

  return v7;
}

- (IATextInputActionsAnalytics)initWithAnalyticsMetadataObserver:(id)a3 withServiceName:(id)a4
{
  id v5;
  id v6;
  IATextInputActionsAnalytics *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  IATextInputActionsSessionAction *lastAction;
  IAXPCClient *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  IAXPCClient *xpcClient;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  IAXPCClient *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  IAXPCClient *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)IATextInputActionsAnalytics;
  v5 = a4;
  v6 = a3;
  v7 = -[IATextInputActionsAnalytics init](&v28, sel_init);
  v7->_useAnalyticsDaemon = 1;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.inputAnalytics.IATextInputActionsAnalytics", v8);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v9;

  lastAction = v7->_lastAction;
  v7->_lastAction = 0;

  objc_storeWeak((id *)&v7->_analyticsDelegate, v6);
  v12 = [IAXPCClient alloc];
  v16 = objc_msgSend_initWithServiceName_(v12, v13, (uint64_t)v5, v14, v15, v28.receiver, v28.super_class);

  xpcClient = v7->_xpcClient;
  v7->_xpcClient = (IAXPCClient *)v16;

  sub_23F0975CC();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7->_xpcClient;
    objc_msgSend_server(v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v30 = v20;
    v31 = 2048;
    v32 = v21;
    v33 = 2048;
    v34 = v26;
    _os_log_impl(&dword_23F08C000, v18, OS_LOG_TYPE_INFO, "initialized new %{private}@ xpc client 0x%lx with server 0x%lx", buf, 0x20u);

  }
  return v7;
}

- (void)dispatchToAnalyticsQueue:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_23F091C18;
  block[3] = &unk_250F8F670;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (id)server
{
  return self->_localServer;
}

- (id)lastAction
{
  return self->_lastAction;
}

@end
