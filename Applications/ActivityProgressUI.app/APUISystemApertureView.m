@implementation APUISystemApertureView

- (_TtC18ActivityProgressUI22APUISystemApertureView)init
{
  double v3;
  objc_super v5;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded) = 0;
  if (qword_10004EDB0 != -1)
    swift_once(&qword_10004EDB0, sub_10002D4EC);
  v3 = *(double *)&static APUISystemApertureView.compactDimension;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for APUISystemApertureView();
  return -[APUISystemApertureView initWithFrame:](&v5, "initWithFrame:", 0.0, 0.0, v3, v3);
}

- (_TtC18ActivityProgressUI22APUISystemApertureView)initWithCoder:(id)a3
{
  id v4;
  _TtC18ActivityProgressUI22APUISystemApertureView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded) = 0;
  v4 = a3;

  result = (_TtC18ActivityProgressUI22APUISystemApertureView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100039BF0, "ActivityProgressUI/APUISystemApertureView.swift", 47, 2, 26, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t (*v3)(void);
  _TtC18ActivityProgressUI22APUISystemApertureView *v4;
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  v3 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x58);
  v4 = self;
  if ((v3() & 1) != 0)
  {
    v5 = 0x40482AA9930BE0DFLL;
  }
  else
  {
    if (qword_10004EDB0 != -1)
      swift_once(&qword_10004EDB0, sub_10002D4EC);
    v5 = static APUISystemApertureView.compactDimension;
  }

  v6 = *(double *)&v5;
  v7 = *(double *)&v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  uint64_t (*v5)(void);
  _TtC18ActivityProgressUI22APUISystemApertureView *v6;
  uint64_t v7;
  double v8;
  double v9;
  CGSize result;

  v5 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x58);
  v6 = self;
  if ((v5() & 1) != 0)
  {
    v7 = 0x40482AA9930BE0DFLL;
  }
  else
  {
    if (qword_10004EDB0 != -1)
      swift_once(&qword_10004EDB0, sub_10002D4EC);
    v7 = static APUISystemApertureView.compactDimension;
  }

  v8 = *(double *)&v7;
  v9 = *(double *)&v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  uint64_t v5;
  _TtC18ActivityProgressUI22APUISystemApertureView *v6;
  uint64_t v7;
  double v8;
  double v9;
  CGSize result;

  if ((unint64_t)(a4 + 1) >= 3 && (unint64_t)(a4 - 2) > 1)
  {
    v7 = 0x40482AA9930BE0DFLL;
  }
  else
  {
    v5 = qword_10004EDB0;
    v6 = self;
    if (v5 != -1)
      swift_once(&qword_10004EDB0, sub_10002D4EC);
    v7 = static APUISystemApertureView.compactDimension;

  }
  v8 = *(double *)&v7;
  v9 = *(double *)&v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC18ActivityProgressUI22APUISystemApertureView)initWithFrame:(CGRect)a3
{
  _TtC18ActivityProgressUI22APUISystemApertureView *result;

  result = (_TtC18ActivityProgressUI22APUISystemApertureView *)_swift_stdlib_reportUnimplementedInitializer("ActivityProgressUI.APUISystemApertureView", 41, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
