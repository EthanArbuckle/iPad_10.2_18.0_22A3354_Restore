@implementation IMBalloonPluginDataSource

- (IMBalloonPluginDataSource)initWithPluginPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  IMBalloonPluginDataSource *v9;
  uint64_t v10;
  NSString *bundleID;
  uint64_t v12;
  NSURL *url;
  uint64_t v14;
  DDScannerResult *dataDetectedResult;
  uint64_t v16;
  NSArray *consumedPayloads;
  void *v18;
  int v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v33[4];
  id v34;
  objc_super v35;
  _BYTE buf[12];
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  IMBalloonPluginDataSource *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "messageGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataDetectedResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IMBalloonPluginDataSource initWithMessageGUID:payload:dataDetectedResult:url:](self, "initWithMessageGUID:payload:dataDetectedResult:url:", v5, v6, v7, v8);

  if (v9
    || (v35.receiver = 0,
        v35.super_class = (Class)IMBalloonPluginDataSource,
        (v9 = -[IMBalloonPluginDataSource init](&v35, sel_init)) != 0))
  {
    -[IMBalloonPluginDataSource setPluginPayload:](v9, "setPluginPayload:", v4);
    objc_msgSend(v4, "pluginBundleID");
    v10 = objc_claimAutoreleasedReturnValue();
    bundleID = v9->_bundleID;
    v9->_bundleID = (NSString *)v10;

    objc_msgSend(v4, "url");
    v12 = objc_claimAutoreleasedReturnValue();
    url = v9->_url;
    v9->_url = (NSURL *)v12;

    objc_msgSend(v4, "dataDetectedResult");
    v14 = objc_claimAutoreleasedReturnValue();
    dataDetectedResult = v9->_dataDetectedResult;
    v9->_dataDetectedResult = (DDScannerResult *)v14;

    objc_msgSend(v4, "consumedSessionPayloads");
    v16 = objc_claimAutoreleasedReturnValue();
    consumedPayloads = v9->_consumedPayloads;
    v9->_consumedPayloads = (NSArray *)v16;

    objc_msgSend(v4, "pluginBundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D37588]);

    if (v19)
      -[IMBalloonPluginDataSource _updateTemporaryAttachmentURLsForPluginPayload](v9, "_updateTemporaryAttachmentURLsForPluginPayload");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = (id)objc_opt_class();
        -[IMBalloonPluginDataSource messageGUID](v9, "messageGUID");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        -[IMBalloonPluginDataSource bundleID](v9, "bundleID");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        -[IMBalloonPluginDataSource payload](v9, "payload");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "length");
        -[IMBalloonPluginDataSource pluginPayload](v9, "pluginPayload");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "attachments");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)&buf[4] = v21;
        v37 = 2112;
        v38 = v22;
        v39 = 2112;
        v40 = v23;
        v41 = 2048;
        v42 = v25;
        v43 = 2048;
        v44 = v28;
        v45 = 2048;
        v46 = v9;
        _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Initialized %@(message guid: %@, bundle id: %@) with %tu byte payload, %tu attachments self pointer: %p", buf, 0x3Eu);

      }
    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_1A203724C;
    v33[3] = &unk_1E471E7A0;
    objc_copyWeak(&v34, (id *)buf);
    v31 = (id)objc_msgSend(v29, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.messages.IMDowntimeStateChangedForBundleID"), 0, v30, v33);

    -[IMBalloonPluginDataSource checkForAllowedByScreenTime](v9, "checkForAllowedByScreenTime");
    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
  }

  return v9;
}

- (void)checkForAllowedByScreenTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginDataSource bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemBundleIdentifierForPluginIdentifier:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    IMSharedDowntimeController();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPluginDataSource setAllowedByScreenTime:](self, "setAllowedByScreenTime:", objc_msgSend(v5, "allowedToShowAppExtensionWithBundleIdentifier:", v7));

  }
  else
  {
    -[IMBalloonPluginDataSource setAllowedByScreenTime:](self, "setAllowedByScreenTime:", 1);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__mainThreadPostNotificationName:object:", CFSTR("com.apple.messages.IMBalloonPluginDataSourceScreenTimeAllowedStateChanged"), self);

}

- (NSArray)allPayloads
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[IMBalloonPluginDataSource payload](self, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginDataSource consumedPayloads](self, "consumedPayloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {

    if (!v5)
    {
      v10[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    -[IMBalloonPluginDataSource consumedPayloads](self, "consumedPayloads");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
    if (v4)
      v7 = v4;
    v6 = v7;
  }
  v8 = v6;

LABEL_9:
  return (NSArray *)v8;
}

- (NSString)messageGUID
{
  return -[IMPluginPayload messageGUID](self->_pluginPayload, "messageGUID");
}

- (NSString)sessionGUID
{
  return -[IMPluginPayload pluginSessionGUID](self->_pluginPayload, "pluginSessionGUID");
}

- (NSString)_imMessageGUID
{
  NSString *imMessageGUID;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSString *v8;

  imMessageGUID = self->__imMessageGUID;
  if (!imMessageGUID)
  {
    -[IMBalloonPluginDataSource messageGUID](self, "messageGUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsString:", CFSTR(":")))
    {
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = v6;

        v4 = v7;
      }

    }
    v8 = self->__imMessageGUID;
    self->__imMessageGUID = (NSString *)v4;

    imMessageGUID = self->__imMessageGUID;
  }
  return imMessageGUID;
}

- (NSData)payload
{
  return -[IMPluginPayload data](self->_pluginPayload, "data");
}

- (void)setPayload:(id)a3
{
  -[IMPluginPayload setData:](self->_pluginPayload, "setData:", a3);
  MEMORY[0x1E0DE7D20](self, sel__dataSourceDidChange);
}

- (void)setPayload:(id)a3 attachments:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  IMBalloonPluginDataSource *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = self;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "self:%@ set payload length %@ attachments count %@", (uint8_t *)&v11, 0x20u);

    }
  }
  -[IMBalloonPluginDataSource setPendingAttachmentData:](self, "setPendingAttachmentData:", v7);
  -[IMBalloonPluginDataSource setPayload:](self, "setPayload:", v6);

}

