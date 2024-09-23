@implementation SMSApplication

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  sub_100004358(v7);
  v10.receiver = self;
  v10.super_class = (Class)SMSApplication;
  -[SMSApplication finishedTest:extraResults:](&v10, "finishedTest:extraResults:", v7, v6);

  if (__CurrentTestName)
  {
    -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("PPTDidShowConversationEvent"), 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "removeObserver:name:object:", self, UIWindowDidRotateNotification, 0);

  }
  -[SMSApplication cleanupCurrentTest](self, "cleanupCurrentTest");
}

- (void)cleanupCurrentTest
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)__CurrentTestName;
  __CurrentTestName = 0;

  v3 = (void *)qword_10003AE50;
  qword_10003AE50 = 0;

  v4 = (void *)qword_10003AE68;
  qword_10003AE68 = 0;

  byte_10003AE70 = 0;
  byte_10003AE71 = 0;
}

- (id)_extendLaunchTest
{
  return CFSTR("LaunchToBecomeResponsive");
}

- (SHKMessagesLaunchEventContext)pendingLaunchEventContext
{
  return self->_pendingLaunchEventContext;
}

- (NSDictionary)pendingAppleEventInfoDictionary
{
  return self->_pendingAppleEventInfoDictionary;
}

- (BOOL)isRunningViaTestRunner
{
  return self->_runningViaTestRunner;
}

- (BOOL)isRunningTest
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMSApplication;
  if (-[SMSApplication isRunningTest](&v4, "isRunningTest"))
    return 1;
  else
    return -[SMSApplication isRunningViaTestRunner](self, "isRunningViaTestRunner");
}

- (SMSApplication)init
{
  SMSApplication *v2;
  BOOL v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD block[4];
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[8];

  v20.receiver = self;
  v20.super_class = (Class)SMSApplication;
  v2 = -[SMSApplication init](&v20, "init");
  if (v2)
  {
    if (CKIsRunningForDevelopmentOnSimulator())
      v3 = 0;
    else
      v3 = CKIsRunningUITests() == 0;
    if (((kFZListenerCapSendMessages | kFZListenerCapChats) & CKListenerCapabilities()) == 0 || v3)
      goto LABEL_17;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001EE20;
    block[3] = &unk_100031230;
    v15 = CFSTR("+15555648583");
    v16 = CFSTR("+18885551212");
    v17 = CFSTR("john-appleseed@mac.com");
    v18 = CFSTR("kate-bell@mac.com");
    v19 = CFSTR("+18885551213");
    if (qword_10003AF50 != -1)
      dispatch_once(&qword_10003AF50, block);
    if (CKIsRunningUITests())
    {
      v23[0] = qword_10003AF10;
      v23[1] = qword_10003AF18;
      v23[2] = qword_10003AF20;
      v23[3] = qword_10003AF28;
      v23[4] = qword_10003AF30;
      v23[5] = qword_10003AF38;
      v23[6] = qword_10003AF40;
      v23[7] = qword_10003AF48;
      v4 = v23;
      v5 = 8;
    }
    else
    {
      if (CKIsRunningForDevelopmentOnSimulator())
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](IMLockdownManager, "sharedInstance"));
        v7 = objc_msgSend(v6, "isInternalInstall");

        if (v7)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKIMSimulatedChat prepopulatedChat](CKIMSimulatedChat, "prepopulatedChat"));
          v22[0] = qword_10003AF10;
          v22[1] = qword_10003AF18;
          v22[2] = v8;
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3));

LABEL_16:
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry"));
          objc_msgSend(v10, "_setSimulatedChats:", v9);

          v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
          objc_msgSend(v11, "setListeners:", v9);

LABEL_17:
          +[IMChat setChatItemRulesClass:](IMChat, "setChatItemRulesClass:", objc_opt_class(CKTranscriptChatItemRules));
          v12 = +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
          -[SMSApplication _connectToDaemon](v2, "_connectToDaemon");
          -[SMSApplication _registerForAppleEventsIfNecessary](v2, "_registerForAppleEventsIfNecessary");
          return v2;
        }
      }
      v21[0] = qword_10003AF10;
      v21[1] = qword_10003AF18;
      v4 = v21;
      v5 = 2;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, v5));
    goto LABEL_16;
  }
  return v2;
}

- (void)_connectToDaemon
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  IMDaemonMultiplexedConnectionManaging *v7;
  IMDaemonMultiplexedConnectionManaging *daemonConnection;
  id v9;

  v3 = CKListenerCapabilities(self, a2) | 0x60400000;
  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMPinnedConversationsController sharedInstance](IMPinnedConversationsController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pinnedConversationIdentifiers"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, IMClientSetupContextPinnedChatIdentifiers);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedController](IMDaemonController, "sharedController"));
  v7 = (IMDaemonMultiplexedConnectionManaging *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "multiplexedConnectionWithLabel:capabilities:context:", CFSTR("MobileSMS"), v3, v9));
  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = v7;

}

- (void)_clearFailureBadge
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("__kMessagesBadgeControllerClearFailureBadgeNotification"), 0, 0, 1u);
}

- (void)startScreenshotTestWithOptions:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("testName")));
  if (!IMIsRunningInScreenshotTesting())
    exit(-1);
  if (!+[SMSScreenshotTestInfo screenshotTestNameEnumValue:](SMSScreenshotTestInfo, "screenshotTestNameEnumValue:", v4))-[SMSApplication startTranscriptOnlyScreenshotTestwithOptions:](self, "startTranscriptOnlyScreenshotTestwithOptions:", v5);

}

- (void)startTranscriptOnlyScreenshotTestwithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("chatIdentifier")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversationForExistingChatWithChatIdentifier:", v5));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
    objc_msgSend(v8, "setDraft:forConversation:", 0, v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
    objc_msgSend(v9, "saveCompositionAndFlushCache:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    objc_msgSend(v10, "showConversationListWithAnimation:", 0);

    v11 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006EA8;
    block[3] = &unk_100030A58;
    block[4] = self;
    v13 = v7;
    v14 = v4;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (id)sceneController
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication delegate](self, "delegate"));
  v3 = objc_opt_class(SMSApplicationDelegate);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sceneController"));
  else
    v4 = 0;

  return v4;
}

- (id)messagesController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication sceneController](self, "sceneController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messagesSceneDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messagesController"));

  return v4;
}

- (BOOL)runTestNameOrFallback:(id)a3
{
  NSString *v4;
  SEL v5;
  SEL v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;
  BOOL v10;

  v4 = (NSString *)a3;
  v5 = NSSelectorFromString(v4);
  if (v5 && (v6 = v5, (objc_opt_respondsToSelector(self, v5) & 1) != 0)
    || (v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("implementationMethodName")))) != 0
    && (v8 = v7, v6 = NSSelectorFromString(v7), v8, v6))
  {
    if (-[NSString rangeOfString:](v4, "rangeOfString:", CFSTR("Landscape")) == (id)0x7FFFFFFFFFFFFFFFLL)
      v9 = 1;
    else
      v9 = 3;
    if ((objc_msgSend(UIApp, "rotateIfNeeded:", v9) & 1) == 0)
      -[SMSApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", v6, 0, 0.5);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD *v18;
  char v19;
  _QWORD *v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;

  v7 = a3;
  v8 = a4;
  +[IMBalloonPluginManager setIsRunningPPT:](IMBalloonPluginManager, "setIsRunningPPT:", 1);
  v9 = IMGetDomainValueForKey(CFSTR("com.apple.MobileSMS"), CFSTR("MemoryUsageAndLeaks"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v10 && objc_msgSend(v10, "BOOLValue"))
  {
    if (qword_10003AE58)
      sub_10001EAC8(qword_10003AE58, 0, 0);
    qword_10003AE58 = (uint64_t)sub_10001E720();
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "didShowAMessage:", CFSTR("PPTDidShowConversationEvent"), 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "didChangeOrientation:", CFSTR("PPTDidTransitionToSize"), 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "addObserver:selector:name:object:", self, "chatRegistryDidLoad:", IMChatRegistryDidLoadNotification, 0);

  objc_storeStrong((id *)&__CurrentTestName, a3);
  objc_storeStrong((id *)&qword_10003AE50, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("iterations")));
  dword_10003AE60 = objc_msgSend(v15, "intValue") + 1;

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000073F8;
  v23[3] = &unk_100030A80;
  v23[4] = self;
  v16 = v7;
  v24 = v16;
  v17 = v8;
  v25 = v17;
  v18 = objc_retainBlock(v23);
  if (-[SMSApplication canRunTests](self, "canRunTests"))
  {
    v19 = ((uint64_t (*)(_QWORD *))v18[2])(v18);
  }
  else
  {
    NSLog(CFSTR("No chats, deferring"));
    v20 = objc_retainBlock(v18);
    v21 = (void *)qword_10003AE68;
    qword_10003AE68 = (uint64_t)v20;

    v19 = 1;
  }

  return v19;
}

- (void)finishedTest:(id)a3 waitForCommit:(BOOL)a4 extraResults:(id)a5 withTeardownBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  sub_100004358(v12);
  v13.receiver = self;
  v13.super_class = (Class)SMSApplication;
  -[SMSApplication finishedTest:waitForCommit:extraResults:withTeardownBlock:](&v13, "finishedTest:waitForCommit:extraResults:withTeardownBlock:", v12, v7, v11, v10);

}

- (void)failedTest:(id)a3 withFailure:(id)a4 withResults:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SMSApplication cleanupCurrentTest](self, "cleanupCurrentTest");
  v11.receiver = self;
  v11.super_class = (Class)SMSApplication;
  -[SMSApplication failedTest:withFailure:withResults:](&v11, "failedTest:withFailure:withResults:", v10, v9, v8);

}

- (void)failedTest:(id)a3 withFailure:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[SMSApplication cleanupCurrentTest](self, "cleanupCurrentTest");
  v8.receiver = self;
  v8.super_class = (Class)SMSApplication;
  -[SMSApplication failedTest:withFailure:](&v8, "failedTest:withFailure:", v7, v6);

}

- (void)failedTest:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[SMSApplication cleanupCurrentTest](self, "cleanupCurrentTest");
  v5.receiver = self;
  v5.super_class = (Class)SMSApplication;
  -[SMSApplication failedTest:](&v5, "failedTest:", v4);

}

- (void)showConversationForChatIdentifier:(id)a3 willShowConversation:(id)a4 didShowConversation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD v14[4];
  id v15;
  SMSApplication *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "conversations"));

  if (objc_msgSend(v12, "count"))
  {
    -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
    v13 = dispatch_time(0, 500000000);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000080F0;
    v14[3] = &unk_100030AD0;
    v15 = v8;
    v16 = self;
    v17 = v10;
    v18 = v9;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v14);

  }
  else
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }

}

- (void)doPushToTranscriptTestForChatIdentifierPerformanceTest:(id)a3 testBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];

  v6 = a4;
  v7 = a3;
  v12 = v6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000834C;
  v13[3] = &unk_100030A30;
  v13[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008360;
  v10[3] = &unk_100030AF8;
  v11 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = v11;
  v9 = v6;
  -[SMSApplication showConversationForChatIdentifier:willShowConversation:didShowConversation:](self, "showConversationForChatIdentifier:willShowConversation:didShowConversation:", v7, v13, v10);

}

- (void)showTransscriptAnimated:(BOOL)a3
{
  dispatch_time_t v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = dispatch_time(0, 1000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000083F8;
  v6[3] = &unk_100030B20;
  v6[4] = self;
  v7 = a3;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)showTranscriptList
{
  -[SMSApplication showTransscriptAnimated:](self, "showTransscriptAnimated:", 1);
}

- (void)showTranscriptListNotAnimated
{
  -[SMSApplication showTransscriptAnimated:](self, "showTransscriptAnimated:", 0);
}

- (void)showKeyboard
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chatController"));
  objc_msgSend(v2, "showKeyboardForReply");

}

