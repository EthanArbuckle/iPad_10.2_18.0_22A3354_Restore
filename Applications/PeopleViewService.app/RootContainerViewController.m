@implementation RootContainerViewController

- (void)showMetrics
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC17PeopleViewService27RootContainerViewController *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = type metadata accessor for MetricTemplateView(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  MetricTemplateView.init(dragRefresh:)(0);
  v7 = objc_allocWithZone((Class)sub_100006298(&qword_100022800));
  v8 = (void *)UIHostingController.init(rootView:)(v5);
  sub_10000F7E4(v8);

}

- (void)loadView
{
  _TtC17PeopleViewService27RootContainerViewController *v2;

  v2 = self;
  sub_10000F6B4();

}

- (_TtC17PeopleViewService27RootContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC17PeopleViewService27RootContainerViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView) = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView) = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for RootContainerViewController();
  v11 = -[RootContainerViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC17PeopleViewService27RootContainerViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootContainerViewController();
  return -[RootContainerViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView));
}

@end
