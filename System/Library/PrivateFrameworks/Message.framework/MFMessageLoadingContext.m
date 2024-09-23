@implementation MFMessageLoadingContext

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MFMessageLoadingContext_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_21 != -1)
    dispatch_once(&log_onceToken_21, block);
  return (id)log_log_21;
}

void __30__MFMessageLoadingContext_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_21;
  log_log_21 = (uint64_t)v1;

}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelationToken cancel](self->_cancelable, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MFMessageLoadingContext;
  -[MFMessageLoadingContext dealloc](&v3, sel_dealloc);
}

- (MFMessageLoadingContext)initWithMessage:(id)a3 attachmentManager:(id)a4
{
  id v7;
  id v8;
  MFMessageLoadingContext *v9;
  MFMessageLoadingContext *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MFMessageLoadingContext;
  v9 = -[MFMessageLoadingContext init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    objc_storeStrong((id *)&v10->_attachmentManager, a4);
    objc_msgSend(v7, "messageStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mailbox");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "mailboxType");
    v10->_outgoingMessage = objc_msgSend(v12, "isOutgoingMailboxUid");
    v10->_draftMessage = v13 == 5;
    v10->_editableMessage = (unint64_t)(v13 - 5) < 2;
    -[MFMessageLoadingContext _setupMeetingData](v10, "_setupMeetingData");
    -[MFMessageLoadingContext _setupObservableStreams](v10, "_setupObservableStreams");

  }
  return v10;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), self, self->_message);
}

- (void)_setupMeetingData
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "unable to get an event with external id %@ after it was successfully reconstituted.", (uint8_t *)&v3);
}

- (void)_setupObservableStreams
{
  EFObserver *v3;
  EFObserver *inputObservable;
  void *v5;
  EFObservable *v6;
  EFObservable *contentObservable;
  EFCancelationToken *v8;
  EFCancelationToken *cancelable;
  EFCancelationToken *v10;
  void *v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id location;

  if (self->_inputObservable)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMessageLoadingContext.m"), 222, CFSTR("_inputObservable must not already be configured"));

  }
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D1EF28], "observableObserver");
  v3 = (EFObserver *)objc_claimAutoreleasedReturnValue();
  inputObservable = self->_inputObservable;
  self->_inputObservable = v3;

  -[EFObserver replay:](self->_inputObservable, "replay:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __50__MFMessageLoadingContext__setupObservableStreams__block_invoke;
  v17 = &unk_1E4E8DFF8;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v5, "filter:", &v14);
  v6 = (EFObservable *)objc_claimAutoreleasedReturnValue();
  contentObservable = self->_contentObservable;
  self->_contentObservable = v6;

  v8 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x1E0D1EE90]);
  cancelable = self->_cancelable;
  self->_cancelable = v8;

  v10 = self->_cancelable;
  objc_msgSend(v5, "connect", v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFCancelationToken addCancelable:](v10, "addCancelable:", v11);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

uint64_t __50__MFMessageLoadingContext__setupObservableStreams__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "assignAttachmentManagerToContent:", v5);

  objc_msgSend(v3, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "processMeetingInvitations:", v6);

  return 1;
}

- (void)cancel
{
  -[EFCancelationToken cancel](self->_cancelable, "cancel");
}

- (id)onScheduler:(id)a3 addLoadObserver:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD aBlock[4];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__MFMessageLoadingContext_onScheduler_addLoadObserver___block_invoke;
  aBlock[3] = &unk_1E4E8D7D8;
  v9 = v7;
  v21 = v9;
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __55__MFMessageLoadingContext_onScheduler_addLoadObserver___block_invoke_2;
  v17[3] = &unk_1E4E8E020;
  v10 = _Block_copy(aBlock);
  v18 = v10;
  v11 = v9;
  v19 = v11;
  v12 = _Block_copy(v17);
  objc_msgSend(MEMORY[0x1E0D1EF30], "observerWithResultBlock:completionBlock:failureBlock:", v12, 0, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObservable observeOn:](self->_contentObservable, "observeOn:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subscribe:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[EFCancelationToken addCancelable:](self->_cancelable, "addCancelable:", v15);
  return v15;
}

