@implementation ASCLockupPresenter

+ (id)log
{
  objc_opt_self();
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, &__block_literal_global_11);
  return (id)log_log_3;
}

void __25__ASCLockupPresenter_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppStoreComponents", "ASCLockupPresenter");
  v1 = (void *)log_log_3;
  log_log_3 = (uint64_t)v0;

}

+ (__CFString)iconPlaceholderDecoration
{
  objc_opt_self();
  return CFSTR("roundedRect");
}

- (ASCLockupPresenter)initWithView:(id)a3 customContentProvider:(id)a4 offerPresenter:(id)a5 metricsPresenter:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ASCLockupPresenter *v17;
  ASCLockupPresenter *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ASCLockupPresenter;
  v17 = -[ASCLockupPresenter init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_view, v12);
    objc_storeStrong((id *)&v18->_context, a7);
    objc_storeStrong((id *)&v18->_offerPresenter, a5);
    objc_storeStrong((id *)&v18->_metricsPresenter, a6);
    objc_storeStrong((id *)&v18->_customContentProvider, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCRebootstrapNotifier sharedNotifier](ASCRebootstrapNotifier, "sharedNotifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v18, sel_daemonDidRebootstrap_, 0x1E7565F08, v20);

  }
  return v18;
}

- (ASCLockupPresenter)initWithView:(id)a3 customContentProvider:(id)a4 offerPresenter:(id)a5 metricsPresenter:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  ASCLockupPresenter *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[ASCPresenterContext sharedContext](ASCPresenterContext, "sharedContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ASCLockupPresenter initWithView:customContentProvider:offerPresenter:metricsPresenter:context:](self, "initWithView:customContentProvider:offerPresenter:metricsPresenter:context:", v13, v12, v11, v10, v14);

  return v15;
}

- (ASCLockupPresenter)initWithView:(id)a3 offerPresenter:(id)a4 metricsPresenter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ASCLockupPresenter *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[ASCPresenterContext sharedContext](ASCPresenterContext, "sharedContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ASCLockupPresenter initWithView:customContentProvider:offerPresenter:metricsPresenter:context:](self, "initWithView:customContentProvider:offerPresenter:metricsPresenter:context:", v10, 0, v9, v8, v11);

  return v12;
}

- (ASCLockupPresenter)initWithView:(id)a3 metricsPresenter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ASCLockupPresenter *v9;

  v6 = a4;
  v7 = a3;
  +[ASCPresenterContext sharedContext](ASCPresenterContext, "sharedContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ASCLockupPresenter initWithView:customContentProvider:offerPresenter:metricsPresenter:context:](self, "initWithView:customContentProvider:offerPresenter:metricsPresenter:context:", v7, 0, 0, v6, v8);

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASCLockupPresenter;
  -[ASCLockupPresenter dealloc](&v4, sel_dealloc);
}

- (BOOL)prefersRightToLeftViewLayout
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "asc_storefrontLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "asc_prefersRightToLeftLayout");

  return v3;
}

