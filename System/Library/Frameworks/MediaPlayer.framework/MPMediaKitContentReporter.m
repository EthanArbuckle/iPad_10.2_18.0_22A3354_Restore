@implementation MPMediaKitContentReporter

- (MPMediaKitContentReporter)init
{
  MPMediaKitContentReporter *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPMediaKitContentReporter;
  v2 = -[MPMediaKitContentReporter init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPMediaKitContentReporter.operationQueue"));
    -[NSOperationQueue setQualityOfService:](v2->_operationQueue, "setQualityOfService:", 25);
  }
  return v2;
}

- (void)submitReport:(id)a3 completion:(id)a4
{
  -[MPMediaKitContentReporter submitReport:body:completion:](self, "submitReport:body:completion:", a3, 0, a4);
}

- (void)submitReport:(id)a3 body:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[3];
  _QWORD v45[5];

  v45[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v36 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E08];
  v44[0] = CFSTR("kind");
  -[MPMediaKitContentReporter contentReportKindStringForType:](self, "contentReportKindStringForType:", objc_msgSend(v8, "concernItemType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v11;
  v44[1] = CFSTR("reason");
  objc_msgSend(v8, "concernTypeID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v12;
  v44[2] = CFSTR("comments");
  objc_msgSend(v8, "commentText");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &stru_1E3163D10;
  if (v13)
    v15 = (const __CFString *)v13;
  v45[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99E08];
  v42[0] = CFSTR("id");
  objc_msgSend(v8, "concernItemID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = CFSTR("type");
  v43[0] = v19;
  -[MPMediaKitContentReporter contentReportTypeStringForType:](self, "contentReportTypeStringForType:", objc_msgSend(v8, "concernItemType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryWithDictionary:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v9;
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v9)
  {
    v25 = v9;
    v26 = v35;
  }
  else
  {
    objc_msgSend(v8, "parentContentID");
    v27 = objc_claimAutoreleasedReturnValue();
    v26 = v35;
    if (v27)
    {
      v28 = (void *)v27;
      objc_msgSend(v8, "parentConcernType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v8, "parentContentID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v30, CFSTR("id"));

        objc_msgSend(v8, "parentConcernType");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, CFSTR("type"));

        objc_msgSend(v35, "addObject:", v24);
      }
    }
    objc_msgSend(v35, "addObject:", v22);
    v40[0] = CFSTR("concern");
    v40[1] = CFSTR("contents");
    v41[0] = v17;
    v41[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v32, 0, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    v23 = 0;
  }
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __58__MPMediaKitContentReporter_submitReport_body_completion___block_invoke;
  v37[3] = &unk_1E3161FC0;
  v37[4] = self;
  v38 = v25;
  v39 = v36;
  v33 = v36;
  v34 = v25;
  -[MPMediaKitContentReporter _performWithBag:](self, "_performWithBag:", v37);

}

- (void)_performWithBag:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithIdentity:", v5);

  objc_msgSend(MEMORY[0x1E0DDC0D0], "sharedBagProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__MPMediaKitContentReporter__performWithBag___block_invoke;
  v9[3] = &unk_1E3161FE8;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "getBagForRequestContext:withCompletionHandler:", v6, v9);

}

- (id)reportsForType:(int64_t)a3 contentID:(id)a4 commentText:(id)a5 concernParentItemID:(id)a6 concernParentItemType:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  MPMediaKitContentReport *v23;
  id obj;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = a4;
  v26 = a5;
  v12 = a6;
  v13 = a7;
  -[MPMediaKitContentReporter _dictionariesForType:](self, "_dictionariesForType:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v14;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v20, "objectForKey:", CFSTR("label"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", CFSTR("id"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_alloc_init(MPMediaKitContentReport);
        -[MPMediaKitContentReport setConcernItemType:](v23, "setConcernItemType:", a3);
        -[MPMediaKitContentReport setConcernTypeID:](v23, "setConcernTypeID:", v22);
        -[MPMediaKitContentReport setDisplayText:](v23, "setDisplayText:", v21);
        -[MPMediaKitContentReport setCommentText:](v23, "setCommentText:", v26);
        -[MPMediaKitContentReport setConcernItemID:](v23, "setConcernItemID:", v27);
        -[MPMediaKitContentReport setParentContentID:](v23, "setParentContentID:", v12);
        -[MPMediaKitContentReport setParentConcernType:](v23, "setParentConcernType:", v13);
        objc_msgSend(v15, "addObject:", v23);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v17);
  }

  return v15;
}

- (id)_dictionariesForType:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;

  if ((unint64_t)a3 > 4)
  {
    v5 = 0;
  }
  else
  {
    v3 = off_1E31619E0[a3];
    -[MPMediaKitContentReporter _reportConcernBagDictionary](self, "_reportConcernBagDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_reportConcernBagDictionary
{
  NSDictionary *reportConcernBagDictionary;
  NSDictionary **p_reportConcernBagDictionary;
  dispatch_semaphore_t v5;
  NSObject *v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  p_reportConcernBagDictionary = &self->_reportConcernBagDictionary;
  reportConcernBagDictionary = self->_reportConcernBagDictionary;
  if (!reportConcernBagDictionary)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__44758;
    v15 = __Block_byref_object_dispose__44759;
    v16 = 0;
    v5 = dispatch_semaphore_create(0);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__MPMediaKitContentReporter__reportConcernBagDictionary__block_invoke;
    v8[3] = &unk_1E3162010;
    v10 = &v11;
    v6 = v5;
    v9 = v6;
    -[MPMediaKitContentReporter _performWithBag:](self, "_performWithBag:", v8);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)p_reportConcernBagDictionary, (id)v12[5]);

    _Block_object_dispose(&v11, 8);
    reportConcernBagDictionary = *p_reportConcernBagDictionary;
  }
  return reportConcernBagDictionary;
}

