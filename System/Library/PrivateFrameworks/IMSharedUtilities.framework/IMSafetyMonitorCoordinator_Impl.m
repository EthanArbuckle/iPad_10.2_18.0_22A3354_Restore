@implementation IMSafetyMonitorCoordinator_Impl

+ (IMSafetyMonitorCoordinator_Impl)sharedCoordinator
{
  if (qword_1ECFC6688 != -1)
    swift_once();
  return (IMSafetyMonitorCoordinator_Impl *)(id)qword_1ECFC6678;
}

- (IMSafetyMonitorCoordinator_Impl)init
{
  IMSafetyMonitorCoordinator_Impl *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMSafetyMonitorCoordinator_Impl_currentBestEstimates) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SafetyMonitorCoordinator();
  v2 = -[IMSafetyMonitorCoordinator_Impl init](&v4, sel_init);
  sub_19E334948();

  return v2;
}

- (NSString)appPayloadID
{
  void *v2;

  sub_19E36F888();
  swift_bridgeObjectRetain();
  sub_19E36F8C4();
  swift_bridgeObjectRelease();
  v2 = (void *)sub_19E36F864();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDictionary)appPayload
{
  void *v2;

  sub_19E32DCF4((uint64_t)&unk_1E3FB20E0);
  v2 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (BOOL)shouldDisallowBasedOnRegulatoryDomain
{
  IMSafetyMonitorCoordinator_Impl *v2;
  char v3;

  v2 = self;
  v3 = sub_19E334620();

  return v3 & 1;
}

- (void)checkPreferredHandlesCacheForReceiverWith:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  IMSafetyMonitorCoordinator_Impl *v16;
  uint64_t v17;

  v6 = sub_19E247E74(&qword_1ECFC6648);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = sub_19E36F888();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v9;
  v14 = sub_19E36F9E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = v10;
  v15[6] = v12;
  v15[7] = sub_19E33A808;
  v15[8] = v13;
  v16 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_19E334DB4((uint64_t)v8, (uint64_t)&unk_1EE502C88, (uint64_t)v15);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)checkPreferredHandlesCacheForInitiatorHandleID:(id)a3 andReceiver:(id)a4 completion:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  IMSafetyMonitorCoordinator_Impl *v20;
  uint64_t v21;

  v7 = sub_19E247E74(&qword_1ECFC6648);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a5);
  v11 = sub_19E36F888();
  v13 = v12;
  v14 = sub_19E36F888();
  v16 = v15;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v10;
  v18 = sub_19E36F9E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v9, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = self;
  v19[5] = v11;
  v19[6] = v13;
  v19[7] = v14;
  v19[8] = v16;
  v19[9] = sub_19E33A808;
  v19[10] = v17;
  v20 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_19E334DB4((uint64_t)v9, (uint64_t)&unk_1EE502C80, (uint64_t)v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (BOOL)shouldDropIncomingCheckInMessageWithURL:(id)a3 senderHandle:(id)a4 isFromMe:(BOOL)a5
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  IMSafetyMonitorCoordinator_Impl *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v5 = a5;
  v7 = sub_19E36F5E8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19E36F5D0();
  sub_19E36F888();
  v11 = self;
  v12 = (void *)sub_19E36F5C4();
  v13 = (void *)sub_19E36F864();
  LOBYTE(v5) = IMShouldDropIncomingCheckInMessage(v12, v13, v5);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v5;
}

- (void)informOfOutgoingMessageWithMessage:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  IMSafetyMonitorCoordinator_Impl *v10;

  v8 = a3;
  v9 = a5;
  v10 = self;
  sub_19E3357A0(v8, a4, a5);

}

- (void)informOfIncomingMessageWithMessage:(id)a3
{
  id v4;
  IMSafetyMonitorCoordinator_Impl *v5;

  v4 = a3;
  v5 = self;
  sub_19E335824(v4);

}

- (void)informOfDeletedMessagesWithMessages:(id)a3
{
  unint64_t v4;
  IMSafetyMonitorCoordinator_Impl *v5;

  sub_19E24B854(0, (unint64_t *)&qword_1EE501928);
  v4 = sub_19E36F960();
  v5 = self;
  sub_19E335C44(v4);

  swift_bridgeObjectRelease();
}

