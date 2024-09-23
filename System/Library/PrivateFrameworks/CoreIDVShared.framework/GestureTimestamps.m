@implementation GestureTimestamps

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared17GestureTimestamps)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared17GestureTimestamps *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared17GestureTimestamps *)sub_1CFA244C0();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared17GestureTimestamps *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1CFB01C8C();
  v7 = (id)sub_1CFB01A04();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

}

- (NSString)debugDescription
{
  uint64_t v2;
  _TtC13CoreIDVShared17GestureTimestamps *v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared17GestureTimestamps_timestamps);
  v3 = self;
  MEMORY[0x1D17D8A4C](v2, MEMORY[0x1E0DEE190]);

  v4 = (void *)sub_1CFB01A04();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC13CoreIDVShared17GestureTimestamps)init
{
  _TtC13CoreIDVShared17GestureTimestamps *result;

  result = (_TtC13CoreIDVShared17GestureTimestamps *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
