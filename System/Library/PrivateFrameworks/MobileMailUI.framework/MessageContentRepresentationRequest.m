@implementation MessageContentRepresentationRequest

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MessageContentRepresentationRequest_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, block);
  return (OS_os_log *)(id)log_log_2;
}

void __42__MessageContentRepresentationRequest_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.mobilemail", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;

}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MessageContentRepresentationRequest_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1)
    dispatch_once(&signpostLog_onceToken, block);
  return (OS_os_log *)(id)signpostLog_log;
}

void __50__MessageContentRepresentationRequest_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (id)defaultScheduler
{
  objc_opt_self();
  if (defaultScheduler_onceToken != -1)
    dispatch_once(&defaultScheduler_onceToken, &__block_literal_global_0);
  return (id)defaultScheduler_scheduler;
}

void __55__MessageContentRepresentationRequest_defaultScheduler__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.MessageContentRepresentationRequest"), 25);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultScheduler_scheduler;
  defaultScheduler_scheduler = v0;

}

- (MessageContentRepresentationRequest)initWithMessage:(id)a3
{
  return -[MessageContentRepresentationRequest initWithMessage:includeSuggestions:representationType:delegate:](self, "initWithMessage:includeSuggestions:representationType:delegate:", a3, 0, *MEMORY[0x1E0D1DBE0], 0);
}

- (MessageContentRepresentationRequest)initWithMessage:(id)a3 includeSuggestions:(int64_t)a4
{
  return -[MessageContentRepresentationRequest initWithMessage:includeSuggestions:representationType:delegate:](self, "initWithMessage:includeSuggestions:representationType:delegate:", a3, a4, *MEMORY[0x1E0D1DBE0], 0);
}

- (MessageContentRepresentationRequest)initWithMessage:(id)a3 includeSuggestions:(int64_t)a4 representationType:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  MessageContentRepresentationRequest *v13;
  uint64_t v14;
  EMCollectionItemID *itemID;
  uint64_t v16;
  EFFuture *messageFuture;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MessageContentRepresentationRequest;
  v13 = -[MessageContentRepresentationRequest init](&v19, sel_init);
  if (v13)
  {
    objc_msgSend(v10, "itemID");
    v14 = objc_claimAutoreleasedReturnValue();
    itemID = v13->_itemID;
    v13->_itemID = (EMCollectionItemID *)v14;

    objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    messageFuture = v13->_messageFuture;
    v13->_messageFuture = (EFFuture *)v16;

    objc_storeStrong((id *)&v13->_contentRepresentationType, a5);
    -[MessageContentRepresentationRequest _commonInitWithIncludeSuggestionItems:delegate:]((uint64_t)v13, a4 != 0, v12);
  }

  return v13;
}

- (void)_commonInitWithIncludeSuggestionItems:(id)obj delegate:
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a1)
  {
    objc_storeWeak((id *)(a1 + 8), obj);
    *(_BYTE *)(a1 + 64) = a2;
    objc_msgSend(MEMORY[0x1E0D1EF28], "observableObserver");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v5;

    v7 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
    v8 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v7;

    objc_msgSend(*(id *)(a1 + 24), "replay:", 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filter:", &__block_literal_global_47);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v9;

    v11 = *(void **)(a1 + 16);
    objc_msgSend(v13, "connect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addCancelable:", v12);

  }
}

- (MessageContentRepresentationRequest)initWithMessageList:(id)a3 itemIdentifier:(id)a4 includeSuggestions:(int64_t)a5
{
  return -[MessageContentRepresentationRequest initWithMessageList:itemIdentifier:includeSuggestions:representationType:delegate:](self, "initWithMessageList:itemIdentifier:includeSuggestions:representationType:delegate:", a3, a4, a5, *MEMORY[0x1E0D1DBE0], 0);
}

