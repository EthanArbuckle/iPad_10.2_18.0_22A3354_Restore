@implementation PlusButtonBlendedBackgroundView

- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView)init
{
  _TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlusButtonBlendedBackgroundView();
  v2 = -[PlusButtonBlendedBackgroundView initWithFrame:](&v4, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_18E58A030();

  return v2;
}

- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView)initWithCoder:(id)a3
{
  id v4;
  _TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView *v5;
  _TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView *v6;
  _TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PlusButtonBlendedBackgroundView();
  v4 = a3;
  v5 = -[PlusButtonBlendedBackgroundView initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_18E58A030();

  }
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlusButtonBlendedBackgroundView();
  v4 = a3;
  v5 = v6.receiver;
  -[PlusButtonBlendedBackgroundView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  sub_18E58A030();

}

- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView)initWithFrame:(CGRect)a3
{
  sub_18E584F74();
}

@end
