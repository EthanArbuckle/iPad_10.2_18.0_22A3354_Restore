@implementation BloodPressureDataTransformer

- (id)chartPointFor:(id)a3 in:(id)a4 with:(int64_t)a5 dataSourceType:(int64_t)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a4;
  swift_retain();
  v10 = sub_1BC58FF28(v8, v9, a5);

  swift_release();
  return v10;
}

- (id)graphSeriesWith:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  swift_retain();
  v4 = objc_msgSend(v3, sel_keyColor);
  if (!v4)
    v4 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
  type metadata accessor for BloodPressureChartSeries();
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_defaultSeriesWithDiastolicColor_, v4);

  swift_release();
  return v5;
}

- (id)chartDisplayTypeWith:(id)a3 displayName:(id)a4 unitName:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  swift_retain();
  sub_1BC58E8CC();
  v7 = v6;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D2F768]), sel_init);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D2F770]), sel_initWithGraphSeries_baseDisplayType_valueFormatter_dataTypeCode_, v5, v7, v8, 80);
  swift_release();

  return v9;
}

@end
