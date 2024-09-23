@implementation IMDCollaborationNoticeDispatcher

+ (Class)_SWCollaborationNoticeTransmissionMessageClass
{
  if (qword_1EFC63D10 != -1)
    dispatch_once(&qword_1EFC63D10, &unk_1E922AF40);
  return (Class)(id)qword_1EFC63D08;
}

+ (Class)_SWCollaborationClearNoticeTransmissionMessageClass
{
  if (qword_1EFC63D20 != -1)
    dispatch_once(&qword_1EFC63D20, &unk_1E922AF60);
  return (Class)(id)qword_1EFC63D18;
}

- (IMDCollaborationNoticeDispatcher)init
{
  IMDCollaborationNoticeDispatcher *v2;
  uint64_t v3;
  IDSService *gelatoService;
  IMDCollaborationNoticeRateLimiter *v5;
  IMDCollaborationNoticeRateLimiter *rateLimiter;
  IMDCollaborationClearNoticeRateLimiter *v7;
  IMDCollaborationClearNoticeRateLimiter *clearRateLimiter;
  uint64_t v9;
  NSObject *v10;
  IDSService *v11;
  objc_super v13;
  uint8_t buf[4];
  IDSService *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)IMDCollaborationNoticeDispatcher;
  v2 = -[IMDCollaborationNoticeDispatcher init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.gelato"));
    gelatoService = v2->_gelatoService;
    v2->_gelatoService = (IDSService *)v3;

    -[IDSService setProtobufAction:forIncomingRequestsOfType:](v2->_gelatoService, "setProtobufAction:forIncomingRequestsOfType:", sel_handleIncomingNoticeProtobuf_service_account_fromID_context_, 1);
    -[IDSService addDelegate:queue:](v2->_gelatoService, "addDelegate:queue:", v2, MEMORY[0x1E0C80D38]);
    v5 = objc_alloc_init(IMDCollaborationNoticeRateLimiter);
    rateLimiter = v2->_rateLimiter;
    v2->_rateLimiter = v5;

    v7 = objc_alloc_init(IMDCollaborationClearNoticeRateLimiter);
    clearRateLimiter = v2->_clearRateLimiter;
    v2->_clearRateLimiter = v7;

    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = v2->_gelatoService;
        *(_DWORD *)buf = 138412290;
        v15 = v11;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Loaded notice dispatch service: %@", buf, 0xCu);
      }

    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[IDSService removeDelegate:](self->_gelatoService, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)IMDCollaborationNoticeDispatcher;
  -[IMDCollaborationNoticeDispatcher dealloc](&v3, sel_dealloc);
}

