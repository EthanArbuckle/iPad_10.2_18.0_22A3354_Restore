@implementation IconArtworkGridView

- (_TtC20ProductPageExtension19IconArtworkGridView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension19IconArtworkGridView *)sub_10018828C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension19IconArtworkGridView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100189724();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self, a2);
  -[IconArtworkGridView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC20ProductPageExtension19IconArtworkGridView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v17;
  CGFloat v18;
  objc_super v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v22.receiver = self;
  v22.super_class = ObjectType;
  v9 = self;
  -[IconArtworkGridView frame](&v22, "frame");
  v11 = v10;
  v13 = v12;
  v21.receiver = v9;
  v21.super_class = ObjectType;
  -[IconArtworkGridView setFrame:](&v21, "setFrame:", x, y, width, height);
  v20.receiver = v9;
  v20.super_class = ObjectType;
  -[IconArtworkGridView frame](&v20, "frame");
  if (v11 != v15 || v13 != v14)
  {
    sub_1001889A4();
    v19.receiver = v9;
    v19.super_class = ObjectType;
    -[IconArtworkGridView frame](&v19, "frame");
    sub_100188B10(v17, v18);
  }

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension19IconArtworkGridView *v2;

  v2 = self;
  sub_100188ECC();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width;
  _TtC20ProductPageExtension19IconArtworkGridView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  JUMeasurements result;

  width = a3.width;
  swift_unknownObjectRetain(a4);
  v6 = self;
  v7 = sub_100189838(width);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease();

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension19IconArtworkGridView_iconViews));
  sub_10018991C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension19IconArtworkGridView_layoutMetrics);
  sub_1000189D8((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension19IconArtworkGridView_config);
}

@end