- (void)setLockup:(id)a3
{
  ASCLockup *v4;
  ASCLockup *lockup;
  BOOL v6;
  ASCLockup *v7;
  ASCLockup *v8;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ASCLockup *v25;

  v4 = (ASCLockup *)a3;
  lockup = self->_lockup;
  v25 = v4;
  if (v4 && lockup)
  {
    v6 = -[ASCLockup isEqual:](lockup, "isEqual:", v4);
    v4 = v25;
    if (v6)
      goto LABEL_10;
  }
  else if (lockup == v4)
  {
    goto LABEL_10;
  }
  v7 = (ASCLockup *)-[ASCLockup copy](v4, "copy");
  v8 = self->_lockup;
  self->_lockup = v7;

  if (v25)
  {
    -[ASCLockup offer](v25, "offer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupPresenter offerPresenter](self, "offerPresenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOffer:", v9);

    -[ASCLockupPresenter metricsPresenter](self, "metricsPresenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setModel:", v25);

    -[ASCLockupPresenter performIconFetch](self, "performIconFetch");
    -[ASCLockupPresenter view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockup heading](v25, "heading");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHeading:", v13);

    -[ASCLockupPresenter view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockup title](v25, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v15);

    -[ASCLockupPresenter view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockup subtitle](v25, "subtitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSubtitle:", v17);

    -[ASCLockupPresenter view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPrefersRightToLeftLayout:", -[ASCLockupPresenter prefersRightToLeftViewLayout](self, "prefersRightToLeftViewLayout"));

    -[ASCLockupPresenter view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockup displayContext](v25, "displayContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDisplayContext:", v20);

    -[ASCLockupPresenter view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupPresenter customContentProvider](self, "customContentProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "badgeView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBadge:", v23);

  }
  else
  {
    -[ASCLockupPresenter reloadDefaultContent](self, "reloadDefaultContent");
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "postNotificationName:object:", CFSTR("ASCLockupPresenterDidChangeNotification"), self);

  v4 = v25;
LABEL_10:

}

- (void)setGroup:(id)a3
{
  ASCLockupViewGroup *v5;
  ASCLockupViewGroup *v6;
  ASCLockupViewGroup *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v5 = (ASCLockupViewGroup *)a3;
  v6 = self->_group;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = -[ASCLockupViewGroup isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) != 0)
      goto LABEL_13;
  }
  else
  {

    if (v7 == v5)
      goto LABEL_13;
  }
  if (self->_group)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("ASCLockupPresenterRetryGroupNotification"), self->_group);

  }
  objc_storeStrong((id *)&self->_group, a3);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_retryGroup_, CFSTR("ASCLockupPresenterRetryGroupNotification"), v5);

    -[ASCLockupPresenter request](self, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[ASCLockupPresenter log]();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ASCLockupPresenter setGroup:].cold.1((uint64_t)self, v12);

    }
  }
LABEL_13:

}

