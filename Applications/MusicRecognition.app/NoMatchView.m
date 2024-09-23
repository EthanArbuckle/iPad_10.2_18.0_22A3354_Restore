@implementation NoMatchView

- (_TtC16MusicRecognition11NoMatchView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicRecognition11NoMatchView *)sub_10009AE28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC16MusicRecognition11NoMatchView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC16MusicRecognition11NoMatchView *)sub_10009B83C(v3, v4);
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC16MusicRecognition11NoMatchView *v3;

  v3 = self;
  sub_10009B968((uint64_t)v3, v2);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition11NoMatchView_noMatchLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition11NoMatchView_noMatchLabelVerticalAnchor));
}

@end
