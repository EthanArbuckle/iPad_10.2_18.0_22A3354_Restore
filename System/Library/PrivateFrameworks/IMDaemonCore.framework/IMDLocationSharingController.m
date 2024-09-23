@implementation IMDLocationSharingController

+ (id)sharedInstance
{
  if (qword_1ED935CE8 != -1)
    dispatch_once(&qword_1ED935CE8, &unk_1E922D1B0);
  return (id)qword_1ED935E20;
}

- (IMDLocationSharingController)init
{
  IMDLocationSharingController *v2;
  IMDLocationSharingController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMDLocationSharingController;
  v2 = -[IMDLocationSharingController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IMDLocationSharingController _initializeFindMySessionIfInAllowedProcess](v2, "_initializeFindMySessionIfInAllowedProcess");
  return v3;
}

- (void)_initializeFindMySessionIfInAllowedProcess
{
  char v3;
  int v4;
  int v5;
  objc_class *v6;
  NSObject *v7;
  FindMyLocateSession *fmlSession;
  const char *v9;
  NSObject *v10;
  objc_class *v11;
  FMFSession *v12;
  FMFSession *session;
  int v14;
  FindMyLocateSession *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown");
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"), "isWaldoEnabled");
  if ((IMIsRunningInImagent() & 1) != 0)
  {
    v5 = 1;
    if ((v3 & 1) != 0)
    {
LABEL_11:
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1D166B764(v10);
      return;
    }
  }
  else
  {
    v5 = IMIsRunningInMessagesUIProcess();
    if ((v3 & 1) != 0)
      goto LABEL_11;
  }
  if (!(v4 ^ 1 | v5))
    goto LABEL_11;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"), "isFindMyLocateSessionEnabled"))
  {
    v6 = (objc_class *)MEMORY[0x1D17EA3EC](CFSTR("FindMyLocateSession"), CFSTR("FindMyLocateObjCWrapper"));
    if (v6)
    {
      self->_fmlSession = (FindMyLocateSession *)objc_alloc_init(v6);
      if (IMOSLoggingEnabled(-[IMDLocationSharingController _configureFindMyLocateSession](self, "_configureFindMyLocateSession")))
      {
        v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          fmlSession = self->_fmlSession;
          v14 = 138412290;
          v15 = fmlSession;
          v9 = "Configured FindMyLocate Session: %@";
LABEL_17:
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
  else
  {
    v11 = (objc_class *)MEMORY[0x1D17EA3EC](CFSTR("FMFSession"), CFSTR("FMF"));
    if (v11)
    {
      v12 = (FMFSession *)objc_msgSend([v11 alloc], "initWithDelegate:", self);
      self->_session = v12;
      if (IMOSLoggingEnabled(-[FMFSession setDelegateQueue:](v12, "setDelegateQueue:", objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue"))))
      {
        v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          session = self->_session;
          v14 = 138412290;
          v15 = session;
          v9 = "Configured FMF Session: %@";
          goto LABEL_17;
        }
      }
    }
  }
}

- (void)_configureFindMyLocateSession
{
  -[IMDLocationSharingController _setUpFindMyLocateSessionCallbacks](self, "_setUpFindMyLocateSessionCallbacks");
  MEMORY[0x1E0DE7D20](self, sel__startFMLSessionMonitoring);
}

- (void)_setUpFindMyLocateSessionCallbacks
{
  FindMyLocateSession *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"), "isFindMyLocateSessionEnabled"))
  {
    location = 0;
    objc_initWeak(&location, self);
    v3 = -[IMDLocationSharingController fmlSession](self, "fmlSession");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = sub_1D1558F80;
    v4[3] = &unk_1E922D200;
    objc_copyWeak(&v5, &location);
    -[FindMyLocateSession setFriendshipUpdateCallback:](v3, "setFriendshipUpdateCallback:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_postFMLFriendshipChangeForHandleID:(id)a3 handleType:(int64_t)a4 updateType:(int64_t)a5 isFromMessages:(BOOL)a6
{
  uint64_t v6;
  uint64_t v7;

  if (a4 == 1)
  {
    if (a5 == 1 && !a6)
    {
      v6 = 1;
      goto LABEL_10;
    }
  }
  else if (!a4)
  {
    if (!a5)
    {
      v6 = 0;
      v7 = 1;
      goto LABEL_11;
    }
    if (a5 == 1 && !a6)
    {
      v6 = 0;
LABEL_10:
      v7 = 0;
LABEL_11:
      -[IMDLocationSharingController _generateLocationSharingItemWithHandleID:direction:action:](self, "_generateLocationSharingItemWithHandleID:direction:action:", a3, v6, v7);
    }
  }
}

- (void)_startFMLSessionMonitoring
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"), "isFindMyLocateSessionEnabled");
  if ((_DWORD)v3)
  {
    if (IMOSLoggingEnabled(v3))
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "_startFMLSessionMonitoring: kicking off initial updates.", v5, 2u);
      }
    }
    -[FindMyLocateSession startUpdatingFriendsWithInitialUpdates:completion:](-[IMDLocationSharingController fmlSession](self, "fmlSession"), "startUpdatingFriendsWithInitialUpdates:completion:", 0, &unk_1E922D220);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[FMFSession setDelegate:](self->_session, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)IMDLocationSharingController;
  -[IMDLocationSharingController dealloc](&v3, sel_dealloc);
}

+ (void)addLocationShareItemToMatchingChats:(id)a3
{
  uint64_t v4;

  if (objc_msgSend((id)objc_msgSend(a3, "sender"), "length"))
    v4 = objc_msgSend(a3, "sender");
  else
    v4 = objc_msgSend(a3, "otherHandle");
  objc_msgSend((id)objc_opt_class(), "_addLocationShareItemToMatchingChats:handleID:hasStoredItem:broadcastChanges:", a3, v4, 1, 0);
}

+ (void)_addLocationShareItemToMatchingChats:(id)a3 handleID:(id)a4 hasStoredItem:(BOOL)a5 broadcastChanges:(BOOL)a6
{
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  __int128 v35;
  _BOOL4 v36;
  _BOOL4 v38;
  id v39;
  NSArray *obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  const __CFString *v58;
  uint64_t v59;

  v36 = a6;
  v38 = a5;
  v59 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(a1))
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v52 = a3;
      if (v38)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      if (v36)
        v8 = CFSTR("YES");
      v53 = 2112;
      v54 = a4;
      v55 = 2112;
      v56 = v9;
      v57 = 2112;
      v58 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Going to add location item: %@ to the corresponding chats with handleID: %@ hasStoredItem: %@ broadcastChanges: %@", buf, 0x2Au);
    }
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = -[IMDChatRegistry chats](+[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance"), "chats");
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  v12 = v10;
  if (v10)
  {
    v13 = a3;
    if (!v38)
      v13 = 0;
    v39 = v13;
    v14 = *(_QWORD *)v46;
    *(_QWORD *)&v11 = 138412546;
    v35 = v11;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v46 != v14)
          objc_enumerationMutation(obj);
        v16 = *(__CFString **)(*((_QWORD *)&v45 + 1) + 8 * v15);
        v17 = -[__CFString style](v16, "style", v35);
        if ((_DWORD)v17 == 45)
        {
          v18 = (void *)-[__CFString serviceName](v16, "serviceName");
          v19 = objc_msgSend(v18, "isEqualToIgnoringCase:", *MEMORY[0x1E0D38F68]);
          if ((v19 & 1) != 0)
          {
            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            v20 = (void *)-[__CFString participants](v16, "participants");
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            if (v21)
            {
              v22 = *(_QWORD *)v42;
              while (2)
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v42 != v22)
                    objc_enumerationMutation(v20);
                  v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
                  v25 = objc_msgSend((id)objc_msgSend(v24, "ID"), "isEqualToIgnoringCase:", a4);
                  if ((_DWORD)v25)
                  {
                    v30 = IMOSLoggingEnabled(v25);
                    if ((_DWORD)v30)
                    {
                      v31 = OSLogHandleForIMFoundationCategory();
                      v30 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
                      if ((_DWORD)v30)
                      {
                        *(_DWORD *)buf = 138412802;
                        v52 = a4;
                        v53 = 2112;
                        v54 = v24;
                        v55 = 2112;
                        v56 = v16;
                        _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Found matching participant: %@<=>%@ in chat: %@", buf, 0x20u);
                      }
                    }
                    if (!v38)
                    {
                      if (IMOSLoggingEnabled(v30))
                      {
                        v32 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412290;
                          v52 = a3;
                          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Storing item: %@", buf, 0xCu);
                        }
                      }
                      v30 = -[IMDMessageStore storeItem:forceReplace:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "storeItem:forceReplace:", a3, 1);
                      v39 = (id)v30;
                    }
                    if (v39)
                    {
                      if (IMOSLoggingEnabled(v30))
                      {
                        v33 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = v35;
                          v52 = v39;
                          v53 = 2112;
                          v54 = v16;
                          _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Associating item: %@ to chat: %@", buf, 0x16u);
                        }
                      }
                      -[IMDChatRegistry addItem:toChat:](+[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance"), "addItem:toChat:", v39, v16);
                      if (v36)
                        objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForChatListenersUsingBlackholeRegistry:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForChatListenersUsingBlackholeRegistry:", -[__CFString isBlackholed](v16, "isBlackholed")), "account:chat:style:chatProperties:messageUpdated:", -[__CFString accountID](v16, "accountID"), -[__CFString chatIdentifier](v16, "chatIdentifier"), -[__CFString style](v16, "style"), 0, v39);
                    }
                    else
                    {
                      v39 = 0;
                    }
                    LOBYTE(v38) = 1;
                    goto LABEL_50;
                  }
                }
                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
                if (v21)
                  continue;
                break;
              }
            }
          }
          else if (IMOSLoggingEnabled(v19))
          {
            v29 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v16;
              v27 = v29;
              v28 = "Not sharing location with non-iMessage chat %@";
              goto LABEL_33;
            }
          }
        }
        else if (IMOSLoggingEnabled(v17))
        {
          v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v16;
            v27 = v26;
            v28 = "Not sharing location group chat %@";
LABEL_33:
            _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, v28, buf, 0xCu);
          }
        }