- (void)setRequest:(id)a3
{
  ASCLockupRequest *v4;
  ASCLockupRequest *request;
  BOOL v6;
  ASCLockupRequest *v7;
  ASCLockupRequest *v8;
  ASCLockupRequest *v9;

  v4 = (ASCLockupRequest *)a3;
  request = self->_request;
  v9 = v4;
  if (v4 && request)
  {
    v6 = -[ASCLockupRequest isEqual:](request, "isEqual:", v4);
    v4 = v9;
    if (v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (request != v4)
  {
LABEL_6:
    v7 = (ASCLockupRequest *)-[ASCLockupRequest copy](v4, "copy");
    v8 = self->_request;
    self->_request = v7;

    -[ASCLockupPresenter performLockupFetch](self, "performLockupFetch");
    v4 = v9;
  }
LABEL_7:

}

- (void)setShowsPlaceholderContent:(BOOL)a3
{
  if (((!self->_showsPlaceholderContent ^ a3) & 1) == 0)
  {
    self->_showsPlaceholderContent = a3;
    -[ASCLockupPresenter reloadDefaultContent](self, "reloadDefaultContent");
  }
}

- (void)showPlaceholderContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ASCLocalOffer *v11;
  void *v12;
  id v13;

  -[ASCLockupPresenter view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCLockupPresenter iconPlaceholderDecoration]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIconImage:withDecoration:", 0, v4);

  -[ASCLockupPresenter view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeading:", 0);

  -[ASCLockupPresenter view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", 0);

  -[ASCLockupPresenter view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubtitle:", 0);

  -[ASCLockupPresenter view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrefersRightToLeftLayout:", -[ASCLockupPresenter prefersRightToLeftViewLayout](self, "prefersRightToLeftViewLayout"));

  -[ASCLockupPresenter view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBadge:", 0);

  -[ASCLockupPresenter view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLoading:", 1);

  +[ASCOfferMetadata placeholderMetadata](ASCOfferMetadata, "placeholderMetadata");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = -[ASCLocalOffer initWithMetadata:action:]([ASCLocalOffer alloc], "initWithMetadata:action:", v13, 0);
  -[ASCLockupPresenter offerPresenter](self, "offerPresenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOffer:", v11);

}

- (void)clearContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[ASCLockupPresenter offerPresenter](self, "offerPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOffer:", 0);

  -[ASCLockupPresenter metricsPresenter](self, "metricsPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModel:", 0);

  -[ASCLockupPresenter view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIconImage:withDecoration:", 0, CFSTR("none"));

  -[ASCLockupPresenter view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeading:", 0);

  -[ASCLockupPresenter view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", 0);

  -[ASCLockupPresenter view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSubtitle:", 0);

  -[ASCLockupPresenter view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBadge:", 0);

  -[ASCLockupPresenter view](self, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLoading:", 0);

}

- (void)reloadDefaultContent
{
  void *v3;
  void *v4;

  -[ASCLockupPresenter request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || (-[ASCLockupPresenter lockup](self, "lockup"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[ASCLockupPresenter pendingRequestedLockup](self, "pendingRequestedLockup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      if (-[ASCLockupPresenter showsPlaceholderContent](self, "showsPlaceholderContent"))
        -[ASCLockupPresenter showPlaceholderContent](self, "showPlaceholderContent");
      else
        -[ASCLockupPresenter clearContent](self, "clearContent");
    }
  }
}

- (void)retryRequestIfNeeded:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(_QWORD);
  void (**v19)(id, _QWORD);
  _QWORD v20[5];

  v4 = (void (**)(id, _QWORD))a3;
  -[ASCLockupPresenter request](self, "request");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_7;
  v6 = (void *)v5;
  -[ASCLockupPresenter pendingRequestedLockup](self, "pendingRequestedLockup");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_7;
  }
  v8 = (void *)v7;
  -[ASCLockupPresenter pendingRequestedLockup](self, "pendingRequestedLockup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "asc_isCanceledOrPending");

  if (v10)
  {
LABEL_7:
    v4[2](v4, 0);
    goto LABEL_8;
  }
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __43__ASCLockupPresenter_retryRequestIfNeeded___block_invoke;
  v20[3] = &unk_1E7560398;
  v20[4] = self;
  v12 = (void (**)(_QWORD))MEMORY[0x1BCCFE944](v20);
  -[ASCLockupPresenter group](self, "group");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupPresenter group](self, "group");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("ASCLockupPresenterRetryGroupNotification"), v15);

    v12[2](v12);
    v4[2](v4, 1);
  }
  else
  {
    -[ASCLockupPresenter pendingRequestedLockup](self, "pendingRequestedLockup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __43__ASCLockupPresenter_retryRequestIfNeeded___block_invoke_2;
    v17[3] = &unk_1E7560C80;
    v17[4] = self;
    v18 = v12;
    v19 = v4;
    objc_msgSend(v16, "resultWithCompletion:", v17);

  }
LABEL_8:

}

void __43__ASCLockupPresenter_retryRequestIfNeeded___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "metricsPresenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewDidRetryFailedRequest");

}

uint64_t __43__ASCLockupPresenter_retryRequestIfNeeded___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
    v4 = 1;
  else
    v4 = a3 == 0;
  if (!v4)
  {
    +[ASCLockupPresenter log]();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1BCB7B000, v5, OS_LOG_TYPE_INFO, "%{public}@: Retrying failed request", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "performLockupFetch");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)performLockupFetch
{
  void *v2;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  ASCLockupPresenter *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[ASCLockupPresenter pendingRequestedLockup](self, "pendingRequestedLockup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[ASCLockupPresenter log]();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1BCB7B000, v5, OS_LOG_TYPE_INFO, "%{public}@: Canceling previous request", buf, 0xCu);
    }

    objc_msgSend(v4, "cancel");
    -[ASCLockupPresenter setPendingRequestedLockup:](self, "setPendingRequestedLockup:", 0);
  }
  -[ASCLockupPresenter request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[ASCLockupPresenter view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLoading:", 0);

    -[ASCLockupPresenter reloadDefaultContent](self, "reloadDefaultContent");
    goto LABEL_15;
  }
  -[ASCLockupPresenter requestWillFetchLockup:](self, "requestWillFetchLockup:", v6);
  -[ASCLockupPresenter group](self, "group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((ASCLockupContextIsContingentPricingContext(v2, v8) & 1) == 0)
    {
      -[ASCLockupPresenter group](self, "group");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lockupWithRequest:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      goto LABEL_12;
    }
  }
  -[ASCLockupPresenter context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lockupFetcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lockupWithRequest:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_11;
LABEL_12:

  -[ASCLockupPresenter setPendingRequestedLockup:](self, "setPendingRequestedLockup:", v10);
  +[ASCLockupPresenter log]();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v24 = self;
    _os_log_impl(&dword_1BCB7B000, v14, OS_LOG_TYPE_INFO, "%{public}@: Started new request", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v15 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __40__ASCLockupPresenter_performLockupFetch__block_invoke;
  v20[3] = &unk_1E7560CA8;
  objc_copyWeak(&v22, (id *)buf);
  v16 = v6;
  v21 = v16;
  objc_msgSend(v10, "addSuccessBlock:", v20);
  v17[0] = v15;
  v17[1] = 3221225472;
  v17[2] = __40__ASCLockupPresenter_performLockupFetch__block_invoke_2;
  v17[3] = &unk_1E7560CD0;
  objc_copyWeak(&v19, (id *)buf);
  v18 = v16;
  objc_msgSend(v10, "addErrorBlock:", v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

LABEL_15:
}

void __40__ASCLockupPresenter_performLockupFetch__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "request:didCompleteWithLockup:", *(_QWORD *)(a1 + 32), v4);

}

void __40__ASCLockupPresenter_performLockupFetch__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "request:didFailWithError:", *(_QWORD *)(a1 + 32), v4);

}

- (void)performIconFetch
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  -[ASCLockupPresenter lockup](self, "lockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "decoration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("none"));

    -[ASCLockupPresenter view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      +[ASCLockupPresenter iconPlaceholderDecoration]();
    else
      objc_msgSend(v4, "decoration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIconImage:withDecoration:", 0, v9);

    -[ASCLockupPresenter pendingViewRender](self, "pendingViewRender");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[ASCLockupPresenter pendingViewRender](self, "pendingViewRender");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASCViewRender resourceRequestDidBeginWithTag:](ASCViewRender, "resourceRequestDidBeginWithTag:", objc_msgSend(v11, "primaryTag"));

    }
    -[ASCLockupPresenter view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredIconSize");
    v14 = v13;
    v16 = v15;

    -[ASCLockupPresenter context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "artworkFetcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageForContentsOfArtwork:withSize:", v4, v14, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v20 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __38__ASCLockupPresenter_performIconFetch__block_invoke;
    v25[3] = &unk_1E7560CF8;
    objc_copyWeak(&v27, &location);
    v21 = v4;
    v26 = v21;
    objc_msgSend(v19, "addSuccessBlock:", v25);
    v22[0] = v20;
    v22[1] = 3221225472;
    v22[2] = __38__ASCLockupPresenter_performIconFetch__block_invoke_2;
    v22[3] = &unk_1E7560CD0;
    objc_copyWeak(&v24, &location);
    v23 = v21;
    objc_msgSend(v19, "addErrorBlock:", v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  else
  {
    -[ASCLockupPresenter view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIconImage:withDecoration:", 0, CFSTR("none"));

    -[ASCLockupPresenter endViewRender](self, "endViewRender");
  }

}

void __38__ASCLockupPresenter_performIconFetch__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "iconArtwork:didFetchImage:", *(_QWORD *)(a1 + 32), v4);

}

void __38__ASCLockupPresenter_performIconFetch__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "iconArtwork:didFailFetchWithError:", *(_QWORD *)(a1 + 32), v4);

}

- (void)performFollowUpWork:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x1E0CB3978];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)requestWillFetchLockup:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[ASCLockupPresenter beginViewRender](self, "beginViewRender", a3);
  -[ASCLockupPresenter lockup](self, "lockup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[ASCLockupPresenter view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ASCLocalizedString(CFSTR("LOADING"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v7);

    -[ASCLockupPresenter showPlaceholderContent](self, "showPlaceholderContent");
  }
  -[ASCLockupPresenter observer](self, "observer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lockupPresenterDidBeginRequest");

}

- (void)request:(id)a3 didCompleteWithLockup:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__ASCLockupPresenter_request_didCompleteWithLockup___block_invoke;
  v10[3] = &unk_1E7560578;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ASCLockupPresenter performFollowUpWork:](self, "performFollowUpWork:", v10);

}

