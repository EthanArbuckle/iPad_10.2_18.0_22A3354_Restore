@implementation ANAnnounceServiceListener

- (ANAnnounceServiceListener)init
{
  ANAnnounceServiceListener *v2;
  id v3;
  uint64_t v4;
  NSXPCListener *listener;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)ANAnnounceServiceListener;
  v2 = -[ANAnnounceServiceListener init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF7DE8], "isAnnounceEnabled");
    v3 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v4 = objc_msgSend(v3, "initWithMachServiceName:", *MEMORY[0x1E0CF7CF8]);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    ANLogHandleAnnounceServiceListener();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "%@Announce Service Listener Up!", buf, 0xCu);
    }

  }
  return v2;
}

- (void)cleanForExit
{
  id v2;

  -[ANAnnounceServiceListener listener](self, "listener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  BOOL v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ANLogHandleAnnounceServiceListener();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v33 = &stru_1E93913D0;
    v34 = 2112;
    v35 = v9;
    v36 = 2112;
    v37 = v10;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@New Connection Request From (PID = %@) For Service: (%@)", buf, 0x20u);

  }
  if ((objc_msgSend(MEMORY[0x1E0CF7DE8], "isAnnounceEnabled") & 1) == 0)
  {
    ANLogHandleAnnounceServiceListener();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = &stru_1E93913D0;
      v22 = "%@Rejecting connection. Announce not enabled.";
      v23 = v11;
      v24 = 12;
LABEL_12:
      _os_log_impl(&dword_1D23A0000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
    }
LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  if ((objc_msgSend(v7, "hasAnnounceEntitlement") & 1) == 0)
  {
    ANLogHandleAnnounceServiceListener();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)*MEMORY[0x1E0CF7EC0];
      *(_DWORD *)buf = 138412546;
      v33 = &stru_1E93913D0;
      v34 = 2112;
      v35 = v25;
      v22 = "%@Missing Announce Entitlement: %@";
      v23 = v11;
      v24 = 22;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3B50], "an_announceServiceInterface");
  v11 = objc_claimAutoreleasedReturnValue();
  -[NSObject setClass:forSelector:argumentIndex:ofReply:](v11, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_localParticipant_, 0, 1);
  -[NSObject setClass:forSelector:argumentIndex:ofReply:](v11, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_homeNamesForContext_reply_, 0, 0);
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v11, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_homeNamesForContext_reply_, 0, 1);
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v11, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getReceivedAnnouncementsForEndpointID_completionHandler_, 0, 1);
  -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v11, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getUnplayedAnnouncementsForEndpointID_completionHandler_, 0, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v11, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_announcementForID_endpointID_reply_, 0, 1);
  -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v11, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_mockAnnouncement_forHomeWithName_playbackDeadline_completion_, 0, 1);
  -[NSObject setClasses:forSelector:argumentIndex:ofReply:](v11, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_contextFromAnnouncement_reply_, 0, 0);
  -[NSObject setClass:forSelector:argumentIndex:ofReply:](v11, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_contextFromAnnouncement_reply_, 0, 1);
  -[NSObject setClass:forSelector:argumentIndex:ofReply:](v11, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_sendRequest_completion_, 0, 0);
  -[NSObject setClass:forSelector:argumentIndex:ofReply:](v11, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_sendRequest_completion_, 0, 1);
  -[NSObject setClass:forSelector:argumentIndex:ofReply:](v11, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_sendRequestLegacy_completion_, 0, 0);
  -[NSObject setClass:forSelector:argumentIndex:ofReply:](v11, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_sendRequestLegacy_completion_, 0, 1);
  objc_msgSend(v7, "setExportedInterface:", v11);
  objc_msgSend(v7, "setExportedObject:", self);
  objc_initWeak(&location, v7);
  v19 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __64__ANAnnounceServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  v29[3] = &unk_1E938F518;
  objc_copyWeak(&v30, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v29);
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __64__ANAnnounceServiceListener_listener_shouldAcceptNewConnection___block_invoke_32;
  v27[3] = &unk_1E938F518;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v7, "setInvalidationHandler:", v27);
  objc_msgSend(v7, "resume");
  ANLogHandleAnnounceServiceListener();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = &stru_1E93913D0;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1D23A0000, v20, OS_LOG_TYPE_DEFAULT, "%@Connection Accepted: (%@)", buf, 0x16u);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  v21 = 1;
LABEL_14:

  return v21;
}

void __64__ANAnnounceServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ANLogHandleAnnounceServiceListener();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138412546;
    v5 = &stru_1E93913D0;
    v6 = 2112;
    v7 = WeakRetained;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection Interrupted: (%@)", (uint8_t *)&v4, 0x16u);

  }
}

