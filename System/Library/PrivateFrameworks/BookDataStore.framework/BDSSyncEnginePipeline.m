@implementation BDSSyncEnginePipeline

- (_TtC13BookDataStore21BDSSyncEnginePipeline)initWithRecordType:(id)a3 zoneName:(id)a4 delegate:(id)a5
{
  void *v7;
  void *v8;
  _TtC13BookDataStore21BDSSyncEnginePipeline *v9;

  sub_227E5FF84();
  sub_227E5FF84();
  swift_unknownObjectRetain();
  v7 = (void *)sub_227E5FF78();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_227E5FF78();
  swift_bridgeObjectRelease();
  v9 = -[BDSSyncEnginePipeline initWithRecordType:zoneName:delegate:dataMapper:](self, sel_initWithRecordType_zoneName_delegate_dataMapper_, v7, v8, a5, 0);

  swift_unknownObjectRelease();
  return v9;
}

- (_TtC13BookDataStore21BDSSyncEnginePipeline)initWithRecordType:(id)a3 zoneName:(id)a4 delegate:(id)a5 dataMapper:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;

  v8 = sub_227E5FF84();
  v10 = v9;
  v11 = sub_227E5FF84();
  v13 = v12;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC13BookDataStore21BDSSyncEnginePipeline *)sub_227E4AC44(v8, v10, v11, v13, (uint64_t)a5, (uint64_t)a6);
}

- (void)saltUpdatedWithSaltVersionIdentifier:(id)a3
{
  _TtC13BookDataStore21BDSSyncEnginePipeline *v3;

  v3 = self;
  sub_227E4D414();

}

- (void)signalSyncToCK
{
  _TtC13BookDataStore21BDSSyncEnginePipeline *v2;

  v2 = self;
  sub_227E4D414();

}

- (void)startSyncToCKWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _TtC13BookDataStore21BDSSyncEnginePipeline *v14;
  uint64_t v15;

  v5 = sub_227D68330(&qword_255929530);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = sub_227E60128();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25592A418;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25592A420;
  v13[5] = v12;
  v14 = self;
  sub_227E54F9C((uint64_t)v8, (uint64_t)&unk_25592A428, (uint64_t)v13);
  swift_release();
}

- (void)fetchRecordForRecordID:(CKRecordID *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  CKRecordID *v16;
  _TtC13BookDataStore21BDSSyncEnginePipeline *v17;
  uint64_t v18;

  v7 = sub_227D68330(&qword_255929530);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = sub_227E60128();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25592A3D8;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2559289E0;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_227E54F9C((uint64_t)v10, (uint64_t)&unk_2559289E8, (uint64_t)v15);
  swift_release();
}

- (id)privacyDelegate
{
  uint64_t v2;
  _TtC13BookDataStore21BDSSyncEnginePipeline *v3;
  id v4;

  v2 = qword_253F39928;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (id)qword_253F39920;

  return v4;
}

- (_TtC13BookDataStore21BDSSyncEnginePipeline)init
{
  _TtC13BookDataStore21BDSSyncEnginePipeline *result;

  result = (_TtC13BookDataStore21BDSSyncEnginePipeline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC13BookDataStore21BDSSyncEnginePipeline_logger;
  v4 = sub_227E5F588();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13BookDataStore21BDSSyncEnginePipeline_scheduleSyncBlock));
}

@end
