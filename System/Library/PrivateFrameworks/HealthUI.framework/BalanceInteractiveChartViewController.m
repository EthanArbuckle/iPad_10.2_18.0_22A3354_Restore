@implementation BalanceInteractiveChartViewController

- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  _TtC8HealthUI37BalanceInteractiveChartViewController *v8;
  void *v9;
  HKGraphViewController *v10;
  HKGraphView *v11;
  objc_super v12;

  sub_1D7AAF6EC(0, &qword_1F014D670);
  sub_1D7B4A4AC();
  v8 = self;
  v9 = (void *)sub_1D7B4A4A0();
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for BalanceInteractiveChartViewController();
  -[HKInteractiveChartOverlayViewController configureDisplayTypes:timeScope:stackOffset:](&v12, sel_configureDisplayTypes_timeScope_stackOffset_, v9, a4, a5);

  v10 = -[HKInteractiveChartViewController primaryGraphViewController](v8, sel_primaryGraphViewController);
  v11 = -[HKGraphViewController graphView](v10, sel_graphView);

  -[HKGraphView setScrollingOptions:](v11, sel_setScrollingOptions_, 1);
  swift_bridgeObjectRelease();

}

- (id)makePrimaryGraphViewControllerWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _TtC8HealthUI37BalanceInteractiveChartViewController *v14;
  id v15;
  uint64_t v17;

  v10 = sub_1D7B49300();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7B492C4();
  v14 = self;
  v15 = sub_1D7AB8658(a3, a4, (uint64_t)v13, a5);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v15;
}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  int64_t v6;
  id v7;
  _TtC8HealthUI37BalanceInteractiveChartViewController *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  if (a4 == 6)
    v6 = 5;
  else
    v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for BalanceInteractiveChartViewController();
  v7 = a3;
  v8 = self;
  v9 = -[HKInteractiveChartViewController stringForValueRange:timeScope:](&v13, sel_stringForValueRange_timeScope_, v7, v6);
  if (v9)
  {
    v10 = v9;
    sub_1D7B4A3BC();

    v11 = (void *)sub_1D7B4A38C();
    swift_bridgeObjectRelease();
    return v11;
  }
  else
  {

    return 0;
  }
}

- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6
{
  id v10;
  _TtC8HealthUI37BalanceInteractiveChartViewController *v11;
  HKInteractiveChartAnnotationViewDataSourceProtocol *v12;
  uint64_t v13;
  void *v14;
  HKHealthStore *v15;
  id v16;

  v10 = a3;
  v16 = a4;
  v11 = self;
  v12 = -[HKInteractiveChartViewController annotationDataSource](v11, sel_annotationDataSource);
  objc_opt_self();
  v13 = swift_dynamicCastObjCClass();
  if (v13)
  {
    v14 = (void *)v13;
    if (a5 == 6)
      a5 = 5;
    v15 = -[HKInteractiveChartViewController healthStore](v11, sel_healthStore);
    objc_msgSend(v14, sel_updateWithSelectionContext_displayType_timeScope_resolution_healthStore_viewController_, v10, v16, a5, a6, v15, v11);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }

}

- (_TtC8HealthUI37BalanceInteractiveChartViewController)initWithHealthStore:(id)a3 primaryDisplayType:(id)a4 unitPreferenceController:(id)a5 dateCache:(id)a6 chartDataCacheController:(id)a7 selectedTimeScopeController:(id)a8 sampleTypeDateRangeController:(id)a9 initialXValue:(id)a10 currentCalendarOverride:(id)a11 options:(unint64_t)a12
{
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _TtC8HealthUI37BalanceInteractiveChartViewController *v35;
  id v37[2];

  v37[0] = a9;
  v37[1] = self;
  sub_1D7AAE0AC(0, &qword_1F014D660, (void (*)(uint64_t))MEMORY[0x1E0CB11F0]);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)v37 - v19;
  sub_1D7AAE0AC(0, (unint64_t *)&qword_1F014D000, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)v37 - v22;
  if (a10)
  {
    sub_1D7B49168();
    v24 = sub_1D7B49198();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v23, 0, 1, v24);
  }
  else
  {
    v25 = sub_1D7B49198();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v23, 1, 1, v25);
  }
  if (a11)
  {
    sub_1D7B492C4();
    v26 = sub_1D7B49300();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v20, 0, 1, v26);
  }
  else
  {
    v27 = sub_1D7B49300();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v20, 1, 1, v27);
  }
  v28 = a3;
  v29 = a4;
  v30 = a5;
  v31 = a6;
  v32 = a7;
  v33 = a8;
  v34 = v37[0];
  v35 = (_TtC8HealthUI37BalanceInteractiveChartViewController *)sub_1D7AB93C0((uint64_t)v28, (uint64_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34, (uint64_t)v23, (uint64_t)v20, a12);

  return v35;
}

