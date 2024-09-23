@implementation SearchTagsRibbonView

- (_TtC22SubscribePageExtension20SearchTagsRibbonView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20SearchTagsRibbonView *)sub_10007BAF4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20SearchTagsRibbonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10007E184();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension20SearchTagsRibbonView *v2;

  v2 = self;
  sub_10007BDC4();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC22SubscribePageExtension20SearchTagsRibbonView *v8;
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
  double v19;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  v9 = sub_10007C008(width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_unknownObjectRelease(a4);

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (BOOL)hasContent
{
  uint64_t v3;
  _TtC22SubscribePageExtension20SearchTagsRibbonView *v4;
  char v5;

  swift_getObjectType();
  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension20SearchTagsRibbonView_metadataRibbonItemModels);
  swift_bridgeObjectRetain(v3);
  v4 = self;
  v5 = sub_1000D88A0(v3, 0);

  swift_bridgeObjectRelease(v3);
  return v5 & 1;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension20SearchTagsRibbonView_metadataRibbonItemViews));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension20SearchTagsRibbonView_metrics;
  v4 = type metadata accessor for SearchTagsRibbonViewLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension20SearchTagsRibbonView_metadataRibbonItemModels));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension20SearchTagsRibbonView_impressionsCalculator));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension20SearchTagsRibbonView_impressionsUpdateBlock), *(_QWORD *)&self->metadataRibbonItemViews[OBJC_IVAR____TtC22SubscribePageExtension20SearchTagsRibbonView_impressionsUpdateBlock]);
}

@end
