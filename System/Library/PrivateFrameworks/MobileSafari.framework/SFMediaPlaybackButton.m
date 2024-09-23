@implementation SFMediaPlaybackButton

- (SFMediaPlaybackButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18B9A5F00();
}

- (void)updateHighlightIndicator
{
  SFMediaPlaybackButton *v2;

  v2 = self;
  sub_18B9A51F4();

}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MediaPlaybackButton();
  return -[SFMediaPlaybackButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MediaPlaybackButton();
  v4 = v5.receiver;
  -[SFMediaPlaybackButton setHighlighted:](&v5, sel_setHighlighted_, v3);
  sub_18B9A53F4();

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MediaPlaybackButton();
  v2 = (char *)v5.receiver;
  -[SFMediaPlaybackButton layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR___SFMediaPlaybackButton_highlightIndicatorView];
  v4 = objc_msgSend(v3, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, CGRectGetWidth(v6) * 0.5);

}

- (SFMediaPlaybackButton)initWithFrame:(CGRect)a3
{
  SFMediaPlaybackButton *result;

  result = (SFMediaPlaybackButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SFMediaPlaybackButton_highlightIndicatorView));

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SFMediaPlaybackButton_highlightSizeAnchor));
}

@end
