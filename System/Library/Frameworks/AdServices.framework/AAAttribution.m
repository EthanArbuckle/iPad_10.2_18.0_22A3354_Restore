@implementation AAAttribution

+ (NSString)attributionTokenWithError:(NSError *)error
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  AAAttributionRequester *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char isMainThread;
  id *v24;
  void *v25;
  id v26;
  NSObject *v27;
  _BOOL4 v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  sub_227C0E9D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227C0D000, v4, OS_LOG_TYPE_INFO, "Attribution Token request", buf, 2u);
  }

  objc_msgSend_now(MEMORY[0x24BDBCE60], v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [AAAttributionRequester alloc];
  objc_msgSend_setupXPCConnection(AAAttribution, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isMainThread = objc_msgSend_isMainThread(MEMORY[0x24BDD17F0], v18, v19, v20, v21, v22);
  v24 = sub_227C0EAB4((id *)&v11->super.isa, v17, isMainThread, v10);

  v36 = 0;
  sub_227C0EC44(v24, &v36);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v36;
  sub_227C0E9D0();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
  if (v25 || !v26)
  {
    if (v28)
    {
      *(_DWORD *)buf = 138543362;
      v38 = v25;
      _os_log_impl(&dword_227C0D000, v27, OS_LOG_TYPE_INFO, "Returning token to caller: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    if (v28)
    {
      objc_msgSend_localizedDescription(v26, v29, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v34;
      _os_log_impl(&dword_227C0D000, v27, OS_LOG_TYPE_INFO, "Returning error to caller: %{public}@", buf, 0xCu);

    }
    if (error)
      *error = (NSError *)objc_retainAutorelease(v26);
  }

  return (NSString *)v25;
}

+ (id)setupXPCConnection
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = objc_alloc(MEMORY[0x24BDD1988]);
  v6 = (void *)objc_msgSend_initWithMachServiceName_options_(v2, v3, (uint64_t)CFSTR("com.apple.ap.promotedcontent.attributionservice"), 4096, v4, v5);
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v7, (uint64_t)&unk_255920EE8, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_(v6, v12, (uint64_t)v11, v13, v14, v15);

  objc_msgSend_resume(v6, v16, v17, v18, v19, v20);
  return v6;
}

@end
