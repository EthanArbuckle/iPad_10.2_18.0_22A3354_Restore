@implementation ArcadeDownloadPackCategoryButton

- (_TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001C2368();
}

- (BOOL)isSelected
{
  return sub_100135898(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[ArcadeDownloadPackCategoryButton setSelected:](&v5, "setSelected:", v3);
  sub_1001C1508();

}

- (BOOL)isEnabled
{
  return sub_100135898(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton *v4;

  v4 = self;
  sub_1001C163C(a3, (uint64_t)v4);

}

- (CGSize)intrinsicContentSize
{
  _TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton *v2;
  double v3;
  double v4;
  double v5;
  id v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  CGSize result;

  v2 = self;
  -[ArcadeDownloadPackCategoryButton bounds](v2, "bounds");
  v4 = v3;
  v5 = JUMeasuringSizeExpanded[1];
  v6 = -[ArcadeDownloadPackCategoryButton traitCollection](v2, "traitCollection");
  sub_1001C1710(v15, v7);
  v8 = v16;
  v9 = v17;
  sub_100011064(v15, v16);
  v10 = dispatch thunk of Placeable.measure(toFit:with:)(v6, v8, v9, v4, v5);
  v12 = v11;
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v15);

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton *v2;

  v2 = self;
  sub_1001C1BF8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton *v5;
  __n128 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1001C1710(v15, v6);
  v7 = v16;
  v8 = v17;
  sub_100011064(v15, v16);
  v9 = -[ArcadeDownloadPackCategoryButton traitCollection](v5, "traitCollection");
  v10 = dispatch thunk of Placeable.measure(toFit:with:)(v9, v7, v8, width, height);
  v12 = v11;

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v15);
  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)didTap
{
  objc_class *ObjectType;
  _TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton *v4;
  unsigned int v5;
  objc_super v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v7.receiver = self;
  v7.super_class = ObjectType;
  v4 = self;
  v5 = -[ArcadeDownloadPackCategoryButton isSelected](&v7, "isSelected");
  v6.receiver = v4;
  v6.super_class = ObjectType;
  -[ArcadeDownloadPackCategoryButton setSelected:](&v6, "setSelected:", v5 ^ 1);
  sub_1001C1508();
  (*(void (**)(_QWORD))((char *)&v4->super.super.super.super.isa
                                 + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton_action))(*(Class *)((char *)&v4->super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton_category));

}

- (void)didPress:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton *v5;

  v4 = a3;
  v5 = self;
  sub_1001C1ED0(v4);

}

- (void)didRelease:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton *v5;

  v4 = a3;
  v5 = self;
  sub_1001C25A4(v4);

}

- (void)invalidateMeasurements
{
  _TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton *v2;

  v2 = self;
  -[ArcadeDownloadPackCategoryButton setNeedsLayout](v2, "setNeedsLayout");
  -[ArcadeDownloadPackCategoryButton invalidateIntrinsicContentSize](v2, "invalidateIntrinsicContentSize");

}

- (_TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton *result;

  result = (_TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.ArcadeDownloadPackCategoryButton", 55, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton_category));
  swift_release(*(_QWORD *)&self->category[OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton_action]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeDownloadPackCategoryButton_selectedBackgroundView));
}

@end
