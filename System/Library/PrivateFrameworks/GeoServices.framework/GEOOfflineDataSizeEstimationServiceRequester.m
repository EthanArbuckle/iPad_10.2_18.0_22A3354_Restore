@implementation GEOOfflineDataSizeEstimationServiceRequester

- (void)startWithRequest:(id)a3 traits:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  GEOFindOrCreateLog("com.apple.greentea", "GEO");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO) && objc_msgSend(v10, "hasGreenTeaWithValue:", 1))
    GEOGreenTeaLog(v13, (uint64_t)"OfflineDataService", 0);

  +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_GEOOfflineDataSizeEstimationServiceRequestConfig standardConfig](_GEOOfflineDataSizeEstimationServiceRequestConfig, "standardConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __98__GEOOfflineDataSizeEstimationServiceRequester_startWithRequest_traits_options_completionHandler___block_invoke;
  v17[3] = &unk_1E1BFFB70;
  v18 = v11;
  v16 = v11;
  -[GEOServiceRequester _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:](self, "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:", v10, v12, v14, v15, 0, a5, v17);

}

uint64_t __98__GEOOfflineDataSizeEstimationServiceRequester_startWithRequest_traits_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
