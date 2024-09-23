@implementation IMDChorosController

+ (id)serviceTypeKey
{
  return CFSTR("serviceType");
}

+ (id)reportTypeKey
{
  return CFSTR("reportType");
}

+ (int64_t)supportedServices
{
  return 9;
}

+ (id)nameForService:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown service");
  if (a3 == 8)
    v3 = CFSTR("Roadside");
  if (a3 == 1)
    return CFSTR("Emergency");
  else
    return (id)v3;
}

+ (BOOL)supportsService:(int64_t)a3
{
  BOOL result;
  uint8x8_t v4;

  result = 0;
  if (a3 >= 1)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] <= 1uLL)
      return (+[IMDChorosController supportedServices](IMDChorosController, "supportedServices") & a3) != 0;
  }
  return result;
}

+ (id)outgoingSequenceNumberDefaultsKeyForService:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (*v9)(void *);
  NSObject *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    return CFSTR("stewieSequenceNumber");
  if (a3 == 8)
    return CFSTR("roadsideSequenceNumber");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = IMFileLocationTrimFileName();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("outgoingSequenceNumberDefaultsKeyForService: Unsupported service type: %lld"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("NO"), "+[IMDChorosController outgoingSequenceNumberDefaultsKeyForService:]", v6, 107, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v9)
  {
    v9(v8);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }

  }
  return 0;
}

+ (id)incomingSequenceNumberDefaultsKeyForService:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (*v9)(void *);
  NSObject *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    return CFSTR("stewieReceivedSequenceNumber");
  if (a3 == 8)
    return CFSTR("roadsideReceivedSequenceNumber");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = IMFileLocationTrimFileName();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("incomingSequenceNumberDefaultsKeyForService: Unsupported service type: %lld"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("NO"), "+[IMDChorosController incomingSequenceNumberDefaultsKeyForService:]", v6, 121, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v9)
  {
    v9(v8);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }

  }
  return 0;
}

+ (id)conversationIDDefaultsKeyForService:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (*v9)(void *);
  NSObject *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    return CFSTR("stewieConversationID");
  if (a3 == 8)
    return CFSTR("roadsideConversationID");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = IMFileLocationTrimFileName();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("conversationIDDefaultsKeyForService: Unsupported service type: %lld"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("NO"), "+[IMDChorosController conversationIDDefaultsKeyForService:]", v6, 135, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v9)
  {
    v9(v8);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }

  }
  return 0;
}

+ (id)conversationIDToUUIDsDefaultsKeyForService:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (*v9)(void *);
  NSObject *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    return CFSTR("stewieConversationUUIDs");
  if (a3 == 8)
    return CFSTR("roadsideConversationUUIDs");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = IMFileLocationTrimFileName();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("conversationIDToUUIDsDefaultsKeyForService: Unsupported service type: %lld"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("NO"), "+[IMDChorosController conversationIDToUUIDsDefaultsKeyForService:]", v6, 149, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v9)
  {
    v9(v8);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }

  }
  return 0;
}

- (IMDChorosController)init
{
  IMDChorosController *v2;
  NSMutableSet *v3;
  NSMutableSet *observers;
  id v5;
  int64_t v6;
  uint64_t v7;
  CTStewieDataClient *coreTelephonyStewieClient;
  CTStewieDataClient *v9;
  uint64_t v10;
  char v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint8_t v16[16];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)IMDChorosController;
  v2 = -[IMDChorosController init](&v17, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = objc_alloc(MEMORY[0x1E0CA6DE8]);
    v6 = +[IMDChorosController supportedServices](IMDChorosController, "supportedServices");
    v7 = objc_msgSend(v5, "initWithServices:delegate:delegateQueue:", v6, v2, MEMORY[0x1E0C80D38]);
    coreTelephonyStewieClient = v2->_coreTelephonyStewieClient;
    v2->_coreTelephonyStewieClient = (CTStewieDataClient *)v7;

    v9 = v2->_coreTelephonyStewieClient;
    if (v9)
    {
      v10 = -[CTStewieDataClient start](v9, "start");
      v11 = v10;
      v12 = IMOSLoggingEnabled(v10);
      if ((v11 & 1) != 0)
      {
        if (v12)
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v16 = 0;
            v14 = "Loaded data client";
LABEL_13:
            _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, v14, v16, 2u);
            goto LABEL_14;
          }
          goto LABEL_14;
        }
      }
      else if (v12)
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v16 = 0;
          v14 = "Failed to start the data client";
          goto LABEL_13;
        }
        goto LABEL_14;
      }
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        v14 = "Failed to load data client";
        goto LABEL_13;
      }
LABEL_14:

    }
  }
  return v2;
}

+ (id)sharedController
{
  if (qword_1ED936070 != -1)
    dispatch_once(&qword_1ED936070, &unk_1E922CF50);
  return (id)qword_1ED936058;
}

