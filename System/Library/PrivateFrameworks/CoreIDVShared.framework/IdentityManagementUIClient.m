@implementation IdentityManagementUIClient

- (void)dealloc
{
  _TtC13CoreIDVShared26IdentityManagementUIClient *v2;

  v2 = self;
  IdentityManagementUIClient.__deallocating_deinit();
}

- (void).cxx_destruct
{
  void *v3;

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared26IdentityManagementUIClient_serverConnection));
  swift_release();
  swift_unknownObjectRelease();
  v3 = *(void **)&self->disconnectHandler[OBJC_IVAR____TtC13CoreIDVShared26IdentityManagementUIClient_remoteObjectProxyError];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)triggerAssetsUploadWithProofingOptions:(unint64_t)a3 canUploadOnExpensiveNetwork:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v9;

  v5 = a4;
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = self;
  sub_1CFA56F84(a3, v5, (uint64_t)v9, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)prepareForProofingDisplay:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 idType:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _TtC13CoreIDVShared29IdentityProofingConfiguration *v26;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v27;
  uint64_t v28;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v11, v12, v13, v14, v15, v16, v17, v18);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = _Block_copy(a6);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = a3;
  v22[3] = a4;
  v22[4] = a5;
  v22[5] = v21;
  v22[6] = self;
  v23 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v20, 1, 1, v23);
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_1EFBC3A78;
  v24[5] = v22;
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_1EFBC3A80;
  v25[5] = v24;
  v26 = a3;
  v27 = self;
  sub_1CFAA92B0((uint64_t)v20, (uint64_t)&unk_1EFBC3A88, (uint64_t)v25);
  swift_release();
}

- (void)prepareForProofingIdentity:(_TtC13CoreIDVShared25IdentityProofingDocuments *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _TtC13CoreIDVShared25IdentityProofingDocuments *v22;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v23;
  uint64_t v24;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v7, v8, v9, v10, v11, v12, v13, v14);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a4);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a3;
  v18[3] = v17;
  v18[4] = self;
  v19 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v16, 1, 1, v19);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1EFBC3A58;
  v20[5] = v18;
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1EFBC3A60;
  v21[5] = v20;
  v22 = a3;
  v23 = self;
  sub_1CFAA92B0((uint64_t)v16, (uint64_t)&unk_1EFBC3A68, (uint64_t)v21);
  swift_release();
}

- (void)provisionIdentityWithState:(NSString *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  NSString *v24;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v25;
  uint64_t v26;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a5);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  v21 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EFBC3A38;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EFBC3A40;
  v23[5] = v22;
  v24 = a3;
  v25 = self;
  sub_1CFAA92B0((uint64_t)v18, (uint64_t)&unk_1EFBC3A48, (uint64_t)v23);
  swift_release();
}

- (void)fetchImageQualitySettingsWithCompletion:(id)a3
{
  sub_1CFA53394(self, (int)a2, a3, (void (*)(void))sub_1CFA57398);
}

- (void)proofIdentity:(id)a3 :(unint64_t)a4 :(BOOL)a5 totalUploadAssetsFileSizeInBytes:(int64_t)a6 completion:(id)a7
{
  _BOOL4 v8;
  void *v12;
  id v13;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v14;

  v8 = a5;
  v12 = _Block_copy(a7);
  _Block_copy(v12);
  v13 = a3;
  v14 = self;
  sub_1CFA57798((uint64_t)v13, a4, v8, a6, (uint64_t)v14, (void (**)(_QWORD, _QWORD, _QWORD))v12);
  _Block_release(v12);
  _Block_release(v12);

}

- (void)proofIdentityUsing:(id)a3 proofingOptions:(unint64_t)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v11;

  v7 = _Block_copy(a5);
  v8 = sub_1CFB01A28();
  v10 = v9;
  _Block_copy(v7);
  v11 = self;
  sub_1CFA57BB8(v8, v10, a4, (uint64_t)v11, (void (**)(_QWORD, _QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)proofingFlowAvailabilityWithCompletionHandler:(id)a3
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
  _TtC13CoreIDVShared26IdentityManagementUIClient *v20;
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
  v18[4] = &unk_1EFBC3A18;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EFBC3A20;
  v19[5] = v18;
  v20 = self;
  sub_1CFAA92B0((uint64_t)v14, (uint64_t)&unk_1EFBC3A28, (uint64_t)v19);
  swift_release();
}

- (void)proofingStatusFor:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  NSString *v24;
  NSString *v25;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v26;
  uint64_t v27;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a5);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  v21 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EFBC39F8;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EFBC3A00;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  v26 = self;
  sub_1CFAA92B0((uint64_t)v18, (uint64_t)&unk_1EFBC3A08, (uint64_t)v23);
  swift_release();
}