LABEL_50:
        ++v15;
      }
      while (v15 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      v12 = v10;
    }
    while (v10);
  }
  if (!v38 && IMOSLoggingEnabled(v10))
  {
    v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "No matching chat found, ignoring", buf, 2u);
    }
  }
}

- (void)_generateLocationSharingItemWithHandleID:(id)a3 direction:(int64_t)a4 action:(int64_t)a5
{
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D398C8]), "initWithSender:time:guid:type:", 0, 0, 0, 4);
  objc_msgSend(v8, "setStatus:", a5);
  objc_msgSend(v8, "setDirection:", a4);
  objc_msgSend(v8, "setService:", *MEMORY[0x1E0D38F68]);
  if (a4)
    objc_msgSend(v8, "setSender:", a3);
  else
    objc_msgSend(v8, "setOtherHandle:", a3);
  objc_msgSend((id)objc_opt_class(), "_addLocationShareItemToMatchingChats:handleID:hasStoredItem:broadcastChanges:", v8, a3, 0, 1);

}

- (void)didStartSharingMyLocationWithHandle:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "identifier");
  if (IMOSLoggingEnabled(v5))
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = a3;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Started location sharing to: %@ (%@)", (uint8_t *)&v7, 0x16u);
    }
  }
  -[IMDLocationSharingController _generateLocationSharingItemWithHandleID:direction:action:](self, "_generateLocationSharingItemWithHandleID:direction:action:", v5, 0, 0);
}

