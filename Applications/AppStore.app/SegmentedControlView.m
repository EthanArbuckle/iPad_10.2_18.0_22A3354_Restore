@implementation SegmentedControlView

- (_TtC8AppStore20SegmentedControlView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20SegmentedControlView *)sub_1001B410C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20SegmentedControlView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8AppStore20SegmentedControlView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentDidChangeHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8AppStore20SegmentedControlView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/SegmentedControlView.swift", 35, 2, 53, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  _TtC8AppStore20SegmentedControlView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v4 = self;
  CGSize.subtracting(insets:)(-[SegmentedControlView layoutMargins](v4, "layoutMargins"));
  v5 = objc_msgSend(*(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentedControl), "sizeThatFits:");
  CGSize.adding(outsets:)(v5, 8.0, 0.0, 8.0, 0.0, v6, v7);
  v9 = v8;

  v10 = width;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC8AppStore20SegmentedControlView *v4;
  double Width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MinX;
  objc_super v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v3 = (objc_class *)type metadata accessor for SegmentedControlView();
  v12.receiver = self;
  v12.super_class = v3;
  v4 = self;
  -[SegmentedControlView layoutSubviews](&v12, "layoutSubviews");
  *(_QWORD *)&v13.origin.x = LayoutMarginsAware<>.layoutFrame.getter(v3).n128_u64[0];
  Width = CGRectGetWidth(v13);
  v6 = *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentedControl);
  LayoutMarginsAware<>.layoutFrame.getter(v3);
  objc_msgSend(v6, "sizeThatFits:", v7, v8, v12.receiver, v12.super_class);
  v10 = v9;
  *(_QWORD *)&v14.origin.x = LayoutMarginsAware<>.layoutFrame.getter(v3).n128_u64[0];
  MinX = CGRectGetMinX(v14);
  *(_QWORD *)&v15.origin.x = LayoutMarginsAware<>.layoutFrame.getter(v3).n128_u64[0];
  objc_msgSend(v6, "setFrame:", MinX, (CGRectGetHeight(v15) - v10) * 0.5, Width, v10);

}

- (void)selectedIndexChangedIn:(id)a3
{
  void (*v3)(id);
  uint64_t v5;
  id v6;
  _TtC8AppStore20SegmentedControlView *v7;

  v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentDidChangeHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->segmentedControl[OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentDidChangeHandler];
    v6 = a3;
    v7 = self;
    sub_10003A340((uint64_t)v3, v5);
    v3(v6);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentedControl));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentDidChangeHandler), *(_QWORD *)&self->segmentedControl[OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentDidChangeHandler]);
}

@end