- (void)sendNotice:(id)a3 toHandles:(id)a4 fromHandle:(id)a5
{
  id v8;
  id v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  IDSService *gelatoService;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  id v56;
  id v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[IMDCollaborationNoticeDispatcher _handlesMinusSenderServiceAccountID:](self, "_handlesMinusSenderServiceAccountID:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = +[IMDCollaborationNoticeDispatcher noticeFanoutThreshold](IMDCollaborationNoticeDispatcher, "noticeFanoutThreshold");
    if (objc_msgSend(v10, "count") <= (unint64_t)v11)
    {
      -[IMDCollaborationNoticeDispatcher rateLimiter](self, "rateLimiter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "shouldSendNotice:", v8);

      if ((v22 & 1) != 0)
      {
        v24 = objc_alloc_init(+[IMDCollaborationNoticeDispatcher _SWCollaborationNoticeTransmissionMessageClass](IMDCollaborationNoticeDispatcher, "_SWCollaborationNoticeTransmissionMessageClass"));
        if (v24)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v24, "setVersion:", 1);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v8, "guidString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setGuidString:", v25);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v8, "eventData");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setHighlightChangeEvent:", v26);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v24, "setHighlightChangeEventType:", objc_msgSend(v8, "eventType"));
          v27 = objc_opt_respondsToSelector();
          if ((v27 & 1) != 0)
          {
            objc_msgSend(v8, "date");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "timeIntervalSince1970");
            objc_msgSend(v24, "setDateAsTimeIntervalSince1970:");

          }
          if (IMOSLoggingEnabled(v27))
          {
            OSLogHandleForIMFoundationCategory();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              v59 = (const char *)&unk_1E9271128;
              v60 = 2112;
              v61 = v8;
              v62 = 2112;
              v63 = v10;
              v64 = 2112;
              v65 = v24;
              _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Sending notice (command: %@) %@ to %@, message: %@", buf, 0x2Au);
            }

          }
          v30 = objc_alloc(MEMORY[0x1E0D34E08]);
          objc_msgSend(v24, "data");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v30, "initWithProtobufData:type:isResponse:", v31, 1, 0);

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v9)
            objc_msgSend(v33, "setObject:forKey:", v9, *MEMORY[0x1E0D34178]);
          gelatoService = self->_gelatoService;
          v36 = (void *)objc_msgSend(v34, "copy");
          v56 = 0;
          v57 = 0;
          -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](gelatoService, "sendProtobuf:toDestinations:priority:options:identifier:error:", v32, v10, 300, v36, &v57, &v56);
          v37 = v57;
          v38 = v56;

          if (v38)
          {
            IMLogHandleForCategory();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              sub_1D16682D4((uint64_t)v38, v40, v41, v42, v43, v44, v45, v46);
          }
          else
          {
            if (IMOSLoggingEnabled(v39))
            {
              OSLogHandleForIMFoundationCategory();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v59 = "-[IMDCollaborationNoticeDispatcher sendNotice:toHandles:fromHandle:]";
                v60 = 2112;
                v61 = v37;
                v62 = 2112;
                v63 = v10;
                _os_log_impl(&dword_1D1413000, v55, OS_LOG_TYPE_INFO, "%s Successfully sent Collaboration Notice (guid: %@) to handles: %@", buf, 0x20u);
              }

            }
            -[IMDCollaborationNoticeDispatcher rateLimiter](self, "rateLimiter");
            v40 = objc_claimAutoreleasedReturnValue();
            -[NSObject didSendNotice:](v40, "didSendNotice:", v8);
          }

        }
        else
        {
          IMLogHandleForCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            sub_1D16682A0(v32, v48, v49, v50, v51, v52, v53, v54);
        }

      }
      else if (IMOSLoggingEnabled(v23))
      {
        OSLogHandleForIMFoundationCategory();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v59 = "-[IMDCollaborationNoticeDispatcher sendNotice:toHandles:fromHandle:]";
          v60 = 2112;
          v61 = v8;
          _os_log_impl(&dword_1D1413000, v47, OS_LOG_TYPE_INFO, "%s: Bailing due to rate limiting for notice: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1D16681F0(v10, v11);

    }
  }
  else
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1D1668180(v13, v14, v15, v16, v17, v18, v19, v20);

  }
}

