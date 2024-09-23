@implementation HFDashboardStaticSectionListItem

- (NSString)uuidString
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DD63E11C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setUuidString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_1DD63E14C();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HFDashboardStaticSectionListItem_uuidString);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (HFDashboardStaticSectionListItem)initWithResults:(id)a3
{
  HFDashboardStaticSectionListItem *result;

  result = (HFDashboardStaticSectionListItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HFDashboardStaticSectionListItem)initWithResultsBlock:(id)a3
{
  void *v3;
  HFDashboardStaticSectionListItem *result;

  v3 = _Block_copy(a3);
  _Block_release(v3);
  result = (HFDashboardStaticSectionListItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