- (void)didStopSharingMyLocationWithHandle:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "identifier");
  if (IMOSLoggingEnabled(v5))
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = a3;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Stopped location sharing to: %@ (%@)", (uint8_t *)&v7, 0x16u);
    }
  }
  -[IMDLocationSharingController _generateLocationSharingItemWithHandleID:direction:action:](self, "_generateLocationSharingItemWithHandleID:direction:action:", v5, 0, 1);
}

- (void)didStartAbilityToGetLocationForHandle:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "identifier");
  if (IMOSLoggingEnabled(v5))
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = a3;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Received location sharing from: %@ (%@)", (uint8_t *)&v7, 0x16u);
    }
  }
  -[IMDLocationSharingController _generateLocationSharingItemWithHandleID:direction:action:](self, "_generateLocationSharingItemWithHandleID:direction:action:", v5, 1, 0);
}

- (void)didStopAbilityToGetLocationForHandle:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "identifier");
  if (IMOSLoggingEnabled(v4))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412546;
      v7 = a3;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Stopped location sharing from: %@ (%@)", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)sendMappingPacket:(id)a3 toHandle:(id)a4 account:(id)a5
{
  IMDServiceController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  _QWORD v21[8];
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (!IMOSLoggingEnabled(self))
      return;
    v16 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v22) = 0;
    v17 = "sendMappingPacket: packet is nil, bailing.";