void __52__ASCLockupPresenter_request_didCompleteWithLockup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(void **)(a1 + 40);
  if (v2)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
  {

    if (v3 == v4)
    {
LABEL_10:
      +[ASCLockupPresenter log]();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v14 = 138543362;
        v15 = v10;
        _os_log_impl(&dword_1BCB7B000, v9, OS_LOG_TYPE_INFO, "%{public}@: Completed request", (uint8_t *)&v14, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLoading:", 0);

      objc_msgSend(*(id *)(a1 + 32), "pendingViewRender");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "pendingViewRender");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[ASCViewRender rootViewModelPresentWithTag:](ASCViewRender, "rootViewModelPresentWithTag:", objc_msgSend(v13, "primaryTag"));

      }
      objc_msgSend(*(id *)(a1 + 32), "setLockup:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "setPendingRequestedLockup:", 0);
      objc_msgSend(*(id *)(a1 + 32), "observer");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject lockupPresenterDidFinishRequest](v6, "lockupPresenterDidFinishRequest");
      goto LABEL_15;
    }
  }
  else
  {
    v8 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

    if ((v8 & 1) != 0)
      goto LABEL_10;
  }
  +[ASCLockupPresenter log]();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v14 = 138543362;
    v15 = v7;
    _os_log_impl(&dword_1BCB7B000, v6, OS_LOG_TYPE_INFO, "%{public}@: Ignoring loaded lockup for mismatched request", (uint8_t *)&v14, 0xCu);
  }