- (void)sendStewieMessage:(id)a3 forChat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  _BOOL8 v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _BOOL8 v16;
  NSObject *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void (*v38)(void *);
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  char v47;
  void *v48;
  int v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD block[5];
  id v63;
  NSObject *v64;
  _QWORD v65[4];
  id v66;
  id v67;
  IMDChorosController *v68;
  NSObject *v69;
  id v70;
  id v71;
  uint8_t v72[4];
  void *v73;
  _BYTE buf[32];
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "chatIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[IMDChorosController serviceFromChatIdentifier:](IMDChorosController, "serviceFromChatIdentifier:", v8);

  v10 = +[IMDChorosController supportsService:](IMDChorosController, "supportsService:", v9);
  if (v10)
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Sending Stewie message to CT", buf, 2u);
      }

    }
    objc_msgSend(v7, "updateIsEmergencyChat:", v9 == 1);
    objc_msgSend(v6, "body");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v13 = objc_claimAutoreleasedReturnValue();

    if (!v6 || !-[NSObject length](v13, "length"))
    {
      IMLogHandleForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1D166AFC0();
      goto LABEL_63;
    }
    +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "anySessionForServiceName:", *MEMORY[0x1E0D38F58]);
    v15 = objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      IMLogHandleForCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        sub_1D166AFEC();
        v29 = v28;
      }
      goto LABEL_62;
    }
    v16 = -[IMDChorosController _isMessageStewieCompatible:](self, "_isMessageStewieCompatible:", v6);
    v59 = v16;
    if (!v16 && IMOSLoggingEnabled(v16))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Content to send is not allowed", buf, 2u);
      }

    }
    objc_msgSend(v6, "time");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTime:", v20);

    }
    +[IMDChorosController outgoingSequenceNumberDefaultsKeyForService:](IMDChorosController, "outgoingSequenceNumberDefaultsKeyForService:", v9);
    v61 = objc_claimAutoreleasedReturnValue();
    v21 = IMGetDomainIntForKey();
    if (v21 + 1 <= 0)
      v22 = -(-(v21 + 1) & 0x1FFF);
    else
      v22 = (v21 + 1) & 0x1FFF;
    IMSetDomainIntForKey();
    objc_msgSend(v6, "setReplaceID:", -1);
    +[IMDChorosController incomingSequenceNumberDefaultsKeyForService:](IMDChorosController, "incomingSequenceNumberDefaultsKeyForService:", v9);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v6, "setStewieSequenceNumber:", IMGetDomainIntForKey());
    if (IMOSLoggingEnabled(v23))
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        +[IMDChorosController nameForService:](IMDChorosController, "nameForService:", v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v25;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Generating outgoing text message for %@", buf, 0xCu);

      }
    }
    +[IMDChorosController conversationIDDefaultsKeyForService:](IMDChorosController, "conversationIDDefaultsKeyForService:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = IMGetDomainIntForKey();

    -[IMDChorosController conversationUUIDForConversationID:service:](self, "conversationUUIDForConversationID:service:", v60, v9);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == 8)
    {
      objc_msgSend(v7, "chatIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMDChorosController roadsideProviderIDFromChatIdentifier:](IMDChorosController, "roadsideProviderIDFromChatIdentifier:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v70 = 0;
        v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E18]), "initWithConversationID:providerId:sequenceNum:text:error:", v60, objc_msgSend(v31, "integerValue"), v22, v13, &v70);
        v32 = v70;
      }
      else
      {
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v76 = *MEMORY[0x1E0CB2D50];
        v77[0] = CFSTR("Failed to send message. ProviderId is invalid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v40);
        v32 = (id)objc_claimAutoreleasedReturnValue();

        v56 = 0;
      }

      v27 = v32;
      if (!v32)
        goto LABEL_47;
    }
    else
    {
      if (v9 != 1)
      {
        *(_OWORD *)buf = xmmword_1E922CF70;
        *(_OWORD *)&buf[16] = *(_OWORD *)off_1E922CF80;
        v75 = 255;
        v33 = (void *)MEMORY[0x1E0CB3940];
        v34 = IMFileLocationTrimFileName();
        v35 = v75;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("outgoingSequenceNumberDefaultsKeyForService: Unsupported service type: %lld"), v9);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("NO"), "-[IMDChorosController sendStewieMessage:forChat:]", v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = (void (*)(void *))IMGetAssertionFailureHandler();
        if (v38)
        {
          v38(v37);
        }
        else if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v72 = 138412290;
            v73 = v37;
            _os_log_impl(&dword_1D1413000, v42, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", v72, 0xCu);
          }

        }
        v56 = 0;
        goto LABEL_47;
      }
      v71 = 0;
      v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E00]), "initWithConversationID:sequenceNum:emergencyText:error:", v60, v22, v13, &v71);
      v27 = v71;
      if (!v27)
      {
LABEL_47:
        v55 = 0;
LABEL_48:
        objc_msgSend(v6, "setStewieConversationID:", v60);
        objc_msgSend(v6, "setStewieConversationUUID:", v57);
        objc_msgSend(v6, "setIsStewie:", 1);
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v54) = 0;
        v44 = (id)objc_msgSend(v43, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:", v6, 0, 0, 1, objc_msgSend(v6, "flags"), 1, v54);

        objc_msgSend(v6, "guid");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v45;
        v47 = !v59;
        if (!v45)
          v47 = 1;
        if ((v47 & 1) != 0)
          goto LABEL_67;
        -[IMDChorosController coreTelephonyStewieClient](self, "coreTelephonyStewieClient");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = sub_1D154F23C;
        v65[3] = &unk_1E922CFA0;
        v66 = v6;
        v67 = v46;
        v68 = self;
        v69 = v15;
        v49 = objc_msgSend(v48, "sendMessage:completion:", v56, v65);

        if (!v49)
        {
LABEL_67:
          if (IMOSLoggingEnabled(v45))
          {
            OSLogHandleForIMFoundationCategory();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v56;
              _os_log_impl(&dword_1D1413000, v51, OS_LOG_TYPE_INFO, "**** Failed sending message (%@)", buf, 0xCu);
            }

          }
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_1D154F430;
          block[3] = &unk_1E9229280;
          block[4] = self;
          v63 = v46;
          v64 = v15;
          dispatch_async(MEMORY[0x1E0C80D38], block);

        }
        else if (IMOSLoggingEnabled(v45))
        {
          OSLogHandleForIMFoundationCategory();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v56;
            _os_log_impl(&dword_1D1413000, v50, OS_LOG_TYPE_INFO, "Message transmitted to CT: %@", buf, 0xCu);
          }

        }
        v29 = (void *)v61;
LABEL_62:

LABEL_63:
        goto LABEL_64;
      }
    }
    v55 = v27;
    IMLogHandleForCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      +[IMDChorosController nameForService:](IMDChorosController, "nameForService:", v9);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localizedDescription");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v52;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v53;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v56;
      _os_log_error_impl(&dword_1D1413000, v41, OS_LOG_TYPE_ERROR, "Stewie %@ text message reported error: %@, message: %@", buf, 0x20u);

    }
    goto LABEL_48;
  }
  IMLogHandleForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_1D166B018();
LABEL_64:

}

- (void)_processMessageSent:(id)a3 forSession:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "ACK - Sent message for guid: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didReceiveMessageDeliveryReceiptForMessageID:date:", v5, v8);

}

- (void)_processMessageSendFailure:(id)a3 forSession:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "ACK - Failed to send message for guid: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  objc_msgSend(v6, "didReceiveError:forMessageID:forceError:", 4, v5, 1);

}

- (BOOL)_isMessageStewieCompatible:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend(v4, "isEqual:", objc_opt_class());
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "fileTransferGUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v3, "fileTransferGUIDs");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412290;
          v20 = v11;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Emergency stewie is not allowed to send a file: %@", (uint8_t *)&v19, 0xCu);

        }
LABEL_10:

      }
    }
    else
    {
      objc_msgSend(v3, "payloadData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (!v16)
      {
        v13 = 1;
        goto LABEL_12;
      }
      if (IMOSLoggingEnabled(v17))
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v3, "payloadData");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412290;
          v20 = v18;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Emergency stewie is not allowed to process payload data: %@", (uint8_t *)&v19, 0xCu);

        }
        goto LABEL_10;
      }
    }
  }
  else if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = (id)objc_opt_class();
      v12 = v20;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Emergency stewie is not of class IMMessageItem: %@", (uint8_t *)&v19, 0xCu);

    }
    goto LABEL_10;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

