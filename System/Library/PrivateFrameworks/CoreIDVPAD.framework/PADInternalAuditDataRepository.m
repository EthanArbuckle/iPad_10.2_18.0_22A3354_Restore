@implementation PADInternalAuditDataRepository

- (void)storeClassifierResult:(id)a3 imageData:(id)a4
{
  id v7;
  _TtC10CoreIDVPAD30PADInternalAuditDataRepository *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  _TtC10CoreIDVPAD30PADInternalAuditDataRepository *v14;
  __int128 v15[15];
  uint64_t v16;
  _OWORD v17[15];
  uint64_t v18;

  if (a4)
  {
    v7 = a3;
    v8 = self;
    v9 = a4;
    v10 = sub_213C12528();
    v12 = v11;

  }
  else
  {
    v13 = a3;
    v14 = self;
    v10 = 0;
    v12 = 0xF000000000000000;
  }
  sub_213BF7BF0((uint64_t)v17);
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder))
  {
    v15[12] = v17[12];
    v15[13] = v17[13];
    v15[14] = v17[14];
    v16 = v18;
    v15[8] = v17[8];
    v15[9] = v17[9];
    v15[10] = v17[10];
    v15[11] = v17[11];
    v15[4] = v17[4];
    v15[5] = v17[5];
    v15[6] = v17[6];
    v15[7] = v17[7];
    v15[0] = v17[0];
    v15[1] = v17[1];
    v15[2] = v17[2];
    v15[3] = v17[3];
    sub_213BE4D58(v15, v10, v12);
  }
  sub_213BDF2F8((uint64_t)v17);
  sub_213BEC3C4(v10, v12);

}

- (void)storeUnencryptedVideoFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10CoreIDVPAD30PADInternalAuditDataRepository *v8;
  uint64_t v9;

  v4 = sub_213C124F8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213C124D4();
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder))
  {
    v8 = self;
    sub_213BE8668();

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)storePRDBuffer:(__CVBuffer *)a3 name:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __CVBuffer *v10;
  _TtC10CoreIDVPAD30PADInternalAuditDataRepository *v11;

  v6 = sub_213C1260C();
  v8 = v7;
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder))
  {
    v9 = (char *)v6;
    v10 = a3;
    v11 = self;
    sub_213BE8AD8((uint64_t)v10, v9, v8);

  }
  swift_bridgeObjectRelease();
}

- (void)storeFACPoseBuffer:(__CVBuffer *)a3 identifier:(id)a4 values:(id)a5
{
  uint64_t v8;
  char *v9;
  char *v10;
  __CVBuffer *v11;
  id v12;
  _TtC10CoreIDVPAD30PADInternalAuditDataRepository *v13;

  v8 = sub_213C1260C();
  v10 = v9;
  v11 = a3;
  v12 = a5;
  v13 = self;
  sub_213BF9390((uint64_t)v11, v8, v10, v12);

  swift_bridgeObjectRelease();
}

- (void)storeTAValues:(id)a3
{
  id v4;
  _TtC10CoreIDVPAD30PADInternalAuditDataRepository *v5;

  v4 = a3;
  v5 = self;
  sub_213BF95CC(v4);

}

- (_TtC10CoreIDVPAD30PADInternalAuditDataRepository)init
{
  uint64_t v2;
  uint64_t v3;
  _TtC10CoreIDVPAD30PADInternalAuditDataRepository *v4;
  objc_super v6;

  v2 = OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder;
  v3 = qword_254D27958;
  v4 = self;
  if (v3 != -1)
    swift_once();
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_254D27CD8;
  swift_retain();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PADInternalAuditDataRepository();
  return -[PADInternalAuditDataRepository init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