- (void)scrollPseudoContacts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ppt_chatController"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "composeRecipientSelectionController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchListController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableView"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("offset")));
  v7 = objc_msgSend(v6, "intValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("iterations")));
  v9 = objc_msgSend(v8, "intValue");

  objc_msgSend(v5, "_performScrollTest:iterations:delta:", __CurrentTestName, v9, v7);
}

- (void)tapFSMIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (objc_msgSend(__CurrentTestName, "rangeOfString:", CFSTR("FSM")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chatController"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionViewController"));
    v19 = v4;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "visibleCells"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v12 = objc_opt_class(CKTranscriptStatusCell);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          {
            v13 = v11;
            v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "statusButton"));
            if (v14)
            {
              v15 = (void *)v14;
              v16 = objc_opt_respondsToSelector(v5, "touchUpInsideCellStatusButton:");

              if ((v16 & 1) != 0)
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "statusButton"));
                objc_msgSend(v5, "touchUpInsideCellStatusButton:", v17);

                goto LABEL_15;
              }
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_15:

  }
}

- (void)scrollTranscript
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  id v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chatController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewController"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("recapBased")));
  LODWORD(v3) = objc_msgSend(v5, "BOOLValue");

  if ((_DWORD)v3 && objc_msgSend(sub_100008914(), "isRecapAvailable"))
  {
    v6 = objc_msgSend(objc_alloc((Class)sub_1000089CC()), "initWithTestName:scrollView:completionHandler:", __CurrentTestName, v14, 0);
    objc_msgSend(sub_100008914(), "runTestWithParameters:", v6);

  }
  else
  {
    if (objc_msgSend(__CurrentTestName, "rangeOfString:", kScrollTranscriptFullScreenTest) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("offset")));
      dword_10003AE74 = objc_msgSend(v7, "intValue");

      v8 = dword_10003AE74;
      v9 = v14;
    }
    else
    {
      objc_msgSend(v14, "frame");
      v9 = v14;
      v8 = (int)v10;
      dword_10003AE74 = (int)v10;
    }
    v11 = __CurrentTestName;
    v12 = dword_10003AE60;
    objc_msgSend(v9, "contentSize");
    objc_msgSend(v14, "_performScrollTest:iterations:delta:length:", v11, v12, v8, (int)v13);
  }

}

- (void)didShowAMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  double v10;
  _QWORD v11[5];

  v4 = a3;
  if (__CurrentTestName)
  {
    if (objc_msgSend(__CurrentTestName, "rangeOfString:", kShowMessagesTest) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ((+[UIDevice __ck_currentDeviceIsPadOrMac](UIDevice, "__ck_currentDeviceIsPadOrMac") & 1) == 0)
      {
        v7 = __CurrentTestName;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("time")));
        -[SMSApplication startedSubTest:forTest:withMetrics:](self, "startedSubTest:forTest:withMetrics:", CFSTR("Close Message Responsiveness"), v7, v8);

        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100008C90;
        v11[3] = &unk_100030A30;
        v11[4] = self;
        -[SMSApplication installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v11);
      }
      v9 = "showTranscriptList";
      v10 = 0.0;
      goto LABEL_15;
    }
    if (objc_msgSend(__CurrentTestName, "rangeOfString:", CFSTR("ScrollTranscript")) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(__CurrentTestName, "rangeOfString:", CFSTR("WithKeyboard")) != (id)0x7FFFFFFFFFFFFFFFLL)
        -[SMSApplication showKeyboard](self, "showKeyboard");
      -[SMSApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "tapFSMIfNecessary", 0, 0.5);
      v9 = "scrollTranscript";
LABEL_14:
      v10 = 1.0;
LABEL_15:
      -[SMSApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", v9, 0, v10);
      goto LABEL_16;
    }
    if (objc_msgSend(__CurrentTestName, "rangeOfString:", CFSTR("StaticTranscript")) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(__CurrentTestName, "rangeOfString:", CFSTR("FSM")) == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("runtime")));
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)objc_msgSend(v5, "intValue")));
        -[SMSApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "startGeneralStaticFPSTestWithDelay:", v6, 1.0);

        goto LABEL_16;
      }
      v9 = "startFSMTest";
      goto LABEL_14;
    }
  }
LABEL_16:

}

- (void)didShowNewCompose
{
  void *v3;
  id v4;

  byte_10003AE71 = 1;
  if (byte_10003AE70 == 1
    && objc_msgSend(__CurrentTestName, "rangeOfString:", kShowNewComposeTest) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[SMSApplication finishedTest:extraResults:](self, "finishedTest:extraResults:", __CurrentTestName, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, UIKeyboardDidShowNotification, 0);

    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("PPTDidShowNewComposeEvent"), 0);

  }
}

- (void)didShowTranscriptList
{
  void *v3;
  id v4;

  if (__CurrentTestName
    && objc_msgSend(__CurrentTestName, "rangeOfString:", kShowMessagesTest) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (++qword_10003AE78 >= qword_10003AE80)
    {
      v4 = objc_alloc_init((Class)NSMutableDictionary);
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", qword_10003AE80));
      objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("messages"));

      objc_msgSend(v4, "setObject:forKey:", CFSTR("messages"), CFSTR("messagesUnits"));
      -[SMSApplication finishedTest:extraResults:](self, "finishedTest:extraResults:", __CurrentTestName, v4);

    }
    else
    {
      -[SMSApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "showNextMessage", 0, 0.0);
    }
  }
}

- (void)deleteTopChat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversations"));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v10 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    objc_msgSend(v7, "conversationListIsDeletingConversations:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    objc_msgSend(v9, "deleteConversation:", v6);

  }
  else
  {
    -[SMSApplication failedTest:withFailure:](self, "failedTest:withFailure:", __CurrentTestName, CFSTR("No converversations in transcript list"));
  }

}

- (void)playAudioMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chatController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleCells"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000090F8;
  v11[3] = &unk_100030B48;
  v12 = v5;
  v13 = v3;
  v8 = v3;
  v9 = v5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

- (void)sendAudioMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  SMSApplication *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversations"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chatController"));

  if (objc_msgSend(v4, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    objc_msgSend(v9, "showConversation:animate:", v8, 1);

    v10 = dispatch_time(0, 1000000000);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000092FC;
    v11[3] = &unk_100030B70;
    v12 = v6;
    v13 = self;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);

  }
}

- (void)UITestSendAndPlayAudioMessage
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_1000096D0;
  v16[4] = sub_1000096E0;
  v17 = 0;
  v3 = objc_alloc((Class)NSAttributedString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("This is a test"), &stru_100031270, 0));
  v6 = objc_msgSend(v3, "initWithString:", v5);

  v7 = objc_msgSend(objc_alloc((Class)CKComposition), "initWithText:subject:", v6, 0);
  v8 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CFSTR("bhaskar.test@icloud.com"), 0);
  v9 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000096E8;
  block[3] = &unk_100030BE8;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v15 = v16;
  v10 = v7;
  v11 = v8;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v16, 8);
}

- (void)UITestShowConversationWithAlertPresented
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversations"));

  v5 = objc_msgSend(v4, "count");
  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

    v8 = dispatch_time(0, 1000000000);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100009C50;
    v10[3] = &unk_100030B70;
    v10[4] = self;
    v11 = v7;
    v9 = v7;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v10);

  }
  else
  {
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }

}

- (void)UITestActionMenuAfterRotationInVideoTaker
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversations"));

  v5 = objc_msgSend(v4, "count");
  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

    v8 = dispatch_time(0, 1000000000);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000A01C;
    v10[3] = &unk_100030B70;
    v10[4] = self;
    v11 = v7;
    v9 = v7;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v10);

  }
  else
  {
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }

}

- (void)didDeleteChat
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A49C;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)deleteChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  dispatch_time_t v28;
  uint64_t v29;
  uint8_t v30[16];
  _QWORD v31[4];
  NSObject *v32;
  _QWORD block[5];

  v4 = a3;
  if (!-[SMSApplication isOldConversationList](self, "isOldConversationList"))
  {
    if (-[SMSApplication isNewConversationList](self, "isNewConversationList"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "conversationListController"));

      v20 = objc_msgSend(v4, "item");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject conversationList](v19, "conversationList"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "conversations"));
      v23 = objc_msgSend(v22, "count");

      if (v20 < v23)
      {
        -[NSObject setEditingMode:animated:](v19, "setEditingMode:animated:", 1, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject collectionView](v19, "collectionView"));
        objc_msgSend(v24, "selectItemAtIndexPath:animated:scrollPosition:", v4, 1, 0);

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject collectionView](v19, "collectionView"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "delegate"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject collectionView](v19, "collectionView"));
        objc_msgSend(v26, "collectionView:didSelectItemAtIndexPath:", v27, v4);

        v28 = dispatch_time(0, 1000000000);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10000A8D8;
        v31[3] = &unk_100030A30;
        v32 = v19;
        dispatch_after(v28, (dispatch_queue_t)&_dispatch_main_q, v31);

      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_12;
      v29 = OSLogHandleForIMFoundationCategory("-[deleteChat:]");
      v19 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "The conversation list was not of type CKConversationListController or CKConversationListCollectionViewController.", v30, 2u);
      }
    }

    goto LABEL_12;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationListController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  v8 = objc_msgSend(v4, "row");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "conversationListController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "conversationList"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "conversations"));
  v13 = objc_msgSend(v12, "count");

  if (v8 < v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "conversationListController"));
    objc_msgSend(v15, "setEditing:animated:", 1, 0);

    objc_msgSend(v7, "selectRowAtIndexPath:animated:scrollPosition:", v4, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
    objc_msgSend(v16, "tableView:didSelectRowAtIndexPath:", v7, v4);

    v17 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A88C;
    block[3] = &unk_100030A30;
    block[4] = self;
    dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
  }

LABEL_12:
}

- (BOOL)isOldConversationList
{
  return 0;
}

- (BOOL)isNewConversationList
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  v3 = objc_msgSend(v2, "conversationListControllerClass");

  return v3 == (id)objc_opt_class(CKConversationListCollectionViewController);
}

- (unint64_t)mapSectionIdentifierForCurrentConversationListClass:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[2];
  __int16 v15;

  if (-[SMSApplication isOldConversationList](self, "isOldConversationList"))
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory("-[mapSectionIdentifierForCurrentConversationListClass:]");
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
LABEL_13:

        goto LABEL_14;
      }
      v15 = 0;
      v7 = "Tried to map to the TipKit section in the old conversation list.";
      v8 = (uint8_t *)&v15;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
      goto LABEL_13;
    }
  }
  else if (-[SMSApplication isNewConversationList](self, "isNewConversationList"))
  {
    switch(a3)
    {
      case 0uLL:
        return a3;
      case 1uLL:
        return 3;
      case 2uLL:
        return 1;
      case 3uLL:
        return 2;
      case 4uLL:
        if (!IMOSLoggingEnabled())
          goto LABEL_14;
        v9 = OSLogHandleForIMFoundationCategory("-[mapSectionIdentifierForCurrentConversationListClass:]");
        v6 = objc_claimAutoreleasedReturnValue(v9);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          goto LABEL_13;
        *(_WORD *)buf = 0;
        v7 = "Tried to map to the siri section in the new conversation list.";
        v8 = buf;
        break;
      case 5uLL:
        return 4;
      case 6uLL:
        return 5;
      default:
        goto LABEL_14;
    }
    goto LABEL_12;
  }
LABEL_14:
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory("-[mapSectionIdentifierForCurrentConversationListClass:]");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No mapping could be made because the conversation list was not of type CKConversationListController or CKConversationListCollectionViewController.", v13, 2u);
    }

  }
  return -1;
}