+ (id)generatePresentationForEmergencyQuestionnaire:(id)a3
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
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[16];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E92346B0);
    v29 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7858]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "length"))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      IMDaemonCoreBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("STEWIE_EMERGENCY_MESSAGE_INFO_LIST"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable-SOS"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringWithFormat:", v8, v32);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v9);
      objc_msgSend(v5, "appendAttributedString:", v10);

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n\n"));
      objc_msgSend(v5, "appendAttributedString:", v11);

    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "No emergency type provided", buf, 2u);
        }

      }
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
      objc_msgSend(v5, "appendAttributedString:", v14);

    }
    IMDaemonCoreBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("STEWIE_EMERGENCY_MESSAGE_INFO"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable-SOS"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v30);
    v16 = objc_msgSend(v33, "length");
    objc_msgSend(v33, "addAttribute:value:range:", *MEMORY[0x1E0D37420], CFSTR("boldValue"), 0, v16);
    objc_msgSend(v5, "appendAttributedString:", v33);
    objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7860]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "count"))
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = v31;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v36;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v36 != v18)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v19);
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
            objc_msgSend(v5, "appendAttributedString:", v21);

            v22 = (void *)MEMORY[0x1E0CB3940];
            IMDaemonCoreBundle();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("STEWIE_EMERGENCY_MESSAGE_INFO_LIST"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable-SOS"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "localizedStringWithFormat:", v24, v20);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v25);
            objc_msgSend(v5, "appendAttributedString:", v26);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v17);
      }

      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v5);
      -[NSObject __im_attributedStringByAssigningMessagePartNumbers](v27, "__im_attributedStringByAssigningMessagePartNumbers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      IMLogHandleForCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1D166B07C();
      v12 = 0;
    }

    v3 = v29;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)generatePresentationForRoadsideQuestionnaire:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[16];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  if (v32)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E92346B0);
    +[IMDChorosController reportTypeKey](IMDChorosController, "reportTypeKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", v4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v30, "length"))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      IMDaemonCoreBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("STEWIE_ROADSIDE_MESSAGE_INFO_LIST"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable-Avocet"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringWithFormat:", v7, v30);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
      objc_msgSend(v3, "appendAttributedString:", v9);

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n\n"));
      objc_msgSend(v3, "appendAttributedString:", v10);

    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "No roadside type provided", buf, 2u);
        }

      }
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
      objc_msgSend(v3, "appendAttributedString:", v13);

    }
    IMDaemonCoreBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("STEWIE_ROADSIDE_MESSAGE_INFO"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable-Avocet"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v28);
    v15 = objc_msgSend(v31, "length");
    objc_msgSend(v31, "addAttribute:value:range:", *MEMORY[0x1E0D37420], CFSTR("boldValue"), 0, v15);
    objc_msgSend(v3, "appendAttributedString:", v31);
    objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7860]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "count"))
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      obj = v29;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v35 != v17)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
            objc_msgSend(v3, "appendAttributedString:", v20);

            v21 = (void *)MEMORY[0x1E0CB3940];
            IMDaemonCoreBundle();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("STEWIE_ROADSIDE_MESSAGE_INFO_LIST"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable-Avocet"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "localizedStringWithFormat:", v23, v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v24);
            objc_msgSend(v3, "appendAttributedString:", v25);

          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v16);
      }

      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v3);
      -[NSObject __im_attributedStringByAssigningMessagePartNumbers](v26, "__im_attributedStringByAssigningMessagePartNumbers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      IMLogHandleForCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_1D166B0A8();
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)generatePresentationForStewieQuestionnaire:(id)a3 forService:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void (*v12)(void *);
  NSObject *v13;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4 == 8)
  {
    +[IMDChorosController generatePresentationForRoadsideQuestionnaire:](IMDChorosController, "generatePresentationForRoadsideQuestionnaire:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    +[IMDChorosController generatePresentationForEmergencyQuestionnaire:](IMDChorosController, "generatePresentationForEmergencyQuestionnaire:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;
    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = IMFileLocationTrimFileName();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("generatePresentationForStewieQuestionnaire: Unsupported service type: %lld"), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("NO"), "+[IMDChorosController generatePresentationForStewieQuestionnaire:forService:]", v9, 424, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v12)
  {
    v12(v11);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }

  }
  v7 = 0;
LABEL_13:

  return v7;
}

+ (id)generateCTStewieStartMessage:(id)a3 forService:(int64_t)a4 error:(id *)a5
{
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (*v14)(void *);
  NSObject *v15;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a4 == 8)
  {
    v8 = (objc_class *)MEMORY[0x1E0CA6E10];
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v8 = (objc_class *)MEMORY[0x1E0CA6DF8];
LABEL_5:
    v9 = (void *)objc_msgSend([v8 alloc], "initWithDictionary:error:", v7, a5);
    goto LABEL_13;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = IMFileLocationTrimFileName();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("generateCTStewieStartMessage: Unsupported service type: %lld"), a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("NO"), "+[IMDChorosController generateCTStewieStartMessage:forService:error:]", v11, 438, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v14)
  {
    v14(v13);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }

  }
  v9 = 0;
LABEL_13:

  return v9;
}

+ (BOOL)needToOpenChatForService:(int64_t)a3 questionnaireDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a4;
  v6 = v5;
  if (a3 == 1
    && (objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CA7878]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "No questionnaire answers provided", v12, 2u);
      }

    }
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (id)chatSubjectForService:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void (*v12)(void *);
  NSObject *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 == 8)
  {
    IMDaemonCoreBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STEWIE_ROADSIDE_MESSAGE_SUBJECT"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable-Avocet"));
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    IMDaemonCoreBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STEWIE_EMERGENCY_MESSAGE_SUBJECT"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable-SOS"));
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;

    return v6;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = IMFileLocationTrimFileName();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("generateCTStewieStartMessage: Unsupported service type: %lld"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("NO"), "+[IMDChorosController chatSubjectForService:]", v9, 467, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v12)
  {
    v12(v11);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }

  }
  return 0;
}

- (void)updateChatPropertiesIfRequiredForEmergencyChat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMDaemonCoreBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STEWIE_EMERGENCY_DISPLAY_NAME"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable-SOS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = 138412546;
        v11 = v3;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Updating chat: %@ display name to: %@", (uint8_t *)&v10, 0x16u);
      }

    }
    objc_msgSend(v3, "updateDisplayName:", v5);
  }

}

- (void)updateChatPropertiesIfRequiredForRoadsideChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "chatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChorosController roadsideProviderForChatIdentifier:](self, "roadsideProviderForChatIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "providerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    IMDaemonCoreBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STEWIE_ROADSIDE_FALLBACK_DISPLAY_NAME"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable-Avocet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v18 = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Updating chat: %@ display name to: %@", (uint8_t *)&v18, 0x16u);
      }

    }
    objc_msgSend(v4, "updateDisplayName:", v7);
  }
  objc_msgSend(v6, "bizId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v4, "associatedBusinessID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v16))
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = 138412546;
          v19 = v4;
          v20 = 2112;
          v21 = v13;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Updating chat: %@ associated business ID to: %@", (uint8_t *)&v18, 0x16u);
        }

      }
      objc_msgSend(v4, "updateAssociatedBusinessID:", v13);
    }
  }

}

- (void)updateChatPropertiesIfRequiredForChat:(id)a3 service:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (*v11)(void *);
  NSObject *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 8)
  {
    -[IMDChorosController updateChatPropertiesIfRequiredForRoadsideChat:](self, "updateChatPropertiesIfRequiredForRoadsideChat:", v6);
  }
  else if (a4 == 1)
  {
    -[IMDChorosController updateChatPropertiesIfRequiredForEmergencyChat:](self, "updateChatPropertiesIfRequiredForEmergencyChat:", v6);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = IMFileLocationTrimFileName();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updateChatPropertiesIfRequiredForChat: Unsupported service type: %lld"), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("NO"), "-[IMDChorosController updateChatPropertiesIfRequiredForChat:service:]", v8, 515, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v11)
    {
      v11(v10);
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }

    }
  }

}

