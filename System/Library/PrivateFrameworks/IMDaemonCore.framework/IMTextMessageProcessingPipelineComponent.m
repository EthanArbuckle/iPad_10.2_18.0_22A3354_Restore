@implementation IMTextMessageProcessingPipelineComponent

- (IMTextMessageProcessingPipelineComponent)initWithMessageStore:(id)a3
{
  id v5;
  IMTextMessageProcessingPipelineComponent *v6;
  IMTextMessageProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMTextMessageProcessingPipelineComponent;
  v6 = -[IMTextMessageProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_messageStore, a3);

  return v7;
}

- (unint64_t)computeFlagsForInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  _BOOL8 v9;
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  char v19;
  int v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  if (objc_msgSend(v4, "isFromMe"))
  {
    v31[3] |= 0x8004uLL;
    objc_msgSend(v4, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "style") == 45)
    {

    }
    else
    {
      objc_msgSend(v4, "participantIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (unint64_t)objc_msgSend(v6, "count") < 3;

      if (!v7)
        goto LABEL_6;
    }
    v31[3] |= 0x1000uLL;
  }
LABEL_6:
  objc_msgSend(v4, "GUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IMDMessageStore popReadReceiptForMissingGUID:](self->_messageStore, "popReadReceiptForMissingGUID:", v8);
  if (v9)
  {
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v8;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Message guid was in readReceiptsForMissingMessage cache: %@", buf, 0xCu);
      }

    }
    v11 = v31;
    v12 = v31[3] | 0x2000;
    v31[3] = v12;
  }
  else
  {
    v11 = v31;
    v12 = v31[3];
  }
  v11[3] = v12 | 1;
  objc_msgSend(v4, "richBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  objc_msgSend(v4, "richBody");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D381F0];
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = sub_1D15682BC;
  v27 = &unk_1E922D778;
  v17 = v4;
  v28 = v17;
  v29 = &v30;
  objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v16, 0, v14, 0, &v24);

  if (objc_msgSend(v17, "isExpirable", v24, v25, v26, v27))
    v31[3] |= 0x1000000uLL;
  if (objc_msgSend(v17, "isAutoReply"))
    v31[3] |= 0x40uLL;
  if (objc_msgSend(v17, "wasDetonated"))
    v31[3] |= 0x1000000000uLL;
  if (objc_msgSend(v17, "isSOS"))
    v31[3] |= 0x8000000000uLL;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isSOSAlertingEnabled");

  if ((v19 & 1) != 0)
  {
    v20 = objc_msgSend(v17, "isCritical");
    v21 = v31;
    if (v20)
      v31[3] |= 0x4000000000uLL;
  }
  else
  {
    v21 = v31;
  }
  v22 = v21[3];

  _Block_object_dispose(&v30, 8);
  return v22;
}

- (id)createMessageItemWithInput:(id)a3
{
  id v4;
  unint64_t v5;
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
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "richBody");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMTextMessageProcessingPipelineComponent computeFlagsForInput:](self, "computeFlagsForInput:", v4);
  v6 = objc_alloc(MEMORY[0x1E0D39918]);
  objc_msgSend(v4, "fromIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_stripFZIDPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__im_iMessageDateFromTimeStamp:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileTransferGUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "GUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadIdentifierGUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v6, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", v8, v11, v25, 0, v12, v5, 0, v13, v14);

  objc_msgSend(v4, "plainTextSubject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSubject:", v16);

  objc_msgSend(v4, "messageSummaryInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMessageSummaryInfo:", v17);

  objc_msgSend(v4, "expressiveSendStyleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setExpressiveSendStyleID:", v18);

  objc_msgSend(v4, "replicatedFallbackGUIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setReplicatedFallbackGUIDs:", v19);

  if (objc_msgSend(v4, "scheduleType") == 2 && objc_msgSend(v15, "isFromMe"))
  {
    objc_msgSend(v15, "setScheduleType:", objc_msgSend(v4, "scheduleType"));
    objc_msgSend(v15, "setScheduleState:", 2);
    objc_msgSend(v4, "scheduledDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTime:", v20);

  }
  v21 = objc_msgSend(v15, "wasDetonated");
  if ((_DWORD)v21 && IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "guid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v23;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "createMessageItemWithInput created a detonated message for guid: %@", buf, 0xCu);

    }
  }

  return v15;
}