- (MessageContentRepresentationRequest)initWithMessageList:(id)a3 itemIdentifier:(id)a4 includeSuggestions:(int64_t)a5 representationType:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MessageContentRepresentationRequest *v16;
  MessageContentRepresentationRequest *v17;
  void *v18;
  uint64_t v19;
  EFFuture *messageFuture;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)MessageContentRepresentationRequest;
  v16 = -[MessageContentRepresentationRequest init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_itemID, a4);
    objc_msgSend(v12, "messageListItemForItemID:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "then:", &__block_literal_global_42);
    v19 = objc_claimAutoreleasedReturnValue();
    messageFuture = v17->_messageFuture;
    v17->_messageFuture = (EFFuture *)v19;

    objc_storeStrong((id *)&v17->_contentRepresentationType, a6);
    -[MessageContentRepresentationRequest _commonInitWithIncludeSuggestionItems:delegate:]((uint64_t)v17, a5 != 0, v15);
  }

  return v17;
}

id __121__MessageContentRepresentationRequest_initWithMessageList_itemIdentifier_includeSuggestions_representationType_delegate___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "displayMessage");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateItemID:(id)a3 messageList:(id)a4
{
  id v7;
  void *v8;
  EFFuture *v9;
  EFFuture *messageFuture;
  id v11;

  v11 = a3;
  v7 = a4;
  if ((-[EMCollectionItemID isEqual:](self->_itemID, "isEqual:", v11) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_itemID, a3);
    objc_msgSend(v7, "messageListItemForItemID:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "then:", &__block_literal_global_43);
    v9 = (EFFuture *)objc_claimAutoreleasedReturnValue();
    messageFuture = self->_messageFuture;
    self->_messageFuture = v9;

  }
}

id __64__MessageContentRepresentationRequest_updateItemID_messageList___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "displayMessage");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __86__MessageContentRepresentationRequest__commonInitWithIncludeSuggestionItems_delegate___block_invoke()
{
  return 1;
}

