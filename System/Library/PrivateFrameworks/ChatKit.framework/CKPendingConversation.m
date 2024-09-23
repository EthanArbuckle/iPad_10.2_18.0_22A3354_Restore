@implementation CKPendingConversation

- (id)sendingService
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  -[CKConversation chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12.receiver = self;
    v12.super_class = (Class)CKPendingConversation;
    -[CKConversation sendingService](&v12, sel_sendingService);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v4;
    goto LABEL_6;
  }
  -[CKPendingConversation composeSendingService](self, "composeSendingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKPendingConversation composeSendingService](self, "composeSendingService");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v6 = 0;
LABEL_6:
  -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[CKPendingConversation previousSendingService](self, "previousSendingService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CKPendingConversation previousSendingService](self, "previousSendingService");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_msgSend(MEMORY[0x1E0D35918], "iMessageEnabledForSenderLastAddressedHandle:simID:", v7, v8) & 1) != 0)
        objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
      else
        objc_msgSend(MEMORY[0x1E0D35910], "smsService");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v10;
  }

  return v6;
}

- (id)serviceReachabilityContextForNewParticipants:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  -[CKConversation chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D35920], "sharedController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversation chat](self, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reachabilityContextForChat:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D39A30]);
  }
  -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_stripFZIDPrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSenderLastAddressedHandle:", v10);

  -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSenderLastAddressedSIMID:", v11);

  -[CKConversation chat](self, "chat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  else if (IMBagBoolValueWithDefault())
  {
    objc_msgSend(v8, "setIsForPendingConversation:", 1);
  }
  if (v3 && IMBagBoolValueWithDefault())
    objc_msgSend(v8, "setIsForPendingConversation:", 1);
  return v8;
}

- (IMServiceReachabilityContext)serviceReachabilityContext
{
  return (IMServiceReachabilityContext *)-[CKPendingConversation serviceReachabilityContextForNewParticipants:](self, "serviceReachabilityContextForNewParticipants:", 0);
}

- (void)refreshStatusForAddresses:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v8);
      if ((IMStringIsEmail() & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  -[CKConversation chat](self, "chat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shouldForceServerStatusRefresh");

  -[CKConversation lastAddressedHandle](self, "lastAddressedHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_stripFZIDPrefix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_bestGuessURI");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversation lastAddressedSIMID](self, "lastAddressedSIMID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Calling IMChatCalculateServiceForSendingNewComposeMaybeForce with last addressed handle %@ simID %@", buf, 0x16u);
    }

  }
  -[CKConversation chat](self, "chat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "receivedResponseForChat");

  -[CKConversation chat](self, "chat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversation forceMMS](self, "forceMMS");
  -[CKConversation chat](self, "chat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "isDowngraded");
  v22 = v7;
  v21 = v7;
  IMChatCalculateServiceForSendingNewComposeMaybeForce();

}

uint64_t __71__CKPendingConversation_refreshStatusForAddresses_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4, a5, a6);
  return result;
}

- (void)refreshStatusForAddresses:(id)a3 newParticipants:(BOOL)a4 availabilities:(id)a5 withCompletionBlock:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[CKPendingConversation serviceReachabilityContextForNewParticipants:](self, "serviceReachabilityContextForNewParticipants:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__CKPendingConversation_refreshStatusForAddresses_newParticipants_availabilities_withCompletionBlock___block_invoke;
  v17[3] = &unk_1E275A7D0;
  v19 = v10;
  v20 = v12;
  v18 = v11;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  objc_msgSend(v15, "refreshAvailabilityForRecipients:context:resultHandler:", v14, v13, v17);

}

void __102__CKPendingConversation_refreshStatusForAddresses_newParticipants_availabilities_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0D35910], "serviceWithName:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "resultsByAccountID", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "didCheckServer") & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "availabilitiesForRecipients:service:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D38F68]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (void)refreshStatusForAddresses:(id)a3 availabilities:(id)a4 withCompletionBlock:(id)a5
{
  -[CKPendingConversation refreshStatusForAddresses:newParticipants:availabilities:withCompletionBlock:](self, "refreshStatusForAddresses:newParticipants:availabilities:withCompletionBlock:", a3, 0, a4, a5);
}

