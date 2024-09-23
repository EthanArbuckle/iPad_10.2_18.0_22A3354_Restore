@implementation MFMessageContentRequest

+ (id)databaseWriteScheduler
{
  if (databaseWriteScheduler_onceToken != -1)
    dispatch_once(&databaseWriteScheduler_onceToken, &__block_literal_global_46);
  return (id)databaseWriteScheduler_sInstance;
}

void __49__MFMessageContentRequest_databaseWriteScheduler__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.message.MFMessageContentRequest.databaseWriteScheduler"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)databaseWriteScheduler_sInstance;
  databaseWriteScheduler_sInstance = v0;

}

+ (id)originalContentMessageScheduler
{
  if (originalContentMessageScheduler_onceToken != -1)
    dispatch_once(&originalContentMessageScheduler_onceToken, &__block_literal_global_29_0);
  return (id)originalContentMessageScheduler_sInstance;
}

void __58__MFMessageContentRequest_originalContentMessageScheduler__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.message.MFMessageContentRequest.originalContentMessageScheduler"), 25);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)originalContentMessageScheduler_sInstance;
  originalContentMessageScheduler_sInstance = v0;

}

+ (id)onScheduler:(id)a3 requestContentForObjectID:(id)a4 messagePersistence:(id)a5 legacyMessage:(id)a6 messageTransformer:(id)a7 mailDropAttachmentGenerator:(id)a8 listUnsubscribeHandler:(id)a9 clientIdentifier:(id)a10 options:(id)a11 delegate:(id)a12 completionHandler:(id)a13
{
  objc_msgSend(a1, "onScheduler:requestID:requestContentForObjectID:messagePersistence:legacyMessage:messageTransformer:mailDropAttachmentGenerator:listUnsubscribeHandler:clientIdentifier:options:delegate:completionHandler:", a3, 0, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)onScheduler:(id)a3 requestID:(unint64_t)a4 requestContentForObjectID:(id)a5 messagePersistence:(id)a6 legacyMessage:(id)a7 messageTransformer:(id)a8 mailDropAttachmentGenerator:(id)a9 listUnsubscribeHandler:(id)a10 clientIdentifier:(id)a11 options:(id)a12 delegate:(id)a13 completionHandler:(id)a14
{
  id v18;
  id v19;
  void *v20;
  id v21;
  id *v22;
  void *v23;
  void *v24;
  id obj;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  obj = a5;
  v35 = a5;
  v37 = a6;
  v34 = a7;
  v33 = a8;
  v32 = a9;
  v31 = a10;
  v30 = a11;
  v29 = a12;
  v28 = a13;
  v18 = a14;
  v19 = objc_alloc((Class)a1);
  v20 = v19;
  if (v19)
  {
    v39.receiver = v19;
    v39.super_class = (Class)MFMessageContentRequest;
    v21 = objc_msgSendSuper2(&v39, sel_init);

    if (v21)
    {
      v22 = -[_MFMessageContentRequestScheduler initWithScheduler:requestID:messagePersistence:]((id *)[_MFMessageContentRequestScheduler alloc], v38, (void *)a4, v37);
      v23 = (void *)*((_QWORD *)v21 + 1);
      *((_QWORD *)v21 + 1) = v22;

      objc_storeStrong((id *)v21 + 2, obj);
      objc_storeStrong((id *)v21 + 3, a6);
      objc_storeStrong((id *)v21 + 4, a7);
      objc_storeStrong((id *)v21 + 5, a8);
      objc_storeStrong((id *)v21 + 6, a11);
      objc_storeStrong((id *)v21 + 8, a9);
      objc_storeStrong((id *)v21 + 9, a10);
      objc_storeStrong((id *)v21 + 7, a12);
      objc_storeStrong((id *)v21 + 10, a13);
      v20 = v21;
    }
    else
    {
      v20 = 0;
    }
  }
  objc_msgSend(v20, "beginRequestWithCompletionHandler:", v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)delegateWithErrorHandler:(id)a3
{
  id v4;
  EMContentItemRequestDelegate *delegate;
  EMContentItemRequestDelegate *v6;
  uint64_t v7;

  v4 = a3;
  if (self)
    delegate = self->_delegate;
  else
    delegate = 0;
  v6 = delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[EMContentItemRequestDelegate synchronousRemoteObjectProxyWithErrorHandler:](v6, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (EMContentItemRequestDelegate *)v7;
  }

  return v6;
}

- (id)beginRequestWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  EMContentRequestOptions *options;
  EMContentRequestOptions *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v11;
  void *v12;
  MFMailMessage *legacyMessage;
  int v14;
  void *v15;
  __int16 v16;
  MFMailMessage *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  if (self)
    options = self->_options;
  else
    options = 0;
  v6 = options;
  -[EMContentRequestOptions requestedRepresentation](v6, "requestedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D1DBF0]))
  {
    -[MFMessageContentRequest requestRawRepresentationWithCompletionHandler:](self, "requestRawRepresentationWithCompletionHandler:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = (void *)v8;
    goto LABEL_9;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D1DBE0]) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D1DBE8]))
  {
    -[MFMessageContentRequest requestHTMLRepresentationWithCompletionHandler:](self, "requestHTMLRepresentationWithCompletionHandler:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  EMLogCategoryMessageLoading();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    if (self)
      legacyMessage = self->_legacyMessage;
    else
      legacyMessage = 0;
    v14 = 138543618;
    v15 = v7;
    v16 = 2114;
    v17 = legacyMessage;
    _os_log_error_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_ERROR, "content not available for unknown representation type %{public}@ content for message %{public}@", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v12);

  v9 = 0;
LABEL_9:

  return v9;
}

- (id)requestRawRepresentationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  EFScheduler *scheduler;
  uint64_t v7;
  id v8;
  id v9;
  EFScheduler *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    scheduler = self->_scheduler;
  else
    scheduler = 0;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__MFMessageContentRequest_requestRawRepresentationWithCompletionHandler___block_invoke;
  v18[3] = &unk_1E4E8D760;
  v18[4] = self;
  v8 = v5;
  v19 = v8;
  v9 = v4;
  v20 = v9;
  v10 = scheduler;
  -[EFScheduler performCancelableBlock:](v10, "performCancelableBlock:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __73__MFMessageContentRequest_requestRawRepresentationWithCompletionHandler___block_invoke_45;
  v16[3] = &unk_1E4E88DC8;
  v17 = v11;
  v12 = v11;
  objc_msgSend(v8, "setCancellationHandler:", v16);
  v13 = v17;
  v14 = v8;

  return v14;
}

void __73__MFMessageContentRequest_requestRawRepresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  _QWORD *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isCanceled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_dataHolderWithCancelationToken:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isCanceled") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
      if (v4)
      {
        v5 = *(_QWORD **)(a1 + 32);
        if (v5)
          v5 = (_QWORD *)v5[4];
        v6 = v5;
        v7 = objc_alloc(MEMORY[0x1E0D1E128]);
        objc_msgSend(v4, "data");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD **)(a1 + 32);
        if (v9)
          v9 = (_QWORD *)v9[6];
        v10 = v9;
        objc_msgSend(v6, "subject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "subjectString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v7, "initWithData:clientIdentifier:preferredFilename:extension:relatedItems:securityInformation:", v8, v10, v12, CFSTR("eml"), MEMORY[0x1E0C9AA60], 0);

        +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTransportType:", objc_msgSend(v14, "transportType"));

        objc_msgSend(v6, "globalMessageURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPublicMessageURL:", v15);

        objc_msgSend(v6, "headersIfAvailable");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "copyAddressListForReplyTo");
        objc_msgSend(v13, "setReplyToList:", v17);

        v18 = *(_QWORD **)(a1 + 32);
        if (v18)
          v19 = v18[7];
        else
          v19 = 0;
        objc_msgSend(v18, "_includeHeadersIfNeededForRepresentation:message:options:", v13, v6, v19);
        EMLogCategoryMessageLoading();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "ef_publicDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138543618;
          v29 = v21;
          v30 = 2112;
          v31 = v6;
          _os_log_impl(&dword_1A4F90000, v20, OS_LOG_TYPE_DEFAULT, "returning raw representation %{public}@ for message %@", (uint8_t *)&v28, 0x16u);

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      }
      else
      {
        +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v22, "transportType"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D1DBD0]);

        objc_msgSend(v22, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0CB3388]);
        v26 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v27);

      }
    }

  }
}

