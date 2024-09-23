@implementation SubscriptionLockupView

- (UIEdgeInsets)layoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  UIEdgeInsets result;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self, a2);
  -[SubscriptionLockupView layoutMargins](&v6, "layoutMargins");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  objc_class *ObjectType;
  _TtC8AppStore22SubscriptionLockupView *v9;
  void *v10;
  void *v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v9 = self;
  -[SubscriptionLockupView setLayoutMargins:](&v14, "setLayoutMargins:", top, left, bottom, right);
  v10 = *(Class *)((char *)&v9->super.super.super.isa + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_iapLockupView);
  v13.receiver = v9;
  v13.super_class = ObjectType;
  -[SubscriptionLockupView layoutMargins](&v13, "layoutMargins");
  objc_msgSend(v10, "setLayoutMargins:");
  v11 = *(Class *)((char *)&v9->super.super.super.isa + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_appLockupView);
  v12.receiver = v9;
  v12.super_class = ObjectType;
  -[SubscriptionLockupView layoutMargins](&v12, "layoutMargins");
  objc_msgSend(v11, "setLayoutMargins:");

}

- (_TtC8AppStore22SubscriptionLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore22SubscriptionLockupView *)sub_100438BA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore22SubscriptionLockupView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8AppStore22SubscriptionLockupView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_lockupTapBlock);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_subscriptionLockupPresenter) = 0;
  v5 = a3;

  result = (_TtC8AppStore22SubscriptionLockupView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/SubscriptionLockupView.swift", 37, 2, 150, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _TtC8AppStore22SubscriptionLockupView *v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  ObjectType = (objc_class *)swift_getObjectType();
  v7 = type metadata accessor for SmallLockupLayout.Metrics(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = qword_1008287F8;
  v12 = self;
  if (v11 != -1)
    swift_once(&qword_1008287F8, sub_100438388);
  v13 = sub_10007AF70(v7, (uint64_t)qword_10088F160);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v13, v7);
  v20.receiver = v12;
  v20.super_class = ObjectType;
  -[SubscriptionLockupView layoutMargins](&v20, "layoutMargins");
  v14 = -[SubscriptionLockupView traitCollection](v12, "traitCollection");
  v15 = sub_1005CF514((uint64_t)v10, (uint64_t)v14, width, height);
  v17 = v16;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_iapLockupView), "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v5.receiver;
  -[SubscriptionLockupView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_iapLockupView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setFrame:");
  v4 = *(void **)&v2[OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_appLockupView];
  objc_msgSend(v2, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void).cxx_destruct
{
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_lockupTapBlock), *(_QWORD *)&self->lockupTapBlock[OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_lockupTapBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_appLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_iapLockupView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore22SubscriptionLockupView_subscriptionLockupPresenter));
}

@end
