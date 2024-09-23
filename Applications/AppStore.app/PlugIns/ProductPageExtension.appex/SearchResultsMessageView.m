@implementation SearchResultsMessageView

- (_TtC20ProductPageExtension24SearchResultsMessageView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension24SearchResultsMessageView *)sub_1004ADB8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension24SearchResultsMessageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004AECCC();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension24SearchResultsMessageView *v2;

  v2 = self;
  sub_1004ADF40();

}

- (void)layoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[SearchResultsMessageView layoutMarginsDidChange](&v3, "layoutMarginsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC20ProductPageExtension24SearchResultsMessageView *v8;
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
  v9 = sub_1004AEA60((uint64_t)a4, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_unknownObjectRelease();

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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24SearchResultsMessageView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24SearchResultsMessageView_secondaryLabel));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24SearchResultsMessageView_actionRunnerProviderProxy, (uint64_t *)&unk_100812070);
}

@end
