@implementation GEOOfflineDataKeysServiceRequester

- (void)startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v12 = a3;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  GEOFindOrCreateLog("com.apple.greentea", "GEO");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO) && objc_msgSend(v12, "hasGreenTeaWithValue:", 1))
    GEOGreenTeaLog(v16, (uint64_t)"OfflineDataService", 0);

  +[_GEOOfflineDataKeysServiceRequestConfig standardConfig](_GEOOfflineDataKeysServiceRequestConfig, "standardConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99__GEOOfflineDataKeysServiceRequester_startWithRequest_traits_auditToken_options_completionHandler___block_invoke;
  v19[3] = &unk_1E1BFFB70;
  v20 = v13;
  v18 = v13;
  -[GEOServiceRequester _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:](self, "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:", v12, v15, v14, v17, 0, a6, v19);

}

uint64_t __99__GEOOfflineDataKeysServiceRequester_startWithRequest_traits_auditToken_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
