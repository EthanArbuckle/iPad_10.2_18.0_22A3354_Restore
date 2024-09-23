@implementation SingleValueDataTransformer

- (id)chartPointFor:(id)a3 in:(id)a4 with:(int64_t)a5 dataSourceType:(int64_t)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  swift_retain();
  v11 = sub_1BC3B39F8(v9, v10, a5, a6);

  swift_release();
  return v11;
}

- (id)graphSeriesWith:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  swift_retain();
  v4 = (void *)sub_1BC3B3690(v3);

  swift_release();
  return v4;
}

- (id)chartDisplayTypeWith:(id)a3 displayName:(id)a4 unitName:(id)a5
{
  id v6;
  id v7;

  sub_1BC62C680();
  sub_1BC62C680();
  v6 = a3;
  swift_retain();
  v7 = sub_1BC3B3C84(v6);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

@end
