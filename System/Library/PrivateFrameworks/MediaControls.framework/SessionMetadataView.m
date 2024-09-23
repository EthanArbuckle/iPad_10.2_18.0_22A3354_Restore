@implementation SessionMetadataView

- (_TtC13MediaControls19SessionMetadataView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaControls19SessionMetadataView *)sub_1AAA94214(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaControls19SessionMetadataView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAA95700();
}

- (void)layoutSubviews
{
  _TtC13MediaControls19SessionMetadataView *v2;

  v2 = self;
  sub_1AAA946AC();

}

- (void)tapAction
{
  uint64_t (*v2)(void);
  void (*v3)(_TtC13MediaControls19SessionMetadataView *);
  uint64_t v4;
  _TtC13MediaControls19SessionMetadataView *v5;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0x1A8);
  v5 = self;
  v3 = (void (*)(_TtC13MediaControls19SessionMetadataView *))v2();
  if (v3)
  {
    v4 = (uint64_t)v3;
    v3(v5);
    sub_1AAA8E77C(v4);
  }

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_symbolImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_subtitleSymbolImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView____lazy_storage___subtitleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView____lazy_storage___labelsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_symbolConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_secondarySymbolConfiguration));
  sub_1AAA93898(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_viewModel), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC13MediaControls19SessionMetadataView_viewModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_artworkImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_visualStylingProvider));
  sub_1AAA8E77C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13MediaControls19SessionMetadataView_tapHandler));
}

@end
