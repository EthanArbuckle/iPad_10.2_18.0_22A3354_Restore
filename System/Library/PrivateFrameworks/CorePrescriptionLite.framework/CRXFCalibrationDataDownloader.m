@implementation CRXFCalibrationDataDownloader

- (CRXFCalibrationDataDownloader)initWithServer:(unint64_t)a3 serverVersion:(id)a4 timeout:(double)a5
{
  id v8;
  CRXFCalibrationDataDownloader *v9;
  os_log_t v10;
  OS_os_log *log;
  uint64_t v12;
  NSMutableDictionary *downloads;
  CRXFServiceConnection *v14;
  CRXFServiceConnection *connection;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *fetchOptions;
  uint64_t v22;
  CRXUNetworkReachability *networkReachability;
  objc_super v25;

  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CRXFCalibrationDataDownloader;
  v9 = -[CRXFCalibrationDataDownloader init](&v25, sel_init);
  if (!v9)
    goto LABEL_10;
  v10 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
  log = v9->_log;
  v9->_log = (OS_os_log *)v10;

  v9->_timeout = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = objc_claimAutoreleasedReturnValue();
  downloads = v9->_downloads;
  v9->_downloads = (NSMutableDictionary *)v12;

  v14 = -[CRXFServiceConnection initWithServiceName:protocol:]([CRXFServiceConnection alloc], "initWithServiceName:protocol:", CFSTR("com.apple.CorePrescription.CalibrationDataFetcher"), &unk_256944028);
  connection = v9->_connection;
  v9->_connection = v14;

  v9->_nextDownloadID = 0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a3 == 1)
  {
    v18 = &unk_250B0AA90;
    goto LABEL_6;
  }
  if (a3 == 2)
  {
    v18 = &unk_250B0AAA8;
LABEL_6:
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("environment"));
  }
  if (v8)
  {
    v19 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("version"));

  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v17);
  v20 = objc_claimAutoreleasedReturnValue();
  fetchOptions = v9->_fetchOptions;
  v9->_fetchOptions = (NSDictionary *)v20;

  +[CRXUNetworkReachability sharedInstance](CRXUNetworkReachability, "sharedInstance");
  v22 = objc_claimAutoreleasedReturnValue();
  networkReachability = v9->_networkReachability;
  v9->_networkReachability = (CRXUNetworkReachability *)v22;

LABEL_10:
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[CRXFServiceConnection forceInvalidate](self->_connection, "forceInvalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRXFCalibrationDataDownloader;
  -[CRXFCalibrationDataDownloader dealloc](&v3, sel_dealloc);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)downloadCalibrationDataForACCPayload:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  NSObject *log;
  void *v17;
  NSObject *v18;
  void *v19;
  NSDictionary *fetchOptions;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  unint64_t v26;
  _QWORD v27[6];
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    +[CRXUDispatchQueue main](CRXUDispatchQueue, "main");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[CRXUNetworkReachability isConnected](self->_networkReachability, "isConnected"))
  {
    +[CRXFAppClipCodeTranscoder sharedInstance](CRXFAppClipCodeTranscoder, "sharedInstance");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "derivePayloadWithSoftwareBitsZeroedFromPayload:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[CRXFCalibrationDataDownloader addDownloadWithCompletionQueue:completion:](self, "addDownloadWithCompletionQueue:completion:", v9, v10);
      kdebug_trace();
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
        -[CRXFCalibrationDataDownloader downloadCalibrationDataForACCPayload:completionQueue:completion:].cold.1();
      -[CRXFServiceConnection activate](self->_connection, "activate", v8);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_102;
      v27[3] = &unk_250B03CC0;
      v27[4] = self;
      v27[5] = v13;
      objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)MEMORY[0x24BDD16E0];
        v18 = log;
        objc_msgSend(v17, "numberWithUnsignedInteger:", v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v35 = "-[CRXFCalibrationDataDownloader downloadCalibrationDataForACCPayload:completionQueue:completion:]";
        v36 = 1024;
        v37 = 337;
        v38 = 2114;
        v39 = v19;
        _os_log_impl(&dword_239FC4000, v18, OS_LOG_TYPE_INFO, "%s @%d: Starting XPC call for downloadID %{public}@", buf, 0x1Cu);

      }
      fetchOptions = self->_fetchOptions;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_105;
      v24[3] = &unk_250B03CE8;
      v24[4] = self;
      v26 = v13;
      v8 = v23;
      v25 = v23;
      objc_msgSend(v15, "fetchAccessoryDataByACC:options:withReply:", v12, fetchOptions, v24);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 32, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCalibrationDataDownloader.m", 314, MEMORY[0x24BDBD1B8]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_2;
      v28[3] = &unk_250B03C98;
      v29 = v22;
      v30 = v10;
      v14 = v22;
      objc_msgSend(v9, "dispatchAsync:", v28);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 23, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCalibrationDataDownloader.m", 302, MEMORY[0x24BDBD1B8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke;
    v31[3] = &unk_250B03C98;
    v32 = v21;
    v33 = v10;
    v11 = v21;
    objc_msgSend(v9, "dispatchAsync:", v31);

    v12 = v33;
  }

}

