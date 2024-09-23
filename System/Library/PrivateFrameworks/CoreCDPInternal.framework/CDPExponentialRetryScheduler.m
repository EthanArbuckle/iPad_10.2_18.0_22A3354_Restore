@implementation CDPExponentialRetryScheduler

- (void)retryFetchEscrowRecord:(OTConfigurationContext *)a3 cdpContext:(CDPContext *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  OTConfigurationContext *v17;
  CDPContext *v18;
  _TtC15CoreCDPInternal28CDPExponentialRetryScheduler *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB9A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_20DB9F6C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2549DBBB8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2549DBBC0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_20DB8F2FC((uint64_t)v11, (uint64_t)&unk_2549DBBC8, (uint64_t)v16);
  swift_release();
}

- (void)retryFetchAllEscrowRecord:(OTConfigurationContext *)a3 cdpContext:(CDPContext *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  OTConfigurationContext *v17;
  CDPContext *v18;
  _TtC15CoreCDPInternal28CDPExponentialRetryScheduler *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB9A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_20DB9F6C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2549DBB90;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2549DBB98;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_20DB8F2FC((uint64_t)v11, (uint64_t)&unk_2549DBBA0, (uint64_t)v16);
  swift_release();
}

- (void)retryFetchAccountInfo:(SecureBackup *)a3 cdpContext:(CDPContext *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  SecureBackup *v17;
  CDPContext *v18;
  _TtC15CoreCDPInternal28CDPExponentialRetryScheduler *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB9A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_20DB9F6C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2549DBB70;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2549DBB78;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_20DB8F2FC((uint64_t)v11, (uint64_t)&unk_2549DBB80, (uint64_t)v16);
  swift_release();
}

- (void)retrySilentAuthWithAuthContext:(AKAppleIDAuthenticationContext *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  AKAppleIDAuthenticationContext *v15;
  _TtC15CoreCDPInternal28CDPExponentialRetryScheduler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB9A0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20DB9F6C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2549DBA68;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2549DB9B8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_20DB8F2FC((uint64_t)v9, (uint64_t)&unk_2549DB9C0, (uint64_t)v14);
  swift_release();
}

- (_TtC15CoreCDPInternal28CDPExponentialRetryScheduler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CDPExponentialRetryScheduler();
  return -[CDPExponentialRetryScheduler init](&v3, sel_init);
}

@end
