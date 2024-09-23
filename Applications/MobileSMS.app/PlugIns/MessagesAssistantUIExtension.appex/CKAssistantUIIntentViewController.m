@implementation CKAssistantUIIntentViewController

+ (void)connectIfNeeded
{
  if (qword_10000D068 != -1)
    dispatch_once(&qword_10000D068, &stru_100008288);
}

- (void)viewDidLayoutSubviews
{
  CKAssistantUIContentView *snippetContentView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAssistantUIIntentViewController;
  -[CKAssistantUIIntentViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  snippetContentView = self->_snippetContentView;
  if (snippetContentView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKAssistantUIIntentViewController view](self, "view"));
    objc_msgSend(v4, "bounds");
    -[CKAssistantUIContentView setFrame:](snippetContentView, "setFrame:");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAssistantUIIntentViewController;
  -[CKAssistantUIIntentViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKAssistantUIIntentViewController chatController](self, "chatController"));

  if (!v4)
    -[CKAssistantUIIntentViewController _configureSnippetContentViewWithChatAndContactsForAvatarView](self, "_configureSnippetContentViewWithChatAndContactsForAvatarView");
}

- (BOOL)displaysMessage
{
  return 1;
}

- (void)desiresInteractivity:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 context:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  INParameter *v11;
  void *v12;
  INParameter *v13;
  void *v14;
  INParameter *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v9 = a6;
  v10 = a4;
  v11 = +[INParameter parameterForClass:keyPath:](INParameter, "parameterForClass:keyPath:", objc_opt_class(INSendMessageIntent), CFSTR("recipients"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = +[INParameter parameterForClass:keyPath:](INParameter, "parameterForClass:keyPath:", objc_opt_class(INSendMessageIntent), CFSTR("content"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = +[INParameter parameterForClass:keyPath:](INParameter, "parameterForClass:keyPath:", objc_opt_class(INSendMessageIntent), CFSTR("speakableGroupName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v14, v16, 0));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100003FB4;
  v20[3] = &unk_1000082B0;
  v21 = v17;
  v22 = v9;
  v18 = v17;
  v19 = v9;
  -[CKAssistantUIIntentViewController configureWithInteraction:context:completion:](self, "configureWithInteraction:context:completion:", v10, a5, v20);

}

- (void)configureWithInteraction:(id)a3 context:(unint64_t)a4 completion:(id)a5
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  INSendMessageIntent **p_configuredIntent;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;

  v6 = a3;
  v7 = (void (**)(_QWORD))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "intent"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "intentResponse"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = objc_opt_class(INSendMessageIntent);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    if ((IMGetDomainBoolForKey(CFSTR("com.apple.MobileSMS"), CFSTR("kEnableEnhancedSiriUI")) & 1) != 0)
    {
      p_configuredIntent = &self->_configuredIntent;
      objc_storeStrong((id *)&self->_configuredIntent, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[INSendMessageIntent recipients](self->_configuredIntent, "recipients"));
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v35 != v14)
              objc_enumerationMutation(v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "displayName"));
            objc_msgSend(v9, "addObject:", v16);

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v13);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[INSendMessageIntent speakableGroupName](*p_configuredIntent, "speakableGroupName"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "spokenPhrase"));

      v19 = objc_claimAutoreleasedReturnValue(-[INSendMessageIntent content](*p_configuredIntent, "content"));
      v20 = (void *)v19;
      v21 = &stru_100008390;
      if (v19)
        v21 = (__CFString *)v19;
      v22 = v21;

      v24 = v33
         && (v23 = objc_opt_class(INSendMessageIntentResponse), (objc_opt_isKindOfClass(v33, v23) & 1) != 0)
         && objc_msgSend(v33, "code") == (id)3;
      if (v18)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v18));
      }
      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", ")));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v31));

      }
      -[CKAssistantUIIntentViewController _configureSnippetContentViewWithToField:contactsForAvatarView:messageContent:sent:](self, "_configureSnippetContentViewWithToField:contactsForAvatarView:messageContent:sent:", v30, 0, v22, v24);
      -[CKAssistantUIContentView setNeedsLayout](self->_snippetContentView, "setNeedsLayout");
      if (v7)
      {
        -[CKAssistantUIIntentViewController desiredSize](self, "desiredSize");
        v7[2](v7);
      }

      goto LABEL_34;
    }
    if (IMOSLoggingEnabled())
    {
      v27 = OSLogHandleForIMFoundationCategory("IMAssistantUI");
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        *(_DWORD *)buf = 138412290;
        v40 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "EnableEnhancedSiriUI not enabled, not using Assistant UI extension : %@", buf, 0xCu);

      }
    }
    if (v7)
LABEL_20:
      ((void (*)(void (**)(_QWORD), CGFloat, CGFloat))v7[2])(v7, CGSizeZero.width, CGSizeZero.height);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory("IMAssistantUI");
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v8;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Unhandled intent: %@, not using Assistant UI extension", buf, 0xCu);
      }

    }
    if (v7)
      goto LABEL_20;
  }
LABEL_34:

}

