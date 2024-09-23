@implementation SearchTagsRibbonView

- (_TtC20ProductPageExtension20SearchTagsRibbonView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20SearchTagsRibbonView *)sub_100424120(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20SearchTagsRibbonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004268DC();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension20SearchTagsRibbonView *v2;

  v2 = self;
  sub_1004243F0();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC20ProductPageExtension20SearchTagsRibbonView *v7;
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

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100424634(width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_unknownObjectRelease();

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

- (BOOL)hasContent
{
  uint64_t v3;
  _TtC20ProductPageExtension20SearchTagsRibbonView *v4;
  char v5;

  swift_getObjectType();
  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension20SearchTagsRibbonView_metadataRibbonItemModels);
  swift_bridgeObjectRetain(v3);
  v4 = self;
  v5 = sub_1000C50E8(v3, 0);

  swift_bridgeObjectRelease(v3);
  return v5 & 1;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension20SearchTagsRibbonView_metadataRibbonItemViews));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension20SearchTagsRibbonView_metrics;
  v4 = type metadata accessor for SearchTagsRibbonViewLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension20SearchTagsRibbonView_metadataRibbonItemModels));
  swift_release();
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension20SearchTagsRibbonView_impressionsUpdateBlock), *(_QWORD *)&self->metadataRibbonItemViews[OBJC_IVAR____TtC20ProductPageExtension20SearchTagsRibbonView_impressionsUpdateBlock]);
}

@end