- (id)_findAssociatedMessagePartTextForMessageItem:(id)a3 associatedMessageItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v14[16];

  v6 = a3;
  v7 = a4;
  if (-[IMTextMessageProcessingPipelineComponent _shouldFindAssociatedMessagePartTextForMessageItem:](self, "_shouldFindAssociatedMessagePartTextForMessageItem:", v6))
  {
    objc_msgSend(v6, "associatedMessageGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      -[IMTextMessageProcessingPipelineComponent _messagePartMatchingAssociatedMessageGUID:associatedMessageItem:](self, "_messagePartMatchingAssociatedMessageGUID:associatedMessageItem:", v8, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "messagePartBody");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Do not need to find associatedMessagePartText for received associated message", v14, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (id)_findMessageItemForAssociatedMessageItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "associatedMessageGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    IMAssociatedMessageDecodeGUID();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDMessageStore messageWithGUID:](self->_messageStore, "messageWithGUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_messagePartMatchingAssociatedMessageGUID:(id)a3 associatedMessageItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t v34[16];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    IMAssociatedMessageDecodeGUID();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = IMAssociatedMessageDecodePartIndex();
    if (objc_msgSend(v7, "length"))
    {
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v6, "messageParts");
        v9 = objc_claimAutoreleasedReturnValue();
        if ((unint64_t)-[NSObject count](v9, "count") < 2)
        {
          if (-[NSObject count](v9, "count") == 1)
          {
            -[NSObject firstObject](v9, "firstObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

            goto LABEL_20;
          }
          IMLogHandleForCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            sub_1D166B8EC(v10, v26, v27, v28, v29, v30, v31, v32);
        }
        else
        {
          IMLogHandleForCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            sub_1D166B8BC(v10, v11, v12, v13, v14, v15, v16, v17);
        }

      }
      else
      {
        objc_msgSend(v6, "messagePartMatchingPartIndex:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
LABEL_20:

          goto LABEL_21;
        }
        IMLogHandleForCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v34 = 0;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Could not find message part matching message part index, possibly retracted part or malformed", v34, 2u);
        }
      }
    }
    else
    {
      IMLogHandleForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1D166B88C(v9, v19, v20, v21, v22, v23, v24, v25);
    }
    v18 = 0;
    goto LABEL_19;
  }
  v18 = 0;
LABEL_21:

  return v18;
}

- (BOOL)_shouldFindAssociatedMessagePartTextForMessageItem:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "messageSummaryInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__im_associatedMessageContentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5 == 1;
}

- (void)_configureAccountForMessageItem:(id)a3 input:(id)a4
{
  id v5;
  void *v6;
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
  id v19;

  v19 = a3;
  v5 = a4;
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccountID:", v7);

  objc_msgSend(v6, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setService:", v9);

  objc_msgSend(v6, "loginID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccount:", v11);

  objc_msgSend(v5, "toIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_stripFZIDPrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDestinationCallerID:", v13);

  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replicationSourceServiceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serviceWithName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "serviceProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D38FD0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = objc_msgSend(v5, "isFromMe");
  if ((_DWORD)v14 && objc_msgSend(v18, "containsObject:", *MEMORY[0x1E0D38F68]))
    objc_msgSend(v19, "setNeedsRepeatForRelayReplication:", 1);

}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  IMDMessageStore *messageStore;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_opt_class();
      objc_msgSend(v4, "GUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v39 = v6;
      v40 = 2112;
      v41 = v7;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "<%@> Started processing for Message GUID: %@", buf, 0x16u);

    }
  }
  objc_msgSend(v4, "fromIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") == 0;

  if (v9)
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "<IMTextMessageProcessingPipelineComponent> Failed to find fromIdentifier", buf, 2u);
      }

    }
    goto LABEL_19;
  }
  objc_msgSend(v4, "toIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length") == 0;

  if (v12)
  {
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "<IMTextMessageProcessingPipelineComponent> Failed to find toIdentifier", buf, 2u);
      }

    }
LABEL_19:
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = (void *)objc_msgSend(v32, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 7, 0);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v22);
LABEL_27:
    v30 = (void *)v33;
    goto LABEL_28;
  }
  objc_msgSend(v4, "associatedMessageGUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_26;
  objc_msgSend(v4, "associatedMessageGUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "GUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if ((v17 & 1) != 0)
    goto LABEL_26;
  messageStore = self->_messageStore;
  objc_msgSend(v4, "associatedMessageGUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDMessageStore sortedMessageItemsWithFallbackHash:inChat:limit:](messageStore, "sortedMessageItemsWithFallbackHash:inChat:limit:", v19, v20, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "service");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D38F70]);

  if (!(_DWORD)v20)
  {

LABEL_26:
    -[IMTextMessageProcessingPipelineComponent createMessageItemWithInput:](self, "createMessageItemWithInput:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTextMessageProcessingPipelineComponent _configureAccountForMessageItem:input:](self, "_configureAccountForMessageItem:input:", v22, v4);
    v37 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMessageItems:", v35);

    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
    goto LABEL_27;
  }
  if (IMOSLoggingEnabled(v24))
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "associatedMessageGUID");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "GUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v39 = (uint64_t)v26;
      v40 = 2112;
      v41 = v27;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "<IMTextMessageProcessingPipelineComponent> Found associated GUID %@ for %@. Cross Service Association message has already binded this message to an IML. Dropping.", buf, 0x16u);

    }
  }
  v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v29 = (void *)objc_msgSend(v28, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 24, 0);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v29);

LABEL_28:
  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
