@implementation StringParams

- (BOOL)isEqual:(id)a3
{
  _TtC10FinanceKit12StringParams *v4;
  _TtC10FinanceKit12StringParams *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23361EC24();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = StringParams.isEqual(_:)((uint64_t)v8);

  sub_233168608((uint64_t)v8, &qword_254245020);
  return v6 & 1;
}

- (int64_t)hash
{
  uint64_t v3;
  _TtC10FinanceKit12StringParams *v4;
  int64_t v5;
  _OWORD v7[4];
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  sub_23361F3B0();
  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit12StringParams_value);
  v4 = self;
  swift_bridgeObjectRetain();
  sub_233195E88((uint64_t)v7, v3);
  swift_bridgeObjectRelease();
  v11 = v7[2];
  v12 = v7[3];
  v13 = v8;
  v9 = v7[0];
  v10 = v7[1];
  v5 = sub_23361F398();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC10FinanceKit12StringParams)initWithCoder:(id)a3
{
  return (_TtC10FinanceKit12StringParams *)StringParams.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC10FinanceKit12StringParams *v6;
  void *v7;
  id v8;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit12StringParams_value);
  v5 = a3;
  v6 = self;
  sub_233194C98(v4);
  sub_23319604C();
  sub_233167C58((unint64_t *)&qword_256042D98, (uint64_t (*)(uint64_t))sub_23319604C, MEMORY[0x24BEE5BD8]);
  v7 = (void *)sub_23361E054();
  swift_bridgeObjectRelease();
  v8 = (id)sub_23361E12C();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);

}

- (_TtC10FinanceKit12StringParams)init
{
  _TtC10FinanceKit12StringParams *result;

  result = (_TtC10FinanceKit12StringParams *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