- (void)sendClearNotice:(id)a3 toHandles:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  IMDCollaborationNoticeDispatcher *v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMDCollaborationNoticeDispatcher _senderServiceAccountIDFrom:](self, "_senderServiceAccountIDFrom:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v9 = +[IMDCollaborationNoticeDispatcher noticeFanoutThreshold](IMDCollaborationNoticeDispatcher, "noticeFanoutThreshold");
    if (objc_msgSend(v7, "count") <= (unint64_t)v9)
    {
      -[IMDCollaborationNoticeDispatcher clearRateLimiter](self, "clearRateLimiter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "shouldSendWithNotice:", v6);

      if ((v20 & 1) != 0)
      {
        v22 = objc_alloc_init(+[IMDCollaborationNoticeDispatcher _SWCollaborationClearNoticeTransmissionMessageClass](IMDCollaborationNoticeDispatcher, "_SWCollaborationClearNoticeTransmissionMessageClass"));
        if (v22)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v22, "setVersion:", 2);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v6, "guidString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setGuidString:", v23);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v6, "collaborationId");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setCollaborationId:", v24);

          }
          v25 = objc_opt_respondsToSelector();
          if ((v25 & 1) != 0)
          {
            objc_msgSend(v6, "date");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "timeIntervalSince1970");
            objc_msgSend(v22, "setDateAsTimeIntervalSince1970:");

          }
          if (IMOSLoggingEnabled(v25))
          {
            OSLogHandleForIMFoundationCategory();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              v48 = (const char *)&unk_1E9271140;
              v49 = 2112;
              v50 = v6;
              v51 = 2112;
              v52 = v7;
              v53 = 2112;
              v54 = v22;
              _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Sending notice (command: %@) %@ to %@, message: %@", buf, 0x2Au);
            }

          }
          v28 = objc_alloc(MEMORY[0x1E0D34E08]);
          objc_msgSend(v22, "data");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "initWithProtobufData:type:isResponse:", v29, 2, 0);

          -[NSObject data](v30, "data");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "length"))
          {
            v32 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringWithFormat:", CFSTR("%@-%@.data"), CFSTR("ClearCollaborationNotice"), v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0D398A8], "writeDataPayloadToDisk:fileName:", v31, v34);
          }
          objc_msgSend(MEMORY[0x1E0D39A10], "contextWithKnownSender:", 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = sub_1D14B59DC;
          v44[3] = &unk_1E922AF88;
          v45 = v8;
          v46 = self;
          +[IMBlastdoor sendClearNoticeData:senderContext:withCompletionBlock:](IMBlastdoor, "sendClearNoticeData:senderContext:withCompletionBlock:", v31, v35, v44);

        }
        else
        {
          IMLogHandleForCategory();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            sub_1D1668458(v30, v37, v38, v39, v40, v41, v42, v43);
        }

      }
      else if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMFoundationCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v48 = "-[IMDCollaborationNoticeDispatcher sendClearNotice:toHandles:]";
          v49 = 2112;
          v50 = v6;
          _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "%s: Bailing due to rate limiting for notice: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      IMLogHandleForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1D16683A8(v7, v9);

    }
  }
  else
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1D1668338(v11, v12, v13, v14, v15, v16, v17, v18);

  }
}

- (void)reflectDismissalForNoticeGUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  IDSService *gelatoService;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[IMDCollaborationNoticeDispatcher reflectDismissalForNoticeGUIDs:]";
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "%s: Handling request to reflect notice dismissal for guids: %@", buf, 0x16u);
    }

  }
  v16[0] = CFSTR("at");
  v16[1] = CFSTR("g");
  v17[0] = &unk_1E9271158;
  v17[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D34120];
  v15 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D39888];
  gelatoService = self->_gelatoService;
  -[IMDCollaborationNoticeDispatcher senderLoginIDs](self, "senderLoginIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = 0;
  objc_msgSend(v8, "service:sendMessage:toDestinations:priority:options:identifier:error:", gelatoService, v6, v10, 300, v7, &v13, &v12);
  v11 = v13;

}

