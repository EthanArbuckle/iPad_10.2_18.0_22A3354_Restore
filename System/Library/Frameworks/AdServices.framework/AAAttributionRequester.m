@implementation AAAttributionRequester

+ (int64_t)_findBucketForDaemonRunningTime:(double)a3
{
  int64_t result;

  for (result = 0; result != 10; ++result)
  {
    if (qword_227C106B0[result] >= (uint64_t)(a3 * 1000.0))
      break;
  }
  return result;
}

- (void)_reportTokenStatus:(int64_t)a3 storeFront:(id)a4 daemonRunningTime:(double)a5
{
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_signpost_id_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  APPerfLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_intervalId(self, v9, v10, v11, v12, v13);
  if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 134349312;
      v30 = objc_msgSend_intervalId(self, v16, v17, v18, v19, v20);
      v31 = 2050;
      v32 = a3;
      _os_signpost_emit_with_name_impl(&dword_227C0D000, v8, OS_SIGNPOST_EVENT, v15, "Token Status", "Token Status id=%{public, name=id}lld status=%{public, name=status}ld", buf, 0x16u);
    }
  }

  objc_msgSend_now(MEMORY[0x24BDBCE60], v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v7;
  v28 = v26;
  AnalyticsSendEventLazy();

}

+ (int64_t)_tokenStatusFromTokenSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3 + 2;
}

+ (id)_createInternalError
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = CFSTR("An internal error occurred");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v10, (uint64_t)&v9, 1, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v3, v5, (uint64_t)CFSTR("com.apple.ap.adservices.attributionError"), 2, (uint64_t)v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_sendAnalyticsAndInvalidateConnection:(unint64_t)a3 end:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v9;
  const char *v10;
  uint64_t v11;
  _QWORD v12[5];

  objc_msgSend_remoteProxy(self, a2, a3, a4, v4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_227C0FD60;
  v12[3] = &unk_24F05E428;
  v12[4] = self;
  objc_msgSend_attributionAnalytics_end_Handler_(v9, v10, a3, a4, (uint64_t)v12, v11);

}

- (BOOL)connectionInterrupted
{
  return self->_connectionInterrupted;
}

- (void)setConnectionInterrupted:(BOOL)a3
{
  self->_connectionInterrupted = a3;
}

- (AAAttribution_XPC)remoteProxy
{
  return self->_remoteProxy;
}

- (void)setRemoteProxy:(id)a3
{
  objc_storeStrong((id *)&self->_remoteProxy, a3);
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(os_unfair_lock_s)a3
{
  self->_unfairLock = a3;
}

- (BOOL)isMainThread
{
  return self->_isMainThread;
}

- (void)setIsMainThread:(BOOL)a3
{
  self->_isMainThread = a3;
}

- (NSDate)requestTime
{
  return self->_requestTime;
}

- (void)setRequestTime:(id)a3
{
  objc_storeStrong((id *)&self->_requestTime, a3);
}

- (unint64_t)intervalId
{
  return self->_intervalId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTime, 0);
  objc_storeStrong((id *)&self->_remoteProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