uint64_t __55__MFMessageLoadingContext_onScheduler_addLoadObserver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__MFMessageLoadingContext_onScheduler_addLoadObserver___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (id)addLoadObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1F070], "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageLoadingContext onScheduler:addLoadObserver:](self, "onScheduler:addLoadObserver:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)load:(int64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncSchedulerWithQualityOfService:", 25);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMessageLoadingContext load:scheduler:](self, "load:scheduler:", a3);

}

- (void)load:(int64_t)a3 scheduler:(id)a4
{
  -[MFMessageLoadingContext load:scheduler:shouldDownload:](self, "load:scheduler:shouldDownload:", a3, a4, 1);
}

- (void)load:(int64_t)a3 scheduler:(id)a4 shouldDownload:(BOOL)a5
{
  id v8;
  _QWORD v9[6];
  BOOL v10;

  v8 = a4;
  -[MFMessageLoadingContext setHasLoadedSomeContent:](self, "setHasLoadedSomeContent:", 1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__MFMessageLoadingContext_load_scheduler_shouldDownload___block_invoke;
  v9[3] = &unk_1E4E8E048;
  v9[4] = self;
  v9[5] = a3;
  v10 = a5;
  objc_msgSend(v8, "performVoucherPreservingBlock:", v9);

}

uint64_t __57__MFMessageLoadingContext_load_scheduler_shouldDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_load:shouldDownload:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

+ (unint64_t)_nextOffsetForOffset:(unint64_t)a3 totalLength:(unint64_t)a4 requestedAmount:(unint64_t)a5
{
  unint64_t v5;
  BOOL v6;

  if (!(a5 | a3))
    return 1;
  if (a5)
  {
    v5 = a5 + a3;
    v6 = a5 + a3 >= a4;
  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = a3 >= 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v6)
    return a4;
  else
    return v5;
}

- (void)_load:(int64_t)a3 shouldDownload:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  id v14;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "threadDictionary");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x1E0D45F78];
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D45F78]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v8);

  -[MFMessageLoadingContext _reallyLoad:shouldDownload:](self, "_reallyLoad:shouldDownload:", a3, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EFCancelationToken isCanceled](self->_cancelable, "isCanceled");
  if (v11)
    v13 = v12;
  else
    v13 = 1;
  if ((v13 & 1) == 0)
    -[EFObserver observerDidReceiveResult:](self->_inputObservable, "observerDidReceiveResult:", v11);
  if (v9)
    objc_msgSend(v14, "setObject:forKey:", v9, v8);

}

