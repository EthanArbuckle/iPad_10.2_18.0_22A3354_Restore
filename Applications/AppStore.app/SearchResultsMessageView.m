@implementation SearchResultsMessageView

- (_TtC8AppStore24SearchResultsMessageView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24SearchResultsMessageView *)sub_1003C1F2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore24SearchResultsMessageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003C306C();
}

- (void)layoutSubviews
{
  _TtC8AppStore24SearchResultsMessageView *v2;

  v2 = self;
  sub_1003C22E0();

}

- (void)layoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[SearchResultsMessageView layoutMarginsDidChange](&v3, "layoutMarginsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC8AppStore24SearchResultsMessageView *v8;
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
  v9 = sub_1003C2E00((uint64_t)a4, width, height);
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24SearchResultsMessageView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24SearchResultsMessageView_secondaryLabel));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore24SearchResultsMessageView_actionRunnerProviderProxy, &qword_10083F4B0);
}

@end
