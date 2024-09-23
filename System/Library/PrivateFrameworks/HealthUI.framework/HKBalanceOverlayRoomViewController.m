@implementation HKBalanceOverlayRoomViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(void);
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v31;
  unint64_t v32;

  v15 = (uint64_t)a10;
  v31 = a9;
  v32 = a11;
  sub_1D7AA787C(0, (unint64_t *)&qword_1F014D000, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v17 = MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v31 - v20;
  if (a6)
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
  if (a10)
  {
    sub_1D7AAF6EC(0, &qword_1F014D670);
    v15 = sub_1D7B4A4AC();
  }
  type metadata accessor for BalanceOverlayRoomViewController();
  v24 = MEMORY[0x1E0CB0870];
  sub_1D7B0C8A8((uint64_t)v21, (uint64_t)v19, (unint64_t *)&qword_1F014D000, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870]);
  swift_bridgeObjectRetain();
  v25 = a5;
  v26 = a4;
  v27 = a8;
  v28 = v31;
  v29 = BalanceOverlayRoomViewController.__allocating_init(displayDate:applicationItems:factorDisplayTypes:mode:)((uint64_t)v19, v25, v15, 1);
  objc_msgSend(v29, sel_setRestorationUserActivity_, v27);
  objc_msgSend(v29, sel_setAdditionalChartOptions_, v32);

  swift_bridgeObjectRelease();
  sub_1D7B143C0((uint64_t)v21, (uint64_t)&qword_1F014D000, (uint64_t)v24, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1D7AA787C);
  return v29;
}

- (HKBalanceOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  HKBalanceOverlayRoomViewController *v16;
  uint64_t v18;

  sub_1D7AA787C(0, (unint64_t *)&qword_1F014D000, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v18 - v11;
  if (a3)
  {
    sub_1D7B49168();
    v13 = sub_1D7B49198();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 0, 1, v13);
  }
  else
  {
    v14 = sub_1D7B49198();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 1, 1, v14);
  }
  if (a5)
  {
    sub_1D7AAF6EC(0, &qword_1F014D670);
    a5 = (id)sub_1D7B4A4AC();
  }
  v15 = a4;
  v16 = (HKBalanceOverlayRoomViewController *)sub_1D7B130C4((uint64_t)v12, v15, (uint64_t)a5, a6);

  return v16;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  void *v4;
  id v5;
  HKBalanceOverlayRoomViewController *v6;
  id v7;
  id v8;
  void *v9;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___HKBalanceOverlayRoomViewController_balanceDisplayType);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v4, sel_localization);
  v8 = objc_msgSend(v7, sel_displayName);

  sub_1D7B4A3BC();
  v9 = (void *)sub_1D7B4A38C();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                 + OBJC_IVAR___HKBalanceOverlayRoomViewController_balanceDisplayType));
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v8;
  id v9;
  HKBalanceOverlayRoomViewController *v10;
  void *v11;

  v8 = a4;
  v9 = a5;
  v10 = self;
  sub_1D7B1334C(a3, v8);

  sub_1D7AAF6EC(0, (unint64_t *)&unk_1F014F780);
  v11 = (void *)sub_1D7B4A4A0();
  swift_bridgeObjectRelease();
  return v11;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  HKBalanceOverlayRoomViewController *v15;
  id v16;
  uint64_t v18;

  sub_1D7AA787C(0, (unint64_t *)&qword_1F014D000, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v18 - v10;
  if (a4)
  {
    sub_1D7B49168();
    v12 = sub_1D7B49198();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_1D7B49198();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a5;
  v15 = self;
  v16 = sub_1D7B1055C(a3, (uint64_t)v11, v14);

  sub_1D7B143C0((uint64_t)v11, (uint64_t)&qword_1F014D000, (uint64_t)MEMORY[0x1E0CB0870], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1D7AA787C);
  return v16;
}

- (id)createChartOverlayViewController
{
  HKBalanceOverlayRoomViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1D7B1099C();

  return v3;
}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  HKBalanceOverlayRoomViewController *v7;
  HKInteractiveChartOverlayViewController *v8;
  HKInteractiveChartOverlayViewController *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = self;
  v8 = -[HKOverlayRoomViewController chartController](v7, sel_chartController);
  if (v8
    && (v9 = v8,
        v10 = -[HKInteractiveChartViewController stringForValueRange:timeScope:](v8, sel_stringForValueRange_timeScope_, v6, a4), v9, v10))
  {
    sub_1D7B4A3BC();

    v11 = (void *)sub_1D7B4A38C();
    swift_bridgeObjectRelease();
  }
  else
  {

    v11 = 0;
  }
  return v11;
}

- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4
{
  return 1;
}

- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  HKBalanceOverlayRoomViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1D7B13574();

  return v9;
}

- (void)contextView:(id)a3 didTapOnInfoButtonAtIndex:(int64_t)a4
{
  id v6;
  HKBalanceOverlayRoomViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1D7B13D0C(a4);

}

- (void)dismiss:(id)a3
{
  HKBalanceOverlayRoomViewController *v4;
  HKBalanceOverlayRoomViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D7B4A770();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1D7B11F78();

  sub_1D7B143C0((uint64_t)v6, (uint64_t)&qword_1ED0AC810, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1D7AA7E70);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HKBalanceOverlayRoomViewController_balanceDisplayType));
  sub_1D7B143C0((uint64_t)self + OBJC_IVAR___HKBalanceOverlayRoomViewController_mostFrequentClassification, (uint64_t)&qword_1F014DD78, (uint64_t)MEMORY[0x1E0D29090], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1D7AA787C);
}

@end