- (void)sendQuestionnaire:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL8 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  NSObject *v60;
  NSObject *v61;
  int v62;
  uint64_t v63;
  int v64;
  NSObject *v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  IMDChorosController *v80;
  _QWORD block[5];
  id v82;
  NSObject *v83;
  _QWORD v84[4];
  id v85;
  id v86;
  IMDChorosController *v87;
  NSObject *v88;
  NSObject *v89;
  uint64_t v90;
  id v91;
  uint8_t buf[4];
  uint64_t v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v80 = self;
    +[IMDChorosController serviceTypeKey](IMDChorosController, "serviceTypeKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = -[NSObject integerValue](v6, "integerValue");
    v8 = +[IMDChorosController supportsService:](IMDChorosController, "supportsService:", v7);
    if (!v8)
    {
      IMLogHandleForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1D166B258();
      goto LABEL_82;
    }
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        +[IMDChorosController nameForService:](IMDChorosController, "nameForService:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v93 = (uint64_t)v10;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "sendQuestionnaire: invoked for service type: %@", buf, 0xCu);

      }
    }
    +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (_QWORD *)MEMORY[0x1E0D38F58];
    objc_msgSend(v11, "anySessionForServiceName:", *MEMORY[0x1E0D38F58]);
    v13 = objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      IMLogHandleForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      v15 = v17;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        sub_1D166B100();
        v15 = v17;
      }
      goto LABEL_81;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7880]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDChorosController generatePresentationForStewieQuestionnaire:forService:](IMDChorosController, "generatePresentationForStewieQuestionnaire:forService:", v14, v7);
    v79 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v79;
    if (!v79)
    {
LABEL_81:

LABEL_82:
      goto LABEL_83;
    }
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA7850]);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v77)
    {
      IMLogHandleForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      v18 = v16;
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_80:

        v15 = (void *)v79;
        goto LABEL_81;
      }
      sub_1D166B12C();
LABEL_36:
      v18 = v16;
      goto LABEL_80;
    }
    if (v7 == 1)
    {
      +[IMDChorosController chatIdentifierForEmergency](IMDChorosController, "chatIdentifierForEmergency");
      v76 = objc_claimAutoreleasedReturnValue();
      v16 = 0;
    }
    else
    {
      if (v7 != 8)
      {
        v16 = 0;
LABEL_33:
        IMLogHandleForCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1D166B158();

        goto LABEL_36;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7870]);
      v19 = objc_claimAutoreleasedReturnValue();
      v16 = v19;
      if (!v19)
      {
        IMLogHandleForCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        v18 = v16;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          goto LABEL_80;
        sub_1D166B22C();
        goto LABEL_36;
      }
      +[IMDChorosController chatIdentifierForRoadside:](IMDChorosController, "chatIdentifierForRoadside:", -[NSObject integerValue](v19, "integerValue"));
      v76 = objc_claimAutoreleasedReturnValue();
    }
    if (v76)
    {
      v72 = v16;
      v20 = objc_msgSend(v77, "integerValue");
      v21 = v20;
      if (v20 < 0)
      {
        IMLogHandleForCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          sub_1D166B200();
      }
      else
      {
        if (IMOSLoggingEnabled(v20))
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v93 = v21;
            _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Conversation ID: %ld", buf, 0xCu);
          }

        }
        +[IMDChorosController conversationIDDefaultsKeyForService:](IMDChorosController, "conversationIDDefaultsKeyForService:", v7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        IMSetDomainIntForKey();

        if (v16)
        {
          -[NSObject integerValue](v16, "integerValue");
          IMSetDomainIntForKey();
        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v24 = objc_claimAutoreleasedReturnValue();
        -[NSObject __mainThreadPostNotificationName:object:](v24, "__mainThreadPostNotificationName:object:", *MEMORY[0x1E0D39288], 0);
      }

      v91 = 0;
      +[IMDChorosController generateCTStewieStartMessage:forService:error:](IMDChorosController, "generateCTStewieStartMessage:forService:error:", v4, v7, &v91);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v91;
      v68 = v26;
      if (v26 || !v74)
      {
        IMLogHandleForCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_1D166B184();

      }
      if (IMOSLoggingEnabled(v26))
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          +[IMDChorosController nameForService:](IMDChorosController, "nameForService:", v7);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v93 = (uint64_t)v29;
          _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Sending %@ start message to CT", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      StringGUID();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39918]), "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", v76, v70, v79, 0, 0, 0x200000005, 0, v71, 0);
      v30 = -[IMDChorosController _createChatIfNecessary:chatIdentifier:service:](v80, "_createChatIfNecessary:chatIdentifier:service:", v13, v76, v7);
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject account](v13, "account");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "existingChatWithIdentifier:account:", v76, v32);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        -[IMDChorosController updateChatPropertiesIfRequiredForChat:service:](v80, "updateChatPropertiesIfRequiredForChat:service:", v75, v7);
      if (v7 == 1)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7868]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "integerValue");

        v36 = IMOSLoggingEnabled(v35);
        if (v34 == 3)
        {
          if (v36)
          {
            OSLogHandleForIMFoundationCategory();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "Transcript sharing turned on", buf, 2u);
            }

          }
          v38 = 1;
          goto LABEL_62;
        }
        if (v36)
        {
          OSLogHandleForIMFoundationCategory();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v93 = v34;
            _os_log_impl(&dword_1D1413000, v39, OS_LOG_TYPE_INFO, "Transcript sharing off: %ld", buf, 0xCu);
          }

        }
      }
      v38 = 0;