LABEL_15:

}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v9 = objc_msgSend(v7, "code");

    if (v9 == 3072)
      goto LABEL_6;
  }
  else
  {

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__ASCLockupPresenter_request_didFailWithError___block_invoke;
  v10[3] = &unk_1E7560578;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  -[ASCLockupPresenter performFollowUpWork:](self, "performFollowUpWork:", v10);

LABEL_6:
}

void __47__ASCLockupPresenter_request_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
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
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = (void *)v2[1];
  if (v3)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {

    if (v4 == v5)
    {
LABEL_10:
      +[ASCLockupPresenter log]();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __47__ASCLockupPresenter_request_didFailWithError___block_invoke_cold_1(v2, a1, v10);

      objc_msgSend(*(id *)(a1 + 32), "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLoading:", 0);

      objc_msgSend(*(id *)(a1 + 32), "offerPresenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOffer:", 0);

      objc_msgSend(*(id *)(a1 + 32), "setLockup:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setPendingViewRender:", 0);
      +[ASCImageRenderer systemImageNamed:compatibleWithTraitCollection:](ASCImageRenderer, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("arrow.counterclockwise.circle"), 0);
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASCLockupPresenter iconPlaceholderDecoration]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIconImage:withDecoration:", v7, v14);

      objc_msgSend(*(id *)(a1 + 32), "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHeading:", 0);

      objc_msgSend(*(id *)(a1 + 32), "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", 0);

      objc_msgSend(*(id *)(a1 + 32), "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ASCLocalizedPlatformString(CFSTR("VIEW_ERROR"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSubtitle:", v18);

      objc_msgSend(*(id *)(a1 + 32), "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setPrefersRightToLeftLayout:", objc_msgSend(*(id *)(a1 + 32), "prefersRightToLeftViewLayout"));

      objc_msgSend(*(id *)(a1 + 32), "observer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lockupPresenterDidFailRequestWithError:", *(_QWORD *)(a1 + 48));

      objc_msgSend(*(id *)(a1 + 32), "metricsPresenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "viewDidFailRequest:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

      goto LABEL_13;
    }
  }
  else
  {
    v9 = objc_msgSend(v3, "isEqual:", v2[1]);

    if ((v9 & 1) != 0)
      goto LABEL_10;
  }
  +[ASCLockupPresenter log]();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *v2;
    v22 = 138543362;
    v23 = v8;
    _os_log_impl(&dword_1BCB7B000, v7, OS_LOG_TYPE_INFO, "%{public}@: Ignoring load error for mismatched request", (uint8_t *)&v22, 0xCu);
  }
