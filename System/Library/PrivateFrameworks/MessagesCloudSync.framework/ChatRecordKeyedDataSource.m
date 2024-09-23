@implementation ChatRecordKeyedDataSource

- (id)sourceRecordType
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v3 = type metadata accessor for ChatRecord(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2177B9074((uint64_t)self + OBJC_IVAR____TtC17MessagesCloudSync25ChatRecordKeyedDataSource_chatRecord, (uint64_t)v5);
  v6 = *((_QWORD *)v5 + 9);
  swift_bridgeObjectRetain();
  sub_2177B90B8((uint64_t)v5);
  if (!v6)
    return 0;
  v7 = (void *)sub_217847F74();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)sourceRecordName
{
  void *v2;

  if (*(_QWORD *)&self->chatRecord[OBJC_IVAR____TtC17MessagesCloudSync25ChatRecordKeyedDataSource_chatRecord + 48])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_217847F74();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)sourceRecordChangeTag
{
  void *v2;

  if (*(_QWORD *)&self->chatRecord[OBJC_IVAR____TtC17MessagesCloudSync25ChatRecordKeyedDataSource_chatRecord + 32])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_217847F74();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)stringForKey:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC17MessagesCloudSync25ChatRecordKeyedDataSource *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (a3)
  {
    v4 = sub_217847F98();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_2177CE5E4(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_217847F74();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)numberForKey:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC17MessagesCloudSync25ChatRecordKeyedDataSource *v7;
  void *v8;

  if (a3)
  {
    v4 = sub_217847F98();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = (void *)sub_2177CEB28(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)dictForKey:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC17MessagesCloudSync25ChatRecordKeyedDataSource *v7;
  unint64_t v8;
  void *v9;

  if (a3)
  {
    v4 = sub_217847F98();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = sub_2177CEFE4(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = (void *)sub_217847F20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)dataForKey:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC17MessagesCloudSync25ChatRecordKeyedDataSource *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  if (a3)
  {
    v4 = sub_217847F98();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = sub_2177CF370(v4, v6);
  v10 = v9;

  swift_bridgeObjectRelease();
  if (v10 >> 60 == 15)
  {
    v11 = 0;
  }
  else
  {
    v11 = (void *)sub_217847D94();
    sub_21776E454(v8, v10);
  }
  return v11;
}

- (id)arrayForKey:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC17MessagesCloudSync25ChatRecordKeyedDataSource *v7;
  uint64_t v8;
  void *v9;

  if (a3)
  {
    v4 = sub_217847F98();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = sub_2177CFA48(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = (void *)sub_2178480C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)assetURLForKey:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  _TtC17MessagesCloudSync25ChatRecordKeyedDataSource *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v5 = sub_21776B790((uint64_t *)&unk_253F25C80);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v8 = sub_217847F98();
    a3 = v9;
  }
  else
  {
    v8 = 0;
  }
  v10 = self;
  sub_2177CFE54(v8, (unint64_t)a3, (uint64_t)v7);

  swift_bridgeObjectRelease();
  v11 = sub_217847D64();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) != 1)
  {
    v13 = (void *)sub_217847CF8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);
  }
  return v13;
}

- (_TtC17MessagesCloudSync25ChatRecordKeyedDataSource)init
{
  _TtC17MessagesCloudSync25ChatRecordKeyedDataSource *result;

  result = (_TtC17MessagesCloudSync25ChatRecordKeyedDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2177B90B8((uint64_t)self + OBJC_IVAR____TtC17MessagesCloudSync25ChatRecordKeyedDataSource_chatRecord);
}

@end