- (void)isWatchPairedWithIdType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v22;
  uint64_t v23;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v7, v8, v9, v10, v11, v12, v13, v14);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a4);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a3;
  v18[3] = v17;
  v18[4] = self;
  v19 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v16, 1, 1, v19);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1EFBC39D8;
  v20[5] = v18;
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1EFBC39E0;
  v21[5] = v20;
  v22 = self;
  sub_1CFAA92B0((uint64_t)v16, (uint64_t)&unk_1EFBC39E8, (uint64_t)v21);
  swift_release();
}

- (void)proofingCancelledWithConfiguration:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _TtC13CoreIDVShared29IdentityProofingConfiguration *v24;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v25;
  uint64_t v26;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a5);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  v21 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EFBC39B8;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EFBC39C0;
  v23[5] = v22;
  v24 = a3;
  v25 = self;
  sub_1CFAA92B0((uint64_t)v18, (uint64_t)&unk_1EFBC39C8, (uint64_t)v23);
  swift_release();
}

- (void)setGlobalBoundACLWithData:(NSData *)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  NSData *v24;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v25;
  uint64_t v26;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a5);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  v21 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EFBC3998;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EFBC39A0;
  v23[5] = v22;
  v24 = a3;
  v25 = self;
  sub_1CFAA92B0((uint64_t)v18, (uint64_t)&unk_1EFBC39A8, (uint64_t)v23);
  swift_release();
}

- (void)setModifiedGlobalBoundACLWithData:(NSData *)a3 externalizedLAContext:(NSData *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  NSData *v24;
  NSData *v25;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v26;
  uint64_t v27;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a5);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  v21 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EFBC3978;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EFBC3980;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  v26 = self;
  sub_1CFAA92B0((uint64_t)v18, (uint64_t)&unk_1EFBC3988, (uint64_t)v23);
  swift_release();
}

- (void)retrieveBioBindingUnboundACLWithCompletionHandler:(id)a3
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
  _TtC13CoreIDVShared26IdentityManagementUIClient *v20;
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
  v18[4] = &unk_1EFBC3958;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EFBC3960;
  v19[5] = v18;
  v20 = self;
  sub_1CFAA92B0((uint64_t)v14, (uint64_t)&unk_1EFBC3968, (uint64_t)v19);
  swift_release();
}

- (void)retrievePasscodeBindingUnboundACLWithCompletionHandler:(id)a3
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
  _TtC13CoreIDVShared26IdentityManagementUIClient *v20;
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
  v18[4] = &unk_1EFBC3938;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EFBC3940;
  v19[5] = v18;
  v20 = self;
  sub_1CFAA92B0((uint64_t)v14, (uint64_t)&unk_1EFBC3948, (uint64_t)v19);
  swift_release();
}

- (void)retrieveBoundACLWithCompletionHandler:(id)a3
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
  _TtC13CoreIDVShared26IdentityManagementUIClient *v20;
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
  v18[4] = &unk_1EFBC3918;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EFBC3920;
  v19[5] = v18;
  v20 = self;
  sub_1CFAA92B0((uint64_t)v14, (uint64_t)&unk_1EFBC3928, (uint64_t)v19);
  swift_release();
}

- (void)deleteBoundACLWithCompletionHandler:(id)a3
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
  _TtC13CoreIDVShared26IdentityManagementUIClient *v20;
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
  v18[4] = &unk_1EFBC38F8;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EFBC3900;
  v19[5] = v18;
  v20 = self;
  sub_1CFAA92B0((uint64_t)v14, (uint64_t)&unk_1EFBC3908, (uint64_t)v19);
  swift_release();
}

- (void)fetchBioBindingDetailsWithCompletionHandler:(id)a3
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
  _TtC13CoreIDVShared26IdentityManagementUIClient *v20;
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
  v18[4] = &unk_1EFBC38D8;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EFBC38E0;
  v19[5] = v18;
  v20 = self;
  sub_1CFAA92B0((uint64_t)v14, (uint64_t)&unk_1EFBC38E8, (uint64_t)v19);
  swift_release();
}