- (NSData)messagePayloadDataForSending
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v16;
  IMBalloonPluginDataSource *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      -[IMBalloonPluginDataSource payload](self, "payload");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB37E8];
      -[IMBalloonPluginDataSource pendingAttachmentData](self, "pendingAttachmentData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "messagePayloadDataForSending self:%@ payload length %@ attachments count %@", (uint8_t *)&v16, 0x20u);

    }
  }
  -[IMBalloonPluginDataSource pendingAttachmentData](self, "pendingAttachmentData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") == 0;

  -[IMBalloonPluginDataSource payload](self, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[IMBalloonPluginDataSource pendingAttachmentData](self, "pendingAttachmentData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    IMSharedHelperCombinedPluginPayloadDictionaryData();
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  return (NSData *)v12;
}

- (IMMessage)imMessage
{
  void *v3;
  void *v4;
  void *v5;

  -[IMBalloonPluginDataSource chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageForGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v5;
}

- (IMChat)chat
{
  IMChat *chat;
  void *v4;
  void *v5;
  void *v6;
  IMChat *v7;
  uint64_t v8;
  IMChat *i;
  void *v10;
  void *v11;
  void *v12;
  IMChat *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  chat = self->_chat;
  if (!chat)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    +[IMChatRegistry sharedRegistryIfAvailable](IMChatRegistry, "sharedRegistryIfAvailable", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_cachedChatsWithMessageGUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (IMChat *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (IMChat *)((char *)i + 1))
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "messageForGUID:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = (IMChat *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    v13 = self->_chat;
    self->_chat = v7;

    chat = self->_chat;
  }
  return chat;
}

- (void)sendPayload:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_sendPayload_attachments_);
}

- (void)sendPayload:(id)a3 attachments:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  IMBalloonPluginDataSource *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = self;
      v30 = 2112;
      v31 = v8;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "self %@ sendPayload %@ attachments %@", buf, 0x20u);

    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  +[IMChatRegistry sharedRegistryIfAvailable](IMChatRegistry, "sharedRegistryIfAvailable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cachedChatsWithMessageGUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v24;
    v15 = (_QWORD *)MEMORY[0x1E0D38E68];
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "account");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "service");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "supportsCapability:", *v15);

        if ((v19 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Bailing, chat wasn't iMessage", buf, 2u);
            }

          }
          -[IMBalloonPluginDataSource updatePayload:attachments:](self, "updatePayload:attachments:", v6, v22);
          goto LABEL_21;
        }
        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v13)
        continue;
      break;
    }
  }

  if (v6 && objc_msgSend(v6, "length"))
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPluginDataSource messageGUID](self, "messageGUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendBalloonPayload:attachments:withMessageGUID:bundleID:", v6, v22, v20, self->_bundleID);

LABEL_21:
  }

}

- (void)updatePayloadForShelfAnimation:(id)a3
{
  -[IMBalloonPluginDataSource pluginPayloadDidChange:](self, "pluginPayloadDidChange:", -[IMBalloonPluginDataSource _updateWithPluginPayload:messageID:messageGUID:](self, "_updateWithPluginPayload:messageID:messageGUID:", a3, 0, 0) | 0xB);
}

- (void)updatePayload:(id)a3
{
  -[IMBalloonPluginDataSource updatePayload:attachments:](self, "updatePayload:attachments:", a3, 0);
}

- (void)updatePayload:(id)a3 attachments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginDataSource messageGUID](self, "messageGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateBalloonPayload:attachments:forMessageGUID:", v7, v6, v8);

}

- (void)_updatePayload:(id)a3 messageID:(int64_t)a4 messageGUID:(id)a5
{
  unint64_t v6;
  char v7;

  v6 = -[IMBalloonPluginDataSource _updateWithPluginPayload:messageID:messageGUID:](self, "_updateWithPluginPayload:messageID:messageGUID:", a3, a4, a5);
  if (v6)
  {
    v7 = v6;
    -[IMBalloonPluginDataSource pluginPayloadDidChange:](self, "pluginPayloadDidChange:", v6);
    if ((v7 & 1) != 0)
      MEMORY[0x1E0DE7D20](self, sel_payloadDidChange);
  }
}

- (BOOL)_senderIsSameBetweenPayload:(id)a3 andOtherPayload:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    objc_msgSend(v6, "sender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      LOBYTE(v9) = 1;
      goto LABEL_9;
    }
  }
  objc_msgSend(v5, "sender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "sender");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "sender");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sender");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_msgSend(v11, "isEqualToString:", v12);

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
LABEL_9:

  return (char)v9;
}

- (void)_updateTemporaryAttachmentURLsForPluginPayload
{
  NSMutableSet *v2;
  NSMutableSet *temporaryAttachmentURLs;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  __int128 v32;
  id obj;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!self->_temporaryAttachmentURLs)
  {
    v2 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    temporaryAttachmentURLs = self->_temporaryAttachmentURLs;
    self->_temporaryAttachmentURLs = v2;

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[IMBalloonPluginDataSource pluginPayload](self, "pluginPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachments");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v39;
    *(_QWORD *)&v6 = 138412802;
    v32 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "path");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          IMSafeTemporaryDirectory();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "path");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v11, "hasPrefix:", v13);

          if ((v14 & 1) != 0)
          {
            IMSafeTemporaryDirectory();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "path");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringByAppendingPathComponent:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 0;
            LODWORD(v15) = objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v37);
            v20 = v37;

            if ((_DWORD)v15)
            {
              v21 = (void *)MEMORY[0x1E0C99E98];
              objc_msgSend(v10, "path");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "lastPathComponent");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "stringByAppendingPathComponent:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "fileURLWithPath:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = 0;
              LODWORD(v24) = objc_msgSend(v26, "copyItemAtURL:toURL:error:", v10, v25, &v36);
              v27 = v36;

              if ((_DWORD)v24)
              {
                objc_msgSend(v35, "addObject:", v25);
                -[IMBalloonPluginDataSource temporaryAttachmentURLs](self, "temporaryAttachmentURLs");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "addObject:", v25);

              }
              else
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v32;
                    v43 = v10;
                    v44 = 2112;
                    v45 = v25;
                    v46 = 2112;
                    v47 = v27;
                    _os_log_impl(&dword_1A1FF4000, v30, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource failed to link temporary file URL %@ to %@ (error: %@)", buf, 0x20u);
                  }

                }
                objc_msgSend(v35, "addObject:", v10, v32);
              }

            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v43 = v18;
                  v44 = 2112;
                  v45 = v20;
                  _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource failed to create temporary directory at %@ (error: %@)", buf, 0x16u);
                }

              }
              objc_msgSend(v35, "addObject:", v10, v32);
            }

          }
          else
          {
            objc_msgSend(v35, "addObject:", v10);
          }

        }
        else
        {
          objc_msgSend(v35, "addObject:", v9);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v5);
  }

  -[IMBalloonPluginDataSource pluginPayload](self, "pluginPayload");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAttachments:", v35);

}