- (NSString)ef_publicDescription
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[MessageContentRepresentationRequest state](self, "state");
  if (v3 > 3)
    v4 = 0;
  else
    v4 = off_1E9A03018[v3];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageContentRepresentationRequest itemID](self, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p> itemID: %@ state:%@"), v7, self, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)dealloc
{
  objc_super v3;

  -[MessageContentRepresentationRequest cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MessageContentRepresentationRequest;
  -[MessageContentRepresentationRequest dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  MessageContentRepresentationRequest *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[MessageContentRepresentationRequest log](MessageContentRepresentationRequest, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    -[MessageContentRepresentationRequest itemID](self, "itemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412802;
    v7 = v4;
    v8 = 2048;
    v9 = self;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1D56AF000, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p> Content request for message %{public}@ being cancelled.", (uint8_t *)&v6, 0x20u);

  }
  -[EFCancelationToken cancel](self->_cancelationToken, "cancel");
}

- (EMMessage)message
{
  void *v2;
  void *v3;
  void *v4;
  EMMessage *v5;

  -[MessageContentRepresentationRequest messageFuture](self, "messageFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D1ED88] + 16))())
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)_issueMessageContentRepresentationRequest
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  id v35;
  id location;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _BYTE buf[12];
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    atomic_store(0, (unsigned __int8 *)(a1 + 48));
    v2 = (os_unfair_lock_s *)(a1 + 68);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
    if (*(_QWORD *)(a1 + 40))
    {
      os_unfair_lock_unlock(v2);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
      v3 = objc_claimAutoreleasedReturnValue();
      -[NSObject future](v3, "future");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v6;

      os_unfair_lock_unlock(v2);
      if (v3)
      {
        +[MessageContentRepresentationRequest signpostLog](MessageContentRepresentationRequest, "signpostLog");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend((id)a1, "signpostID");
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
        {
          objc_msgSend((id)a1, "itemID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v10;
          _os_signpost_emit_with_name_impl(&dword_1D56AF000, v8, OS_SIGNPOST_EVENT, v9, "MessageContentRepresentationRequest", "itemID=%{signpost.description:attribute,public}@", buf, 0xCu);

        }
        +[MessageContentRepresentationRequest signpostLog](MessageContentRepresentationRequest, "signpostLog");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend((id)a1, "signpostID");
        if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
        {
          objc_msgSend((id)a1, "itemID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v13;
          _os_signpost_emit_with_name_impl(&dword_1D56AF000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MessageContentRepresentationRequest", "itemID=%{signpost.description:attribute,public}@", buf, 0xCu);

        }
        +[MessageContentRepresentationRequest signpostLog](MessageContentRepresentationRequest, "signpostLog");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend((id)a1, "signpostID");
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          objc_msgSend((id)a1, "itemID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v16;
          _os_signpost_emit_with_name_impl(&dword_1D56AF000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "MessageContentRepresentationRequestFailed", "itemID=%{signpost.description:attribute,public}@", buf, 0xCu);

        }
        objc_msgSend((id)a1, "messageFuture");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "resultIfAvailable");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18 == 0;

        if (v19)
        {
          +[MessageContentRepresentationRequest log](MessageContentRepresentationRequest, "log");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v28 = objc_opt_class();
            objc_msgSend((id)a1, "itemID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v28;
            v43 = 2048;
            v44 = a1;
            v45 = 2114;
            v46 = v29;
            _os_log_error_impl(&dword_1D56AF000, v20, OS_LOG_TYPE_ERROR, "<%@: %p> Issuing content request for message with unavailable message future %{public}@", buf, 0x20u);

          }
        }
        else
        {
          +[MessageContentRepresentationRequest log](MessageContentRepresentationRequest, "log");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = objc_opt_class();
            objc_msgSend((id)a1, "itemID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v21;
            v43 = 2048;
            v44 = a1;
            v45 = 2114;
            v46 = v22;
            _os_log_impl(&dword_1D56AF000, v20, OS_LOG_TYPE_DEFAULT, "<%@: %p> Issuing content request for message %{public}@", buf, 0x20u);

          }
        }

        +[MessageContentRepresentationRequest defaultScheduler]();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "itemID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, (id)a1);
        v25 = MEMORY[0x1E0C809B0];
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke;
        v39[3] = &unk_1E9A02F58;
        objc_copyWeak(&v41, (id *)buf);
        v26 = v24;
        v40 = v26;
        objc_msgSend(v17, "onScheduler:then:", v23, v39);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v25;
        v37[1] = 3221225472;
        v37[2] = __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke_3;
        v37[3] = &unk_1E9A02F80;
        objc_copyWeak(&v38, (id *)buf);
        objc_msgSend(v27, "addSuccessBlock:", v37);
        location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, v3);
        v30 = v25;
        v31 = 3221225472;
        v32 = __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke_69;
        v33 = &unk_1E9A02FA8;
        objc_copyWeak(&v34, (id *)buf);
        objc_copyWeak(&v35, &location);
        objc_msgSend(v27, "addFailureBlock:", &v30);
        -[NSObject finishWithFuture:](v3, "finishWithFuture:", v27, v30, v31, v32, v33);
        objc_msgSend(*(id *)(a1 + 16), "addCancelable:", v3);
        objc_destroyWeak(&v35);
        objc_destroyWeak(&v34);
        objc_destroyWeak(&location);
        objc_destroyWeak(&v38);

        objc_destroyWeak(&v41);
        objc_destroyWeak((id *)buf);

        goto LABEL_22;
      }
    }
    +[MessageContentRepresentationRequest log](MessageContentRepresentationRequest, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_opt_class();
      objc_msgSend((id)a1, "itemID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v4;
      v43 = 2048;
      v44 = a1;
      v45 = 2114;
      v46 = v5;
      _os_log_impl(&dword_1D56AF000, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p> Content request for message %{public}@ already issued", buf, 0x20u);

    }
LABEL_22:

  }
}

id __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  MessageContentRepresentationRequestDelegate *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (MessageContentRepresentationRequestDelegate *)objc_loadWeakRetained(WeakRetained + 1);
    if (!v6)
      v6 = objc_alloc_init(MessageContentRepresentationRequestDelegate);
    v7 = objc_alloc(MEMORY[0x1E0D1E130]);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke_2;
    v14[3] = &unk_1E9A02F30;
    v14[4] = WeakRetained;
    v8 = (void *)objc_msgSend(v7, "initWithBuilder:", v14);
    objc_msgSend(v5, "completionHandlerAdapter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requestRepresentationWithOptions:delegate:completionHandler:", v8, v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained[2], "addCancelable:", v10);
    objc_msgSend(v5, "future");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D1EEC0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemNotFoundErrorWithItemID:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setRequestedRepresentation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(v3, "setNetworkUsage:", 1);
  objc_msgSend(v3, "setIncludeSuggestionItems:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 64));
  v4 = *MEMORY[0x1E0D1E560];
  v6[0] = *MEMORY[0x1E0D1E570];
  v6[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestedHeaderKeys:", v5);

  objc_msgSend(v3, "setIncludeCachedMetadataJSON:", 1);
}

void __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id *v15;
  __int16 v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[MessageContentRepresentationRequest signpostLog](MessageContentRepresentationRequest, "signpostLog");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(WeakRetained, "signpostID");
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D56AF000, v5, OS_SIGNPOST_INTERVAL_END, v6, "MessageContentRepresentationRequest", " enableTelemetry=YES ", (uint8_t *)&v12, 2u);
    }

    v18[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[MessageContentRepresentationRequest log](MessageContentRepresentationRequest, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      objc_msgSend(WeakRetained, "itemID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v10;
      v14 = 2048;
      v15 = WeakRetained;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1D56AF000, v9, OS_LOG_TYPE_DEFAULT, "<%@: %p> Content request for message %{public}@ loaded successfully", (uint8_t *)&v12, 0x20u);

    }
    objc_msgSend(WeakRetained[3], "observerDidReceiveResult:", v8);

  }
}

void __80__MessageContentRepresentationRequest__issueMessageContentRepresentationRequest__block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained)
  {
    objc_msgSend(v5, "future");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageContentRepresentationRequest _resetFuture:]((uint64_t)WeakRetained, v7);

    +[MessageContentRepresentationRequest signpostLog](MessageContentRepresentationRequest, "signpostLog");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(WeakRetained, "signpostID");
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D56AF000, v8, OS_SIGNPOST_INTERVAL_END, v9, "MessageContentRepresentationRequestFailed", " enableTelemetry=YES ", (uint8_t *)&v19, 2u);
    }

    objc_msgSend(v3, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      if (v3)
      {
        v12 = v3;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("MessageContentRepresentationRequest failed without reason"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v12;
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v27[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      atomic_store(1u, (unsigned __int8 *)WeakRetained + 48);
    +[MessageContentRepresentationRequest log](MessageContentRepresentationRequest, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_opt_class();
      objc_msgSend(WeakRetained, "itemID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ef_publicDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v16;
      v21 = 2048;
      v22 = WeakRetained;
      v23 = 2114;
      v24 = v17;
      v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_1D56AF000, v15, OS_LOG_TYPE_DEFAULT, "<%@: %p> Content request for message %{public}@ failed to load with error: %{public}@", (uint8_t *)&v19, 0x2Au);

    }
    objc_msgSend(*((id *)WeakRetained + 3), "observerDidReceiveResult:", v14);

  }
}

- (void)_resetFuture:(uint64_t)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1)
  {
    v4 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
    if (*(id *)(a1 + 40) == v4)
    {
      *(_QWORD *)(a1 + 40) = 0;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 68));
    v3 = v4;
  }

}

