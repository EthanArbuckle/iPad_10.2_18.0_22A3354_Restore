@implementation UIKitScrollableTextView

- (void)willMoveToWindow:(id)a3
{
  id v5;
  _TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView *v6;

  v5 = a3;
  v6 = self;
  sub_21D2BEE18((uint64_t)a3);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_21D2BEECC(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView *v2;

  v2 = self;
  sub_21D2BEF70();

}

- (_TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView)initWithFrame:(CGRect)a3
{
  return (_TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView *)sub_21D2BF4B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView)initWithCoder:(id)a3
{
  return (_TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView *)sub_21D2BF608(a3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self
     + OBJC_IVAR____TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView_attributedText;
  v4 = sub_21D7BF568();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView_textView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView_preferredFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView____lazy_storage___sizingTextView));
}

@end