- (id)_reallyLoad:(int64_t)a3 shouldDownload:(BOOL)a4
{
  void *v7;
  void *v8;
  EFCancelationToken *cancelable;
  uint64_t v10;
  void *v11;
  void *v12;
  MFMessageLoadingContext *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id *p_isa;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *v37;
  id v38;
  int v39;
  MFMessageLoadingContextEvent *v40;
  id v41;
  id v42;
  _BOOL4 v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  int v55;
  _BOOL4 v56;
  uint64_t v57;
  MFMessageLoadingContextEvent *v58;
  NSObject *v60;
  void *v61;
  void *v62;
  MFMessageLoadingContextEvent *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  MFMessageLoadingContextEvent *v68;
  int v69;
  int v70;
  unint64_t v71;
  unint64_t v72;
  char v74;
  void *v75;
  id v76;
  char *v77;
  size_t v78;
  size_t v79;
  const char *v80;
  const char *v81;
  char *v82;
  int v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  _BOOL8 v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  MFMessageLoadingContext *v100;
  unint64_t v101;
  void *v102;
  uint64_t v103;
  MFMessageLoadingContextEvent *v104;
  _BOOL4 v105;
  void *v106;
  void *v107;
  unsigned __int8 v108;
  _QWORD v109[5];
  unsigned __int8 v110;
  unint64_t v111;
  _QWORD v112[4];
  id v113;
  _BYTE buf[24];
  __int16 v115;
  uint64_t v116;
  int v117;
  void *v118;
  uint64_t v119;

  v105 = a4;
  v119 = *MEMORY[0x1E0C80C00];
  if ((-[EFCancelationToken isCanceled](self->_cancelable, "isCanceled") & 1) != 0)
  {
    v104 = 0;
    return v104;
  }
  v104 = objc_alloc_init(MFMessageLoadingContextEvent);
  -[MFMessageLoadingContextEvent setContext:](v104, "setContext:", self);
  -[MFMessageLoadingContext message](self, "message");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageLoadingContext messageBody](self, "messageBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFActivityMonitor pushNewMonitor](MFActivityMonitor, "pushNewMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  cancelable = self->_cancelable;
  v10 = MEMORY[0x1E0C809B0];
  v112[0] = MEMORY[0x1E0C809B0];
  v112[1] = 3221225472;
  v112[2] = __54__MFMessageLoadingContext__reallyLoad_shouldDownload___block_invoke;
  v112[3] = &unk_1E4E88DC8;
  v96 = v8;
  v113 = v96;
  -[EFCancelationToken addCancelationBlock:](cancelable, "addCancelationBlock:", v112);
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = self;
  objc_msgSend(v11, "recordTransportType:", 1);

  if (v7 && v105)
  {
    v12 = v7;
    v13 = self;
  }
  else
  {
    if (v105)
    {
      +[MFMessageLoadingContext log](MFMessageLoadingContext, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "Download supported, getting body", buf, 2u);
      }

      objc_msgSend(v107, "messageBody");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[MFMessageLoadingContext log](MFMessageLoadingContext, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "Download not supported, getting body if available", buf, 2u);
      }

      objc_msgSend(v107, "messageBodyIfAvailable");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v98 = (void *)v15;

    v12 = v98;
    v13 = self;
    if (v98)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMessageLoadingContext.m"), 355, CFSTR("body must be a MIME body"));

        v12 = v98;
        v13 = self;
      }
    }
    -[MFMessageLoadingContext _setMessageBody:](v13, "_setMessageBody:", v12);
    if (!v12)
    {
      +[MFMessageLoadingContext log](MFMessageLoadingContext, "log");
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v107, "messageID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMessageLoadingContext _reallyLoad:shouldDownload:].cold.1(v61, (uint64_t)buf, v60);
      }

      -[MFMessageLoadingContextEvent setTransportType:](v104, "setTransportType:", objc_msgSend(v96, "transportType"));
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2050, 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessageLoadingContextEvent setError:](v104, "setError:", v62);

      +[MFActivityMonitor destroyMonitor](MFActivityMonitor, "destroyMonitor");
      v63 = v104;
      v99 = 0;
      goto LABEL_66;
    }
  }
  v111 = 0;
  v99 = v12;
  v103 = objc_msgSend((id)objc_opt_class(), "_nextOffsetForOffset:totalLength:requestedAmount:", -[MFMessageLoadingContext contentOffset](v13, "contentOffset"), objc_msgSend(v12, "totalTextSize"), 0);
  objc_msgSend(v12, "topLevelPart");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v110 = 0;
  v20 = *MEMORY[0x1E0D1DC10];
  v21 = 1;
  do
  {
    if (!v21)
    {
      objc_msgSend(v19, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", v103, &v111, v105, 1, &v110);
      v22 = objc_claimAutoreleasedReturnValue();

      v23 = v19;
      v18 = v23;
      v17 = (id)v22;
    }
    if (a3 < 1)
    {
      objc_msgSend(v107, "defaultAlternativeInPart:", v106);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v107, "bestAlternativeInPart:", v106);
      v24 = objc_claimAutoreleasedReturnValue();

      if (!v18 || (void *)v24 != v18)
        goto LABEL_27;
      if (!_contentLoadedEmptyDocument(v17, v111))
      {
        v19 = v18;
        goto LABEL_28;
      }

      v111 = 0;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v20, 2050, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      -[MFMessageLoadingContextEvent setError:](v104, "setError:", v25);
      v24 = 0;
      v18 = 0;
      v17 = 0;
      a3 = -1;
      v19 = (void *)v25;
    }

LABEL_27:
    v19 = (void *)v24;
LABEL_28:
    v21 = v19 == 0;
  }
  while (!v19 || v19 != v18);
  -[MFMessageLoadingContext setLoadedPart:](v100, "setLoadedPart:", v19);
  -[MFMessageLoadingContext setContentOffset:](v100, "setContentOffset:", v111);
  objc_msgSend(v19, "rfc822DecodedMessageBody");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  v28 = v99;
  if (v26)
    v28 = (void *)v26;
  v97 = v28;

  objc_msgSend(v97, "attachments");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v10;
  v109[1] = 3221225472;
  v109[2] = __54__MFMessageLoadingContext__reallyLoad_shouldDownload___block_invoke_123;
  v109[3] = &unk_1E4E8E070;
  v109[4] = v100;
  objc_msgSend(v29, "ef_map:", v109);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  p_isa = (id *)&v100->super.isa;
  if (objc_msgSend(v95, "count"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = _os_activity_create(&dword_1A4F90000, "Load attachment", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      memset(buf, 170, 16);
      os_activity_scope_enter(v31, (os_activity_scope_state_t)buf);
      -[MFMessageLoadingContext attachmentManager](v100, "attachmentManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "insertMessageAttachmentMetadataToPersistence:forMessage:", v95, v107);

      EDAttachmentsLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v117 = 138543362;
        v118 = v95;
        _os_log_impl(&dword_1A4F90000, v33, OS_LOG_TYPE_DEFAULT, "Loading attachments %{public}@", (uint8_t *)&v117, 0xCu);
      }

      os_activity_scope_leave((os_activity_scope_state_t)buf);
      p_isa = (id *)&v100->super.isa;
    }
  }
  LOBYTE(v117) = 0;
  v108 = 0;
  objc_msgSend(v97, "numberOfAttachmentsSigned:encrypted:", &v117, &v108);
  v34 = objc_msgSend(p_isa[8], "messageFlags");
  if ((_BYTE)v117 && (v34 & 0x800000) == 0 || v108 && (v34 & 8) == 0)
  {
    LOBYTE(v117) = v117 | ((v34 & 0x800000) != 0);
    v108 |= (v34 & 8) != 0;
    v35 = objc_msgSend(v107, "numberOfAttachments");
    objc_msgSend(v107, "setNumberOfAttachments:isSigned:isEncrypted:", v35, v117, v108);
  }
  if (_contentLoadedEmptyDocument(v17, v111))
  {
    -[MFMessageLoadingContextEvent setContent:](v104, "setContent:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(p_isa, "setHasLoadedSomeContent:", 1);
    goto LABEL_46;
  }
  v17 = v17;
  objc_msgSend(v17, "firstObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v37, "error");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v39 = 1;
  }
  else
  {
    v38 = 0;
    v39 = 0;
  }

  v94 = v38;
  if (v39)
  {
    -[MFMessageLoadingContext setHasLoadedSomeContent:](v100, "setHasLoadedSomeContent:", 0);
    -[MFMessageLoadingContextEvent setTransportType:](v104, "setTransportType:", objc_msgSend(v96, "transportType"));
    -[MFMessageLoadingContextEvent setError:](v104, "setError:", v94);
    +[MFActivityMonitor destroyMonitor](MFActivityMonitor, "destroyMonitor");
    v40 = v104;

    goto LABEL_65;
  }
  v41 = v97;
  if (objc_msgSend(v17, "count"))
  {
    v42 = 0;
    v43 = 0;
  }
  else
  {
    v92 = v41;
    objc_msgSend(v41, "topLevelPart");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "SMIMEError");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "domain");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(CFSTR("MFMessageErrorDomain"), "isEqualToString:", v66))
    {
      v43 = objc_msgSend(v65, "code") == 1035;

      if (v43)
      {
        v42 = objc_retainAutorelease(v65);
        v43 = 1;
      }
      else
      {
        v42 = 0;
      }
    }
    else
    {

      v42 = 0;
      v43 = 0;
    }

    v41 = v92;
  }

  v67 = v42;
  if (v43)
  {
    -[MFMessageLoadingContext setHasLoadedSomeContent:](v100, "setHasLoadedSomeContent:", 0);
    -[MFMessageLoadingContextEvent setTransportType:](v104, "setTransportType:", objc_msgSend(v96, "transportType"));
    -[MFMessageLoadingContextEvent setError:](v104, "setError:", v67);
    +[MFActivityMonitor destroyMonitor](MFActivityMonitor, "destroyMonitor");
    v68 = v104;

    goto LABEL_65;
  }
  v69 = objc_msgSend(v19, "isHTML");
  if (a3 < 1)
    v70 = v69;
  else
    v70 = 0;
  v93 = v67;
  if (v70 != 1 || -[MFMessageLoadingContext contentOffset](v100, "contentOffset") >> 14 > 2 || v110)
    goto LABEL_118;
  v101 = objc_msgSend(v17, "count");
  v71 = 0;
  v72 = 0;
  v102 = v17;
  while (v110 || v71 >= v101)
  {
LABEL_109:
    v85 = +[MFMessageLoadingContext _nextOffsetForOffset:totalLength:requestedAmount:](MFMessageLoadingContext, "_nextOffsetForOffset:totalLength:requestedAmount:", -[MFMessageLoadingContext contentOffset](v100, "contentOffset", v93), objc_msgSend(v99, "totalTextSize"), 0x4000);
    objc_msgSend(v19, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", v85, &v111, v105, 1, &v110);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    -[MFMessageLoadingContext setContentOffset:](v100, "setContentOffset:", v111);
    if (v103 != v85)
    {
      v102 = v17;
      v103 = v85;
      if (v111 < 0xC000)
        continue;
    }
    goto LABEL_118;
  }
  v74 = 0;
  while (2)
  {
    objc_msgSend(v102, "objectAtIndex:", v71, v93);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v75, "htmlData");
      v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v77 = (char *)objc_msgSend(v76, "bytes");
      v78 = objc_msgSend(v76, "length");
      if (!v77)
      {
        v81 = 0;
        goto LABEL_103;
      }
      v79 = v78;
      v80 = (const char *)memchr(v77, 60, v78);
      if (v80)
      {
        v81 = v80;
        v82 = &v77[v79];
        while (1)
        {
          v83 = *((unsigned __int8 *)v81 + 5);
          if ((v83 == 62 || v83 == 32) && !strncasecmp(v81 + 1, "body", 4uLL))
            break;
          v81 = (const char *)memchr((void *)(v81 + 1), 60, v82 - (v81 + 1));
          if (!v81)
            goto LABEL_99;
        }
LABEL_103:
        v84 = v81 - v77;
        v74 = 1;
      }
      else
      {
LABEL_99:
        v84 = objc_msgSend(v76, "length");
        v74 = 0;
      }

      v72 += v84;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v72 += objc_msgSend(v75, "encodedFileSize");
    }

    ++v71;
    if ((v74 & 1) == 0 && !v110 && v71 < v101)
      continue;
    break;
  }
  if ((v74 & 1) == 0)
    goto LABEL_109;
  if (v72 < 0x401)
  {
    v17 = v102;
  }
  else
  {
    v86 = -[MFMessageLoadingContext contentOffset](v100, "contentOffset");
    v87 = objc_msgSend(v99, "totalTextSize");
    if (v72 <= 0x1F58)
      v88 = 8024;
    else
      v88 = v72;
    objc_msgSend(v19, "contentToOffset:resultOffset:downloadIfNecessary:asHTML:isComplete:", +[MFMessageLoadingContext _nextOffsetForOffset:totalLength:requestedAmount:](MFMessageLoadingContext, "_nextOffsetForOffset:totalLength:requestedAmount:", v86, v87, v88), &v111, v105, 1, &v110);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    -[MFMessageLoadingContext setContentOffset:](v100, "setContentOffset:", v111);
  }
