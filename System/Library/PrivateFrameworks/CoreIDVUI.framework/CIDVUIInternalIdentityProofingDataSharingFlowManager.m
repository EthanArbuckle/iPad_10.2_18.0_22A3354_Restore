@implementation CIDVUIInternalIdentityProofingDataSharingFlowManager

- (_TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager)init
{
  id v3;
  _TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager *v4;
  id v5;
  uint64_t v6;
  objc_super v8;

  v3 = objc_allocWithZone((Class)sub_213FF8648());
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  type metadata accessor for IdentityProofingDataSharingFlowManager();
  v6 = swift_allocObject();
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager_dataSharingFlowManager) = (Class)sub_213FD7678((uint64_t)v5, v6);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for CIDVUIInternalIdentityProofingDataSharingFlowManager();
  return -[CIDVUIInternalIdentityProofingDataSharingFlowManager init](&v8, sel_init);
}

- (void)checkUserConsentWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_254D60310;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_254D60318;
  v12[5] = v11;
  v13 = self;
  sub_213FD7484((uint64_t)v7, (uint64_t)&unk_254D60320, (uint64_t)v12);
  swift_release();
}

- (void)fetchUserConsentWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_254D602E0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_254D5DC40;
  v12[5] = v11;
  v13 = self;
  sub_213FD7484((uint64_t)v7, (uint64_t)&unk_254D5DC48, (uint64_t)v12);
  swift_release();
}

- (void)didChangeUserConsent:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v8 = v7;
    v9 = self;
    v10 = sub_213FF8720();
    if ((v11 & 1) != 0)
      v12 = 1;
    else
      v12 = v10;
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = sub_213F4CE94;
    *(_QWORD *)(v13 + 24) = v8;
    swift_retain();
    sub_213F61DE8(v12, (uint64_t)sub_213FD7AD8, v13);

    swift_release();
    swift_release();
  }
}

- (void).cxx_destruct
{
  swift_release();
}

@end
