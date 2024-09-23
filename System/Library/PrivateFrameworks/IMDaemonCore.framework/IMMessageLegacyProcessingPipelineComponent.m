@implementation IMMessageLegacyProcessingPipelineComponent

- (IMMessageLegacyProcessingPipelineComponent)initWithIDSTrustedData:(id)a3 messageContext:(id)a4 idsService:(id)a5
{
  id v9;
  id v10;
  id v11;
  IMMessageLegacyProcessingPipelineComponent *v12;
  IMMessageLegacyProcessingPipelineComponent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMMessageLegacyProcessingPipelineComponent;
  v12 = -[IMMessageLegacyProcessingPipelineComponent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_idsTrustedData, a3);
    objc_storeStrong(&v13->_messageContext, a4);
    objc_storeStrong((id *)&v13->_idsService, a5);
  }

  return v13;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id messageContext;
  BOOL v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  IDSService *idsService;
  char v56;
  char v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  unsigned int v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v79[5];
  id v80;
  id v81;
  BOOL v82;
  uint8_t buf[4];
  id v84;
  __int16 v85;
  const __CFString *v86;
  __int16 v87;
  const __CFString *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "messageItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "guid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v7;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "<IMMessageLegacyProcessingPipelineComponent> Started processing for Message: %@", buf, 0xCu);

    }
  }
  objc_msgSend(v3, "messageItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") == 0;

  if (v9)
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "<IMMessageLegacyProcessingPipelineComponent> Failed to find any message items", buf, 2u);
      }

    }
    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 10, 0);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v11);
  }
  else
  {
    objc_msgSend(v3, "serviceSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "chat");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v76 && IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "<IMMessageLegacyProcessingPipelineComponent> No chat found, going to create one later", buf, 2u);
        }

      }
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "GUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "messageWithGUID:", v14);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v75, "isFinished")
        && !(v15 = -[IMMessageLegacyProcessingPipelineComponent _shouldUpgradeExistingMessage:input:](self, "_shouldUpgradeExistingMessage:input:", v75, v3)))
      {
        if (IMOSLoggingEnabled(v15))
        {
          OSLogHandleForIMFoundationCategory();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v3, "GUID");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v84 = v44;
            _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "*** Bailing, we already had a finished message for this in the database (%@). ***", buf, 0xCu);

          }
        }
        im_checkpointIDSService();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "GUID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "wantsCheckpointing");
        im_sendMessageCheckpointIfNecessary();

        objc_msgSend(v76, "isBlackholed");
        if (objc_msgSend(v3, "wantsDeliveryReceipt"))
        {
          objc_msgSend(v3, "GUID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "wantsDeliveryReceipt");
          v48 = im_sendCertifiedDeliveryReceiptIfPossible();

          if ((v48 & 1) == 0)
          {
            if (IMOSLoggingEnabled(v49))
            {
              OSLogHandleForIMFoundationCategory();
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v50, OS_LOG_TYPE_INFO, "Wanted to send a delivery receipt, but failed to send a certified delivery receipt. This should be ok because this was a message redelivery though.", buf, 2u);
              }

            }
          }
        }
        if (objc_msgSend(v3, "isLastFromStorage"))
        {
          +[IMDMessageFromStorageController iMessageStorageController](IMDMessageFromStorageController, "iMessageStorageController");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "noteLastItemProcessed");

        }
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v3);
      }
      else
      {
        objc_msgSend(v3, "messageItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastObject");
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "accountID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "accountForAccountID:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v68 = v19;
        }
        else
        {
          objc_msgSend(v3, "account");
          v68 = (id)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v3, "fromIdentifier");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "toIdentifier");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v3, "isFromMe");
        v70 = objc_msgSend(v3, "isFromStorage");
        v57 = objc_msgSend(v3, "isLastFromStorage");
        v26 = objc_msgSend(v3, "wantsDeliveryReceipt");
        v56 = objc_msgSend(v3, "wantsCheckpointing");
        objc_msgSend(v3, "participantIdentifiers");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "groupID");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "currentGroupName");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "groupPhotoCreationTime");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "availabilityVerificationRecipientChannelIDPrefix");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "availabilityVerificationRecipientEncryptionValidationToken");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "availabilityOffGridRecipientSubscriptionValidationToken");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "availabilityOffGridRecipientEncryptionValidationToken");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EFC8D600))
        {
          v27 = v3;
          if (IMOSLoggingEnabled(v27))
          {
            OSLogHandleForIMEventCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v27, "balloonPluginBundleID");
              v29 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "balloonPluginPayload");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "combinedPayloadAttachmentDictionary");
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = (void *)v31;
              v33 = CFSTR("YES");
              if (v30)
                v34 = CFSTR("YES");
              else
                v34 = CFSTR("NO");
              *(_DWORD *)buf = 138412802;
              v84 = v29;
              v86 = v34;
              v85 = 2112;
              if (!v31)
                v33 = CFSTR("NO");
              v87 = 2112;
              v88 = v33;
              _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Processing a balloon plugin payload (identifier: %@, payload: %@, combinedPayloadAttachmentDictionary: %@)", buf, 0x20u);

            }
          }
          objc_msgSend(v27, "combinedPayloadAttachmentDictionary");
          v60 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v60 = 0;
        }
        v71 = objc_alloc_init(MEMORY[0x1E0D35A10]);
        objc_msgSend(v3, "groupParticipantVersion");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "requestGroupPhotoIfNecessary:incomingParticipantVersion:incomingGroupPhotoCreationTime:toIdentifier:fromIdentifier:messageIsFromStorage:", v76, objc_msgSend(v35, "integerValue"), v69, v73, v72, v70);

        -[IMDiMessageIDSTrustedData fromToken](self->_idsTrustedData, "fromToken");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDiMessageIDSTrustedData fromPushID](self->_idsTrustedData, "fromPushID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "inlineAttachmentsDictionary");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "attributionInfoArray");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "nicknameDictionary");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        idsService = self->_idsService;
        messageContext = self->_messageContext;
        LOBYTE(v35) = -[IMDiMessageIDSTrustedData isFromTrustedSender](self->_idsTrustedData, "isFromTrustedSender");
        v42 = -[IMDiMessageIDSTrustedData isFromSnapTrustedSender](self->_idsTrustedData, "isFromSnapTrustedSender");
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = sub_1D14D6834;
        v79[3] = &unk_1E922BA10;
        v79[4] = self;
        v80 = v3;
        v82 = v76 != 0;
        v81 = v71;
        BYTE1(v54) = v42;
        LOBYTE(v54) = (_BYTE)v35;
        BYTE4(v53) = v56;
        BYTE3(v53) = 0;
        BYTE2(v53) = v70;
        BYTE1(v53) = v57;
        LOBYTE(v53) = v58;
        objc_msgSend(v11, "_blastDoorProcessingWithIMMessageItem:chat:account:fromToken:fromIDSID:fromIdentifier:toIdentifier:participants:groupName:groupID:isFromMe:isLastFromStorage:isFromStorage:hideLockScreenNotification:wantsCheckpointing:needsDeliveryReceipt:messageBalloonPayloadAttachmentDictionary:inlineAttachments:attributionInfoArray:nicknameDictionary:availabilityVerificationRecipientChannelIDPrefix:availabilityVerificationRecipientEncryptionValidationToken:availabilityOffGridRecipientSubscriptionValidationToken:availabilityOffGridRecipientEncryptionValidationToken:idsService:messageContext:isFromTrustedSender:isFromSnapTrustedSender:completionBlock:", v74, v76, v68, v36, v37, v73, v72, v67, v65, v66, v53, v38,
          v60,
          v39,
          v59,
          v40,
          v64,
          v63,
          v62,
          v61,
          idsService,
          messageContext,
          v54,
          v79);

        v23 = v71;
      }

    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "<IMMessageLegacyProcessingPipelineComponent> Failed to find service session", buf, 2u);
        }

      }
      v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v77 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 1, 0);
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v77);

    }
  }

  return v23;
}

