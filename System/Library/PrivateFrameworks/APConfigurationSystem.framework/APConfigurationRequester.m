@implementation APConfigurationRequester

- (APConfigurationRequester)initWithStorefront:(id)a3
{
  id v5;
  APConfigurationRequester *v6;
  APConfigurationRequester *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *responseQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APConfigurationRequester;
  v6 = -[APConfigurationRequester init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storefront, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.ap.configurationsystem.response", v9);
    responseQueue = v7->_responseQueue;
    v7->_responseQueue = (OS_dispatch_queue *)v10;

    v7->_cancelled = 0;
  }

  return v7;
}

- (id)_requestHost
{
  __CFString *v2;
  const char *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  __CFString **v13;
  __CFString *v14;

  v2 = CFSTR("device-config.pcms.apple.com");
  if (objc_msgSend_isAppleInternalInstall(MEMORY[0x24BDFD4B8], v3, v4))
  {
    v5 = objc_alloc(MEMORY[0x24BDBCF50]);
    v7 = (void *)objc_msgSend_initWithSuiteName_(v5, v6, *MEMORY[0x24BDFD450]);
    objc_msgSend_stringForKey_(v7, v8, (uint64_t)CFSTR("configSystemHostEnvironment"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    if (v9)
    {
      if ((objc_msgSend_isEqualToString_(v9, v10, (uint64_t)CFSTR("STG")) & 1) != 0)
      {
        v13 = kAPConfigSystemURLSTGHost;
LABEL_7:
        v14 = *v13;

        v2 = v14;
        goto LABEL_8;
      }
      if (objc_msgSend_isEqualToString_(v11, v12, (uint64_t)CFSTR("RVW")))
      {
        v13 = kAPConfigSystemURLRVWHost;
        goto LABEL_7;
      }
    }
LABEL_8:

  }
  return v2;
}

- (void)requestConfigurationWithCompletionHandler:(id)a3
{
  void *v4;
  const char *v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;

  v4 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  objc_msgSend_setCompletionHandler_(self, v5, (uint64_t)v4);

  v6 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend_setScheme_(v6, v7, (uint64_t)CFSTR("https"));
  objc_msgSend__requestHost(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHost_(v6, v11, (uint64_t)v10);

  objc_msgSend_setPath_(v6, v12, (uint64_t)CFSTR("/transform-service/1/config"));
  objc_msgSend__queryItems(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setQueryItems_(v6, v16, (uint64_t)v15);

  objc_msgSend_URL(v6, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedAPNetworkClient(MEMORY[0x24BDFD498], v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_temporarySessionForDaemon(v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_responseQueue(self, v26, v27);
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_235C3DF88;
  block[3] = &unk_2506FE540;
  block[4] = self;
  v32 = v19;
  v33 = v25;
  v29 = v25;
  v30 = v19;
  dispatch_async(v28, block);

}

- (void)cancelRequest
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend_responseQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_235C3E2A4;
  block[3] = &unk_2506FE590;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_runCompletionHandlerWithSuccess:(BOOL)a3 data:(id)a4
{
  _BOOL8 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v4 = a3;
  v11 = a4;
  objc_msgSend_completionHandler(self, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, _BOOL8, id))(v8 + 16))(v8, v4, v11);
    objc_msgSend_setCompletionHandler_(self, v10, 0);
  }

}

- (void)_httpResponse:(id)a3 session:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v8 = objc_msgSend_valid(v5, v6, v7);
  APLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!(_DWORD)v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_msgSend_responseStatusCode(v5, v22, v23);
      objc_msgSend_responseError(v5, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v45 = v24;
      v46 = 2114;
      v47 = v27;
      _os_log_impl(&dword_235C39000, v10, OS_LOG_TYPE_ERROR, "Received error request. Status Code: %ld Error: %{public}@", buf, 0x16u);

    }
    v28 = (void *)MEMORY[0x24BDD17C8];
    v31 = objc_msgSend_responseStatusCode(v5, v29, v30);
    objc_msgSend_responseError(v5, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v28, v35, (uint64_t)CFSTR("Received error request. Status Code: %ld Error: %@"), v31, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    CreateDiagnosticReport();

    v39 = objc_msgSend__configurationVersion(self, v37, v38);
    objc_msgSend__sendCoreAnalyticsWithUpdateStatus_version_(self, v40, 1512, v39);
    goto LABEL_16;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235C39000, v10, OS_LOG_TYPE_INFO, "Received response from server.", buf, 2u);
  }

  if (objc_msgSend_responseStatusCode(v5, v11, v12) != 200)
  {
    if (objc_msgSend_responseStatusCode(v5, v13, v14) != 204)
    {
LABEL_16:
      v16 = 0;
      goto LABEL_17;
    }
    APLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v43 = objc_msgSend__configurationVersion(self, v41, v42);
      *(_DWORD *)buf = 134217984;
      v45 = v43;
      v18 = "Configuration system up to date version %lu.";
      v19 = v17;
      v20 = OS_LOG_TYPE_DEFAULT;
      v21 = 12;
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend_responseBody(v5, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    APLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "Error: Response empty, no config file.";
      v19 = v17;
      v20 = OS_LOG_TYPE_ERROR;
      v21 = 2;
LABEL_14:
      _os_log_impl(&dword_235C39000, v19, v20, v18, buf, v21);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_17:
  objc_msgSend__runCompletionHandlerWithSuccess_data_(self, v15, v8, v16);

}

- (BOOL)_testingFlag
{
  uint64_t v2;
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  char v13;
  char v14;

  if (!objc_msgSend_isAppleInternalInstall(MEMORY[0x24BDFD4B8], a2, v2))
    return 0;
  v3 = objc_alloc(MEMORY[0x24BDBCF50]);
  v5 = (void *)objc_msgSend_initWithSuiteName_(v3, v4, *MEMORY[0x24BDFD450]);
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("APConfigurationSystem.testEnvironment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    v13 = objc_msgSend_BOOLValue(v10, v11, v12);
  }
  else
  {
    v10 = (id)MEMORY[0x24BDBD1C0];
    v13 = objc_msgSend_BOOLValue(MEMORY[0x24BDBD1C0], v8, v9);
  }
  v14 = v13;

  return (v14 & 1) != 0;
}

- (int64_t)_configurationVersion
{
  APVersionHelper *v2;
  APVersionData *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  int64_t v8;

  v2 = [APVersionHelper alloc];
  v3 = objc_alloc_init(APVersionData);
  v5 = (void *)objc_msgSend_initWithDatasource_(v2, v4, (uint64_t)v3);

  v8 = objc_msgSend_systemVersion(v5, v6, v7);
  return v8;
}

- (id)_queryItems
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  const char *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend__testingFlag(self, v4, v5))
  {
    objc_msgSend_queryItemWithName_value_(MEMORY[0x24BDD1838], v6, (uint64_t)CFSTR("t"), CFSTR("true"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v9, (uint64_t)v8);

  }
  if (objc_msgSend_isAppleInternalInstall(MEMORY[0x24BDFD4B8], v6, v7))
  {
    objc_msgSend_queryItemWithName_value_(MEMORY[0x24BDD1838], v10, (uint64_t)CFSTR("ib"), CFSTR("true"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

  }
  objc_msgSend_locale(MEMORY[0x24BDFD4B0], v10, v11);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queryItemWithName_value_(MEMORY[0x24BDD1838], v14, (uint64_t)CFSTR("l"), v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v15, (uint64_t)v56);
  v16 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend_storefront(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queryItemWithName_value_(v16, v20, (uint64_t)CFSTR("sf"), v19);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(v3, v21, (uint64_t)v55);
  objc_msgSend_modelType(MEMORY[0x24BDFD4B0], v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queryItemWithName_value_(MEMORY[0x24BDD1838], v25, (uint64_t)CFSTR("dc"), v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v27, (uint64_t)v26);
  objc_msgSend_shortBuildVersion(MEMORY[0x24BDFD4B0], v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queryItemWithName_value_(MEMORY[0x24BDD1838], v31, (uint64_t)CFSTR("b"), v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v33, (uint64_t)v32);
  objc_msgSend_osIdentifier(MEMORY[0x24BDFD4B0], v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queryItemWithName_value_(MEMORY[0x24BDD1838], v37, (uint64_t)CFSTR("os"), v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v39, (uint64_t)v38);
  v42 = objc_msgSend__configurationVersion(self, v40, v41);
  v43 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v44, v42);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringValue(v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queryItemWithName_value_(v43, v49, (uint64_t)CFSTR("v"), v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(v3, v51, (uint64_t)v50);
  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v52, (uint64_t)v3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

- (void)_sendCoreAnalyticsWithUpdateStatus:(int64_t)a3 version:(int64_t)a4
{
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v18[0] = CFSTR("ClientConfigVersion");
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  v18[1] = CFSTR("StatusCode");
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v8;
  v18[2] = CFSTR("TestingFlag");
  v9 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend__testingFlag(self, v10, v11);
  objc_msgSend_numberWithBool_(v9, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v19, v18, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sendEvent_customPayload_(MEMORY[0x24BDFD478], v17, (uint64_t)CFSTR("ConfigurationSystemRequest"), v16);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (void)setResponseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_responseQueue, a3);
}

- (NSURLSessionDataTask)sessionDataTask
{
  return self->_sessionDataTask;
}

- (void)setSessionDataTask:(id)a3
{
  objc_storeStrong((id *)&self->_sessionDataTask, a3);
}

- (NSString)storefront
{
  return self->_storefront;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_sessionDataTask, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