- (void)refreshComposeSendingServiceForAddresses:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__CKPendingConversation_refreshComposeSendingServiceForAddresses_withCompletionBlock___block_invoke;
  v8[3] = &unk_1E274B6E8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[CKPendingConversation refreshStatusForAddresses:withCompletionBlock:](self, "refreshStatusForAddresses:withCompletionBlock:", a3, v8);

}

void __86__CKPendingConversation_refreshComposeSendingServiceForAddresses_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "composeSendingService");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setComposeSendingService:", v9);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v13;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "[Event] Updated composeSendingService to [%@] on CKPendingConversation.", (uint8_t *)&v16, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("CKConversationPreferredServiceChangedNotification"), *(_QWORD *)(a1 + 32), 0);

  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(uint64_t, id, id, uint64_t, uint64_t))(v15 + 16))(v15, v9, v10, a4, a5);

}

- (void)refreshComposeSendingServiceForAddresses:(id)a3 newParticipants:(BOOL)a4 availabilities:(id)a5 withCompletionBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __117__CKPendingConversation_refreshComposeSendingServiceForAddresses_newParticipants_availabilities_withCompletionBlock___block_invoke;
  v12[3] = &unk_1E274B6C0;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  -[CKPendingConversation refreshStatusForAddresses:newParticipants:availabilities:withCompletionBlock:](self, "refreshStatusForAddresses:newParticipants:availabilities:withCompletionBlock:", a3, v7, a5, v12);

}

void __117__CKPendingConversation_refreshComposeSendingServiceForAddresses_newParticipants_availabilities_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  objc_msgSend(*(id *)(a1 + 32), "composeSendingService");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "setComposeSendingService:", v11);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v15;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "[Event] Updated composeSendingService to [%@] on CKPendingConversation.", (uint8_t *)&v18, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("CKConversationPreferredServiceChangedNotification"), *(_QWORD *)(a1 + 32), 0);

  }
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, id, id, uint64_t, uint64_t, uint64_t))(v17 + 16))(v17, v11, v12, a4, a5, a6);

}

- (void)refreshComposeSendingServiceForAddresses:(id)a3 availabilities:(id)a4 withCompletionBlock:(id)a5
{
  -[CKPendingConversation refreshComposeSendingServiceForAddresses:newParticipants:availabilities:withCompletionBlock:](self, "refreshComposeSendingServiceForAddresses:newParticipants:availabilities:withCompletionBlock:", a3, 0, a4, a5);
}

- (id)uniqueIdentifier
{
  return CFSTR("Pending");
}

- (id)deviceIndependentID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKPendingConversation;
  -[CKConversation deviceIndependentID](&v8, sel_deviceIndependentID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CKConversation recipients](self, "recipients");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "defaultIMHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

+ (id)pendingConversationForHandle:(id)a3
{
  id v3;
  CKPendingConversation *v4;
  void *v5;
  CKPendingConversation *v6;

  v3 = a3;
  v4 = [CKPendingConversation alloc];
  objc_msgSend(MEMORY[0x1E0D35780], "pendingChatForHandle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CKConversation initWithChat:](v4, "initWithChat:", v5);
  -[CKPendingConversation setPendingChat:](v6, "setPendingChat:", 1);
  return v6;
}

- (BOOL)isAppleConversation
{
  void *v2;
  char v3;

  -[CKConversation businessHandle](self, "businessHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isApple");

  return v3;
}

- (BOOL)isMakoConversation
{
  void *v2;
  char v3;

  -[CKConversation businessHandle](self, "businessHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMako");

  return v3;
}

- (BOOL)noAvailableServices
{
  return self->_noAvailableServices;
}

- (void)setNoAvailableServices:(BOOL)a3
{
  self->_noAvailableServices = a3;
}

- (IMService)previousSendingService
{
  return (IMService *)objc_loadWeakRetained((id *)&self->_previousSendingService);
}

- (void)setPreviousSendingService:(id)a3
{
  objc_storeWeak((id *)&self->_previousSendingService, a3);
}

- (BOOL)pendingChat
{
  return self->_pendingChat;
}

- (void)setPendingChat:(BOOL)a3
{
  self->_pendingChat = a3;
}

- (IMService)composeSendingService
{
  return (IMService *)objc_loadWeakRetained((id *)&self->_composeSendingService);
}

- (void)setComposeSendingService:(id)a3
{
  objc_storeWeak((id *)&self->_composeSendingService, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_composeSendingService);
  objc_destroyWeak((id *)&self->_previousSendingService);
}

@end