LABEL_62:
      objc_msgSend(v75, "updateEmergencyTranscriptSharingStateChatProperty:", v38);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChorosController setConversationUUID:forConversationID:service:](v80, "setConversationUUID:forConversationID:service:", v73, v21, v7);
      +[IMDChorosController outgoingSequenceNumberDefaultsKeyForService:](IMDChorosController, "outgoingSequenceNumberDefaultsKeyForService:", v7);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      IMSetDomainIntForKey();

      +[IMDChorosController incomingSequenceNumberDefaultsKeyForService:](IMDChorosController, "incomingSequenceNumberDefaultsKeyForService:", v7);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      IMSetDomainIntForKey();

      -[IMDChorosController _simNumber](v80, "_simNumber");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setDestinationCallerID:", v69);
      -[NSObject accountID](v13, "accountID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setAccountID:", v42);

      objc_msgSend(v78, "setIsStewie:", 1);
      objc_msgSend(v78, "setService:", *v12);
      objc_msgSend(v78, "setHandle:", v76);
      objc_msgSend(v78, "setReplaceID:", -1);
      objc_msgSend(v78, "setStewieConversationID:", v21);
      objc_msgSend(v78, "setStewieConversationUUID:", v73);
      +[IMDChorosController chatSubjectForService:](IMDChorosController, "chatSubjectForService:", v7);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setSubject:", v43);

      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v67) = 0;
      v45 = (id)objc_msgSend(v44, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:", v78, 0, 0, 1, 0x200000005, 1, v67);

      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addMessage:toChat:", v78, v75);

      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "updateStateForChat:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:", v75, v78, 1, 0);

      if (IMOSLoggingEnabled(v48))
      {
        OSLogHandleForIMFoundationCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v93 = v76;
          _os_log_impl(&dword_1D1413000, v49, OS_LOG_TYPE_INFO, "Will broadcast initialEmergencyQuestionnaireReceived for chatIdentifier: %@", buf, 0xCu);
        }

      }
      -[NSObject broadcasterForChatListeners](v13, "broadcasterForChatListeners");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject account](v13, "account");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "accountID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "chatProperties");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "groupID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "personCentricID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "account:chat:style:chatProperties:groupID:chatPersonCentricID:initialEmergencyQuestionnaireReceived:", v52, v76, 45, v53, v54, v55, v78);

      if ((IMIsRunningInUnitTesting() & 1) == 0
        && +[IMDChorosController needToOpenChatForService:questionnaireDictionary:](IMDChorosController, "needToOpenChatForService:questionnaireDictionary:", v7, v4))
      {
        -[IMDChorosController _openStewieChatWithChatIdentifier:](v80, "_openStewieChatWithChatIdentifier:", v76);
      }
      -[IMDChorosController coreTelephonyStewieClient](v80, "coreTelephonyStewieClient");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = MEMORY[0x1E0C809B0];
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = sub_1D1551B10;
      v84[3] = &unk_1E922D068;
      v58 = v78;
      v85 = v58;
      v59 = v71;
      v86 = v59;
      v87 = v80;
      v60 = v13;
      v88 = v60;
      v90 = v7;
      v61 = v72;
      v89 = v61;
      v62 = objc_msgSend(v56, "sendMessage:completion:", v74, v84);

      v64 = IMOSLoggingEnabled(v63);
      if (v62)
      {
        if (v64)
        {
          OSLogHandleForIMFoundationCategory();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v93 = (uint64_t)v74;
            _os_log_impl(&dword_1D1413000, v65, OS_LOG_TYPE_INFO, "Message transmitted to CT: %@", buf, 0xCu);
          }

        }
      }
      else
      {
        if (v64)
        {
          OSLogHandleForIMFoundationCategory();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v93 = (uint64_t)v74;
            _os_log_impl(&dword_1D1413000, v66, OS_LOG_TYPE_INFO, "**** Failed sending start Stewie message (%@)", buf, 0xCu);
          }

        }
        block[0] = v57;
        block[1] = 3221225472;
        block[2] = sub_1D1551E10;
        block[3] = &unk_1E9229280;
        block[4] = v80;
        v82 = v59;
        v83 = v60;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
      v18 = (void *)v76;
      goto LABEL_80;
    }
    goto LABEL_33;
  }
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1D166B0D4();
LABEL_83:

}

- (void)sendEmergencyQuestionnaire:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "mutableCopy");
  +[IMDChorosController serviceTypeKey](IMDChorosController, "serviceTypeKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E9271560, v4);

  -[IMDChorosController sendQuestionnaire:](self, "sendQuestionnaire:", v5);
}

- (void)stopTranscriptSharingWithChat:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Stopping sharing transcript", buf, 2u);
    }

  }
  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anySessionForServiceName:", *MEMORY[0x1E0D38F58]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v23 = 0;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6DF0]), "initWithNotifyOption:error:", 1, &v23);
    v7 = v23;
    if (v7)
    {
      IMLogHandleForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1D166B2E8(v7, v8);

    }
    -[IMDChorosController _generateStopTranscriptSharingStatusItemForChat:](self, "_generateStopTranscriptSharingStatusItemForChat:", v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "broadcasterForChatListeners");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDChorosController chatIdentifierForEmergency](IMDChorosController, "chatIdentifierForEmergency");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "chatProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "personCentricID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "account:chat:style:chatProperties:groupID:chatPersonCentricID:messageReceived:", v11, v12, 45, v13, v14, v15, v20);

    -[IMDChorosController coreTelephonyStewieClient](self, "coreTelephonyStewieClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v16, "sendMessage:completion:", v21, &unk_1E922D0A8);

    v18 = IMOSLoggingEnabled(v17);
    if ((_DWORD)v13)
    {
      if (v18)
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v21;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Message transmitted to CT: %@", buf, 0xCu);
        }
LABEL_20:

      }
    }
    else if (v18)
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v21;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "**** Failed sending message (%@)", buf, 0xCu);
      }
      goto LABEL_20;
    }

    goto LABEL_22;
  }
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_1D166B2BC();
LABEL_22:

}

- (void)_processReceivedTextMessageForService:(int64_t)a3 chatIdentifier:(id)a4 conversationID:(int64_t)a5 sequenceNum:(int64_t)a6 text:(id)a7
{
  id v12;
  id v13;
  void *v14;
  _QWORD *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int64_t v45;
  int64_t v46;
  uint8_t buf[4];
  int64_t v48;
  __int16 v49;
  int64_t v50;
  __int16 v51;
  int64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  if (+[IMDChorosController supportsService:](IMDChorosController, "supportsService:", a3))
  {
    v45 = a5;
    v46 = a6;
    +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (_QWORD *)MEMORY[0x1E0D38F58];
    objc_msgSend(v14, "anySessionForServiceName:", *MEMORY[0x1E0D38F58]);
    v16 = objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      IMLogHandleForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1D166B36C();
      goto LABEL_46;
    }
    if (!v13 || !objc_msgSend(v13, "length"))
    {
      IMLogHandleForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1D166B398();
      goto LABEL_46;
    }
    if (!v12 || !objc_msgSend(v12, "length"))
    {
      IMLogHandleForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1D166B3C4();
      goto LABEL_46;
    }
    objc_msgSend(MEMORY[0x1E0D39920], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "acquireAssertionToUnsuspendProcess");

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v13);
    objc_msgSend(v18, "__im_attributedStringByAssigningMessagePartNumbers");
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0D39918]);
    StringGUID();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", v12, v43, v19, 0, 0, 0x200000001, 0, v21, 0);

    -[IMDChorosController _createChatIfNecessary:chatIdentifier:service:](self, "_createChatIfNecessary:chatIdentifier:service:", v16, v12, a3);
    objc_msgSend(v22, "setStewieSequenceNumber:", v46);
    -[IMDChorosController conversationUUIDForConversationID:service:](self, "conversationUUIDForConversationID:service:", v45, a3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDChorosController incomingSequenceNumberDefaultsKeyForService:](IMDChorosController, "incomingSequenceNumberDefaultsKeyForService:", a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v22;
    v24 = IMGetDomainIntForKey();

    if (v24 < v46)
    {
      +[IMDChorosController incomingSequenceNumberDefaultsKeyForService:](IMDChorosController, "incomingSequenceNumberDefaultsKeyForService:", a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      IMSetDomainIntForKey();

    }
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "messageWithReplaceMessageID:fromHandle:onService:", v46, v12, *v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      if (IMOSLoggingEnabled(v28))
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Found a message with the same sequence number", buf, 2u);
        }

      }
      v30 = objc_msgSend(v27, "stewieConversationID");
      if (v30 == v45)
      {
        if (IMOSLoggingEnabled(v30))
        {
          OSLogHandleForIMFoundationCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Found a message with the same Conversation ID", buf, 2u);
          }

        }
        objc_msgSend(v27, "body");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "string");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = objc_msgSend(v44, "isEqualToString:", v13);
        LODWORD(v32) = v33;
        v34 = IMOSLoggingEnabled(v33);
        if ((_DWORD)v32)
        {
          if ((_DWORD)v34)
          {
            OSLogHandleForIMFoundationCategory();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Dropping message", buf, 2u);
            }

          }
          if (!IMOSLoggingEnabled(v34))
            goto LABEL_45;
          OSLogHandleForIMFoundationCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v48 = v45;
            v49 = 2048;
            v50 = v46;
            _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Message has the same text, conversation ID: %lld and sequence number: %lld", buf, 0x16u);
          }
          goto LABEL_44;
        }
        if ((_DWORD)v34)
        {
          OSLogHandleForIMFoundationCategory();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "Text is not the same, keeping message", buf, 2u);
          }

        }
      }
    }
    -[IMDChorosController _simNumber](self, "_simNumber");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setDestinationCallerID:", v44);
    -[NSObject accountID](v16, "accountID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAccountID:", v38);

    objc_msgSend(v41, "setIsStewie:", 1);
    objc_msgSend(v41, "setReplaceID:", v46);
    objc_msgSend(v41, "setStewieConversationID:", v45);
    objc_msgSend(v41, "setStewieConversationUUID:", v42);
    objc_msgSend(MEMORY[0x1E0D39920], "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "sendNotificationMessageIfNeededForIncomingMessageFromChatIdentifier:", v12);

    if (!IMOSLoggingEnabled(-[NSObject didReceiveMessage:forChat:style:fromIDSID:](v16, "didReceiveMessage:forChat:style:fromIDSID:", v41, v12, 45, 0)))
    {
LABEL_45:

LABEL_46:
      goto LABEL_47;
    }
    OSLogHandleForIMFoundationCategory();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      +[IMDChorosController nameForService:](IMDChorosController, "nameForService:", a3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v48 = (int64_t)v40;
      v49 = 2048;
      v50 = v45;
      v51 = 2048;
      v52 = v46;
      _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Session received Stewie %@ text message with Conversation ID: %lld, sequence number: %lld", buf, 0x20u);

    }
LABEL_44:

    goto LABEL_45;
  }
  IMLogHandleForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_1D166B3F0();
