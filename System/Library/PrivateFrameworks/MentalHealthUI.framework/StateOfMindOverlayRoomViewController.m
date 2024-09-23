@implementation StateOfMindOverlayRoomViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  char *v27;
  uint64_t v29;

  v16 = (uint64_t)a10;
  sub_2417C55D4(0, (unint64_t *)&qword_25714F360, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  MEMORY[0x24BDAC7A8](v17, v18);
  v20 = (char *)&v29 - v19;
  if (a6)
  {
    sub_2418A80C4();
    v21 = sub_2418A8100();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 0, 1, v21);
  }
  else
  {
    v22 = sub_2418A8100();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v20, 1, 1, v22);
  }
  if (a10)
  {
    sub_241762EFC(0, (unint64_t *)&qword_257152CA0);
    v16 = sub_2418A9EB8();
  }
  swift_getObjCClassMetadata();
  v23 = a4;
  v24 = a5;
  v25 = a9;
  v26 = a8;
  v27 = sub_24183DADC(v23, v24, (uint64_t)v20, a7, (uint64_t)a8, v16, a11);

  swift_bridgeObjectRelease();
  sub_2417B10EC((uint64_t)v20);
  return v27;
}

- (_TtC14MentalHealthUI36StateOfMindOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 sleepChartFormatter:(id)a6 addDataViewControllerProvider:(id)a7 preferredOverlay:(int64_t)a8
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v23;

  sub_2417C55D4(0, (unint64_t *)&qword_25714F360, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  MEMORY[0x24BDAC7A8](v14, v15);
  v17 = (char *)&v23 - v16;
  if (a3)
  {
    sub_2418A80C4();
    v18 = sub_2418A8100();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 0, 1, v18);
  }
  else
  {
    v19 = sub_2418A8100();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  if (a5)
  {
    sub_241762EFC(0, (unint64_t *)&qword_257152CA0);
    a5 = (id)sub_2418A9EB8();
  }
  v20 = a4;
  v21 = a6;
  swift_unknownObjectRetain();
  return (_TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *)StateOfMindOverlayRoomViewController.init(displayDate:applicationItems:factorDisplayTypes:sleepChartFormatter:addDataViewControllerProvider:preferredOverlay:)((uint64_t)v17, v20, (uint64_t)a5, v21, (uint64_t)a7, a8);
}

- (void)viewDidLoad
{
  _TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *v2;

  v2 = self;
  sub_241837F9C();

}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  id v4;
  _TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_24183DF00(v4);

  v6 = (void *)sub_2418A9DB0();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC14MentalHealthUI36StateOfMindOverlayRoomViewController_stateOfMindInteractiveChartDisplayType));
}

- (id)createChartOverlayViewController
{
  _TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_241838200();

  return v3;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v7;
  id v8;
  _TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *v9;
  void *v10;

  if (a3 == 3)
  {
    v7 = a4;
    v8 = a5;
    v9 = self;
    sub_2418389A0(v8);

  }
  sub_241762EFC(0, &qword_257152DC8);
  v10 = (void *)sub_2418A9EAC();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)initialSelectedContextForMode:(int64_t)a3 containerIndex:(int64_t)a4
{
  _TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *v6;
  id v7;

  v6 = self;
  v7 = sub_241838820(a3, a4);

  return v7;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_2417C55D4(0, (unint64_t *)&qword_25714F360, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v13 - v8;
  if (a4)
  {
    sub_2418A80C4();
    v10 = sub_2418A8100();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_2418A8100();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  sub_2417B10EC((uint64_t)v9);
  return 0;
}

- (BOOL)supportsHealthFactors
{
  return 1;
}

- (void)contextView:(id)a3 didTapOnInfoButtonAtIndex:(int64_t)a4
{
  id v6;
  _TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *v7;

  v6 = a3;
  v7 = self;
  sub_24183E1A8(a4);

}

- (void)dismissAnimated:(id)a3
{
  _TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *v4;
  _TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2418AA23C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_24183B17C();

  sub_2417C5598((uint64_t)v6);
}

- (_TtC14MentalHealthUI36StateOfMindOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *result;
  uint64_t v16;

  sub_2417C55D4(0, (unint64_t *)&qword_25714F360, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v16 - v10;
  if (a3)
  {
    sub_2418A80C4();
    v12 = sub_2418A8100();
    v13 = 0;
  }
  else
  {
    v12 = sub_2418A8100();
    v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, v13, 1);
  v14 = a4;
  result = (_TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI36StateOfMindOverlayRoomViewController_sleepChartFormatter));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI36StateOfMindOverlayRoomViewController_preferredOverlayContextLocation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI36StateOfMindOverlayRoomViewController_stateOfMindInteractiveChartDisplayType));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI36StateOfMindOverlayRoomViewController_stateOfMindInteractiveChartDisplayTypeWithLegend));
}

@end
