@implementation PHDeclineWithMessageController

- (void)configureDeclineMessageForButton:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_msgSend(v4, "setContextMenuEnabled:", 1);
  objc_msgSend(v4, "setContextMenuIsPrimary:", 1);
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C1118;
  v5[3] = &unk_1002875F8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setMenuProvider:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (PHDeclineWithMessageController)initWithIncomingCall:(id)a3 customMessagePresentingViewController:(id)a4 declineCallService:(id)a5
{
  id v9;
  id v10;
  id v11;
  PHDeclineWithMessageController *v12;
  PHDeclineWithMessageController *v13;
  NSString *cachedPreviouslyUsedLastAddressHandle;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PHDeclineWithMessageController;
  v12 = -[PHDeclineWithMessageController init](&v16, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_incomingCall, a3);
    objc_storeWeak((id *)&v13->_customMessagePresentingViewController, v10);
    cachedPreviouslyUsedLastAddressHandle = v13->_cachedPreviouslyUsedLastAddressHandle;
    v13->_cachedPreviouslyUsedLastAddressHandle = (NSString *)&stru_10028DC20;

    objc_storeStrong((id *)&v13->_declineCallService, a5);
  }

  return v13;
}

+ (id)dismissalAssertionReason
{
  return CFSTR("PHDeclineWithMessageControllerAssertionReason");
}

- (TUHandle)recipientHandle
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v36;
  id v37;
  unsigned int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController incomingCall](self, "incomingCall"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "handle"));

  v37 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
  v6 = objc_msgSend(v5, "destinationIdIsPseudonym");

  if (!v6)
    goto LABEL_19;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController incomingCall](self, "incomingCall"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeConversationForCall:", v8));

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteMembers"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v11)
    goto LABEL_18;
  v12 = v11;
  v36 = v9;
  v13 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(_QWORD *)v40 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v15, "validationSource") == (id)2)
      {
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "association"));
        if (v16)
        {
          v17 = (void *)v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "association"));
          if (objc_msgSend(v18, "type") != (id)2)
            goto LABEL_14;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "association"));
          if ((objc_msgSend(v19, "isPrimary") & 1) == 0)
          {

LABEL_14:
            continue;
          }
          v20 = v10;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "association"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "handle"));
          v38 = objc_msgSend(v22, "isEqualToHandle:", v37);

          v10 = v20;
          if (v38)
          {
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "handle"));

            v37 = (id)v23;
            goto LABEL_17;
          }
        }
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v12);
LABEL_17:
  v9 = v36;
LABEL_18:

LABEL_19:
  if (objc_msgSend(v37, "type") == (id)2)
  {
    v24 = (void *)CPPhoneNumberCopyCountryCodeForIncomingTextMessage(0);
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      v27 = TUActiveCountryCode();
      v26 = (id)objc_claimAutoreleasedReturnValue(v27);
    }
    v28 = v26;

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "value"));
    v30 = TUNetworkCountryCode();
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = TUNumberToDial(v29, v31, v28, 0, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

    v34 = objc_msgSend(objc_alloc((Class)TUHandle), "initWithType:value:", 2, v33);
    v37 = v34;
  }
  return (TUHandle *)v37;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController incomingCall](self, "incomingCall"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayName"));

  return (NSString *)v3;
}

- (int)addressBookIdentifier
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController incomingCall](self, "incomingCall"));
  v3 = objc_msgSend(v2, "abUID");

  return v3;
}

- (void)declineCall
{
  PHDeclineCallServiceProtocol *declineCallService;
  id v3;

  declineCallService = self->_declineCallService;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController incomingCall](self, "incomingCall"));
  -[PHDeclineCallServiceProtocol declineAnsweringWithCall:anayticsSourceForDismissal:reason:completionHandler:](declineCallService, "declineAnsweringWithCall:anayticsSourceForDismissal:reason:completionHandler:", v3, CFSTR("SBSUIInCallTransitionAnalyticsSourceDeclineWithMessage"), 4, &stru_100287618);

}

- (id)replyWithMessageStore
{
  TUReplyWithMessageStore *cachedReplyStore;
  TUReplyWithMessageStore *v4;
  TUReplyWithMessageStore *v5;

  cachedReplyStore = self->_cachedReplyStore;
  if (!cachedReplyStore)
  {
    v4 = (TUReplyWithMessageStore *)objc_alloc_init((Class)TUReplyWithMessageStore);
    v5 = self->_cachedReplyStore;
    self->_cachedReplyStore = v4;

    cachedReplyStore = self->_cachedReplyStore;
  }
  return cachedReplyStore;
}