LABEL_47:

}

- (void)locationUpdateSent
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[IMDChorosController serviceTypeKey](IMDChorosController, "serviceTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6[0] = &unk_1E9271560;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChorosController locationUpdateDelivered:](self, "locationUpdateDelivered:", v4);

}

- (void)locationUpdateDelivered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t v30[16];
  uint8_t buf[16];

  v4 = a3;
  +[IMDChorosController serviceTypeKey](IMDChorosController, "serviceTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  v8 = +[IMDChorosController supportsService:](IMDChorosController, "supportsService:", v7);
  if (v8)
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Location update sent", buf, 2u);
      }

    }
    +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anySessionForServiceName:", *MEMORY[0x1E0D38F58]);
    v11 = objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1D166B454();
      goto LABEL_25;
    }
    if (v7 == 8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7870]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        IMLogHandleForCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          sub_1D166B4AC();
        goto LABEL_25;
      }
      v26 = v25;
      +[IMDChorosController chatIdentifierForRoadside:](IMDChorosController, "chatIdentifierForRoadside:", objc_msgSend(v25, "integerValue"));
      v12 = objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_10;
    }
    else if (v7 == 1)
    {
      +[IMDChorosController chatIdentifierForEmergency](IMDChorosController, "chatIdentifierForEmergency");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
LABEL_10:
        v13 = -[IMDChorosController _createChatIfNecessary:chatIdentifier:service:](self, "_createChatIfNecessary:chatIdentifier:service:", v11, v12, v7);
        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject account](v11, "account");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "existingChatWithIdentifier:account:", v12, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          -[IMDChorosController updateChatPropertiesIfRequiredForChat:service:](self, "updateChatPropertiesIfRequiredForChat:service:", v16, v7);
        -[IMDChorosController _generateLocationUpdateSentStatusItemForChat:](self, "_generateLocationUpdateSentStatusItemForChat:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        -[NSObject broadcasterForChatListeners](v11, "broadcasterForChatListeners");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject account](v11, "account");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "accountID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "chatProperties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "groupID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v16;
        objc_msgSend(v16, "personCentricID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)v17;
        objc_msgSend(v18, "account:chat:style:chatProperties:groupID:chatPersonCentricID:messageReceived:", v19, v12, 45, v20, v21, v22, v17);

        if (IMOSLoggingEnabled(v23))
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Location update sent broadcasted to client", v30, 2u);
          }

        }
LABEL_25:

        goto LABEL_26;
      }
    }
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1D166B480();
    goto LABEL_25;
  }
  IMLogHandleForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_1D166B4D8();
LABEL_26:

}

- (void)openStewieChatWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void (*v16)(void *);
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IMDChorosController serviceTypeKey](IMDChorosController, "serviceTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  if (!+[IMDChorosController supportsService:](IMDChorosController, "supportsService:", v7))
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1D166B568();
    goto LABEL_8;
  }
  if (v7 != 8)
  {
    if (v7 == 1)
    {
      +[IMDChorosController chatIdentifierForEmergency](IMDChorosController, "chatIdentifierForEmergency");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_5;
    }
    goto LABEL_11;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7870]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1D166B53C();
LABEL_8:

    goto LABEL_18;
  }
  +[IMDChorosController chatIdentifierForRoadside:](IMDChorosController, "chatIdentifierForRoadside:", objc_msgSend(v10, "integerValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_5:
    -[IMDChorosController _openStewieChatWithChatIdentifier:](self, "_openStewieChatWithChatIdentifier:", v8);

    goto LABEL_18;
  }
LABEL_11:
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = IMFileLocationTrimFileName();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("openStewieChatWithContext: Chat identifier cannot be nil if we got here"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("NO"), "-[IMDChorosController openStewieChatWithContext:]", v13, 937, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v16)
  {
    v16(v15);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }

  }
LABEL_18:

}

- (void)processReceivedEmergencyMessageFromIMTool:(int64_t)a3 message:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;

  v6 = a4;
  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anySessionForServiceName:", *MEMORY[0x1E0D38F58]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDChorosController chatIdentifierForEmergency](IMDChorosController, "chatIdentifierForEmergency");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChorosController _createChatIfNecessary:chatIdentifier:service:](self, "_createChatIfNecessary:chatIdentifier:service:", v8, v9, 1);

  +[IMDChorosController conversationIDDefaultsKeyForService:](IMDChorosController, "conversationIDDefaultsKeyForService:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = IMGetDomainIntForKey();

  if (v11 < 0)
  {
    v11 = arc4random_uniform(0xFAu);
    +[IMDChorosController conversationIDDefaultsKeyForService:](IMDChorosController, "conversationIDDefaultsKeyForService:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetDomainIntForKey();

  }
  v13 = (__CFString *)v6;
  v24 = v13;
  if (a3 == -1)
  {
    +[IMDChorosController outgoingSequenceNumberDefaultsKeyForService:](IMDChorosController, "outgoingSequenceNumberDefaultsKeyForService:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = IMGetDomainIntForKey();
    v16 = v15 + 0x2000;
    if (v15 >= -1)
      v16 = v15 + 1;
    a3 = v16 >> 13;

    +[IMDChorosController outgoingSequenceNumberDefaultsKeyForService:](IMDChorosController, "outgoingSequenceNumberDefaultsKeyForService:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetDomainIntForKey();

    v13 = v24;
  }
  if (v13)
    v18 = v13;
  else
    v18 = CFSTR("Are you still breathing?");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E00]), "initWithConversationID:sequenceNum:emergencyText:error:", v11, a3, v18, 0);
  +[IMDChorosController chatIdentifierForEmergency](IMDChorosController, "chatIdentifierForEmergency");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "conversationID");
  v22 = objc_msgSend(v19, "sequenceNum");
  objc_msgSend(v19, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChorosController _processReceivedTextMessageForService:chatIdentifier:conversationID:sequenceNum:text:](self, "_processReceivedTextMessageForService:chatIdentifier:conversationID:sequenceNum:text:", 1, v20, v21, v22, v23);

}

