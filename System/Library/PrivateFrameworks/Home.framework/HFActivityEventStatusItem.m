@implementation HFActivityEventStatusItem

- (HFActivityLogCoordinator_Swift)activityLogCoordinator
{
  return (HFActivityLogCoordinator_Swift *)(id)swift_retain();
}

- (HFActivityEventStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5
{
  id v7;
  id v8;
  HFActivityEventStatusItem *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = (HFActivityEventStatusItem *)sub_1DD43B530(v7, (uint64_t)a4, (uint64_t)a5);

  swift_unknownObjectRelease();
  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v4;
  HFActivityEventStatusItem *v5;
  void *v6;

  if (a3)
    v4 = sub_1DD63E098();
  else
    v4 = 0;
  v5 = self;
  v6 = (void *)sub_1DD437104(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR___HFActivityEventStatusItem_midnightToday;
  v4 = sub_1DD63D768();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