uint64_t __73__MFMessageContentRequest_requestRawRepresentationWithCompletionHandler___block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (id)_dataHolderWithCancelationToken:(id)a3
{
  id v4;
  EMContentRequestOptions *options;
  uint64_t v6;
  MFMailMessage *legacyMessage;
  MFMailMessage *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    options = self->_options;
  else
    options = 0;
  v6 = -[EMContentRequestOptions networkUsage](options, "networkUsage");
  if (self)
    legacyMessage = self->_legacyMessage;
  else
    legacyMessage = 0;
  v8 = legacyMessage;
  EMLogCategoryMessageLoading();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    -[MFMailMessage ef_publicDescription](v8, "ef_publicDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v10;
    _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_INFO, "reading raw content for message %{public}@", buf, 0xCu);

  }
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addCancelable:", v11);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MFMailMessage messageStore](v8, "messageStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v12, "fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:usePartDatas:didDownload:", v8, &v17, 0, v6 != 0, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    if (!v14)
    {
      objc_msgSend(v12, "headerDataForMessage:downloadIfNecessary:", v8, v6 != 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = 0;
    if (v14 && v13)
    {
      objc_msgSend(MEMORY[0x1E0D46088], "dataHolderWithData:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addData:", v13);
    }

  }
  else
  {
    -[MFMailMessage messageDataHolderIsComplete:downloadIfNecessary:](v8, "messageDataHolderIsComplete:downloadIfNecessary:", 0, v6 != 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_generateRepresentationForLoadingContext:(id)a3 existingRepresentation:(id)a4 completion:(id)a5
{
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v33 = a4;
  v31 = a5;
  EMLogCategoryMessageLoading();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v32, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ef_publicDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v10;
    _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "generate HTML representation for message: %{public}@", buf, 0xCu);

  }
  v30 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke;
  v41[3] = &unk_1E4E88EE8;
  v13 = v30;
  v42 = v13;
  v14 = v32;
  v43 = v14;
  objc_msgSend(v11, "setCancellationHandler:", v41);
  objc_msgSend(v14, "contentObservable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v33)
  {
    objc_msgSend(v15, "skip:", 1);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstResultObserverAdapter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subscribe:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addCancelable:", v20);

  objc_msgSend(v18, "future");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v12;
  v39[1] = 3221225472;
  v39[2] = __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke_2;
  v39[3] = &unk_1E4E8D788;
  v39[4] = self;
  v22 = v33;
  v40 = v22;
  objc_msgSend(v21, "then:", v39);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = v12;
  v36[1] = 3221225472;
  v36[2] = __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke_3;
  v36[3] = &unk_1E4E8D7B0;
  v24 = v11;
  v37 = v24;
  v25 = v31;
  v38 = v25;
  objc_msgSend(v23, "addSuccessBlock:", v36);
  v34[0] = v12;
  v34[1] = 3221225472;
  v34[2] = __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke_4;
  v34[3] = &unk_1E4E8D7D8;
  v26 = v25;
  v35 = v26;
  objc_msgSend(v23, "addFailureBlock:", v34);
  v27 = v35;
  v28 = v24;

  return v28;
}

uint64_t __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return objc_msgSend(*(id *)(a1 + 40), "cancel");
}

id __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D1ED90] + 16))())
  {
    v4 = (void *)MEMORY[0x1E0D1EEC0];
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D1DBD0];
    v6 = (void *)MEMORY[0x1E0CB37E8];
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "transportType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "em_internalErrorWithReason:userInfo:", CFSTR("Loading context completed without vending a result"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithError:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_contentRepresentationForLoadingEvent:existingRepresentation:", v3, *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __102__MFMessageContentRequest__generateRepresentationForLoadingContext_existingRepresentation_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v7 = *MEMORY[0x1E0CB3388];
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_messageContentFromLoadingContext:(id)a3 completion:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v26 = a4;
  EMLogCategoryMessageLoading();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v27, "message", v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_publicDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v8;
    _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "generate original content for message: %{public}@", buf, 0xCu);

  }
  v9 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke;
  v34[3] = &unk_1E4E88EE8;
  v12 = v9;
  v35 = v12;
  v13 = v27;
  v36 = v13;
  objc_msgSend(v10, "setCancellationHandler:", v34);
  objc_msgSend(v13, "contentObservable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstResultObserverAdapter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subscribe:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addCancelable:", v17);

  objc_msgSend(v15, "future");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v11;
  v33[1] = 3221225472;
  v33[2] = __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke_2;
  v33[3] = &unk_1E4E8D800;
  v33[4] = self;
  objc_msgSend(v18, "then:", v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke_3;
  v30[3] = &unk_1E4E8D828;
  v20 = v10;
  v31 = v20;
  v21 = v26;
  v32 = v21;
  objc_msgSend(v19, "addSuccessBlock:", v30);
  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke_4;
  v28[3] = &unk_1E4E8D7D8;
  v22 = v21;
  v29 = v22;
  objc_msgSend(v19, "addFailureBlock:", v28);
  v23 = v29;
  v24 = v20;

  return v24;
}

uint64_t __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return objc_msgSend(*(id *)(a1 + 40), "cancel");
}

id __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D1ED90] + 16))())
  {
    v4 = (void *)MEMORY[0x1E0D1EEC0];
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D1DBD0];
    v6 = (void *)MEMORY[0x1E0CB37E8];
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "transportType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "em_internalErrorWithReason:userInfo:", CFSTR("Loading context completed without vending a result"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithError:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_processContentLoadingContextEvent:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72__MFMessageContentRequest__messageContentFromLoadingContext_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v7 = *MEMORY[0x1E0CB3388];
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)requestHTMLRepresentationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  MFMessageLoadingContext *v6;
  MFMailMessage *legacyMessage;
  MFMailMessage *v8;
  void *v9;
  MFMessageLoadingContext *v10;
  void *v11;
  EMContentRequestOptions *options;
  uint64_t v13;
  unint64_t v14;
  _BOOL8 v15;
  unint64_t v16;
  EFScheduler *scheduler;
  NSObject *v19;
  uint8_t v20[16];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A4F90000, "client request to generate HTML representation for message loading context", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  v6 = [MFMessageLoadingContext alloc];
  if (self)
    legacyMessage = self->_legacyMessage;
  else
    legacyMessage = 0;
  v8 = legacyMessage;
  +[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MFMessageLoadingContext initWithMessage:attachmentManager:](v6, "initWithMessage:attachmentManager:", v8, v9);

  -[MFMessageContentRequest _generateRepresentationForLoadingContext:existingRepresentation:completion:](self, "_generateRepresentationForLoadingContext:existingRepresentation:completion:", v10, 0, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    options = self->_options;
  else
    options = 0;
  v13 = -[EMContentRequestOptions networkUsage](options, "networkUsage");
  if (!v13)
  {
    EMLogCategoryMessageLoading();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_INFO, "Network usage is not allowed. Setting shouldDownload to NO", v20, 2u);
    }

    v15 = 0;
    v16 = 0;
    if (self)
      goto LABEL_15;
LABEL_20:
    scheduler = 0;
    goto LABEL_16;
  }
  v14 = 0xAAAAAAAAAAAAAAAALL;
  if (v13 == 2)
    v14 = 2;
  v15 = v13 == 1 || v13 == 2;
  if (v13 == 1)
    v16 = 0;
  else
    v16 = v14;
  if (!self)
    goto LABEL_20;
LABEL_15:
  scheduler = self->_scheduler;
LABEL_16:
  -[MFMessageLoadingContext load:scheduler:shouldDownload:](v10, "load:scheduler:shouldDownload:", v16, scheduler, v15);

  os_activity_scope_leave(&state);
  return v11;
}

- (id)_processContentLoadingContextEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *objectID;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSString *clientIdentifier;
  void *v57;
  void *v58;
  id v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  uint64_t v80;
  NSObject *v81;
  void *legacyMessage;
  id v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  id v107;
  void (**v108)(void *, void *, id);
  void *v109;
  void *v110;
  id v111;
  id v113;
  id obj;
  id obja;
  uint64_t v116;
  uint64_t v117;
  id v118;
  void *v119;
  id v120;
  id v121;
  _QWORD v122[4];
  id v123;
  _QWORD v124[4];
  id v125;
  _QWORD v126[4];
  id v127;
  _QWORD v128[4];
  id v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  int v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _QWORD v139[4];
  id v140;
  id v141;
  id v142;
  _QWORD aBlock[4];
  id v144;
  uint64_t *v145;
  uint64_t *v146;
  __int16 v147;
  char v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t (*v152)(uint64_t, uint64_t);
  void (*v153)(uint64_t);
  id v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  char v158;
  uint8_t buf[4];
  _BYTE v160[10];
  uint64_t v161;
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v101 = a3;
  v155 = 0;
  v156 = &v155;
  v157 = 0x2020000000;
  v158 = 0;
  v149 = 0;
  v150 = &v149;
  v151 = 0x3032000000;
  v152 = __Block_byref_object_copy__17;
  v153 = __Block_byref_object_dispose__17;
  v154 = (id)0xAAAAAAAAAAAAAAAALL;
  v3 = objc_alloc_init(MEMORY[0x1E0D46168]);
  v147 = -17425;
  v148 = -65;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v147, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v4);

  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v154 = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke;
  aBlock[3] = &unk_1E4E8D8C8;
  v145 = &v149;
  v146 = &v155;
  v113 = v101;
  v144 = v113;
  v100 = _Block_copy(aBlock);
  v111 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v118 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v102 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "context");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "attachmentManager");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v139[0] = MEMORY[0x1E0C809B0];
  v139[1] = 3221225472;
  v139[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_68;
  v139[3] = &unk_1E4E8D8F0;
  v104 = v103;
  v140 = v104;
  v105 = v102;
  v141 = v105;
  v107 = v100;
  v142 = v107;
  v108 = (void (**)(void *, void *, id))_Block_copy(v139);
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  objc_msgSend(v113, "content");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
  if (v6)
  {
    v116 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v136 != v116)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1A85B0E24]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v119, "attachmentForTextAttachment:error:", v8, 0);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v113, "message");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFMessageContentRequest _contentItemForAttachment:manager:managed:](self, "_contentItemForAttachment:manager:managed:", v10, v119, objc_msgSend(v11, "sourceIsManaged"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v111, "addObject:", v12);
            objc_msgSend(v10, "url");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "addObject:", v13);

            v108[2](v108, v12, v10);