- (void)UITestDeleteTopChat
{
  void *v3;
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversations"));

  if (v4)
  {
    qword_10003AE88 = (uint64_t)objc_msgSend(v4, "count");
    v5 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000ACB8;
    block[3] = &unk_100030A30;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    -[SMSApplication failedTest:withFailure:](self, "failedTest:withFailure:", __CurrentTestName, CFSTR("No conversations in list so cannot delete top one"));
  }

}

- (void)UITestPushTranscript
{
  uint64_t v3;
  BOOL v4;
  __CFString *v5;
  dispatch_time_t v6;
  __CFString *v7;
  _QWORD block[5];
  __CFString *v9;
  BOOL v10;

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("chatIdentifier")));
  v4 = v3 == 0;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = CFSTR("chat339741476857344860");
  v6 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ADFC;
  block[3] = &unk_100030C10;
  block[4] = self;
  v9 = v5;
  v10 = v4;
  v7 = v5;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)UITestLaunchToTranscript
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("chatIdentifier")));
  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("+14087240720");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sms://open?groupid=%@"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));

  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication sceneController](self, "sceneController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messagesSceneDelegate"));
  objc_msgSend(v8, "openURL:sourceApplication:", v6, 0);

  v9 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B2A4;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)UITestPushTranscriptWithDraft
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B474;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestPushTranscriptKeyboardDownExpandTextEntry
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B8D4;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestPushTranscriptAndDetails
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BE58;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestPushTranscriptAndDetailsKeyboardUp
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C38C;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestDismissRegistration
{
  void *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  if (+[IMServiceImpl smsEnabled](IMServiceImpl, "smsEnabled"))
  {
    -[SMSApplication finishedTest:](self, "finishedTest:", __CurrentTestName);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication sceneController](self, "sceneController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messagesSceneDelegate"));
    objc_msgSend(v4, "setShouldShowRegistrationOverride:", 1);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "postNotificationName:object:", IMAccountControllerOperationalAccountsChangedNotification, 0);

    v6 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000CA04;
    block[3] = &unk_100030A30;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)UITestRotateTranscript
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CC64;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestRotateTranscriptKeyboardUp
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D0C4;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestRotateTranscriptTwice
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D5C8;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestRotateTranscriptTwiceKeyboardUp
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DACC;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestPresentNewCompose
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E074;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestPresentNewComposeWithDraft
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = objc_alloc((Class)NSAttributedString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("This is a test"), &stru_100031270, 0));
  v6 = objc_msgSend(v3, "initWithString:", v5);

  v7 = objc_msgSend(objc_alloc((Class)CKComposition), "initWithText:subject:", v6, 0);
  v8 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CFSTR("bhaskar.test@icloud.com"), 0);
  v9 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E3B4;
  block[3] = &unk_100030A58;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)UITestSendNewComposeDraft
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = objc_alloc((Class)NSAttributedString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("This is a test"), &stru_100031270, 0));
  v6 = objc_msgSend(v3, "initWithString:", v5);

  v7 = objc_msgSend(objc_alloc((Class)CKComposition), "initWithText:subject:", v6, 0);
  v8 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CFSTR("bhaskar.test@icloud.com"), 0);
  v9 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E6F0;
  block[3] = &unk_100030A58;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)perfTestPushToTranscript
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("chatIdentifier")));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000ECE8;
  v4[3] = &unk_100030C38;
  v4[4] = self;
  -[SMSApplication doPushToTranscriptTestForChatIdentifierPerformanceTest:testBlock:](self, "doPushToTranscriptTestForChatIdentifierPerformanceTest:testBlock:", v3, v4);

}

- (void)contactPickerDidHide
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EDB8;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)newComposeDismissContactPicker:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = dispatch_time(0, 2000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EF48;
  v7[3] = &unk_100030B70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);

}

- (void)UITestNewComposeDismissContactPicker
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F0BC;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestCancelNewComposeLandscape
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F300;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)UITestSearchForStrings
{
  void *v3;
  _QWORD v4[4];
  id v5;
  SMSApplication *v6;

  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfFile:](NSArray, "arrayWithContentsOfFile:", CFSTR("/usr/local/share/chatkit/SearchTestCorpus.plist")));
  if (v3)
  {
    -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000F608;
    v4[3] = &unk_100030B70;
    v5 = v3;
    v6 = self;
    ck_dispatch_main_after_seconds(v4, 1.0);

  }
  else
  {
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }

}

- (void)UITestSearchResultsClearingAfterNotFound
{
  void *v3;
  _QWORD v4[4];
  id v5;
  SMSApplication *v6;

  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfFile:](NSArray, "arrayWithContentsOfFile:", CFSTR("/usr/local/share/chatkit/SearchTestCorpus.plist")));
  if (v3)
  {
    -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000F7BC;
    v4[3] = &unk_100030B70;
    v5 = v3;
    v6 = self;
    ck_dispatch_main_after_seconds(v4, 1.0);

  }
  else
  {
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }

}

- (void)UITestSearchForSubstringThenFullString
{
  void *v3;
  _QWORD v4[4];
  id v5;
  SMSApplication *v6;

  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfFile:](NSArray, "arrayWithContentsOfFile:", CFSTR("/usr/local/share/chatkit/SearchTestCorpus.plist")));
  if (v3)
  {
    -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000F970;
    v4[3] = &unk_100030B70;
    v5 = v3;
    v6 = self;
    ck_dispatch_main_after_seconds(v4, 1.0);

  }
  else
  {
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }

}

- (void)UITestTapIntoAndOutOfConversations
{
  void *v3;
  _QWORD v4[4];
  id v5;
  SMSApplication *v6;

  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfFile:](NSArray, "arrayWithContentsOfFile:", CFSTR("/usr/local/share/chatkit/SearchTestCorpus.plist")));
  if (v3)
  {
    -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000FB24;
    v4[3] = &unk_100030B70;
    v5 = v3;
    v6 = self;
    ck_dispatch_main_after_seconds(v4, 1.0);

  }
  else
  {
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }

}

- (void)UITestSearchResultNearTop
{
  _QWORD v3[5];

  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000FCCC;
  v3[3] = &unk_100030A30;
  v3[4] = self;
  -[SMSApplication _searchForString:withCompletion:](self, "_searchForString:withCompletion:", CFSTR("#4813"), v3);
}

- (void)_performNextTapIntoTapOutOfTestWithRemainingSearches:(id)a3 startTime:(double)a4 passedSoFar:(BOOL)a5 resultsDictionary:(id)a6 finalCompletion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  __n128 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  double v30;
  BOOL v31;

  v9 = a5;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = v16;

  if (objc_msgSend(v12, "count") && (v18.n128_f64[0] = v17 - a4, v17 - a4 < 100.0))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0, v18.n128_f64[0]));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Search")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Results")));
    objc_msgSend(v12, "removeObject:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Count")));
    v23 = (uint64_t)objc_msgSend(v22, "integerValue");

    if (v23 < 1)
    {
      -[SMSApplication _performNextTapIntoTapOutOfTestWithRemainingSearches:startTime:passedSoFar:resultsDictionary:finalCompletion:](self, "_performNextTapIntoTapOutOfTestWithRemainingSearches:startTime:passedSoFar:resultsDictionary:finalCompletion:", v12, v9, v13, v14, a4);
    }
    else
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000101E0;
      v24[3] = &unk_100030CD8;
      v24[4] = self;
      v25 = v20;
      v26 = v21;
      v27 = v13;
      v28 = v12;
      v30 = a4;
      v31 = v9;
      v29 = v14;
      -[SMSApplication _searchForString:withCompletion:](self, "_searchForString:withCompletion:", v25, v24);

    }
  }
  else
  {
    (*((void (**)(id, _BOOL8, __n128))v14 + 2))(v14, v9, v18);
  }

}

- (void)_performNextSearchPartialFirstWithRemainingSearches:(id)a3 passedSoFar:(BOOL)a4 resultsDictionary:(id)a5 finalCompletion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  BOOL v29;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Search")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Results")));
    objc_msgSend(v10, "removeObject:", v13);
    if ((unint64_t)objc_msgSend(v14, "length") > 1)
    {
      v16 = objc_msgSend(v14, "substringToIndex:", arc4random() % ((unint64_t)objc_msgSend(v14, "length") - 1) + 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[SMSApplication _searchForStringWithNoCompletion:](self, "_searchForStringWithNoCompletion:", v17);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000108B8;
      v18[3] = &unk_100030D78;
      v18[4] = self;
      v19 = v14;
      v20 = v15;
      v21 = v11;
      v22 = v10;
      v24 = v8;
      v23 = v12;
      ck_dispatch_main_after_seconds(v18, 0.100000001);

    }
    else
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000108A4;
      v25[3] = &unk_100030D28;
      v25[4] = self;
      v26 = v10;
      v29 = v8;
      v27 = v11;
      v28 = v12;
      ck_dispatch_main_after_seconds(v25, 0.0);

    }
  }
  else
  {
    (*((void (**)(id, _BOOL8))v12 + 2))(v12, v8);
  }

}

- (void)_performNextSearchResultsClearingTestWithRemainingSearches:(id)a3 passedSoFar:(BOOL)a4 resultsDictionary:(id)a5 finalCompletion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SMSApplication *v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Search")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Results")));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100010B1C;
    v18[3] = &unk_100030DC8;
    v19 = v10;
    v20 = v13;
    v21 = self;
    v22 = v14;
    v23 = v11;
    v25 = v8;
    v24 = v12;
    v16 = v14;
    v17 = v13;
    -[SMSApplication _searchForString:validateExpectedSearchResults:resultsDictionary:completion:](self, "_searchForString:validateExpectedSearchResults:resultsDictionary:completion:", v16, v15, v23, v18);

  }
  else
  {
    (*((void (**)(id, _BOOL8))v12 + 2))(v12, v8);
  }

}

- (void)_performNextSearchWithRemainingSearches:(id)a3 passedSoFar:(BOOL)a4 resultsDictionary:(id)a5 finalCompletion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SMSApplication *v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Search")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Results")));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100010DC8;
    v18[3] = &unk_100030DC8;
    v19 = v10;
    v20 = v13;
    v21 = self;
    v22 = v14;
    v23 = v11;
    v25 = v8;
    v24 = v12;
    v16 = v14;
    v17 = v13;
    -[SMSApplication _searchForString:validateExpectedSearchResults:resultsDictionary:completion:](self, "_searchForString:validateExpectedSearchResults:resultsDictionary:completion:", v16, v15, v23, v18);

  }
  else
  {
    (*((void (**)(id, _BOOL8))v12 + 2))(v12, v8);
  }

}

- (void)_searchForString:(id)a3 validateExpectedSearchResults:(id)a4 resultsDictionary:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SMSApplication *v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "conversationListController"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100010FF4;
  v20[3] = &unk_100030DF0;
  v21 = v11;
  v22 = self;
  v23 = v10;
  v24 = v12;
  v25 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v10;
  v19 = v11;
  objc_msgSend(v15, "performSearch:completion:", v18, v20);

}

- (void)_searchForString:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "conversationListController"));
  objc_msgSend(v8, "performSearch:completion:", v7, v6);

}

- (void)_searchForStringWithNoCompletion:(id)a3
{
  -[SMSApplication _searchForString:withCompletion:](self, "_searchForString:withCompletion:", a3, 0);
}

- (void)_clearSearchStringWithPreviousSearchText:(id)a3 resultsDictionary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "conversationListController"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000112B4;
  v16[3] = &unk_100030E18;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "performSearch:completion:", 0, v16);

}