LABEL_118:
  v89 = v93;
  -[MFMessageLoadingContextEvent setContent:](v104, "setContent:", v17, v93);
  if (v111)
    v90 = objc_msgSend(v17, "count") != 0;
  else
    v90 = 0;
  -[MFMessageLoadingContext setHasLoadedSomeContent:](v100, "setHasLoadedSomeContent:", v90);

  p_isa = (id *)&v100->super.isa;
LABEL_46:
  if (v110)
  {
    v36 = 1;
  }
  else
  {
    v44 = objc_msgSend(v19, "totalTextSize");
    v45 = objc_msgSend(p_isa, "contentOffset");
    if (v44 >= v45)
      v46 = v44 - v45;
    else
      v46 = 0;
    -[MFMessageLoadingContextEvent setRemainingBytes:](v104, "setRemainingBytes:", v46);
    +[MFMessageLoadingContext log](MFMessageLoadingContext, "log");
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      -[MFMessageLoadingContext message](v100, "message");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "ef_publicDescription");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[MFMessageLoadingContextEvent remainingBytes](v104, "remainingBytes");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v49;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v50;
      _os_log_impl(&dword_1A4F90000, v47, OS_LOG_TYPE_DEFAULT, "Body download not complete for message %{public}@. Remaining bytes: %ld", buf, 0x16u);

    }
    v36 = v110;
  }
  -[MFMessageLoadingContextEvent setHasLoadedCompleteBody:](v104, "setHasLoadedCompleteBody:", v36 != 0);
  objc_msgSend(v107, "bestAlternativeInPart:", v106);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageLoadingContextEvent setHasLoadedBestAlternativePart:](v104, "setHasLoadedBestAlternativePart:", v19 == v51);

  -[MFMessageLoadingContextEvent setLoadedPart:](v104, "setLoadedPart:", v19);
  -[MFMessageLoadingContextEvent setLoadedBody:](v104, "setLoadedBody:", v97);
  -[MFMessageLoadingContextEvent setTransportType:](v104, "setTransportType:", objc_msgSend(v96, "transportType"));
  -[MFMessageLoadingContext setHasLoadedCompleteMessage:](v100, "setHasLoadedCompleteMessage:", v110);
  -[MFMessageLoadingContext setHasLoadedBestAlternativePart:](v100, "setHasLoadedBestAlternativePart:", -[MFMessageLoadingContextEvent hasLoadedBestAlternativePart](v104, "hasLoadedBestAlternativePart"));
  +[MFMessageLoadingContext log](MFMessageLoadingContext, "log");
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    -[MFMessageLoadingContext message](v100, "message");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "ef_publicDescription");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v110;
    v56 = -[MFMessageLoadingContextEvent hasLoadedBestAlternativePart](v104, "hasLoadedBestAlternativePart");
    v57 = -[MFMessageLoadingContextEvent transportType](v104, "transportType");
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v54;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v55;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v56;
    v115 = 2048;
    v116 = v57;
    _os_log_impl(&dword_1A4F90000, v52, OS_LOG_TYPE_DEFAULT, "MFMessageLoadingContextEvent for message:%{public}@ hasLoadedCompleteMessage %{BOOL}d, hasLoadedBestAlternativePart %{BOOL}d, transportType %ld", buf, 0x22u);

  }
  +[MFActivityMonitor destroyMonitor](MFActivityMonitor, "destroyMonitor");
  v58 = v104;