uint64_t __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 0.0);
}

uint64_t __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 0.0);
}

void __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_102(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR))
    __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_102_cold_1();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "finishDownloadWithID:data:error:", *(_QWORD *)(a1 + 40), 0, v3);

}

void __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_105(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  CRXFCalibrationData *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  kdebug_trace();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = *(_QWORD *)(a1 + 48);
    v13 = v10;
    objc_msgSend(v11, "numberWithUnsignedInteger:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315906;
    v17 = "-[CRXFCalibrationDataDownloader downloadCalibrationDataForACCPayload:completionQueue:completion:]_block_invoke";
    v18 = 1024;
    v19 = 348;
    v20 = 2114;
    v21 = v14;
    v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_239FC4000, v13, OS_LOG_TYPE_INFO, "%s @%d: XPC call completed for downloadID %{public}@ with error %{public}@", (uint8_t *)&v16, 0x26u);

  }
  if (v9)
    v15 = 0;
  else
    v15 = -[CRXFCalibrationData initWithACCPayload:leftCalibrationData:rightCalibrationData:]([CRXFCalibrationData alloc], "initWithACCPayload:leftCalibrationData:rightCalibrationData:", *(_QWORD *)(a1 + 40), v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "finishDownloadWithID:data:error:", *(_QWORD *)(a1 + 48), v15, v9);

}

- (void)downloadCalibrationDataForASAKey:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *log;
  void *v16;
  NSObject *v17;
  void *v18;
  NSDictionary *fetchOptions;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    +[CRXUDispatchQueue main](CRXUDispatchQueue, "main");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[CRXUNetworkReachability isConnected](self->_networkReachability, "isConnected"))
  {
    v11 = -[CRXFCalibrationDataDownloader addDownloadWithCompletionQueue:completion:](self, "addDownloadWithCompletionQueue:completion:", v9, v10);
    kdebug_trace();
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      -[CRXFCalibrationDataDownloader downloadCalibrationDataForASAKey:completionQueue:completion:].cold.1();
    -[CRXFServiceConnection activate](self->_connection, "activate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke_108;
    v22[3] = &unk_250B03CC0;
    v22[4] = self;
    v22[5] = v11;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = log;
      objc_msgSend(v16, "numberWithUnsignedInteger:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v27 = "-[CRXFCalibrationDataDownloader downloadCalibrationDataForASAKey:completionQueue:completion:]";
      v28 = 1024;
      v29 = 391;
      v30 = 2114;
      v31 = v18;
      _os_log_impl(&dword_239FC4000, v17, OS_LOG_TYPE_INFO, "%s @%d: Starting XPC call for downloadID %{public}@", buf, 0x1Cu);

      v13 = MEMORY[0x24BDAC760];
    }
    fetchOptions = self->_fetchOptions;
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke_109;
    v21[3] = &unk_250B03D10;
    v21[4] = self;
    v21[5] = v11;
    objc_msgSend(v14, "fetchAccessoryDataByFullKey:options:withReply:", v8, fetchOptions, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 23, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCalibrationDataDownloader.m", 369, MEMORY[0x24BDBD1B8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke;
    v23[3] = &unk_250B03C98;
    v24 = v20;
    v25 = v10;
    v12 = v20;
    objc_msgSend(v9, "dispatchAsync:", v23);

  }
}

uint64_t __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 0.0);
}

void __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke_108(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR))
    __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke_108_cold_1();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "finishDownloadWithID:data:error:", *(_QWORD *)(a1 + 40), 0, v3);

}

void __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke_109(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  CRXFCalibrationData *v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  kdebug_trace();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  if (!(v11 | v12))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crxf_errorWithCode:file:line:userInfo:", 6, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCalibrationDataDownloader.m", 403, MEMORY[0x24BDBD1B8]);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)MEMORY[0x24BDD16E0];
    v15 = *(_QWORD *)(a1 + 40);
    v16 = v13;
    objc_msgSend(v14, "numberWithUnsignedInteger:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315906;
    v20 = "-[CRXFCalibrationDataDownloader downloadCalibrationDataForASAKey:completionQueue:completion:]_block_invoke";
    v21 = 1024;
    v22 = 407;
    v23 = 2114;
    v24 = v17;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_239FC4000, v16, OS_LOG_TYPE_INFO, "%s @%d: XPC call completed for downloadID %{public}@ with error %{public}@", (uint8_t *)&v19, 0x26u);

  }
  if (v12)
    v18 = 0;
  else
    v18 = -[CRXFCalibrationData initWithACCPayload:leftCalibrationData:rightCalibrationData:]([CRXFCalibrationData alloc], "initWithACCPayload:leftCalibrationData:rightCalibrationData:", v11, v9, v10);
  objc_msgSend(*(id *)(a1 + 32), "finishDownloadWithID:data:error:", *(_QWORD *)(a1 + 40), v18, v12);

}

