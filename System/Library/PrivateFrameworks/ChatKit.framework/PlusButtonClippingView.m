@implementation PlusButtonClippingView

- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView)init
{
  _TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView *v2;
  objc_super v4;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView_automaticallyAdjustsCornerRadius) = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlusButtonClippingView();
  v2 = -[PlusButtonClippingView initWithFrame:](&v4, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  -[PlusButtonClippingView setClipsToBounds:](v2, sel_setClipsToBounds_, 1);
  return v2;
}

- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView)initWithCoder:(id)a3
{
  id v4;
  _TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView *v5;
  _TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView *v6;
  _TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView *v7;
  objc_super v9;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView_automaticallyAdjustsCornerRadius) = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PlusButtonClippingView();
  v4 = a3;
  v5 = -[PlusButtonClippingView initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    -[PlusButtonClippingView setClipsToBounds:](v7, sel_setClipsToBounds_, 1, v9.receiver, v9.super_class);

  }
  return v6;
}

- (void)layoutSubviews
{
  id v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlusButtonClippingView();
  v2 = v6.receiver;
  -[PlusButtonClippingView layoutSubviews](&v6, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v6.receiver, v6.super_class);
  if (*((_BYTE *)v2
       + OBJC_IVAR____TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView_automaticallyAdjustsCornerRadius) == 1)
  {
    if (v4 >= v3)
      v5 = v3;
    else
      v5 = v4;
    objc_msgSend(v2, sel__setContinuousCornerRadius_, v5 * 0.5);
  }

}

- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView)initWithFrame:(CGRect)a3
{
  sub_18E584F74();
}

@end
