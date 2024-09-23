@implementation VisualVoicemailManager

- (BOOL)isTranscriptionEnabled
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager), "isTranscriptionEnabled");
}

- (VMVoicemailManager)vmdVoiceMailManager
{
  return (VMVoicemailManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager));
}

- (_TtC9IntentsUI22VisualVoicemailManager)initWithVisualVoicemailManager:(id)a3 onVoicemailsChanged:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject(&unk_10007E6F0, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  return (_TtC9IntentsUI22VisualVoicemailManager *)sub_100039CBC(a3, (uint64_t)sub_10003DBD0, v6);
}

- (void)fetchMessagesWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC9IntentsUI22VisualVoicemailManager *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10007E678, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10007E6A0, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100091828;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10007E6C8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100091830;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10004834C((uint64_t)v7, (uint64_t)&unk_100091838, (uint64_t)v12);
  swift_release(v14);
}

- (void)deleteVoicemails:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC9IntentsUI22VisualVoicemailManager *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10007E600, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10007E628, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100091808;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10007E650, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100091810;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_100091818, (uint64_t)v14);
  swift_release(v17);
}

- (void)markVoicemailsAsRead:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC9IntentsUI22VisualVoicemailManager *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10007E588, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10007E5B0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000917E8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10007E5D8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000917F0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_1000917F8, (uint64_t)v14);
  swift_release(v17);
}

- (void)trashVoicemails:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC9IntentsUI22VisualVoicemailManager *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10007E510, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10007E538, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000917C8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10007E560, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000917D0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_1000917D8, (uint64_t)v14);
  swift_release(v17);
}

- (void)removeVoicemailsFromTrash:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC9IntentsUI22VisualVoicemailManager *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10007E498, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10007E4C0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000917A8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10007E4E8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000917B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_1000917B8, (uint64_t)v14);
  swift_release(v17);
}

- (void)voicemailWithIdentifier:(MPMessageID *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  MPMessageID *v15;
  _TtC9IntentsUI22VisualVoicemailManager *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10007E420, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10007E448, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100091778;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10007E470, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100091780;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_100091788, (uint64_t)v14);
  swift_release(v17);
}

- (void)messagesPassingTest:(id)a3 completion:
{
  const void *v3;
  const void *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _TtC9IntentsUI22VisualVoicemailManager *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a3);
  v11 = _Block_copy(v4);
  v12 = (_QWORD *)swift_allocObject(&unk_10007E330, 40, 7);
  v12[2] = v10;
  v12[3] = v11;
  v12[4] = self;
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject(&unk_10007E358, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100091750;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject(&unk_10007E380, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100091600;
  v15[5] = v14;
  v16 = self;
  v17 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_100091760, (uint64_t)v15);
  swift_release(v17);
}

- (_TtC9IntentsUI22VisualVoicemailManager)init
{
  _TtC9IntentsUI22VisualVoicemailManager *result;

  result = (_TtC9IntentsUI22VisualVoicemailManager *)_swift_stdlib_reportUnimplementedInitializer("IntentsUI.VisualVoicemailManager", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager));
  swift_release(*(_QWORD *)&self->visualVoicemailManager[OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_onVoicemailsChanged]);
}

- (void)handleVoiceMailsChangedNotificationWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC9IntentsUI22VisualVoicemailManager *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10003C56C((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)voicemailsDidChangeInitial:(BOOL)a3 added:(id)a4 deleted:(id)a5 updated:(id)a6
{
  id v8;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _TtC9IntentsUI22VisualVoicemailManager *v14;

  v8 = a4;
  if (a4)
  {
    v11 = sub_10003D530();
    v8 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v11);
  }
  if (a5)
  {
    v12 = sub_10003D530();
    a5 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v12);
  }
  if (a6)
  {
    v13 = sub_10003D530();
    a6 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a6, v13);
  }
  v14 = self;
  sub_10003C880(a3, (uint64_t)v8, (uint64_t)a5, (uint64_t)a6);

  swift_bridgeObjectRelease(a6);
  swift_bridgeObjectRelease(a5);
  swift_bridgeObjectRelease(v8);
}

- (void)onlineStatusDidChange
{
  _TtC9IntentsUI22VisualVoicemailManager *v2;

  v2 = self;
  sub_10003CE78("%s observed voicemailsDidChange", (uint64_t)v2);

}

- (void)capabilitiesDidChange
{
  _TtC9IntentsUI22VisualVoicemailManager *v2;

  v2 = self;
  sub_10003CE78("%s observed capabilitiesDidChange", (uint64_t)v2);

}

- (void)subscriptionStateStatusDidChange
{
  _TtC9IntentsUI22VisualVoicemailManager *v2;

  v2 = self;
  sub_10003CE78("%s observed subscriptionStatusDidChange", (uint64_t)v2);

}

- (void)syncInProgresDidChange
{
  _TtC9IntentsUI22VisualVoicemailManager *v2;

  v2 = self;
  sub_10003CE78("%s observed syncInProgressDidChnage", (uint64_t)v2);

}

- (void)managerStorageUsageDidChange
{
  _TtC9IntentsUI22VisualVoicemailManager *v2;

  v2 = self;
  sub_10003CE78("%s observed manageStorageUsageDidChange", (uint64_t)v2);

}

- (void)transcribingStatusDidChange
{
  _TtC9IntentsUI22VisualVoicemailManager *v2;

  v2 = self;
  sub_10003CE78("%s observed transcribingStatusDidChange", (uint64_t)v2);

}

- (void)accountsDidChange
{
  _TtC9IntentsUI22VisualVoicemailManager *v2;

  v2 = self;
  sub_10003CE78("%s observed accountsDidChange", (uint64_t)v2);

}

- (void)deleteVoicemails:(id)a3
{
  sub_10003D268(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_10007E308, (uint64_t)&unk_100091738);
}

- (void)markVoicemailsAsRead:(id)a3
{
  sub_10003D268(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_10007E2E0, (uint64_t)&unk_100091720);
}

- (void)trashVoicemails:(id)a3
{
  sub_10003D268(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_10007E2B8, (uint64_t)&unk_100091708);
}

- (void)removeVoicemailsFromTrash:(id)a3
{
  sub_10003D268(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_10007E290, (uint64_t)&unk_1000916E8);
}

- (void)requestInitialStateIfNecessaryAndSendNotifications:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _TtC9IntentsUI22VisualVoicemailManager *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor(0);
  v9 = self;
  v10 = static MainActor.shared.getter(v9);
  v11 = swift_allocObject(&unk_10007EF38, 41, 7);
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = &protocol witness table for MainActor;
  *(_QWORD *)(v11 + 32) = v9;
  *(_BYTE *)(v11 + 40) = a3;
  v12 = sub_100051774((uint64_t)v7, (uint64_t)&unk_100092168, v11);

  swift_release(v12);
}

@end