- (void)_removeTemporaryAttachmentURLs
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  NSObject *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[IMBalloonPluginDataSource temporaryAttachmentURLs](self, "temporaryAttachmentURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[IMBalloonPluginDataSource pluginPayload](self, "pluginPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (!v6)
      goto LABEL_23;
    v7 = *(_QWORD *)v25;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          -[IMBalloonPluginDataSource temporaryAttachmentURLs](self, "temporaryAttachmentURLs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "containsObject:", v10);

          if (v12)
          {
            objc_msgSend(v10, "path");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            IMSafeTemporaryDirectory();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "path");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v13, "hasPrefix:", v15);

            if (v16)
            {
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "path");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = 0;
              v19 = objc_msgSend(v17, "removeItemAtPath:error:", v18, &v23);
              v20 = v23;

              if ((v19 & 1) == 0 && IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v29 = v10;
                  v30 = 2112;
                  v31 = v20;
                  _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource failed to remove temporary file URL %@ (error: %@)", buf, 0x16u);
                }

              }
              goto LABEL_19;
            }
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v10;
                _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource NOT removing non-temporary file URL %@", buf, 0xCu);
              }
LABEL_19:

            }
          }

          continue;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (!v6)
      {
LABEL_23:

        -[IMBalloonPluginDataSource setTemporaryAttachmentURLs:](self, "setTemporaryAttachmentURLs:", 0);
        return;
      }
    }
  }
}

- (unint64_t)_updateWithPluginPayload:(id)a3 messageID:(int64_t)a4 messageGUID:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  unint64_t v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  NSObject *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  NSArray *v36;
  NSArray *consumedPayloads;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  int v51;
  NSObject *v52;
  void *v53;
  id v54;
  const __CFString *v55;
  id v56;
  const __CFString *v57;
  __CFString *v59;
  __CFString *v60;
  void *v61;
  uint8_t buf[4];
  const __CFString *v63;
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  const __CFString *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v60 = (__CFString *)a5;
  -[IMBalloonPluginDataSource bundleID](self, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D37588];
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D37588]))
  {
    if (!v8 || !a4)
    {

      goto LABEL_14;
    }
    v11 = -[IMBalloonPluginDataSource messageIDOfLastMessageInSession](self, "messageIDOfLastMessageInSession");

    if (v11 > a4)
      goto LABEL_14;
  }
  else
  {

    if (!v8)
      goto LABEL_14;
  }
  if (a4 < 1)
  {
LABEL_10:
    -[IMBalloonPluginDataSource pluginPayload](self, "pluginPayload");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v61, "copy");
    objc_msgSend(v8, "messageGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMessageGUID:", v13);

    objc_msgSend(v8, "pluginSessionGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPluginSessionGUID:", v14);

    objc_msgSend(v12, "setShouldExpire:", objc_msgSend(v8, "shouldExpire"));
    if (-[IMBalloonPluginDataSource _senderIsSameBetweenPayload:andOtherPayload:](self, "_senderIsSameBetweenPayload:andOtherPayload:", v8, v12)&& (v15 = objc_msgSend(v8, "isFromMe"), v15 == objc_msgSend(v12, "isFromMe")))
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v8, "sender");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSender:", v16);

      objc_msgSend(v12, "setIsFromMe:", objc_msgSend(v8, "isFromMe"));
      v17 = 8;
    }
    objc_msgSend(v8, "attachments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v19 = 1;
    }
    else
    {
      objc_msgSend(v8, "attachments");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      objc_msgSend(v61, "attachments");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v21 != objc_msgSend(v22, "count");

    }
    v23 = objc_msgSend(v61, "isEqualAttachmentFileURLsToPluginPayload:", v8);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = CFSTR("NO");
        if (v19)
          v26 = CFSTR("YES");
        else
          v26 = CFSTR("NO");
        if (!v23)
          v25 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v63 = v26;
        v64 = 2112;
        v65 = v25;
        _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "payloadAttachmentCountChanged %@ needsPayloadAttachmentUpdate %@", buf, 0x16u);
      }

    }
    if (((!v19 | v23) & 1) == 0)
    {
      -[IMBalloonPluginDataSource bundleID](self, "bundleID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", v10);

      if (((a4 > 0) & v28) != 0)
        -[IMBalloonPluginDataSource _removeTemporaryAttachmentURLs](self, "_removeTemporaryAttachmentURLs");
      objc_msgSend(v8, "attachments");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "count"))
      {
        objc_msgSend(v8, "attachments");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }

      objc_msgSend(v8, "fileTransferGUIDs");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "count"))
      {
        objc_msgSend(v8, "fileTransferGUIDs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = 0;
      }

      objc_msgSend(v12, "setAttachments:", v30);
      objc_msgSend(v12, "setFileTransferGUIDs:", v32);

      v17 |= 2uLL;
    }
    objc_msgSend(v61, "data");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqualToData:", v34);

    if ((v35 & 1) == 0)
    {
      objc_msgSend(v8, "consumedSessionPayloads");
      v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
      consumedPayloads = self->_consumedPayloads;
      self->_consumedPayloads = v36;

      objc_msgSend(v8, "data");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setData:", v38);

      v17 |= 1uLL;
    }
    if (!objc_msgSend(v61, "supportsCollaboration")
      || !objc_msgSend(v8, "supportsCollaboration"))
    {
      goto LABEL_57;
    }
    objc_msgSend(v61, "collaborationMetadata");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collaborationMetadata");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "isEqual:", v40))
    {

    }
    else
    {
      objc_msgSend(v8, "collaborationMetadata");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41 == 0;

      if (v42)
        goto LABEL_47;
      objc_msgSend(v8, "collaborationMetadata");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCollaborationMetadata:", v39);
    }

LABEL_47:
    objc_msgSend(v61, "datasource");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "datasource");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "isEqual:", v44))
    {

    }
    else
    {
      objc_msgSend(v8, "datasource");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v45 == 0;

      if (v46)
      {
LABEL_52:
        objc_msgSend(v61, "collaborationOptionsSummary");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "collaborationOptionsSummary");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "isEqual:", v48))
        {

        }
        else
        {
          objc_msgSend(v8, "collaborationOptionsSummary");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v49 == 0;

          if (v50)
            goto LABEL_57;
          objc_msgSend(v8, "collaborationOptionsSummary");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setCollaborationOptionsSummary:", v47);
        }

