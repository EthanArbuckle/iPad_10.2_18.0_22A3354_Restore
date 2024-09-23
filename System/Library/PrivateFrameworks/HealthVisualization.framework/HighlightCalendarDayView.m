@implementation HighlightCalendarDayView

- (NSDate)axDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC19HealthVisualization24HighlightCalendarDayView *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  sub_1BC998AB0(0, &qword_1ED6C7280, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - v4;
  v6 = self;
  sub_1BCA4F268((uint64_t)v5);

  v7 = sub_1BCAB4E54();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1BCAB4DE8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (int64_t)axProbability
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v14;

  sub_1BC998AB0(0, (unint64_t *)&qword_1ED6C5400, type metadata accessor for AXProjectionState, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v14 - v4;
  v6 = type metadata accessor for AXProjectionState(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)self + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_model;
  v11 = type metadata accessor for HighlightCalendarDayViewModel(0);
  sub_1BCA50B20((uint64_t)&v10[*(int *)(v11 + 52)], (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1BCA50B7C((uint64_t)v5);
    return 0;
  }
  else
  {
    sub_1BCA50BD0((uint64_t)v5, (uint64_t)v9);
    v12 = *(_QWORD *)&v9[*(int *)(v6 + 20)];
    sub_1BC997208((uint64_t)v9, type metadata accessor for AXProjectionState);
  }
  return v12;
}

- (NSString)axProjectionKind
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  sub_1BC998AB0(0, (unint64_t *)&qword_1ED6C5400, type metadata accessor for AXProjectionState, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v15 - v4;
  v6 = type metadata accessor for AXProjectionState(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)self + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_model;
  v11 = type metadata accessor for HighlightCalendarDayViewModel(0);
  sub_1BCA50B20((uint64_t)&v10[*(int *)(v11 + 52)], (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1BCA50B7C((uint64_t)v5);
  }
  else
  {
    sub_1BCA50BD0((uint64_t)v5, (uint64_t)v9);
    v12 = *(_QWORD *)&v9[*(int *)(v6 + 24) + 8];
    swift_bridgeObjectRetain();
    sub_1BC997208((uint64_t)v9, type metadata accessor for AXProjectionState);
    if (v12)
    {
      v13 = (void *)sub_1BCAB5EE0();
      swift_bridgeObjectRelease();
      return (NSString *)v13;
    }
  }
  return (NSString *)0;
}

- (int64_t)axCircleState
{
  return qword_1BCAC61D0[*((char *)&self->super._swiftAnimationInfo
                         + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_model)];
}

- (_TtC19HealthVisualization24HighlightCalendarDayView)initWithCoder:(id)a3
{
  id v4;
  _TtC19HealthVisualization24HighlightCalendarDayView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_dayLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_todayIndicatorLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_activityRingsView) = 0;
  v4 = a3;

  result = (_TtC19HealthVisualization24HighlightCalendarDayView *)sub_1BCAB65C4();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC19HealthVisualization24HighlightCalendarDayView *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  char v9;
  CGSize result;

  v3 = self;
  v4 = -[HighlightCalendarDayView traitCollection](v3, sel_traitCollection);
  v5 = objc_msgSend(v4, sel_preferredContentSizeCategory);

  v9 = *((_BYTE *)&v3->super._gestureRecognizers
       + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_model
       + 1);
  v6 = sub_1BCA5099C((uint64_t)v5, &v9);

  v7 = v6;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC19HealthVisualization24HighlightCalendarDayView *v2;

  v2 = self;
  sub_1BCA4FB54();

}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HighlightCalendarDayView();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[HighlightCalendarDayView layoutSublayersOfLayer:](&v8, sel_layoutSublayersOfLayer_, v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_todayIndicatorLayer];
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v5, sel_bounds, v8.receiver, v8.super_class);
    objc_msgSend(v7, sel_setFrame_);

    v4 = v5;
    v5 = v7;
  }

}

- (_TtC19HealthVisualization24HighlightCalendarDayView)initWithFrame:(CGRect)a3
{
  _TtC19HealthVisualization24HighlightCalendarDayView *result;

  result = (_TtC19HealthVisualization24HighlightCalendarDayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BC997208((uint64_t)self + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_model, type metadata accessor for HighlightCalendarDayViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_dayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_todayIndicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_ringsRenderer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization24HighlightCalendarDayView_activityRingsView));
}

@end