void __64__ANAnnounceServiceListener_listener_shouldAcceptNewConnection___block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ANLogHandleAnnounceServiceListener();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138412546;
    v5 = &stru_1E93913D0;
    v6 = 2112;
    v7 = WeakRetained;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection Invalidated: (%@)", (uint8_t *)&v4, 0x16u);

  }
}

- (void)localParticipant:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v4, v5);

}

- (void)sendRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (v9 < 2)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__ANAnnounceServiceListener_sendRequest_completion___block_invoke;
    v14[3] = &unk_1E938F540;
    v14[4] = self;
    v15 = v6;
    v16 = v7;
    -[ANAnnounceServiceListener _sendRequest:completion:](self, "_sendRequest:completion:", v15, v14);

    v10 = v15;
LABEL_6:

    goto LABEL_7;
  }
  if (v9 == 2)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__ANAnnounceServiceListener_sendRequest_completion___block_invoke_2;
    v11[3] = &unk_1E938F540;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    -[ANAnnounceServiceListener _sendReplyRequest:completion:](self, "_sendReplyRequest:completion:", v12, v11);

    v10 = v12;
    goto LABEL_6;
  }
  -[ANAnnounceServiceListener _handleError:request:requestSentCompletionHandler:](self, "_handleError:request:requestSentCompletionHandler:", 1045, v6, v7);
LABEL_7:

}

uint64_t __52__ANAnnounceServiceListener_sendRequest_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_translateSentHandlerResponseAnnouncement:request:error:toRequestSentHandler:", a2, *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48));
}

uint64_t __52__ANAnnounceServiceListener_sendRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_translateSentHandlerResponseAnnouncement:request:error:toRequestSentHandler:", a2, *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48));
}

- (void)sendRequestLegacy:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  if (v8 >= 2)
  {
    if (v8 == 2)
      -[ANAnnounceServiceListener _sendReplyRequest:completion:](self, "_sendReplyRequest:completion:", v9, v6);
    else
      -[ANAnnounceServiceListener _handleError:request:sentCompletionHandler:](self, "_handleError:request:sentCompletionHandler:", 1045, v9, v6);
  }
  else
  {
    -[ANAnnounceServiceListener _sendRequest:completion:](self, "_sendRequest:completion:", v9, v6);
  }

}

- (void)mockAnnouncement:(id)a3 forHomeWithName:(id)a4 playbackDeadline:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v9 = a5;
  v10 = a6;
  v11 = a4;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeWithName:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CF7E00], "contentWithAudioFileURL:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CF7E18];
    objc_msgSend(v13, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "destinationWithHomeIdentifier:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CF7E20], "requestWithContent:destination:", v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setClientID:", CFSTR("Mock"));
    +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mockAnnouncement:playbackDeadline:sentHandler:", v18, v9, v10);

    v10 = (id)v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1002, *MEMORY[0x1E0CF7C70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);
  }

}

- (void)receivedAnnouncementIdentifiersForEndpointID:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allAnnouncementsSortedByReceiptForEndpointID:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v8);

}

- (void)announcementForID:(id)a3 endpointID:(id)a4 reply:(id)a5
{
  void (**v7)(id, id);
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = (void (**)(id, id))a5;
  v8 = a4;
  v9 = a3;
  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "announcementForID:endpointID:", v9, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v11);
}

- (void)getReceivedAnnouncementsForEndpointID:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetAllTimersForEndpointID:", v6);

  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allAnnouncementsSortedByReceiptForEndpointID:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF7DF8], "contextsFrom:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v9);

}

- (void)getUnplayedAnnouncementsForEndpointID:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetAllTimersForEndpointID:", v5);

  v8 = (void *)objc_opt_new();
  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allAnnouncementsSortedByReceiptForEndpointID:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unplayedAnnouncements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)MEMORY[0x1E0CF7E08];
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "remoteSessionDictionary", (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "contextFromDictionary:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v19);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  v6[2](v6, v8);
}

- (void)lastPlayedAnnouncementInfo:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, MEMORY[0x1E0C9AA70]);
}

- (void)getScanningDeviceCandidates:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scanningDeviceCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v4, v5);

}

- (void)contextFromAnnouncement:(id)a3 reply:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CF7E08];
  v7 = a4;
  objc_msgSend(a3, "remoteSessionDictionary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextFromDictionary:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v7, v8);

}

- (void)homeNamesForContext:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeNamesForContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void *))a4 + 2))(v6, v8);
}