LABEL_65:

LABEL_66:
  return v104;
}

uint64_t __54__MFMessageLoadingContext__reallyLoad_shouldDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

id __54__MFMessageLoadingContext__reallyLoad_shouldDownload___block_invoke_123(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "mimePart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "partNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  EDAttachmentsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_DEFAULT, "Creating MFAttachment for part number %{public}@ textAttachment %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "attachmentManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachmentForTextAttachment:error:", v3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)assignAttachmentManagerToContent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "setAttachmentManager:", self->_attachmentManager);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_11;
          -[MFMessageLoadingContext attachmentManager](self, "attachmentManager", (_QWORD)v11);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          v10 = (id)objc_msgSend(v9, "attachmentForTextAttachment:error:", v8, 0);
        }

LABEL_11:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)processMeetingInvitations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[MFMessageLoadingContext attachmentManager](self, "attachmentManager", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "attachmentForTextAttachment:error:", v8, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v10, "isCalendarFile"))
          {
            if (self->_eventICSRepresentation)
            {
              objc_msgSend(v10, "setIcsRepresentation:");
            }
            else if (self->_eventUniqueID)
            {
              objc_msgSend(v10, "setEventID:");
              objc_msgSend(v10, "setMeetingStorePersistentID:", self->_meetingStorePersistentID);
            }
            if (self->_meetingName)
              objc_msgSend(v10, "setFileName:");
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (MFMailMessage)message
{
  return self->_message;
}

- (void)_setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (MFMimeBody)messageBody
{
  return self->_messageBody;
}

- (void)_setMessageBody:(id)a3
{
  objc_storeStrong((id *)&self->_messageBody, a3);
}

- (MFAttachmentManager)attachmentManager
{
  return self->_attachmentManager;
}

- (void)_setAttachmentManager:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentManager, a3);
}