- (void)_updateChatForInput:(id)a3 hadChat:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "setHadChat:", v4);
  if (!v4)
  {
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "participantIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 < 3)
    {
      objc_msgSend(v5, "fromDisplayID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "existingChatForID:account:", v13, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "replicationSourceServiceName");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = (void *)*MEMORY[0x1E0D38F68];
      if (v9)
        v11 = (void *)v9;
      v12 = v11;

      objc_msgSend(v5, "fromIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "toIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentGroupName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "participantIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_IDsFromURIs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMFindChatProcessingPipelineComponent findGroupChatWithFromIdentifier:toIdentifier:groupName:participants:groupID:serviceName:chatRegistry:](IMFindChatProcessingPipelineComponent, "findGroupChatWithFromIdentifier:toIdentifier:groupName:participants:groupID:serviceName:chatRegistry:", v13, v14, v15, v17, v18, v12, v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v19)
    {
      if (IMOSLoggingEnabled(objc_msgSend(v5, "setChat:", v19)))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v19;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Chat set: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      IMLogHandleForCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1D16691C4(v21);

    }
  }

}

- (BOOL)_shouldUpgradeExistingMessage:(id)a3 input:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v5 = a3;
  objc_msgSend(a4, "replicationSourceServiceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isScheduledMessagesEnabled")
    && objc_msgSend(v5, "scheduleType") == 2
    && objc_msgSend(v5, "scheduleState") != 0;

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v5, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 |= objc_msgSend(v9, "isEqualToString:", v6);

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong(&self->_messageContext, 0);
  objc_storeStrong((id *)&self->_idsTrustedData, 0);
}

@end