- (BOOL)validateNumberOfSearchResultsInConversationListController:(id)a3 searchText:(id)a4 expectedNumber:(int64_t)a5 withResultsDictionary:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _BOOL8 v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchResultsController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionView"));
  v14 = objc_msgSend(v13, "numberOfItemsInSection:", 0);
  v15 = v14 == (id)a5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Search \"%@\" number of results"), v11));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("expected=%lld, actual=%lld"), a5, v14));
  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v15, v16, v17, v10);

  return v15;
}

- (BOOL)validateAtConversationListInConversationListController:(id)a3 previousSearchText:(id)a4 withResultsDictionary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchResultsController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionView"));
  v12 = objc_msgSend(v11, "numberOfItemsInSection:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("After clearing \"%@\" should have no results"), v9));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("actual=%lld"), v12));
  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v12 == 0, v13, v14, v8);

  return v12 == 0;
}

- (BOOL)validatePhotoPickerVisibility:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5 withinSubtest:(id)a6
{
  return 1;
}

- (BOOL)validatePhotoPickerWindowLevel:(id)a3 expected:(double)a4 withResultsDictionary:(id)a5 withinSubtest:(id)a6
{
  return 1;
}

- (BOOL)validateTranscriptShouldAutorotate:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;

  v5 = a4;
  v8 = a5;
  v9 = objc_msgSend(a3, "shouldAutorotate") ^ v5 ^ 1;
  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v9, CFSTR("Transcript should autorotate"), 0, v8);

  return v9;
}

- (BOOL)validateTranscriptVendingIAV:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  _BOOL8 v10;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "inputAccessoryView"));
  v10 = (v9 == 0) ^ v5;

  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v10, CFSTR("Transcript vending IAV"), 0, v8);
  return v10;
}

- (BOOL)validateNonzeroTranscriptInsets:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "collectionViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionView"));
  objc_msgSend(v10, "contentInset");
  v12 = v11;
  v14 = v13;

  v15 = (v12 <= 0.0) ^ v5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&v12));
  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v15, CFSTR("Transcript top inset is nonzero"), v16, v8);
  v17 = (v14 <= 0.0) ^ v5;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&v14));

  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v17, CFSTR("Transcript bottom inset is nonzero"), v18, v8);
  return v15 & v17;
}

- (BOOL)validateBottomInsetGreaterThanIAVHeight:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  _BOOL8 v16;
  void *v17;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionView"));
  objc_msgSend(v11, "contentInset");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inputAccessoryView"));
  if (!v14)
    -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", 0, CFSTR("Bottom inset > IAV height (KB up)"), CFSTR("Transcript controller returned nil IAV, FAIL"), v8);
  objc_msgSend(v14, "frame");
  v16 = (v13 <= v15) ^ v5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bottom inset %.2f. IAV %.2f"), *(_QWORD *)&v13, *(_QWORD *)&v15));
  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v16, CFSTR("Bottom inset > IAV height (KB up)"), v17, v8);

  return v16;
}

- (BOOL)validateIAVisExpanded:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  _BOOL8 v11;
  void *v12;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "inputAccessoryView"));
  if (!v9)
    -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", 0, CFSTR("IAV height > 44.0 (IAV is expanded)"), CFSTR("Transcript controller returned nil IAV, FAIL"), v8);
  objc_msgSend(v9, "frame");
  v11 = (v10 <= 44.0) ^ v5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IAV height %.2f"), *(_QWORD *)&v10));
  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v11, CFSTR("IAV height > 44.0 (IAV is expanded)"), v12, v8);

  return v11;
}

- (BOOL)validateTranscriptControllerIsFirstResponder:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL8 v13;
  __CFString *v14;
  __CFString *v15;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstResponder"));

  v13 = (v12 != v9) ^ v5;
  if (v13)
  {
    v14 = 0;
  }
  else
  {
    v15 = CFSTR("Transcript is FR when it should not be");
    if (v5)
      v15 = CFSTR("Expected TranscriptController to be FR");
    v14 = v15;
  }
  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v13, CFSTR("TranscriptController is First Responder"), v14, v8);

  return v13;
}

- (BOOL)validateEntryViewIsFirstResponder:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  __CFString *v12;
  __CFString *v13;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "entryView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
  v11 = objc_msgSend(v10, "isActive") ^ v5;

  if (v11 == 1)
  {
    v12 = CFSTR("IAV is FR when it should not be, keyboard should be dismissed");
    if (v5)
      v12 = CFSTR("Expected IAV to be FR, keyboard presented");
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v11 ^ 1, CFSTR("Entry View is First Responder"), v13, v8);

  return v11 ^ 1;
}

- (BOOL)validateTranscriptIsScrolledToBottom:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v20;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "collectionViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionView"));

  v11 = objc_msgSend(v10, "__ck_isScrolledToBottom") ^ v5;
  if (v11 == 1)
  {
    objc_msgSend(v10, "contentOffset");
    v13 = v12;
    objc_msgSend(v10, "__ck_bottomOffset");
    if (v5)
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Not scrolled to bottom. Current %.2f expected %.2f"), v13, v14);
    else
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Scrolled to bottom when not expected to be. Current %.2f"), v13, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  }
  else
  {
    v16 = 0;
  }
  v17 = v11 ^ 1;
  if (v5)
    v18 = CFSTR("Transcript scrolled to bottom");
  else
    v18 = CFSTR("Transcript not scrolled to bottom");
  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v17, v18, v16, v8);

  return v17;
}

- (BOOL)validateTranscriptPreviewCacheHasResumed:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;

  v5 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKPreviewDispatchCache transcriptPreviewCache](CKPreviewDispatchCache, "transcriptPreviewCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("dispatchCache")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("dispatchQueue")));
  v11 = objc_msgSend(v10, "isSuspended") ^ v5;
  if (v5)
    v12 = CFSTR("Transcript preview cache resumed");
  else
    v12 = CFSTR("Transcript preview cache not resumed");
  if ((_DWORD)v11)
    v13 = &stru_100031270;
  else
    v13 = CFSTR("Transcript preview cache suspend state incorrect");
  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v11, v12, v13, v7);

  return v11;
}

- (BOOL)validateRecipientSelectionControllerIsFirstResponder:(id)a3 expected:(BOOL)a4 withResultsDictionary:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  unsigned int v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "composeRecipientSelectionController"));
  v10 = objc_msgSend(v9, "toFieldIsFirstResponder") ^ v5;
  if (v10 == 1)
  {
    v11 = CFSTR("To: field is FR when it should not be");
    if (v5)
      v11 = CFSTR("Expected To: field to be FR, keyboard presented");
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  v13 = v10 ^ 1;
  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v13, CFSTR("To: field is first responder"), v12, v8);

  return v13;
}

- (BOOL)validateActionMenuWindowOrientationExpectedOrientation:(int64_t)a3 withResultsDictionary:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  Class v13;
  BOOL v14;
  id v15;
  const __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "windows", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v13 = NSClassFromString(CFSTR("CKActionMenuWindow"));
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0 && objc_msgSend(v12, "_orientationForViewTransform"))
        {
          v15 = objc_msgSend(v12, "_orientationForViewTransform");
          if (v15 == (id)a3)
            v16 = CFSTR("Orientation is correct");
          else
            v16 = CFSTR("Orientation is incorrect");
          -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", v15 == (id)a3, CFSTR("CKActionMenuWindow orientation"), v16, v6);

          v14 = 1;
          goto LABEL_15;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }

  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:", 0, CFSTR("CKActionMenuWindow orientation"), CFSTR("No window found"), v6);
  v14 = 0;
LABEL_15:

  return v14;
}

- (void)_recordResult:(BOOL)a3 forKey:(id)a4 comment:(id)a5 resultsDictionary:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  char *v16;
  char *v17;
  __CFString *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v8 = a3;
  v9 = a5;
  v10 = a6;
  v11 = a4;
  v12 = objc_msgSend(v11, "length");
  if ((unint64_t)v12 >= 0x28)
    v13 = 40;
  else
    v13 = (uint64_t)v12;
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", 0, v13));

  v14 = CFSTR("FAILED");
  if (v8)
    v14 = CFSTR("PASS");
  v15 = v14;
  v16 = (char *)objc_msgSend(v23, "length");
  v17 = v16 - 40;
  if (v16 == (char *)40)
  {
    v18 = v15;
  }
  else
  {
    do
    {
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@"), v15));

      v15 = v18;
    }
    while (!__CFADD__(v17++, 1));
  }
  if (v9)
  {
    v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ -- %@"), v18, v9));

    v18 = (__CFString *)v20;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
  objc_msgSend(v10, "setObject:forKey:", v21, v23);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Units"), v23));
  objc_msgSend(v10, "setObject:forKey:", v18, v22);

}

- (void)_recordAllTestsPassed:(BOOL)a3 resultsDictionary:(id)a4
{
  -[SMSApplication _recordResult:forKey:comment:resultsDictionary:](self, "_recordResult:forKey:comment:resultsDictionary:");
}

- (void)IMCoreSendNewCompose
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v3 = objc_alloc((Class)NSAttributedString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("This is a test"), &stru_100031270, 0));
  v6 = objc_msgSend(v3, "initWithString:", v5);

  v7 = objc_msgSend(objc_alloc((Class)CKComposition), "initWithText:subject:", v6, 0);
  v8 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CFSTR("bhaskar.test@icloud.com"), 0);
  v9 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000122C8;
  block[3] = &unk_100030A58;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)IMCoreToggleDisturb
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SMSApplication *v11;

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversations"));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

    v7 = dispatch_time(0, 1000000000);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100012560;
    v9[3] = &unk_100030B70;
    v10 = v6;
    v11 = self;
    v8 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);

  }
  else
  {
    -[SMSApplication failedTest:withFailure:](self, "failedTest:withFailure:", __CurrentTestName, CFSTR("No converversations in transcript list"));
  }

}

- (void)IMCoreDeleteTopChat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD block[5];
  void *v12;

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversations"));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v12 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v7, "conversationListIsDeletingConversations:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    objc_msgSend(v9, "deleteConversation:", v6);

    v10 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001282C;
    block[3] = &unk_100030A30;
    block[4] = self;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    -[SMSApplication failedTest:withFailure:](self, "failedTest:withFailure:", __CurrentTestName, CFSTR("No converversations in transcript list"));
  }

}

- (void)showNextMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[5];
  _QWORD v21[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("chatIdentifier")));
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("chatIdentifier%ld"), qword_10003AE78));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", v5));
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_100034E38, "objectAtIndex:", qword_10003AE78));
    v9 = v8;

    v4 = v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "conversationForExistingChatWithChatIdentifier:", v4));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentConversation"));

  if (v11 == v13)
  {
    ++qword_10003AE78;
    -[SMSApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "showNextMessage", 0, 1.0);
  }
  else
  {
    v14 = __CurrentTestName;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("time")));
    -[SMSApplication startedSubTest:forTest:withMetrics:](self, "startedSubTest:forTest:withMetrics:", CFSTR("Open Message Responsiveness"), v14, v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100012ACC;
    v21[3] = &unk_100030C60;
    v21[4] = self;
    -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v16, CFSTR("PPTDidLayoutConversationEvent"), 1, v21);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "conversationListController"));
    objc_msgSend(v18, "beginHoldingConversationListUpdatesForPPTTests");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    objc_msgSend(v19, "showConversation:animate:", v11, 1);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012AE8;
    block[3] = &unk_100030A30;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)startShowMessagesTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversations"));

  v6 = objc_msgSend(v9, "count");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("numMessages")));

  qword_10003AE80 = (uint64_t)objc_msgSend(v7, "integerValue");
  v8 = qword_10003AE80;
  if (qword_10003AE80 > (uint64_t)v6)
  {
    qword_10003AE80 = (uint64_t)v6;
    v8 = (uint64_t)v6;
  }
  qword_10003AE78 = 0;
  if (v8 < 1)
  {
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }
  else
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication showNextMessage](self, "showNextMessage");
  }

}

