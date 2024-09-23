@implementation InfiniteScrollFooterView

- (_TtC22SubscribePageExtension24InfiniteScrollFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension24InfiniteScrollFooterView *)sub_100301434(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension24InfiniteScrollFooterView)initWithCoder:(id)a3
{
  _TtC22SubscribePageExtension24InfiniteScrollFooterView *result;

  result = (_TtC22SubscribePageExtension24InfiniteScrollFooterView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/InfiniteScrollFooterView.swift", 53, 2, 32, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  _TtC22SubscribePageExtension24InfiniteScrollFooterView *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = -[InfiniteScrollFooterView traitCollection](v4, "traitCollection");
  if (qword_1007F2A10 != -1)
    swift_once(&qword_1007F2A10, sub_10042D114);
  v6 = type metadata accessor for StaticDimension(0);
  sub_1000117A8(v6, (uint64_t)qword_100856180);
  type metadata accessor for TraitEnvironmentPlaceholder(0);
  v7 = sub_10000DF3C(&qword_1007F5840);
  v8 = swift_allocObject(v7, 40, 7);
  *(_OWORD *)(v8 + 16) = xmmword_10066FE60;
  *(_QWORD *)(v8 + 32) = v5;
  v9 = v5;
  v10 = (void *)TraitEnvironmentPlaceholder.__allocating_init(_:)(v8);
  v11 = dispatch thunk of AnyDimension.rawValue(in:)(v10, v6, &protocol witness table for StaticDimension);

  v12 = width;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC22SubscribePageExtension24InfiniteScrollFooterView *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v2 = self;
  v3 = -[InfiniteScrollFooterView traitCollection](v2, "traitCollection");
  if (qword_1007F2A10 != -1)
    swift_once(&qword_1007F2A10, sub_10042D114);
  v4 = type metadata accessor for StaticDimension(0);
  sub_1000117A8(v4, (uint64_t)qword_100856180);
  type metadata accessor for TraitEnvironmentPlaceholder(0);
  v5 = sub_10000DF3C(&qword_1007F5840);
  v6 = swift_allocObject(v5, 40, 7);
  *(_OWORD *)(v6 + 16) = xmmword_10066FE60;
  *(_QWORD *)(v6 + 32) = v3;
  v7 = v3;
  v8 = (void *)TraitEnvironmentPlaceholder.__allocating_init(_:)(v6);
  v9 = dispatch thunk of AnyDimension.rawValue(in:)(v8, v4, &protocol witness table for StaticDimension);

  v10 = UIViewNoIntrinsicMetric;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v17.receiver;
  -[InfiniteScrollFooterView layoutSubviews](&v17, "layoutSubviews");
  objc_msgSend(v2, "bounds", v17.receiver, v17.super_class);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension24InfiniteScrollFooterView_activityIndicator];
  objc_msgSend(v11, "sizeThatFits:", v7, v9);
  v13 = v12;
  v15 = v14;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v16 = CGRectGetMidX(v18) - v13 * 0.5;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  objc_msgSend(v11, "setFrame:", v16, CGRectGetMidY(v19) - v15 * 0.5, v13, v15);

}

- (void)prepareForReuse
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v3.receiver;
  -[InfiniteScrollFooterView prepareForReuse](&v3, "prepareForReuse");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension24InfiniteScrollFooterView_activityIndicator], "stopAnimating", v3.receiver, v3.super_class);

}

- (void)willMoveToWindow:(id)a3
{
  sub_1003019C0(self, (uint64_t)a2, a3, (const char **)&selRef_willMoveToWindow_);
}

- (void)willMoveToSuperview:(id)a3
{
  sub_1003019C0(self, (uint64_t)a2, a3, (const char **)&selRef_willMoveToSuperview_);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24InfiniteScrollFooterView_activityIndicator));
}

@end
