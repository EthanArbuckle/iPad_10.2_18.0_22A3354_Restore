@implementation FAFamilyFetchActivityScheduler

- (FAFamilyFetchActivityScheduler)initWithFamilyCircleFetchBlock:(id)a3 cacheLoadBlock:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  FAFamilyFetchActivityScheduler *v9;

  v5 = _Block_copy(a3);
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  v9 = (FAFamilyFetchActivityScheduler *)sub_1CAF0100C((uint64_t)sub_1CAF0129C, v7, (uint64_t)sub_1CAF012E8, v8);
  swift_release();
  swift_release();
  return v9;
}

- (void)reschedule
{
  FAFamilyFetchActivityScheduler *v2;

  v2 = self;
  FAFamilyFetchActivityScheduler.reschedule()();

}

- (FAFamilyFetchActivityScheduler)init
{
  FAFamilyFetchActivityScheduler *result;

  result = (FAFamilyFetchActivityScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1CAEF5168((uint64_t)self + OBJC_IVAR___FAFamilyFetchActivityScheduler____lazy_storage___scheduler, &qword_1EF98FC60);
  swift_release();
  swift_release();
}

@end