- (_TtC8HealthUI37BalanceInteractiveChartViewController)initWithTimeScopeRanges:(id)a3 healthStore:(id)a4 primaryDisplayType:(id)a5 unitPreferenceController:(id)a6 dateCache:(id)a7 chartDataCacheController:(id)a8 selectedTimeScopeController:(id)a9 sampleTypeDateRangeController:(id)a10 initialXValue:(id)a11 currentCalendarOverride:(id)a12 options:(unint64_t)a13
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _TtC8HealthUI37BalanceInteractiveChartViewController *v33;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _TtC8HealthUI37BalanceInteractiveChartViewController *v40;

  v40 = self;
  v38 = a8;
  v39 = a10;
  v36 = a7;
  v37 = a9;
  sub_1D7AAE0AC(0, &qword_1F014D660, (void (*)(uint64_t))MEMORY[0x1E0CB11F0]);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v35 - v17;
  sub_1D7AAE0AC(0, (unint64_t *)&qword_1F014D000, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v35 - v20;
  sub_1D7AAF6EC(0, (unint64_t *)&qword_1F014D240);
  sub_1D7AAF6EC(0, &qword_1F014D678);
  sub_1D7AAF724();
  v35 = sub_1D7B4A23C();
  if (a11)
  {
    sub_1D7B49168();
    v22 = sub_1D7B49198();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 0, 1, v22);
  }
  else
  {
    v23 = sub_1D7B49198();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v21, 1, 1, v23);
  }
  if (a12)
  {
    sub_1D7B492C4();
    v24 = sub_1D7B49300();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v18, 0, 1, v24);
  }
  else
  {
    v25 = sub_1D7B49300();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v18, 1, 1, v25);
  }
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v29 = v36;
  v30 = v38;
  v31 = v37;
  v32 = v39;
  v33 = (_TtC8HealthUI37BalanceInteractiveChartViewController *)sub_1D7AB95EC(v35, (uint64_t)v26, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, (uint64_t)v21, (uint64_t)v18, a13);

  return v33;
}

- (_TtC8HealthUI37BalanceInteractiveChartViewController)initWithStackedDisplayTypes:(id)a3 primaryDisplayTypeStackIndex:(id)a4 stackedDisplayTypeHeights:(id)a5 healthStore:(id)a6 unitPreferenceController:(id)a7 dateCache:(id)a8 chartDataCacheController:(id)a9 selectedTimeScopeController:(id)a10 sampleTypeDateRangeController:(id)a11 initialXValue:(id)a12 currentCalendarOverride:(id)a13 options:(unint64_t)a14 timeScopeRanges:(id)a15
{
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  _TtC8HealthUI37BalanceInteractiveChartViewController *v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _TtC8HealthUI37BalanceInteractiveChartViewController *v53;
  id v54;
  id v55;
  _OWORD v56[2];

  v53 = self;
  v55 = a9;
  sub_1D7AAE0AC(0, &qword_1F014D660, (void (*)(uint64_t))MEMORY[0x1E0CB11F0]);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v50 - v21;
  sub_1D7AB935C();
  v52 = sub_1D7B4A4AC();
  if (a5)
  {
    sub_1D7AAF6EC(0, &qword_1F014D680);
    v51 = sub_1D7B4A4AC();
  }
  else
  {
    v51 = 0;
  }
  v54 = a7;
  if (a12)
  {
    v23 = a6;
    v24 = a7;
    v25 = a8;
    v26 = v55;
    v27 = a10;
    v28 = a11;
    v29 = a15;
    v30 = a13;
    v31 = a4;
    swift_unknownObjectRetain();
    sub_1D7B4A770();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v56, 0, sizeof(v56));
    v32 = a6;
    v33 = a7;
    v34 = a8;
    v35 = v55;
    v36 = a10;
    v37 = a11;
    v38 = a15;
    v39 = a13;
    v40 = a4;
  }
  if (a13)
  {
    sub_1D7B492C4();

    v41 = sub_1D7B49300();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v22, 0, 1, v41);
  }
  else
  {
    v42 = sub_1D7B49300();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v22, 1, 1, v42);
  }
  if (a15)
  {
    sub_1D7AAF6EC(0, (unint64_t *)&qword_1F014D240);
    sub_1D7AAF6EC(0, &qword_1F014D678);
    sub_1D7AAF724();
    v43 = sub_1D7B4A23C();

  }
  else
  {
    v43 = 0;
  }
  v49 = v43;
  v48 = (uint64_t)v22;
  v44 = v54;
  v45 = v55;
  v46 = (_TtC8HealthUI37BalanceInteractiveChartViewController *)sub_1D7AB9880(v52, (uint64_t)a4, v51, (uint64_t)a6, (uint64_t)v54, (uint64_t)a8, (uint64_t)v55, (uint64_t)a10, (uint64_t)a11, (uint64_t)v56, v48, a14, v49);

  return v46;
}

@end
