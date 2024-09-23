@implementation FaceTimeVoicemailManager

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
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10007EC68, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10007EC90, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100091CA8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10007ECB8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100091CB0;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_100091CB8, (uint64_t)v14);
  swift_release(v16);
}

- (void)messageStoreDidAddMessages:(id)a3
{
  sub_1000441D8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))&type metadata accessor for Message, (uint64_t)&unk_10007EB78, (uint64_t)&unk_100091C00);
}

- (void)messageStoreDidUpdateMessages:(id)a3
{
  sub_1000441D8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))&type metadata accessor for Message, (uint64_t)&unk_10007EB50, (uint64_t)&unk_100091BF0);
}

- (void)messageStoreDidDeleteMessages:(id)a3
{
  sub_1000441D8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))&type metadata accessor for Message, (uint64_t)&unk_10007EB28, (uint64_t)&unk_100091BD8);
}

- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3
{
  sub_1000441D8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))&type metadata accessor for UUID, (uint64_t)&unk_10007EB00, (uint64_t)&unk_100091BC8);
}

- (void)messageStoreDidReconnect
{
  sub_100044860((uint64_t)self, (uint64_t)a2, (uint64_t)&unk_10007EAD8, (uint64_t)&unk_100091BB8);
}

- (void)messageStoreRequiresRefetch
{
  sub_100044860((uint64_t)self, (uint64_t)a2, (uint64_t)&unk_10007EAB0, (uint64_t)&unk_100091BA8);
}

- (BOOL)isTranscriptionEnabled
{
  return 1;
}

- (VMVoicemailManager)vmdVoiceMailManager
{
  return (VMVoicemailManager *)0;
}

- (void)requestInitialStateIfNecessaryAndSendNotifications:(BOOL)a3
{
  void (*v4)(uint64_t);
  uint64_t v5;

  if (a3)
  {
    v4 = *(void (**)(uint64_t))&self->super._TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged];
    v5 = swift_retain(self);
    v4(v5);
    swift_release(self);
  }
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
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10007EA10, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10007EA38, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100091B88;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10007EA60, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100091B90;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_100091B98, (uint64_t)v14);
  swift_release(v16);
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
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10007E998, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10007E9C0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100091B68;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10007E9E8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100091B70;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_100091B78, (uint64_t)v14);
  swift_release(v16);
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
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10007E920, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10007E948, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100091B48;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10007E970, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100091B50;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_100091B58, (uint64_t)v14);
  swift_release(v16);
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
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10007E8A8, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10007E8D0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100091B28;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10007E8F8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100091B30;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_100091B38, (uint64_t)v14);
  swift_release(v16);
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
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a3);
  v11 = _Block_copy(v4);
  v12 = (_QWORD *)swift_allocObject(&unk_10007E7E0, 40, 7);
  v12[2] = v10;
  v12[3] = v11;
  v12[4] = self;
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject(&unk_10007E808, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100091AF8;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject(&unk_10007E830, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100091600;
  v15[5] = v14;
  swift_retain(self);
  v16 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_100091760, (uint64_t)v15);
  swift_release(v16);
}

- (void)deleteVoicemails:(id)a3
{
  sub_100047FD8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_10007E790, (uint64_t)&unk_100091AE0);
}

- (void)markVoicemailsAsRead:(id)a3
{
  sub_100047FD8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_10007E768, (uint64_t)&unk_100091AC8);
}

- (void)trashVoicemails:(id)a3
{
  sub_100047FD8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_10007E740, (uint64_t)&unk_100091AB0);
}

- (void)removeVoicemailsFromTrash:(id)a3
{
  sub_100047FD8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_10007E718, (uint64_t)&unk_100091A88);
}

@end