LABEL_57:
        v51 = objc_msgSend(v61, "isPlayed");
        if (v51 == objc_msgSend(v8, "isPlayed"))
        {
          if (!v17)
          {
LABEL_70:

            goto LABEL_71;
          }
        }
        else
        {
          objc_msgSend(v12, "setIsPlayed:", objc_msgSend(v8, "isPlayed"));
          v17 |= 4uLL;
        }
        -[IMBalloonPluginDataSource setPluginPayload:](self, "setPluginPayload:", v12);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
            v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "sender");
            v54 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v61, "isFromMe"))
              v55 = CFSTR("YES");
            else
              v55 = CFSTR("NO");
            objc_msgSend(v12, "sender");
            v56 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "isFromMe"))
              v57 = CFSTR("YES");
            else
              v57 = CFSTR("NO");
            *(_DWORD *)buf = 138413826;
            v63 = v60;
            v64 = 2112;
            v65 = v59;
            v66 = 2112;
            v67 = v53;
            v68 = 2112;
            v69 = v54;
            v70 = 2112;
            v71 = v55;
            v72 = 2112;
            v73 = v56;
            v74 = 2112;
            v75 = v57;
            _os_log_impl(&dword_1A1FF4000, v52, OS_LOG_TYPE_INFO, "after update messageGUID %@ messageID %@ updateFlags %@ old payload sender %@ old payload isFromMe %@ new sender %@ new isFromMe %@", buf, 0x48u);

          }
        }
        goto LABEL_70;
      }
      objc_msgSend(v8, "datasource");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDatasource:", v43);
    }

    goto LABEL_52;
  }
  if (-[IMBalloonPluginDataSource messageIDOfLastMessageInSession](self, "messageIDOfLastMessageInSession") <= a4)
  {
    self->_messageIDOfLastMessageInSession = a4;
    objc_storeStrong((id *)&self->_guidOfLastMessageInSession, a5);
    goto LABEL_10;
  }
LABEL_14:
  v17 = 0;
LABEL_71:

  return v17;
}

- (void)setPluginPayload:(id)a3
{
  IMPluginPayload *v5;
  IMPluginPayload *pluginPayload;
  NSString *imMessageGUID;
  IMPluginPayload *v8;

  v5 = (IMPluginPayload *)a3;
  pluginPayload = self->_pluginPayload;
  if (pluginPayload != v5)
  {
    v8 = v5;
    -[IMPluginPayload setDatasource:](pluginPayload, "setDatasource:", 0);
    objc_storeStrong((id *)&self->_pluginPayload, a3);
    -[IMPluginPayload setDatasource:](self->_pluginPayload, "setDatasource:", self);
    imMessageGUID = self->__imMessageGUID;
    self->__imMessageGUID = 0;

    v5 = v8;
  }

}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[IMBalloonPluginDataSource pluginPayload](self, "pluginPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (BOOL)isPlayed
{
  void *v2;
  char v3;

  -[IMBalloonPluginDataSource pluginPayload](self, "pluginPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlayed");

  return v3;
}

- (void)pluginPayloadDidChange:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (id)objc_opt_class();
      -[IMBalloonPluginDataSource messageGUID](self, "messageGUID");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[IMBalloonPluginDataSource bundleID](self, "bundleID");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[IMBalloonPluginDataSource payload](self, "payload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");
      -[IMBalloonPluginDataSource pluginPayload](self, "pluginPayload");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attachments");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138413570;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2048;
      v20 = v10;
      v21 = 2048;
      v22 = objc_msgSend(v12, "count");
      v23 = 2048;
      v24 = a3;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "pluginPayloadDidChange %@(message guid: %@, bundle id: %@) updated: %tu byte payload, %tu attachments (change flags: %tu)", (uint8_t *)&v13, 0x3Eu);

    }
  }
}

- (void)thumbnailURLWithSize:(CGSize)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD, CGSize, __n128))a4 + 2))(a4, 0, a3, *(__n128 *)&a3.height);
}

- (void)payloadWillSendFromShelf
{
  NSObject *v3;
  int v4;
  IMBalloonPluginDataSource *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = self;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "payloadWillSendFromShelf: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (BOOL)wantsStatusItem
{
  return 0;
}

- (NSString)statusString
{
  return 0;
}

- (NSAttributedString)statusAttributedString
{
  return 0;
}

- (BOOL)wantsReplyFromContentView
{
  return 0;
}

- (void)statusStringNeedsUpdate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[IMChatRegistry sharedRegistryIfAvailable](IMChatRegistry, "sharedRegistryIfAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cachedChatsWithMessageGUID:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v18;
  if (objc_msgSend(v18, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v18;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v24 = v12;
              _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Updating status message for guid: %@", buf, 0xCu);

            }
          }
          -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "messageForGUID:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "_imMessageItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_handleIncomingItem:updateRecipient:", v15, 0);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v7);
    }

LABEL_18:
    v5 = v18;
    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "No chat found for message guid: %@", buf, 0xCu);

    }
    goto LABEL_18;
  }
LABEL_19:

}

- (BOOL)supportsDynamicSize
{
  return 0;
}

- (void)needsResize
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  const __CFString *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[IMBalloonPluginDataSource setHasInvalidatedSize:](self, "setHasInvalidatedSize:", 1);
  +[IMChatRegistry sharedRegistryIfAvailable](IMChatRegistry, "sharedRegistryIfAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cachedChatsWithMessageGUID:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v28, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v28;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v33 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v39 = v10;
              _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Updating balloon size for guid: %@", buf, 0xCu);

            }
          }
          objc_msgSend(v8, "inlineReplyController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11 == 0;

          if (v12)
          {
            -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "messageForGUID:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "_imMessageItem");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "_handleIncomingItem:updateRecipient:suppressNotification:updateReplyCounts:", v13, 0, 0, 0);
          }
          else
          {
            objc_msgSend(v8, "inlineReplyController");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_itemForGUID:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "messageForGUID:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "_imMessageItem");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = sub_1A2039A10;
            v30[3] = &unk_1E471E7C8;
            v30[4] = v8;
            v31 = v18;
            v19 = v18;
            objc_msgSend(v13, "performActionDisallowingItemInsert:", v30);
            objc_msgSend(v13, "insertItem:", v15);

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v5);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v23;
        _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "No chat found for message guid: %@", buf, 0xCu);

      }
    }
    -[IMBalloonPluginDataSource stagingContext](self, "stagingContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "transientIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v36 = CFSTR("__kIMPluginDataSourceTransientIdentifierKey");
      v37 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      obj = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      obj = (id)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMPayloadNeedsResizing"), v27, obj);

  }
}

