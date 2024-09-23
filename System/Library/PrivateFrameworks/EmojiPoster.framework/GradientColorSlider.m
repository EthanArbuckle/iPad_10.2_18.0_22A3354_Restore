@implementation GradientColorSlider

- (_TtC11EmojiPoster19GradientColorSlider)initWithFrame:(CGRect)a3
{
  return (_TtC11EmojiPoster19GradientColorSlider *)sub_1DD2CE9A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11EmojiPoster19GradientColorSlider)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster19GradientColorSlider *)sub_1DD2CEBD8(a3);
}

- (void)layoutSubviews
{
  _TtC11EmojiPoster19GradientColorSlider *v2;

  v2 = self;
  sub_1DD2CF130();

}

- (void)leftColorDidPanWithGr:(id)a3
{
  id v4;
  _TtC11EmojiPoster19GradientColorSlider *v5;

  v4 = a3;
  v5 = self;
  sub_1DD2CF260(v4);

}

- (void)rightColorDidPanWithGr:(id)a3
{
  id v4;
  _TtC11EmojiPoster19GradientColorSlider *v5;

  v4 = a3;
  v5 = self;
  sub_1DD2CF4EC(v4);

}

- (void)leftColorWasTappedWithGr:(id)a3
{
  id v4;
  _TtC11EmojiPoster19GradientColorSlider *v5;

  v4 = a3;
  v5 = self;
  sub_1DD2CF924();

}

- (void)rightColorWasTappedWithGr:(id)a3
{
  id v4;
  _TtC11EmojiPoster19GradientColorSlider *v5;

  v4 = a3;
  v5 = self;
  sub_1DD2CFAF0();

}

- (void).cxx_destruct
{
  sub_1DD2CFD1C((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_leftColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_rightColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_leftColorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_rightColorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_leftColorTapGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_rightColorTapGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_leftColorPanGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster19GradientColorSlider_rightColorPanGesture));
}

@end