LABEL_23:

          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = v8;
            objc_msgSend(v10, "htmlData");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              objc_msgSend(v10, "preferredCharacterSet");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = MFEncodingForCharset();
              v134 = -1;
              v16 = (void *)MFCreateStringWithData();
              if (!v16 && v15 != -1)
                v16 = (void *)MFCreateStringWithData();
              if (v16)
              {
                EMLogCategoryMessageLoading();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v160 = v15;
                  *(_WORD *)&v160[4] = 1024;
                  *(_DWORD *)&v160[6] = v134;
                  _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_INFO, "decoded HTML data with preferred encoding %x, used encoding %x", buf, 0xEu);
                }

                objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v16);
                v18 = objc_claimAutoreleasedReturnValue();
                (*((void (**)(id, NSObject *))v107 + 2))(v107, v18);
              }
              else
              {
                EMLogCategoryMessageLoading();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  v19 = objc_msgSend(v12, "length");
                  *(_DWORD *)buf = 134218240;
                  *(_QWORD *)v160 = v19;
                  *(_WORD *)&v160[8] = 1024;
                  LODWORD(v161) = v15;
                  _os_log_error_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_ERROR, "failed to decode HTML data with length %lu and preferred encoding %x", buf, 0x12u);
                }
              }

            }
            goto LABEL_23;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_25;
          objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v8);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, id))v107 + 2))(v107, v10);
        }

LABEL_25:
        objc_autoreleasePoolPop(v9);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
    }
    while (v6);
  }

  objc_msgSend(v113, "loadedBody");
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v20 = v110;
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "attachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v21;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v130, v162, 16);
  if (v22)
  {
    obja = 0;
    v117 = *(_QWORD *)v131;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v131 != v117)
          objc_enumerationMutation(v109);
        v24 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * j);
        objc_msgSend(v119, "attachmentForTextAttachment:error:", v24, 0, v100);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          objc_msgSend(v25, "url");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v118, "containsObject:", v27) & 1) != 0)
          {
            v28 = v26;
          }
          else
          {
            objc_msgSend(v118, "addObject:", v27);
            objc_msgSend(v24, "mimePart");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "contentID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              objc_msgSend(v20, "message");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              +[MFMailDropAttachmentPreviewDataProvider fullResolutionStorageLocationForAttachmentWithMimePart:withMessage:](MFMailDropAttachmentPreviewDataProvider, "fullResolutionStorageLocationForAttachmentWithMimePart:withMessage:", v29, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32
                && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
                    v33 = (void *)objc_claimAutoreleasedReturnValue(),
                    v34 = objc_msgSend(v33, "fileExistsAtPath:", v32),
                    v33,
                    v34))
              {
                objc_msgSend(v29, "partURL");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                +[MFMailDropAttachmentPreviewDataProvider fullResolutionAttachmentURLForAttachmentURL:](MFMailDropAttachmentPreviewDataProvider, "fullResolutionAttachmentURLForAttachmentURL:", v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v119, "attachmentForURL:withMimeBody:error:", v36, v106, 0);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setContentID:", v30);

              }
              else
              {
                v28 = v26;
              }

            }
            else
            {
              v28 = v26;
            }
            objc_msgSend(v113, "message");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFMessageContentRequest _contentItemForAttachment:manager:managed:](self, "_contentItemForAttachment:manager:managed:", v28, v119, objc_msgSend(v37, "sourceIsManaged"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v111, "addObject:", v38);
            if (obja)
              goto LABEL_43;
            objc_msgSend((id)v150[5], "resultIfAvailable");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "data");
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v43)
              goto LABEL_49;
            objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringWithData:encoding:", v43, 4);
            obja = (id)objc_claimAutoreleasedReturnValue();

            if (obja)
            {
LABEL_43:
              objc_msgSend(v27, "absoluteString");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(obja, "rangeOfString:", v39) == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v38, "contentID");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(obja, "rangeOfString:", v40) == 0x7FFFFFFFFFFFFFFFLL;

                if (v41)
                  v108[2](v108, v38, v28);
              }
              else
              {

              }
            }
            else
            {
LABEL_49:
              obja = 0;
            }

          }
          v20 = v110;
        }
      }
      v21 = v109;
      v22 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v130, v162, 16);
    }
    while (v22);
  }
  else
  {
    obja = 0;
  }

  if (objc_msgSend(v105, "count"))
  {
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_75;
    v128[3] = &unk_1E4E8CEF8;
    v44 = v104;
    v129 = v44;
    -[MFMessageContentRequest delegateWithErrorHandler:](self, "delegateWithErrorHandler:", v128);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objectID = self;
      if (self)
        objectID = self->_objectID;
      v47 = objectID;
      v126[0] = MEMORY[0x1E0C809B0];
      v126[1] = 3221225472;
      v126[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_2_80;
      v126[3] = &unk_1E4E8D940;
      v48 = v44;
      v127 = v48;
      objc_msgSend(v45, "contentObjectID:generateHTMLSnippetsForRelatedContentItems:completionHandler:", v47, v105, v126);

      objc_msgSend(v48, "allValues");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("delegate failed to return a snippet for attachment"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "makeObjectsPerformSelector:withObject:", sel_finishWithError_, v50);

      v51 = v127;
    }
    else
    {
      objc_msgSend(v44, "allValues");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Failed to generate snippets for attachments: nil delegate"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "makeObjectsPerformSelector:withObject:", sel_finishWithError_, v52);

    }
  }
  if (*((_BYTE *)v156 + 24))
    goto LABEL_64;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v113, "transportType"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setObject:forKeyedSubscript:", v70, *MEMORY[0x1E0D1DBD0]);

  objc_msgSend(v113, "error");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setObject:forKeyedSubscript:", v71, *MEMORY[0x1E0CB3388]);

  objc_msgSend(v113, "error");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    v73 = (void *)MEMORY[0x1E0D1EEC0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2049, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "futureWithError:", v54);
    v74 = objc_claimAutoreleasedReturnValue();
LABEL_98:
    v69 = (void *)v74;
    goto LABEL_99;
  }
  if (!objc_msgSend(v113, "hasLoadedBestAlternativePart")
    || (objc_msgSend(v113, "hasLoadedCompleteBody") & 1) == 0)
  {
    EMLogCategoryMessageLoading();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      legacyMessage = self;
      if (self)
        legacyMessage = self->_legacyMessage;
      v83 = legacyMessage;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v84 = self;
        if (self)
          v84 = self->_legacyMessage;
        v85 = v84;
        objc_msgSend(v85, "objectID");
        v86 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v87 = self;
        if (self)
          v87 = self->_legacyMessage;
        v85 = v87;
        objc_msgSend(v85, "messageIDHeaderHash");
        v86 = objc_claimAutoreleasedReturnValue();
      }
      v88 = (void *)v86;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v160 = v86;
      _os_log_impl(&dword_1A4F90000, v81, OS_LOG_TYPE_DEFAULT, "Could not create a body subset from partials for message: %{public}@", buf, 0xCu);

    }
    v89 = (void *)MEMORY[0x1E0D1EEC0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "futureWithError:", v54);
    v74 = objc_claimAutoreleasedReturnValue();
    goto LABEL_98;
  }
  EMLogCategoryMessageLoading();
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    v76 = self;
    if (self)
      v76 = self->_legacyMessage;
    v77 = v76;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v78 = self;
      if (self)
        v78 = self->_legacyMessage;
      v79 = v78;
      objc_msgSend(v79, "objectID");
      v80 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v91 = self;
      if (self)
        v91 = self->_legacyMessage;
      v79 = v91;
      objc_msgSend(v79, "messageIDHeaderHash");
      v80 = objc_claimAutoreleasedReturnValue();
    }
    v92 = (void *)v80;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v160 = v80;
    _os_log_impl(&dword_1A4F90000, v75, OS_LOG_TYPE_DEFAULT, "Did not find any content for message: %{public}@, using placeholder html", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = MEMORY[0x1E0C809B0];
  v124[1] = 3221225472;
  v124[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_92;
  v124[3] = &unk_1E4E8CEF8;
  v94 = v93;
  v125 = v94;
  -[MFMessageContentRequest delegateWithErrorHandler:](self, "delegateWithErrorHandler:", v124);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    v96 = self;
    if (self)
      v96 = self->_objectID;
    v97 = v96;
    v122[0] = MEMORY[0x1E0C809B0];
    v122[1] = 3221225472;
    v122[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_2_95;
    v122[3] = &unk_1E4E8D968;
    v123 = v94;
    objc_msgSend(v95, "contentObjectID:placeholderHTMLForEmptyContentWithCompletionHandler:", v97, v122);

    v98 = v123;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Failed to generate no content string: nil delegate"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "finishWithError:", v98);
  }

  objc_msgSend(v94, "future");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v107 + 2))(v107, v99);