- (void)markAsPlayed
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[IMBalloonPluginDataSource allowedByScreenTime](self, "allowedByScreenTime")
    && !-[IMBalloonPluginDataSource isPlayed](self, "isPlayed"))
  {
    -[IMBalloonPluginDataSource bundleID](self, "bundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D37588]);

    if (v4)
    {
      -[IMBalloonPluginDataSource _imMessageGUID](self, "_imMessageGUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[IMBalloonPluginDataSource guidOfLastMessageInSession](self, "guidOfLastMessageInSession");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v5;
          _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Marking message %@ as played for App Message", buf, 0xCu);
        }

      }
    }
    +[IMChatRegistry sharedRegistryIfAvailable](IMChatRegistry, "sharedRegistryIfAvailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_cachedChatsWithMessageGUID:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = v19;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v26 = v5;
                _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "marking message as played guid: %@", buf, 0xCu);
              }

            }
            objc_msgSend(v12, "messageForGUID:", v5);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v14)
            {
              objc_msgSend(v14, "_imMessageItem");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "_markItemAsPlayed:", v16);

              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v26 = v5;
                  _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Did mark message as played guid: %@", buf, 0xCu);
                }

              }
            }

          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v9);
      }

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v5;
        _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "No chat found for message guid to mark as played: %@", buf, 0xCu);
      }

    }
  }
}

+ (BOOL)supportsURL:(id)a3
{
  return 0;
}

- (unint64_t)playbackType
{
  return 0;
}

- (void)playbackWithCompletionBlock:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[IMBalloonPluginDataSource playbackType](self, "playbackType");
  v5 = v6;
  if (v6 && !v4)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

+ (id)unlocalizedPreviewSummaryForPluginBundle:(id)a3 pluginDisplayName:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  char v9;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D375C0]) & 1) != 0)
  {
    v7 = CFSTR("a Handwritten Message");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D375E0]) & 1) != 0
         || (IMBalloonExtensionIDWithSuffix(),
             v8 = (void *)objc_claimAutoreleasedReturnValue(),
             v9 = objc_msgSend(v5, "isEqualToString:", v8),
             v8,
             (v9 & 1) != 0))
  {
    v7 = CFSTR("a Photo Message");
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D37588]) & 1) != 0)
  {
    v7 = CFSTR("a Digital Touch Message");
  }
  else
  {
    +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "balloonPluginForBundleID:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", v5) & 1) != 0)
    {
      objc_msgSend(v12, "browserDisplayName");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v6;
    }
    v15 = v14;

    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("1 %@ Message"), v15);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

+ (id)previewSummaryForPluginBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  int v20;

  v3 = a3;
  +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "dataSourceClassForBundleID:", v3);

  objc_msgSend(v5, "previewSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_12;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D375C0]))
  {
    sub_1A20F1964();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("Handwritten Message");
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D375E0]) & 1) != 0
    || (IMBalloonExtensionIDWithSuffix(),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v3, "isEqualToString:", v10),
        v10,
        v11))
  {
    sub_1A20F1964();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("Photo Message");
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D37588]))
  {
    sub_1A20F1964();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("Digital Touch Message");
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D37500]) & 1) != 0
    || (IMBalloonExtensionIDWithSuffix(),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v3, "isEqualToString:", v19),
        v19,
        v20))
  {
    sub_1A20F1964();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("CHECK_IN_MESSAGE");
LABEL_7:
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E4725068, CFSTR("IMCoreLocalizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_12;
  }
  +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "balloonPluginForBundleID:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "browserDisplayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    sub_1A20F1964();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("1 %@ Message"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

LABEL_12:
  return v6;
}

+ (id)previewSummaryForPluginPayload:(id)a3 withBundleID:(id)a4 previewAttachmentURL:(id *)a5 previewAttachmentUTI:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "dataSourceClassForBundleID:", v10);

  if (!v12)
  {
    v15 = 0;
    goto LABEL_35;
  }
  if (!objc_msgSend(v12, "supportsIndividualPreviewSummaries"))
  {
LABEL_9:
    if (objc_msgSend(v10, "rangeOfString:", *MEMORY[0x1E0D375D0]))
    {
LABEL_33:
      objc_msgSend(v12, "previewSummaryForPluginBundle:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    objc_msgSend(v9, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
LABEL_32:

      goto LABEL_33;
    }
    v17 = objc_opt_respondsToSelector();
    v18 = (void *)MEMORY[0x1E0CB3710];
    if ((v17 & 1) != 0)
    {
      IMExtensionPayloadUnarchivingClasses();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      objc_msgSend(v18, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v19, v16, &v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v29;

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v21;
          _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "strict-decoding 006 exception/error after _strictlyUnarchivedObjectOfClasses: [%@]", buf, 0xCu);
        }

      }
    }
    else
    {
      IMExtensionPayloadUnarchivingClasses();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v23, v16, &v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v28;

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v21;
          _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "strict-decoding 006 exception/error after unarchivedObjectOfClasses: [%@]", buf, 0xCu);
        }

      }
    }
    if (v20)
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D37E20]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        localizedTextForAppName();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_35;
      }
      if (!IMOSLoggingEnabled())
        goto LABEL_31;
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource: Could not obtain value for key IMExtensionPayloadAppNameKey", buf, 2u);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_31:

        goto LABEL_32;
      }
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v21;
        _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource: Could not unarchive plugin payload data due to the following error:%@", buf, 0xCu);
      }
    }

    goto LABEL_31;
  }
  v13 = (void *)objc_msgSend(objc_alloc((Class)v12), "initWithPluginPayload:", v9);
  v14 = v13;
  if (!v13)
    goto LABEL_8;
  if (a5)
  {
    objc_msgSend(v13, "individualPreviewAttachmentFileAndUTI:", a6);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "individualPreviewSummary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
LABEL_8:

    goto LABEL_9;
  }

LABEL_35:
  return v15;
}

+ (id)previewSummary
{
  return 0;
}

+ (id)individualPreviewSummaryForPluginPayload:(id)a3
{
  return 0;
}

+ (BOOL)supportsIndividualPreviewSummaries
{
  return 1;
}

- (id)individualPreviewSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[IMBalloonPluginDataSource _summaryText](self, "_summaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginDataSource _replaceHandleWithContactNameInString:](self, "_replaceHandleWithContactNameInString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = 0;
  if (objc_msgSend(v4, "length") && v7)
    v8 = v4;

  return v8;
}

- (id)_summaryText
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[IMBalloonPluginDataSource pluginPayload](self, "pluginPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_opt_respondsToSelector();
    v5 = (void *)MEMORY[0x1E0CB3710];
    if ((v4 & 1) != 0)
    {
      IMExtensionPayloadUnarchivingClasses();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v7 = (id *)&v16;
      objc_msgSend(v5, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v6, v3, &v16);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      IMExtensionPayloadUnarchivingClasses();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v7 = (id *)&v15;
      objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v3, &v15);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v8;
    v11 = *v7;

    if (v11 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v11;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "strict-decoding 020 exception/error after unarchivedObjectOfClasses: [%@]", buf, 0xCu);
      }

    }
    if (v10)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D37E50]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
