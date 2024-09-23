@implementation LockupPlaceholderView

- (_TtC22SubscribePageExtension21LockupPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension21LockupPlaceholderView *)sub_10016AD10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension21LockupPlaceholderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10016C06C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC22SubscribePageExtension21LockupPlaceholderView *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_10016AFB0(v22);
  v9 = v23;
  v10 = v24;
  sub_100011064(v22, v23);
  v11 = dispatch thunk of Measurable.measurements(fitting:in:)(a4, v9, v10, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v22);
  swift_unknownObjectRelease(a4);

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.var3 = v21;
  result.var2 = v20;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension21LockupPlaceholderView *v2;

  v2 = self;
  sub_10016BC74();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21LockupPlaceholderView_iconPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21LockupPlaceholderView_headingPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21LockupPlaceholderView_titlePlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21LockupPlaceholderView_subtitlePlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21LockupPlaceholderView_offerButtonPlaceholder));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension21LockupPlaceholderView_contentType;
  v4 = type metadata accessor for Shelf.ContentType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