- (id)contentReportKindStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return &stru_1E3163D10;
  else
    return off_1E3161A08[a3];
}

- (id)contentReportTypeStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return &stru_1E3163D10;
  else
    return off_1E3161A30[a3];
}

- (id)contentReporterURLOperation:(id)a3 bodyData:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  MPMediaKitContentReporter *v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0DDBEE8]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__MPMediaKitContentReporter_contentReporterURLOperation_bodyData_withCompletion___block_invoke;
  v17[3] = &unk_1E3161998;
  v18 = v8;
  v19 = v9;
  v20 = self;
  v21 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = (void *)objc_msgSend(v11, "initWithStartHandler:", v17);

  return v15;
}

- (id)urlLoadRequestWithRequest:(id)a3 requestContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  v9 = (void *)MEMORY[0x1E0DDBEF8];
  objc_msgSend(v7, "clientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:bundleIdentifier:", v10, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0DDBFA8]);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __70__MPMediaKitContentReporter_urlLoadRequestWithRequest_requestContext___block_invoke;
  v23 = &unk_1E31619C0;
  v24 = v12;
  v25 = v5;
  v14 = v5;
  v15 = v12;
  v16 = (void *)objc_msgSend(v13, "initWithBlock:", &v20);
  v17 = objc_alloc(MEMORY[0x1E0DDBFB0]);
  v18 = (void *)objc_msgSend(v17, "initWithURLRequest:requestContext:", v6, v16, v20, v21, v22, v23);

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->contentReporterURLOperation, 0);
  objc_storeStrong((id *)&self->contentReportTypeStringForType, 0);
  objc_storeStrong((id *)&self->contentReportKindStringForType, 0);
  objc_storeStrong((id *)&self->_reportConcernBagDictionary, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __70__MPMediaKitContentReporter_urlLoadRequestWithRequest_requestContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setClientInfo:", v3);
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentity:", v5);

}

void __81__MPMediaKitContentReporter_contentReporterURLOperation_bodyData_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setHTTPBody:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("application/json"), *MEMORY[0x1E0DDBD48]);
  objc_msgSend(MEMORY[0x1E0DDBEF8], "clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:", CFSTR("com.apple.Music"), CFSTR("1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithIdentity:identityStore:clientInfo:", v7, v8, v5);

  objc_msgSend(*(id *)(a1 + 48), "urlLoadRequestWithRequest:requestContext:", v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC0F0], "defaultSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__MPMediaKitContentReporter_contentReporterURLOperation_bodyData_withCompletion___block_invoke_2;
  v14[3] = &unk_1E3162038;
  v12 = *(id *)(a1 + 56);
  v15 = v3;
  v16 = v12;
  v13 = v3;
  objc_msgSend(v11, "enqueueDataRequest:withCompletionHandler:", v10, v14);

}

void __81__MPMediaKitContentReporter_contentReporterURLOperation_bodyData_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "parsedBodyDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);

}

void __56__MPMediaKitContentReporter__reportConcernBagDictionary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "dictionaryForBagKey:", *MEMORY[0x1E0DDBE90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("reportConcern"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __45__MPMediaKitContentReporter__performWithBag___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __58__MPMediaKitContentReporter_submitReport_body_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v3 = *MEMORY[0x1E0DDBE78];
  v4 = a2;
  objc_msgSend(v4, "stringForBagKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForBagKey:", *MEMORY[0x1E0DDBE68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ic_stringValueForKey:", CFSTR("default"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@/v1/catalog/%@/concerns"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__MPMediaKitContentReporter_submitReport_body_completion___block_invoke_2;
  v13[3] = &unk_1E3161F98;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v10, "contentReporterURLOperation:bodyData:withCompletion:", v9, v11, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addOperation:", v12);

}

uint64_t __58__MPMediaKitContentReporter_submitReport_body_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (MPMediaKitContentReporter)sharedReporter
{
  if (sharedReporter_isDispatched != -1)
    dispatch_once(&sharedReporter_isDispatched, &__block_literal_global_44861);
  return (MPMediaKitContentReporter *)(id)sharedReporter_sharedInstance;
}

void __43__MPMediaKitContentReporter_sharedReporter__block_invoke()
{
  MPMediaKitContentReporter *v0;
  void *v1;

  v0 = objc_alloc_init(MPMediaKitContentReporter);
  v1 = (void *)sharedReporter_sharedInstance;
  sharedReporter_sharedInstance = (uint64_t)v0;

}

@end
