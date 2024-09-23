@implementation RequestMessageViewController

- (void)dealloc
{
  _TtC22PeopleMessagesAskToBuy28RequestMessageViewController *v2;

  v2 = self;
  sub_100006F0C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->uniqueID[OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_uniqueID]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubble));
  sub_100006C90((uint64_t)self + OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_eventNotifier, &qword_100031778);
  sub_10000E610((uint64_t)self + OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_bubbleDelegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_messageDetailsLoader));
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
  _TtC22PeopleMessagesAskToBuy28RequestMessageViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_10000DC20((uint64_t)a3);

}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  CGFloat height;
  double width;
  _TtC22PeopleMessagesAskToBuy28RequestMessageViewController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1000075EC(width, height);
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
  _TtC22PeopleMessagesAskToBuy28RequestMessageViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100007F1C(v4);

}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC22PeopleMessagesAskToBuy28RequestMessageViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100009EC0(a3);

}

- (void)willResignActiveWithConversation:(id)a3
{
  id v4;
  _TtC22PeopleMessagesAskToBuy28RequestMessageViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10000A258((uint64_t)v4);

}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  _TtC22PeopleMessagesAskToBuy28RequestMessageViewController *v4;

  v4 = self;
  sub_10000A36C(a3);

}

- (_TtC22PeopleMessagesAskToBuy28RequestMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC22PeopleMessagesAskToBuy28RequestMessageViewController *)sub_10000AE88(v5, v7, a4);
}

- (_TtC22PeopleMessagesAskToBuy28RequestMessageViewController)initWithCoder:(id)a3
{
  return (_TtC22PeopleMessagesAskToBuy28RequestMessageViewController *)sub_10000B144(a3);
}

- (_TtC22PeopleMessagesAskToBuy28RequestMessageViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  return (_TtC22PeopleMessagesAskToBuy28RequestMessageViewController *)sub_10000B38C(a3);
}

- (void)requestResize
{
  char *v2;
  objc_super v3;

  v2 = (char *)self + OBJC_IVAR____TtC22PeopleMessagesAskToBuy28RequestMessageViewController_cachedSizeInfo;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RequestMessageViewController();
  -[RequestMessageViewController requestResize](&v3, "requestResize");
}

@end