- (void)dissmissComposeSheet
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

- (void)_dismissPeoplePickerWithCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  objc_msgSend(a3, "_dismissPeoplePicker");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100012D2C;
  v8[3] = &unk_100030E40;
  v9 = v6;
  v7 = v6;
  -[SMSApplication installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v8);

}

- (void)tearDownShowPeoplePickerTest:(id)a3
{
  id v3;
  _QWORD v4[4];
  SMSApplication *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012DB8;
  v4[3] = &unk_100030B70;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[SMSApplication installCACommitCompletionBlock:](v5, "installCACommitCompletionBlock:", v4);

}

- (void)tearDownShowPeoplePickerTest
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100013074;
  v2[3] = &unk_100030A30;
  v2[4] = self;
  -[SMSApplication installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v2);
}

- (void)_showPeoplePickerTest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  SMSApplication *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v6 = CNContactPickerViewControllerPickerDidShowNotification;
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_1000132E0;
  v12 = &unk_100030C88;
  v13 = self;
  v14 = v4;
  v7 = v4;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v5, v6, 1, &v9);

  -[SMSApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("ShowPeoplePicker"), __CurrentTestName, v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toField"));
  objc_msgSend(v7, "composeRecipientViewRequestAddRecipient:", v8);

}

- (void)_startPeoplePickerTest
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ppt_chatController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "composeRecipientSelectionController"));
  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  -[SMSApplication _showPeoplePickerTest:](self, "_showPeoplePickerTest:", v4);

}

- (void)startShowPeoplePickerTest:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[SMSApplication dissmissComposeSheet](self, "dissmissComposeSheet", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013414;
  v6[3] = &unk_100030C60;
  v6[4] = self;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v4, CFSTR("PPTDidShowConversationEvent"), 1, v6);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  objc_msgSend(v5, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);

}

- (void)tearDownSelectContactPeoplePickerTest
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001346C;
  v2[3] = &unk_100030A30;
  v2[4] = self;
  -[SMSApplication installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v2);
}

- (void)_selectContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  id v37;
  void *v38;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("contactNumber")));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMContactStore sharedInstance](IMContactStore, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getContactStore"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact predicateForContactsMatchingPhoneNumber:](CNContact, "predicateForContactsMatchingPhoneNumber:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys"));
    v38 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
    v37 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v11, &v37));
    v20 = v37;

    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = sub_1000096D0;
    v35 = sub_1000096E0;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = sub_1000096D0;
    v29 = sub_1000096E0;
    v30 = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000138F0;
    v21[3] = &unk_100030E90;
    v13 = v8;
    v22 = v13;
    v23 = &v31;
    v24 = &v25;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v21);
    v14 = v32[5];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v26[5], "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactProperty contactPropertyWithContact:propertyKey:identifier:](CNContactProperty, "contactPropertyWithContact:propertyKey:identifier:", v14, CNContactPhoneNumbersKey, v15));

    v17 = __CurrentTestName;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("time")));
    -[SMSApplication startedSubTest:forTest:withMetrics:](self, "startedSubTest:forTest:withMetrics:", CFSTR("SelectContact"), v17, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactPickerViewController"));
    objc_msgSend(v4, "contactPicker:didSelectContactProperty:", v19, v16);

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);

  }
  else
  {
    -[SMSApplication failedTest:withFailure:](self, "failedTest:withFailure:", __CurrentTestName, CFSTR("Contact Number missing."));
  }

}

- (void)_startSelectContactPeoplePickerTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ppt_chatController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composeRecipientSelectionController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v7 = CNContactPickerViewControllerPickerDidShowNotification;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100013BA8;
  v12[3] = &unk_100030C88;
  v12[4] = self;
  v13 = v5;
  v8 = v5;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v6, v7, 1, v12);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100013BB4;
  v11[3] = &unk_100030C60;
  v11[4] = self;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v9, CNContactPickerViewControllerPickerDidHideNotification, 1, v11);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toField"));
  objc_msgSend(v8, "composeRecipientViewRequestAddRecipient:", v10);

}

- (void)startSelectContactPeoplePickerTest:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[SMSApplication dissmissComposeSheet](self, "dissmissComposeSheet", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013C80;
  v6[3] = &unk_100030C60;
  v6[4] = self;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v4, CFSTR("PPTDidShowConversationEvent"), 1, v6);

  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  objc_msgSend(v5, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);

}

- (void)tearDownCancelPeoplePickerTest
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100013D50;
  v2[3] = &unk_100030A30;
  v2[4] = self;
  -[SMSApplication installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v2);
}

- (void)_cancelPeoplePicker
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ppt_chatController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "composeRecipientSelectionController"));
  if (v4)
  {
    v5 = __CurrentTestName;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("time")));
    -[SMSApplication startedSubTest:forTest:withMetrics:](self, "startedSubTest:forTest:withMetrics:", CFSTR("CancelPeoplePicker"), v5, v6);

    objc_msgSend(v4, "contactPickerDidCancel:", 0);
  }

}

- (void)_startCancelPeoplePickerTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ppt_chatController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composeRecipientSelectionController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000140B0;
  v10[3] = &unk_100030C60;
  v10[4] = self;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v6, CNContactPickerViewControllerPickerDidShowNotification, 1, v10);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000140B8;
  v9[3] = &unk_100030C60;
  v9[4] = self;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v7, CNContactPickerViewControllerPickerDidHideNotification, 1, v9);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "toField"));
  objc_msgSend(v5, "composeRecipientViewRequestAddRecipient:", v8);

}

- (void)startCancelPeoplePickerTest:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[SMSApplication dissmissComposeSheet](self, "dissmissComposeSheet", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014184;
  v6[3] = &unk_100030C60;
  v6[4] = self;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v4, CFSTR("PPTDidShowConversationEvent"), 1, v6);

  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  objc_msgSend(v5, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);

}

- (void)tearDownResolveContactTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SMSApplication finishedSubTest:forTest:](self, "finishedSubTest:forTest:", CFSTR("ResolveContact"), __CurrentTestName);
  if (+[UIDevice __ck_currentDeviceIsPadOrMac](UIDevice, "__ck_currentDeviceIsPadOrMac"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ppt_chatController"));
    objc_msgSend(v6, "performSelector:withObject:", "cancelButtonTapped:", 0);

  }
  else
  {
    -[SMSApplication dissmissComposeSheet](self, "dissmissComposeSheet");
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001427C;
  v8[3] = &unk_100030E40;
  v9 = v4;
  v7 = v4;
  -[SMSApplication installCACommitCompletionBlock:](self, "installCACommitCompletionBlock:", v8);

}

- (void)_resolveContactTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ppt_chatController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "composeRecipientSelectionController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toField"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textView"));
  objc_msgSend(v8, "setText:", v4);

  objc_msgSend(v6, "composeRecipientView:textDidChange:", v7, v4);
}

- (void)typeInContactName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ppt_chatController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "composeRecipientSelectionController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toField"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textView"));
  objc_msgSend(v8, "setText:", v4);

  objc_msgSend(v6, "composeRecipientView:textDidChange:", v7, v4);
}

- (void)startComposeMessageToPseudoContactTest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SMSApplication dissmissComposeSheet](self, "dissmissComposeSheet");
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("contactName")));

  if (v5)
    -[SMSApplication _startcomposePseudoContactTest:withOptions:](self, "_startcomposePseudoContactTest:withOptions:", __CurrentTestName, v5);
  else
    -[SMSApplication failedTest:withFailure:](self, "failedTest:withFailure:", __CurrentTestName, CFSTR("Contact Name is missing."));

}

- (void)_startcomposePseudoContactTest:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[SMSApplication dissmissComposeSheet](self, "dissmissComposeSheet");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000145D4;
  v16[3] = &unk_100030EB8;
  v16[4] = self;
  v9 = v6;
  v17 = v9;
  v18 = v7;
  v10 = v7;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v8, CFSTR("PPTDidShowConversationEvent"), 1, v16);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000146A8;
  v14[3] = &unk_100030C88;
  v14[4] = self;
  v15 = v9;
  v12 = v9;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v11, CFSTR("PPTSearchListDidShowOrHideNotification"), 1, v14);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  objc_msgSend(v13, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);

}

- (void)startScrollPseudoContactNamesTest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SMSApplication dissmissComposeSheet](self, "dissmissComposeSheet");
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("contactName")));

  if (v5)
    -[SMSApplication _scrollPseudoContactTest:withOptions:](self, "_scrollPseudoContactTest:withOptions:", __CurrentTestName, v5);
  else
    -[SMSApplication failedTest:withFailure:](self, "failedTest:withFailure:", __CurrentTestName, CFSTR("Contact Name is missing."));

}

- (void)_scrollPseudoContactTest:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  SMSApplication *v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v6 = a3;
  v7 = a4;
  -[SMSApplication dissmissComposeSheet](self, "dissmissComposeSheet");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ppt_chatController"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "composeRecipientSelectionController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000148E8;
  v21[3] = &unk_100030C88;
  v21[4] = self;
  v22 = v7;
  v12 = v7;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v11, CFSTR("PPTDidShowConversationEvent"), 1, v21);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100014984;
  v17[3] = &unk_100030EB8;
  v18 = v10;
  v19 = self;
  v20 = v6;
  v14 = v6;
  v15 = v10;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v13, CFSTR("PPTSearchListDidShowOrHideNotification"), 1, v17);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  objc_msgSend(v16, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);

}

- (void)_startResolveContactTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SMSApplication dissmissComposeSheet](self, "dissmissComposeSheet");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100014AF0;
  v10[3] = &unk_100030C88;
  v10[4] = self;
  v11 = v4;
  v6 = v4;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v5, CFSTR("PPTDidShowConversationEvent"), 1, v10);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014BB4;
  v9[3] = &unk_100030C60;
  v9[4] = self;
  -[SMSApplication installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:](self, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v7, CFSTR("PPTSearchListDidShowOrHideNotification"), 1, v9);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  objc_msgSend(v8, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);

}

- (void)startResolveContactTest:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("contactNumber")));
  if (v4)
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication _startResolveContactTest:](self, "_startResolveContactTest:", v4);
  }
  else
  {
    -[SMSApplication failedTest:withFailure:](self, "failedTest:withFailure:", __CurrentTestName, CFSTR("Contact Number missing."));
  }

}

- (void)startShowNewComposeTest:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014D08;
  v8[3] = &unk_100030A30;
  v8[4] = self;
  v4 = objc_retainBlock(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, v4);

  }
  else
  {
    ((void (*)(_QWORD *))v4[2])(v4);
  }

}

- (void)startStuckAudioPillTest:(id)a3
{
  void *v4;
  dispatch_time_t v5;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_1000096D0;
  v7[4] = sub_1000096E0;
  v8 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController", a3));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chatController"));

  v5 = dispatch_time(0, 1000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014EAC;
  v6[3] = &unk_100030BC0;
  v6[4] = self;
  v6[5] = v7;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  _Block_object_dispose(v7, 8);

}

- (void)sendMultipleMessagesEntryView:(id)a3 composition:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "setComposition:", a4);
  v10 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000152DC;
  block[3] = &unk_100030F30;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)startDetailsTest:(id)a3
{
  void *v4;
  dispatch_time_t v5;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_1000096D0;
  v7[4] = sub_1000096E0;
  v8 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController", a3));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chatController"));

  v5 = dispatch_time(0, 1000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000155EC;
  v6[3] = &unk_100030BC0;
  v6[4] = self;
  v6[5] = v7;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  _Block_object_dispose(v7, 8);

}

