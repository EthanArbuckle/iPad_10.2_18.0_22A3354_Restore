@implementation GEORPFeedbackRequester

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__GEORPFeedbackRequester_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECDBB8B8 != -1)
    dispatch_once(&qword_1ECDBB8B8, block);
  return (id)qword_1ECDBB8B0;
}

void __40__GEORPFeedbackRequester_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECDBB8B0;
  qword_1ECDBB8B0 = (uint64_t)v1;

}

- (id)_requestConfigForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  __objc2_class **v7;
  uint64_t v8;

  v3 = a3;
  +[GEORPFeedbackSubmissionConfig standardConfig](GEORPFeedbackSubmissionConfig, "standardConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedbackRequestParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isPOIEnrichment");

  if ((v6 & 1) != 0)
  {
    v7 = off_1E1BEDD90;
LABEL_5:
    -[__objc2_class standardConfig](*v7, "standardConfig");
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "hasLayoutConfigParameters"))
  {
    v7 = off_1E1BEDED0;
    goto LABEL_5;
  }
LABEL_6:

  return v4;
}

- (void)startWithRequest:(id)a3 traits:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  GEOFindOrCreateLog("com.apple.greentea", "GEO");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO) && objc_msgSend(v8, "hasGreenTeaWithValue:", 1))
    GEOGreenTeaLog(v11, (uint64_t)"RAP", 0);

  -[GEORPFeedbackRequester _requestConfigForRequest:](self, "_requestConfigForRequest:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "defaultTraits");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__GEORPFeedbackRequester_startWithRequest_traits_completionHandler___block_invoke;
  v15[3] = &unk_1E1BFFB70;
  v16 = v10;
  v14 = v10;
  -[GEOServiceRequester _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:](self, "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:", v8, v9, 0, v12, 0, 0, v15);

}

uint64_t __68__GEORPFeedbackRequester_startWithRequest_traits_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_validateResponse:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "status");
    if (!v4)
    {
      v7 = 0;
      goto LABEL_10;
    }
    v5 = -7;
    if (v4 == 20)
      v5 = -8;
    if (v4 == 5)
      v6 = -10;
    else
      v6 = v5;
  }
  else
  {
    v6 = -8;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v7;
}

@end
