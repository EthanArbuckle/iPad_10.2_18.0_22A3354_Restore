@implementation AEGenerativePlaygroundButton

- (_TtC13AssetExplorer28AEGenerativePlaygroundButton)initWithFrame:(CGRect)a3
{
  return (_TtC13AssetExplorer28AEGenerativePlaygroundButton *)sub_21E23D208(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13AssetExplorer28AEGenerativePlaygroundButton)initWithCoder:(id)a3
{
  return (_TtC13AssetExplorer28AEGenerativePlaygroundButton *)sub_21E23D3A8(a3);
}

- (BOOL)isGenerativeAssetAppearance
{
  return sub_21E23D55C() & 1;
}

- (void)setIsGenerativeAssetAppearance:(BOOL)a3
{
  _TtC13AssetExplorer28AEGenerativePlaygroundButton *v4;

  v4 = self;
  sub_21E23D5CC(a3);

}

- (void)layoutSubviews
{
  _TtC13AssetExplorer28AEGenerativePlaygroundButton *v2;

  v2 = self;
  sub_21E23DBB0();

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC13AssetExplorer28AEGenerativePlaygroundButton *v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  LOBYTE(self) = sub_21E23DC78(x, y);

  return self & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_sparklesImage));
  OUTLINED_FUNCTION_4(OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView);
  OUTLINED_FUNCTION_4(OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_buttonBGColor);
  OUTLINED_FUNCTION_4(OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_buttonTintColor);
  OUTLINED_FUNCTION_4(OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeButtonBGColor);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeButtonTintColor));
}

@end