+ (id)chatIdentifierForEmergency
{
  return (id)*MEMORY[0x1E0D39290];
}

+ (id)chatIdentifierForRoadside:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lld"), *MEMORY[0x1E0D39298], a3);
}

+ (id)roadsideProviderIDFromChatIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (+[IMDChorosController serviceFromChatIdentifier:](IMDChorosController, "serviceFromChatIdentifier:", v3) == 8)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "count") >= 3)
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberFromString:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)roadsideProviderForProviderId:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v13;

  v4 = objc_alloc(MEMORY[0x1E0CA6E38]);
  v5 = (void *)objc_msgSend(v4, "initWithQueue:", MEMORY[0x1E0C80D38]);
  v6 = (void *)objc_opt_new();
  v13 = 0;
  objc_msgSend(v5, "fetchRoadsideProvidersWithContext:error:", v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (v8)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1D166B5F8();
  }
  else
  {
    if (v7)
    {
      objc_msgSend(v7, "providers");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1D166B5CC();
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (id)roadsideProviderForChatIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    +[IMDChorosController roadsideProviderIDFromChatIdentifier:](IMDChorosController, "roadsideProviderIDFromChatIdentifier:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      -[IMDChorosController roadsideProviderForProviderId:](self, "roadsideProviderForProviderId:", objc_msgSend(v4, "integerValue"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (int64_t)serviceFromChatIdentifier:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((IMIsStringStewieEmergency() & 1) != 0)
  {
    v4 = 1;
  }
  else if (IMIsStringStewieRoadside())
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_createChatIfNecessary:(id)a3 chatIdentifier:(id)a4 service:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[4];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "existingChatForID:account:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = CFSTR("YES");
      if (!v12)
        v15 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v28 = v9;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Found existing Stewie %@ chat: %@", buf, 0x16u);
    }

  }
  if (!v12)
  {
    v16 = *MEMORY[0x1E0D36D90];
    v25[0] = *MEMORY[0x1E0D36C20];
    v25[1] = v16;
    v26[0] = &unk_1E9271578;
    v26[1] = v9;
    v17 = *MEMORY[0x1E0D36D68];
    v25[2] = *MEMORY[0x1E0D36E10];
    v25[3] = v17;
    v26[2] = v9;
    v26[3] = CFSTR("us");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didJoinChat:style:displayName:groupID:originalGroupID:handleInfo:category:spamExtensionName:", v9, 45, 0, 0, 0, v19, 0, 0);
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "existingChatWithIdentifier:account:", v9, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "updateIsEmergencyChat:", a5 == 1);
    objc_msgSend(v22, "updateIsFiltered:", 0);
    -[IMDChorosController updateChatPropertiesIfRequiredForChat:service:](self, "updateChatPropertiesIfRequiredForChat:service:", v22, a5);

  }
  return v12 == 0;
}

- (id)_simNumber
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ctPhoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "My CT Phone Number from subscription context is: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  IMNormalizePhoneNumber();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "My CT SIM Phone Number is: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

- (void)_openStewieChatWithChatIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = a3;
  if (qword_1EFC63E10 != -1)
    dispatch_once(&qword_1EFC63E10, &unk_1E922D0F0);
  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anySessionForServiceName:", *MEMORY[0x1E0D38F58]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "existingChatWithIdentifier:account:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = IMOSLoggingEnabled(v9);
  if (v8)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Found an emergency chat, launching messages", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sms://open?groupid=%@"), v3);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "No emergency chat found, launching Messages to conversation list", v16, 2u);
      }

    }
    v12 = CFSTR("sms://compose=false");
  }
  objc_msgSend((id)qword_1EFC63E08, "defaultWorkspace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "openURL:configuration:completionHandler:", v15, 0, 0);

}

- (BOOL)isStewieActive
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stewieEnabled");

  if (!v4)
    return 0;
  -[CTStewieDataClient getState](self->_coreTelephonyStewieClient, "getState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1;
  if ((objc_msgSend(v5, "isActiveService:", 1) & 1) == 0)
    v6 = objc_msgSend(v5, "isActiveService:", 8);

  return v6;
}

- (BOOL)isSatelliteConnectionActive
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  char v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (!v4)
    return 0;
  if ((IMGetCachedDomainBoolForKeyWithDefaultValue() & 1) != 0)
    return 1;
  -[CTStewieDataClient getState](self->_coreTelephonyStewieClient, "getState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "activeServices");
  v8 = objc_msgSend(v6, "transportType");
  v5 = (v7 & 0x39) != 0 && v8 == 1;

  return v5;
}

- (BOOL)isLiteMessageActiveOverSatellite
{
  void *v3;
  int v4;
  char v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (!v4)
    return 0;
  if ((IMGetCachedDomainBoolForKeyWithDefaultValue() & 1) != 0)
    return 1;
  -[CTStewieDataClient getState](self->_coreTelephonyStewieClient, "getState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isActiveService:", 16))
    v5 = objc_msgSend(v6, "isStewieActiveOverBB");
  else
    v5 = 0;

  return v5;
}

- (id)_generateStopTranscriptSharingStatusItemForChat:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
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
  NSObject *v20;
  uint8_t v22[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    if (!IMOSLoggingEnabled(0))
    {
LABEL_14:
      v17 = 0;
      goto LABEL_15;
    }
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "generateStopTranscriptSharingStatusItemForChat passed a nil chat, early returning nil", buf, 2u);
    }
LABEL_13:

    goto LABEL_14;
  }
  v5 = objc_msgSend(v3, "isStewieEmergencyChat");
  if ((v5 & 1) == 0)
  {
    IMLogHandleForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1D166B65C(v4, v20);
    goto LABEL_13;
  }
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Generating a Stewie stop sharing item", v22, 2u);
    }

  }
  v7 = objc_alloc(MEMORY[0x1E0D39B60]);
  +[IMDChorosController chatIdentifierForEmergency](IMDChorosController, "chatIdentifierForEmergency");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithSender:time:guid:type:", v8, v9, v10, 7);

  objc_msgSend(v11, "setService:", *MEMORY[0x1E0D38F58]);
  objc_msgSend(v4, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccountID:", v13);

  objc_msgSend(v4, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "loginID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccount:", v15);

  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "storeItem:forceReplace:", v11, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "guid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addMessageWithGUID:toChat:", v19, v4);

LABEL_15:
  return v17;
}

