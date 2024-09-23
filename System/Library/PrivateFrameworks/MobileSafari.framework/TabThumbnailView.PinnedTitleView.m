@implementation TabThumbnailView.PinnedTitleView

- (_TtCC12MobileSafari16TabThumbnailView15PinnedTitleView)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari16TabThumbnailView15PinnedTitleView *)sub_18B9A1CB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari16TabThumbnailView15PinnedTitleView)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari16TabThumbnailView15PinnedTitleView *)sub_18B9A1DF8(a3);
}

- (void)contentSizeCategoryDidChange
{
  void *v2;
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  _TtCC12MobileSafari16TabThumbnailView15PinnedTitleView *v7;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView15PinnedTitleView_titleLabel);
  v7 = self;
  v3 = -[TabThumbnailView.PinnedTitleView traitCollection](v7, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);
  v5 = sub_18BAC1378();

  if ((v5 & 1) != 0)
    v6 = 2;
  else
    v6 = 1;
  objc_msgSend(v2, sel_setNumberOfLines_, v6);

}

- (void)layoutSubviews
{
  _TtCC12MobileSafari16TabThumbnailView15PinnedTitleView *v2;

  v2 = self;
  sub_18B9A2310();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView15PinnedTitleView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView15PinnedTitleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView15PinnedTitleView_unreadIndicator));
}

@end