- (void)informOfDeletedConversationWithReceiverHandles:(id)a3
{
  IMSafetyMonitorCoordinator_Impl *v4;
  id v5;

  if (*(_QWORD *)(sub_19E36F960() + 16))
  {
    v4 = self;
    v5 = (id)sub_19E36F954();
    IMInformSafetyMonitorManagerOfDeletedConversation(v5);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)informOfScheduledMessageSendWithMessage:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  IMSafetyMonitorCoordinator_Impl *v10;

  v8 = a3;
  v9 = a5;
  v10 = self;
  sub_19E33633C(v8, a4, a5);

}

- (void)informOfCancelledScheduledMessageSendWithMessageGUID:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  IMSafetyMonitorCoordinator_Impl *v9;
  id v10;
  void *v11;
  id v12;

  v6 = a4;
  v8 = a3;
  v9 = self;
  if (a5)
  {
    v10 = a5;
    v11 = (void *)sub_19E36F570();
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;
  IMInformSafetyMonitorManagerOfScheduledSendCancelledFor(v8, v6, v11);

}

- (void)informOfTriggeredScheduledMessageSendWithMessage:(id)a3
{
  id v4;
  IMSafetyMonitorCoordinator_Impl *v5;

  v4 = a3;
  v5 = self;
  sub_19E33A14C(v4);

}

- (void)shouldShowKeyboardSuggestionForInitiator:(id)a3 andReceiver:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  IMSafetyMonitorCoordinator_Impl *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  v6 = _Block_copy(a5);
  sub_19E36F888();
  sub_19E36F888();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  v9 = (void *)sub_19E36F864();
  v10 = (void *)sub_19E36F864();
  v12[4] = sub_19E33A808;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_19E3368C4;
  v12[3] = &unk_1E3FBABD8;
  v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  IMShouldShowKeyboardSuggestionsForCheckIn(v9, v10, v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

}

- (void)shouldShowTipKitSuggestionForInitiator:(id)a3 andReceiver:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  IMSafetyMonitorCoordinator_Impl *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  v6 = _Block_copy(a5);
  sub_19E36F888();
  sub_19E36F888();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  v9 = (void *)sub_19E36F864();
  v10 = (void *)sub_19E36F864();
  v12[4] = sub_19E33A570;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_19E3368C4;
  v12[3] = &unk_1E3FB1968;
  v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  IMShouldShowTipKitSuggestionsForCheckIn(v9, v10, v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

}

- (int64_t)notificationContentForInitiator:(id)a3 messageURL:(id)a4 content:(id)a5
{
  id v8;
  id v9;
  IMSafetyMonitorCoordinator_Impl *v10;
  void *v11;
  int64_t v12;

  sub_19E36F888();
  v8 = a4;
  v9 = a5;
  v10 = self;
  v11 = (void *)sub_19E36F864();
  v12 = IMPopulateNotificationUserInfoForCheckIn(v9, v11, v8);

  swift_bridgeObjectRelease();
  return v12;
}

- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 completion:(id)a6
{
  void *v7;
  uint64_t v8;
  IMSafetyMonitorCoordinator_Impl *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  v7 = _Block_copy(a6);
  sub_19E36F888();
  sub_19E36F888();
  sub_19E36F888();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = self;
  v10 = (void *)sub_19E36F864();
  v11 = (void *)sub_19E36F864();
  v12 = (void *)sub_19E36F864();
  v14[4] = sub_19E33A568;
  v14[5] = v8;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 1107296256;
  v14[2] = sub_19E336E4C;
  v14[3] = &unk_1E3FBAB60;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  IMRespondToNotificationWithIdentifier(v10, v11, v12, v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

}

- (void)informOfChangedGroupMembershipWithGroupID:(id)a3
{
  IMInformSafetyMonitorManagerOfChangedGroupMembership(a3);
}

- (void)informOfKickFromGroupWithGroupID:(id)a3
{
  IMInformSafetyMonitorManagerOfKickFromGroup(a3);
}

- (void)informOfChangedGroupDisplayNameWithGroupID:(id)a3
{
  IMInformSafetyMonitorManagerOfChangedGroupDisplayName(a3);
}

- (void)informOfChangedGroupPhotoWithGroupID:(id)a3
{
  IMInformSafetyMonitorManagerOfChangedGroupPhoto(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
