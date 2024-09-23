@implementation DockCoreInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_type);
}

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_23A690E04();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSUUID)identifier
{
  return (NSUUID *)(id)sub_23A6906FC();
}

- (NSString)description
{
  return (NSString *)sub_23A5C0220(self, (uint64_t)a2, (void (*)(void))DockCoreInfo.description.getter);
}

- (_TtC11DockKitCore12DockCoreInfo)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  _TtC11DockKitCore12DockCoreInfo *v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = sub_23A69072C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_type) = (Class)2;
  v8 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_name);
  *v8 = 0;
  v8[1] = 0xE000000000000000;
  v9 = self;
  sub_23A690720();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v9 + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_identifier, v7, v4);

  v11.receiver = v9;
  v11.super_class = ObjectType;
  return -[DockCoreInfo init](&v11, sel_init);
}

- (_TtC11DockKitCore12DockCoreInfo)initWithType:(int64_t)a3 name:(id)a4 identifier:(id)a5
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  _TtC11DockKitCore12DockCoreInfo *v16;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = sub_23A69072C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A690E1C();
  v14 = v13;
  sub_23A690714();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_type) = (Class)a3;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_name);
  *v15 = v12;
  v15[1] = v14;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)self + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_identifier, v11, v8);
  v18.receiver = self;
  v18.super_class = ObjectType;
  v16 = -[DockCoreInfo init](&v18, sel_init);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v16;
}

- (_TtC11DockKitCore12DockCoreInfo)initWithUuidString:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)sub_23A690E1C();
  return (_TtC11DockKitCore12DockCoreInfo *)DockCoreInfo.init(uuidString:)(v3, v4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC11DockKitCore12DockCoreInfo *v5;

  v4 = a3;
  v5 = self;
  DockCoreInfo.encode(with:)((NSCoder)v4);

}

- (_TtC11DockKitCore12DockCoreInfo)initWithCoder:(id)a3
{
  id v3;
  _TtC11DockKitCore12DockCoreInfo *v4;

  v3 = a3;
  v4 = (_TtC11DockKitCore12DockCoreInfo *)sub_23A5C8E64();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return sub_23A5C58DC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DockCoreInfo.isEqual(_:));
}

- (int64_t)hash
{
  _TtC11DockKitCore12DockCoreInfo *v3;
  int64_t v4;

  sub_23A691608();
  sub_23A6915CC();
  sub_23A69072C();
  sub_23A5CFF58(&qword_25699E030, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v3 = self;
  sub_23A690DE0();
  v4 = sub_23A6915F0();

  return v4;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore12DockCoreInfo_identifier;
  v4 = sub_23A69072C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
