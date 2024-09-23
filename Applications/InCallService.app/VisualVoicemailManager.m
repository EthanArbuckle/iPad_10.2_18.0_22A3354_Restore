@implementation VisualVoicemailManager

- (BOOL)isTranscriptionEnabled
{
  _TtC13InCallService22VisualVoicemailManager *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100104F7C();

  return v3 & 1;
}

- (VMVoicemailManager)vmdVoiceMailManager
{
  id v2;

  sub_100104FC4();
  return (VMVoicemailManager *)v2;
}

- (_TtC13InCallService22VisualVoicemailManager)initWithVisualVoicemailManager:(id)a3 onVoicemailsChanged:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject(&unk_100288638, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  return (_TtC13InCallService22VisualVoicemailManager *)sub_100104FEC(a3, (uint64_t)sub_100108BB8, v6);
}

- (void)fetchMessagesWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC13InCallService22VisualVoicemailManager *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100288610, 32, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_10018236C((uint64_t)&unk_1002D78D0, v5);
}

- (void)deleteVoicemails:(NSArray *)a3 completion:(id)a4
{
  sub_10010669C(self, (int)a2, a3, a4, (uint64_t)&unk_1002885E8, (uint64_t)&unk_1002D78C0);
}

- (void)markVoicemailsAsRead:(NSArray *)a3 completion:(id)a4
{
  sub_10010669C(self, (int)a2, a3, a4, (uint64_t)&unk_1002885C0, (uint64_t)&unk_1002D78B0);
}

- (void)trashVoicemails:(NSArray *)a3 completion:(id)a4
{
  sub_10010669C(self, (int)a2, a3, a4, (uint64_t)&unk_100288598, (uint64_t)&unk_1002D78A0);
}

- (void)removeVoicemailsFromTrash:(NSArray *)a3 completion:(id)a4
{
  sub_10010669C(self, (int)a2, a3, a4, (uint64_t)&unk_100288570, (uint64_t)&unk_1002D7890);
}

- (void)voicemailWithIdentifier:(MPMessageID *)a3 completion:(id)a4
{
  sub_10010669C(self, (int)a2, a3, a4, (uint64_t)&unk_100288548, (uint64_t)&unk_1002D7870);
}

- (void)messagesPassingTest:(id)a3 completion:
{
  const void *v3;
  const void *v4;
  void *v6;
  void *v7;
  _QWORD *v8;
  _TtC13InCallService22VisualVoicemailManager *v9;

  v4 = v3;
  v6 = _Block_copy(a3);
  v7 = _Block_copy(v4);
  v8 = (_QWORD *)swift_allocObject(&unk_1002884A8, 40, 7);
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = self;
  v9 = self;
  sub_10018236C((uint64_t)&unk_1002D7858, (uint64_t)v8);
}

- (_TtC13InCallService22VisualVoicemailManager)init
{
  sub_100106CB8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallService22VisualVoicemailManager_visualVoicemailManager));
  swift_release(*(_QWORD *)&self->visualVoicemailManager[OBJC_IVAR____TtC13InCallService22VisualVoicemailManager_onVoicemailsChanged]);
}

- (void)handleVoiceMailsChangedNotificationWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC13InCallService22VisualVoicemailManager *v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  sub_100106D60(v9);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)voicemailsDidChangeInitial:(BOOL)a3 added:(id)a4 deleted:(id)a5 updated:(id)a6
{
  id v8;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _TtC13InCallService22VisualVoicemailManager *v14;

  v8 = a4;
  if (a4)
  {
    v11 = sub_10010867C();
    v8 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v11);
  }
  if (a5)
  {
    v12 = sub_10010867C();
    a5 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v12);
  }
  if (a6)
  {
    v13 = sub_10010867C();
    a6 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a6, v13);
  }
  v14 = self;
  sub_100107000(a3, (uint64_t)v8, (uint64_t)a5, (uint64_t)a6);

  swift_bridgeObjectRelease(a6);
  swift_bridgeObjectRelease(a5);
  swift_bridgeObjectRelease(v8);
}

- (void)onlineStatusDidChange
{
  _TtC13InCallService22VisualVoicemailManager *v2;

  v2 = self;
  sub_100107578("%s observed voicemailsDidChange");

}

- (void)capabilitiesDidChange
{
  _TtC13InCallService22VisualVoicemailManager *v2;

  v2 = self;
  sub_100107578("%s observed capabilitiesDidChange");

}

- (void)subscriptionStateStatusDidChange
{
  _TtC13InCallService22VisualVoicemailManager *v2;

  v2 = self;
  sub_100107578("%s observed subscriptionStatusDidChange");

}

- (void)syncInProgresDidChange
{
  _TtC13InCallService22VisualVoicemailManager *v2;

  v2 = self;
  sub_100107578("%s observed syncInProgressDidChnage");

}

- (void)managerStorageUsageDidChange
{
  _TtC13InCallService22VisualVoicemailManager *v2;

  v2 = self;
  sub_100107578("%s observed manageStorageUsageDidChange");

}

- (void)transcribingStatusDidChange
{
  _TtC13InCallService22VisualVoicemailManager *v2;

  v2 = self;
  sub_100107578("%s observed transcribingStatusDidChange");

}

- (void)accountsDidChange
{
  _TtC13InCallService22VisualVoicemailManager *v2;

  v2 = self;
  sub_100107578("%s observed accountsDidChange");

}

- (void)deleteVoicemails:(id)a3
{
  sub_100107838(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100288480);
}

- (void)markVoicemailsAsRead:(id)a3
{
  sub_100107838(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100288458);
}

- (void)trashVoicemails:(id)a3
{
  sub_100107838(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100288430);
}

- (void)removeVoicemailsFromTrash:(id)a3
{
  sub_100107838(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100288408);
}

@end
