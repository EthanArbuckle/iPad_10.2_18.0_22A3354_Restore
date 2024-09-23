@implementation UtilityProgram

- (NSString)programID
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)programDescription
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)enrollmentStatus
{
  return (NSString *)sub_23EBABEB4();
}

- (_TtC19HomeUtilityServices14UtilityProgram)initWithProgramID:(id)a3 programDescription:(id)a4 enrollmentStatus:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  objc_super v18;

  v6 = sub_23EC2E780();
  v8 = v7;
  v9 = sub_23EC2E780();
  v11 = v10;
  v12 = sub_23EC2E780();
  v13 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices14UtilityProgram_programID);
  *v13 = v6;
  v13[1] = v8;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices14UtilityProgram_programDescription);
  *v14 = v9;
  v14[1] = v11;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices14UtilityProgram_enrollmentStatus);
  *v15 = v12;
  v15[1] = v16;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for UtilityProgram();
  return -[UtilityProgram init](&v18, sel_init);
}

- (_TtC19HomeUtilityServices14UtilityProgram)init
{
  _TtC19HomeUtilityServices14UtilityProgram *result;

  result = (_TtC19HomeUtilityServices14UtilityProgram *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
