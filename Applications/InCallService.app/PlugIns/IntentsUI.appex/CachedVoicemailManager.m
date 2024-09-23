@implementation CachedVoicemailManager

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
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10007E218, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10007E240, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100091610;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10007E268, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100091618;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_10004834C((uint64_t)v7, (uint64_t)&unk_100091620, (uint64_t)v12);
  swift_release(v13);
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
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100031408(&qword_100091120);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10007E1A0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10007E1C8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000915F8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10007E1F0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100091600;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_10004834C((uint64_t)v9, (uint64_t)&unk_100091760, (uint64_t)v14);
  swift_release(v16);
}

@end