- (EFFuture)contentRepresentationFuture
{
  os_unfair_lock_s *p_contentRepresentationLock;
  EFFuture *v4;

  p_contentRepresentationLock = &self->_contentRepresentationLock;
  os_unfair_lock_lock(&self->_contentRepresentationLock);
  v4 = self->_futureContentRepresentation;
  os_unfair_lock_unlock(p_contentRepresentationLock);
  return v4;
}

- (void)retry
{
  NSObject *v3;
  os_signpost_id_t v4;
  int retyAttempt_low;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ++self->_retyAttempt;
  +[MessageContentRepresentationRequest signpostLog](MessageContentRepresentationRequest, "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[MessageContentRepresentationRequest signpostID](self, "signpostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    retyAttempt_low = LOBYTE(self->_retyAttempt);
    v6[0] = 67240192;
    v6[1] = retyAttempt_low;
    _os_signpost_emit_with_name_impl(&dword_1D56AF000, v3, OS_SIGNPOST_EVENT, v4, "MessageContentRepresentationRequest", "retry-attempt=%{signpost.description:attribute,public}hhu", (uint8_t *)v6, 8u);
  }

  -[MessageContentRepresentationRequest start](self, "start");
}

- (id)resultIfAvailable
{
  void *v2;
  void *v3;

  -[MessageContentRepresentationRequest contentRepresentationFuture](self, "contentRepresentationFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resultIfAvailable:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)waitForResult
{
  void *v3;
  void *v4;

  -[MessageContentRepresentationRequest start](self, "start");
  -[MessageContentRepresentationRequest contentRepresentationFuture](self, "contentRepresentationFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "result:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasStarted
{
  void *v2;
  BOOL v3;

  -[MessageContentRepresentationRequest contentRepresentationFuture](self, "contentRepresentationFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isFinished
{
  void *v2;
  BOOL v3;

  -[MessageContentRepresentationRequest resultIfAvailable](self, "resultIfAvailable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)state
{
  void *v3;
  unsigned __int8 v5;

  -[MessageContentRepresentationRequest resultIfAvailable](self, "resultIfAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 2;
  v5 = atomic_load((unsigned __int8 *)&self->_hasError);
  if ((v5 & 1) != 0)
    return 3;
  else
    return -[MessageContentRepresentationRequest hasStarted](self, "hasStarted");
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
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD aBlock[4];
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__MessageContentRepresentationRequest_onScheduler_addLoadObserver___block_invoke;
  aBlock[3] = &unk_1E9A02FD0;
  v9 = v7;
  v23 = v9;
  v10 = _Block_copy(aBlock);
  v17 = v8;
  v18 = 3221225472;
  v19 = __67__MessageContentRepresentationRequest_onScheduler_addLoadObserver___block_invoke_2;
  v20 = &unk_1E9A02FF8;
  v11 = v9;
  v21 = v11;
  v12 = _Block_copy(&v17);
  objc_msgSend(MEMORY[0x1E0D1EF30], "observerWithResultBlock:completionBlock:failureBlock:", v12, 0, v10, v17, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EFObservable observeOn:](self->_contentObservable, "observeOn:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subscribe:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[EFCancelationToken addCancelable:](self->_cancelationToken, "addCancelable:", v15);
  return v15;
}

uint64_t __67__MessageContentRepresentationRequest_onScheduler_addLoadObserver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__MessageContentRepresentationRequest_onScheduler_addLoadObserver___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)addLoadObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1F070], "immediateScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageContentRepresentationRequest onScheduler:addLoadObserver:](self, "onScheduler:addLoadObserver:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (EFFuture)messageFuture
{
  return self->_messageFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageFuture, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_contentRepresentationType, 0);
  objc_storeStrong((id *)&self->_futureContentRepresentation, 0);
  objc_storeStrong((id *)&self->_contentObservable, 0);
  objc_storeStrong((id *)&self->_inputObservable, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