- (void)handleIncomingNoticeProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  IMDCollaborationNoticeDispatcher *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v34 = a4;
  v35 = a5;
  v13 = a6;
  v14 = a7;
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[IMDCollaborationNoticeDispatcher handleIncomingNoticeProtobuf:service:account:fromID:context:]";
      v41 = 2112;
      v42 = v13;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "%s: Handling incoming Collaboration Notice from: %@", buf, 0x16u);
    }

  }
  v16 = (void *)IDSCopyAddressDestinationForDestination();
  v17 = (void *)IDSCopyRawAddressForDestination();

  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCollaborationNoticeDispatcher _handlesMinusSenderServiceAccountID:](self, "_handlesMinusSenderServiceAccountID:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v19, "count"))
    {
      objc_msgSend(v12, "data");
      v20 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject length](v20, "length"))
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("%@-%@.data"), CFSTR("CollaborationNotice"), v22, v34, v35);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D398A8], "writeDataPayloadToDisk:fileName:", v20, v23);
      }
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "hasKnownSenderChatWithChatIdentifier:", v17);

      objc_msgSend(MEMORY[0x1E0D39A10], "contextWithKnownSender:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = sub_1D14B6224;
      v36[3] = &unk_1E922AFB0;
      v37 = v17;
      v38 = self;
      +[IMBlastdoor sendCollaborationNoticeData:senderContext:withCompletionBlock:](IMBlastdoor, "sendCollaborationNoticeData:senderContext:withCompletionBlock:", v20, v26, v36);

    }
    else
    {
      IMLogHandleForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1D1668610();
    }

  }
  else
  {
    IMLogHandleForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1D16685A0(v19, v27, v28, v29, v30, v31, v32, v33);
  }

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[5];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v32 = "-[IMDCollaborationNoticeDispatcher service:account:incomingMessage:fromID:context:]";
      v33 = 2112;
      v34 = v15;
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "%s fromID: %@, message: %@", buf, 0x20u);
    }

  }
  v18 = (void *)IDSCopyAddressDestinationForDestination();
  v19 = (void *)IDSCopyRawAddressForDestination();

  if (objc_msgSend(v19, "length"))
  {
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasKnownSenderChatWithChatIdentifier:", v19);

    objc_msgSend(MEMORY[0x1E0D39A10], "contextWithKnownSender:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1D14B67A0;
    v30[3] = &unk_1E922AFD8;
    v30[4] = self;
    +[IMBlastdoor sendCollaborationNoticeActionDictionary:senderContext:withCompletionBlock:](IMBlastdoor, "sendCollaborationNoticeActionDictionary:senderContext:withCompletionBlock:", v14, v22, v30);
  }
  else
  {
    IMLogHandleForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1D1668790(v22, v23, v24, v25, v26, v27, v28, v29);
  }

}

+ (unint64_t)noticeFanoutThreshold
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("notice-fanout-threshold"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 100;

  return v4;
}

- (id)_handlesMinusSenderServiceAccountID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[IMDCollaborationNoticeDispatcher senderLoginIDs](self, "senderLoginIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusSet:", v5);

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (id)_senderServiceAccountIDFrom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[IMDCollaborationNoticeDispatcher senderLoginIDs](self, "senderLoginIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intersectSet:", v5);

  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  return v8;
}

- (id)senderLoginIDs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[IMDCollaborationNoticeDispatcher gelatoService](self, "gelatoService", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "loginID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "loginID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)IDSCopyBestGuessIDForID();

          MEMORY[0x1D17EA374](v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v3;
}

+ (id)unarchiveNoticeTransmissionEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v14;
  _QWORD v15[8];

  v15[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(sub_1D14B6E64(), "eventClassForType:", objc_msgSend(v3, "eventType")))
  {
    objc_msgSend(sub_1D14B6E64(), "allowedClasses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v15[5] = objc_opt_class();
    v15[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setByAddingObjectsFromArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(v3, "eventData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v7, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v6, v8, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if (v10 || !v9)
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1D16689B8();

      v11 = 0;
    }
    else
    {
      v11 = v9;
    }

  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1D166890C(v3, v10);
    v11 = 0;
  }

  return v11;
}

- (IMDCollaborationNoticeDispatcherDelegate)delegate
{
  return (IMDCollaborationNoticeDispatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IMDCollaborationNoticeRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimiter, a3);
}

- (IMDCollaborationClearNoticeRateLimiter)clearRateLimiter
{
  return self->_clearRateLimiter;
}

- (void)setClearRateLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_clearRateLimiter, a3);
}

- (IDSService)gelatoService
{
  return self->_gelatoService;
}

- (void)setGelatoService:(id)a3
{
  objc_storeStrong((id *)&self->_gelatoService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gelatoService, 0);
  objc_storeStrong((id *)&self->_clearRateLimiter, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