- (void)isLocalDeviceInRoom:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "isLocalDeviceInRoom:", v7);

  (*((void (**)(id, uint64_t))a4 + 2))(v6, v8);
}

- (void)isAnnounceEnabledForAnyAccessoryInHome:(id)a3 reply:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(id, uint64_t);

  v9 = (void (**)(id, uint64_t))a4;
  v5 = a3;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeWithName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "isAnnounceEnabledForAnyAccessory");
  else
    v8 = 0;
  v9[2](v9, v8);

}

- (void)isAnnounceEnabledForAnyAccessoryOrUserInHome:(id)a3 reply:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(id, uint64_t);

  v9 = (void (**)(id, uint64_t))a4;
  v5 = a3;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeWithName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "isAnnounceEnabledForAnyAccessoryOrUser");
  else
    v8 = 0;
  v9[2](v9, v8);

}

- (void)isEndpointWithUUID:(id)a3 inRoomWithName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[ANHomeManager shared](ANHomeManager, "shared");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v12, "isEndpointWithUUID:inRoomWithName:", v10, v9);

  (*((void (**)(id, uint64_t))a5 + 2))(v8, v11);
}

- (void)prewarm:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ANRapportConnection sharedConnection](ANRapportConnection, "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateLinkWithOptions:completion:", 2, v3);

}

- (void)_sendRequest:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0CB3B38];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClientID:", v9);

  +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendRequest:sentHandler:", v7, v6);

}

- (void)_sendReplyRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  objc_msgSend(v6, "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "announcementIdentifier");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (v22[5])
    goto LABEL_3;
  objc_msgSend(v6, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endpointIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58__ANAnnounceServiceListener__sendReplyRequest_completion___block_invoke;
  v20[3] = &unk_1E938F568;
  v20[4] = &v21;
  -[ANAnnounceServiceListener receivedAnnouncementIdentifiersForEndpointID:reply:](self, "receivedAnnouncementIdentifiersForEndpointID:reply:", v10, v20);

  if (v22[5])
  {
LABEL_3:
    +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22[5];
    objc_msgSend(v6, "content");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endpointIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "announcementForID:endpointID:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "clientID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setClientID:", v17);

      objc_msgSend(v6, "destination");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAnnouncement:", v15);

      +[ANAnnouncementCoordinator sharedCoordinator](ANAnnouncementCoordinator, "sharedCoordinator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sendRequest:sentHandler:", v6, v7);

    }
    else
    {
      -[ANAnnounceServiceListener _handleError:request:sentCompletionHandler:](self, "_handleError:request:sentCompletionHandler:", 1008, v6, v7);
    }

  }
  else
  {
    -[ANAnnounceServiceListener _handleError:request:sentCompletionHandler:](self, "_handleError:request:sentCompletionHandler:", 1008, v6, v7);
  }
  _Block_object_dispose(&v21, 8);

}

void __58__ANAnnounceServiceListener__sendReplyRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "lastObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_handleError:(int64_t)a3 request:(id)a4 sentCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CF7C70];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v8, "an_errorWithCode:component:", a3, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a5 + 2))(v10, 0, v12);

  +[ANAnalytics shared](ANAnalytics, "shared");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "content");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "endpointIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "error:context:", a3, v15);

}

- (void)_handleError:(int64_t)a3 request:(id)a4 requestSentCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CF7C70];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v8, "an_errorWithCode:component:", a3, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a5 + 2))(v10, 0, v12);

  +[ANAnalytics shared](ANAnalytics, "shared");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "content");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "endpointIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "error:context:", a3, v15);

}

- (void)_translateSentHandlerResponseAnnouncement:(id)a3 request:(id)a4 error:(id)a5 toRequestSentHandler:(id)a6
{
  void (**v9)(id, void *, id);
  void *v10;
  id v11;
  id v12;
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
  void *v25;
  void *v26;
  id v27;

  v27 = a5;
  v9 = (void (**)(id, void *, id))a6;
  if (a3)
  {
    v10 = (void *)MEMORY[0x1E0CF7E08];
    v11 = a4;
    v12 = a3;
    objc_msgSend(v12, "remoteSessionDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contextFromDictionary:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CF7E18];
    objc_msgSend(v14, "homeName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "zones");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rooms");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "destinationWithHomeName:zoneNames:roomNames:", v16, v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "destination");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "announcementIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAnnouncementIdentifier:", v23);

    v24 = (void *)MEMORY[0x1E0CF7E28];
    objc_msgSend(v12, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "resultWithAnnouncementID:destination:", v25, v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }
  v9[2](v9, v26, v27);

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