- (void)fetchUserInfoWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CRXFFetchUserInfoRequest *v8;
  void *v9;
  uint64_t v10;
  id v11;
  CRXFFetchUserInfoRequest *v12;
  void *v13;
  CRXFFetchUserInfoRequest *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  CRXFFetchUserInfoRequest *v18;
  _QWORD v19[5];
  id v20;
  CRXFFetchUserInfoRequest *v21;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[CRXUDispatchQueue main](CRXUDispatchQueue, "main");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[CRXFFetchUserInfoRequest initWithTimeout:completionQueue:completion:]([CRXFFetchUserInfoRequest alloc], "initWithTimeout:completionQueue:completion:", v6, v7, self->_timeout);
  -[CRXFServiceConnection activate](self->_connection, "activate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke;
  v19[3] = &unk_250B03D60;
  v19[4] = self;
  v11 = v6;
  v20 = v11;
  v12 = v8;
  v21 = v12;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_2;
  v16[3] = &unk_250B03DB0;
  v16[4] = self;
  v17 = v11;
  v18 = v12;
  v14 = v12;
  v15 = v11;
  objc_msgSend(v13, "fetchUserInfoWithReply:", v16);

}

void __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR))
    __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_cold_1();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_112;
  v6[3] = &unk_250B03D38;
  v4 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "dispatchAsync:", v6);

}

uint64_t __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_112(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithUserInfo:error:", 0, *(_QWORD *)(a1 + 40));
}

void __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_3;
  v14[3] = &unk_250B03D88;
  v15 = v9;
  v16 = v7;
  v17 = v8;
  v10 = *(void **)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v11 = v8;
  v12 = v7;
  v13 = v9;
  objc_msgSend(v10, "dispatchAsync:", v14);

}

void __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  CRXFUserInfo *v3;
  CRXFUserInfo *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    v3 = -[CRXFUserInfo initWithUserID:firstName:]([CRXFUserInfo alloc], "initWithUserID:firstName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 56), "finishWithUserInfo:error:", v3, v2);

}

- (unint64_t)addDownloadWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CRXFCalibrationDataDownload *v8;
  NSMutableDictionary *v9;
  unint64_t v10;
  NSMutableDictionary *downloads;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = -[CRXFCalibrationDataDownload initWithTimeout:completionQueue:completion:]([CRXFCalibrationDataDownload alloc], "initWithTimeout:completionQueue:completion:", v6, v7, self->_timeout);
  v9 = self->_downloads;
  objc_sync_enter(v9);
  v10 = self->_nextDownloadID + 1;
  self->_nextDownloadID = v10;
  downloads = self->_downloads;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](downloads, "setObject:forKeyedSubscript:", v8, v12);

  objc_sync_exit(v9);
  return v10;
}

- (void)finishDownloadWithID:(unint64_t)a3 data:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  NSObject *log;

  v8 = a4;
  v9 = a5;
  v10 = self->_downloads;
  objc_sync_enter(v10);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_downloads, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_downloads, "removeObjectForKey:", v11);

  objc_sync_exit(v10);
  if (v12)
  {
    objc_msgSend(v12, "finishWithData:error:", v8, v9);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      -[CRXFCalibrationDataDownloader finishDownloadWithID:data:error:].cold.1(log, v12);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_fetchOptions, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)downloadCalibrationDataForACCPayload:completionQueue:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  _WORD v2[10];
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v2 = 136315907;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v2[7] = 326;
  v2[9] = 2113;
  v3 = CFSTR("com.apple.CorePrescription.CalibrationDataFetcher");
  v4 = 2113;
  v5 = v0;
  _os_log_debug_impl(&dword_239FC4000, v1, OS_LOG_TYPE_DEBUG, "%s @%d: Downloading calibration for service: %{private}@, ACC: %{private}@", (uint8_t *)v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

void __97__CRXFCalibrationDataDownloader_downloadCalibrationDataForACCPayload_completionQueue_completion___block_invoke_102_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_239FC4000, v0, v1, "%s @%d: remote proxy error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)downloadCalibrationDataForASAKey:completionQueue:completion:.cold.1()
{
  os_log_t v0;
  _DWORD v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)((char *)&v1[3] + 2) = 380;
  _os_log_debug_impl(&dword_239FC4000, v0, OS_LOG_TYPE_DEBUG, "%s @%d: Downloading calibration for ASA Key", (uint8_t *)v1, 0x12u);
}

void __93__CRXFCalibrationDataDownloader_downloadCalibrationDataForASAKey_completionQueue_completion___block_invoke_108_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_239FC4000, v0, v1, "%s @%d: remote proxy error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __77__CRXFCalibrationDataDownloader_fetchUserInfoWithCompletionQueue_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_239FC4000, v0, v1, "%s @%d: remote proxy error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)finishDownloadWithID:(void *)a1 data:(void *)a2 error:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "roundtripTime");
  +[CRXUFormatters timeIntervalAsString:](CRXUFormatters, "timeIntervalAsString:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_239FC4000, v3, OS_LOG_TYPE_DEBUG, "%s @%d: XPC call roundtrip time: %{public}@", (uint8_t *)v5, 0x1Cu);

}

@end
