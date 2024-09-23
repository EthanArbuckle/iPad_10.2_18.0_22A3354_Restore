@implementation RequestMessageViewController

- (void)dealloc
{
  _TtC24PeopleMessagesScreenTime28RequestMessageViewController *v2;

  v2 = self;
  sub_10001A918();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->uniqueID[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubble));
  sub_100009A88((uint64_t)self + OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_eventNotifier, &qword_100035FF8);
  sub_100012E60((uint64_t)self + OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubbleDelegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_messageDetailsLoader));
}

- (MSConversation)activeConversation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RequestMessageViewController();
  return -[RequestMessageViewController activeConversation](&v3, "activeConversation");
}

- (void)setActiveConversation:(id)a3
{
  _TtC24PeopleMessagesScreenTime28RequestMessageViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100020118((uint64_t)a3);

}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  CGFloat height;
  double width;
  _TtC24PeopleMessagesScreenTime28RequestMessageViewController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10001AD1C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4;
  _TtC24PeopleMessagesScreenTime28RequestMessageViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10001B64C(v4);

}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC24PeopleMessagesScreenTime28RequestMessageViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10001C914(a3);

}

- (void)willResignActiveWithConversation:(id)a3
{
  id v4;
  _TtC24PeopleMessagesScreenTime28RequestMessageViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10001CCAC((uint64_t)v4);

}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  _TtC24PeopleMessagesScreenTime28RequestMessageViewController *v4;

  v4 = self;
  sub_10001CDC0(a3);

}

- (_TtC24PeopleMessagesScreenTime28RequestMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC24PeopleMessagesScreenTime28RequestMessageViewController *)sub_10001D4D0(v5, v7, a4);
}

- (_TtC24PeopleMessagesScreenTime28RequestMessageViewController)initWithCoder:(id)a3
{
  return (_TtC24PeopleMessagesScreenTime28RequestMessageViewController *)sub_10001D78C(a3);
}

- (_TtC24PeopleMessagesScreenTime28RequestMessageViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  return (_TtC24PeopleMessagesScreenTime28RequestMessageViewController *)sub_10001D9D4(a3);
}

- (void)requestResize
{
  char *v2;
  objc_super v3;

  v2 = (char *)self + OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_cachedSizeInfo;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RequestMessageViewController();
  -[RequestMessageViewController requestResize](&v3, "requestResize");
}

@end
