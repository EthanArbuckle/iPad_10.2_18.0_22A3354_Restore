@implementation CKInlineMediaViewGenerateButton

- (_TtC7ChatKit31CKInlineMediaViewGenerateButton)initWithFrame:(CGRect)a3
{
  _TtC7ChatKit31CKInlineMediaViewGenerateButton *result;

  sub_18E606044(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC7ChatKit31CKInlineMediaViewGenerateButton)initWithCoder:(id)a3
{
  _TtC7ChatKit31CKInlineMediaViewGenerateButton *result;

  sub_18E606328(a3);
  return result;
}

- (BOOL)isGenerativeAssetAppearance
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_isGenerativeAssetAppearance;
  swift_beginAccess();
  return *v2;
}

- (void)setIsGenerativeAssetAppearance:(BOOL)a3
{
  _TtC7ChatKit31CKInlineMediaViewGenerateButton *v4;

  v4 = self;
  sub_18E6066C4(a3);

}

- (void)layoutSubviews
{
  _TtC7ChatKit31CKInlineMediaViewGenerateButton *v2;

  v2 = self;
  sub_18E606C8C();

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v8;
  _TtC7ChatKit31CKInlineMediaViewGenerateButton *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  CGPoint v16;
  CGRect v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_opt_self();
  v9 = self;
  v10 = a4;
  v11 = objc_msgSend(v8, sel_sharedBehaviors);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, sel_entryViewLinkViewDiscardButtonExtraHitTestPadding);
    v14 = v13;

    -[CKInlineMediaViewGenerateButton bounds](v9, sel_bounds);
    v18 = CGRectInset(v17, -v14, -v14);
    v16.x = x;
    v16.y = y;
    LOBYTE(v12) = CGRectContainsPoint(v18, v16);

    LOBYTE(v11) = (_BYTE)v12;
  }
  else
  {
    __break(1u);
  }
  return (char)v11;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_sparklesImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_buttonBGColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_buttonTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_generativeButtonBGColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_generativeButtonTintColor));
}

@end