- (id)_generateLocationUpdateSentStatusItemForChat:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
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
  NSObject *v19;
  uint8_t v21[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = IMOSLoggingEnabled(v3);
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Generating a Stewie location update item", v21, 2u);
      }

    }
    v6 = objc_alloc(MEMORY[0x1E0D398D0]);
    objc_msgSend(v3, "chatIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithSender:time:guid:type:", v7, v8, v9, 8);

    objc_msgSend(v10, "setService:", *MEMORY[0x1E0D38F58]);
    objc_msgSend(v3, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccountID:", v12);

    objc_msgSend(v3, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loginID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccount:", v14);

    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "storeItem:forceReplace:", v10, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "guid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addMessageWithGUID:toChat:", v18, v3);

  }
  else
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "generateLocationUpdateSentStatusItemForChat passed a nil chat, early returning nil", buf, 2u);
      }

    }
    v16 = 0;
  }

  return v16;
}

- (id)conversationIDToConversationUUIDMapForService:(int64_t)a3
{
  void *v3;
  void *v4;

  +[IMDChorosController conversationIDToUUIDsDefaultsKeyForService:](IMDChorosController, "conversationIDToUUIDsDefaultsKeyForService:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMGetCachedDomainValueForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setConversationIDToConversationUUIDMap:(id)a3 forService:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  +[IMDChorosController conversationIDToUUIDsDefaultsKeyForService:](IMDChorosController, "conversationIDToUUIDsDefaultsKeyForService:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

}

- (id)_stringKeyForConversationID:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
}

- (id)conversationUUIDForConversationID:(int64_t)a3 service:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[IMDChorosController _stringKeyForConversationID:](self, "_stringKeyForConversationID:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDChorosController conversationIDToConversationUUIDMapForService:](self, "conversationIDToConversationUUIDMapForService:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || (v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v9)) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(-[IMDChorosController setConversationUUID:forConversationID:service:](self, "setConversationUUID:forConversationID:service:", v10, a3, a4)))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v12;
        v16 = 2112;
        v17 = v7;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "No existing conversationUUID for conversationID %@ (key %@), assigning %@", (uint8_t *)&v14, 0x20u);

      }
    }
  }

  return v10;
}

- (void)setConversationUUID:(id)a3 forConversationID:(int64_t)a4 service:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[IMDChorosController conversationIDToConversationUUIDMapForService:](self, "conversationIDToConversationUUIDMapForService:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = v12;

  -[IMDChorosController _stringKeyForConversationID:](self, "_stringKeyForConversationID:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, v14);

  if (IMOSLoggingEnabled(-[IMDChorosController setConversationIDToConversationUUIDMap:forService:](self, "setConversationIDToConversationUUIDMap:forService:", v13, a5)))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v8;
      v20 = 2112;
      v21 = v17;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Assigning conversationUUID %@ to conversationID %@ (key %@)", (uint8_t *)&v18, 0x20u);

    }
  }

}

- (void)connectedServicesChanged:(int64_t)a3
{
  NSObject *v4;
  int v5;
  int64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 134217984;
      v6 = a3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Connected services: %ld", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)stateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Stewie state changed to: %@", buf, 0xCu);
    }

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "satelliteStateDidChange:", -[IMDChorosController isSatelliteConnectionActive](self, "isSatelliteConnectionActive", (_QWORD)v13));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (-[IMDChorosController isSatelliteConnectionActive](self, "isSatelliteConnectionActive")
    && !-[IMDChorosController wasLastStateSatelliteConnectionActive](self, "wasLastStateSatelliteConnectionActive"))
  {
    -[IMDChorosController setWasLastStateSatelliteConnectionActive:](self, "setWasLastStateSatelliteConnectionActive:", 1);
    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInteger:forKey:", 0, *MEMORY[0x1E0D39448]);

    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInteger:forKey:", 0, *MEMORY[0x1E0D38C08]);

  }
  else
  {
    -[IMDChorosController setWasLastStateSatelliteConnectionActive:](self, "setWasLastStateSatelliteConnectionActive:", 0, (_QWORD)v13);
  }

}

- (void)messageReceived:(id)a3 withMetadata:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t isKindOfClass;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  NSObject *v29;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "stewieEnabled");

  if (v12)
  {
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Received message from Stewie", buf, 2u);
      }

    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      if (IMOSLoggingEnabled(isKindOfClass))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Processing received Stewie emergency message", buf, 2u);
        }

      }
      v17 = v8;
      if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
      {
        +[IMDChorosController chatIdentifierForEmergency](IMDChorosController, "chatIdentifierForEmergency");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[NSObject conversationID](v17, "conversationID");
        v20 = -[NSObject sequenceNum](v17, "sequenceNum");
        -[NSObject text](v17, "text");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDChorosController _processReceivedTextMessageForService:chatIdentifier:conversationID:sequenceNum:text:](self, "_processReceivedTextMessageForService:chatIdentifier:conversationID:sequenceNum:text:", 1, v18, v19, v20, v21);

      }
      else
      {
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = sub_1D1554FF0;
        v28[3] = &unk_1E9228750;
        v28[4] = self;
        v17 = v17;
        v29 = v17;
        dispatch_sync(MEMORY[0x1E0C80D38], v28);

      }
    }
    else
    {
      objc_opt_class();
      v22 = objc_opt_isKindOfClass();
      if ((v22 & 1) != 0)
      {
        if (IMOSLoggingEnabled(v22))
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Processing received Stewie Roadside Text Message", buf, 2u);
          }

        }
        v24 = v8;
        dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
        +[IMDChorosController chatIdentifierForRoadside:](IMDChorosController, "chatIdentifierForRoadside:", objc_msgSend(v24, "providerId"));
        v17 = objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "conversationID");
        v26 = objc_msgSend(v24, "sequenceNum");
        objc_msgSend(v24, "text");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        -[IMDChorosController _processReceivedTextMessageForService:chatIdentifier:conversationID:sequenceNum:text:](self, "_processReceivedTextMessageForService:chatIdentifier:conversationID:sequenceNum:text:", 8, v17, v25, v26, v27);
      }
      else
      {
        IMLogHandleForCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_1D166B6E0((uint64_t)v8, v17);
      }
    }

    v10[2](v10);
  }

}

- (void)addObserver:(id)a3
{
  if (a3)
    -[NSMutableSet addObject:](self->_observers, "addObject:");
}

- (void)setStewieActive:(BOOL)a3
{
  self->_stewieActive = a3;
}

- (void)setSatelliteConnectionActive:(BOOL)a3
{
  self->_satelliteConnectionActive = a3;
}

- (void)setLiteMessageActiveOverSatellite:(BOOL)a3
{
  self->_liteMessageActiveOverSatellite = a3;
}

- (CTStewieDataClient)coreTelephonyStewieClient
{
  return self->_coreTelephonyStewieClient;
}

- (void)setCoreTelephonyStewieClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyStewieClient, a3);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)wasLastStateSatelliteConnectionActive
{
  return self->_wasLastStateSatelliteConnectionActive;
}

- (void)setWasLastStateSatelliteConnectionActive:(BOOL)a3
{
  self->_wasLastStateSatelliteConnectionActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_coreTelephonyStewieClient, 0);
}

@end
