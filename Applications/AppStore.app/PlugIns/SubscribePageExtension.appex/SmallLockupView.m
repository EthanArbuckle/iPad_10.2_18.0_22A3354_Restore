@implementation SmallLockupView

- (_TtC22SubscribePageExtension15SmallLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)sub_100193A68();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC22SubscribePageExtension15SmallLockupView *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = type metadata accessor for SmallLockupLayout.Metrics(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = self;
  v11 = -[SmallLockupView traitCollection](v10, "traitCollection");
  sub_10019201C((uint64_t)v9);
  -[SmallLockupView layoutMargins](v10, "layoutMargins");
  v12 = -[SmallLockupView traitCollection](v10, "traitCollection");
  v13 = sub_1001934E0((uint64_t)v9, (uint64_t)v12, width, height);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC22SubscribePageExtension15SmallLockupView *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  CGSize result;

  v3 = type metadata accessor for SmallLockupLayout.Metrics(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_10019201C((uint64_t)v6);
  -[SmallLockupView layoutMargins](v7, "layoutMargins");
  v8 = -[SmallLockupView traitCollection](v7, "traitCollection");
  sub_1001934E0((uint64_t)v6, (uint64_t)v8, 0.0, 0.0);
  v10 = v9;

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v11 = UIViewNoIntrinsicMetric;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC22SubscribePageExtension15SmallLockupView *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  id v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v3 = (objc_class *)type metadata accessor for SmallLockupView(0);
  v12.receiver = self;
  v12.super_class = v3;
  v4 = self;
  -[SmallLockupView layoutSubviews](&v12, "layoutSubviews");
  sub_100192460(v9);
  v5 = v10;
  v6 = v11;
  sub_100011064(v9, v10);
  v7 = LayoutMarginsAware<>.layoutFrame.getter(v3);
  v8 = -[SmallLockupView traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v8, v5, v6, v7);

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v9);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC22SubscribePageExtension15SmallLockupView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100192DD8(v6, v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC22SubscribePageExtension15SmallLockupView *v10;
  id v11;
  char v12;
  BOOL v13;
  id v14;
  id v15;
  _TtC22SubscribePageExtension15SmallLockupView *v16;
  uint64_t v17;

  v7 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_lockupTapGestureRecognizer);
  if (!v7)
  {
    v14 = a3;
    v15 = a4;
    v16 = self;
    goto LABEL_5;
  }
  sub_100019574(0, (unint64_t *)&qword_1007F6C50, UIGestureRecognizer_ptr);
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = v7;
  v12 = static NSObject.== infix(_:_:)(v8, v11);

  if ((v12 & 1) == 0)
  {
LABEL_5:
    v17 = objc_opt_self(UIPanGestureRecognizer);
    v13 = swift_dynamicCastObjCClass(a4, v17) == 0;
    goto LABEL_6;
  }
  v13 = 0;
LABEL_6:

  return v13;
}

- (void)lockupTapGestureRecognized
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC22SubscribePageExtension15SmallLockupView *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_lockupTapBlock);
  if (v2)
  {
    v3 = *(_QWORD *)&self->super.artworkView[OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_lockupTapBlock];
    v5 = self;
    v4 = sub_100019320((uint64_t)v2, v3);
    v2(v4);
    sub_100019310((uint64_t)v2, v3);

  }
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_metrics;
  v4 = type metadata accessor for SmallLockupLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_searchAdTertiaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_inAppPurchaseIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_lockupTapGestureRecognizer));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_lockupTapBlock), *(_QWORD *)&self->super.artworkView[OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_lockupTapBlock]);
}

- (_TtC22SubscribePageExtension25SearchAdTransparencyLabel)accessibilityAdLabel
{
  return (_TtC22SubscribePageExtension25SearchAdTransparencyLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension15SmallLockupView_searchAdTertiaryLabel);
}

@end
