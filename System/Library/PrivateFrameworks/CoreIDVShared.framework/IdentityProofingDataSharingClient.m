@implementation IdentityProofingDataSharingClient

- (_TtC13CoreIDVShared33IdentityProofingDataSharingClient)init
{
  return (_TtC13CoreIDVShared33IdentityProofingDataSharingClient *)IdentityProofingDataSharingClient.init()();
}

- (void)fetchUserConsentWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _TtC13CoreIDVShared33IdentityProofingDataSharingClient *v20;
  uint64_t v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v5, v6, v7, v8, v9, v10, v11, v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a3);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = self;
  v17 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EFBC4A60;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EFBC4A68;
  v19[5] = v18;
  v20 = self;
  sub_1CFAA92B0((uint64_t)v14, (uint64_t)&unk_1EFBC4A70, (uint64_t)v19);
  swift_release();
}

- (void)didChangeUserConsent:(int64_t)a3 completion:(id)a4
{
  void *v6;
  _TtC13CoreIDVShared33IdentityProofingDataSharingClient *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_1CFAA9C18(a3, (char *)v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)checkUserConsentWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _TtC13CoreIDVShared33IdentityProofingDataSharingClient *v20;
  uint64_t v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v5, v6, v7, v8, v9, v10, v11, v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a3);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = self;
  v17 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EFBC4A30;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EFBC3820;
  v19[5] = v18;
  v20 = self;
  sub_1CFAA92B0((uint64_t)v14, (uint64_t)&unk_1EFBC3828, (uint64_t)v19);
  swift_release();
}

- (void).cxx_destruct
{
  void *v3;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared33IdentityProofingDataSharingClient_serverConnection));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  v3 = *(void **)&self->remoteObjectProxy[OBJC_IVAR____TtC13CoreIDVShared33IdentityProofingDataSharingClient_remoteObjectProxyError];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
