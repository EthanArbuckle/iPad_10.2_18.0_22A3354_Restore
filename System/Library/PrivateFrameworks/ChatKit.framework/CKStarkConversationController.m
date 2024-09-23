@implementation CKStarkConversationController

- (CKStarkConversationController)initWithInterfaceController:(id)a3
{
  id v5;
  CKStarkConversationController *v6;
  CKStarkConversationController *v7;
  uint64_t v8;
  CPSessionConfiguration *sessionConfiguration;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CPListTemplate *conversationListTemplate;
  id v15;
  CPListTemplate *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKStarkConversationController;
  v6 = -[CKStarkConversationController init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_interfaceController, a3);
    -[CPInterfaceController setDelegate:](v7->_interfaceController, "setDelegate:", v7);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C93348]), "initWithDelegate:", v7);
    sessionConfiguration = v7->_sessionConfiguration;
    v7->_sessionConfiguration = (CPSessionConfiguration *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C93310]);
    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "initWithTitle:sections:", v12, MEMORY[0x1E0C9AA60]);
    conversationListTemplate = v7->_conversationListTemplate;
    v7->_conversationListTemplate = (CPListTemplate *)v13;

    v15 = objc_alloc_init(MEMORY[0x1E0C93318]);
    objc_msgSend(v15, "setButtonStyle:", 1);
    v16 = v7->_conversationListTemplate;
    v21[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPListTemplate setTrailingNavigationBarButtons:](v16, "setTrailingNavigationBarButtons:", v17);

    -[CPInterfaceController setRootTemplate:animated:](v7->_interfaceController, "setRootTemplate:animated:", v7->_conversationListTemplate, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v7, sel_conversationListDidChange_, CFSTR("CKConversationListConversationLeftNotification"), 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v7, sel_conversationListDidChange_, CFSTR("CKConversationListFinishedLoadingNotification"), 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v7, sel_conversationListDidChange_, CFSTR("CKConversationListChangedNotification"), 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v7, sel_conversationListDidChange_, *MEMORY[0x1E0D352F0], 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v7, sel_conversationListDidChange_, *MEMORY[0x1E0D35328], 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", v7, sel_conversationListDidChange_, *MEMORY[0x1E0D354E0], 0);

  }
  return v7;
}

- (void)templateWillAppear:(id)a3 animated:(BOOL)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[CKStarkConversationController templateWillAppear:animated:]";
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Resorting and reloading conversation table for: %s", (uint8_t *)&v7, 0xCu);
    }

  }
  -[CKStarkConversationController _resortAndReloadData](self, "_resortAndReloadData");

}

- (void)conversationListDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Resorting and reloading conversation table for notification: %@", (uint8_t *)&v7, 0xCu);

    }
  }
  -[CKStarkConversationController _resortAndReloadData](self, "_resortAndReloadData");

}

- (void)sessionConfiguration:(id)a3 contentStyleChanged:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[CKStarkConversationController sessionConfiguration:contentStyleChanged:]";
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Resorting and reloading conversation table for: %s", (uint8_t *)&v7, 0xCu);
    }

  }
  -[CKStarkConversationController _resortAndReloadData](self, "_resortAndReloadData");

}

- (void)_resortAndReloadData
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[16];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Resorting and reloading conversation table", buf, 2u);
    }

  }
  -[CKStarkConversationController timeFormatter](self, "timeFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v6, "setDateStyle:", 0);
    objc_msgSend(v6, "setTimeStyle:", 1);
    objc_msgSend(v7, "setDateStyle:", 1);
    objc_msgSend(v7, "setTimeStyle:", 0);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocale:", v8);

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocale:", v9);

    objc_msgSend(v7, "setDoesRelativeDateFormatting:", 1);
    -[CKStarkConversationController setDateFormatter:](self, "setDateFormatter:", v7);
    -[CKStarkConversationController setTimeFormatter:](self, "setTimeFormatter:", v6);

  }
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "resort");
  objc_msgSend(v27, "updateConversationListsAndSortIfEnabled");
  objc_msgSend(v27, "conversationsForFilterMode:", CKMessageUnknownFilteringEnabled() != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isStewieActive");

  if ((v12 & 1) == 0)
  {
    -[CKStarkConversationController _filterStewieConversation:](self, "_filterStewieConversation:", v10);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  v14 = objc_msgSend(v10, "count");
  if (v14 >= 0xA)
    v15 = 10;
  else
    v15 = v14;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    for (i = 0; i != v15; ++i)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc(MEMORY[0x1E0C93320]);
      -[CKStarkConversationController dateFormatter](self, "dateFormatter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKStarkConversationController timeFormatter](self, "timeFormatter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPInterfaceController carTraitCollection](self->_interfaceController, "carTraitCollection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v19, "initWithConversation:dateFormatter:timeFormatter:traitCollection:", v18, v20, v21, v22);

      objc_msgSend(v16, "addObject:", v23);
    }
  }
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C93308]), "initWithItems:", v16);
  -[CKStarkConversationController conversationListTemplate](self, "conversationListTemplate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "updateSections:", v26);

}

- (id)_filterStewieConversation:(id)a3
{
  return (id)objc_msgSend(a3, "__imArrayByFilteringWithBlock:", &__block_literal_global_37);
}

uint64_t __59__CKStarkConversationController__filterStewieConversation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isStewieConversation") ^ 1;
}

- (CPInterfaceController)interfaceController
{
  return self->_interfaceController;
}

- (void)setInterfaceController:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceController, a3);
}

- (CPListTemplate)conversationListTemplate
{
  return self->_conversationListTemplate;
}

- (void)setConversationListTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_conversationListTemplate, a3);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (NSDateFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (void)setTimeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_timeFormatter, a3);
}

- (CPSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sessionConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_conversationListTemplate, 0);
  objc_storeStrong((id *)&self->_interfaceController, 0);
}

@end