- (void)_detailsViewScrollingPerfTest:(id)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  double v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  v5 = objc_opt_class(UIScrollView);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) == 0)
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("iterations")));
  v9 = objc_msgSend(v8, "intValue");

  v10 = __CurrentTestName;
  objc_msgSend(v7, "frame");
  objc_msgSend(v7, "_performScrollTest:iterations:delta:", v10, v9, (int)(v11 + v11));

}

- (void)startSendAnimationNewComposeTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v4 = objc_alloc((Class)NSAttributedString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("This is a long text"), &stru_100031270, 0));
  v7 = objc_msgSend(v4, "initWithString:", v6);

  v8 = objc_msgSend(objc_alloc((Class)CKComposition), "initWithText:subject:", v7, 0);
  v9 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CFSTR("jake.chase.dev1@icloud.com"), 0);
  v10 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015C54;
  block[3] = &unk_100030A58;
  block[4] = self;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)startSendAnimationExistingTest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("This is a long text #longText"));
  v3 = objc_msgSend(objc_alloc((Class)CKComposition), "initWithText:subject:", v16, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversationForExistingChatWithChatIdentifier:", CFSTR("jake.chase.dev1@icloud.com")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  objc_msgSend(v6, "showConversation:animate:", v5, 0);

  CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedViewController"));
  v9 = objc_opt_class(CKRegistrationViewController);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 0, 0);

    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chatController"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entryView"));
  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  objc_msgSend(v14, "setComposition:", v3);
  CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.5, 0);
  objc_msgSend(v14, "touchUpInsideSendButton:", 0);
  v15 = objc_alloc_init((Class)NSMutableDictionary);
  -[SMSApplication finishedTest:extraResults:](self, "finishedTest:extraResults:", __CurrentTestName, v15);

}

- (void)startScrollTranscriptTest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("chatIdentifier")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversations"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversationForExistingChatWithChatIdentifier:", v4));

  if (objc_msgSend(v6, "count"))
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentConversation"));

    if (v8 == v11)
    {
      if (objc_msgSend(__CurrentTestName, "rangeOfString:", CFSTR("WithKeyboard")) != (id)0x7FFFFFFFFFFFFFFFLL)
        -[SMSApplication showKeyboard](self, "showKeyboard");
      -[SMSApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "tapFSMIfNecessary", 0, 0.5);
      -[SMSApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "scrollTranscript", 0, 1.0);
    }
    else
    {
      -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
      v12 = dispatch_time(0, 1000000000);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10001644C;
      v13[3] = &unk_100030B70;
      v13[4] = self;
      v14 = v8;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v13);

    }
  }

}

- (void)chatRegistryDidLoad:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;

  v4 = a3;
  if (qword_10003AE68)
  {
    v6 = v4;
    v5 = -[SMSApplication canRunTests](self, "canRunTests");
    v4 = v6;
    if (v5)
    {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100030F78);
      v4 = v6;
    }
  }

}

- (BOOL)canRunTests
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  unsigned int v7;
  BOOL v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cachedChats"));
  v4 = (uint64_t)objc_msgSend(v3, "count");

  v5 = objc_msgSend(__CurrentTestName, "rangeOfString:", CFSTR("MessageSendLatency"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry"));
  v7 = objc_msgSend(v6, "_isLoading") ^ 1;

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = v7;
  return v4 > 50 || v8;
}

- (void)startStaticTranscriptFPSTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  signed int v11;
  BOOL v12;
  void *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("chatIdentifier")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversations"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationForExistingChatWithChatIdentifier:", v5));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("runtime")));
  v11 = objc_msgSend(v10, "intValue");
  if (objc_msgSend(v7, "count"))
    v12 = v9 == 0;
  else
    v12 = 1;
  if (v12)
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentConversation"));

    if (v9 == v14)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
      -[SMSApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "startGeneralStaticFPSTestWithDelay:", v16, 1.0);

    }
    else
    {
      -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
      v15 = dispatch_time(0, 1000000000);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100016788;
      v17[3] = &unk_100030B70;
      v17[4] = self;
      v18 = v9;
      dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, v17);

    }
  }

}

- (void)startGeneralStaticFPSTestWithDelay:(id)a3
{
  uint64_t v4;
  id v5;
  dispatch_time_t v6;
  _QWORD block[5];

  v4 = __CurrentTestName;
  v5 = a3;
  -[SMSApplication startedTest:](self, "startedTest:", v4);
  LODWORD(v4) = objc_msgSend(v5, "intValue");

  v6 = dispatch_time(0, 1000000000 * (int)v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001687C;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startStaticFSMFPSTest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("chatIdentifier")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversations"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversationForExistingChatWithChatIdentifier:", v4));

  if (objc_msgSend(v6, "count"))
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentConversation"));

    if (v8 == v11)
    {
      -[SMSApplication performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "startFSMTest", 0, 1.0);
    }
    else
    {
      -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
      v12 = dispatch_time(0, 1000000000);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100016A28;
      v13[3] = &unk_100030B70;
      v13[4] = self;
      v14 = v8;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v13);

    }
  }

}

- (void)startFSMTest
{
  void *v3;
  void *v4;
  double v5;
  dispatch_time_t v6;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "fsmDidFinish:", CKEffectManagerEffectDidEndForPPT, 0);

  -[SMSApplication tapFSMIfNecessary](self, "tapFSMIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication _fsmIdentifierForTestName:](self, "_fsmIdentifierForTestName:", __CurrentTestName));
  +[CKFullScreenEffectManager delayBeforeEffectWithIdentifier:](CKFullScreenEffectManager, "delayBeforeEffectWithIdentifier:", v4);
  v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016B58;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)_fsmIdentifierForTestName:(id)a3
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("Confetti")) & 1) != 0)
  {
    v4 = (id *)&CKFullScreenEffectConfettiIdentifier;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Heart")) & 1) != 0)
  {
    v4 = (id *)&CKFullScreenEffectLoveIdentifier;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Balloon")) & 1) != 0)
  {
    v4 = (id *)&CKFullScreenEffectHappyBirthdayIdentifier;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Laser")) & 1) != 0)
  {
    v4 = (id *)&CKFullScreenEffectLasersIdentifier;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Fireworks")) & 1) != 0)
  {
    v4 = (id *)&CKFullScreenEffectFireworksIdentifier;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("ShootingStar")) & 1) != 0)
  {
    v4 = (id *)&CKFullScreenEffectShootingStarIdentifier;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Sparkles")) & 1) != 0)
  {
    v4 = (id *)&CKFullScreenEffectCelebrationIdentifier;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Echo")) & 1) != 0)
  {
    v4 = (id *)&CKFullScreenEffectEchoIdentifier;
  }
  else
  {
    if (!objc_msgSend(v3, "containsString:", CFSTR("Spotlight")))
    {
      v5 = 0;
      goto LABEL_20;
    }
    v4 = (id *)&CKFullScreenEffectSpotlightIdentifier;
  }
  v5 = *v4;
LABEL_20:

  return v5;
}

- (void)fsmDidFinish:(id)a3
{
  -[SMSApplication finishedTest:extraResults:](self, "finishedTest:extraResults:", __CurrentTestName, 0);
}

- (void)startInteractiveStickerDragTest:(id)a3
{
  void *v4;
  signed int v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  CGFloat v11;
  CGContext *CurrentContext;
  id v13;
  UIImage *ImageFromCurrentImageContext;
  void *v15;
  id v16;
  void *v17;
  id v18;
  double MidX;
  double MidY;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  dispatch_time_t v28;
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  SMSApplication *v34;
  void *v35;
  CGSize v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("runtime")));
  v5 = objc_msgSend(v4, "intValue");

  v6 = objc_alloc((Class)CKBrowserDragWindow);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "bounds");
  v8 = objc_msgSend(v6, "initWithFrame:allowsRotation:restrictedToPortraitOrientation:", 0, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v9, "scale");
  v11 = v10;
  v36.width = 100.0;
  v36.height = 100.0;
  UIGraphicsBeginImageContextWithOptions(v36, 1, v11);

  CurrentContext = UIGraphicsGetCurrentContext();
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor")));
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v13, "CGColor"));

  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.width = 100.0;
  v37.size.height = 100.0;
  CGContextFillRect(CurrentContext, v37);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  v16 = objc_alloc((Class)CKAnimatedImage);
  v35 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
  v18 = objc_msgSend(v16, "initWithImages:durations:", v17, &off_100034E68);

  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = 100.0;
  v38.size.height = 100.0;
  MidX = CGRectGetMidX(v38);
  v39.origin.x = 0.0;
  v39.origin.y = 0.0;
  v39.size.width = 100.0;
  v39.size.height = 100.0;
  MidY = CGRectGetMidY(v39);
  v21 = objc_msgSend(objc_alloc((Class)CKBrowserDragViewController), "initWithDragImage:inSourceRect:withSourcePoint:keyboardSourceRect:keyboardSourcePoint:withGestureRecognizer:", v18, 0, 0.0, 0.0, 100.0, 100.0, MidX, MidY, 0, 0, 0x4059000000000000, 0x4059000000000000, *(_QWORD *)&MidX, *(_QWORD *)&MidY);
  objc_msgSend(v8, "setHidden:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rootViewController"));
  objc_msgSend(v22, "presentViewController:animated:completion:", v21, 0, 0);
  v23 = (void *)qword_10003AE90;
  qword_10003AE90 = (uint64_t)v21;
  v24 = v21;

  *(double *)&xmmword_10003AEA0 = MidX;
  *((double *)&xmmword_10003AEA0 + 1) = MidY;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "displayLinkWithTarget:selector:", self, "_stickerDragFired:"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v26, "addToRunLoop:forMode:", v27, NSRunLoopCommonModes);

  objc_msgSend(v24, "manuallyInitializeDragAtPoint:", MidX, MidY);
  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v28 = dispatch_time(0, 1000000000 * v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017070;
  block[3] = &unk_100030A58;
  v32 = v26;
  v33 = v8;
  v34 = self;
  v29 = v8;
  v30 = v26;
  dispatch_after(v28, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_stickerDragFired:(id)a3
{
  objc_msgSend((id)qword_10003AE90, "manuallyUpdateDragPositionToPoint:", a3, xmmword_10003AEA0);
  __asm { FMOV            V1.2D, #2.0 }
  xmmword_10003AEA0 = (__int128)vaddq_f64((float64x2_t)xmmword_10003AEA0, _Q1);
}

- (void)startRotationTest:(id)a3
{
  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  --dword_10003AE60;
  objc_msgSend(UIApp, "rotateIfNeeded:", 3);
}

- (void)startRotationTestWithTranscript:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversations"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversationForExistingChatWithChatIdentifier:", CFSTR("madrid64@apple.com")));

  if (objc_msgSend(v5, "count"))
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentConversation"));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100017314;
    v17[3] = &unk_100030A30;
    v17[4] = self;
    v11 = objc_retainBlock(v17);
    v12 = v11;
    if (v7 == v10)
    {
      ((void (*)(_QWORD *))v11[2])(v11);
    }
    else
    {
      -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
      v13 = dispatch_time(0, 1000000000);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000173A8;
      v14[3] = &unk_100030F30;
      v14[4] = self;
      v15 = v7;
      v16 = v12;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v14);

    }
  }

}

- (void)_chatControllerWillRotate:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, 10000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000174D4;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_chatControllerDidRotate:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, kPPTChatControllerWillRotateNotification, 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, kPPTChatControllerDidRotateNotification, 0);
  -[SMSApplication finishedTest:](self, "finishedTest:", __CurrentTestName);

}

