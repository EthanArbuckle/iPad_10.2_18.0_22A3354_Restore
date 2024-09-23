@implementation IMDualSIMUtilitiesManager

- (IMDualSIMUtilitiesManager)init
{
  IMDualSIMUtilitiesManager *v2;
  uint64_t v3;
  NSDictionary *conversationListSIMShortNameDictionary;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMDualSIMUtilitiesManager;
  v2 = -[IMDualSIMUtilitiesManager init](&v7, sel_init);
  if (v2)
  {
    +[IMDualSIMUtilitiesManager _updateConversationListSIMShortNamesDictionary](IMDualSIMUtilitiesManager, "_updateConversationListSIMShortNamesDictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    conversationListSIMShortNameDictionary = v2->_conversationListSIMShortNameDictionary;
    v2->_conversationListSIMShortNameDictionary = (NSDictionary *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_19E29B80C, CFSTR("__kIMSIMSubscriptionsChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (id)activeSIMIDs
{
  return -[NSDictionary allKeys](self->_conversationListSIMShortNameDictionary, "allKeys");
}

+ (IMDualSIMUtilitiesManager)sharedManager
{
  if (qword_1ECFC7120 != -1)
    dispatch_once(&qword_1ECFC7120, &unk_1E3FB35A8);
  return (IMDualSIMUtilitiesManager *)(id)qword_1ECFC6D10;
}

+ (id)_updateConversationListSIMShortNamesDictionary
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[IMCTSubscriptionUtilities sharedInstance](IMCTSubscriptionUtilities, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ctSubscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "labelID", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDualSIMUtilitiesManager _localizedShortNameForSIMID:](IMDualSIMUtilitiesManager, "_localizedShortNameForSIMID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v2, "setObject:forKey:", v12, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v2, "copy");
  return v13;
}

- (id)shortNameForSIMLabel:(id)a3
{
  return -[NSDictionary objectForKey:](self->_conversationListSIMShortNameDictionary, "objectForKey:", a3);
}

- (void)_handleSIMSubscriptionsUpdate
{
  NSDictionary *v3;
  NSDictionary *conversationListSIMShortNameDictionary;
  id v5;

  +[IMDualSIMUtilitiesManager _updateConversationListSIMShortNamesDictionary](IMDualSIMUtilitiesManager, "_updateConversationListSIMShortNamesDictionary");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  conversationListSIMShortNameDictionary = self->_conversationListSIMShortNameDictionary;
  self->_conversationListSIMShortNameDictionary = v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__mainThreadPostNotificationName:object:", CFSTR("__kIMSIMShortNameChanged"), 0);

}

+ (id)_localizedShortNameForSIMID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "telephonyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "senderIdentityForAccountUUID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "localizedShortName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    IMLogHandleForCategory("IMDualSIMUtilitiesManager");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_19E36C608((uint64_t)v3, (uint64_t)v4, v10);

    IMLogHandleForCategory("IMDualSIMUtilitiesManager");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_19E36C594((uint64_t)v8, v11);

  }
  return v9;
}

- (NSDictionary)conversationListSIMShortNameDictionary
{
  return self->_conversationListSIMShortNameDictionary;
}

- (void)setConversationListSIMShortNameDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_conversationListSIMShortNameDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationListSIMShortNameDictionary, 0);
}

@end
