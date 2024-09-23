@implementation SessionHeaderView

- (_TtC13MediaControls17SessionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaControls17SessionHeaderView *)sub_1AAA908F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaControls17SessionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAA9278C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  uint64_t v4;
  _TtC13MediaControls17SessionHeaderView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v4 = qword_1EEB95DF8;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = *(double *)&qword_1EEB96D70;
  if (((*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v5->super.super.super.isa) + 0xB0))() & 1) != 0)
  {
    if (qword_1EEB95D90 != -1)
      swift_once();
    v7 = *(double *)&qword_1EEB95D98;
    if (qword_1EEB95DB0 != -1)
      swift_once();
    v8 = v7 + *(double *)&qword_1EEB95DB8;
    if (qword_1EEB95DC0 != -1)
      swift_once();
    v9 = *(double *)&qword_1EEB95DC8;

    v6 = v6 + v8 + v9;
  }
  else
  {

  }
  v10 = width;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  sub_1AAA7B7EC((uint64_t)self + OBJC_IVAR____TtC13MediaControls17SessionHeaderView_viewModel, &qword_1EEB93B20);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls17SessionHeaderView_metadataView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls17SessionHeaderView_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls17SessionHeaderView_absoluteVolumeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls17SessionHeaderView_visualStylingProvider));
}

@end
