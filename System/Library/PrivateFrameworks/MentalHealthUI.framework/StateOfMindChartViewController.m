@implementation StateOfMindChartViewController

- (void)didTapOnDateFromCurrentValueView:(id)a3
{
  id v4;
  _TtC14MentalHealthUI30StateOfMindChartViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2417C4504();

}

- (_TtC14MentalHealthUI30StateOfMindChartViewController)initWithHealthStore:(id)a3 primaryDisplayType:(id)a4 unitPreferenceController:(id)a5 dateCache:(id)a6 chartDataCacheController:(id)a7 selectedTimeScopeController:(id)a8 sampleTypeDateRangeController:(id)a9 initialXValue:(id)a10 currentCalendarOverride:(id)a11 options:(unint64_t)a12
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _TtC14MentalHealthUI30StateOfMindChartViewController *v37;
  id v39[2];

  v39[0] = a9;
  v39[1] = self;
  sub_2417C55D4(0, &qword_25714FB40, (void (*)(uint64_t))MEMORY[0x24BDCF2D8]);
  MEMORY[0x24BDAC7A8](v18, v19);
  v21 = (char *)v39 - v20;
  sub_2417C55D4(0, (unint64_t *)&qword_25714F360, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  MEMORY[0x24BDAC7A8](v22, v23);
  v25 = (char *)v39 - v24;
  if (a10)
  {
    sub_2418A80C4();
    v26 = sub_2418A8100();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v25, 0, 1, v26);
  }
  else
  {
    v27 = sub_2418A8100();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v25, 1, 1, v27);
  }
  if (a11)
  {
    sub_2418A81D8();
    v28 = sub_2418A8238();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v21, 0, 1, v28);
  }
  else
  {
    v29 = sub_2418A8238();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v21, 1, 1, v29);
  }
  v30 = a3;
  v31 = a4;
  v32 = a5;
  v33 = a6;
  v34 = a7;
  v35 = a8;
  v36 = v39[0];
  v37 = (_TtC14MentalHealthUI30StateOfMindChartViewController *)sub_2417C4970((uint64_t)v30, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34, (uint64_t)v35, (uint64_t)v36, (uint64_t)v25, (uint64_t)v21, a12);

  return v37;
}

- (_TtC14MentalHealthUI30StateOfMindChartViewController)initWithTimeScopeRanges:(id)a3 healthStore:(id)a4 primaryDisplayType:(id)a5 unitPreferenceController:(id)a6 dateCache:(id)a7 chartDataCacheController:(id)a8 selectedTimeScopeController:(id)a9 sampleTypeDateRangeController:(id)a10 initialXValue:(id)a11 currentCalendarOverride:(id)a12 options:(unint64_t)a13
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
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
  _TtC14MentalHealthUI30StateOfMindChartViewController *v35;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _TtC14MentalHealthUI30StateOfMindChartViewController *v42;

  v42 = self;
  v40 = a8;
  v41 = a10;
  v38 = a7;
  v39 = a9;
  sub_2417C55D4(0, &qword_25714FB40, (void (*)(uint64_t))MEMORY[0x24BDCF2D8]);
  MEMORY[0x24BDAC7A8](v16, v17);
  v19 = (char *)&v37 - v18;
  sub_2417C55D4(0, (unint64_t *)&qword_25714F360, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  MEMORY[0x24BDAC7A8](v20, v21);
  v23 = (char *)&v37 - v22;
  sub_241762EFC(0, (unint64_t *)&qword_25714FB48);
  sub_241762EFC(0, &qword_25714FB50);
  sub_2417C54A4();
  v37 = sub_2418A9D20();
  if (a11)
  {
    sub_2418A80C4();
    v24 = sub_2418A8100();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v23, 0, 1, v24);
  }
  else
  {
    v25 = sub_2418A8100();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v23, 1, 1, v25);
  }
  if (a12)
  {
    sub_2418A81D8();
    v26 = sub_2418A8238();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v19, 0, 1, v26);
  }
  else
  {
    v27 = sub_2418A8238();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v19, 1, 1, v27);
  }
  v28 = a4;
  v29 = a5;
  v30 = a6;
  v31 = v38;
  v32 = v40;
  v33 = v39;
  v34 = v41;
  v35 = (_TtC14MentalHealthUI30StateOfMindChartViewController *)sub_2417C4B9C(v37, (uint64_t)v28, (uint64_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34, (uint64_t)v23, (uint64_t)v19, a13);

  return v35;
}

- (_TtC14MentalHealthUI30StateOfMindChartViewController)initWithStackedDisplayTypes:(id)a3 primaryDisplayTypeStackIndex:(id)a4 stackedDisplayTypeHeights:(id)a5 healthStore:(id)a6 unitPreferenceController:(id)a7 dateCache:(id)a8 chartDataCacheController:(id)a9 selectedTimeScopeController:(id)a10 sampleTypeDateRangeController:(id)a11 initialXValue:(id)a12 currentCalendarOverride:(id)a13 options:(unint64_t)a14 timeScopeRanges:(id)a15
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
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
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  _TtC14MentalHealthUI30StateOfMindChartViewController *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _TtC14MentalHealthUI30StateOfMindChartViewController *v54;
  id v55;
  id v56;
  _OWORD v57[2];

  v54 = self;
  v56 = a9;
  sub_2417C55D4(0, &qword_25714FB40, (void (*)(uint64_t))MEMORY[0x24BDCF2D8]);
  MEMORY[0x24BDAC7A8](v20, v21);
  v23 = (char *)&v51 - v22;
  sub_2417C5440();
  v53 = sub_2418A9EB8();
  if (a5)
  {
    sub_241762EFC(0, &qword_25714FB60);
    v52 = sub_2418A9EB8();
  }
  else
  {
    v52 = 0;
  }
  v55 = a7;
  if (a12)
  {
    v24 = a6;
    v25 = a7;
    v26 = a8;
    v27 = v56;
    v28 = a10;
    v29 = a11;
    v30 = a15;
    v31 = a13;
    v32 = a4;
    swift_unknownObjectRetain();
    sub_2418AA23C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v57, 0, sizeof(v57));
    v33 = a6;
    v34 = a7;
    v35 = a8;
    v36 = v56;
    v37 = a10;
    v38 = a11;
    v39 = a15;
    v40 = a13;
    v41 = a4;
  }
  if (a13)
  {
    sub_2418A81D8();

    v42 = sub_2418A8238();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v23, 0, 1, v42);
  }
  else
  {
    v43 = sub_2418A8238();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v23, 1, 1, v43);
  }
  if (a15)
  {
    sub_241762EFC(0, (unint64_t *)&qword_25714FB48);
    sub_241762EFC(0, &qword_25714FB50);
    sub_2417C54A4();
    v44 = sub_2418A9D20();

  }
  else
  {
    v44 = 0;
  }
  v50 = v44;
  v49 = (uint64_t)v23;
  v45 = v55;
  v46 = v56;
  v47 = (_TtC14MentalHealthUI30StateOfMindChartViewController *)sub_2417C4E30(v53, (uint64_t)a4, v52, (uint64_t)a6, (uint64_t)v55, (uint64_t)a8, (uint64_t)v56, (uint64_t)a10, (uint64_t)a11, (uint64_t)v57, v49, a14, v50);

  return v47;
}

@end
