@implementation IMAssistantMessageHandlerDefaultDataSource

- (IMAssistantChatDataSource)chatDataSource
{
  return (IMAssistantChatDataSource *)MEMORY[0x24BEDD108](MEMORY[0x24BE502A8], sel_sharedRegistry);
}

- (IMAssistantContactsDataSource)contactsDataSource
{
  CNContactStore *v3;
  CNContactStore *contactStore;
  NSObject *v5;
  uint8_t v7[16];

  if (!self->_contactStore)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x24BDBACF8]);
    contactStore = self->_contactStore;
    self->_contactStore = v3;

    if (!self->_contactStore)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, "Failed to allocate contact store", v7, 2u);
        }

      }
    }
  }
  return (IMAssistantContactsDataSource *)self->_contactStore;
}

- (IMAssistantAccountDataSource)accountDataSource
{
  return (IMAssistantAccountDataSource *)+[IMAssistantAccountDefaultDataSource sharedInstance](IMAssistantAccountDefaultDataSource, "sharedInstance");
}

- (IMAssistantCoreTelephonySubscriptionsDataSource)coreTelephonySubscriptionsDataSource
{
  return (IMAssistantCoreTelephonySubscriptionsDataSource *)+[IMAssistantCoreTelephonySubscriptionsDefaultDataSource sharedInstance](IMAssistantCoreTelephonySubscriptionsDefaultDataSource, "sharedInstance");
}

- (IMLocationManager)locationManagerDataSource
{
  return (IMLocationManager *)objc_msgSend(MEMORY[0x24BE50308], "sharedInstance");
}

- (IMAssistantFileManager)fileManagerDataSource
{
  return (IMAssistantFileManager *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
}

- (IMFileTransferCenter)fileTransferCenterDataSource
{
  return (IMFileTransferCenter *)objc_msgSend(MEMORY[0x24BE502E0], "sharedInstance");
}

- (IMAssistantCommSafetyManager)commSafetyDataSource
{
  IMAssistantCommSafetyManager *v2;
  void *v3;
  void *v4;
  IMAssistantCommSafetyManager *v5;

  v2 = [IMAssistantCommSafetyManager alloc];
  objc_msgSend(MEMORY[0x24BE511C0], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE511C8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMAssistantCommSafetyManager initWithCommSafetyRequestsManager:commSafetySettingsManager:](v2, "initWithCommSafetyRequestsManager:commSafetySettingsManager:", v3, v4);

  return v5;
}

- (NSCache)handleToContactIdentifierCache
{
  if (qword_25548BA28 != -1)
    dispatch_once(&qword_25548BA28, &unk_24E396100);
  -[IMAssistantMessageHandlerDefaultDataSource registerForContactStoreChangeNotificationsIfNecessary](self, "registerForContactStoreChangeNotificationsIfNecessary");
  return (NSCache *)(id)qword_25548BA20;
}

- (NSCache)spiHandleToPersonCache
{
  if (qword_25548BA38 != -1)
    dispatch_once(&qword_25548BA38, &unk_24E396120);
  -[IMAssistantMessageHandlerDefaultDataSource registerForContactStoreChangeNotificationsIfNecessary](self, "registerForContactStoreChangeNotificationsIfNecessary");
  return (NSCache *)(id)qword_25548BA30;
}

- (NSCache)contactIdentifierToUnifiedContactIdentifierCache
{
  if (qword_25548BA48 != -1)
    dispatch_once(&qword_25548BA48, &unk_24E396140);
  -[IMAssistantMessageHandlerDefaultDataSource registerForContactStoreChangeNotificationsIfNecessary](self, "registerForContactStoreChangeNotificationsIfNecessary");
  return (NSCache *)(id)qword_25548BA40;
}

- (void)contactStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21ED90000, v5, OS_LOG_TYPE_INFO, "Contact store change notification received.", v9, 2u);
    }

  }
  -[IMAssistantMessageHandlerDefaultDataSource handleToContactIdentifierCache](self, "handleToContactIdentifierCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[IMAssistantMessageHandlerDefaultDataSource spiHandleToPersonCache](self, "spiHandleToPersonCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[IMAssistantMessageHandlerDefaultDataSource contactIdentifierToUnifiedContactIdentifierCache](self, "contactIdentifierToUnifiedContactIdentifierCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)registerForContactStoreChangeNotificationsIfNecessary
{
  void *v3;

  if (!self->_didRegisterForContactStoreChangeNotifications)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_contactStoreDidChange_, *MEMORY[0x24BDBA3D0], 0);

    self->_didRegisterForContactStoreChangeNotifications = 1;
  }
}

