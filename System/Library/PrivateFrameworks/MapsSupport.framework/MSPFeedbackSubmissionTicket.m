@implementation MSPFeedbackSubmissionTicket

- (MSPFeedbackSubmissionTicket)initWithMapServiceTicket:(id)a3
{
  id v5;
  MSPFeedbackSubmissionTicket *v6;
  MSPFeedbackSubmissionTicket *v7;
  uint64_t v8;
  NSProgress *fakeProgress;
  void *v10;
  uint64_t v11;
  NSString *sessionIdentifier;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSPFeedbackSubmissionTicket;
  v6 = -[MSPFeedbackSubmissionTicket init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ticket, a3);
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
    v8 = objc_claimAutoreleasedReturnValue();
    fakeProgress = v7->_fakeProgress;
    v7->_fakeProgress = (NSProgress *)v8;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v7->_sessionIdentifier;
    v7->_sessionIdentifier = (NSString *)v11;

    v7->_cancelled = 0;
  }

  return v7;
}

+ (id)ticketForFeedbackRequest:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D27218];
  v5 = a3;
  objc_msgSend(v4, "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ticketForFeedbackRequest:traits:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ticketForFeedbackRequest:(id)a3 traits:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0D27218];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForFeedbackRequest:traits:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMapServiceTicket:", v9);
  return v10;
}

+ (id)ticketForFeedbackRequestParameters:(id)a3 mapItem:(id)a4 traits:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x1E0D27218];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ticketForFeedbackRequestParameters:placeForProblemContext:userCredentials:pushToken:allowContactBackAtEmailAddress:traits:", v10, v9, 0, 0, 0, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMapServiceTicket:", v12);
  return v13;
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)-[GEOMapServiceFeedbackReportTicket traits](self->_ticket, "traits");
}

- (void)cancel
{
  void *v3;

  -[GEOMapServiceFeedbackReportTicket cancel](self->_ticket, "cancel");
  -[MSPFeedbackSubmissionTicket fakeProgress](self, "fakeProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  self->_cancelled = 1;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  -[MSPFeedbackSubmissionTicket submitWithCallbackQueue:handler:networkActivity:](self, "submitWithCallbackQueue:handler:networkActivity:", MEMORY[0x1E0C80D38], a3, a4);
}

- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSString *sessionIdentifier;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSString *v19;
  GEOMapServiceFeedbackReportTicket *ticket;
  id v21;
  id v22;
  NSObject *v23;
  NSString *v24;
  _QWORD v25[4];
  id v26;
  MSPFeedbackSubmissionTicket *v27;
  id v28;
  os_signpost_id_t v29;
  uint8_t buf[4];
  NSString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  MSPGetMSPFeedbackSubmissionTicketLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412290;
    v31 = sessionIdentifier;
    _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_INFO, "<<<<<< BEGIN Session %@ >>>>>>>>", buf, 0xCu);
  }

  -[MSPFeedbackSubmissionTicket fakeProgress](self, "fakeProgress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompletedUnitCount:", 20);

  MSPGetMSPFeedbackSubmissionTicketLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  MSPGetMSPFeedbackSubmissionTicketLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "MapServiceRequest", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  MSPGetMSPFeedbackSubmissionTicketLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412290;
    v31 = v19;
    _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_INFO, "%@ - Initiate a Map Service request", buf, 0xCu);
  }

  ticket = self->_ticket;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __79__MSPFeedbackSubmissionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke;
  v25[3] = &unk_1E6654698;
  v21 = v8;
  v29 = v15;
  v26 = v21;
  v27 = self;
  v22 = v9;
  v28 = v22;
  -[GEOMapServiceFeedbackReportTicket submitWithHandler:networkActivity:](ticket, "submitWithHandler:networkActivity:", v25, v10);

  MSPGetMSPFeedbackSubmissionTicketLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412290;
    v31 = v24;
    _os_log_impl(&dword_1B39C0000, v23, OS_LOG_TYPE_INFO, "<<<<<< END Session %@ >>>>>>>>", buf, 0xCu);
  }

}

void __79__MSPFeedbackSubmissionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__MSPFeedbackSubmissionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
  v15[3] = &unk_1E6654670;
  v10 = a1[4];
  v15[4] = a1[5];
  v16 = v9;
  v11 = (void *)a1[6];
  v20 = a1[7];
  v17 = v7;
  v18 = v8;
  v19 = v11;
  v12 = v8;
  v13 = v7;
  v14 = v9;
  dispatch_async(v10, v15);

}

uint64_t __79__MSPFeedbackSubmissionTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t result;
  int v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  MSPGetMSPFeedbackSubmissionTicketLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v3, OS_SIGNPOST_INTERVAL_END, v4, "MapServiceRequest", (const char *)&unk_1B3A3EAC5, (uint8_t *)&v15, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "fakeProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompletedUnitCount:", 80);

  if (*(_QWORD *)(a1 + 40))
  {
    MSPGetMSPFeedbackSubmissionTicketLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_ERROR, "Failed Map Service request with error %@", (uint8_t *)&v15, 0xCu);
    }

    if (*(_QWORD *)(a1 + 40))
      goto LABEL_9;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "status"))
  {
LABEL_9:
    MSPGetMSPFeedbackSubmissionTicketLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v10 = objc_msgSend(*(id *)(a1 + 48), "status");
      v11 = *(_QWORD *)(a1 + 40);
      v15 = 138412802;
      v16 = v9;
      v17 = 1024;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_INFO, "%@ - Map Service request failed with response status: %d, and error: %@", (uint8_t *)&v15, 0x1Cu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fakeProgress");
    v8 = objc_claimAutoreleasedReturnValue();
    v12 = -[NSObject totalUnitCount](v8, "totalUnitCount");
    objc_msgSend(*(id *)(a1 + 32), "fakeProgress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompletedUnitCount:", v12);

  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (NSProgress)fakeProgress
{
  return self->_fakeProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeProgress, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
