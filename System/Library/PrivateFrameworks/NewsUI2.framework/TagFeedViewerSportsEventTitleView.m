@implementation TagFeedViewerSportsEventTitleView

- (_TtC7NewsUI233TagFeedViewerSportsEventTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI233TagFeedViewerSportsEventTitleView *)sub_1D6316318(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI233TagFeedViewerSportsEventTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D6316A5C();
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = v5.receiver;
  -[TagFeedViewerSportsEventTitleView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_traitCollection, v5.receiver, v5.super_class);
  v4 = objc_msgSend(v3, sel_horizontalSizeClass);

  if (v4 == (id)2)
    sub_1D6316534();
  else
    sub_1D6316808();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233TagFeedViewerSportsEventTitleView_leftImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233TagFeedViewerSportsEventTitleView_leftTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233TagFeedViewerSportsEventTitleView_rightImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233TagFeedViewerSportsEventTitleView_rightTitleLabel));
}

@end