LABEL_64:
  objc_msgSend((id)v150[5], "result:", 0, v100);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "done");
  objc_msgSend(v53, "data");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)MEMORY[0x1E0D1E128];
  clientIdentifier = self->_clientIdentifier;
  objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = 0;
  v121 = 0;
  objc_msgSend(v55, "temporaryURLWithData:clientIdentifier:preferredFilename:pathExtension:cleanupInvocable:error:", v54, clientIdentifier, v57, CFSTR("html"), &v121, &v120);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v121;
  v60 = v120;

  if (v58)
  {
    EMLogCategoryMessageLoading();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      v62 = objc_msgSend(v54, "length");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v160 = v58;
      *(_WORD *)&v160[8] = 2048;
      v161 = v62;
      _os_log_impl(&dword_1A4F90000, v61, OS_LOG_TYPE_INFO, "generated initial HTML content at URL %@: %lu bytes", buf, 0x16u);
    }

    v63 = (void *)objc_opt_new();
    -[_MFLoadingContextEventResult setContentURL:]((uint64_t)v63, v58);
    -[_MFLoadingContextEventResult setCleanupInvocable:]((uint64_t)v63, v59);
    -[_MFLoadingContextEventResult setRelatedContentItems:]((uint64_t)v63, v111);
    objc_msgSend(v113, "message");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "globalMessageURL");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFLoadingContextEventResult setPublicMessageURL:]((uint64_t)v63, v65);

    if (_os_feature_enabled_impl() && (EMIsGreymatterSupportedWithOverride() & 1) != 0
      || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      v66 = (void *)MEMORY[0x1E0D1EF38];
      objc_msgSend(v113, "message");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "pairWithFirst:second:", v67, v54);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MFLoadingContextEventResult setMessageAndHTMLDataPair:]((uint64_t)v63, v68);

    }
    objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v63);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithError:", v60);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_99:
  _Block_object_dispose(&v149, 8);

  _Block_object_dispose(&v155, 8);
  return v69;
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_2;
  v11[3] = &unk_1E4E8D8A0;
  v6 = a1[6];
  v12 = v3;
  v14 = v6;
  v11[1] = 3221225472;
  v13 = v4;
  v7 = v3;
  objc_msgSend(v5, "then:", v11);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

id __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_3;
  v15[3] = &unk_1E4E8D850;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 48);
  v16 = v6;
  v17 = v7;
  objc_msgSend(v4, "then:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_4;
  v12[3] = &unk_1E4E8D878;
  v13 = *(id *)(a1 + 40);
  v9 = v6;
  v14 = v9;
  objc_msgSend(v8, "recover:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendData:", v5);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  EMLogCategoryMessageLoading();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_publicDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ef_publicDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_error_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_ERROR, "error when generating body string component for message %{public}@: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "contentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  EMLogCategoryMessageLoading();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "Add attachment with contentID: %@ url: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (!v11)
  {
    EMLogCategoryMessageLoading();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_68_cold_1((uint64_t)v7, v12, v13);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v7);
  if (v12)
  {
    v14 = *(_QWORD *)(a1 + 48);
    -[NSObject future](v12, "future");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

LABEL_8:
  }

}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB3388];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "em_internalErrorWithReason:userInfo:", CFSTR("connection failure during delegate snippet request"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "makeObjectsPerformSelector:withObject:", sel_finishWithError_, v6);

}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_2_80(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_3_85;
    v12[3] = &unk_1E4E8D918;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);

  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("nil snippets from delegate, but missing error"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB3388];
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "em_internalErrorWithReason:userInfo:", CFSTR("failed to generate any attachment snippets"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "makeObjectsPerformSelector:withObject:", sel_finishWithError_, v10);

  }
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_3_85(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithResult:", v6);

}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB3388];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "em_internalErrorWithReason:userInfo:", CFSTR("Failed to generate no content string: delegate connection error"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_2_95(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:");
  }
  else
  {
    v8 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Failed to generate no content string: non-nil delegate, nil placeholderHTML and nil error"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "finishWithError:", v8);
    if (!v6)

  }
}

- (id)_contentRepresentationForLoadingEvent:(id)a3 existingRepresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = a4;
  -[MFMessageContentRequest _processContentLoadingContextEvent:](self, "_processContentLoadingContextEvent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke;
  v19[3] = &unk_1E4E8DA08;
  v19[4] = self;
  v10 = v6;
  v20 = v10;
  objc_msgSend(v8, "then:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_114;
  v16[3] = &unk_1E4E8DA30;
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  v13 = v7;
  v18 = v13;
  objc_msgSend(v11, "then:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[3];
  v6 = v5;
  v7 = *(_QWORD **)(a1 + 32);
  if (v7)
    v7 = (_QWORD *)v7[2];
  v8 = v7;
  objc_msgSend(v6, "mailDropAttachmentPresentForMessage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend(v9, "BOOLValue") & 1) == 0)
  {
    objc_msgSend(v4, "finishWithResult:", v3);
    objc_msgSend(v4, "future");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v11 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2;
    v35[3] = &unk_1E4E8D990;
    v12 = v4;
    v36 = v12;
    v13 = v3;
    v37 = v13;
    objc_msgSend(v10, "delegateWithErrorHandler:", v35);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD **)(a1 + 32);
    if (v15)
      v15 = (_QWORD *)v15[8];
    v16 = v15;
    if (v13)
      v17 = (void *)v13[1];
    else
      v17 = 0;
    v18 = v17;
    v25 = v11;
    v26 = 3221225472;
    v27 = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_108;
    v28 = &unk_1E4E8D9E0;
    v19 = v9;
    v20 = *(_QWORD *)(a1 + 32);
    v29 = v19;
    v30 = v20;
    v31 = v13;
    v32 = *(id *)(a1 + 40);
    v21 = v14;
    v33 = v21;
    v22 = v12;
    v34 = v22;
    objc_msgSend(v16, "generateMailDropMetadataForContentURL:completionHandler:", v18, &v25);

    objc_msgSend(v22, "future", v25, v26, v27, v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  EMLogCategoryMessageLoading();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[5];
  BOOL v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (!*(_QWORD *)(a1 + 32) && (!v6 || (objc_msgSend(v6, "ef_isTimeoutError") & 1) == 0))
  {
    objc_msgSend((id)objc_opt_class(), "databaseWriteScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_109;
    v26[3] = &unk_1E4E88DF0;
    v26[4] = *(_QWORD *)(a1 + 40);
    v27 = v7 != 0;
    objc_msgSend(v8, "performBlock:", v26);

  }
  if (v7)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
      v12 = *(_QWORD *)(v11 + 16);
    else
      v12 = 0;
    objc_msgSend(v9, "addObjectsFromArray:", v12);
    v13 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 56), "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_attachmentContentItemsForMailDropNodes:withContext:", v5, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObjectsFromArray:", v15);
    -[_MFLoadingContextEventResult setRelatedContentItems:](*(_QWORD *)(a1 + 48), v10);
    v16 = *(void **)(a1 + 64);
    v17 = *(_QWORD **)(a1 + 40);
    if (v17)
      v17 = (_QWORD *)v17[2];
    v18 = v17;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_3;
    v22[3] = &unk_1E4E8D9B8;
    v23 = *(id *)(a1 + 72);
    v19 = *(id *)(a1 + 48);
    v20 = *(_QWORD *)(a1 + 40);
    v24 = v19;
    v25 = v20;
    objc_msgSend(v16, "contentObjectID:generateHTMLSnippetsForMailDropContentItems:completionHandler:", v18, v15, v22);

  }
  else
  {
    if (!v5)
    {
      EMLogCategoryMessageLoading();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_108_cold_1();
      }

    }
    objc_msgSend(*(id *)(a1 + 72), "finishWithResult:", *(_QWORD *)(a1 + 48));
  }

}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_109(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(_QWORD *)(v4 + 16);
  else
    v5 = 0;
  v6 = v3;
  objc_msgSend(v3, "setIsMailDropAttachmentPresent:forMessage:", *(unsigned __int8 *)(a1 + 40) != 0, v5);

}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  id v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      EMLogCategoryMessageLoading();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_3_cold_1();
      }

    }
    goto LABEL_8;
  }
  if (!objc_msgSend(v5, "count"))
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
    goto LABEL_9;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_110;
  v12[3] = &unk_1E4E8BA30;
  v11 = *(int8x16_t *)(a1 + 40);
  v8 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  v14 = v5;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performBlock:", v12);

LABEL_9:
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_110(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[8];
  v3 = v2;
  v4 = *(_QWORD **)(a1 + 40);
  if (v4)
    v4 = (_QWORD *)v4[1];
  v5 = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_111;
  v7[3] = &unk_1E4E8D990;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v3, "insertMailDropAttachmentViewForContentURL:HTMLByContentID:completionHandler:", v5, v6, v7);

}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_111(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    EMLogCategoryMessageLoading();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_111_cold_1();
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));

}

