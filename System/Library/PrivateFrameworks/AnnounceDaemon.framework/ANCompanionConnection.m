@implementation ANCompanionConnection

- (ANCompanionConnection)init
{
  ANCompanionConnection *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *rapportQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ANCompanionConnection;
  v2 = -[ANCompanionConnection init](&v7, sel_init);
  if (v2 && (objc_msgSend(MEMORY[0x1E0CF7E38], "isPad") & 1) == 0)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.announce.coordinationServiceQueue", v3);
    rapportQueue = v2->_rapportQueue;
    v2->_rapportQueue = (OS_dispatch_queue *)v4;

    -[ANCompanionConnection _setupLink](v2, "_setupLink");
  }
  return v2;
}

- (void)broadcastAnnouncementPlayed:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CF7E38], "isPad") & 1) == 0)
  {
    v5 = *MEMORY[0x1E0D83968];
    v9[0] = CFSTR("announcementID");
    v9[1] = CFSTR("senderType");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ANCompanionConnection companionLinkClient](self, "companionLinkClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendEventID:event:destinationID:options:completion:", CFSTR("com.apple.announce.AnnouncementPlayed"), v7, v5, 0, &__block_literal_global_31);

  }
}

void __53__ANCompanionConnection_broadcastAnnouncementPlayed___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ANLogHandleCompanionConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412546;
      v6 = &stru_1E93913D0;
      v7 = 2112;
      v8 = v2;
      _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_ERROR, "%@Broadcast Announcement Played Event Failed: %@", (uint8_t *)&v5, 0x16u);
    }

    +[ANAnalytics shared](ANAnalytics, "shared");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject error:](v4, "error:", 5023);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "%@Announcement Played Event Broadcasted Successfully", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_setupLink
{
  RPCompanionLinkClient *v3;
  RPCompanionLinkClient *companionLinkClient;
  void *v5;
  uint64_t v6;
  RPCompanionLinkClient *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = (RPCompanionLinkClient *)objc_opt_new();
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = v3;

  -[ANCompanionConnection rapportQueue](self, "rapportQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPCompanionLinkClient setDispatchQueue:](self->_companionLinkClient, "setDispatchQueue:", v5);

  -[RPCompanionLinkClient setControlFlags:](self->_companionLinkClient, "setControlFlags:", 32);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__ANCompanionConnection__setupLink__block_invoke;
  v10[3] = &unk_1E938F518;
  objc_copyWeak(&v11, &location);
  -[RPCompanionLinkClient setInvalidationHandler:](self->_companionLinkClient, "setInvalidationHandler:", v10);
  v7 = self->_companionLinkClient;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __35__ANCompanionConnection__setupLink__block_invoke_2;
  v8[3] = &unk_1E9390D18;
  objc_copyWeak(&v9, &location);
  -[RPCompanionLinkClient activateWithCompletion:](v7, "activateWithCompletion:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __35__ANCompanionConnection__setupLink__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tearDownLink");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_setupLink");

}

void __35__ANCompanionConnection__setupLink__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *WeakRetained;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ANLogHandleCompanionConnection();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412546;
      v8 = &stru_1E93913D0;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_ERROR, "%@Error activating link '%@'", (uint8_t *)&v7, 0x16u);
    }

    +[ANAnalytics shared](ANAnalytics, "shared");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "error:", 5024);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%@Link activated succcessfully", (uint8_t *)&v7, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_registerForEvents");
  }

}

- (void)_tearDownLink
{
  RPCompanionLinkClient *companionLinkClient;

  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

}

- (void)_registerForEvents
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ANLogHandleCompanionConnection();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%@Registering for Event IDs", buf, 0xCu);
  }

  -[ANCompanionConnection companionLinkClient](self, "companionLinkClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterEventID:", CFSTR("com.apple.announce.AnnouncementPlayed"));

  objc_initWeak((id *)buf, self);
  -[ANCompanionConnection companionLinkClient](self, "companionLinkClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__ANCompanionConnection__registerForEvents__block_invoke;
  v6[3] = &unk_1E9390D40;
  objc_copyWeak(&v7, (id *)buf);
  objc_msgSend(v5, "registerEventID:options:handler:", CFSTR("com.apple.announce.AnnouncementPlayed"), 0, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __43__ANCompanionConnection__registerForEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *WeakRetained;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D839C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("senderType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  objc_msgSend(v5, "valueForKey:", CFSTR("announcementID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ANLogHandleCompanionConnection();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412802;
    v16 = &stru_1E93913D0;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "%@Received Event from %@: %@", (uint8_t *)&v15, 0x20u);
  }

  if (v8 != 1)
  {
    ANLogHandleCompanionConnection();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = &stru_1E93913D0;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_ERROR, "%@Unsupported Sender Type (%@). Ignoring Event.", (uint8_t *)&v15, 0x16u);

    }
    +[ANAnalytics shared](ANAnalytics, "shared");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "error:", 5025);
    goto LABEL_9;
  }
  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "companionDidPlayAnnouncement:", v9);

LABEL_9:
  }

}

- (ANCompanionConnectionDelegate)delegate
{
  return (ANCompanionConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (OS_dispatch_queue)rapportQueue
{
  return self->_rapportQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapportQueue, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
