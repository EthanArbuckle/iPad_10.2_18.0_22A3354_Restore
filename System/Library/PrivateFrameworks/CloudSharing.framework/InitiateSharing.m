@implementation InitiateSharing

- (void)callForSharingStatus:(id)a3 reply:(id)a4
{
  sub_1BD785DA4(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, void *))sub_1BD7883B0);
}

- (void)callForFileSharing:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 reply:(id)a9
{
  sub_1BD786FF4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, (void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, void *))sub_1BD788804);
}

- (void)callForCloudKitAddToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 reply:(id)aBlock
{
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _TtC12CloudSharing15InitiateSharing *v20;

  v15 = _Block_copy(aBlock);
  v16 = sub_1BD79115C();
  v17 = sub_1BD79115C();
  _Block_copy(v15);
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_1BD789324(v18, v19, v16, v17, a7, a8, a9, (void (**)(const void *, void *, _QWORD, void *))v15);
  _Block_release(v15);
  _Block_release(v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)callForSharingURLAddToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 accessType:(int64_t)a7 permissionType:(int64_t)a8 allowOthersToInvite:(BOOL)a9 reply:(id)a10
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _TtC12CloudSharing15InitiateSharing *v20;
  uint64_t v21;
  uint64_t v22;

  v21 = a7;
  v22 = a8;
  v12 = sub_1BD7910A8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a10);
  sub_1BD79109C();
  v17 = sub_1BD79115C();
  v18 = sub_1BD79115C();
  _Block_copy(v16);
  v19 = a4;
  v20 = self;
  sub_1BD789EC0((uint64_t)v15, v19, v17, v18, v21, v22, a9, v16);
  _Block_release(v16);
  _Block_release(v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)callForSharingURLRemoveShare:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5
{
  sub_1BD783180(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (void (*)(char *, void *, void *))sub_1BD78A9F0);
}

- (void)callForRemoveShare:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5
{
  sub_1BD78382C(self, (int)a2, a3, a4, a5, (void (*)(id, void *, void *))sub_1BD78AFA8);
}

- (void)callForFileURLRemoveShare:(id)a3 reply:(id)a4
{
  sub_1BD785DA4(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, void *))sub_1BD78B4D0);
}

- (void)callForMailContent:(id)a3 share:(id)a4 fileURL:(id)a5 appName:(id)a6 appIconData:(id)a7 reply:(id)a8
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _TtC12CloudSharing15InitiateSharing *v15;
  Class isa;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  NSObject *v24;
  id v25;
  _TtC12CloudSharing15InitiateSharing *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  Class v30;
  _TtC12CloudSharing15InitiateSharing *v31;

  v31 = self;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (_TtC12CloudSharing15InitiateSharing *)sub_1BD7910A8();
  isa = v15[-1].super.isa;
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a8);
  sub_1BD79109C();
  if (a5)
  {
    sub_1BD79109C();
    v20 = 0;
  }
  else
  {
    v20 = 1;
  }
  v30 = isa;
  (*((void (**)(char *, uint64_t, uint64_t, _TtC12CloudSharing15InitiateSharing *))isa + 7))(v14, v20, 1, v15);
  v21 = sub_1BD791120();
  v23 = v22;
  v24 = a4;
  v25 = a7;
  v26 = v31;
  v27 = sub_1BD7910CC();
  v31 = v15;
  v29 = v28;

  _Block_copy(v19);
  sub_1BD78B924((uint64_t)v18, v24, (uint64_t)v14, v21, v23, v27, v29, v19);
  _Block_release(v19);
  _Block_release(v19);
  sub_1BD788048(v27, v29);

  swift_bridgeObjectRelease();
  sub_1BD787F8C((uint64_t)v14);
  (*((void (**)(char *, _TtC12CloudSharing15InitiateSharing *))v30 + 1))(v18, v31);
}

- (void)callForMetadataFromShareURL:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5
{
  sub_1BD783180(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (void (*)(char *, void *, void *))sub_1BD78C3EC);
}

- (void)callForUpdateShare:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5
{
  sub_1BD78382C(self, (int)a2, a3, a4, a5, (void (*)(id, void *, void *))sub_1BD78C9A4);
}

- (void)callForCurrentUserSharingStatus:(id)a3 reply:(id)a4
{
  void *v6;
  id v7;
  _TtC12CloudSharing15InitiateSharing *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1BD78CFD0(v7, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)callForAddParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 reply:(id)a7
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _TtC12CloudSharing15InitiateSharing *v15;

  v10 = _Block_copy(a7);
  v11 = sub_1BD79115C();
  v12 = sub_1BD79115C();
  _Block_copy(v10);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1BD78D3A8(v13, v14, v11, v12, (void (**)(const void *, void *, _QWORD, void *))v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)callForAddParticipantsToShareWithURLWrapper:(id)a3 share:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 reply:(id)a9
{
  sub_1BD785828(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t)a6, a7, a8, a9, (void (*)(id, id, uint64_t, uint64_t, uint64_t, uint64_t, void *))sub_1BD78DC68);
}

- (void)callForAddParticipantsToShare:(id)a3 containerSetupInfo:(id)a4 emailAddresses:(id)a5 phoneNumbers:(id)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 reply:(id)a9
{
  sub_1BD785828(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t)a6, a7, a8, a9, (void (*)(id, id, uint64_t, uint64_t, uint64_t, uint64_t, void *))sub_1BD78E5C4);
}

- (void)callForExistingShareForFile:(id)a3 reply:(id)a4
{
  sub_1BD785DA4(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, void *))sub_1BD78F03C);
}

- (void)callForUserNameAndEmail:(id)a3 containerSetupInfo:(id)a4 reply:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC12CloudSharing15InitiateSharing *v16;
  uint64_t v17;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  if (a3)
  {
    sub_1BD79109C();
    v13 = sub_1BD7910A8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    v14 = sub_1BD7910A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  _Block_copy(v12);
  v15 = a4;
  v16 = self;
  sub_1BD78F590((uint64_t)v11, a4, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v12);
  _Block_release(v12);
  _Block_release(v12);

  sub_1BD787F8C((uint64_t)v11);
}

- (void)callForForciblyShareFolder:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 accessType:(int64_t)a6 permissionType:(int64_t)a7 allowOthersToInvite:(BOOL)a8 reply:(id)a9
{
  sub_1BD786FF4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, (void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, void *))sub_1BD78FBD8);
}

- (_TtC12CloudSharing15InitiateSharing)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InitiateSharing();
  return -[InitiateSharing init](&v3, sel_init);
}

@end