- (void)sendDeclineWithMessageResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController recipientHandle](self, "recipientHandle"));
  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412546;
    v21 = v4;
    v22 = 2112;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "response: %@ recipientHandle: %@", (uint8_t *)&v20, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  v9 = objc_msgSend(v8, "destinationIdIsPseudonym");

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
    if (objc_msgSend(v10, "length"))
    {
      v11 = objc_msgSend(v4, "length");

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController incomingCall](self, "incomingCall"));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sendMessageIntentExtension"));

        v14 = sub_1000C5588();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v16)
          {
            LOWORD(v20) = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Using send message intent to send response", (uint8_t *)&v20, 2u);
          }

          -[PHDeclineWithMessageController sendDeclineViaIntentWithMessageResponse:extension:](self, "sendDeclineViaIntentWithMessageResponse:extension:", v4, v13);
        }
        else
        {
          if (v16)
          {
            LOWORD(v20) = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Using ChatKit to send response", (uint8_t *)&v20, 2u);
          }

          -[PHDeclineWithMessageController sendDeclineViaChatKitWithMessageResponse:](self, "sendDeclineViaChatKitWithMessageResponse:", v4);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController displayName](self, "displayName"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
          TUNotifyOfReplyWithMessage(v18, v19, -[PHDeclineWithMessageController addressBookIdentifier](self, "addressBookIdentifier"), v4);

        }
        goto LABEL_13;
      }
    }
    else
    {

    }
  }
  v17 = sub_1000C5588();
  v13 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_1001AA650((uint64_t)v5, (uint64_t)v4, v13);
LABEL_13:

}

- (void)showCustomReplyWithMessageComposer
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PHMessageComposeViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  _QWORD v17[5];
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController incomingCall](self, "incomingCall"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
  v5 = objc_msgSend(v4, "isSystemProvider");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController incomingCall](self, "incomingCall"));
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localSenderIdentity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountUUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    -[PHDeclineWithMessageController setContextForCustomReplyWithSubscriptionIdentifier:](self, "setContextForCustomReplyWithSubscriptionIdentifier:", v10);

    v11 = objc_alloc_init(PHMessageComposeViewController);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController recipientHandle](self, "recipientHandle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
    v18 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    -[PHMessageComposeViewController setRecipients:](v11, "setRecipients:", v14);

    -[PHMessageComposeViewController setBody:](v11, "setBody:", &stru_10028DC20);
    -[PHMessageComposeViewController setMessageComposeDelegate:](v11, "setMessageComposeDelegate:", self);
    -[PHMessageComposeViewController _setCanEditRecipients:](v11, "_setCanEditRecipients:", 0);
    -[PHMessageComposeViewController disableUserAttachments](v11, "disableUserAttachments");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController customMessagePresentingViewController](self, "customMessagePresentingViewController"));
    objc_msgSend(v15, "presentViewController:animated:completion:", v11, 1, 0);
  }
  else
  {
    v16 = objc_msgSend(v6, "hasSendCustomMessageCapability");

    if (!v16)
      return;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000C1EC8;
    v17[3] = &unk_1002848C0;
    v17[4] = self;
    v11 = objc_retainBlock(v17);
    -[PHDeclineWithMessageController declineCall](self, "declineCall");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHInCallUtilities sharedInstance](PHInCallUtilities, "sharedInstance"));
    objc_msgSend(v15, "requestPasscodeUnlockWithCompletion:", v11);
  }

}

- (void)sendDeclineViaChatKitWithMessageResponse:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (*v13)(void *, id, void *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  id v23;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "response: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  objc_msgSend(v7, "addListenerID:capabilities:", v9, (kFZListenerCapChats | kFZListenerCapAccounts));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v10, "_setBlocksConnectionAtResume:", 1);

  if (qword_1002DCB60 != -1)
    dispatch_once(&qword_1002DCB60, &stru_100287660);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](IMSystemMonitor, "sharedInstance"));
  objc_msgSend(v11, "_forceSuspended");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](IMSystemMonitor, "sharedInstance"));
  objc_msgSend(v12, "_forceResumed");

  v13 = (void (*)(void *, id, void *))off_1002DCB58;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController recipientHandle](self, "recipientHandle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
  v21 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController incomingCall](self, "incomingCall"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localSenderIdentity"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "accountUUID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
  v13(v16, v4, v20);

}

