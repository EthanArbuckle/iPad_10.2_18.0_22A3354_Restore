@implementation HMAccessoryInfoFetchController

- (HMAccessoryInfoFetchController)init
{
  HMAccessoryInfoFetchController *result;

  result = (HMAccessoryInfoFetchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR___HMAccessoryInfoFetchController_log;
  v4 = sub_19B428FBC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___HMAccessoryInfoFetchController_homeUUID;
  v6 = sub_19B428F98();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_19B1E8498((uint64_t)self + OBJC_IVAR___HMAccessoryInfoFetchController_dataSource);

  swift_release();
}

@end