id __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_114(_QWORD *a1, void *a2)
{
  id *v3;
  id *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a2;
  v4 = v3;
  v5 = (void *)a1[4];
  v6 = a1[5];
  if (v3)
  {
    v7 = v3[1];
    v8 = v4[2];
    v9 = v4[5];
    v10 = v4[3];
  }
  else
  {
    v9 = 0;
    v7 = 0;
    v8 = 0;
    v10 = 0;
  }
  objc_msgSend(v5, "_contentRepresentationForEvent:contentURL:relatedItems:messageAndHTMLDataPair:existingRepresentation:invocable:", v6, v7, v8, v9, a1[6], v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v12 = v4[4];
  else
    v12 = 0;
  objc_msgSend(v11, "setPublicMessageURL:", v12);
  v13 = a1[4];
  if (v13)
    v14 = *(void **)(v13 + 32);
  else
    v14 = 0;
  objc_msgSend(v14, "headersIfAvailable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copyAddressListForReplyTo");
  objc_msgSend(v11, "setReplyToList:", v16);

  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_contentRepresentationForEvent:(id)a3 contentURL:(id)a4 relatedItems:(id)a5 messageAndHTMLDataPair:(id)a6 existingRepresentation:(id)a7 invocable:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  MFMailMessage *legacyMessage;
  MFMailMessage *v21;
  MFMailMessage *v22;
  EMContentRequestOptions *options;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  EMContentRequestOptions *v29;
  uint64_t v30;
  char v31;
  char v32;
  NSObject *v33;
  void *v34;
  MFMailMessage *v35;
  MFMailMessage *v36;
  id v37;
  id v38;
  void *v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  MFMessageContentRequest *v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  id v53[2];
  _QWORD v54[4];
  id v55;
  _BYTE location[12];
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v42 = a4;
  v43 = a5;
  v41 = a6;
  v15 = a7;
  v16 = a8;
  +[MFMessageLoadingContextToEMSecurityInformationTransformer securityInformationFromMFMessageLoadingContextEvent:](MFMessageLoadingContextToEMSecurityInformationTransformer, "securityInformationFromMFMessageLoadingContextEvent:", v14, v16);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E128]), "initWithContentURL:relatedItems:securityInformation:", v42, v43, v40);
  objc_msgSend(v17, "setTransportType:", objc_msgSend(v14, "transportType"));
  v18 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke;
  v54[3] = &unk_1E4E88DC8;
  v19 = v16;
  v55 = v19;
  objc_msgSend(v17, "addInvalidationHandler:", v54);
  if (self)
    legacyMessage = self->_legacyMessage;
  else
    legacyMessage = 0;
  -[MFMessageContentRequest _includeSuggestionItemsIfNeededForRepresentation:message:](self, "_includeSuggestionItemsIfNeededForRepresentation:message:", v17, legacyMessage);
  if (self)
    v21 = self->_legacyMessage;
  else
    v21 = 0;
  -[MFMessageContentRequest _includeCachedMetadataJSONIfNeededForRepresentation:message:](self, "_includeCachedMetadataJSONIfNeededForRepresentation:message:", v17, v21);
  if (self)
  {
    v22 = self->_legacyMessage;
    options = self->_options;
  }
  else
  {
    v22 = 0;
    options = 0;
  }
  -[MFMessageContentRequest _includeHeadersIfNeededForRepresentation:message:options:](self, "_includeHeadersIfNeededForRepresentation:message:options:", v17, v22, options);

  if (objc_msgSend(v14, "hasLoadedBestAlternativePart"))
    v24 = 0;
  else
    v24 = 2;
  if (!objc_msgSend(v14, "hasLoadedBestAlternativePart")
    || (objc_msgSend(v14, "hasLoadedCompleteBody") & 1) == 0)
  {
    objc_msgSend(v14, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      v15 = v17;
    objc_msgSend(v17, "setHasMoreContent:", 1);
    if ((objc_msgSend(v14, "hasLoadedCompleteBody") & 1) != 0)
      v26 = 0;
    else
      v26 = objc_msgSend(v14, "remainingBytes");
    objc_msgSend(v17, "setRemainingByteCount:", v26);
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, v15);
    v51[0] = v18;
    v51[1] = 3221225472;
    v51[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_2;
    v51[3] = &unk_1E4E8DA80;
    objc_copyWeak(v53, (id *)location);
    v51[4] = self;
    v27 = v25;
    v52 = v27;
    v53[1] = (id)v24;
    objc_msgSend(v17, "setRequestMoreContentBlock:", v51);

    objc_destroyWeak(v53);
    objc_destroyWeak((id *)location);

  }
  objc_msgSend(v17, "unsubscribeCommand");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, v17);
    v49[0] = v18;
    v49[1] = 3221225472;
    v49[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_4;
    v49[3] = &unk_1E4E8DAD0;
    objc_copyWeak(&v50, (id *)location);
    v49[4] = self;
    objc_msgSend(v17, "setListUnsubscribeBlock:", v49);
    objc_destroyWeak(&v50);
    objc_destroyWeak((id *)location);
  }
  if (self)
    v29 = self->_options;
  else
    v29 = 0;
  v30 = -[EMContentRequestOptions maximumNumberOfOriginalContentMessagesToRequest](v29, "maximumNumberOfOriginalContentMessagesToRequest");
  if (_os_feature_enabled_impl() && (EMIsGreymatterSupportedWithOverride() & 1) != 0)
  {
    if (!v30)
      goto LABEL_36;
  }
  else
  {
    if (!_os_feature_enabled_impl())
      goto LABEL_36;
    v31 = EMIsGreymatterSupportedWithOverride();
    v32 = v30 ? v31 : 0;
    if ((v32 & 1) == 0)
      goto LABEL_36;
  }
  EMLogCategoryMessageLoading();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = self;
    v57 = 2050;
    v58 = v30;
    _os_log_impl(&dword_1A4F90000, v33, OS_LOG_TYPE_DEFAULT, "[SmartReply] %{public}@ Pre-fetching a maximum of %{public}lu original-content messages", location, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v35 = self->_legacyMessage;
  else
    v35 = 0;
  v36 = v35;
  v47[0] = v18;
  v47[1] = 3221225472;
  v47[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_119;
  v47[3] = &unk_1E4E8DAF8;
  v47[4] = self;
  v37 = v34;
  v48 = v37;
  -[MFMessageContentRequest _originalContentMessagesInReplyToLegacyMessage:withMessageAndHTMLDataPair:maximumNumberOfMessages:completion:](self, "_originalContentMessagesInReplyToLegacyMessage:withMessageAndHTMLDataPair:maximumNumberOfMessages:completion:", v36, v41, v30, v47);

  objc_msgSend(v37, "future");
  v44[0] = v18;
  v44[1] = 3221225472;
  v44[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_120;
  v44[3] = &unk_1E4E8DB48;
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v46 = self;
  v38 = v45;
  objc_msgSend(v17, "setRequestOriginalContentMessagesInReplyToContentItemBlock:", v44);

LABEL_36:
  return v17;
}

uint64_t __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

id __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  id v19;
  os_activity_scope_state_s state;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = _os_activity_create(&dword_1A4F90000, "client request to load more HTML for message loading context", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_3;
  v17 = &unk_1E4E8DA58;
  v8 = WeakRetained;
  v18 = v8;
  v9 = v3;
  v19 = v9;
  objc_msgSend(v6, "_generateRepresentationForLoadingContext:existingRepresentation:completion:", v7, v8, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(_QWORD *)(v11 + 8);
  else
    v12 = 0;
  objc_msgSend(*(id *)(a1 + 40), "load:scheduler:shouldDownload:", *(_QWORD *)(a1 + 56), v12, 1, v14, v15, v16, v17);

  os_activity_scope_leave(&state);
  return v10;
}

void __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contentURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v6;
    v10 = objc_msgSend(v7, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v8, v9, 0, 1, 0, &v15);
    v11 = v15;

    if ((v10 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "mergeUpdatedRepresentation:", v5);
      objc_msgSend(v5, "requestMoreContentBlock");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setRequestMoreContentBlock:", v12);
      v6 = v11;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB3388];
      v17[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, v14);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      v12 = v5;
      v5 = 0;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "unsubscribeCommand");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_5;
    v17 = &unk_1E4E8DAA8;
    v18 = v6;
    v19 = v5;
    v9 = _Block_copy(&v14);
    v10 = *(_QWORD **)(a1 + 32);
    if (v10)
      v10 = (_QWORD *)v10[9];
    v11 = v10;
    v12 = v11;
    if (a2 == 1)
      objc_msgSend(v11, "unsubscribeWithCommand:completion:", v8, v9, v14, v15, v16, v17, v18);
    else
      objc_msgSend(v11, "ignoreWithCommand:completion:", v8, v9, v14, v15, v16, v17, v18);

  }
  else
  {
    objc_msgSend(v6, "setCompletedUnitCount:", 1);
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

  return v6;
}

void __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  EMLogCategoryMessageLoading();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543874;
    v10 = v8;
    v11 = 2050;
    v12 = objc_msgSend(v5, "count");
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "[SmartReply] %{public}@ Finished pre-fetching %{public}lu original-content messages: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v5, v6);
}

void __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_120(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_2_121;
  v11[3] = &unk_1E4E8DB20;
  v5 = *(void **)(a1 + 32);
  v11[4] = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v12 = v6;
  objc_msgSend(v5, "addSuccessBlock:", v11);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_123;
  v9[3] = &unk_1E4E8DAA8;
  v7 = *(void **)(a1 + 32);
  v9[4] = *(_QWORD *)(a1 + 40);
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "addFailureBlock:", v9);

}