LABEL_11:
    v18 = v16;
    v19 = 2;
LABEL_12:
    _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v22, v19);
    return;
  }
  v9 = +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v10 = -[IMDServiceController serviceWithName:](v9, "serviceWithName:", *MEMORY[0x1E0D38F68]);
  v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("1"), CFSTR("fV"), a3, CFSTR("offer-request"), 0);
  if (!v10)
  {
    if (!IMOSLoggingEnabled(v11))
      return;
    v16 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v22) = 0;
    v17 = "Missing iMessage service, cannot send Mapping packet";
    goto LABEL_11;
  }
  v12 = v11;
  v13 = -[IMDAccountController accountForAccountID:](+[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance"), "accountForAccountID:", a5);
  if (v13)
  {
    v14 = (void *)objc_msgSend(v13, "session");
    v15 = objc_msgSend(a4, "identifier");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1D155A110;
    v21[3] = &unk_1E922D248;
    v21[4] = v12;
    v21[5] = a4;
    v21[6] = self;
    v21[7] = a3;
    objc_msgSend(v14, "sendLocationSharingInfo:toID:completionBlock:", v12, v15, v21);
    return;
  }
  if (IMOSLoggingEnabled(0))
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v22 = 138412290;
      v23 = a4;
      v17 = "No active session found for mapping packet to handle: %@, bailing";
      v18 = v20;
      v19 = 12;
      goto LABEL_12;
    }
  }
}

- (void)didFailToHandleMappingPacket:(id)a3 error:(id)a4
{
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = a3;
      v9 = 2112;
      v10 = a4;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Failed to handle mapping packet %@ with error %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)receivedIncomingLocationSharePacket:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = a3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Received location share packet: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  v6 = objc_msgSend(a3, "objectForKey:", CFSTR("offer-request"));
  if (v6)
  {
    -[FMFSession receivedMappingPacket:completion:](self->_session, "receivedMappingPacket:completion:", v6, &unk_1E922D288);
  }
  else if (IMOSLoggingEnabled(0))
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Missing mapping packet...", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)_forwardMappingPacket:(id)a3 toID:(id)a4 account:(id)a5
{
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = a4;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Forwarding mapping packet to ID: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  v10 = (void *)MEMORY[0x1D17EA3EC](CFSTR("FMFHandle"), CFSTR("FMF"));
  if (v10)
    -[IMDLocationSharingController sendMappingPacket:toHandle:account:](self, "sendMappingPacket:toHandle:account:", a3, objc_msgSend(v10, "handleWithId:", a4), a5);
}

- (FindMyLocateSession)fmlSession
{
  return self->_fmlSession;
}

- (void)setFmlSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
