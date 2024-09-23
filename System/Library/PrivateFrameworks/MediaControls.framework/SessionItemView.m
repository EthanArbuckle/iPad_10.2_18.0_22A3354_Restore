@implementation SessionItemView

- (_TtC13MediaControls15SessionItemView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAA9FCCC();
}

- (_TtC13MediaControls15SessionItemView)initWithFrame:(CGRect)a3
{
  _TtC13MediaControls15SessionItemView *result;

  result = (_TtC13MediaControls15SessionItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_symbolImageView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_accessoryImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_equalizerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView____lazy_storage___titleVStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView____lazy_storage___titleHStack));
  sub_1AAA799B8((uint64_t)self + OBJC_IVAR____TtC13MediaControls15SessionItemView_viewModel, type metadata accessor for SessionItemViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_absoluteVolumeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemView_stylingProvider));
}

@end
