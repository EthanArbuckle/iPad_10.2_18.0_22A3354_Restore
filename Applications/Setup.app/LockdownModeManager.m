@implementation LockdownModeManager

- (int64_t)deviceState
{
  return sub_100029FB8(self, (uint64_t)a2, (uint64_t (*)(void))&LockdownModeManager.enabled.getter);
}

- (int64_t)accountState
{
  return sub_100029FB8(self, (uint64_t)a2, (uint64_t (*)(void))&LockdownModeManager.enabledInAccount.getter);
}

- (BOOL)hasStagedEnablement
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Setup19LockdownModeManager_hasStagedEnablement);
}

- (void)setHasStagedEnablement:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Setup19LockdownModeManager_hasStagedEnablement) = a3;
}

- (void)fetchAccountStateWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC5Setup19LockdownModeManager *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1002801C8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1002801F0, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002EAEF0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100280218, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002EAEF8;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10002F124((uint64_t)v7, (uint64_t)&unk_1002EAF00, (uint64_t)v12);
  swift_release(v14);
}

- (void)enableWithStrategy:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC5Setup19LockdownModeManager *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100280150, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100280178, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1002EAED0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1002801A0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1002EAED8;
  v14[5] = v13;
  v15 = self;
  v16 = sub_10002F124((uint64_t)v9, (uint64_t)&unk_1002EAEE0, (uint64_t)v14);
  swift_release(v16);
}

- (void)acknowledgeWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC5Setup19LockdownModeManager *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10000A9E4(&qword_1002EA790);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1002800D8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100280100, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002EAEC0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100280128, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002EB100;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10002F124((uint64_t)v7, (uint64_t)&unk_1002EA860, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC5Setup19LockdownModeManager)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup19LockdownModeManager____lazy_storage___manager) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Setup19LockdownModeManager_hasStagedEnablement) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LockdownModeManager();
  return -[LockdownModeManager init](&v3, "init");
}

- (void).cxx_destruct
{

}

@end
