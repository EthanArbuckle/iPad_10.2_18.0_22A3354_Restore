@implementation CKPopRendererView

+ (double)duration
{
  return 0.8;
}

- (CKPopRendererViewDelegate)delegate
{
  swift_beginAccess();
  return (CKPopRendererViewDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKPopRendererView_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (CKPopRendererView)initWithFrame:(CGRect)a3 device:(id)a4
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectRetain();
  return (CKPopRendererView *)PopRendererView.init(frame:device:)(a4, x, y, width, height);
}

- (CKPopRendererView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s7ChatKit15PopRendererViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  CKPopRendererView *v2;

  v2 = self;
  sub_18E67C044();

}

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PopRendererView();
  v2 = v3.receiver;
  -[CKPopRendererView didMoveToWindow](&v3, sel_didMoveToWindow);
  objc_msgSend(v2, sel_setNeedsLayout, v3.receiver, v3.super_class);

}

- (void)didEnterBackgroundFrom:(id)a3
{
  sub_18E67C280((uint64_t)self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (void)willEnterForegroundFrom:(id)a3
{
  sub_18E67C280((uint64_t)self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (CGRect)frameForSourceFrame:(CGRect)a3
{
  return CGRectInset(a3, -100.0, -100.0);
}

- (BOOL)playWithSourceView:(id)a3
{
  id v4;
  CKPopRendererView *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_18E67C764(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)drawFrom:(id)a3
{
  id v4;
  CKPopRendererView *v5;

  v4 = a3;
  v5 = self;
  sub_18E67C960(v4);

}

- (CKPopRendererView)initWithFrame:(CGRect)a3
{
  CKPopRendererView *result;

  result = (CKPopRendererView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end