- (CGSize)desiredSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKAssistantUIIntentViewController extensionContext](self, "extensionContext"));
  objc_msgSend(v3, "hostedViewMaximumAllowedSize");
  v5 = v4;
  v7 = v6;

  -[CKAssistantUIContentView sizeThatFits:](self->_snippetContentView, "sizeThatFits:", v5, v7);
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_configureSnippetContentViewWithToField:(id)a3 contactsForAvatarView:(id)a4 messageContent:(id)a5 sent:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  CKAssistantUIContentView *snippetContentView;
  CKAssistantUIContentView *v13;
  CKAssistantUIContentView *v14;
  void *v15;
  id v16;

  v6 = a6;
  v16 = a3;
  v10 = a4;
  v11 = a5;
  snippetContentView = self->_snippetContentView;
  if (!snippetContentView)
  {
    v13 = -[CKAssistantUIContentView initWithFrame:]([CKAssistantUIContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v14 = self->_snippetContentView;
    self->_snippetContentView = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKAssistantUIIntentViewController view](self, "view"));
    objc_msgSend(v15, "addSubview:", self->_snippetContentView);

    snippetContentView = self->_snippetContentView;
  }
  -[CKAssistantUIContentView setToFieldText:](snippetContentView, "setToFieldText:", v16);
  -[CKAssistantUIContentView setContactsForAvatarView:](self->_snippetContentView, "setContactsForAvatarView:", v10);
  -[CKAssistantUIContentView setMessageContent:sent:](self->_snippetContentView, "setMessageContent:sent:", v11, v6);

}

- (void)_configureSnippetContentViewWithChatAndContactsForAvatarView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  CKAssistantUIChatController *v32;
  CKAssistantUIContentView *snippetContentView;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  int v44;
  void *v45;
  __int16 v46;
  id v47;
  void *v48;
  _BYTE v49[244];

  if (self->_snippetContentView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[INSendMessageIntent recipients](self->_configuredIntent, "recipients"));
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "customIdentifier"));

          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "customIdentifier"));
            objc_msgSend(v3, "addObject:", v12);

          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactIdentifier"));

          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactIdentifier"));
            objc_msgSend(v4, "addObject:", v14);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v7);
    }

    objc_msgSend((id)objc_opt_class(self), "connectIfNeeded");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[INSendMessageIntent conversationIdentifier](self->_configuredIntent, "conversationIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry"));
    v16 = v15;
    if (v37)
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "existingChatWithChatIdentifier:", v37));
    else
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "existingChatForAddresses:allowRetargeting:bestHandles:", v3, 0, 0));

    if (v38
      || objc_msgSend(v3, "count") == (id)1
      && (v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry")),
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject")),
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "existingChatWithChatIdentifier:", v24)),
          v24,
          v23,
          v38))
    {
      v19 = objc_msgSend(objc_alloc((Class)CKConversation), "initWithChat:", v38);
      v20 = v19;
      if (v19)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "displayName"));
        v22 = v21 == 0;

        if (!v22)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "orderedContactsForAvatarView"));
          -[CKAssistantUIContentView setContactsForAvatarView:](self->_snippetContentView, "setContactsForAvatarView:", v36);
LABEL_35:
          objc_msgSend(v20, "setLoadedMessageCount:", 10);
          v32 = -[CKAssistantUIChatController initWithConversation:]([CKAssistantUIChatController alloc], "initWithConversation:", v20);
          -[CKAssistantUIChatController beginHoldingScrollGeometryUpdatesForReason:](v32, "beginHoldingScrollGeometryUpdatesForReason:", CKScrollViewHoldingScrollGeometryReasonTypeSiriKitUIExtensionPermanentHold);
          -[CKAssistantUIIntentViewController setChatController:](self, "setChatController:", v32);
          snippetContentView = self->_snippetContentView;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKAssistantUIChatController view](v32, "view"));
          -[CKAssistantUIContentView setChatContent:](snippetContentView, "setChatContent:", v34);

LABEL_36:
          return;
        }
        v35 = 0;
LABEL_29:
        v25 = objc_alloc_init((Class)CNContactStore);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v4));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[CNAvatarView descriptorForRequiredKeys](CNAvatarView, "descriptorForRequiredKeys"));
        v48 = v27;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
        v39 = 0;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "unifiedContactsMatchingPredicate:keysToFetch:error:", v26, v28, &v39));
        v29 = v39;

        if (v29 && IMOSLoggingEnabled())
        {
          v30 = OSLogHandleForIMFoundationCategory("IMAssistantUI");
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v44 = 138412546;
            v45 = v4;
            v46 = 2112;
            v47 = v29;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Error fetching contact with identifiers %@. Error: %@", (uint8_t *)&v44, 0x16u);
          }

        }
        -[CKAssistantUIContentView setContactsForAvatarView:](self->_snippetContentView, "setContactsForAvatarView:", v36);
        if ((v35 & 1) != 0)
          goto LABEL_36;
        goto LABEL_35;
      }
    }
    else
    {
      v20 = 0;
      v38 = 0;
    }
    v35 = 1;
    goto LABEL_29;
  }
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory("IMAssistantUI");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v44) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "SnippetContentView must exist before configuring chat and contact avatars", (uint8_t *)&v44, 2u);
    }

  }
}

- (CKAssistantUIContentView)snippetContentView
{
  return self->_snippetContentView;
}

- (void)setSnippetContentView:(id)a3
{
  objc_storeStrong((id *)&self->_snippetContentView, a3);
}

- (CKAssistantUIChatController)chatController
{
  return self->_chatController;
}

- (void)setChatController:(id)a3
{
  objc_storeStrong((id *)&self->_chatController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatController, 0);
  objc_storeStrong((id *)&self->_snippetContentView, 0);
  objc_storeStrong((id *)&self->_configuredIntent, 0);
}

@end
