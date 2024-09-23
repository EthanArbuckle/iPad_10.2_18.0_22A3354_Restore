@implementation DOCTextFieldRoundedBackgroundView

- (_TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView)initWithCoder:(id)a3
{
  id v4;
  _TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView_usePillShape) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView____lazy_storage___backgroundProvidingTextField) = 0;
  v4 = a3;

  result = (_TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView *)sub_21EB033C8();
  __break(1u);
  return result;
}

- (_TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView *)DOCTextFieldRoundedBackgroundView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)usePillShape
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView_usePillShape;
  swift_beginAccess();
  return *v2;
}

- (void)setUsePillShape:(BOOL)a3
{
  int v3;
  _BYTE *v5;
  int v6;
  _TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView *v7;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR____TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView_usePillShape;
  swift_beginAccess();
  v6 = *v5;
  *v5 = v3;
  if (v6 != v3)
  {
    v7 = self;
    sub_21EAE2DEC();

  }
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCTextFieldRoundedBackgroundView();
  -[DOCTextFieldRoundedBackgroundView bounds](&v6, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  _TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  objc_super v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for DOCTextFieldRoundedBackgroundView();
  v19.receiver = self;
  v19.super_class = v8;
  v9 = self;
  -[DOCTextFieldRoundedBackgroundView bounds](&v19, sel_bounds);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18.receiver = v9;
  v18.super_class = v8;
  -[DOCTextFieldRoundedBackgroundView setBounds:](&v18, sel_setBounds_, x, y, width, height);
  -[DOCTextFieldRoundedBackgroundView bounds](v9, sel_bounds);
  v21.origin.x = v11;
  v21.origin.y = v13;
  v21.size.width = v15;
  v21.size.height = v17;
  if (!CGRectEqualToRect(v20, v21))
    sub_21EAE2DEC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables33DOCTextFieldRoundedBackgroundView____lazy_storage___backgroundProvidingTextField));
}

@end