- (BOOL)isInternationalSpamFilteringEnabled
{
  return objc_msgSend(MEMORY[0x24BE51308], "isInternationalSpamFilteringEnabled");
}

- (BOOL)screentimeAllowedToShowChat:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  char v10;
  BOOL v11;
  int v12;
  _QWORD *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v5 = a3;
  _IMAssistantCoreGeneralSignpostLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "screentimeAllowedToShowChat", (const char *)&unk_21EDC1733, buf, 2u);
  }

  v10 = objc_msgSend(v5, "allowedByScreenTime");
  v11 = v10;
  if (a4 && (v10 & 1) == 0)
  {
    v12 = objc_msgSend(v5, "allowedToShowConversationSync");
    v13 = (_QWORD *)MEMORY[0x24BDDA4A8];
    if (!v12)
      v13 = (_QWORD *)MEMORY[0x24BDDA498];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMAssistantMessageHandlerErrorDomain"), *v13, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  _IMAssistantCoreGeneralSignpostLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v15, OS_SIGNPOST_INTERVAL_END, v7, "screentimeAllowedToShowChat", (const char *)&unk_21EDC1733, v17, 2u);
  }

  return v11;
}

- (BOOL)screentimeAllowedToShowConversationWithHandleIDs:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  char v11;
  id v12;
  int v13;
  _QWORD *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v18[8];
  id v19;
  uint8_t buf[16];

  v5 = a3;
  _IMAssistantCoreGeneralSignpostLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "screentimeAllowedToShowConversationWithHandleIDs", (const char *)&unk_21EDC1733, buf, 2u);
  }

  if (objc_msgSend(MEMORY[0x24BE502D8], "isContactLimitsFeatureEnabled"))
  {
    objc_msgSend(MEMORY[0x24BE502D8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v11 = objc_msgSend(v10, "allowedToShowConversationWithHandleIDs:sync:context:", v5, 1, &v19);
    v12 = v19;

    if (a4 && (v11 & 1) == 0)
    {
      v13 = objc_msgSend(v12, "applicationCurrentlyLimited");
      v14 = (_QWORD *)MEMORY[0x24BDDA498];
      if (!v13)
        v14 = (_QWORD *)MEMORY[0x24BDDA4A8];
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMAssistantMessageHandlerErrorDomain"), *v14, 0);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = 0;
    v11 = 1;
  }
  _IMAssistantCoreGeneralSignpostLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v16, OS_SIGNPOST_INTERVAL_END, v7, "screentimeAllowedToShowConversationWithHandleIDs", (const char *)&unk_21EDC1733, v18, 2u);
  }

  return v11;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21EDAF3DC;
  block[3] = &unk_24E3960E0;
  block[4] = a1;
  if (qword_25548BA58 != -1)
    dispatch_once(&qword_25548BA58, block);
  return (id)qword_25548BA50;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (BOOL)didRegisterForContactStoreChangeNotifications
{
  return self->_didRegisterForContactStoreChangeNotifications;
}

- (void)setDidRegisterForContactStoreChangeNotifications:(BOOL)a3
{
  self->_didRegisterForContactStoreChangeNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
