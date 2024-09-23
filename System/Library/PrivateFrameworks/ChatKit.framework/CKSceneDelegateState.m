@implementation CKSceneDelegateState

- (NSArray)unreadLastMessages
{
  return self->_unreadLastMessages;
}

- (void)setUnreadLastMessages:(id)a3
{
  objc_storeStrong((id *)&self->_unreadLastMessages, a3);
}

- (void)setShowingInbox:(BOOL)a3
{
  self->_showingInbox = a3;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (void)setFilterMode:(unint64_t)a3
{
  self->_filterMode = a3;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void)setComposingNewMessage:(BOOL)a3
{
  self->_composingNewMessage = a3;
}

- (CKSceneDelegateState)init
{
  return -[CKSceneDelegateState initWithUnreadMessages:groupID:composingNewMessage:filterMode:showingInbox:](self, "initWithUnreadMessages:groupID:composingNewMessage:filterMode:showingInbox:", 0, 0, 0, 0, 0);
}

- (CKSceneDelegateState)initWithUnreadMessages:(id)a3 groupID:(id)a4 composingNewMessage:(BOOL)a5 filterMode:(unint64_t)a6 showingInbox:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  id v12;
  id v13;
  CKSceneDelegateState *v14;
  CKSceneDelegateState *v15;
  void *v16;
  objc_super v18;

  v7 = a7;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKSceneDelegateState;
  v14 = -[CKSceneDelegateState init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    -[CKSceneDelegateState setUnreadLastMessages:](v14, "setUnreadLastMessages:", v12);
    -[CKSceneDelegateState setGroupID:](v15, "setGroupID:", v13);
    -[CKSceneDelegateState setComposingNewMessage:](v15, "setComposingNewMessage:", v9);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSceneDelegateState setDate:](v15, "setDate:", v16);

    -[CKSceneDelegateState setFilterMode:](v15, "setFilterMode:", a6);
    -[CKSceneDelegateState setShowingInbox:](v15, "setShowingInbox:", v7);
  }

  return v15;
}

- (CKSceneDelegateState)initWithCoder:(id)a3
{
  id v4;
  CKSceneDelegateState *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[CKSceneDelegateState init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("unreadLastMessages"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSceneDelegateState setUnreadLastMessages:](v5, "setUnreadLastMessages:", v6);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("groupID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSceneDelegateState setGroupID:](v5, "setGroupID:", v7);

    -[CKSceneDelegateState setComposingNewMessage:](v5, "setComposingNewMessage:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("composingNewMessage")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSceneDelegateState setDate:](v5, "setDate:", v8);

    -[CKSceneDelegateState setFilterMode:](v5, "setFilterMode:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("filterMode")));
    -[CKSceneDelegateState setShowingInbox:](v5, "setShowingInbox:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showingInbox")));
  }

  return v5;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (unint64_t)filterMode
{
  return self->_filterMode;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)composingNewMessage
{
  return self->_composingNewMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_unreadLastMessages, 0);
}

+ (id)unarchivingClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKSceneDelegateState unreadLastMessages](self, "unreadLastMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("unreadLastMessages"));

  -[CKSceneDelegateState groupID](self, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("groupID"));

  objc_msgSend(v7, "encodeBool:forKey:", -[CKSceneDelegateState composingNewMessage](self, "composingNewMessage"), CFSTR("composingNewMessage"));
  -[CKSceneDelegateState date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("date"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[CKSceneDelegateState filterMode](self, "filterMode"), CFSTR("filterMode"));
  objc_msgSend(v7, "encodeBool:forKey:", -[CKSceneDelegateState showingInbox](self, "showingInbox"), CFSTR("showingInbox"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CKSceneDelegateState unreadLastMessages](self, "unreadLastMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSceneDelegateState groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKSceneDelegateState composingNewMessage](self, "composingNewMessage"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[CKSceneDelegateState date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  v10 = v9;
  CKConversationListFilterModeStringValue(-[CKSceneDelegateState filterMode](self, "filterMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKSceneDelegateState showingInbox](self, "showingInbox"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p unreadLastMessages: %@ groupID: %@ composingNewMessage: %@ date: %f> filterMode: %@ showingInbox: %@"), v4, self, v5, v6, v7, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)stateFromIsComposingNewMessage:(BOOL)a3 messageHasContent:(BOOL)a4 isShowingBlankTranscript:(BOOL)a5 isControllerCollapsed:(BOOL)a6 isTopVCChatNavigationController:(BOOL)a7 conversation:(id)a8 filterMode:(unint64_t)a9 isShowingInbox:(BOOL)a10 unreadMessages:(id)a11
{
  _BOOL4 v11;
  int v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  id v16;
  id v17;
  int v18;
  __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  CKSceneDelegateState *v29;
  const __CFString *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v16 = a8;
  v17 = a11;
  v18 = (v11 | ~v12) & !v13;
  if (v15)
    v18 = v14;
  v19 = CFSTR("-1");
  if (v16 && v18)
  {
    objc_msgSend(v16, "groupID");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v20 = v15 & v14;
  if (_IMWillLog())
  {
    v21 = CFSTR("NO");
    if ((_DWORD)v20)
      v21 = CFSTR("YES");
    v31 = v21;
    _IMAlwaysLog();
  }
  if (_IMWillLog())
  {
    v31 = v19;
    _IMAlwaysLog();
  }
  +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance", v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "saveCompositionAndFlushCache:", 1);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "cachedChats");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "__ck_saveWatermark");
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v26);
  }

  v29 = -[CKSceneDelegateState initWithUnreadMessages:groupID:composingNewMessage:filterMode:showingInbox:]([CKSceneDelegateState alloc], "initWithUnreadMessages:groupID:composingNewMessage:filterMode:showingInbox:", v17, v19, v20, a9, a10);
  return v29;
}

- (BOOL)showingInbox
{
  return self->_showingInbox;
}

@end
