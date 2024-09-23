@implementation DataBiomeEvent

- (unsigned)dataVersion
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_dataVersion);
}

- (void)setDataVersion:(unsigned int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_dataVersion) = a3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  uint64_t *v11;
  objc_super v13;

  v5 = a3;
  v6 = sub_2408E5564();
  v8 = v7;

  v9 = (objc_class *)type metadata accessor for DataBiomeEvent();
  v10 = (char *)objc_allocWithZone(v9);
  *(_DWORD *)&v10[OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_dataVersion] = a4;
  v11 = (uint64_t *)&v10[OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_data];
  *v11 = v6;
  v11[1] = v8;
  v13.receiver = v10;
  v13.super_class = v9;
  return objc_msgSendSuper2(&v13, sel_init);
}

- (id)serialize
{
  uint64_t v2;
  unint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_data);
  v3 = *(_QWORD *)&self->dataVersion[OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_data];
  sub_240360070(v2, v3);
  v4 = (void *)sub_2408E554C();
  sub_240363D58(v2, v3);
  return v4;
}

- (_TtC23LighthouseDataProcessor14DataBiomeEvent)init
{
  _TtC23LighthouseDataProcessor14DataBiomeEvent *result;

  result = (_TtC23LighthouseDataProcessor14DataBiomeEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_240363D58(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_data), *(_QWORD *)&self->dataVersion[OBJC_IVAR____TtC23LighthouseDataProcessor14DataBiomeEvent_data]);
}

@end
