@implementation _SwiftDriverApprovalState

- (NSString)displayName
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____SwiftDriverApprovalState_driver;
  if (!*(_QWORD *)&v2[*(int *)(type metadata accessor for DriverKitDriver() + 24) + 8])
    swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_23A73BD48();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)usageText
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____SwiftDriverApprovalState_driver;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for DriverKitDriver() + 28) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_23A73BD48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)updatePending
{
  _SwiftDriverApprovalState *v3;
  uint64_t v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_23A73BCD0();
  swift_release();
  swift_release();

  if (v5)
    swift_release();
  return v5 != 0;
}

- (BOOL)driverIsApproved
{
  _SwiftDriverApprovalState *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = DriverApprovalState.driverIsApproved()();

  return v3;
}

- (id)bundleIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_23A73BD48();
  swift_bridgeObjectRelease();
  return v2;
}

- (_SwiftDriverApprovalState)init
{
  _SwiftDriverApprovalState *result;

  result = (_SwiftDriverApprovalState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_23A73B110((uint64_t)self + OBJC_IVAR____SwiftDriverApprovalState_driver);
  v3 = (char *)self + OBJC_IVAR____SwiftDriverApprovalState__approvalState;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4840);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____SwiftDriverApprovalState__updateStatus;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B4850);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
