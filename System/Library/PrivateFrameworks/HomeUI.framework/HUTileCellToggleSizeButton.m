@implementation HUTileCellToggleSizeButton

- (BOOL)isExpanding
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUTileCellToggleSizeButton_isExpanding;
  swift_beginAccess();
  return *v2;
}

- (void)setIsExpanding:(BOOL)a3
{
  BOOL *v5;
  HUTileCellToggleSizeButton *v6;

  v5 = (BOOL *)self + OBJC_IVAR___HUTileCellToggleSizeButton_isExpanding;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_1B8EA4F90();

}

- (UIImageSymbolConfiguration)symbolConfiguration
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR___HUTileCellToggleSizeButton_symbolConfiguration);
  swift_beginAccess();
  return (UIImageSymbolConfiguration *)*v2;
}

- (void)setSymbolConfiguration:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  HUTileCellToggleSizeButton *v8;

  v5 = (void **)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___HUTileCellToggleSizeButton_symbolConfiguration);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_1B8EA4F90();
}

- (HUTileCellToggleSizeButton)init
{
  return (HUTileCellToggleSizeButton *)TileCellToggleSizeButton.init()();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  HUTileCellToggleSizeButton *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  CGPoint v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[HUTileCellToggleSizeButton bounds](v8, sel_bounds);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[HUTileCellToggleSizeButton _touchInsets](v8, sel__touchInsets);
  v22.origin.x = UIEdgeInsetsInsetRect(v10, v12, v14, v16, v17, v18);
  v21.x = x;
  v21.y = y;
  v19 = CGRectContainsPoint(v22, v21);

  return v19;
}

- (HUTileCellToggleSizeButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B8EA5468();
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  HUTileCellToggleSizeButton *v6;

  v6 = self;
  sub_1B8EA46D0(a3, a4);

}

- (void)updateConstraints
{
  HUTileCellToggleSizeButton *v2;

  v2 = self;
  sub_1B8EA4A40();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  HUTileCellToggleSizeButton *v6;

  v5 = a3;
  v6 = self;
  sub_1B8EA4CF8(a3);

}

- (HUTileCellToggleSizeButton)initWithFrame:(CGRect)a3
{
  HUTileCellToggleSizeButton *result;

  result = (HUTileCellToggleSizeButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUTileCellToggleSizeButton_arrowImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUTileCellToggleSizeButton_symbolConfiguration));
}

@end