- (void)startAudioWaveformFPSTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversations"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationForExistingChatWithChatIdentifier:", CFSTR("madrid64@apple.com")));

  if (objc_msgSend(v4, "count"))
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentConversation"));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100017728;
    v16[3] = &unk_100030A30;
    v16[4] = self;
    v10 = objc_retainBlock(v16);
    v11 = v10;
    if (v6 == v9)
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }
    else
    {
      -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
      v12 = dispatch_time(0, 1000000000);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100017874;
      v13[3] = &unk_100030F30;
      v13[4] = self;
      v14 = v6;
      v15 = v11;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v13);

    }
  }

}

- (void)startInvisibleInkStaticFPSTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversations"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationForExistingChatWithChatIdentifier:", CFSTR("chatF4855F71-ABE9-45C6-93CF-647E4D741734")));

  if (objc_msgSend(v4, "count"))
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentConversation"));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100017AE8;
    v16[3] = &unk_100030A30;
    v16[4] = self;
    v10 = objc_retainBlock(v16);
    v11 = v10;
    if (v6 == v9)
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }
    else
    {
      -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
      v12 = dispatch_time(0, 1000000000);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100017B90;
      v13[3] = &unk_100030F30;
      v13[4] = self;
      v14 = v6;
      v15 = v11;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v13);

    }
  }

}

- (void)startGifPlaybackStaticFPSTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversations"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationForExistingChatWithChatIdentifier:", CFSTR("eugene@bistolas.info")));

  if (objc_msgSend(v4, "count"))
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentConversation"));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100017E04;
    v16[3] = &unk_100030A30;
    v16[4] = self;
    v10 = objc_retainBlock(v16);
    v11 = v10;
    if (v6 == v9)
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }
    else
    {
      -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
      v12 = dispatch_time(0, 1000000000);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100017EAC;
      v13[3] = &unk_100030F30;
      v13[4] = self;
      v14 = v6;
      v15 = v11;
      dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v13);

    }
  }

}

- (void)startKeyboardPresentationTest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversations"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversationForExistingChatWithChatIdentifier:", CFSTR("+14088969566")));

  if (objc_msgSend(v5, "count"))
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentConversation"));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100018154;
    v18[3] = &unk_100030A30;
    v18[4] = self;
    v11 = objc_retainBlock(v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "preferencesActions"));
    objc_msgSend(v13, "setPredictionEnabled:", 0);

    if (v7 == v10)
    {
      ((void (*)(_QWORD *))v11[2])(v11);
    }
    else
    {
      -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
      v14 = dispatch_time(0, 2000000000);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000181DC;
      v15[3] = &unk_100030F30;
      v15[4] = self;
      v16 = v7;
      v17 = v11;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v15);

    }
  }

}

- (void)startKeyboardResponsivenessTest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversations"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversationForExistingChatWithChatIdentifier:", CFSTR("+14088969566")));

  if (objc_msgSend(v5, "count"))
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentConversation"));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100018480;
    v18[3] = &unk_100030A30;
    v18[4] = self;
    v11 = objc_retainBlock(v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "preferencesActions"));
    objc_msgSend(v13, "setPredictionEnabled:", 0);

    if (v7 == v10)
    {
      ((void (*)(_QWORD *))v11[2])(v11);
    }
    else
    {
      -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
      v14 = dispatch_time(0, 2000000000);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000184F8;
      v15[3] = &unk_100030F30;
      v15[4] = self;
      v16 = v7;
      v17 = v11;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v15);

    }
  }

}

- (void)_keyboardWillShow:(id)a3
{
  if (objc_msgSend(__CurrentTestName, "isEqualToString:", CFSTR("PresentKeyboardTest")))
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
}

- (void)_keyboardDidShow:(id)a3
{
  byte_10003AE70 = 1;
  if ((objc_msgSend(__CurrentTestName, "isEqualToString:", CFSTR("PresentKeyboardTest")) & 1) != 0
    || (objc_msgSend(__CurrentTestName, "isEqualToString:", CFSTR("PresentKeyboardResponsivenessTest")) & 1) != 0
    || byte_10003AE71 == 1
    && objc_msgSend(__CurrentTestName, "rangeOfString:", kShowNewComposeTest) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[SMSApplication finishedTest:](self, "finishedTest:", __CurrentTestName);
  }
}

- (void)startQuicklookPresentationTest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversations"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversationForExistingChatWithChatIdentifier:", CFSTR("+14088383543")));

  if (objc_msgSend(v5, "count"))
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentConversation"));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100018854;
    v17[3] = &unk_100030A30;
    v17[4] = self;
    v11 = objc_retainBlock(v17);
    v12 = v11;
    if (v7 == v10)
    {
      ((void (*)(_QWORD *))v11[2])(v11);
    }
    else
    {
      -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
      v13 = dispatch_time(0, 1000000000);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100018AF4;
      v14[3] = &unk_100030F30;
      v14[4] = self;
      v15 = v7;
      v16 = v12;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v14);

    }
  }

}

- (void)startAudioBalloonPlaybackTest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  char isKindOfClass;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_audioBalloonPlaybackWillStart:", kAudioBalloonViewPlaybackWillStartNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_audioBalloonPlaybackDidFinish:", kAudioBalloonViewPlaybackDidFinishNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversationForExistingChatWithChatIdentifier:", CFSTR("jake.chase.dev2@icloud.com")));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    objc_msgSend(v8, "showConversation:animate:", v7, 0);

    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chatController"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionViewController"));
    objc_msgSend(v11, "__setCurrentTestName:", __CurrentTestName);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionView"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "visibleCells"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v23 = v11;
      v15 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v18 = objc_opt_class(CKTranscriptBalloonCell);
          if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
          {
            v19 = v17;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "balloonView"));
            v21 = objc_opt_class(CKAudioBalloonView);
            isKindOfClass = objc_opt_isKindOfClass(v20, v21);

            if ((isKindOfClass & 1) != 0)
            {
              v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "balloonView"));

              goto LABEL_15;
            }

          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v14)
          continue;
        break;
      }
LABEL_15:
      v11 = v23;
    }

    objc_msgSend(v11, "balloonViewTapped:withModifierFlags:selectedText:", v14, 0, 0);
  }
  else
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }

}

- (void)_audioBalloonPlaybackWillStart:(id)a3
{
  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
}

- (void)_audioBalloonPlaybackDidFinish:(id)a3
{
  -[SMSApplication finishedTest:](self, "finishedTest:", __CurrentTestName);
}

- (void)startScrollConversationsTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chatController"));

  objc_msgSend(v6, "_backbuttonPressed");
  v7 = dispatch_time(0, 6000000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018F84;
  v9[3] = &unk_100030B70;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);

}

- (void)clearEntryView
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chatController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entryView"));
  objc_msgSend(v4, "setComposition:", 0);

  -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
}

- (void)startScrollForCollectionView:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  id v7;

  v3 = (void *)qword_10003AE50;
  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("offset")));
  v5 = objc_msgSend(v4, "intValue");

  if (v5)
    v6 = v5;
  else
    v6 = 18;
  objc_msgSend(v7, "_performScrollTest:iterations:delta:scrollAxis:", __CurrentTestName, dword_10003AE60, v6, 1);

}

- (void)scrollPhotoPickerTestWithOptions:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  dispatch_time_t v14;
  _QWORD block[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];

  v4 = a3;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100019408;
  v21[3] = &unk_100030A30;
  v21[4] = self;
  v5 = objc_retainBlock(v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conversations"));

  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationForExistingChatWithChatIdentifier:", CFSTR("madrid64@apple.com")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentConversation"));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100019440;
    v18[3] = &unk_100030FC8;
    v18[4] = self;
    v20 = v5;
    v19 = v4;
    v12 = objc_retainBlock(v18);
    v13 = v12;
    if (v9 == v11)
    {
      ((void (*)(_QWORD *))v12[2])(v12);
    }
    else
    {
      -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
      v14 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001970C;
      block[3] = &unk_100030F30;
      block[4] = self;
      v16 = v9;
      v17 = v13;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);

    }
  }
  else
  {
    ((void (*)(_QWORD *))v5[2])(v5);
  }

}

- (void)startExtensionTest:(id)a3 launch:(BOOL)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SMSApplication *v9;
  id v10;
  BOOL v11;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001986C;
  v7[3] = &unk_100031018;
  v11 = a4;
  v8 = a3;
  v9 = self;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("chatIdentifier")));
  v5 = v10;
  v6 = v8;
  -[SMSApplication showConversationForChatIdentifier:forceReload:options:completion:](self, "showConversationForChatIdentifier:forceReload:options:completion:", v5, 1, v6, v7);

}

- (void)startPriorityBoostingTestWithOptions:(id)a3
{
  void *v4;
  id v5;

  -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
  v5 = __CurrentTestName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
  objc_msgSend(v4, "blockUntilConnected");

  -[SMSApplication finishedTest:](self, "finishedTest:", v5);
}

- (void)startMarkAsReadLocallyTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("chatIdentifier")));
  v6 = (void *)IMCopyGUIDForChat(v5, IMServiceNameiMessage, 45);
  if (((uint64_t (*)(void))IMOSLoggingEnabled)())
  {
    v7 = OSLogHandleForIMFoundationCategory("MarkAsReadTest");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "mark as unread locally start", (uint8_t *)&v17, 2u);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "existingChatWithGUID:", v6));

  if (v10)
  {
    if (IMOSLoggingEnabled(objc_msgSend(v10, "_automation_markAsRead:messageGUID:forChatGUID:fromMe:", 0, 0, v6, 0)))
    {
      v11 = OSLogHandleForIMFoundationCategory("MarkAsReadTest");
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "mark as unread locally finished", (uint8_t *)&v17, 2u);
      }

    }
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    if (IMOSLoggingEnabled(objc_msgSend(v10, "_automation_markAsRead:messageGUID:forChatGUID:fromMe:", 1, 0, v6, 0)))
    {
      v13 = OSLogHandleForIMFoundationCategory("MarkAsReadTest");
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "mark as read locally finished", (uint8_t *)&v17, 2u);
      }

    }
    -[SMSApplication finishedTest:](self, "finishedTest:", __CurrentTestName);
  }
  else
  {
    if (((uint64_t (*)(void))IMOSLoggingEnabled)())
    {
      v15 = OSLogHandleForIMFoundationCategory("MarkAsReadTest");
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Failed to find chat: %@", (uint8_t *)&v17, 0xCu);
      }

    }
    -[SMSApplication startAndFailTestNamed:withFailure:](self, "startAndFailTestNamed:withFailure:", __CurrentTestName, CFSTR("Failed to find chat"));
  }

}

- (void)startMarkAsReadReceivedTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  void *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("chatIdentifier")));
  v6 = (void *)IMCopyGUIDForChat(v5, IMServiceNameiMessage, 45);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("sentGUID")));
  if (IMOSLoggingEnabled(v7))
  {
    v8 = OSLogHandleForIMFoundationCategory("MarkAsReadTest");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "mark as unread received start", (uint8_t *)&v21, 2u);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "existingChatWithGUID:", v6));

  if (v11)
  {
    if (IMOSLoggingEnabled(objc_msgSend(v11, "_automation_markAsRead:messageGUID:forChatGUID:fromMe:", 0, 0, v6, 1)))
    {
      v13 = OSLogHandleForIMFoundationCategory("MarkAsReadTest");
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "mark as unread received finished", (uint8_t *)&v21, 2u);
      }

    }
    if (IMOSLoggingEnabled(-[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName)))
    {
      v15 = OSLogHandleForIMFoundationCategory("MarkAsReadTest");
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "mark as read received start", (uint8_t *)&v21, 2u);
      }

    }
    if (IMOSLoggingEnabled(objc_msgSend(v11, "_automation_markAsRead:messageGUID:forChatGUID:fromMe:", 1, v7, v6, 1)))
    {
      v17 = OSLogHandleForIMFoundationCategory("MarkAsReadTest");
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "mark as read received finished", (uint8_t *)&v21, 2u);
      }

    }
    -[SMSApplication finishedTest:](self, "finishedTest:", __CurrentTestName);
  }
  else
  {
    if (IMOSLoggingEnabled(v12))
    {
      v19 = OSLogHandleForIMFoundationCategory("MarkAsReadTest");
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = 138412290;
        v22 = v6;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Failed to find chat: %@", (uint8_t *)&v21, 0xCu);
      }

    }
    -[SMSApplication startAndFailTestNamed:withFailure:](self, "startAndFailTestNamed:withFailure:", __CurrentTestName, CFSTR("Failed to find chat"));
  }

}