LABEL_13:

}

- (void)iconArtwork:(id)a3 didFetchImage:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__ASCLockupPresenter_iconArtwork_didFetchImage___block_invoke;
  v10[3] = &unk_1E7560578;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ASCLockupPresenter performFollowUpWork:](self, "performFollowUpWork:", v10);

}

void __48__ASCLockupPresenter_iconArtwork_didFetchImage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lockup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(void **)(a1 + 40);
  if (v3)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    v7 = v3 == v5;
  else
    v7 = objc_msgSend(v3, "isEqual:");

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "decoration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIconImage:withDecoration:", v9, v10);

    objc_msgSend(*(id *)(a1 + 32), "pendingViewRender");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingViewRender");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASCViewRender resourceRequestDidEndWithTag:](ASCViewRender, "resourceRequestDidEndWithTag:", objc_msgSend(v12, "primaryTag"));

    }
    objc_msgSend(*(id *)(a1 + 32), "endViewRender");
  }
  else
  {
    +[ASCLockupPresenter log]();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1BCB7B000, v13, OS_LOG_TYPE_INFO, "%{public}@: Ignoring icon for mismatched lockup", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (void)iconArtwork:(id)a3 didFailFetchWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ASCLockupPresenter_iconArtwork_didFailFetchWithError___block_invoke;
  v7[3] = &unk_1E75605A0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[ASCLockupPresenter performFollowUpWork:](self, "performFollowUpWork:", v7);

}

void __56__ASCLockupPresenter_iconArtwork_didFailFetchWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lockup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(void **)(a1 + 40);
  if (v3)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    v7 = v3 == v5;
  else
    v7 = objc_msgSend(v3, "isEqual:");

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "endViewRender");
  }
  else
  {
    +[ASCLockupPresenter log]();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1BCB7B000, v8, OS_LOG_TYPE_INFO, "%{public}@: Ignoring icon for mismatched lockup", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)beginViewRender
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  ASCSignpostSpan *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[ASCLockupPresenter request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASCLockupPresenter context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lockupFetcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupPresenter request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadedLockupWithRequest:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[ASCLockupPresenter group](self, "group");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "prefetchSpansIfLoaded");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        return;
    }
    else
    {

    }
    v11 = objc_alloc_init(ASCSignpostSpan);
    -[ASCLockupPresenter setPendingViewRender:](self, "setPendingViewRender:", v11);

    -[ASCLockupPresenter pendingViewRender](self, "pendingViewRender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupPresenter request](self, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "id");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSupplementaryTag:", ASCSignpostTagFromID(v14));

    -[ASCLockupPresenter pendingViewRender](self, "pendingViewRender");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "beginEmitting");

    -[ASCLockupPresenter pendingViewRender](self, "pendingViewRender");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    +[ASCViewRender pageRequestedWithTag:](ASCViewRender, "pageRequestedWithTag:", objc_msgSend(v16, "primaryTag"));

  }
}

- (void)endViewRender
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  ASCSignpostPredicate *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[ASCLockupPresenter pendingViewRender](self, "pendingViewRender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASCLockupPresenter pendingViewRender](self, "pendingViewRender");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCViewRender pageUserReadyWithTag:](ASCViewRender, "pageUserReadyWithTag:", objc_msgSend(v4, "primaryTag"));

    -[ASCLockupPresenter pendingViewRender](self, "pendingViewRender");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endEmitting");

    -[ASCLockupPresenter lockup](self, "lockup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "signpostTags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v27;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
            -[ASCLockupPresenter pendingViewRender](self, "pendingViewRender", (_QWORD)v26);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addSupplementaryTag:", objc_msgSend(v13, "unsignedLongLongValue"));

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v10);
      }

    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[ASCLockupPresenter pendingViewRender](self, "pendingViewRender");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

    -[ASCLockupPresenter group](self, "group");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "prefetchSpansIfLoaded");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[ASCLockupPresenter group](self, "group");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "prefetchSpansIfLoaded");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v20);

    }
    -[ASCLockupPresenter viewRenderSpanProvider](self, "viewRenderSpanProvider", (_QWORD)v26);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
    {
      (*(void (**)(uint64_t))(v21 + 16))(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v23);

    }
    v24 = -[ASCSignpostPredicate initWithSpans:]([ASCSignpostPredicate alloc], "initWithSpans:", v15);
    -[ASCLockupPresenter metricsPresenter](self, "metricsPresenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "viewDidEndRenderWithPredicate:", v24);

    -[ASCLockupPresenter setPendingViewRender:](self, "setPendingViewRender:", 0);
  }
}