- (void)setContextForCustomReplyWithSubscriptionIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t (*v13)(void *, id);
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  id v21;

  v4 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setContextForCustomReplyWithSubscriptionIdenitifier: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  objc_msgSend(v7, "addListenerID:capabilities:", v9, (kFZListenerCapChats | kFZListenerCapAccounts));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v10, "_setBlocksConnectionAtResume:", 1);

  if (qword_1002DCB70 != -1)
    dispatch_once(&qword_1002DCB70, &stru_100287680);
  if (off_1002DCB68)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](IMSystemMonitor, "sharedInstance"));
    objc_msgSend(v11, "_forceSuspended");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](IMSystemMonitor, "sharedInstance"));
    objc_msgSend(v12, "_forceResumed");

    v13 = (uint64_t (*)(void *, id))off_1002DCB68;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController recipientHandle](self, "recipientHandle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
    v19 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v17 = v13(v16, v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    -[PHDeclineWithMessageController setCachedPreviouslyUsedLastAddressHandle:](self, "setCachedPreviouslyUsedLastAddressHandle:", v18);
  }

}

- (void)sendDeclineViaIntentWithMessageResponse:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000C5588();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "response: %@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHDeclineWithMessageController recipientHandle](self, "recipientHandle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personHandle"));

  v12 = objc_msgSend(objc_alloc((Class)INPerson), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v11, 0, 0, 0, 0, 0);
  v13 = objc_alloc((Class)INSendMessageIntent);
  v35 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
  v15 = objc_msgSend(v13, "initWithRecipients:content:groupName:serviceName:sender:", v14, v6, 0, 0, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "languageCode"));

  if (v17)
  {
    v18 = objc_alloc_init((Class)NSExtensionItem);
    v33 = _INExtensionItemSiriLanguageCodeKey;
    v34 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    objc_msgSend(v18, "setUserInfo:", v19);

    v32 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));

  }
  else
  {
    v20 = &__NSArray0__struct;
  }
  v21 = sub_1000C5588();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v7;
    v30 = 2112;
    v31 = v20;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Beginning extension request for %@ with input items: %@", buf, 0x16u);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000C2A48;
  v25[3] = &unk_1002876F0;
  v26 = v7;
  v27 = v15;
  v23 = v15;
  v24 = v7;
  objc_msgSend(v24, "beginExtensionRequestWithOptions:inputItems:completion:", 1, v20, v25);

}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSString *cachedPreviouslyUsedLastAddressHandle;
  NSString *v10;
  int v11;
  NSString *v12;

  v6 = a3;
  if (a4)
  {
    if (a4 == 1)
      -[PHDeclineWithMessageController declineCall](self, "declineCall");
  }
  else if (-[NSString length](self->_cachedPreviouslyUsedLastAddressHandle, "length"))
  {
    v7 = sub_1000C5588();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      cachedPreviouslyUsedLastAddressHandle = self->_cachedPreviouslyUsedLastAddressHandle;
      v11 = 138412290;
      v12 = cachedPreviouslyUsedLastAddressHandle;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resetting Context to: %@ as user cancelled custom reply", (uint8_t *)&v11, 0xCu);
    }

    -[PHDeclineWithMessageController setContextForCustomReplyWithSubscriptionIdentifier:](self, "setContextForCustomReplyWithSubscriptionIdentifier:", self->_cachedPreviouslyUsedLastAddressHandle);
  }
  v10 = self->_cachedPreviouslyUsedLastAddressHandle;
  self->_cachedPreviouslyUsedLastAddressHandle = (NSString *)&stru_10028DC20;

  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (TUCall)incomingCall
{
  return (TUCall *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIncomingCall:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (UIViewController)customMessagePresentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_customMessagePresentingViewController);
}

- (void)setCustomMessagePresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_customMessagePresentingViewController, a3);
}

- (TUReplyWithMessageStore)cachedReplyStore
{
  return (TUReplyWithMessageStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedReplyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)cachedPreviouslyUsedLastAddressHandle
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedPreviouslyUsedLastAddressHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PHDeclineCallServiceProtocol)declineCallService
{
  return (PHDeclineCallServiceProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeclineCallService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declineCallService, 0);
  objc_storeStrong((id *)&self->_cachedPreviouslyUsedLastAddressHandle, 0);
  objc_storeStrong((id *)&self->_cachedReplyStore, 0);
  objc_destroyWeak((id *)&self->_customMessagePresentingViewController);
  objc_storeStrong((id *)&self->_incomingCall, 0);
}

@end