- (void)showMessagesApplicationAndStartTestForIdentifier:(id)a3 supportsLaunchSubtest:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a4;
  v21 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chatController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inputController"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "balloonPluginForBundleID:", v21));

  if (v10)
  {
    if (objc_msgSend(__CurrentTestName, "rangeOfString:", CFSTR("ExtensionLaunch")) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
      if (v4)
        -[SMSApplication startedSubTest:forTest:](self, "startedSubTest:forTest:", CFSTR("PluginLaunchSubtest"), __CurrentTestName);
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "substringFromIndex:", (char *)objc_msgSend(v21, "rangeOfString:options:", CFSTR("."), 4) + 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v11, CFSTR("ExtensionLaunch")));
    if (!objc_msgSend(__CurrentTestName, "isEqualToString:", v12))
    {
      -[SMSApplication startAndFailTestNamed:withFailure:](self, "startAndFailTestNamed:withFailure:", __CurrentTestName, v12);

      goto LABEL_22;
    }
    if (qword_10003AED0 != -1)
      dispatch_once(&qword_10003AED0, &stru_1000310A0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_retainAutorelease((id)qword_10003AEC8), "pluginKitProxyForIdentifier:", v21));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "containingBundle"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "teamID"));
    v16 = (void *)v15;
    v17 = CFSTR("0000000000");
    if (v15)
      v17 = (__CFString *)v15;
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%@"), IMBalloonPluginIdentifierMessageExtension, v18, v21));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "balloonPluginForBundleID:", v19));

    if (!v10)
    {
      -[SMSApplication startAndFailTestNamed:withFailure:](self, "startAndFailTestNamed:withFailure:", __CurrentTestName, CFSTR("Plugin not found for identifier %@"), v21);
      goto LABEL_22;
    }
    if (objc_msgSend(__CurrentTestName, "rangeOfString:", CFSTR("ExtensionLaunch")) != (id)0x7FFFFFFFFFFFFFFFLL)
      -[SMSApplication startedIPTest:](self, "startedIPTest:", __CurrentTestName);
  }
  if (objc_msgSend(v21, "isEqualToString:", IMBalloonPluginIdentifierDT))
  {
    objc_msgSend(v8, "showDTCompose");
  }
  else if (objc_msgSend(v21, "isEqualToString:", IMBalloonPluginIdentifierPhotos))
  {
    objc_msgSend(v8, "showPhotosBrowser");
  }
  else if (objc_msgSend(v21, "isEqualToString:", IMBalloonPluginIdentifierHandwriting))
  {
    objc_msgSend(v8, "showHandwritingBrowser");
  }
  else
  {
    objc_msgSend(v8, "showBrowserForPlugin:dataSource:style:", v10, 0, 1);
  }

LABEL_22:
}

- (void)didChangeOrientation:(id)a3
{
  int v4;
  void *v5;
  unsigned int v6;
  int v7;
  void *v8;
  unsigned int v9;

  if (objc_msgSend(__CurrentTestName, "rangeOfString:", kShowMessagesTest) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[SMSApplication startShowMessagesTest:](self, "startShowMessagesTest:", qword_10003AE50);
    return;
  }
  if (objc_msgSend(__CurrentTestName, "rangeOfString:", CFSTR("ScrollConversations")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[SMSApplication startScrollConversationsTest:](self, "startScrollConversationsTest:", qword_10003AE50);
    return;
  }
  if (objc_msgSend(__CurrentTestName, "rangeOfString:", CFSTR("ScrollTranscript")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[SMSApplication startScrollTranscriptTest:](self, "startScrollTranscriptTest:", qword_10003AE50);
    return;
  }
  if (objc_msgSend(__CurrentTestName, "isEqualToString:", CFSTR("Rotation")))
  {
    v4 = dword_10003AE60;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("iterations")));
    v6 = objc_msgSend(v5, "intValue") + 1;

    if (v4 == v6)
      -[SMSApplication startRotationTest:](self, "startRotationTest:", qword_10003AE50);
  }
  else
  {
    if (!objc_msgSend(__CurrentTestName, "isEqualToString:", CFSTR("RotateTranscript")))
      return;
    v7 = dword_10003AE60;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("iterations")));
    v9 = objc_msgSend(v8, "intValue") + 1;

    if (v7 == v9)
      -[SMSApplication startRotationTestWithTranscript:](self, "startRotationTestWithTranscript:", qword_10003AE50);
  }
  if (dword_10003AE60 < 1)
  {
    -[SMSApplication finishedTest:extraResults:](self, "finishedTest:extraResults:", __CurrentTestName, 0);
  }
  else
  {
    --dword_10003AE60;
    if ((objc_msgSend(UIApp, "rotateIfNeeded:", 1) & 1) == 0)
      objc_msgSend(UIApp, "rotateIfNeeded:", 3);
  }
}

- (void)startLiveBubbleLoadingTest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("chatIdentifier")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationForExistingChatWithChatIdentifier:", v4));

  if (v6)
  {
    -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
    v7 = dispatch_time(0, 1000000000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001A73C;
    v8[3] = &unk_100030B70;
    v8[4] = self;
    v9 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);

  }
  else
  {
    -[SMSApplication startedTest:](self, "startedTest:", __CurrentTestName);
    -[SMSApplication failedTest:](self, "failedTest:", __CurrentTestName);
  }

}

- (void)startResizeTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("recapBased")));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication sceneController](self, "sceneController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messagesSceneDelegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

    if ((objc_msgSend(v9, "isKeyWindow") & 1) == 0)
      -[SMSApplication startAndFailTestNamed:withFailure:](self, "startAndFailTestNamed:withFailure:", __CurrentTestName, CFSTR("The MessagesSceneDelegate's window isn't key for some reason"));
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v10 = (void *)qword_10003AED8;
    v18 = qword_10003AED8;
    if (!qword_10003AED8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10001B230;
      v14[3] = &unk_100031068;
      v14[4] = &v15;
      sub_10001B230((uint64_t)v14);
      v10 = (void *)v16[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v15, 8);
    v12 = [v11 alloc];
    v13 = objc_msgSend(v12, "initWithTestName:window:completionHandler:", __CurrentTestName, v9, 0);
    objc_msgSend(v13, "setMinimumWindowSize:", 300.0, 300.0);
    objc_msgSend(v13, "setMaximumWindowSize:", 600.0, 600.0);
    objc_msgSend(sub_100008914(), "runTestWithParameters:", v13);

  }
}

- (void)_willConfigureCellWithTranscriptPluginChatItem:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = CKPluginChatItemPPTName;
  if (objc_msgSend(__CurrentTestName, "isEqualToString:", CKPluginChatItemPPTName))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v4, "startedTest:", v3);

  }
}

- (void)startPPTSubtestForCurrentTest:(id)a3
{
  uint64_t v3;
  id v5;
  id v6;

  if (a3)
  {
    v3 = __CurrentTestName;
    if (__CurrentTestName)
    {
      v5 = a3;
      v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("time")));
      -[SMSApplication startedSubTest:forTest:withMetrics:](self, "startedSubTest:forTest:withMetrics:", v5, v3, v6);

    }
  }
}

- (void)stopPPTSubtestForCurrentTest:(id)a3
{
  if (a3)
  {
    if (__CurrentTestName)
      -[SMSApplication finishedSubTest:forTest:](self, "finishedSubTest:forTest:");
  }
}

- (void)installNotificationObserverForNotificationName:(id)a3 notificationName:(id)a4 forOneNotification:(BOOL)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  id v19;
  BOOL v20;
  id location;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1000096D0;
  v26 = sub_1000096E0;
  v27 = 0;
  location = 0;
  objc_initWeak(&location, v9);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001ACFC;
  v16[3] = &unk_100031040;
  v18 = &v22;
  v20 = a5;
  objc_copyWeak(&v19, &location);
  v13 = v11;
  v17 = v13;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, 0, v12, v16));
  v15 = (void *)v23[5];
  v23[5] = v14;

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v22, 8);

}

- (void)showConversationForChatIdentifier:(id)a3 forceReload:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  dispatch_time_t v18;
  _QWORD block[5];
  id v20;
  void (**v21)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a6;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "conversations"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "conversationForExistingChatWithChatIdentifier:", v10));

  if (objc_msgSend(v12, "count"))
    v15 = v14 == 0;
  else
    v15 = 1;
  if (v15)
  {
    v9[2](v9, 0);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SMSApplication messagesController](self, "messagesController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentConversation"));

    if (a4 || v14 != v17)
    {
      -[SMSApplication showTranscriptListNotAnimated](self, "showTranscriptListNotAnimated");
      v18 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001AF28;
      block[3] = &unk_100030F30;
      block[4] = self;
      v20 = v14;
      v21 = v9;
      dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, block);

    }
    else
    {
      v9[2](v9, 1);
    }

  }
}

- (void)startAndFailTestNamed:(id)a3 withFailure:(id)a4
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v5 = __CurrentTestName;
  v6 = a4;
  -[SMSApplication startedTest:](self, "startedTest:", v5);
  v7 = __CurrentTestName;
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v6, &v9);

  -[SMSApplication failedTest:withFailure:](self, "failedTest:withFailure:", v7, v8);
}

- (void)keyCommandCompose:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance", a3));
  objc_msgSend(v3, "setDraftForPendingConversation:withRecipients:", 0, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v4, "saveCompositionAndFlushCache:", 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("sms://open?addresses=")));
  objc_msgSend(UIApp, "openURL:options:completionHandler:", v5, &__NSDictionary0__struct, 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[IMDaemonMultiplexedConnectionManaging invalidate](self->_daemonConnection, "invalidate");
  -[BKSProcessAssertion setInvalidationHandler:](self->_backgroundAssertion, "setInvalidationHandler:", 0);
  -[BKSProcessAssertion invalidate](self->_backgroundAssertion, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SMSApplication;
  -[SMSApplication dealloc](&v4, "dealloc");
}

- (void)_handleUnitTestInvocation:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SMSApplication *v9;

  v4 = a3;
  -[SMSApplication setRunningViaTestRunner:](self, "setRunningViaTestRunner:", 1);
  v5 = dispatch_time(0, 5000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F420;
  v7[3] = &unk_100030B70;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);

}

- (void)setPendingAppleEventInfoDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setPendingLaunchEventContext:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLaunchEventContext, a3);
}

- (BKSProcessAssertion)backgroundAssertion
{
  return self->_backgroundAssertion;
}

- (void)setBackgroundAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundAssertion, a3);
}

- (void)setRunningViaTestRunner:(BOOL)a3
{
  self->_runningViaTestRunner = a3;
}

- (IMDaemonMultiplexedConnectionManaging)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnection, a3);
}

- (SMSApplicationPerformSearchProtocol)testPerformSearchDelegate
{
  return (SMSApplicationPerformSearchProtocol *)objc_loadWeakRetained((id *)&self->_testPerformSearchDelegate);
}

- (void)setTestPerformSearchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_testPerformSearchDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testPerformSearchDelegate);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_backgroundAssertion, 0);
  objc_storeStrong((id *)&self->_pendingLaunchEventContext, 0);
  objc_storeStrong((id *)&self->_pendingAppleEventInfoDictionary, 0);
}

@end