- (void)daemonDidRebootstrap:(id)a3
{
  void *v4;

  -[ASCLockupPresenter request](self, "request", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASCLockupPresenter setLockup:](self, "setLockup:", 0);
    -[ASCLockupPresenter performLockupFetch](self, "performLockupFetch");
  }
}

- (void)retryGroup:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  -[ASCLockupPresenter request](self, "request", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = (id)v4;
    -[ASCLockupPresenter pendingRequestedLockup](self, "pendingRequestedLockup");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[ASCLockupPresenter pendingRequestedLockup](self, "pendingRequestedLockup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "asc_isCanceledOrPending");

      if ((v8 & 1) == 0)
      {
        -[ASCLockupPresenter pendingRequestedLockup](self, "pendingRequestedLockup");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __33__ASCLockupPresenter_retryGroup___block_invoke;
        v11[3] = &unk_1E7560D20;
        v11[4] = self;
        objc_msgSend(v9, "resultWithCompletion:", v11);

      }
    }
    else
    {

    }
  }
}

uint64_t __33__ASCLockupPresenter_retryGroup___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a2 && a3)
  {
    v3 = result;
    +[ASCLockupPresenter log]();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(v3 + 32);
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "%{public}@: Retrying failed request as part of group", (uint8_t *)&v6, 0xCu);
    }

    return objc_msgSend(*(id *)(v3 + 32), "performLockupFetch");
  }
  return result;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupPresenter group](self, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("group"));

  -[ASCLockupPresenter lockup](self, "lockup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("lockup.id"));

  -[ASCLockupPresenter request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "id");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("request.id"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ASCLockupPresenterObserver)observer
{
  return (ASCLockupPresenterObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (ASCLockupViewGroup)group
{
  return self->_group;
}

- (ASCLockupRequest)request
{
  return self->_request;
}

- (id)viewRenderSpanProvider
{
  return self->_viewRenderSpanProvider;
}

- (void)setViewRenderSpanProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ASCLockupPresenterView)view
{
  return (ASCLockupPresenterView *)objc_loadWeakRetained((id *)&self->_view);
}

- (ASCPresenterContext)context
{
  return self->_context;
}

- (ASCOfferPresenter)offerPresenter
{
  return self->_offerPresenter;
}

- (ASCAppearMetricsPresenter)metricsPresenter
{
  return self->_metricsPresenter;
}

- (ASCCustomLockupContentProvider)customContentProvider
{
  return self->_customContentProvider;
}

- (AMSMutablePromise)pendingRequestedLockup
{
  return self->_pendingRequestedLockup;
}

- (void)setPendingRequestedLockup:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequestedLockup, a3);
}

- (ASCSignpostSpan)pendingViewRender
{
  return self->_pendingViewRender;
}

- (void)setPendingViewRender:(id)a3
{
  objc_storeStrong((id *)&self->_pendingViewRender, a3);
}

- (BOOL)showsPlaceholderContent
{
  return self->_showsPlaceholderContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingViewRender, 0);
  objc_storeStrong((id *)&self->_pendingRequestedLockup, 0);
  objc_storeStrong((id *)&self->_customContentProvider, 0);
  objc_storeStrong((id *)&self->_metricsPresenter, 0);
  objc_storeStrong((id *)&self->_offerPresenter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong(&self->_viewRenderSpanProvider, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_lockup, 0);
  objc_destroyWeak((id *)&self->_observer);
}

- (void)setGroup:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
}

void __47__ASCLockupPresenter_request_didFailWithError___block_invoke_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  AMSLogableError();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1BCB7B000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Request did fail, reason: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