LABEL_22:

        goto LABEL_23;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource: Could not obtain value for key IMExtensionPayloadLocalizedDescriptionTextKey", buf, 2u);
        }
LABEL_20:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v11;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource: Could not unarchive plugin payload data due to the following error:%@", buf, 0xCu);
      }
      goto LABEL_20;
    }
    v9 = 0;
    goto LABEL_22;
  }
  v9 = 0;
LABEL_23:

  return v9;
}

- (id)individualPreviewAttachmentFileAndUTI:(id *)a3
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 0.0;
  v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)datasourceWasMovedToNewGuid:(id)a3
{
  NSString *imMessageGUID;
  id v5;

  v5 = a3;
  -[IMBalloonPluginDataSource setMessageGUID:](self, "setMessageGUID:", v5);
  imMessageGUID = self->__imMessageGUID;
  self->__imMessageGUID = 0;

  -[IMPluginPayload setMessageGUID:](self->_pluginPayload, "setMessageGUID:", v5);
}

- (LPLinkMetadata)richLinkMetadata
{
  return 0;
}

- (void)chooseOptions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.messages.IMBalloonPluginDataSourceCollaborationLPTapped"), 0);

}

- (void)pluginPayloadShouldSendCopy
{
  void *v3;
  id v4;

  -[IMBalloonPluginDataSource pluginDataSourceDelegate](self, "pluginDataSourceDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IMBalloonPluginDataSource pluginDataSourceDelegate](self, "pluginDataSourceDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "balloonPluginDataSource:shouldSendAsCopy:", self, 1);

  }
}

- (void)pluginPayloadShouldSendCollaboration
{
  void *v3;
  id v4;

  -[IMBalloonPluginDataSource pluginDataSourceDelegate](self, "pluginDataSourceDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IMBalloonPluginDataSource pluginDataSourceDelegate](self, "pluginDataSourceDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "balloonPluginDataSource:shouldSendAsCopy:", self, 0);

  }
}

- (void)_dataSourceDidChange
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[IMBalloonPluginDataSource pluginDataSourceDelegate](self, "pluginDataSourceDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[IMBalloonPluginDataSource pluginDataSourceDelegate](self, "pluginDataSourceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[IMBalloonPluginDataSource pluginDataSourceDelegate](self, "pluginDataSourceDelegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "balloonPluginDataSourceDidChange:", self);

    }
  }
}

- (BOOL)isDeferredSend
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[IMBalloonPluginDataSource imMessage](self, "imMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scheduleType");

  if (v4 != 2)
    return 0;
  -[IMBalloonPluginDataSource imMessage](self, "imMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "scheduleState");

  if (v6 <= 5)
    return (0x36u >> v6) & 1;
  else
    return 0;
}

- (id)_overrideURLForOpeningURL:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[IMBalloonPluginDataSource pluginPayload](self, "pluginPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[IMBalloonPluginDataSource isPayloadServiceManatee:](IMBalloonPluginDataSource, "isPayloadServiceManatee:", v5);

  if (v6)
  {
    -[IMBalloonPluginDataSource pluginPayload](self, "pluginPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPluginDataSource chat](self, "chat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastAddressedHandleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPluginDataSource pluginPayload](self, "pluginPayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMBalloonPluginDataSource URLForDugongShareURL:handle:payload:](IMBalloonPluginDataSource, "URLForDugongShareURL:handle:payload:", v8, v10, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v4;
  }

  return v12;
}

- (id)overrideURLForOpeningURL:(id)a3
{
  id v4;
  void *v5;
  void (**willOpenHandler)(void);
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[IMBalloonPluginDataSource _overrideURLForOpeningURL:](self, "_overrideURLForOpeningURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  willOpenHandler = (void (**)(void))self->_willOpenHandler;
  if (willOpenHandler)
    willOpenHandler[2]();
  -[IMBalloonPluginDataSource imMessage](self, "imMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _IMShouldProcessURLForPhotosExtension();

  if (v8)
  {
    objc_msgSend(v7, "balloonBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {

      -[IMBalloonPluginDataSource chat](self, "chat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "guid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "upgradeCompleteMyMomentLinkToStackWithMessageGUID:chatGUID:", v12, v13);

      v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)isPayloadServiceManatee:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "containerSetupInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "containerSetupInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "containerOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isServiceManatee");
  }
  else
  {
    objc_msgSend(v3, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1EE65F410 != -1)
      dispatch_once(&qword_1EE65F410, &unk_1E471D458);
    v7 = objc_msgSend((id)qword_1EE65F408, "containsObject:", v6);
  }
  v8 = v7;

  return v8;
}

+ (id)URLForDugongShareURL:(id)a3 handle:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "datasource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "richLinkMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "URLForDugongShareURL:handle:metadata:", v9, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)URLForDugongShareURL:(id)a3 handle:(id)a4 metadata:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  id v13;
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
  id v25;
  NSObject *v26;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v34 = a4;
  v8 = a5;
  objc_msgSend(v8, "specialization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v8, "specialization");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "specialization");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v33, "encodedTokens"), (v32 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v34;
          _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Getting token for current handle:%@", buf, 0xCu);
        }

      }
      objc_msgSend(v32, "objectForKey:", v34);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
        goto LABEL_10;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = sub_1A203B5FC;
      v36[3] = &unk_1E471E7F0;
      v37 = v32;
      sub_1A203B5FC((uint64_t)v36);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v7, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc_init(MEMORY[0x1E0CB3998]);
        objc_msgSend(v31, "scheme");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setScheme:", v14);

        objc_msgSend(v31, "host");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setHost:", v15);

        objc_msgSend(v31, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPath:", v16);

        objc_msgSend(v31, "fragment");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFragment:", v17);

        objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");

        objc_msgSend(v19, "removeCharactersInString:", CFSTR("+=/"));
        objc_msgSend(CFSTR("token"), "stringByAddingPercentEncodingWithAllowedCharacters:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v30, 1, &v35);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v35;
        objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringByAddingPercentEncodingWithAllowedCharacters:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), v20, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setQuery:", v24);
        objc_msgSend(v13, "URL");
        v25 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v39 = 0;
            _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "Error while decoding the handle-to-token mapping to NSDictionary: %@", buf, 0xCu);
          }

        }
        v25 = v7;
      }

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v7;
          _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "No tokenMapping data found in URL query. Returning URL: %@", buf, 0xCu);
        }

      }
      v25 = v7;
    }

  }
  else
  {
    v25 = v7;
  }

  return v25;
}

