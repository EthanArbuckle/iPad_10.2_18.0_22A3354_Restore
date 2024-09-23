@implementation AppEventSearchResultContentView

- (_TtC20ProductPageExtension31AppEventSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31AppEventSearchResultContentView *)sub_10001AF50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31AppEventSearchResultContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10001F4E4();
}

- (void)dealloc
{
  void *v2;
  _TtC20ProductPageExtension31AppEventSearchResultContentView *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventTapGestureRecognizer);
  v3 = self;
  objc_msgSend(v2, "removeTarget:action:", v3, 0);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AppEventSearchResultContentView();
  -[AppEventSearchResultContentView dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventTapGestureRecognizer));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventViewTappedAction), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventViewTappedAction]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_impressionsCalculator));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_impressionsUpdateBlock), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_impressionsUpdateBlock]);
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31AppEventSearchResultContentView *v2;

  v2 = self;
  sub_10001B2D8();

}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC20ProductPageExtension31AppEventSearchResultContentView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventViewTappedAction);
  if (v3)
  {
    v5 = *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventViewTappedAction];
    v6 = a3;
    v8 = self;
    v7 = sub_100018918((uint64_t)v3, v5);
    v3(v7);
    sub_100018908((uint64_t)v3, v5);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC20ProductPageExtension31AppEventSearchResultContentView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10001F5FC(v7);

  return v9 & 1;
}

- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_lockupView);
}

- (_TtC20ProductPageExtension12AppEventView)accessibilityAppEventView
{
  return (_TtC20ProductPageExtension12AppEventView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                             + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventView));
}

@end
