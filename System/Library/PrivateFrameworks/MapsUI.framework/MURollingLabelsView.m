@implementation MURollingLabelsView

- (MURollingLabelsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  MURollingLabelsView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MURollingLabelsView____lazy_storage___currentLabelAndConstraints) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MURollingLabelsView____lazy_storage___labelAndConstraintsAnimatingIn) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MURollingLabelsView____lazy_storage___labelForBaselineAlignment) = 0;
  v9 = (char *)self + OBJC_IVAR___MURollingLabelsView_transitioningContentSize;
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[MURollingLabelsView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_191DDCCFC();

  return v10;
}

- (MURollingLabelsView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  MURollingLabelsView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MURollingLabelsView____lazy_storage___currentLabelAndConstraints) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MURollingLabelsView____lazy_storage___labelAndConstraintsAnimatingIn) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MURollingLabelsView____lazy_storage___labelForBaselineAlignment) = 0;
  v4 = (char *)self + OBJC_IVAR___MURollingLabelsView_transitioningContentSize;
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = 1;
  v5 = a3;

  result = (MURollingLabelsView *)sub_191EEB2C0();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double *v2;
  MURollingLabelsView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR___MURollingLabelsView_transitioningContentSize);
  if ((*((_BYTE *)&self->super.super.__layeringSceneIdentity + OBJC_IVAR___MURollingLabelsView_transitioningContentSize) & 1) != 0)
  {
    v3 = self;
    sub_191DDCADC(&OBJC_IVAR___MURollingLabelsView____lazy_storage___currentLabelAndConstraints);
    v4 = sub_191DDC3B8();
    swift_release();
    objc_msgSend(v4, sel_intrinsicContentSize);
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v6 = *v2;
    v8 = v2[1];
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (UIView)viewForLastBaselineLayout
{
  MURollingLabelsView *v2;
  id BaselineLayoutSo6UIViewCvg_0;

  v2 = self;
  BaselineLayoutSo6UIViewCvg_0 = _s6MapsUI17RollingLabelsViewC21forLastBaselineLayoutSo6UIViewCvg_0();

  return (UIView *)BaselineLayoutSo6UIViewCvg_0;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MURollingLabelsView____lazy_storage___labelForBaselineAlignment));
}

@end
