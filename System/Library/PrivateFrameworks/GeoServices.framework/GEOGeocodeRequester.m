@implementation GEOGeocodeRequester

+ (id)sharedGeocodeRequester
{
  if (qword_1ECDBBC90 != -1)
    dispatch_once(&qword_1ECDBBC90, &__block_literal_global_7);
  return (id)qword_1ECDBBC98;
}

void __45__GEOGeocodeRequester_sharedGeocodeRequester__block_invoke()
{
  GEOGeocodeRequester *v0;
  void *v1;

  v0 = objc_alloc_init(GEOGeocodeRequester);
  v1 = (void *)qword_1ECDBBC98;
  qword_1ECDBBC98 = (uint64_t)v0;

}

- (void)batchReverseGeocode:(id)a3 auditToken:(id)a4 success:(id)a5 networkActivity:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t);
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void (**v23)(id, uint64_t);
  _QWORD v24[4];
  void (**v25)(id, uint64_t);
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, uint64_t))a6;
  v16 = a7;
  if (v15)
    v15[2](v15, 1);
  GEOFindOrCreateLog("com.apple.greentea", "GEO");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO) && objc_msgSend(v12, "hasGreenTeaWithValue:", 1))
    GEOGreenTeaLog(v17, (uint64_t)"RevGeoCode", v13);

  +[GEOMapService sharedService](GEOMapService, "sharedService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "defaultTraits");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[GEOGeocodeRequestConfig standardConfig](GEOGeocodeRequestConfig, "standardConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__GEOGeocodeRequester_batchReverseGeocode_auditToken_success_networkActivity_error___block_invoke;
  v24[3] = &unk_1E1C07A88;
  v25 = v15;
  v26 = v14;
  v27 = v16;
  v21 = v16;
  v22 = v14;
  v23 = v15;
  -[GEOServiceRequester _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:](self, "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:", v12, v19, v13, v20, 0, 0, v24);

}

void __84__GEOGeocodeRequester_batchReverseGeocode_auditToken_success_networkActivity_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = a1[4];
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  if (v10)
  {
    v7 = a1[5];
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_8:
      v8();
    }
  }
  else
  {
    v9 = a1[6];
    if (v9)
    {
      v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_8;
    }
  }

}

@end