- (BOOL)hasLoadedSomeContent
{
  return self->_hasLoadedSomeContent;
}

- (void)setHasLoadedSomeContent:(BOOL)a3
{
  self->_hasLoadedSomeContent = a3;
}

- (BOOL)hasLoadedCompleteMessage
{
  return self->_hasLoadedCompleteMessage;
}

- (void)setHasLoadedCompleteMessage:(BOOL)a3
{
  self->_hasLoadedCompleteMessage = a3;
}

- (BOOL)hasLoadedBestAlternativePart
{
  return self->_hasLoadedBestAlternativePart;
}

- (void)setHasLoadedBestAlternativePart:(BOOL)a3
{
  self->_hasLoadedBestAlternativePart = a3;
}

- (BOOL)isOutgoingMessage
{
  return self->_outgoingMessage;
}

- (BOOL)isDraftMessage
{
  return self->_draftMessage;
}

- (BOOL)isEditableMessage
{
  return self->_editableMessage;
}

- (EFObservable)contentObservable
{
  return self->_contentObservable;
}

- (MFMimePart)loadedPart
{
  return self->_loadedPart;
}

- (void)setLoadedPart:(id)a3
{
  objc_storeStrong((id *)&self->_loadedPart, a3);
}

- (unint64_t)contentOffset
{
  return self->_contentOffset;
}

- (void)setContentOffset:(unint64_t)a3
{
  self->_contentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedPart, 0);
  objc_storeStrong((id *)&self->_contentObservable, 0);
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_eventICSRepresentation, 0);
  objc_storeStrong((id *)&self->_meetingStorePersistentID, 0);
  objc_storeStrong((id *)&self->_meetingName, 0);
  objc_storeStrong((id *)&self->_eventUniqueID, 0);
  objc_storeStrong((id *)&self->_inputObservable, 0);
  objc_storeStrong((id *)&self->_cancelable, 0);
}

- (void)_reallyLoad:(NSObject *)a3 shouldDownload:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a3, (uint64_t)a3, "Failed to get the body for messageID %{public}@", (uint8_t *)a2);

}

@end