+ (id)lastAddressedHandleIDFromChat:(id)a3
{
  return (id)objc_msgSend(a3, "lastAddressedHandleID");
}

+ (id)replaceHandleWithContactNameInString:(id)a3 forAccount:(id)a4 additionalHandles:(id)a5
{
  id v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v39;
  id v40;
  char *obj;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t i;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v44 = a4;
  v40 = a5;
  v39 = v7;
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v59 = "+[IMBalloonPluginDataSource replaceHandleWithContactNameInString:forAccount:additionalHandles:]";
        v60 = 2112;
        v61 = v7;
        v62 = 2112;
        v63 = v44;
        v64 = 2112;
        v65 = v40;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "%s string: %@, account: %@, additionalHandles: %@", buf, 0x2Au);
      }

    }
    objc_msgSend(v7, "__im_handleIdentifiers");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v7);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v9;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Identifiers to replace: %@", buf, 0xCu);
      }

    }
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v9;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v43)
    {
      v42 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v53 != v42)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v45, "__im_IDForHandleIdentifierString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            objc_msgSend(v44, "existingIMHandleWithID:", v11);
            v12 = (id)objc_claimAutoreleasedReturnValue();
            if (!v12)
            {
              if (!objc_msgSend(v11, "_appearsToBeEmail")
                || (objc_msgSend(CFSTR("e:"), "stringByAppendingString:", v11),
                    v26 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v44, "existingIMHandleWithID:alreadyCanonical:", v26, 1),
                    v12 = (id)objc_claimAutoreleasedReturnValue(),
                    v26,
                    !v12))
              {
                if (objc_msgSend(v11, "_appearsToBePhoneNumber"))
                {
                  objc_msgSend(CFSTR("p:"), "stringByAppendingString:", v11);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "existingIMHandleWithID:alreadyCanonical:", v27, 1);
                  v12 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v12 = 0;
                }
              }
            }
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v59 = (const char *)v11;
                v60 = 2112;
                v61 = v12;
                _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Identifier was a uuid, identifierString %@, handle %@", buf, 0x16u);
              }

            }
            if (v12)
            {
              if (objc_msgSend(v12, "hasName"))
              {
                objc_msgSend(v12, "name");
                v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v12, "ID");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "_stripFZIDPrefix");
                v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315394;
                  v59 = "+[IMBalloonPluginDataSource replaceHandleWithContactNameInString:forAccount:additionalHandles:]";
                  v60 = 2112;
                  v61 = v30;
                  _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_INFO, "%s Invalid handle, callstack: %@", buf, 0x16u);

                }
              }
              v14 = 0;
            }
          }
          else
          {
            +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "allIMHandles");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v12 = v16;
            v14 = 0;
            v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            if (v17)
            {
              v18 = *(_QWORD *)v49;
              do
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v49 != v18)
                    objc_enumerationMutation(v12);
                  v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                  objc_msgSend(v20, "ID");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  MEMORY[0x1A8582830]();
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "isEqualToString:", v11);

                  if (v23)
                  {
                    if (objc_msgSend(v20, "hasName"))
                    {
                      objc_msgSend(v20, "name");
                      v24 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      objc_msgSend(v20, "ID");
                      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      -[__CFString _stripFZIDPrefix](v25, "_stripFZIDPrefix");
                      v24 = objc_claimAutoreleasedReturnValue();

                      v14 = v25;
                    }

                    v14 = (__CFString *)v24;
                  }
                }
                v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
              }
              while (v17);
            }

          }
          v31 = objc_msgSend(v11, "isEqualToString:", kIMTranscriptPluginBreadcrumbTextSenderIdentifier);
          v32 = objc_msgSend(v11, "isEqualToString:", kIMTranscriptPluginBreadcrumbTextReceiverIdentifier);
          if (!-[__CFString length](v14, "length") && v31 | v32)
          {
            objc_msgSend(v40, "objectForKey:", v11);
            v33 = objc_claimAutoreleasedReturnValue();

            v14 = (__CFString *)v33;
          }
          if (-[__CFString length](v14, "length"))
            v34 = 1;
          else
            v34 = v31;
          if (((v34 | v32) & 1) == 0)
          {
            objc_msgSend(v11, "_stripFZIDPrefix");
            v35 = objc_claimAutoreleasedReturnValue();

            v14 = (__CFString *)v35;
          }
          if (!-[__CFString length](v14, "length"))
          {

            v14 = &stru_1E4725068;
          }
          objc_msgSend(v46, "replaceOccurrencesOfString:withString:options:range:", v45, v14, 0, 0, objc_msgSend(v46, "length"));

        }
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v43);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v59 = "+[IMBalloonPluginDataSource replaceHandleWithContactNameInString:forAccount:additionalHandles:]";
        v60 = 2112;
        v61 = v46;
        _os_log_impl(&dword_1A1FF4000, v36, OS_LOG_TYPE_INFO, "%s updatedString: %@", buf, 0x16u);
      }

    }
    v37 = (void *)objc_msgSend(v46, "copy");

  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)_replaceHandleWithContactNameInString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IMBalloonPluginDataSource chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMBalloonPluginDataSource replaceHandleWithContactNameInString:forAccount:additionalHandles:](IMBalloonPluginDataSource, "replaceHandleWithContactNameInString:forAccount:additionalHandles:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)beginShowingLastConsumedBreadcrumbForOutgoingPayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  IMBalloonPluginDataSource *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[IMBalloonPluginDataSource isShowingLatestMessageAsBreadcrumb](self, "isShowingLatestMessageAsBreadcrumb")
    && objc_msgSend(v4, "isUpdate"))
  {
    -[IMBalloonPluginDataSource guidOfLastMessageInSession](self, "guidOfLastMessageInSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      -[IMBalloonPluginDataSource setShowingLatestMessageAsBreadcrumb:](self, "setShowingLatestMessageAsBreadcrumb:", 1);
      -[IMBalloonPluginDataSource _reloadLatestUnconsumedBreadcrumb](self, "_reloadLatestUnconsumedBreadcrumb");
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = self;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource: %@ attempted to show consumed breadcrumb before the last unconsumed breadcrumb was known.", (uint8_t *)&v8, 0xCu);
      }

    }
  }

}