void __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_2_121(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  EMLogCategoryMessageLoading();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543874;
    v7 = v5;
    v8 = 2050;
    v9 = objc_msgSend(v3, "count");
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "[SmartReply] %{public}@ Returning %{public}lu original-content messages: %{public}@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __138__MFMessageContentRequest__contentRepresentationForEvent_contentURL_relatedItems_messageAndHTMLDataPair_existingRepresentation_invocable___block_invoke_123(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  EMLogCategoryMessageLoading();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "[SmartReply] %{public}@ Failed to return original-content messages with error: %@{public}", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_includeSuggestionItemsIfNeededForRepresentation:(id)a3 message:(id)a4
{
  id v6;
  EMContentRequestOptions *options;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (self)
    options = self->_options;
  else
    options = 0;
  v8 = -[EMContentRequestOptions includeSuggestionItems](options, "includeSuggestionItems");
  if (v8 == 2
    || v8 == 1
    && (objc_msgSend(v6, "mailbox"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isOutgoingMailboxUid"),
        v9,
        (v10 & 1) == 0))
  {
    +[MFSearchableIndexItem_iOS suggestionsSearchableItemWithMessage:](MFSearchableIndexItem_iOS, "suggestionsSearchableItemWithMessage:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSearchableItem:", v11);

    v12 = objc_alloc_init(MEMORY[0x1E0D1E1B0]);
    objc_msgSend(v12, "commandForMessage:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUnsubscribeCommand:", v13);

  }
}

- (void)_includeCachedMetadataJSONIfNeededForRepresentation:(id)a3 message:(id)a4
{
  id v6;
  EMContentRequestOptions *options;
  EDMessagePersistence *messagePersistence;
  EDMessagePersistence *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (self)
    options = self->_options;
  else
    options = 0;
  if ((-[EMContentRequestOptions includeCachedMetadataJSON](options, "includeCachedMetadataJSON") & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (!self ? (messagePersistence = 0) : (messagePersistence = self->_messagePersistence),
          v9 = messagePersistence,
          -[EDMessagePersistence completeCachedMetadataJSONForGlobalMessageID:](v9, "completeCachedMetadataJSONForGlobalMessageID:", objc_msgSend(v6, "globalMessageID")), v10 = (void *)objc_claimAutoreleasedReturnValue(), v9, v10))
    {
      v11 = 0;
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v11 = 1;
    }
    objc_msgSend(v13, "setCachedMetadataJSON:", v12);
    if (v11)

  }
}

- (void)_includeHeadersIfNeededForRepresentation:(id)a3 message:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "requestedHeaderKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headersIfAvailable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "requestAllHeaders"))
  {
    objc_msgSend(v10, "allHeaderKeys");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "headersForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v17);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E228]), "initWithHeaders:", v12);
  objc_msgSend(v20, "setRequestedHeaders:", v19);

}

- (id)_messageForLegacyMessage:(id)a3
{
  id v4;
  NSString *v5;
  EDMessageTransformer *v6;
  EFScheduler *v7;
  EMMessageObjectID *objectID;
  void *v9;
  id v10;
  EFScheduler *v11;
  EDMessageTransformer *v12;
  NSString *v13;
  void *v14;
  EMMessageObjectID *v16;
  _QWORD v17[4];
  id v18;
  EFScheduler *v19;
  MFMessageContentRequest *v20;
  EDMessageTransformer *v21;
  NSString *v22;

  v4 = a3;
  if (self)
  {
    v5 = self->_clientIdentifier;
    v6 = self->_messageTransformer;
    v7 = self->_scheduler;
    objectID = self->_objectID;
  }
  else
  {
    v7 = 0;
    v5 = 0;
    v6 = 0;
    objectID = 0;
  }
  v16 = objectID;
  -[EMMessageObjectID mailboxScope](v16, "mailboxScope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__MFMessageContentRequest__messageForLegacyMessage___block_invoke;
  v17[3] = &unk_1E4E8DB70;
  v10 = v4;
  v18 = v10;
  v11 = v7;
  v19 = v11;
  v20 = self;
  v12 = v6;
  v21 = v12;
  v13 = v5;
  v22 = v13;
  -[EDMessageTransformer transformBaseMessage:mailboxScope:loaderBlock:](v12, "transformBaseMessage:mailboxScope:loaderBlock:", v10, v9, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __52__MFMessageContentRequest__messageForLegacyMessage___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  EMLogCategoryMessageLoading();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "requestedRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_INFO, "requesting %{public}@ content for message %{public}@", buf, 0x16u);

  }
  v13 = *(_QWORD **)(a1 + 48);
  if (v13)
    v13 = (_QWORD *)v13[3];
  v14 = *(_QWORD *)(a1 + 40);
  v15 = v13;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD **)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 56);
  if (v17)
    v17 = (_QWORD *)v17[8];
  v19 = v17;
  v20 = *(_QWORD *)(a1 + 48);
  if (v20)
    v20 = *(_QWORD *)(v20 + 72);
  +[MFMessageContentRequest onScheduler:requestContentForObjectID:messagePersistence:legacyMessage:messageTransformer:mailDropAttachmentGenerator:listUnsubscribeHandler:clientIdentifier:options:delegate:completionHandler:](MFMessageContentRequest, "onScheduler:requestContentForObjectID:messagePersistence:legacyMessage:messageTransformer:mailDropAttachmentGenerator:listUnsubscribeHandler:clientIdentifier:options:delegate:completionHandler:", v14, 0, v15, v16, v18, v19, v20, *(_QWORD *)(a1 + 64), v7, v8, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_requestContentForAttachment:(id)a3 manager:(id)a4 options:(id)a5 managed:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void (**v25)(_QWORD);
  id v26;
  void *v27;
  EFScheduler *scheduler;
  EFScheduler *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  id v40;
  void (**v41)(_QWORD);
  _QWORD aBlock[4];
  NSObject *v43;
  id v44;
  id v45;
  MFMessageContentRequest *v46;
  id v47;
  BOOL v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v36 = a4;
  v13 = a5;
  v35 = a7;
  EMLogCategoryMessageLoading();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "url", v35, v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v54 = v15;
    _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "Start to request content for attachment: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "future");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke;
  v51[3] = &unk_1E4E8DB98;
  v19 = v35;
  v52 = v19;
  objc_msgSend(v17, "addSuccessBlock:", v51);

  objc_msgSend(v16, "future");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v18;
  v49[1] = 3221225472;
  v49[2] = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_2;
  v49[3] = &unk_1E4E8D7D8;
  v21 = v19;
  v50 = v21;
  objc_msgSend(v20, "addFailureBlock:", v49);

  v22 = objc_msgSend(v13, "networkUsage");
  if (v22 || (objc_msgSend(v12, "isDataAvailableLocally") & 1) != 0)
  {
    aBlock[0] = v18;
    aBlock[1] = 3221225472;
    aBlock[2] = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_130;
    aBlock[3] = &unk_1E4E8DC10;
    v23 = v12;
    v43 = v23;
    v24 = v16;
    v44 = v24;
    v45 = v36;
    v46 = self;
    v47 = v13;
    v48 = a6;
    v25 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (v22 == 1 && (-[NSObject isDataAvailableLocally](v23, "isDataAvailableLocally") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        scheduler = self->_scheduler;
      else
        scheduler = 0;
      v29 = scheduler;
      v37[0] = v18;
      v37[1] = 3221225472;
      v37[2] = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_2_141;
      v37[3] = &unk_1E4E8DC38;
      v38 = v23;
      v41 = v25;
      v30 = v27;
      v39 = v30;
      v40 = v24;
      -[EFScheduler performBlock:](v29, "performBlock:", v37);

      v31 = v40;
      v26 = v30;

    }
    else
    {
      v25[2](v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }

    v32 = v43;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "finishWithError:", v34);

    EMLogCategoryMessageLoading();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "url");
      objc_claimAutoreleasedReturnValue();
      -[MFMessageContentRequest _requestContentForAttachment:manager:options:managed:completion:].cold.1();
    }
    v26 = 0;
  }

  return v26;
}

uint64_t __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_130(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "part");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setWantsCompletionBlockOffMainThread:", 1);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_2_131;
  v16 = &unk_1E4E8DBE8;
  v17 = *(id *)(a1 + 40);
  v5 = v4;
  v18 = v5;
  objc_copyWeak(&v24, &location);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v19 = v6;
  v20 = v7;
  v21 = v8;
  v9 = v2;
  v22 = v9;
  v10 = v3;
  v23 = v10;
  v25 = *(_BYTE *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "setFetchCompletionBlock:", &v13);
  objc_msgSend(*(id *)(a1 + 32), "fetchData", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v11;
}

void __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_2_131(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *WeakRetained;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _BYTE *v27;
  id v28;
  char v29;
  id location;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11 = *(void **)(a1 + 32);
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB3388];
    v36[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithError:", v14);

    EMLogCategoryMessageLoading();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      v32 = v10;
      _os_log_error_impl(&dword_1A4F90000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to request content for attachment url: %@, original file URL: %@ due to error: %@", buf, 0x20u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    if (WeakRetained)
    {
      objc_msgSend(*(id *)(a1 + 48), "prepareAttachmentForDisplay:fileURL:", WeakRetained, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v32 = __Block_byref_object_copy__17;
      v33 = __Block_byref_object_dispose__17;
      v34 = (id)0xAAAAAAAAAAAAAAAALL;
      v34 = v8;
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, WeakRetained);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_132;
      v19[3] = &unk_1E4E8DBC0;
      v18 = *(void **)(a1 + 64);
      v19[4] = *(_QWORD *)(a1 + 56);
      v20 = v18;
      v21 = v7;
      v22 = *(id *)(a1 + 72);
      v23 = *(id *)(a1 + 40);
      v24 = *(id *)(a1 + 32);
      v27 = buf;
      objc_copyWeak(&v28, &location);
      v25 = *(id *)(a1 + 80);
      v29 = *(_BYTE *)(a1 + 96);
      v26 = *(id *)(a1 + 48);
      objc_msgSend(v17, "always:", v19);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

    }
  }

}

void __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_132(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  int v5;
  uint64_t *v6;
  char v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *WeakRetained;
  MFRFC822AttachmentDataProvider *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  MFRFC822AttachmentDataProvider *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  MFRFC822AttachmentDataProvider *v50;
  id v51;
  uint64_t v52;
  id v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[6];
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "requestedRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)*MEMORY[0x1E0D1DBD8], "isEqualToString:", v4);

  v6 = (uint64_t *)(a1 + 48);
  if (*(_QWORD *)(a1 + 48))
    v7 = v5;
  else
    v7 = 1;
  if ((v7 & 1) != 0)
    goto LABEL_40;
  v8 = objc_alloc(MEMORY[0x1E0D1E128]);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "stringByDeletingPathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithOriginalFileURL:clientIdentifier:preferredFilename:extension:relatedItems:securityInformation:", v9, v3, v10, v11, MEMORY[0x1E0C9AA60], 0);

  if (!v12)
  {
LABEL_40:
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
    {
LABEL_12:
      EMLogCategoryMessageLoading();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138543362;
        v55 = v17;
        _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_INFO, "Processing fetched attachment using NSData for '%{public}@'", buf, 0xCu);
      }

      v18 = *(_QWORD *)(a1 + 96);
      if (*(_QWORD *)(*(_QWORD *)(v18 + 8) + 40))
      {
        v19 = +[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:](MFAttachmentPlaceholder, "isPlaceholderSerializedRepresentation:");
        v18 = *(_QWORD *)(a1 + 96);
        if (v19)
        {
          +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:](MFAttachmentPlaceholder, "placeholderFromSerializedRepresentation:", *(_QWORD *)(*(_QWORD *)(v18 + 8) + 40));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            +[MFAttachmentPlaceholder dataForPlaceholder:](MFAttachmentPlaceholder, "dataForPlaceholder:", v20);
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
            v23 = *(void **)(v22 + 40);
            *(_QWORD *)(v22 + 40) = v21;

          }
          v18 = *(_QWORD *)(a1 + 96);
        }
      }
      if (*(_QWORD *)(*(_QWORD *)(v18 + 8) + 40))
      {
        if (v5)
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
          v25 = -[MFRFC822AttachmentDataProvider initWithMessageData:parentPart:managed:]([MFRFC822AttachmentDataProvider alloc], "initWithMessageData:parentPart:managed:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(_QWORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 112));
          v26 = *(void **)(a1 + 88);
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-attach-RFC822"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addProvider:forBaseURL:", v25, v27);

          -[MFRFC822AttachmentDataProvider messageForAttachment:](v25, "messageForAttachment:", WeakRetained);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "_messageForLegacyMessage:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_alloc(MEMORY[0x1E0D1E128]);
          v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
          objc_msgSend(*(id *)(a1 + 56), "stringByDeletingPathExtension");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "pathExtension");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v30, "initWithContentMessage:data:clientIdentifier:preferredFilename:extension:", v29, v31, v3, v32, v33);

          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_138;
          v48[3] = &unk_1E4E88EE8;
          v49 = *(id *)(a1 + 88);
          v34 = v25;
          v50 = v34;
          objc_msgSend(v12, "addInvalidationHandler:", v48);

        }
        else
        {
          v40 = objc_alloc(MEMORY[0x1E0D1E128]);
          v41 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
          objc_msgSend(*(id *)(a1 + 56), "stringByDeletingPathExtension");
          WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "pathExtension");
          v34 = (MFRFC822AttachmentDataProvider *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v40, "initWithData:clientIdentifier:preferredFilename:extension:relatedItems:securityInformation:", v41, v3, WeakRetained, v34, MEMORY[0x1E0C9AA60], 0);
        }

        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 72), "finishWithResult:", v12);
          goto LABEL_37;
        }
      }
      v42 = *(void **)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, 0);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "finishWithError:", v37);
