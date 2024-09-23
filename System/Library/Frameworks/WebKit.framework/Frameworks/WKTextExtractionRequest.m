@implementation WKTextExtractionRequest

- (CGRect)rectInWebView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_2354A18A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WKTextExtractionRequest_rectInWebView);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (WKTextExtractionRequest)initWithRectInWebView:(CGRect)a3 :(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  CGFloat *v12;
  uint64_t v13;
  WKTextExtractionRequest *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = _Block_copy(a4);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionRequest_completionHandler);
  *v11 = 0;
  v11[1] = 0;
  v12 = (CGFloat *)((char *)self + OBJC_IVAR___WKTextExtractionRequest_rectInWebView);
  *v12 = x;
  v12[1] = y;
  v12[2] = width;
  v12[3] = height;
  v13 = *v11;
  *v11 = (uint64_t)sub_23549A36C;
  v11[1] = v10;
  swift_retain();
  sub_23549A0F0(v13);
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for WKTextExtractionRequest();
  v14 = -[WKTextExtractionRequest init](&v16, sel_init);
  swift_release();
  return v14;
}

- (void)fulfill:(id)a3
{
  uint64_t *v3;
  void (*v4)(id);
  id v7;
  uint64_t v8;
  WKTextExtractionRequest *v9;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR___WKTextExtractionRequest_completionHandler);
  v4 = *(void (**)(id))((char *)&self->super.isa + OBJC_IVAR___WKTextExtractionRequest_completionHandler);
  if (v4)
  {
    v7 = a3;
    v9 = self;
    sub_23549A0E0((uint64_t)v4);
    v4(a3);
    v8 = *v3;
    *v3 = 0;
    v3[1] = 0;
    sub_23549A0F0(v8);
    sub_23549A0F0((uint64_t)v4);

  }
}

- (WKTextExtractionRequest)init
{
  WKTextExtractionRequest *result;

  result = (WKTextExtractionRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23549A0F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WKTextExtractionRequest_completionHandler));
}

@end
