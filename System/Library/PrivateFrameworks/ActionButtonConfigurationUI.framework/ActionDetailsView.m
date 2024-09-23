@implementation ActionDetailsView

- (_TtC27ActionButtonConfigurationUI17ActionDetailsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_235E603D8();
}

- (void)layoutSubviews
{
  _TtC27ActionButtonConfigurationUI17ActionDetailsView *v2;

  v2 = self;
  sub_235E5F930();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC27ActionButtonConfigurationUI17ActionDetailsView *v8;
  _OWORD *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  v9 = sub_235E604CC(x, y);

  return v9;
}

- (void)pageControlValueChanged
{
  _TtC27ActionButtonConfigurationUI17ActionDetailsView *v2;

  v2 = self;
  sub_235E5FF6C();

}

- (_TtC27ActionButtonConfigurationUI17ActionDetailsView)initWithFrame:(CGRect)a3
{
  _TtC27ActionButtonConfigurationUI17ActionDetailsView *result;

  result = (_TtC27ActionButtonConfigurationUI17ActionDetailsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_235E34DD0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_selectionHandler));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton));
  swift_bridgeObjectRelease();
}

@end