LABEL_36:

      v12 = 0;
      goto LABEL_37;
    }
    v35 = *v6;
    if (*v6)
    {
      v51 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v35, 1, &v51);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v51;
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v39 = *(void **)(v38 + 40);
      *(_QWORD *)(v38 + 40) = v36;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
      {

        goto LABEL_12;
      }
      if (v37)
      {
        v52 = *MEMORY[0x1E0CB3388];
        v53 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v43 = 0;
      }
    }
    else
    {
      v43 = 0;
      v37 = 0;
    }
    v44 = *(void **)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "finishWithError:", v45);

    EMLogCategoryMessageLoading();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_132_cold_1(v6, v46, v47);

    goto LABEL_36;
  }
  EMLogCategoryMessageLoading();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138412546;
    v55 = v14;
    v56 = 2114;
    v57 = v15;
    _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_INFO, "Returning copy of original file url %@ for '%{public}@'", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 72), "finishWithResult:", v12);
LABEL_37:

}

uint64_t __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_138(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeProvider:", *(_QWORD *)(a1 + 40));
}

void __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_2_141(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldAutoDownload"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addChild:withPendingUnitCount:");

  }
  else
  {
    v2 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:");

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 1);
  }
}

- (id)_contentItemForAttachment:(id)a3 manager:(id)a4 managed:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MFMailMessage *legacyMessage;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  MFMailMessage *v25;
  MFMailMessage *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  _QWORD v33[5];
  id v34;
  id v35;
  BOOL v36;
  _QWORD v37[4];
  id v38;
  MFMessageContentRequest *v39;
  BOOL v40;
  uint64_t v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0D1E3D0]);
  objc_msgSend(v8, "contentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentID:", v11);

  objc_msgSend(v8, "fileUTType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUniformTypeIdentifier:", v12);

  objc_msgSend(v8, "fileName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDisplayName:", v13);

  objc_msgSend(v10, "setIsAvailableLocally:", objc_msgSend(v8, "isDataAvailableLocally"));
  objc_msgSend(v10, "setDataTransferByteCount:", objc_msgSend(v8, "encodedFileSize"));
  objc_msgSend(v10, "setStorageByteCount:", objc_msgSend(v8, "decodedFileSize"));
  objc_msgSend(v8, "mailDropMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMailDropMetadata:", v14);

  objc_msgSend(v8, "part");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "partNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMimePartNumber:", v16);

  if (self)
    legacyMessage = self->_legacyMessage;
  else
    legacyMessage = 0;
  -[MFMailMessage loadMeetingExternalID](legacyMessage, "loadMeetingExternalID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniformTypeIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  if (v19 && v18)
  {
    v21 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v10, "uniformTypeIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "typeWithIdentifier:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "conformsToType:", *MEMORY[0x1E0CEC478]);

    if (v24)
    {
      if (self)
        v25 = self->_legacyMessage;
      else
        v25 = 0;
      v26 = v25;
      -[MFMailMessage account](v26, "account");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "meetingStorePersistentID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setExchangeEventUID:", MFMailGetEventUIDForUniqueIdentifierAndPersistentStoreID(v18, v28));

      v20 = 1;
      objc_msgSend(v10, "setIsAvailableLocally:", 1);
    }
    else
    {
      v20 = 0;
    }
  }
  if (objc_msgSend(v8, "isRFC822"))
  {
    v29 = *MEMORY[0x1E0D1DBD8];
    v42[0] = *MEMORY[0x1E0D1DBF0];
    v42[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAvailableRepresentations:", v30);
  }
  else
  {
    v41 = *MEMORY[0x1E0D1DBF0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAvailableRepresentations:", v30);
  }

  if (v20)
  {
    v31 = objc_msgSend(v10, "exchangeEventUID") != 0;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __69__MFMessageContentRequest__contentItemForAttachment_manager_managed___block_invoke;
    v37[3] = &unk_1E4E8DC60;
    v40 = v31;
    v38 = v8;
    v39 = self;
    objc_msgSend(v10, "setLoaderBlock:", v37);

  }
  else
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __69__MFMessageContentRequest__contentItemForAttachment_manager_managed___block_invoke_2;
    v33[3] = &unk_1E4E8DC88;
    v33[4] = self;
    v34 = v8;
    v35 = v9;
    v36 = a5;
    objc_msgSend(v10, "setLoaderBlock:", v33);

  }
  return v10;
}

uint64_t __69__MFMessageContentRequest__contentItemForAttachment_manager_managed___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  objc_msgSend(*(id *)(a1 + 32), "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
  {
    v7 = objc_alloc(MEMORY[0x1E0D1E128]);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD **)(a1 + 40);
    if (v9)
      v9 = (_QWORD *)v9[6];
    v10 = v9;
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v7, "initWithData:clientIdentifier:preferredFilename:extension:relatedItems:securityInformation:", v8, v10, v11, v12, MEMORY[0x1E0C9AA60], 0);

    objc_msgSend(v13, "setTransportType:", 1);
    v5[2](v5, v13, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2048, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v5)[2](v5, 0, v13);
  }

  return 0;
}

id __69__MFMessageContentRequest__contentItemForAttachment_manager_managed___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "_requestContentForAttachment:manager:options:managed:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(unsigned __int8 *)(a1 + 56), a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_originalContentMessagesInReplyToLegacyMessage:(id)a3 withMessageAndHTMLDataPair:(id)a4 maximumNumberOfMessages:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  MFMailMessage *legacyMessage;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  MFMessageContentRequest *v25;
  id v26;
  id v27;
  void (**v28)(id, _QWORD, void *);
  unint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a6;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Should not retrieve original-content messages"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v17);
    goto LABEL_7;
  }
  if (self)
    legacyMessage = self->_legacyMessage;
  else
    legacyMessage = 0;
  -[MFMailMessage subject](legacyMessage, "subject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasForwardPrefix");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Should not retrieve original-content messages for forwarded message"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v17);
LABEL_7:

    goto LABEL_15;
  }
  __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke(v16, v11);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
  {
    if (a5 == 1)
    {
      v30[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v12)[2](v12, v20, 0);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "originalContentMessageScheduler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_2;
        v23[3] = &unk_1E4E8DD80;
        v24 = v10;
        v25 = self;
        v29 = a5;
        v27 = &__block_literal_global_150;
        v28 = v12;
        v26 = v19;
        objc_msgSend(v22, "performBlock:", v23);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Failed to retrieve latest original-content message"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v21);

  }
LABEL_15:

}

