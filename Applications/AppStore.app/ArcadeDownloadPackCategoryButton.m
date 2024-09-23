@implementation ArcadeDownloadPackCategoryButton

- (_TtC8AppStore32ArcadeDownloadPackCategoryButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004E9AF0();
}

- (BOOL)isSelected
{
  return sub_100126ECC(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
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
  sub_1004E8D88();

}

- (BOOL)isEnabled
{
  return sub_100126ECC(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _TtC8AppStore32ArcadeDownloadPackCategoryButton *v4;

  v4 = self;
  sub_1004E820C(a3, (uint64_t)v4);

}

- (CGSize)intrinsicContentSize
{
  _TtC8AppStore32ArcadeDownloadPackCategoryButton *v2;
  double v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  CGSize result;

  v2 = self;
  -[ArcadeDownloadPackCategoryButton bounds](v2, "bounds");
  v4 = v3;
  v5 = JUMeasuringSizeExpanded[1];
  v6 = -[ArcadeDownloadPackCategoryButton traitCollection](v2, "traitCollection");
  sub_1004E8EBC(v14);
  v7 = v15;
  v8 = v16;
  sub_100060B40(v14, v15);
  v9 = dispatch thunk of Placeable.measure(toFit:with:)(v6, v7, v8, v4, v5);
  v11 = v10;
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v14);

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore32ArcadeDownloadPackCategoryButton *v2;

  v2 = self;
  sub_1004E9380();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore32ArcadeDownloadPackCategoryButton *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1004E8EBC(v14);
  v6 = v15;
  v7 = v16;
  sub_100060B40(v14, v15);
  v8 = -[ArcadeDownloadPackCategoryButton traitCollection](v5, "traitCollection");
  v9 = dispatch thunk of Placeable.measure(toFit:with:)(v8, v6, v7, width, height);
  v11 = v10;

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v14);
  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)didTap
{
  objc_class *ObjectType;
  _TtC8AppStore32ArcadeDownloadPackCategoryButton *v4;
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
  sub_1004E8D88();
  (*(void (**)(_QWORD))((char *)&v4->super.super.super.super.isa
                                 + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_action))(*(Class *)((char *)&v4->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_category));

}

- (void)didPress:(id)a3
{
  id v4;
  _TtC8AppStore32ArcadeDownloadPackCategoryButton *v5;

  v4 = a3;
  v5 = self;
  sub_1004E9658(v4);

}

- (void)didRelease:(id)a3
{
  id v4;
  _TtC8AppStore32ArcadeDownloadPackCategoryButton *v5;

  v4 = a3;
  v5 = self;
  sub_1004E9D2C(v4);

}

- (void)invalidateMeasurements
{
  _TtC8AppStore32ArcadeDownloadPackCategoryButton *v2;

  v2 = self;
  -[ArcadeDownloadPackCategoryButton setNeedsLayout](v2, "setNeedsLayout");
  -[ArcadeDownloadPackCategoryButton invalidateIntrinsicContentSize](v2, "invalidateIntrinsicContentSize");

}

- (_TtC8AppStore32ArcadeDownloadPackCategoryButton)initWithFrame:(CGRect)a3
{
  _TtC8AppStore32ArcadeDownloadPackCategoryButton *result;

  result = (_TtC8AppStore32ArcadeDownloadPackCategoryButton *)_swift_stdlib_reportUnimplementedInitializer("AppStore.ArcadeDownloadPackCategoryButton", 41, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_category));
  swift_release(*(_QWORD *)&self->category[OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_action]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_selectedBackgroundView));
}

@end
