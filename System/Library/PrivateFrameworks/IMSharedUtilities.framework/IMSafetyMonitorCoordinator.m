@implementation IMSafetyMonitorCoordinator

+ (id)sharedCoordinator
{
  if (qword_1ECFC6FD0 != -1)
    dispatch_once(&qword_1ECFC6FD0, &unk_1E3FB3908);
  return (id)qword_1ECFC6FD8;
}

- (NSString)appPayloadID
{
  void *v2;
  void *v3;

  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appPayloadID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)appPayload
{
  void *v2;
  void *v3;

  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)shouldDropIncomingCheckInMessageWithURL:(id)a3 senderHandle:(id)a4 isFromMe:(BOOL)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v9, "shouldDropIncomingCheckInMessageWithURL:senderHandle:isFromMe:", v8, v7, v5);

  return v5;
}

- (void)informOfOutgoingMessageWithMessage:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "informOfOutgoingMessageWithMessage:sentSuccessfully:error:", v8, v5, v7);

}

- (void)informOfIncomingMessageWithMessage:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "informOfIncomingMessageWithMessage:", v3);

}

- (void)informOfDeletedMessagesWithMessages:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "informOfDeletedMessagesWithMessages:", v3);

}

- (void)informOfDeletedConversationWithReceiverHandles:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "informOfDeletedConversationWithReceiverHandles:", v3);

}

- (void)informOfScheduledMessage:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "informOfScheduledMessageSendWithMessage:sentSuccessfully:error:", v8, v5, v7);

}

- (void)informOfCancelledScheduledMessageSendWithMessageGUID:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "informOfCancelledScheduledMessageSendWithMessageGUID:sentSuccessfully:error:", v8, v5, v7);

}

- (void)informOfSentScheduledMessage:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "informOfTriggeredScheduledMessageSendWithMessage:", v3);

}

- (void)informOfChangedGroupMembership:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "informOfChangedGroupMembershipWithGroupID:", v3);

}

- (void)informOfKickFromGroup:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "informOfKickFromGroupWithGroupID:", v3);

}

- (void)informOfChangedGroupDisplayName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "informOfChangedGroupDisplayNameWithGroupID:", v3);

}

- (void)informOfChangedGroupPhoto:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "informOfChangedGroupPhotoWithGroupID:", v3);

}

- (void)checkPreferredHandlesCacheForReceiverWith:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "checkPreferredHandlesCacheForReceiverWith:completion:", v6, v5);

}

- (void)checkPreferredHandlesCacheForInitiatorHandleID:(id)a3 andReceiver:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "checkPreferredHandlesCacheForInitiatorHandleID:andReceiver:completion:", v9, v8, v7);

}

- (void)shouldShowKeyboardSuggestionForInitiator:(id)a3 andReceiver:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shouldShowKeyboardSuggestionForInitiator:andReceiver:completion:", v9, v8, v7);

}

- (void)shouldShowTipKitSuggestionForInitiator:(id)a3 andReceiver:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shouldShowTipKitSuggestionForInitiator:andReceiver:completion:", v9, v8, v7);

}

- (int64_t)notificationContentForInitiator:(id)a3 messageURL:(id)a4 content:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int64_t v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "notificationContentForInitiator:messageURL:content:", v9, v8, v7);

  return v11;
}

- (BOOL)shouldDisallowBasedOnRegulatoryDomain
{
  void *v2;
  char v3;

  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDisallowBasedOnRegulatoryDomain");

  return v3;
}

- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[IMSafetyMonitorCoordinator_Impl sharedCoordinator](IMSafetyMonitorCoordinator_Impl, "sharedCoordinator");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:completion:", v12, v11, v10, v9);

}

@end
