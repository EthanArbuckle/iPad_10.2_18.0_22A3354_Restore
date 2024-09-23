@implementation ChartOverlayViewController

- (BOOL)supportsHealthFactors
{
  return 0;
}

- (BOOL)supportsShowAllFilters
{
  _TtC15HealthRecordsUI26ChartOverlayViewController *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1BC5244DC();

  return v3;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI26ChartOverlayViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1BC5259F4();

  v6 = (void *)sub_1BC62C650();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  id v7;
  _TtC15HealthRecordsUI26ChartOverlayViewController *v8;
  id result;
  id v10;
  void *v11;
  id v12;
  _TtC15HealthRecordsUI26ChartOverlayViewController *v13;

  v5 = *(unint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC15HealthRecordsUI26ChartOverlayViewController_displayTypes);
  if (!(v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    v7 = a3;
    v8 = self;
    result = (id)swift_bridgeObjectRetain();
    if (v6)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    sub_1BC62D394();
    __break(1u);
    goto LABEL_9;
  }
  v12 = a3;
  v13 = self;
  swift_bridgeObjectRetain();
  result = (id)sub_1BC62D3B8();
  if (!result)
    goto LABEL_8;
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
LABEL_9:
    v10 = (id)MEMORY[0x1BCCF24CC](0, v5);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v10 = *(id *)(v5 + 32);
LABEL_6:
    v11 = v10;

    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

- (id)createChartOverlayViewController
{
  _TtC15HealthRecordsUI26ChartOverlayViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1BC524770();

  return v3;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v8;
  id v9;
  _TtC15HealthRecordsUI26ChartOverlayViewController *v10;
  void *v11;

  v8 = a4;
  v9 = a5;
  v10 = self;
  sub_1BC525AE8(a3);

  sub_1BC34B6A0(0, &qword_1EF435738);
  v11 = (void *)sub_1BC62C86C();
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
  _TtC15HealthRecordsUI26ChartOverlayViewController *v15;
  id v16;
  uint64_t v18;

  sub_1BC357158(0, (unint64_t *)&qword_1ED6A4EA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v18 - v10;
  if (a4)
  {
    sub_1BC62A724();
    v12 = sub_1BC62A760();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_1BC62A760();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a5;
  v15 = self;
  v16 = sub_1BC524DB0(a3, (uint64_t)v11, v14);

  sub_1BC377E3C((uint64_t)v11, (unint64_t *)&qword_1ED6A4EA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870]);
  return v16;
}

- (_TtC15HealthRecordsUI26ChartOverlayViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC15HealthRecordsUI26ChartOverlayViewController *result;
  uint64_t v15;

  sub_1BC357158(0, (unint64_t *)&qword_1ED6A4EA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v15 - v9;
  if (a3)
  {
    sub_1BC62A724();
    v11 = sub_1BC62A760();
    v12 = 0;
  }
  else
  {
    v11 = sub_1BC62A760();
    v12 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, v12, 1);
  v13 = a4;
  result = (_TtC15HealthRecordsUI26ChartOverlayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI26ChartOverlayViewController_chartDefining);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI26ChartOverlayViewController_chartabilityResult));
}

@end