- (void)endShowingLastConsumedBreadcrumb
{
  if (-[IMBalloonPluginDataSource isShowingLatestMessageAsBreadcrumb](self, "isShowingLatestMessageAsBreadcrumb"))
  {
    -[IMBalloonPluginDataSource setShowingLatestMessageAsBreadcrumb:](self, "setShowingLatestMessageAsBreadcrumb:", 0);
    -[IMBalloonPluginDataSource _reloadLatestUnconsumedBreadcrumb](self, "_reloadLatestUnconsumedBreadcrumb");
  }
}

- (void)_reloadLatestUnconsumedBreadcrumb
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  IMBalloonPluginDataSource *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[IMBalloonPluginDataSource guidOfLastMessageInSession](self, "guidOfLastMessageInSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMChatRegistry sharedRegistryIfAvailable](IMChatRegistry, "sharedRegistryIfAvailable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cachedChatsWithMessageGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v19;
    *(_QWORD *)&v8 = 138412802;
    v17 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "messageForGUID:", v3, v17, (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_imMessageItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "_handleIncomingItem:updateRecipient:", v13, 0);
          if (!IMOSLoggingEnabled())
            goto LABEL_15;
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "chatIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v17;
            v23 = self;
            v24 = 2112;
            v25 = v3;
            v26 = 2112;
            v27 = v15;
            _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "%@ refreshing most recent message guid: %@ for chat: %@ ", buf, 0x20u);

          }
        }
        else
        {
          if (!IMOSLoggingEnabled())
            goto LABEL_15;
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "chatIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v17;
            v23 = self;
            v24 = 2112;
            v25 = v3;
            v26 = 2112;
            v27 = v16;
            _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "IMBalloonPluginDataSource: %@ no message item with GUID %@ found in chat: %@", buf, 0x20u);

          }
        }

LABEL_15:
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v7);
  }

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[IMBalloonPluginDataSource messageGUID](self, "messageGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginDataSource bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginDataSource payload](self, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  -[IMBalloonPluginDataSource pluginPayload](self, "pluginPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> [GUID: %@; bundleID: %@; Payload length: %lu; Num. attachments: %tu]"),
    v4,
    self,
    v5,
    v6,
    v8,
    objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setChat:(id)a3
{
  objc_storeStrong((id *)&self->_chat, a3);
}

- (IMPluginPayload)pluginPayload
{
  return self->_pluginPayload;
}

- (void)setMessageGUID:(id)a3
{
  objc_storeStrong((id *)&self->_messageGUID, a3);
}

- (void)setSessionGUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionGUID, a3);
}

- (BOOL)payloadInShelf
{
  return self->_payloadInShelf;
}

- (void)setPayloadInShelf:(BOOL)a3
{
  self->_payloadInShelf = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (DDScannerResult)dataDetectedResult
{
  return self->_dataDetectedResult;
}

- (void)setDataDetectedResult:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetectedResult, a3);
}

- (NSArray)attachmentGUIDs
{
  return self->_attachmentGUIDs;
}

- (void)setAttachmentGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentGUIDs, a3);
}

- (NSURL)URLToOpenOnTapAction
{
  return self->_URLToOpenOnTapAction;
}

- (id)willOpenHandler
{
  return self->_willOpenHandler;
}

- (void)setWillOpenHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)initialMessageIsFromMe
{
  return self->_initialMessageIsFromMe;
}

- (void)setInitialMessageIsFromMe:(BOOL)a3
{
  self->_initialMessageIsFromMe = a3;
}

- (BOOL)allowedByScreenTime
{
  return self->_allowedByScreenTime;
}

- (void)setAllowedByScreenTime:(BOOL)a3
{
  self->_allowedByScreenTime = a3;
}

- (BOOL)isLast
{
  return self->_isLast;
}

- (void)setLast:(BOOL)a3
{
  self->_isLast = a3;
}

- (NSArray)pendingAttachmentData
{
  return self->_pendingAttachmentData;
}

- (void)setPendingAttachmentData:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAttachmentData, a3);
}

- (NSMutableSet)temporaryAttachmentURLs
{
  return self->_temporaryAttachmentURLs;
}

- (void)setTemporaryAttachmentURLs:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryAttachmentURLs, a3);
}

- (void)set_imMessageGUID:(id)a3
{
  objc_storeStrong((id *)&self->__imMessageGUID, a3);
}

- (BOOL)isShowingLatestMessageAsBreadcrumb
{
  return self->_isShowingLatestMessageAsBreadcrumb;
}

- (void)setShowingLatestMessageAsBreadcrumb:(BOOL)a3
{
  self->_isShowingLatestMessageAsBreadcrumb = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)hasInvalidatedSize
{
  return self->_hasInvalidatedSize;
}

- (void)setHasInvalidatedSize:(BOOL)a3
{
  self->_hasInvalidatedSize = a3;
}

- (NSArray)consumedPayloads
{
  return self->_consumedPayloads;
}

- (void)setConsumedPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_consumedPayloads, a3);
}

- (BOOL)parentChatHasAllUnknownRecipients
{
  return self->_parentChatHasAllUnknownRecipients;
}

- (void)setParentChatHasAllUnknownRecipients:(BOOL)a3
{
  self->_parentChatHasAllUnknownRecipients = a3;
}

- (IMPluginDataSourceStagingContext)stagingContext
{
  return self->_stagingContext;
}

- (void)setStagingContext:(id)a3
{
  objc_storeStrong((id *)&self->_stagingContext, a3);
}

- (IMBalloonPluginDataSourceDelegate)pluginDataSourceDelegate
{
  return (IMBalloonPluginDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_pluginDataSourceDelegate);
}

- (void)setPluginDataSourceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pluginDataSourceDelegate, a3);
}

- (NSString)guidOfLastMessageInSession
{
  return self->_guidOfLastMessageInSession;
}

- (int64_t)messageIDOfLastMessageInSession
{
  return self->_messageIDOfLastMessageInSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidOfLastMessageInSession, 0);
  objc_destroyWeak((id *)&self->_pluginDataSourceDelegate);
  objc_storeStrong((id *)&self->_stagingContext, 0);
  objc_storeStrong((id *)&self->_consumedPayloads, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->__imMessageGUID, 0);
  objc_storeStrong((id *)&self->_temporaryAttachmentURLs, 0);
  objc_storeStrong((id *)&self->_pendingAttachmentData, 0);
  objc_storeStrong(&self->_willOpenHandler, 0);
  objc_storeStrong((id *)&self->_URLToOpenOnTapAction, 0);
  objc_storeStrong((id *)&self->_attachmentGUIDs, 0);
  objc_storeStrong((id *)&self->_dataDetectedResult, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sessionGUID, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong((id *)&self->_pluginPayload, 0);
  objc_storeStrong((id *)&self->_chat, 0);
}

@end