- (void)fetchTermsAndConditionsWithCompletion:(id)a3
{
  sub_1CFA53394(self, (int)a2, a3, (void (*)(void))sub_1CFA57FD0);
}

- (void)uploadLivenessVideoWithLivenessVideoURL:(_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *)a3 shouldScheduleUploads:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *v24;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v25;
  uint64_t v26;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a5);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a3;
  *(_BYTE *)(v20 + 24) = a4;
  *(_QWORD *)(v20 + 32) = v19;
  *(_QWORD *)(v20 + 40) = self;
  v21 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EFBC38B8;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EFBC38C0;
  v23[5] = v22;
  v24 = a3;
  v25 = self;
  sub_1CFAA92B0((uint64_t)v18, (uint64_t)&unk_1EFBC38C8, (uint64_t)v23);
  swift_release();
}

- (void)getLivenessConfigWithCompletionHandler:(id)a3
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
  _TtC13CoreIDVShared26IdentityManagementUIClient *v20;
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
  v18[4] = &unk_1EFBC3898;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EFBC38A0;
  v19[5] = v18;
  v20 = self;
  sub_1CFAA92B0((uint64_t)v14, (uint64_t)&unk_1EFBC38A8, (uint64_t)v19);
  swift_release();
}

- (void)fetchExtendedReviewDisplayInfo:(_TtC13CoreIDVShared29IdentityProofingConfiguration *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _TtC13CoreIDVShared29IdentityProofingConfiguration *v24;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v25;
  uint64_t v26;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a5);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  v21 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EFBC3878;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EFBC3880;
  v23[5] = v22;
  v24 = a3;
  v25 = self;
  sub_1CFAA92B0((uint64_t)v18, (uint64_t)&unk_1EFBC3888, (uint64_t)v23);
  swift_release();
}

- (void)fetchBiomeFedStatsUIWithCompletion:(id)a3
{
  sub_1CFA53394(self, (int)a2, a3, (void (*)(void))sub_1CFA583D0);
}

- (void)saveIdentityProofingBiomeDataSharingUserConsent:(BOOL)a3 state:(NSString *)a4 proofingOptions:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  NSString *v26;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v27;
  uint64_t v28;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v11, v12, v13, v14, v15, v16, v17, v18);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = _Block_copy(a6);
  v22 = swift_allocObject();
  *(_BYTE *)(v22 + 16) = a3;
  *(_QWORD *)(v22 + 24) = a4;
  *(_QWORD *)(v22 + 32) = a5;
  *(_QWORD *)(v22 + 40) = v21;
  *(_QWORD *)(v22 + 48) = self;
  v23 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v20, 1, 1, v23);
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_1EFBC3858;
  v24[5] = v22;
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_1EFBC3860;
  v25[5] = v24;
  v26 = a4;
  v27 = self;
  sub_1CFAA92B0((uint64_t)v20, (uint64_t)&unk_1EFBC3868, (uint64_t)v25);
  swift_release();
}

- (void)clearDataAfterTerminalProofingStateWithState:(NSString *)a3 proofingOptions:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  NSString *v24;
  _TtC13CoreIDVShared26IdentityManagementUIClient *v25;
  uint64_t v26;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED905098);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a5);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = v19;
  v20[5] = self;
  v21 = sub_1CFB01DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1EFBC3838;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1EFBC3840;
  v23[5] = v22;
  v24 = a3;
  v25 = self;
  sub_1CFAA92B0((uint64_t)v18, (uint64_t)&unk_1EFBC3848, (uint64_t)v23);
  swift_release();
}

- (void)invalidate
{
  _TtC13CoreIDVShared26IdentityManagementUIClient *v2;

  v2 = self;
  sub_1CFA53CB8();

}

- (void)globalAuthACLTemplateUUIDsWithCompletionHandler:(id)a3
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
  _TtC13CoreIDVShared26IdentityManagementUIClient *v20;
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
  v18[4] = &unk_1EFBC3818;
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

- (_TtC13CoreIDVShared26IdentityManagementUIClient)init
{
  _TtC13CoreIDVShared26IdentityManagementUIClient *result;

  result = (_TtC13CoreIDVShared26IdentityManagementUIClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
