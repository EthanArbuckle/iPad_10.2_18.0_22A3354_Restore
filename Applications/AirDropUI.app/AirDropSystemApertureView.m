@implementation AirDropSystemApertureView

- (_TtC9AirDropUI25AirDropSystemApertureView)init
{
  double v3;
  objc_super v5;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9AirDropUI25AirDropSystemApertureView_expanded) = 0;
  if (qword_10013AD80 != -1)
    swift_once(&qword_10013AD80, sub_1000CAD5C);
  v3 = *(double *)&qword_100148078;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AirDropSystemApertureView();
  return -[AirDropSystemApertureView initWithFrame:](&v5, "initWithFrame:", 0.0, 0.0, v3, v3);
}

- (_TtC9AirDropUI25AirDropSystemApertureView)initWithCoder:(id)a3
{
  id v4;
  _TtC9AirDropUI25AirDropSystemApertureView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9AirDropUI25AirDropSystemApertureView_expanded) = 0;
  v4 = a3;

  result = (_TtC9AirDropUI25AirDropSystemApertureView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000F05A0, "AirDropUI/AirDropSystemApertureView.swift", 41, 2, 26, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC9AirDropUI25AirDropSystemApertureView *v6;
  double v7;
  double v8;
  CGSize result;

  if (((*(uint64_t (**)(__n128, __n128))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x58))((__n128)a3, *(__n128 *)&a3.height) & 1) != 0)
  {
    v4 = 0x40482AA9930BE0DFLL;
  }
  else
  {
    v5 = qword_10013AD80;
    v6 = self;
    if (v5 != -1)
      swift_once(&qword_10013AD80, sub_1000CAD5C);
    v4 = qword_100148078;

  }
  v7 = *(double *)&v4;
  v8 = *(double *)&v4;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  uint64_t v6;
  uint64_t v7;
  _TtC9AirDropUI25AirDropSystemApertureView *v8;
  double v9;
  double v10;
  CGSize result;

  if (((*(uint64_t (**)(__n128, __n128, float, float))((swift_isaMask & (uint64_t)self->super.super.super.isa)
                                                                + 0x58))((__n128)a3, *(__n128 *)&a3.height, a4, a5) & 1) != 0)
  {
    v6 = 0x40482AA9930BE0DFLL;
  }
  else
  {
    v7 = qword_10013AD80;
    v8 = self;
    if (v7 != -1)
      swift_once(&qword_10013AD80, sub_1000CAD5C);
    v6 = qword_100148078;

  }
  v9 = *(double *)&v6;
  v10 = *(double *)&v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  uint64_t v5;
  _TtC9AirDropUI25AirDropSystemApertureView *v6;
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
    v5 = qword_10013AD80;
    v6 = self;
    if (v5 != -1)
      swift_once(&qword_10013AD80, sub_1000CAD5C);
    v7 = qword_100148078;

  }
  v8 = *(double *)&v7;
  v9 = *(double *)&v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC9AirDropUI25AirDropSystemApertureView)initWithFrame:(CGRect)a3
{
  _TtC9AirDropUI25AirDropSystemApertureView *result;

  result = (_TtC9AirDropUI25AirDropSystemApertureView *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.AirDropSystemApertureView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
