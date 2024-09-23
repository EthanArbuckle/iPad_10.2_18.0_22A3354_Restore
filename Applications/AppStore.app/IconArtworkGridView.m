@implementation IconArtworkGridView

- (_TtC8AppStore19IconArtworkGridView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore19IconArtworkGridView *)sub_1000E87C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore19IconArtworkGridView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000EAF30();
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
  _TtC8AppStore19IconArtworkGridView *v9;
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
    sub_1000E8EDC();
    v19.receiver = v9;
    v19.super_class = ObjectType;
    -[IconArtworkGridView frame](&v19, "frame");
    sub_1000E9048(v17, v18);
  }

}

- (void)layoutSubviews
{
  _TtC8AppStore19IconArtworkGridView *v2;

  v2 = self;
  sub_1000E9404();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width;
  _TtC8AppStore19IconArtworkGridView *v7;
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
  double v18;
  JUMeasurements result;

  width = a3.width;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_1000EB044(width);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_unknownObjectRelease(a4);

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore19IconArtworkGridView_iconViews));
  sub_1000EB164((uint64_t)self + OBJC_IVAR____TtC8AppStore19IconArtworkGridView_layoutMetrics);
  sub_1000EB1CC((uint64_t)self + OBJC_IVAR____TtC8AppStore19IconArtworkGridView_config);
}

@end