id __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "senders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dateReceived");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v3 && v4 && v6 && v7)
  {
    v20 = v4;
    v21 = v2;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
    objc_msgSend(MEMORY[0x1E0D1E770], "snippetFromHTMLBody:options:maxLength:preservingQuotedForwardedContent:", v19, 17, 0x7FFFFFFFFFFFFFFFLL, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "searchableMessageID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v11 = objc_alloc(MEMORY[0x1E0D1E2B0]);
    objc_msgSend(v3, "subject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subjectString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "to");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cc");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "flags");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v11, "initWithSearchableMessageID:bodyText:subject:sender:toList:ccList:flags:date:", v10, v18, v13, v6, v14, v15, v16, v8);

    v4 = v20;
    v2 = v21;
  }

  return v9;
}

void __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  dispatch_semaphore_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  MFMessageLoadingContext *v12;
  void *v13;
  MFMessageLoadingContext *v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  NSObject *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "messageStore");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__17;
  v62 = __Block_byref_object_dispose__17;
  v63 = (id)0xAAAAAAAAAAAAAAAALL;
  v63 = *v2;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__17;
  v56 = __Block_byref_object_dispose__17;
  v57 = (id)0xAAAAAAAAAAAAAAAALL;
  v57 = (id)objc_opt_new();
  while (v59[5])
  {
    if (objc_msgSend((id)v53[5], "count", v31) >= (unint64_t)(*(_QWORD *)(a1 + 72) - 1))
      break;
    v3 = dispatch_semaphore_create(0);
    v4 = *(void **)(a1 + 40);
    v5 = v59[5];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_3;
    v48[3] = &unk_1E4E8DCF0;
    v50 = &v58;
    v51 = &v52;
    v6 = v3;
    v49 = v6;
    objc_msgSend(v4, "_messageInReplyToMessage:libraryStore:completion:", v5, v31, v48);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  }
  v34 = (void *)objc_opt_new();
  v33 = (void *)objc_opt_new();
  v7 = dispatch_group_create();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = (id)v53[5];
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v67, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        v12 = [MFMessageLoadingContext alloc];
        +[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[MFMessageLoadingContext initWithMessage:attachmentManager:](v12, "initWithMessage:attachmentManager:", v11, v13);

        v15 = *(_QWORD **)(a1 + 40);
        if (v15)
          v15 = (_QWORD *)v15[1];
        v16 = v15;
        -[MFMessageLoadingContext load:scheduler:shouldDownload:](v14, "load:scheduler:shouldDownload:", 0, v16, 0);

        dispatch_group_enter(v7);
        v17 = *(void **)(a1 + 40);
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_4;
        v39[3] = &unk_1E4E8DD18;
        v43 = *(id *)(a1 + 56);
        v40 = v34;
        v41 = v11;
        v42 = v7;
        objc_msgSend(v17, "_messageContentFromLoadingContext:completion:", v14, v39);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v18, v11);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v67, 16);
    }
    while (v8);
  }

  v19 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v7, v19))
  {
    EMLogCategoryMessageLoading();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_2_cold_1();
    }

    v21 = *(_QWORD *)(a1 + 64);
    v66 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v22, 0);
  }
  else
  {
    v22 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v23 = (id)v53[5];
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v65, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v36;
LABEL_19:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(v23);
        objc_msgSend(v34, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v26), v31);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
          break;
        objc_msgSend(v22, "addObject:", v27);

        if (v24 == ++v26)
        {
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v65, 16);
          if (v24)
            goto LABEL_19;
          break;
        }
      }
    }

    v64 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "ef_filter:", &__block_literal_global_159);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
}

void __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "ef_addOptionalObject:", v4);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_4(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_157(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "flags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "draft") ^ 1;

  return v3;
}

- (void)_messageInReplyToMessage:(id)a3 libraryStore:(id)a4 completion:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  EDMessagePersistence *messagePersistence;
  void *v14;
  void *v15;
  void (**v16)(id, _QWORD, id);

  v16 = (void (**)(id, _QWORD, id))a5;
  objc_msgSend(a3, "headersIfAvailable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "firstHeaderForKey:", *MEMORY[0x1E0D1E588]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "references");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      v12 = v9;
    }
    else
    {
      objc_msgSend(v10, "lastObject");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Failed to retrieve in-reply-to identifier"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v16[2](v16, 0, v12);
LABEL_9:

        goto LABEL_10;
      }
    }
    if (self)
      messagePersistence = self->_messagePersistence;
    else
      messagePersistence = 0;
    -[EDMessagePersistence persistedMessagesForForMessageIDHeader:requireProtectedData:](messagePersistence, "persistedMessagesForForMessageIDHeader:requireProtectedData:", v12, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ef_firstObjectPassingTest:", &__block_literal_global_165);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *, id))v16)[2](v16, v15, 0);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("No headers available"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2](v16, 0, v9);
LABEL_10:

}

uint64_t __76__MFMessageContentRequest__messageInReplyToMessage_libraryStore_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_attachmentContentItemsForMailDropNodes:(id)a3 withContext:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v34 = a4;
  EMLogCategoryMessageLoading();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v33;
    _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_INFO, "MailDrop: Received MailDrop Nodes %@", buf, 0xCu);
  }

  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[MFMessageContentRequest _maildropMetadataFromContext:](self, "_maildropMetadataFromContext:", v34);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v44 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v12, "UUID", v33);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v9);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v14 = v33;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v40;
      v17 = *MEMORY[0x1E0D1DCD0];
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v19, "objectForKeyedSubscript:", v17, v33);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20 == 0;

          if (!v21)
          {
            objc_msgSend((id)objc_opt_class(), "metadataWithDictionary:", v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "UUID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, v23);

          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v7, "allValues");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(v25);
          -[MFMessageContentRequest _attachmentForMailDropMetaData:context:](self, "_attachmentForMailDropMetaData:context:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k), v34, v33);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            objc_msgSend(v34, "attachmentManager");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFMessageContentRequest _contentItemForAttachment:manager:managed:](self, "_contentItemForAttachment:manager:managed:", v29, v30, 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "addObject:", v31);
          }

        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v26);
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_maildropMetadataFromContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void (**v9)(void *, _QWORD);
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a3;
  objc_msgSend(v3, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headersIfAvailable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__MFMessageContentRequest__maildropMetadataFromContext___block_invoke;
  v12[3] = &unk_1E4E8DDE8;
  v7 = v5;
  v13 = v7;
  v8 = v6;
  v14 = v8;
  v9 = (void (**)(void *, _QWORD))_Block_copy(v12);
  v9[2](v9, *MEMORY[0x1E0D1E580]);
  v9[2](v9, *MEMORY[0x1E0D1E5C8]);
  v10 = v8;

  return v10;
}

void __56__MFMessageContentRequest__maildropMetadataFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "headersForKey:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0D1E1C0], "parseHeaderValue:forField:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)_attachmentForMailDropMetaData:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MFMailMessage *legacyMessage;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "directUrl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resourceSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    legacyMessage = self->_legacyMessage;
  else
    legacyMessage = 0;
  -[MFMailMessage messageID](legacyMessage, "messageID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@%@"), CFSTR("x-attach-maildrop"), v11, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "attachmentManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attachmentForURL:error:", v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setMailDropMetadata:", v6);
  objc_msgSend(v6, "fileName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ef_sanitizedFileName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFileName:", v18);

  objc_msgSend(v6, "mimeType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMimeType:", v19);

  objc_msgSend(v16, "setDecodedFileSize:", objc_msgSend(v6, "fileSize"));
  objc_msgSend(v16, "setEncodedFileSize:", objc_msgSend(v6, "fileSize"));
  objc_msgSend(v6, "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentID:", v20);

  return v16;
}

+ (id)metadataWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D1E1B8], "mailDropMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DCD0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(MEMORY[0x1E0D1E1C0], "parseURL:intoMetadata:", v7, v4);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DCB0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D1DC98]))
  {
    v9 = objc_msgSend(v4, "flags") | 1;
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D1DCA8]))
      goto LABEL_8;
    v9 = objc_msgSend(v4, "flags") | 4;
  }
  objc_msgSend(v4, "setFlags:", v9);
LABEL_8:
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DCC0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "ef_sanitizedFileName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFileName:", v12);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DCC8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v4, "setFileSize:", objc_msgSend(v13, "integerValue"));
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DCB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(MEMORY[0x1E0D1E1C0], "parseExpiration:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExpiration:", v17);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_listUnsubscribeHandler, 0);
  objc_storeStrong((id *)&self->_mailDropAttachmentGenerator, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_messageTransformer, 0);
  objc_storeStrong((id *)&self->_legacyMessage, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

void __62__MFMessageContentRequest__processContentLoadingContextEvent___block_invoke_68_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "Duplicate content IDs for content items: %@. Ignoring", (uint8_t *)&v3);
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "EMContentItemRequestDelegate failed generating MailDrop attachments: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_108_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "MailDrop node parsing finished with error %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_3_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "failed to generate snippets for mail drop attachments: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

void __88__MFMessageContentRequest__contentRepresentationForLoadingEvent_existingRepresentation___block_invoke_2_111_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "MailDrop node insertion to original HTML content failed with error %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_requestContentForAttachment:manager:options:managed:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "Failed to request content for attachment with URL: %@, since network usage is not allowed and attachment data is unavailable locally", v5);

  OUTLINED_FUNCTION_1();
}

void __91__MFMessageContentRequest__requestContentForAttachment_manager_options_managed_completion___block_invoke_132_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "Failed to request content for attachments since attachment data is not available and we could not convert the original file url: %@ into data", (uint8_t *)&v4);
}

void __136__MFMessageContentRequest__originalContentMessagesInReplyToLegacyMessage_withMessageAndHTMLDataPair_maximumNumberOfMessages_completion___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "timed-out generating original content for message: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

@end
